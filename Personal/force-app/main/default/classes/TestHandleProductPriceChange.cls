@isTest
private class TestHandleProductPriceChange {
	
	static testMethod void testPriceChange()
	{
		//	Add merchandise products
		List<Merchandise__c> products = new List<Merchandise__c>();
		Merchandise__c product1 = new Merchandise__c();
		product1.Name = 'Item 1';
		product1.Description__c = 'Test Product 1';
		product1.Price__c = 10;
		product1.Total_Inventory__c = 1000;
		products.add(product1);
		
		Merchandise__c product2 = new Merchandise__c();
		product2.Name = 'Item 2';
		product2.Description__c = 'Test Product 2';
		product2.Price__c = 11;
		product2.Total_Inventory__c = 1000;
		products.add(product2);
		
		insert products;
		
		//	Create invoice
		Invoice_Statement__c invoice = new Invoice_Statement__c();
		invoice.Status__c = 'Negotiating';
		insert Invoice;
		
		List<Line_Item__c> lineItems = new List<Line_Item__c>();
		Line_Item__c li1 = new Line_Item__c();
		li1.Invoice_Statement__c = invoice.id;
		li1.Merchandise__c = products[0].id;
		li1.Unit_Price__c = 5;
		li1.Units_Sold__c = 10;
		lineItems.Add(li1);
		
		Line_Item__c li2 = new Line_Item__c();
		li2.Invoice_Statement__c = invoice.id;
		li2.Merchandise__c = products[1].id;
		li2.Unit_Price__c = 6;
		li2.Units_Sold__c = 11;
		lineItems.Add(li2);
		
		insert lineItems;
		products[0].Price__c = 20;
		products[1].Price__c = 15;
		Test.startTest();
		update products;
		Test.stopTest();
		
		lineItems = [SELECT id, Unit_Price__c FROM Line_Item__c WHERE id IN: lineItems];
		system.assert(lineItems[0].Unit_Price__c == 20);
		system.assert(lineItems[1].Unit_Price__c == 15);
		
		
		
	}

}