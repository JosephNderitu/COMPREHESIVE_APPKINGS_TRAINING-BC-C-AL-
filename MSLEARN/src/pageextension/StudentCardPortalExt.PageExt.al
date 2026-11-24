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
    actions
    {
        addlast(Processing)
        {
            action(SetPortalPassword)
            {
                ApplicationArea = All;
                Caption = 'Set Portal Password';
                ToolTip = 'Generates a new portal password for the student and shows it once.';

                trigger OnAction()
                var
                    PortalMgt: Codeunit "Student Portal Mgt";
                    NewPassword: Text;
                begin
                    Rec.TestField("Portal Username");
                    if not Confirm(ConfirmQst, false, Rec."Portal Username") then
                        exit;

                    NewPassword := PortalMgt.SetInitialPassword(Rec);
                    CurrPage.Update(false);
                    Message(PasswordMsg, Rec."Portal Username", NewPassword);
                end;
            }
        }
    }

    var
        ConfirmQst: Label 'Set a new portal password for %1? Any existing password will stop working.';
        PasswordMsg: Label 'Portal password for %1: %2\Give it to the student now. It is shown only once, and the student must change it at first login.';
}