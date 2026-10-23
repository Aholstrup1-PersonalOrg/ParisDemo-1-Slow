page 55214 "FOU Ledger Card 14"
{
    Caption = 'FOU Ledger 14';
    PageType = Card;
    SourceTable = "FOU Ledger 14";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
                field("Amount"; Rec."Amount") { }
                field("Comment"; Rec."Comment") { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ApplyDiscount)
            {
                Caption = 'Apply default discount';
                Image = Discount;
                trigger OnAction()
                var
                    Mgt: Codeunit "FOU Ledger Mgt 14";
                begin
                    Mgt.ApplyDiscount(Rec);
                end;
            }
        }
    }
}
