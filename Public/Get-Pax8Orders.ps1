function Get-Pax8Orders {
  [CmdletBinding()]
  Param(
    [string]$companyId,
    [string]$orderId
  )

  if ($orderId) {
    $Orders = Invoke-Pax8Request -method get -resource "orders/$orderId"
  } else {

    $resourcefilter = ''
    if ($companyId) {
      $resourcefilter = "$($resourcefilter)&companyId=$($companyId)"
    }

    $Orders = Invoke-Pax8Request -method get -resource "orders" -ResourceFilter $resourcefilter
  
  }
  return $Orders

}