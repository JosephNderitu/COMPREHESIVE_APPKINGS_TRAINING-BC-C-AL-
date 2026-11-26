codeunit 50101 "Student Portal API"
{
    procedure ValidateLogin(username: Text; password: Text): Text
    var
        Student: Record Student;
        PortalMgt: Codeunit "Student Portal Mgt";
        Result: JsonObject;
        ResultText: Text;
        Info: Text;
    begin
        Info := StrSubstNo('company=%1;userLen=%2;pwLen=%3', CompanyName(), StrLen(username), StrLen(password));

        if (username = '') or (password = '') then
            exit('DEBUG:NO_INPUT;' + Info);

        Student.SetRange("Portal Username", CopyStr(username, 1, MaxStrLen(Student."Portal Username")));
        if not Student.FindFirst() then
            exit('DEBUG:NO_USER;' + Info);
        if not Student."Portal Enabled" then
            exit('DEBUG:DISABLED;' + Info);
        if Student."Portal Password Hash" = '' then
            exit('DEBUG:NO_PASSWORD_SET;' + Info);
        if not PortalMgt.VerifyPassword(Student, password) then
            exit('DEBUG:BAD_PASSWORD;' + Info);

        Result.Add('studentNo', Student."No.");
        Result.Add('mustChange', Student."Portal Password Must Change");
        Result.WriteTo(ResultText);
        exit(ResultText);
    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}