codeunit 72000 "PAT Boutique Tests"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit "Library Assert";

    [Test]
    procedure BakeAndSell01()
    var
        Mgt: Codeunit "BTQ Recipe Mgt 01";
        Rec: Record "BTQ Recipe 01";
    begin
        // [GIVEN] a fresh Baguette tradition
        Mgt.CreateRecord('T001', 'Baguette tradition', 2, 10);
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
        Mgt: Codeunit "BTQ Batch Mgt 02";
        Rec: Record "BTQ Batch 02";
    begin
        // [GIVEN] a fresh Macaron framboise
        Mgt.CreateRecord('T002', 'Macaron framboise', 2, 10);
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
        Mgt: Codeunit "CNC Recipe Mgt 01";
        Rec: Record "CNC Recipe 01";
    begin
        // [GIVEN] a fresh Cafe creme
        Mgt.CreateRecord('T003', 'Cafe creme', 2, 10);
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
        Mgt: Codeunit "CNC Batch Mgt 02";
        Rec: Record "CNC Batch 02";
    begin
        // [GIVEN] a fresh Eclair au cafe
        Mgt.CreateRecord('T004', 'Eclair au cafe', 2, 10);
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
        Sleep(0);
    end;
}
