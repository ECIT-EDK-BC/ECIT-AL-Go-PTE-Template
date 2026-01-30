codeunit 80101 "EDK TestSales TEST"
{
    Access = Internal;
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure SalesOrder_TestPostStandardSalesOrder()
    var
        SalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
    begin
        //[Scenario] 

        //[Given] 
        SalesLibrary.CreateSalesOrder(SalesHeader);

        //[When] 
        SalesInvoiceHeader.Get(SalesLibrary.PostSalesDocument(SalesHeader, true, true));

        //[Then]
        Assert.AreEqual(SalesHeader."No.", SalesInvoiceHeader."Order No.", 'Order no. on posted invoice does not match no. on sales order.');
    end;

    var
        SalesLibrary: Codeunit "Library - Sales";
        Assert: Codeunit Assert;
}