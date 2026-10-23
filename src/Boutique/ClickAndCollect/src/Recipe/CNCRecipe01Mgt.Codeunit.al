codeunit 71001 "CNC Recipe Mgt 01"
{
    procedure CreateRecord(No: Code[20]; Description: Text[100]; Qty: Decimal; UnitPrice: Decimal)
    var
        Rec: Record "CNC Recipe 01";
    begin
        Rec.Init();
        Rec."No." := No;
        Rec.Validate(Description, Description);
        Rec.Validate(Quantity, Qty);
        Rec.Validate("Unit Price", UnitPrice);
        Rec.Validate(Amount, Rec."Line Amount");
        Rec.Insert(true);
    end;

    procedure Release(var Rec: Record "CNC Recipe 01")
    begin
        Rec.TestField(Blocked, false);
        Rec.TestField(Description);
        Rec.Status := Rec.Status::Released;
        Rec.Modify(true);
    end;

    procedure Close(var Rec: Record "CNC Recipe 01")
    begin
        Rec.TestField(Status, Rec.Status::Released);
        Rec.Status := Rec.Status::Closed;
        Rec.Modify(true);
    end;

    procedure ApplyDiscount(var Rec: Record "CNC Recipe 01")
    var
        FoundationMgt: Codeunit "PAT Foundation Mgt";
    begin
        Rec.Validate(Amount, FoundationMgt.ApplyDefaultDiscount(Rec."Line Amount"));
        Rec.Modify(true);
    end;

    procedure CalcTotal(CustomerNo: Code[20]): Decimal
    var
        Rec: Record "CNC Recipe 01";
        Total: Decimal;
    begin
        Rec.SetCurrentKey("Customer No.", "Posting Date");
        Rec.SetRange("Customer No.", CustomerNo);
        if Rec.FindSet() then
            repeat
                Total += Rec."Line Amount";
            until Rec.Next() = 0;
        exit(Total);
    end;

    procedure CountOverdue(): Integer
    var
        Rec: Record "CNC Recipe 01";
        Counter: Integer;
    begin
        Rec.SetFilter(Status, '<>%1', Rec.Status::Closed);
        if Rec.FindSet() then
            repeat
                if Rec.IsOverdue() then
                    Counter += 1;
            until Rec.Next() = 0;
        exit(Counter);
    end;

    procedure CalcCrossTotal(CustomerNo: Code[20]): Decimal
    var
        Other: Codeunit "BTQ Recipe Mgt 01";
    begin
        exit(CalcTotal(CustomerNo) + Other.CalcTotal(CustomerNo));
    end;
}
