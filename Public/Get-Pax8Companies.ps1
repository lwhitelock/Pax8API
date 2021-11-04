function Get-Pax8Companies {
  [CmdletBinding()]
  Param(
    [ValidateSet("name", "city", "country", "stateOrProvince", "postalCode")]    
    [string]$sort,
    [string]$city,
    [string]$country,
    [string]$stateOrProvince,
    [string]$postalCode,
    [bool]$selfServiceAllowed,
    [bool]$billOnBehalfOfEnabled,
    [bool]$orderApprovalRequired,
    [ValidateSet("Active", "Inactive", "Deleted")]  
    [string]$status,
    [string]$id
  )

  if ($id) {
    $Companies = Invoke-Pax8Request -method get -resource "companies/$id"
  } else {

    $resourcefilter = ''
    if ($sort) {
      $resourcefilter = "$($resourcefilter)&sort=$($sort)"
    }
    if ($city) {
      $resourcefilter = "$($resourcefilter)&city=$($city)"
    }
    if ($country) {
      $resourcefilter = "$($resourcefilter)&country=$($country)"
    }
    if ($stateOrProvince) {
      $resourcefilter = "$($resourcefilter)&stateOrProvince=$($stateOrProvince)"
    }
    if ($postalCode) {
      $resourcefilter = "$($resourcefilter)&postalCode=$($postalCode)"
    }
    if ($selfServiceAllowed) {
      $resourcefilter = "$($resourcefilter)&selfServiceAllowed=$($selfServiceAllowed)"
    }
    if ($billOnBehalfOfEnabled) {
      $resourcefilter = "$($resourcefilter)&billOnBehalfOfEnabled=$($billOnBehalfOfEnabled)"
    }
    if ($orderApprovalRequired) {
      $resourcefilter = "$($resourcefilter)&orderApprovalRequired=$($orderApprovalRequired)"
    }
    if ($status) {
      $resourcefilter = "$($resourcefilter)&status=$($status)"
    }

    $Companies = Invoke-Pax8Request -method get -resource "companies" -ResourceFilter $resourcefilter
  }

  return $Companies

}