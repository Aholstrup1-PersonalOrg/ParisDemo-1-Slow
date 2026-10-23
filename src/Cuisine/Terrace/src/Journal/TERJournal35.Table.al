table 58035 "TER Journal 35"
{
    Caption = 'TER Journal 35';
    DataClassification = CustomerContent;
    LookupPageId = "TER Journal List 35";
    DrillDownPageId = "TER Journal List 35";

    fields
    {
        field(1; "No."; Code[20]) { Caption = 'No.'; NotBlank = true; }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            trigger OnValidate()
            var
                FoundationMgt: Codeunit "PAT Foundation Mgt";
            begin
                FoundationMgt.ValidateDescription(Description);
            end;
        }
        field(3; Status; Enum "PAT Status") { Caption = 'Status'; }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
            trigger OnValidate()
            var
                FoundationMgt: Codeunit "PAT Foundation Mgt";
            begin
                Amount := FoundationMgt.RoundAmount(Amount);
            end;
        }
        field(5; Quantity; Decimal) { Caption = 'Quantity'; DecimalPlaces = 0 : 5; trigger OnValidate() begin CalcLineAmount(); end; }
        field(6; "Unit Price"; Decimal) { Caption = 'Unit Price'; trigger OnValidate() begin CalcLineAmount(); end; }
        field(7; "Line Amount"; Decimal) { Caption = 'Line Amount'; Editable = false; }
        field(8; "Customer No."; Code[20]) { Caption = 'Customer No.'; TableRelation = Customer."No."; }
        field(9; "Item No."; Code[20]) { Caption = 'Item No.'; TableRelation = Item."No."; }
        field(10; "Posting Date"; Date) { Caption = 'Posting Date'; }
        field(11; "Due Date"; Date) { Caption = 'Due Date'; }
        field(12; Blocked; Boolean) { Caption = 'Blocked'; }
        field(13; "Line Count"; Integer) { Caption = 'Line Count'; }
        field(14; "Created At"; DateTime) { Caption = 'Created At'; Editable = false; }
        field(15; Comment; Text[250]) { Caption = 'Comment'; }
    }

    keys
    {
        key(PK; "No.") { Clustered = true; }
        key(Customer; "Customer No.", "Posting Date") { SumIndexFields = "Line Amount"; }
    }

    trigger OnInsert()
    begin
        "Created At" := CurrentDateTime();
        if "Posting Date" = 0D then
            "Posting Date" := WorkDate();
    end;

    procedure CalcLineAmount()
    begin
        "Line Amount" := Quantity * "Unit Price";
    end;

    procedure IsOverdue(): Boolean
    var
        FoundationMgt: Codeunit "PAT Foundation Mgt";
    begin
        exit(FoundationMgt.IsOverdue("Due Date"));
    end;
}
