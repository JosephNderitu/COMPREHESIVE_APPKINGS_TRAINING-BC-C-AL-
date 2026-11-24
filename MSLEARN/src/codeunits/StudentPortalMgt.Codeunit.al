using System.Security.Encryption;

codeunit 50100 "Student Portal Mgt"
{
    Access = Internal;
    procedure SetInitialPassword(var Student: Record Student): Text
    var
        Password: Text;
    begin
        Student.TestField("Portal Username");
        Password := NewToken(12);
        StorePassword(Student, Password);
        Student."Portal Password Must Change" := true;
        Student.Modify(true);
        exit(Password);
    end;

    procedure VerifyPassword(Student: Record Student; Password: Text): Boolean
    begin
        if (Student."Portal Password Hash" = '') or (Password = '') then
            exit(false);
        exit(Student."Portal Password Hash" = ComputeHash(Student."Portal Password Salt", Password));
    end;

    local procedure StorePassword(var Student: Record Student; Password: Text)
    var
        Salt: Text;
    begin
        Salt := NewToken(32);
        Student."Portal Password Salt" := CopyStr(Salt, 1, MaxStrLen(Student."Portal Password Salt"));
        Student."Portal Password Hash" := CopyStr(ComputeHash(Salt, Password), 1, MaxStrLen(Student."Portal Password Hash"));
    end;

    local procedure ComputeHash(Salt: Text; Password: Text): Text
    var
        CryptographyManagement: Codeunit "Cryptography Management";
        HashAlgorithmType: Option MD5,SHA1,SHA256,SHA384,SHA512;
    begin
        exit(CryptographyManagement.GenerateHash(Salt + Password, HashAlgorithmType::SHA256));
    end;

    local procedure NewToken(Length: Integer): Text
    begin
        exit(CopyStr(DelChr(Format(CreateGuid()), '=', '{}-'), 1, Length));
    end;

    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;
}