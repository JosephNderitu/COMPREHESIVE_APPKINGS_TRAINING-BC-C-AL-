codeunit 50101 "Student Portal API"
{
    procedure ValidateLogin(username: Text; password: Text): Text
    var
        Student: Record Student;
        PortalMgt: Codeunit "Student Portal Mgt";
        Result: JsonObject;
        ResultText: Text;
    begin
        if (username = '') or (password = '') then
            exit('');

        Student.SetRange("Portal Username", CopyStr(username, 1, MaxStrLen(Student."Portal Username")));
        if not Student.FindFirst() then
            exit('');

        if not Student."Portal Enabled" then
            exit('');

        if not PortalMgt.VerifyPassword(Student, password) then
            exit('');

        Result.Add('studentNo', Student."No.");
        Result.Add('mustChange', Student."Portal Password Must Change");
        Result.WriteTo(ResultText);

    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}