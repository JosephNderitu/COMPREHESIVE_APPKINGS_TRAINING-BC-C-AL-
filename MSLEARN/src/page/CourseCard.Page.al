page 50114 "Course Card"
{
    Caption = 'Course Card';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CourseTable;

    layout
    {
        area(Content)
        {

            group(General)
            {
                Caption = 'General';
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the course code, for example BIT2203.';
                    ShowMandatory = true;
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the course title.';
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a short description of the course.';
                    MultiLine = true;
                }
            }
            group(Academics)
            {
                Caption = 'Academics';

                field("Credit Hours"; Rec."Credit Hours")
                {
                    ToolTip = 'Specifies the credit hours of the course.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies whether the course is closed to new enrolments.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}