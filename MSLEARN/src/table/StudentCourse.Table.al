table 50103 StudentCourseTable
{
    Caption = 'Student Course';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Student No."; Code[20])
        {
            Caption = 'Student No.';
            NotBlank = true;
            TableRelation = Student;
        }
        field(2; "Course Code"; Code[20])
        {
            Caption = 'Course Code';
            NotBlank = true;
            TableRelation = CourseTable;
        }
        field(3; "Academic Year"; Code[10])
        {
            Caption = 'Academic Year';
            NotBlank = true;
        }
        field(4; "Course Title"; Text[100])
        {
            Caption = 'Course Title';
            FieldClass = FlowField;
            CalcFormula = lookup(CourseTable.Title where(Code = field("Course Code")));
            Editable = false;
        }
        field(5; "Enrollment Status"; Enum EnrollmentStatusEnum)
        {
            Caption = 'Enrollment Status';
        }
        field(6; "Enrollment Date"; Date)
        {
            Caption = 'Enrollment Date';
        }
    }

    keys
    {
        key(PK; "Student No.", "Course Code", "Academic Year")
        {
            Clustered = true;
        }
        Key(CourseKey; "Course Code", "Academic Year")
        {

        }
    }

    trigger OnInsert()
    begin
        if "Enrollment Date" = 0D then begin
            "Enrollment Date" := WorkDate();
        end;
    end;

}