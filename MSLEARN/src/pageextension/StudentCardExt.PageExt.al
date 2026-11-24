pageextension 50112 StudentCardPageExtension extends "Student Card"
{
    layout
    {
        // Add changes to page layout here
        modify("Phone No.")
        {
            ShowMandatory = true;
        }
        addafter(Contact)
        {
            group(Guardian)
            {
                Caption = 'Guardian';

                field("Guardian Name"; Rec."Guardian Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the student''s guardian.';
                }

                field("Guardian Phone No."; Rec."Guardian phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the guardian''s phone number.';
                }
            }
            group(Accomodation)
            {
                Caption = 'Accomodation';

                field("Hostel Resident"; Rec."Hostel Resident")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the student lives in a university hostel.';

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Hostel Room No."; Rec."Hostel Room No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the hostel room number.';
                    Editable = Rec."Hostel Resident";
                }
            }
        }
        addlast(Content)
        {
            part(Courses; "Student Course Subform")
            {
                ApplicationArea = All;
                Caption = 'Enrolled Units';
                SubPageLink = "Student No." = field("No.");
            }
        }
    }
}