page 50000 "PAT Setup"
{
    Caption = 'Patisserie Setup';
    PageType = Card;
    SourceTable = "PAT Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("Default Discount %"; Rec."Default Discount %") { }
                field("Amount Rounding"; Rec."Amount Rounding") { }
                field("Archive After Days"; Rec."Archive After Days") { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
