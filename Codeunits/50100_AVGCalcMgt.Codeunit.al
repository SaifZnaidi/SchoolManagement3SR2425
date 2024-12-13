codeunit 50100 "Average Calculation Management"
{
    trigger OnRun()
    begin

    end;

    procedure CalcSemesterAvg(StudentCIN_P: Integer; Semester_P: Enum Semester)
    var
        Student_L: Record Student;
        Notes_L: Record Notes;
        AVG_L: Decimal;
        Counter_L: Integer;
        Subject_L: Record Subjects;
        SuccessMsg_L: Label 'The semester average is inserted with success.';
        ErrorMsg_L: Label 'Something went wrong.';
    begin
        Counter_L := 0;
        AVG_L := 0;
        if Student_L.Get(StudentCIN_P) then begin
            Notes_L.Reset(); // Reset() function is necessary to delete all filter applied to Notes_L
            Notes_L.SetRange(CIN, Student_L.CIN);
            Notes_L.SetRange(Semester, Semester_P);
            if Notes_L.FindSet() then begin // Findset() function in necessary here to render multiple lines
                // Counter_L := Notes_L.Count;
                repeat
                    if Subject_L.Get(Notes_L.Subject) then
                        Counter_L += Subject_L.Coeff;
                    AVG_L += Notes_L.Note * Subject_L.Coeff;
                until Notes_L.Next() = 0;
                AVG_L := AVG_L / Counter_L;
            end;
            if Semester_P = Semester_P::S1 then
                Student_L."AVG S1" := AVG_L
            else
                Student_L."AVG S2" := AVG_L;

            if Student_L.Modify() then // Modify() function is necessary to apply changements
                Message(SuccessMsg_L)
            else
                Message(ErrorMsg_L);
        end;

    end;

    procedure CalcOverallYearAvg(StudentCIN_P: Integer)
    var
        Student_L: Record Student;
        ErrorMsg_L: Label 'Please verify the averages calculations';
        StudentResult_L: Record "Student Results";
    begin
        if Student_L.Get(StudentCIN_P) then begin
            if (Student_L."AVG S1" = 0) OR (Student_L."AVG S2" = 0) then
                Error(ErrorMsg_L);

            Student_L."Overall Year AVG" := (Student_L."AVG S1" + Student_L."AVG S2") / 2;
            Student_L.Modify();

            if Student_L."Overall Year AVG" >= 10 then
                Student_L."Over Year Status" := Student_L."Over Year Status"::Succeed
            else
                Student_L."Over Year Status" := Student_L."Over Year Status"::"Not Succeed";
            Student_L.Modify(); // Modify() function is necessary to apply changements
        end;

        StudentResult_L.Init();
        StudentResult_L.Validate(CIN, StudentCIN_P);
        StudentResult_L.Insert();
        StudentResult_L.Validate("Full Name", Student_L."First Name" + ' ' + Student_L."Last Name");
        StudentResult_L.Validate("Average S1", Student_L."AVG S1");
        StudentResult_L.Validate("Average S2", Student_L."AVG S2");
        StudentResult_L.Validate("OY Average", Student_L."Overall Year AVG");
        StudentResult_L.Validate(Status, Student_L."Over Year Status");
        StudentResult_L.Modify();


    end;


}