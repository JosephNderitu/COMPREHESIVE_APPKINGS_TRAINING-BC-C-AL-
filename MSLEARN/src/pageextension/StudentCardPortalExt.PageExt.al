pageextension 50113 StudentCardPortalExtension extends "Student Card"
{
    layout
    {
        // Add changes to page layout here
        addlast(Content)
        {
            group(StudentPortal)
            {
                Caption = 'Student Portal';
                field("Portal Username"; Rec."Portal Username")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the username the student uses to log in to the student portal.';
                }
                field("Portal Enabled"; Rec."Portal Enabled")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the student can log in to the student portal.';
                }
                field("Portal Password Must Change"; Rec."Portal Password Must Change")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies that the student must choose a new password at the next login.';
                }
            }
        }
    }
}