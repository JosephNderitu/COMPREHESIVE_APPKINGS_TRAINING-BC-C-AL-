tableextension 50102 StudentPortalExtension extends Student
{
    fields
    {
        // Add changes to table fields here
        field(50110; "Portal Username"; Code[30])
        {
            Caption = 'Portal Username';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                OtherStudent: Record Student;
            begin
                if "Portal Username" = '' then begin
                    "Portal Enabled" := false;
                    exit;
                end;

                OtherStudent.SetFilter("No.", '<>%1', "No.");
                OtherStudent.SetRange("Portal Username", "Portal Username");
                if not OtherStudent.IsEmpty() then begin
                    Error(UsernameTakenErr, "Portal Username");
                end;
            end;
        }
        field(50111; "Portal Enabled"; Boolean)
        {
            Caption = 'Portal Enabled';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "Portal Enabled" then
                    TestField("Portal Username");
            end;
        }
        field(50112; "Portal Password Hash"; Text[100])
        {
            Caption = 'Portal Password Hash';
            DataClassification = CustomerContent;
            Editable = false;
            Access = Internal;
        }
        field(50113; "Portal Password Salt"; Text[50])
        {
            Caption = 'Portal Password Salt';
            DataClassification = CustomerContent;
            Editable = false;
            Access = Internal;
        }
        field(50114; "Portal Password Must Change"; Boolean)
        {
            Caption = 'Portal Password Must Change';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    var
        UsernameTakenErr: Label 'The portal username %1 is already used by another student.';
}