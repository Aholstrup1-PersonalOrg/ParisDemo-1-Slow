codeunit 50000 "PAT Foundation Mgt"
{
    procedure GetSetup(var Setup: Record "PAT Setup")
    begin
        if not Setup.Get() then begin
            Setup.Init();
            Setup.Insert();
        end;
    end;

    procedure RoundAmount(Amount: Decimal): Decimal
    var
        Setup: Record "PAT Setup";
    begin
        GetSetup(Setup);
        if Setup."Amount Rounding" = 0 then
            exit(Amount);
        exit(Round(Amount, Setup."Amount Rounding"));
    end;

    procedure ApplyDefaultDiscount(Amount: Decimal): Decimal
    var
        Setup: Record "PAT Setup";
    begin
        GetSetup(Setup);
        exit(RoundAmount(Amount * (1 - Setup."Default Discount %" / 100)));
    end;

    procedure ValidateDescription(Description: Text[100])
    var
        EmptyDescriptionErr: Label 'Description must not be empty.';
    begin
        if DelChr(Description, '=', ' ') = '' then
            Error(EmptyDescriptionErr);
    end;

    procedure IsOverdue(DueDate: Date): Boolean
    begin
        exit((DueDate <> 0D) and (DueDate < WorkDate()));
    end;
}
