function Set-Pax8Subscription {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory = $true)]
    [string]$subscriptionId,
    [Parameter(Mandatory = $true)]
    $Subscription
  )

  $Result = Invoke-Pax8Request -method put -resource "subscriptions/$subscriptionId" -body $Subscription
  Return $Result

}