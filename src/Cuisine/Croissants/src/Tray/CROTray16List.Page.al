page 51016 "CRO Tray List 16"
{
    Caption = 'CRO Tray 16';
    PageType = List;
    SourceTable = "CRO Tray 16";
    CardPageId = "CRO Tray Card 16";
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
                    Mgt: Codeunit "CRO Tray Mgt 16";
                begin
                    Mgt.Release(Rec);
                end;
            }
        }
    }
}
