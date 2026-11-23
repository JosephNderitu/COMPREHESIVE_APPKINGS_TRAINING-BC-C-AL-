page 50111 "Student List"
{
    Caption = 'Students';
    PageType = List;
    SourceTable = Student;
    CardPageId = "Student Card";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the student number.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the last name.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the e-mail address.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the phone number.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the student status.';
                }
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ToolTip = 'Specifies when the student enrolled.';
                }
            }
        }
    }
}