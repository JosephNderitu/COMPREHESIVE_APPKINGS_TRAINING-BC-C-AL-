table 50102 CourseTable
{
    Caption = 'Course';
    DataClassification = ToBeClassified;
    LookupPageId = CourseList;
    DrillDownPageId = CourseList;


    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;

        }
        field(2; Title; Text[100])
        {
            Caption = 'Title';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; "Credit Hours"; Integer)
        {
            Caption = 'Credit Hours';
            BlankZero = true;
            MinValue = 0;
            MaxValue = 20;
        }
        field(5; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(6; "No. of Students"; Integer)
        {
            Caption = 'No. of Students';
            FieldClass = FlowField;
            CalcFormula = count(StudentCourseTable where("Course Code" = field(Code), "Enrollment Status" = const(Enrolled)));
            Editable = false;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
        fieldgroup(DropDown; Code, Title, "Credit Hours")
        {

        }
    }
    var
        HasEnrolmentsErr: Label 'Course %1 has enrolments and cannot be deleted. Delete the enrolments first.';

    trigger OnDelete()
    var
        StudentCourse: Record StudentCourseTable;
    begin
        StudentCourse.SetRange("Course Code", Code);
        if not StudentCourse.IsEmpty() then begin
            Error(HasEnrolmentsErr, Code);
        end;
    end;

}