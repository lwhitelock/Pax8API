function Get-Pax8InvoiceItems {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$id
  )
  Process {
    $Items = Invoke-Pax8Request -method get -resource "invoices/$id/items"
    if ($Items) {
      [PSCustomObject]@{
        id      = $id
        details = $Items
      }
    }  
  }
}