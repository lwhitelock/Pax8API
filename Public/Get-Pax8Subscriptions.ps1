function Get-Pax8Subscriptions {
  [CmdletBinding()]
  Param(
    [ValidateSet("quantity", "startDate", "endDate", "createdDate", "billingStart", "price")]    
    [string]$sort,
    [ValidateSet("Active", "Cancelled", "PendingManual", "PendingAutomated", "PendingCancel", "WaitingForDetails", "Trial", "Converted", "PendingActivation", "Activated")]  
    [string]$status,
    [ValidateSet("Monthly", "Annual", "2-Year", "3-Year", "One-Time", "Trial", "Activation")]    
    [string]$billingTerm,
    [string]$companyId,
    [string]$productId,
    [string]$subscriptionId
  )

  if ($subscriptionId) {
    $Subscriptions = Invoke-Pax8Request -method get -resource "subscriptions/$subscriptionId"
  } else {

    $resourcefilter = ''

    if ($sort) {
      $resourcefilter = "$($resourcefilter)&sort=$($sort)"
    }

    if ($status) {
      $resourcefilter = "$($resourcefilter)&status=$($status)"
    }

    if ($billingTerm) {
      $resourcefilter = "$($resourcefilter)&billingTerm=$($billingTerm)"
    }

    if ($companyId) {
      $resourcefilter = "$($resourcefilter)&companyId=$($companyId)"
    }

    if ($productId) {
      $resourcefilter = "$($resourcefilter)&productId=$($productId)"
    }

    $Subscriptions = Invoke-Pax8Request -method get -resource "subscriptions" -ResourceFilter $resourcefilter
  
  }
  return $Subscriptions

}