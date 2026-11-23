page 50112 "Student Card"
{
    Caption = 'Student Card';
    PageType = Card;
    SourceTable = Student;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the student number.';
                    Importance = Standard;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("First Name"; Rec."First Name") { ToolTip = 'Specifies the first name.'; ShowMandatory = true; }
                field("Last Name"; Rec."Last Name") { ToolTip = 'Specifies the last name.'; ShowMandatory = true; }
                field("Date of Birth"; Rec."Date of Birth") { ToolTip = 'Specifies the date of birth.'; }
                field(Gender; Rec.Gender) { ToolTip = 'Specifies the gender.'; }
                field(Status; Rec.Status) { ToolTip = 'Specifies the student status.'; }
            }
            group(Contact)
            {
                Caption = 'Contact';


                field("E-Mail"; Rec."E-Mail") { ToolTip = 'Specifies the e-mail address.'; }
                field("Phone No."; Rec."Phone No.") { ToolTip = 'Specifies the phone number.'; }
            }
            group(Enrollment)
            {
                Caption = 'Enrollment';

                field("Enrollment Date"; Rec."Enrollment Date") { ToolTip = 'Specifies when the student enrolled.'; }
            }
        }
    }
}