page 50110 "University Setup"
{
    Caption = 'University Setup';
    PageType = Card;
    SourceTable = "University Setup";
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';

                field("Student Nos."; Rec."Student Nos.")
                {
                    ToolTip = 'Specifies the number series used to assign numbers to new students.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}