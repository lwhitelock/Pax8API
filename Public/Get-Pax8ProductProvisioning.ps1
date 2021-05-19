function Get-Pax8ProductProvisioning {
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$id
  )
  Process {
    $Product = Invoke-Pax8Request -method get -resource "products/$id/provision-details"
    if ($Product) {
      [PSCustomObject]@{
        id      = $id
        details = $Product.content
      }
    }  
  }
}