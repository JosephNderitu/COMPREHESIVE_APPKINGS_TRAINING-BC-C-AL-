pageextension 50111 StudentListExtension extends "Student List"
{
    layout
    {
        // Add changes to page layout here
        addlast(Group)
        {
            field("Hostel Resident"; Rec."Hostel Resident")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether the student lives in a university hostel.';
            }
        }
    }
}