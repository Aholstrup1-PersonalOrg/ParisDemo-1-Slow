table 50000 "PAT Setup"
{
    Caption = 'Patisserie Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10]) { Caption = 'Primary Key'; }
        field(2; "Default Discount %"; Decimal) { Caption = 'Default Discount %'; MinValue = 0; MaxValue = 100; }
        field(3; "Amount Rounding"; Decimal) { Caption = 'Amount Rounding'; InitValue = 0.01; }
        field(4; "Archive After Days"; Integer) { Caption = 'Archive After Days'; InitValue = 90; }
    }

    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }
}
