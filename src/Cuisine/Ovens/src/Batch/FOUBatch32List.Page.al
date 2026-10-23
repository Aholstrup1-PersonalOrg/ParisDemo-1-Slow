page 55032 "FOU Batch List 32"
{
    Caption = 'FOU Batch 32';
    PageType = List;
    SourceTable = "FOU Batch 32";
    CardPageId = "FOU Batch Card 32";
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
                    Mgt: Codeunit "FOU Batch Mgt 32";
                begin
                    Mgt.Release(Rec);
                end;
            }
        }
    }
}
