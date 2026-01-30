codeunit 80102 "EDK TestPurchase TEST"
{
    Access = Internal;
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure PurchaseOrder_TestPostStandardPurchaseOrder()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchInvHdr: Record "Purch. Inv. Header";
    begin
        //[Scenario] 

        //[Given] 
        PurchaseLibrary.CreatePurchaseOrder(PurchaseHeader);

        //[When] 
        PurchInvHdr.Get(PurchaseLibrary.PostPurchaseDocument(PurchaseHeader, true, true));

        //[Then]
        Assert.AreEqual(PurchaseHeader."No.", PurchInvHdr."Order No.", 'Order no. on posted invoice does not match no. on purchase order.');
    end;

    var
        PurchaseLibrary: Codeunit "Library - Purchase";
        Assert: Codeunit Assert;
}