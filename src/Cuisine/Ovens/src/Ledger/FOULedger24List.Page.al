page 55024 "FOU Ledger List 24"
{
    Caption = 'FOU Ledger 24';
    PageType = List;
    SourceTable = "FOU Ledger 24";
    CardPageId = "FOU Ledger Card 24";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("No."; Rec."No.") { }
                field("Description"; Rec."Description") { }
                field("Status"; Rec."Status") { }
                field("Customer No."; Rec."Customer No.") { }
                field("Item No."; Rec."Item No.") { }
                field("Quantity"; Rec."Quantity") { }
                field("Unit Price"; Rec."Unit Price") { }
                field("Line Amount"; Rec."Line Amount") { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Due Date"; Rec."Due Date") { }
                field("Blocked"; Rec."Blocked") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                trigger OnAction()
                var
                    Mgt: Codeunit "FOU Ledger Mgt 24";
                begin
                    Mgt.Release(Rec);
                end;
            }
        }
    }
}
