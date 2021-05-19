function Get-Pax8UsageSummaries {
  Param(
    [ValidateSet("resourceGroup", "currentCharges", "partnerTotal")]    
    [string]$sort,
    [string]$resourceGroup,
    [string]$companyId,
    [Alias('usageSummaryId')]
    [string]$id,
    [string]$subscriptionId
        
  )

  if ($id) {
    $Usage = Invoke-Pax8Request -method get -resource "usage-summaries/$id"
  }
  else {
    
    if ($subscriptionId) {

      $resourcefilter = ''
      if ($sort) {
        $resourcefilter = "$($resourcefilter)&sort=$($sort)"
      }
      if ($resourceGroup) {
        $resourcefilter = "$($resourcefilter)&resourceGroup=$($resourceGroup)"
      }
      if ($companyId) {
        $resourcefilter = "$($resourcefilter)&companyId=$($companyId)"
      }   

      $Usage = Invoke-Pax8Request -method get -resource "subscriptions/$subscriptionId/usage-summaries" -ResourceFilter $resourcefilter
    } else{
      Write-Host "Please provide subscriptionId" -ForegroundColor Red
      $Usage = $null
    }
  }

  return $Usage

}