page 57214 "FRN Ledger Card 14"
{
    Caption = 'FRN Ledger 14';
    PageType = Card;
    SourceTable = "FRN Ledger 14";
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
                    Mgt: Codeunit "FRN Ledger Mgt 14";
                begin
                    Mgt.ApplyDiscount(Rec);
                end;
            }
        }
    }
}
