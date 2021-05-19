function Get-Pax8ProductPricing {
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$id
  )
  Process {
    $Pricing = Invoke-Pax8Request -method get -resource "products/$id/pricing"
    if ($Pricing) {
      [PSCustomObject]@{
        id      = $id
        details = $Pricing.content
      }
    }  
  }
}