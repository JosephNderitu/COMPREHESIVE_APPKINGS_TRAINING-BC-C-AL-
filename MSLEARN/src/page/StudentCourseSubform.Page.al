page 50135 "Student Course Subform"
{
    Caption = 'Enrolled Units';
    PageType = ListPart;
    SourceTable = StudentCourseTable;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Course Code"; Rec."Course Code")
                {
                    ToolTip = 'Specifies the course.';
                }
                field("Course Title"; Rec."Course Title")
                {
                    ToolTip = 'Specifies the title of the course.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ToolTip = 'Specifies the academic year, for example 2026/2027.';
                }
                field("Enrollment Status"; Rec."Enrollment Status")
                {
                    ToolTip = 'Specifies whether the student is enrolled, has completed, or has dropped the course.';
                }
                field("Enrollment Date"; Rec."Enrollment Date")
                {
                    ToolTip = 'Specifies when the student enrolled.';
                }
            }
        }
    }
}