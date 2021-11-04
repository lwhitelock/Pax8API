function Get-Pax8SubscriptionHistory {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [Alias('subscriptionId')]
    [string]$id
  )
  Process {
    $History = Invoke-Pax8Request -method get -resource "subscriptions/$id/history"
    if ($History) {
      $History.content
    }  
  }
}