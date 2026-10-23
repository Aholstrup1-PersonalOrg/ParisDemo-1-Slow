codeunit 60008 "PAT TER Tests"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit "Library Assert";

    [Test]
    procedure BakeAndSell01()
    var
        Mgt: Codeunit "TER Recipe Mgt 01";
        Rec: Record "TER Recipe 01";
    begin
        // [GIVEN] a fresh Eclair au cafe
        Mgt.CreateRecord('T001', 'Eclair au cafe', 2, 10);
        // [WHEN] it is released to the shop
        Rec.Get('T001');
        Mgt.Release(Rec);
        // [THEN] two at 10 EUR make 20 EUR
        Assert.AreEqual(20, Rec."Line Amount", 'Line amount');
        Assert.IsTrue(Rec.Status = Rec.Status::Released, 'Status');
        SimulateWork();
    end;

    [Test]
    procedure BakeAndSell02()
    var
        Mgt: Codeunit "TER Batch Mgt 02";
        Rec: Record "TER Batch 02";
    begin
        // [GIVEN] a fresh Tarte Tatin
        Mgt.CreateRecord('T002', 'Tarte Tatin', 2, 10);
        // [WHEN] it is released to the shop
        Rec.Get('T002');
        Mgt.Release(Rec);
        // [THEN] two at 10 EUR make 20 EUR
        Assert.AreEqual(20, Rec."Line Amount", 'Line amount');
        Assert.IsTrue(Rec.Status = Rec.Status::Released, 'Status');
        SimulateWork();
    end;

    [Test]
    procedure BakeAndSell03()
    var
        Mgt: Codeunit "TER Order Mgt 03";
        Rec: Record "TER Order 03";
    begin
        // [GIVEN] a fresh Mille-feuille
        Mgt.CreateRecord('T003', 'Mille-feuille', 2, 10);
        // [WHEN] it is released to the shop
        Rec.Get('T003');
        Mgt.Release(Rec);
        // [THEN] two at 10 EUR make 20 EUR
        Assert.AreEqual(20, Rec."Line Amount", 'Line amount');
        Assert.IsTrue(Rec.Status = Rec.Status::Released, 'Status');
        SimulateWork();
    end;

    [Test]
    procedure BakeAndSell04()
    var
        Mgt: Codeunit "TER Ledger Mgt 04";
        Rec: Record "TER Ledger 04";
    begin
        // [GIVEN] a fresh Croissant
        Mgt.CreateRecord('T004', 'Croissant', 2, 10);
        // [WHEN] it is released to the shop
        Rec.Get('T004');
        Mgt.Release(Rec);
        // [THEN] two at 10 EUR make 20 EUR
        Assert.AreEqual(20, Rec."Line Amount", 'Line amount');
        Assert.IsTrue(Rec.Status = Rec.Status::Released, 'Status');
        SimulateWork();
    end;

    local procedure SimulateWork()
    begin
        // Simulates a slow integration test (the oven takes its time). Set to 0 for fast tests.
        Sleep(8000);
    end;
}
