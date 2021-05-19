function Get-Pax8Invoices {
    Param(
        [ValidateSet("invoiceDate","dueDate","status","partnerName","total","balance","carriedBalance")]    
        [string]$sort,
        [ValidateSet("Unpaid","Paid","Void","Carried","Nothing Due")]  
        [string]$status,
        [date]$invoiceDate,
        [date]$invoiceDateRangeStart,
        [date]$invoiceDateRangeEnd,
        [date]$dueDate,
        [float]$total,
        [float]$balance,
        [float]$carriedBalance,
        [string]$id
    )

    if ($id){
      $Invoices = Invoke-Pax8Request -method get -resource "invoices/$id"
    } else {

    $resourcefilter = ''
    if ($sort) {
		$resourcefilter = "$($resourcefilter)&sort=$($sort)"
	}
    if ($status) {
		$resourcefilter = "$($resourcefilter)&status=$($status)"
	}
    if ($invoiceDate) {
		$resourcefilter = "$($resourcefilter)&invoiceDate=$($invoiceDate.ToString("yyyy-MM-dd"))"
	}
    if ($invoiceDateRangeStart) {
		$resourcefilter = "$($resourcefilter)&invoiceDateRangeStart=$($invoiceDateRangeStart.ToString("yyyy-MM-dd"))"
	}
    if ($invoiceDateRangeEnd) {
		$resourcefilter = "$($resourcefilter)&invoiceDateRangeEnd=$($invoiceDateRangeEnd.ToString("yyyy-MM-dd"))"
	}
    if ($dueDate) {
		$resourcefilter = "$($resourcefilter)&dueDate=$($dueDate.ToString("yyyy-MM-dd"))"
	}
    if ($total) {
		$resourcefilter = "$($resourcefilter)&total=$($total)"
	}
    if ($balance) {
		$resourcefilter = "$($resourcefilter)&balance=$($balance)"
	}
    if ($carriedBalance) {
		$resourcefilter = "$($resourcefilter)&carriedBalance=$($carriedBalance)"
	}

  $Invoices = Invoke-Pax8Request -method get -resource "invoices" -ResourceFilter $resourcefilter
  }

  return $Invoices

}