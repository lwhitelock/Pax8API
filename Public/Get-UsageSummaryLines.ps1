function Get-UsageSummaryLines {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [string]$id,
    [datetime]$usageDate,
    [string]$productId
  )
  Process {
    $resourcefilter = ''
    if ($usageDate) {
      $resourcefilter = "$($resourcefilter)&usageDate=$($usageDate.ToString("yyyy-MM-dd"))"
    }
    if ($productId) {
      $resourcefilter = "$($resourcefilter)&productId=$($productId)"
    }
    $Lines = Invoke-Pax8Request -method get -resource "usage-summaries/$id/usage-lines"
    if ($Lines) {
      [PSCustomObject]@{
        id      = $id
        details = $Lines
      }
    }  
  }
}