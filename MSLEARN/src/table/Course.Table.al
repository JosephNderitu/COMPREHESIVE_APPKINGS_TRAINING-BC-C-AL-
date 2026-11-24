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

}