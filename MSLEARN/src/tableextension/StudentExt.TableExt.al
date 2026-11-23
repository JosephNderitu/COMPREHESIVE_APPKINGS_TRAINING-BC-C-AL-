tableextension 50101 StudentTableExtension extends Student
{
    fields
    {
        // Add changes to table fields here
        field(50100; "Guardian Name"; Text[100])
        {
            Caption = 'Guardian Name';
            DataClassification = CustomerContent;
        }
        field(50101; "Guardian phone No."; Code[20])
        {
            Caption = 'Guardian Phone No.';
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
        }
        field(50102; "Hostel Resident"; Boolean)
        {
            Caption = 'Hostel Resident';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if not "Hostel Resident" then begin
                    "Hostel Room No." := '';
                end;
            end;
        }
        field(50103; "Hostel Room No."; Code[10])
        {
            Caption = 'Hostel Room No.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Hostel Room No." <> '' then begin
                    TestField("Hostel Resident", true);
                end;
            end;
        }
    }
}