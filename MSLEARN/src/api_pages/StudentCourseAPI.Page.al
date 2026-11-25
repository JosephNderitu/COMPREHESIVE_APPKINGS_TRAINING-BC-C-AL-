page 50117 StudentCourseApiPage
{
    PageType = API;
    Caption = 'Enrollment';
    APIPublisher = 'university';
    APIGroup = 'registry';
    APIVersion = 'v1.0';
    EntityName = 'enrolment';
    EntitySetName = 'enrolments';
    SourceTable = StudentCourseTable;
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'Id';
                }
                field(studentNumber; Rec."Student No.")
                {
                    Caption = 'Student Number';
                }
                field(courseCode; Rec."Course Code")
                {
                    Caption = 'Course Code';
                }
                field(courseTitle; Rec."Course Title")
                {
                    Caption = 'Course Title';
                }
                field(academicYear; Rec."Academic Year")
                {
                    Caption = 'Academic Year';
                }
                field(enrollmentStatus; Rec."Enrollment Status")
                {
                    Caption = 'Enrolment Status';
                }
                field(enrollmentDate; Rec."Enrollment Date")
                {
                    Caption = 'Enrolment Date';
                }
            }
        }
    }
}