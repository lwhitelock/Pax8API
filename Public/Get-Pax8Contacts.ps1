function Get-Pax8Contacts {
  Param(
    [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
    [Alias('companyId')]
    [string]$id,
    [string]$contactId
  )
  Process {
    if ($contactId) {
      $Contacts = Invoke-Pax8Request -method get -resource "companies/$id/contacts/$contactId"
    }
    else {
      $Contacts = Invoke-Pax8Request -method get -resource "companies/$id/contacts"
    }
    if ($Contacts) {
      $Contacts
    } 
  } 
}
