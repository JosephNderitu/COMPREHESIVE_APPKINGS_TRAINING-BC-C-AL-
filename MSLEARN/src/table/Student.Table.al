table 50101 Student
{
    Caption = 'Student';
    DataClassification = CustomerContent;
    LookupPageId = "Student List";
    DrillDownPageId = "Student List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    UniSetup.Get();
                    NoSeries.TestManual(UniSetup."Student Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "First Name"; Text[50])
        {
            Caption = 'First Name';
        }
        field(3; "Last Name"; Text[50])
        {
            Caption = 'Last Name';
        }
        field(4; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(5; Gender; Enum "Student Gender")
        {
            Caption = 'Gender';
        }
        field(6; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(7; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(8; "Enrollment Date"; Date)
        {
            Caption = 'Enrollment Date';
        }
        field(9; Status; Enum "Student Status")
        {
            Caption = 'Status';
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Name; "Last Name", "First Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "First Name", "Last Name", Status)
        {
        }
    }

    var
        UniSetup: Record "University Setup";

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            UniSetup.Get();
            UniSetup.TestField("Student Nos.");
            "No. Series" := UniSetup."Student Nos.";
            "No." := NoSeries.GetNextNo("No. Series");
        end;

        if "Enrollment Date" = 0D then
            "Enrollment Date" := WorkDate();
    end;

    procedure AssistEdit(OldStudent: Record Student): Boolean
    var
        Student: Record Student;
        NoSeries: Codeunit "No. Series";
    begin
        Student := Rec;
        UniSetup.Get();
        UniSetup.TestField("Student Nos.");
        if NoSeries.LookupRelatedNoSeries(UniSetup."Student Nos.", OldStudent."No. Series", Student."No. Series") then begin
            Student."No." := NoSeries.GetNextNo(Student."No. Series");
            Rec := Student;
            exit(true);
        end;
    end;
}