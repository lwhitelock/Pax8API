function Invoke-Pax8Request {
	Param(
		[string]$Method,
		[string]$Resource,
		[string]$ResourceFilter,
		[string]$Body
	)
	
	if (!$script:Pax8Token) {
		Write-Host "Please run 'Connect-Pax8' first" -ForegroundColor Red
	}
 else {
	
		$headers = @{
			Authorization = "Bearer $($script:Pax8Token)"
		}

		try {
			if (($Method -eq "put") -or ($Method -eq "post") -or ($Method -eq "delete")) {
				$Response = Invoke-WebRequest -method $method -uri ($Script:Pax8BaseURL + $Resource) -ContentType 'application/json' -body $Body -Headers $headers -ea stop
				$Result = $Response | ConvertFrom-Json -depth 100
			}
			else {
				$Complete = $false
				$PageNo = 0
				$Result = do {
					$Response = Invoke-WebRequest -method $method -uri ($Script:Pax8BaseURL + $Resource + "?page=$PageNo&size=200" + $ResourceFilter) -ContentType 'application/json' -Headers $headers -ea stop
					$JSON = $Response | ConvertFrom-Json -Depth 100
					if ($JSON.Page) {
						if (($JSON.Page.totalPages - 1) -eq $PageNo -or $JSON.Page.totalPages -eq 0) {
							$Complete = $true
						}
						$PageNo = $PageNo + 1
						$JSON.content
					}
					else {
						$Complete = $true
						$JSON
					}
				} while ($Complete -eq $false)
			}
		}
		catch {
			Write-Host "An Error Occured $_" -ForegroundColor Red
		}
		
		return $Result
	}
	
}