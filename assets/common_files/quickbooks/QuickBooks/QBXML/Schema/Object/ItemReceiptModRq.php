<?php

/**
 * Schema object for: ItemReceiptModRq
 * 
 * @author "Keith Palmer Jr." <Keith@ConsoliByte.com>
 * @license LICENSE.txt
 * 
 * @package QuickBooks
 * @subpackage QBXML
 */

/**
 * 
 */
require_once 'QuickBooks.php';

/**
 * 
 */
require_once 'QuickBooks/QBXML/Schema/Object.php';

/**
 * 
 */
class QuickBooks_QBXML_Schema_Object_ItemReceiptModRq extends QuickBooks_QBXML_Schema_Object
{
	protected function &_qbxmlWrapper()
	{
		static $wrapper = '';
		
		return $wrapper;
	}
	
	protected function &_dataTypePaths()
	{
		static $paths = array (
  'TxnID' => 'IDTYPE',
  'EditSequence' => 'STRTYPE',
  'VendorRef ListID' => 'IDTYPE',
  'VendorRef FullName' => 'STRTYPE',
  'APAccountRef ListID' => 'IDTYPE',
  'APAccountRef FullName' => 'STRTYPE',
  'TxnDate' => 'DATETYPE',
  'RefNumber' => 'STRTYPE',
  'Memo' => 'STRTYPE',
  'ClearExpenseLines' => 'BOOLTYPE',
  'ExpenseLineMod TxnLineID' => 'IDTYPE',
  'ExpenseLineMod AccountRef ListID' => 'IDTYPE',
  'ExpenseLineMod AccountRef FullName' => 'STRTYPE',
  'ExpenseLineMod Amount' => 'AMTTYPE',
  'ExpenseLineMod TaxAmount' => 'AMTTYPE',
  'ExpenseLineMod Memo' => 'STRTYPE',
  'ExpenseLineMod CustomerRef ListID' => 'IDTYPE',
  'ExpenseLineMod CustomerRef FullName' => 'STRTYPE',
  'ExpenseLineMod ClassRef ListID' => 'IDTYPE',
  'ExpenseLineMod ClassRef FullName' => 'STRTYPE',
  'ExpenseLineMod SalesTaxCodeRef ListID' => 'IDTYPE',
  'ExpenseLineMod SalesTaxCodeRef FullName' => 'STRTYPE',
  'ExpenseLineMod BillableStatus' => 'ENUMTYPE',
  'ClearItemLines' => 'BOOLTYPE',
  'ItemLineMod TxnLineID' => 'IDTYPE',
  'ItemLineMod ItemRef ListID' => 'IDTYPE',
  'ItemLineMod ItemRef FullName' => 'STRTYPE',
  'ItemLineMod Desc' => 'STRTYPE',
  'ItemLineMod Quantity' => 'QUANTYPE',
  'ItemLineMod UnitOfMeasure' => 'STRTYPE',
  'ItemLineMod OverrideUOMSetRef ListID' => 'IDTYPE',
  'ItemLineMod OverrideUOMSetRef FullName' => 'STRTYPE',
  'ItemLineMod Cost' => 'PRICETYPE',
  'ItemLineMod Amount' => 'AMTTYPE',
  'ItemLineMod TaxAmount' => 'AMTTYPE',
  'ItemLineMod CustomerRef ListID' => 'IDTYPE',
  'ItemLineMod CustomerRef FullName' => 'STRTYPE',
  'ItemLineMod ClassRef ListID' => 'IDTYPE',
  'ItemLineMod ClassRef FullName' => 'STRTYPE',
  'ItemLineMod SalesTaxCodeRef ListID' => 'IDTYPE',
  'ItemLineMod SalesTaxCodeRef FullName' => 'STRTYPE',
  'ItemLineMod BillableStatus' => 'ENUMTYPE',
  'ItemLineMod OverrideItemAccountRef ListID' => 'IDTYPE',
  'ItemLineMod OverrideItemAccountRef FullName' => 'STRTYPE',
  'ItemGroupLineMod TxnLineID' => 'IDTYPE',
  'ItemGroupLineMod ItemGroupRef ListID' => 'IDTYPE',
  'ItemGroupLineMod ItemGroupRef FullName' => 'STRTYPE',
  'ItemGroupLineMod Quantity' => 'QUANTYPE',
  'ItemGroupLineMod UnitOfMeasure' => 'STRTYPE',
  'ItemGroupLineMod OverrideUOMSetRef ListID' => 'IDTYPE',
  'ItemGroupLineMod OverrideUOMSetRef FullName' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod TxnLineID' => 'IDTYPE',
  'ItemGroupLineMod ItemLineMod ItemRef ListID' => 'IDTYPE',
  'ItemGroupLineMod ItemLineMod ItemRef FullName' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod Desc' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod Quantity' => 'QUANTYPE',
  'ItemGroupLineMod ItemLineMod UnitOfMeasure' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef ListID' => 'IDTYPE',
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef FullName' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod Cost' => 'PRICETYPE',
  'ItemGroupLineMod ItemLineMod Amount' => 'AMTTYPE',
  'ItemGroupLineMod ItemLineMod TaxAmount' => 'AMTTYPE',
  'ItemGroupLineMod ItemLineMod CustomerRef ListID' => 'IDTYPE',
  'ItemGroupLineMod ItemLineMod CustomerRef FullName' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod ClassRef ListID' => 'IDTYPE',
  'ItemGroupLineMod ItemLineMod ClassRef FullName' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef ListID' => 'IDTYPE',
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef FullName' => 'STRTYPE',
  'ItemGroupLineMod ItemLineMod BillableStatus' => 'ENUMTYPE',
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef ListID' => 'IDTYPE',
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef FullName' => 'STRTYPE',
  'IncludeRetElement' => 'STRTYPE',
);
		
		return $paths;
	}
	
	protected function &_maxLengthPaths()
	{
		static $paths = array (
  'TxnID' => 0,
  'EditSequence' => 16,
  'VendorRef ListID' => 0,
  'VendorRef FullName' => 41,
  'APAccountRef ListID' => 0,
  'APAccountRef FullName' => 41,
  'TxnDate' => 0,
  'RefNumber' => 20,
  'Memo' => 4095,
  'ClearExpenseLines' => 0,
  'ExpenseLineMod TxnLineID' => 0,
  'ExpenseLineMod AccountRef ListID' => 0,
  'ExpenseLineMod AccountRef FullName' => 41,
  'ExpenseLineMod Amount' => 0,
  'ExpenseLineMod TaxAmount' => 0,
  'ExpenseLineMod Memo' => 4095,
  'ExpenseLineMod CustomerRef ListID' => 0,
  'ExpenseLineMod CustomerRef FullName' => 41,
  'ExpenseLineMod ClassRef ListID' => 0,
  'ExpenseLineMod ClassRef FullName' => 41,
  'ExpenseLineMod SalesTaxCodeRef ListID' => 0,
  'ExpenseLineMod SalesTaxCodeRef FullName' => 41,
  'ExpenseLineMod BillableStatus' => 0,
  'ClearItemLines' => 0,
  'ItemLineMod TxnLineID' => 0,
  'ItemLineMod ItemRef ListID' => 0,
  'ItemLineMod ItemRef FullName' => 41,
  'ItemLineMod Desc' => 4095,
  'ItemLineMod Quantity' => 0,
  'ItemLineMod UnitOfMeasure' => 31,
  'ItemLineMod OverrideUOMSetRef ListID' => 0,
  'ItemLineMod OverrideUOMSetRef FullName' => 41,
  'ItemLineMod Cost' => 0,
  'ItemLineMod Amount' => 0,
  'ItemLineMod TaxAmount' => 0,
  'ItemLineMod CustomerRef ListID' => 0,
  'ItemLineMod CustomerRef FullName' => 41,
  'ItemLineMod ClassRef ListID' => 0,
  'ItemLineMod ClassRef FullName' => 41,
  'ItemLineMod SalesTaxCodeRef ListID' => 0,
  'ItemLineMod SalesTaxCodeRef FullName' => 41,
  'ItemLineMod BillableStatus' => 0,
  'ItemLineMod OverrideItemAccountRef ListID' => 0,
  'ItemLineMod OverrideItemAccountRef FullName' => 41,
  'ItemGroupLineMod TxnLineID' => 0,
  'ItemGroupLineMod ItemGroupRef ListID' => 0,
  'ItemGroupLineMod ItemGroupRef FullName' => 41,
  'ItemGroupLineMod Quantity' => 0,
  'ItemGroupLineMod UnitOfMeasure' => 31,
  'ItemGroupLineMod OverrideUOMSetRef ListID' => 0,
  'ItemGroupLineMod OverrideUOMSetRef FullName' => 41,
  'ItemGroupLineMod ItemLineMod TxnLineID' => 0,
  'ItemGroupLineMod ItemLineMod ItemRef ListID' => 0,
  'ItemGroupLineMod ItemLineMod ItemRef FullName' => 41,
  'ItemGroupLineMod ItemLineMod Desc' => 4095,
  'ItemGroupLineMod ItemLineMod Quantity' => 0,
  'ItemGroupLineMod ItemLineMod UnitOfMeasure' => 31,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef ListID' => 0,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef FullName' => 41,
  'ItemGroupLineMod ItemLineMod Cost' => 0,
  'ItemGroupLineMod ItemLineMod Amount' => 0,
  'ItemGroupLineMod ItemLineMod TaxAmount' => 0,
  'ItemGroupLineMod ItemLineMod CustomerRef ListID' => 0,
  'ItemGroupLineMod ItemLineMod CustomerRef FullName' => 41,
  'ItemGroupLineMod ItemLineMod ClassRef ListID' => 0,
  'ItemGroupLineMod ItemLineMod ClassRef FullName' => 41,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef ListID' => 0,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef FullName' => 41,
  'ItemGroupLineMod ItemLineMod BillableStatus' => 0,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef ListID' => 0,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef FullName' => 41,
  'IncludeRetElement' => 50,
);
		
		return $paths;
	}
	
	protected function &_isOptionalPaths()
	{
		static $paths = array (
  'TxnID' => false,
  'EditSequence' => false,
  'VendorRef ListID' => true,
  'VendorRef FullName' => true,
  'APAccountRef ListID' => true,
  'APAccountRef FullName' => true,
  'TxnDate' => true,
  'RefNumber' => true,
  'Memo' => true,
  'ClearExpenseLines' => true,
  'ExpenseLineMod TxnLineID' => false,
  'ExpenseLineMod AccountRef ListID' => true,
  'ExpenseLineMod AccountRef FullName' => true,
  'ExpenseLineMod Amount' => true,
  'ExpenseLineMod TaxAmount' => true,
  'ExpenseLineMod Memo' => true,
  'ExpenseLineMod CustomerRef ListID' => true,
  'ExpenseLineMod CustomerRef FullName' => true,
  'ExpenseLineMod ClassRef ListID' => true,
  'ExpenseLineMod ClassRef FullName' => true,
  'ExpenseLineMod SalesTaxCodeRef ListID' => true,
  'ExpenseLineMod SalesTaxCodeRef FullName' => true,
  'ExpenseLineMod BillableStatus' => true,
  'ClearItemLines' => true,
  'ItemLineMod TxnLineID' => false,
  'ItemLineMod ItemRef ListID' => true,
  'ItemLineMod ItemRef FullName' => true,
  'ItemLineMod Desc' => true,
  'ItemLineMod Quantity' => true,
  'ItemLineMod UnitOfMeasure' => true,
  'ItemLineMod OverrideUOMSetRef ListID' => true,
  'ItemLineMod OverrideUOMSetRef FullName' => true,
  'ItemLineMod Cost' => true,
  'ItemLineMod Amount' => true,
  'ItemLineMod TaxAmount' => true,
  'ItemLineMod CustomerRef ListID' => true,
  'ItemLineMod CustomerRef FullName' => true,
  'ItemLineMod ClassRef ListID' => true,
  'ItemLineMod ClassRef FullName' => true,
  'ItemLineMod SalesTaxCodeRef ListID' => true,
  'ItemLineMod SalesTaxCodeRef FullName' => true,
  'ItemLineMod BillableStatus' => true,
  'ItemLineMod OverrideItemAccountRef ListID' => true,
  'ItemLineMod OverrideItemAccountRef FullName' => true,
  'ItemGroupLineMod TxnLineID' => false,
  'ItemGroupLineMod ItemGroupRef ListID' => true,
  'ItemGroupLineMod ItemGroupRef FullName' => true,
  'ItemGroupLineMod Quantity' => true,
  'ItemGroupLineMod UnitOfMeasure' => true,
  'ItemGroupLineMod OverrideUOMSetRef ListID' => true,
  'ItemGroupLineMod OverrideUOMSetRef FullName' => true,
  'ItemGroupLineMod ItemLineMod TxnLineID' => false,
  'ItemGroupLineMod ItemLineMod ItemRef ListID' => true,
  'ItemGroupLineMod ItemLineMod ItemRef FullName' => true,
  'ItemGroupLineMod ItemLineMod Desc' => true,
  'ItemGroupLineMod ItemLineMod Quantity' => true,
  'ItemGroupLineMod ItemLineMod UnitOfMeasure' => true,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef ListID' => true,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef FullName' => true,
  'ItemGroupLineMod ItemLineMod Cost' => true,
  'ItemGroupLineMod ItemLineMod Amount' => true,
  'ItemGroupLineMod ItemLineMod TaxAmount' => true,
  'ItemGroupLineMod ItemLineMod CustomerRef ListID' => true,
  'ItemGroupLineMod ItemLineMod CustomerRef FullName' => true,
  'ItemGroupLineMod ItemLineMod ClassRef ListID' => true,
  'ItemGroupLineMod ItemLineMod ClassRef FullName' => true,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef ListID' => true,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef FullName' => true,
  'ItemGroupLineMod ItemLineMod BillableStatus' => true,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef ListID' => true,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef FullName' => true,
  'IncludeRetElement' => true,
);
	}
	
	protected function &_sinceVersionPaths()
	{
		static $paths = array (
  'TxnID' => 999.99,
  'EditSequence' => 999.99,
  'VendorRef ListID' => 999.99,
  'VendorRef FullName' => 999.99,
  'APAccountRef ListID' => 999.99,
  'APAccountRef FullName' => 999.99,
  'TxnDate' => 999.99,
  'RefNumber' => 999.99,
  'Memo' => 999.99,
  'ClearExpenseLines' => 999.99,
  'ExpenseLineMod TxnLineID' => 999.99,
  'ExpenseLineMod AccountRef ListID' => 999.99,
  'ExpenseLineMod AccountRef FullName' => 999.99,
  'ExpenseLineMod Amount' => 999.99,
  'ExpenseLineMod TaxAmount' => 6.1,
  'ExpenseLineMod Memo' => 999.99,
  'ExpenseLineMod CustomerRef ListID' => 999.99,
  'ExpenseLineMod CustomerRef FullName' => 999.99,
  'ExpenseLineMod ClassRef ListID' => 999.99,
  'ExpenseLineMod ClassRef FullName' => 999.99,
  'ExpenseLineMod SalesTaxCodeRef ListID' => 999.99,
  'ExpenseLineMod SalesTaxCodeRef FullName' => 999.99,
  'ExpenseLineMod BillableStatus' => 999.99,
  'ClearItemLines' => 999.99,
  'ItemLineMod TxnLineID' => 999.99,
  'ItemLineMod ItemRef ListID' => 999.99,
  'ItemLineMod ItemRef FullName' => 999.99,
  'ItemLineMod Desc' => 999.99,
  'ItemLineMod Quantity' => 999.99,
  'ItemLineMod UnitOfMeasure' => 7,
  'ItemLineMod OverrideUOMSetRef ListID' => 999.99,
  'ItemLineMod OverrideUOMSetRef FullName' => 999.99,
  'ItemLineMod Cost' => 999.99,
  'ItemLineMod Amount' => 999.99,
  'ItemLineMod TaxAmount' => 6.1,
  'ItemLineMod CustomerRef ListID' => 999.99,
  'ItemLineMod CustomerRef FullName' => 999.99,
  'ItemLineMod ClassRef ListID' => 999.99,
  'ItemLineMod ClassRef FullName' => 999.99,
  'ItemLineMod SalesTaxCodeRef ListID' => 999.99,
  'ItemLineMod SalesTaxCodeRef FullName' => 999.99,
  'ItemLineMod BillableStatus' => 999.99,
  'ItemLineMod OverrideItemAccountRef ListID' => 999.99,
  'ItemLineMod OverrideItemAccountRef FullName' => 999.99,
  'ItemGroupLineMod TxnLineID' => 999.99,
  'ItemGroupLineMod ItemGroupRef ListID' => 999.99,
  'ItemGroupLineMod ItemGroupRef FullName' => 999.99,
  'ItemGroupLineMod Quantity' => 999.99,
  'ItemGroupLineMod UnitOfMeasure' => 7,
  'ItemGroupLineMod OverrideUOMSetRef ListID' => 999.99,
  'ItemGroupLineMod OverrideUOMSetRef FullName' => 999.99,
  'ItemGroupLineMod ItemLineMod TxnLineID' => 999.99,
  'ItemGroupLineMod ItemLineMod ItemRef ListID' => 999.99,
  'ItemGroupLineMod ItemLineMod ItemRef FullName' => 999.99,
  'ItemGroupLineMod ItemLineMod Desc' => 999.99,
  'ItemGroupLineMod ItemLineMod Quantity' => 999.99,
  'ItemGroupLineMod ItemLineMod UnitOfMeasure' => 7,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef ListID' => 999.99,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef FullName' => 999.99,
  'ItemGroupLineMod ItemLineMod Cost' => 999.99,
  'ItemGroupLineMod ItemLineMod Amount' => 999.99,
  'ItemGroupLineMod ItemLineMod TaxAmount' => 6.1,
  'ItemGroupLineMod ItemLineMod CustomerRef ListID' => 999.99,
  'ItemGroupLineMod ItemLineMod CustomerRef FullName' => 999.99,
  'ItemGroupLineMod ItemLineMod ClassRef ListID' => 999.99,
  'ItemGroupLineMod ItemLineMod ClassRef FullName' => 999.99,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef ListID' => 999.99,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef FullName' => 999.99,
  'ItemGroupLineMod ItemLineMod BillableStatus' => 999.99,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef ListID' => 999.99,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef FullName' => 999.99,
  'IncludeRetElement' => 999.99,
);
		
		return $paths;
	}
	
	protected function &_isRepeatablePaths()
	{
		static $paths = array (
  'TxnID' => false,
  'EditSequence' => false,
  'VendorRef ListID' => false,
  'VendorRef FullName' => false,
  'APAccountRef ListID' => false,
  'APAccountRef FullName' => false,
  'TxnDate' => false,
  'RefNumber' => false,
  'Memo' => false,
  'ClearExpenseLines' => false,
  'ExpenseLineMod TxnLineID' => false,
  'ExpenseLineMod AccountRef ListID' => false,
  'ExpenseLineMod AccountRef FullName' => false,
  'ExpenseLineMod Amount' => false,
  'ExpenseLineMod TaxAmount' => false,
  'ExpenseLineMod Memo' => false,
  'ExpenseLineMod CustomerRef ListID' => false,
  'ExpenseLineMod CustomerRef FullName' => false,
  'ExpenseLineMod ClassRef ListID' => false,
  'ExpenseLineMod ClassRef FullName' => false,
  'ExpenseLineMod SalesTaxCodeRef ListID' => false,
  'ExpenseLineMod SalesTaxCodeRef FullName' => false,
  'ExpenseLineMod BillableStatus' => false,
  'ClearItemLines' => false,
  'ItemLineMod TxnLineID' => false,
  'ItemLineMod ItemRef ListID' => false,
  'ItemLineMod ItemRef FullName' => false,
  'ItemLineMod Desc' => false,
  'ItemLineMod Quantity' => false,
  'ItemLineMod UnitOfMeasure' => false,
  'ItemLineMod OverrideUOMSetRef ListID' => false,
  'ItemLineMod OverrideUOMSetRef FullName' => false,
  'ItemLineMod Cost' => false,
  'ItemLineMod Amount' => false,
  'ItemLineMod TaxAmount' => false,
  'ItemLineMod CustomerRef ListID' => false,
  'ItemLineMod CustomerRef FullName' => false,
  'ItemLineMod ClassRef ListID' => false,
  'ItemLineMod ClassRef FullName' => false,
  'ItemLineMod SalesTaxCodeRef ListID' => false,
  'ItemLineMod SalesTaxCodeRef FullName' => false,
  'ItemLineMod BillableStatus' => false,
  'ItemLineMod OverrideItemAccountRef ListID' => false,
  'ItemLineMod OverrideItemAccountRef FullName' => false,
  'ItemGroupLineMod TxnLineID' => false,
  'ItemGroupLineMod ItemGroupRef ListID' => false,
  'ItemGroupLineMod ItemGroupRef FullName' => false,
  'ItemGroupLineMod Quantity' => false,
  'ItemGroupLineMod UnitOfMeasure' => false,
  'ItemGroupLineMod OverrideUOMSetRef ListID' => false,
  'ItemGroupLineMod OverrideUOMSetRef FullName' => false,
  'ItemGroupLineMod ItemLineMod TxnLineID' => false,
  'ItemGroupLineMod ItemLineMod ItemRef ListID' => false,
  'ItemGroupLineMod ItemLineMod ItemRef FullName' => false,
  'ItemGroupLineMod ItemLineMod Desc' => false,
  'ItemGroupLineMod ItemLineMod Quantity' => false,
  'ItemGroupLineMod ItemLineMod UnitOfMeasure' => false,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef ListID' => false,
  'ItemGroupLineMod ItemLineMod OverrideUOMSetRef FullName' => false,
  'ItemGroupLineMod ItemLineMod Cost' => false,
  'ItemGroupLineMod ItemLineMod Amount' => false,
  'ItemGroupLineMod ItemLineMod TaxAmount' => false,
  'ItemGroupLineMod ItemLineMod CustomerRef ListID' => false,
  'ItemGroupLineMod ItemLineMod CustomerRef FullName' => false,
  'ItemGroupLineMod ItemLineMod ClassRef ListID' => false,
  'ItemGroupLineMod ItemLineMod ClassRef FullName' => false,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef ListID' => false,
  'ItemGroupLineMod ItemLineMod SalesTaxCodeRef FullName' => false,
  'ItemGroupLineMod ItemLineMod BillableStatus' => false,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef ListID' => false,
  'ItemGroupLineMod ItemLineMod OverrideItemAccountRef FullName' => false,
  'IncludeRetElement' => true,
);
			
		return $paths;
	}
	
	/*
	abstract protected function &_inLocalePaths()
	{
		static $paths = array(
			'FirstName' => array( 'QBD', 'QBCA', 'QBUK', 'QBAU' ), 
			'LastName' => array( 'QBD', 'QBCA', 'QBUK', 'QBAU' ),
			);
		
		return $paths;
	}
	*/
	
	protected function &_reorderPathsPaths()
	{
		static $paths = array (
  0 => 'TxnID',
  1 => 'EditSequence',
  2 => 'VendorRef ListID',
  3 => 'VendorRef FullName',
  4 => 'APAccountRef ListID',
  5 => 'APAccountRef FullName',
  6 => 'TxnDate',
  7 => 'RefNumber',
  8 => 'Memo',
  9 => 'ClearExpenseLines',
  10 => 'ExpenseLineMod TxnLineID',
  11 => 'ExpenseLineMod AccountRef ListID',
  12 => 'ExpenseLineMod AccountRef FullName',
  13 => 'ExpenseLineMod Amount',
  14 => 'ExpenseLineMod TaxAmount',
  15 => 'ExpenseLineMod Memo',
  16 => 'ExpenseLineMod CustomerRef ListID',
  17 => 'ExpenseLineMod CustomerRef FullName',
  18 => 'ExpenseLineMod ClassRef ListID',
  19 => 'ExpenseLineMod ClassRef FullName',
  20 => 'ExpenseLineMod SalesTaxCodeRef ListID',
  21 => 'ExpenseLineMod SalesTaxCodeRef FullName',
  22 => 'ExpenseLineMod BillableStatus',
  23 => 'ClearItemLines',
  24 => 'ItemLineMod TxnLineID',
  25 => 'ItemLineMod ItemRef ListID',
  26 => 'ItemLineMod ItemRef FullName',
  27 => 'ItemLineMod Desc',
  28 => 'ItemLineMod Quantity',
  29 => 'ItemLineMod UnitOfMeasure',
  30 => 'ItemLineMod OverrideUOMSetRef ListID',
  31 => 'ItemLineMod OverrideUOMSetRef FullName',
  32 => 'ItemLineMod Cost',
  33 => 'ItemLineMod Amount',
  34 => 'ItemLineMod TaxAmount',
  35 => 'ItemLineMod CustomerRef ListID',
  36 => 'ItemLineMod CustomerRef FullName',
  37 => 'ItemLineMod ClassRef ListID',
  38 => 'ItemLineMod ClassRef FullName',
  39 => 'ItemLineMod SalesTaxCodeRef ListID',
  40 => 'ItemLineMod SalesTaxCodeRef FullName',
  41 => 'ItemLineMod BillableStatus',
  42 => 'ItemLineMod OverrideItemAccountRef ListID',
  43 => 'ItemLineMod OverrideItemAccountRef FullName',
  44 => 'ItemGroupLineMod TxnLineID',
  45 => 'ItemGroupLineMod ItemGroupRef ListID',
  46 => 'ItemGroupLineMod ItemGroupRef FullName',
  47 => 'ItemGroupLineMod Quantity',
  48 => 'ItemGroupLineMod UnitOfMeasure',
  49 => 'ItemGroupLineMod OverrideUOMSetRef ListID',
  50 => 'ItemGroupLineMod OverrideUOMSetRef FullName',
  51 => 'ItemGroupLineMod ItemLineMod TxnLineID',
  52 => 'ItemGroupLineMod ItemLineMod ItemRef ListID',
  53 => 'ItemGroupLineMod ItemLineMod ItemRef FullName',
  54 => 'ItemGroupLineMod ItemLineMod Desc',
  55 => 'ItemGroupLineMod ItemLineMod Quantity',
  56 => 'ItemGroupLineMod ItemLineMod UnitOfMeasure',
  57 => 'ItemGroupLineMod ItemLineMod OverrideUOMSetRef ListID',
  58 => 'ItemGroupLineMod ItemLineMod OverrideUOMSetRef FullName',
  59 => 'ItemGroupLineMod ItemLineMod Cost',
  60 => 'ItemGroupLineMod ItemLineMod Amount',
  61 => 'ItemGroupLineMod ItemLineMod TaxAmount',
  62 => 'ItemGroupLineMod ItemLineMod CustomerRef ListID',
  63 => 'ItemGroupLineMod ItemLineMod CustomerRef FullName',
  64 => 'ItemGroupLineMod ItemLineMod ClassRef ListID',
  65 => 'ItemGroupLineMod ItemLineMod ClassRef FullName',
  66 => 'ItemGroupLineMod ItemLineMod SalesTaxCodeRef ListID',
  67 => 'ItemGroupLineMod ItemLineMod SalesTaxCodeRef FullName',
  68 => 'ItemGroupLineMod ItemLineMod BillableStatus',
  69 => 'ItemGroupLineMod ItemLineMod OverrideItemAccountRef ListID',
  70 => 'ItemGroupLineMod ItemLineMod OverrideItemAccountRef FullName',
  71 => 'IncludeRetElement',
);
			
		return $paths;
	}
}

