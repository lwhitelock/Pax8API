## Alpha
## Release Notes
0.1 Base Release Get Requests Implemented. 

## Notes
This is an unofficial powershell module to allow access to the Pax8 API. I am not associated with Pax8 other than as a customer.

## Installation
Install-Module Pax8API

## Implemented Commands
Connect-Pax8
Get-Pax8Companies
Get-Pax8Products
Get-Pax8ProductProvisioning
Get-Pax8ProductDependencies
Get-Pax8ProductPricing
Get-Pax8Orders
Get-Pax8Subscriptions
Get-Pax8SubscriptionHistory
Get-Pax8Contacts
Get-Pax8Invoices
Get-Pax8InvoiceItems
Get-Pax8UsageSummaries
Get-UsageSummaryLines


## Usage
Connect-Pax8 -ClientID -ClientSecret
Get-Pax8Companies -sort -city -country -stateOrProvince -postalCode -selfServiceAllowed -billOnBehalfOfEnabled -orderApprovalRequired -status -id
Get-Pax8Products -sort -vendorName -id
Get-Pax8ProductProvisioning -id
Get-Pax8ProductDependencies -id 
Get-Pax8ProductPricing -id
Get-Pax8Orders -companyId -orderId
Get-Pax8Subscriptions -sort -status -billingTerm -companyId -productId -subscriptionId
Get-Pax8SubscriptionHistory -id
Get-Pax8Contacts -id -contactId
Get-Pax8Invoices -sort -status -invoiceDate -invoiceDateRangeStart -invoiceDateRangeEnd -dueDate -total -balance -carriedBalance -id
Get-Pax8InvoiceItems -id
Get-Pax8UsageSummaries -sort -resourceGroup -companyId -subscriptionId -id 
Get-UsageSummaryLines -id -usageDate -productId
