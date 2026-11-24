page 50113 CourseList
{
    Caption = 'Courses';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = CourseTable;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ToolTip = 'Specifies the course code.';
                }
                field(Title; Rec.Title)
                {
                    ToolTip = 'Specifies the course title.';
                }
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
}