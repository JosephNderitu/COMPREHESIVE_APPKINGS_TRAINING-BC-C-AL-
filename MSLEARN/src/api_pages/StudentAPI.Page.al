page 50118 StudentApiPage
{
    PageType = API;
    Caption = 'Student';
    APIPublisher = 'university';
    APIGroup = 'registry';
    APIVersion = 'v1.0';
    EntityName = 'student';
    EntitySetName = 'student';
    SourceTable = Student;
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
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';

                }
                field(number; Rec."No.")
                {
                    Caption = 'Number';
                }
                field(firstName; Rec."First Name")
                {
                    Caption = 'First Name';
                }
                field(lastName; Rec."Last Name")
                {
                    Caption = 'Last Name';
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'E-Mail';
                }
                field(phoneNumber; Rec."Phone No.")
                {
                    Caption = 'Phone No.';
                }
                field(dateOfBirth; Rec."Date of Birth")
                {
                    Caption = 'Date of Birth';
                }
                field(gender; Rec.Gender)
                {
                    Caption = 'Gender';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                }
                field(enrollmentDate; Rec."Enrollment Date")
                {
                    Caption = 'Enrollment Date';
                }

                part(enrolments; StudentCourseApiPage)
                {
                    Caption = 'Enrolments';
                    EntityName = 'enrolment';
                    EntitySetName = 'enrolments';
                    SubPageLink = "Student No." = field("No.");
                }
            }
        }
    }
}