page 56040 "LIV Stock List 40"
{
    Caption = 'LIV Stock 40';
    PageType = List;
    SourceTable = "LIV Stock 40";
    CardPageId = "LIV Stock Card 40";
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
                    Mgt: Codeunit "LIV Stock Mgt 40";
                begin
                    Mgt.Release(Rec);
                end;
            }
        }
    }
}
