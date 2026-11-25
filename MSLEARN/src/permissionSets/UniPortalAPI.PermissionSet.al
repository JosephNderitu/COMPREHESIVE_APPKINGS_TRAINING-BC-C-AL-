permissionset 50100 UniPortalPermission
{
    Assignable = true;
    Caption = 'University Portal API';

    Permissions =
        tabledata Student = R,
        tabledata StudentCourseTable = R,
        tabledata CourseTable = R,
        tabledata "University Setup" = R,
        codeunit "Student Portal API" = X,
        codeunit "Student Portal Mgt" = X,
        page StudentApiPage = X,
        page StudentCourseApiPage = X;

}