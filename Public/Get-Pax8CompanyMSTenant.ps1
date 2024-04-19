function Get-Pax8CompanyMSTenant {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$companyid
  )
  Process {
    $Response = Invoke-Pax8Request -method get -resource "provisionDetail" -ResourceFilter "&companyId=$companyid" -v2API:$true
    if ($Response) {
      ($response | Where-Object -Property entryName -EQ msTenantID).entryValue
    }
  }  
}