function Get-Pax8ProductDependencies {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$id
  )
  Process {
    $Dependencies = Invoke-Pax8Request -method get -resource "products/$id/dependencies"
    if ($Dependencies) {
      [PSCustomObject]@{
        id      = $id
        details = $Dependencies
      }
    }  
  }
}