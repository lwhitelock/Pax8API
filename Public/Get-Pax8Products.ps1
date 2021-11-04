function Get-Pax8Products {
  [CmdletBinding()]
  Param(
    [ValidateSet("name", "vendor")]    
    [string]$sort,
    [string]$vendorName,
    [string]$id
  )

  if ($id) {
    $Products = Invoke-Pax8Request -method get -resource "products/$id"
  } else {

    $resourcefilter = ''
    if ($sort) {
      $resourcefilter = "$($resourcefilter)&sort=$($sort)"
    }
    if ($vendorName) {
      $resourcefilter = "$($resourcefilter)&vendorName=$($vendorName)"
    }
   
    $Products = Invoke-Pax8Request -method get -resource "products" -ResourceFilter $resourcefilter
  }

  return $Products

}