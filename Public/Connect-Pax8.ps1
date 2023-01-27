function Connect-Pax8 {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ClientID,
        [Parameter(Mandatory = $true)]
        [string]$ClientSecret

    )

    $auth = @{
        client_id     = $ClientID
        client_secret = $ClientSecret
        audience      = 'api://p8p.client'
        grant_type    = 'client_credentials'
    }
    
    $json = $auth | ConvertTo-Json -Depth 2

    try {
        $Response = Invoke-WebRequest -Method POST -Uri 'https://login.pax8.com/oauth/token' -ContentType 'application/json' -Body $json -UseBasicParsing
        $script:Pax8Token = ($Response | ConvertFrom-Json).access_token
    }
    catch {
        Write-Host $_ -ForegroundColor Red
    }    

}