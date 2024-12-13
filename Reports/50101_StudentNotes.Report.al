report 50102 "Student's Notes"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/StudentNotes.rdl';
    Caption = 'Student''s Notes';

    dataset
    {
        dataitem(Student; Student)
        {
            column(CIN; CIN)
            {

            }
            column(First_Name; "First Name")
            {

            }
            column(Last_Name; "Last Name")
            {

            }
            column(Class_Description; "Class Description")
            {

            }
            column(First_Semester_Average; "AVG S1")
            {

            }
            column(Second_Semester_Average; "AVG S2")
            {

            }
            column(Overall_Year_Average; "Overall Year AVG")
            {

            }
            column(Overall_Year_Status; "Over Year Status")
            {

            }
            column(CompanyPicture; CompanyInformation_G.Picture)
            {

            }
            column(CompanyName; CompanyInformation_G.Name)
            {

            }
            column(Companyaddress; CompanyInformation_G.Address)
            {

            }
            column(CompanyPhone; CompanyInformation_G."Phone No.")
            {

            }
            dataitem(Notes; Notes)
            {
                DataItemLinkReference = Student;
                DataItemLink = "CIN" = field(CIN);

                column(Subject_Description; "Subject Description")
                {

                }
                column(Note; Note)
                {

                }
                column(Semester; Semester)
                {

                }
                column(NoteMin_L; NoteMin_L)
                {

                }
                column(NoteMax_L; NoteMax_L)
                {

                }

                trigger OnAfterGetRecord()
                var
                    Student_L: Record Student;
                    Note_L: Record Notes;

                begin
                    NoteMax_L := 0;
                    NoteMin_L := 0;

                    Student_L.Reset();
                    Student_L.SetRange(Class, Student.Class);

                    if Student_L.FindSet() then
                        repeat
                            Note_L.Reset();
                            Note_L.SetRange("CIN", Student_L.CIN);
                            Note_L.SetRange("Subject", Notes."Subject");

                            if Note_L.FindSet() then begin
                                NoteMax_L := Note_L.Note;
                                NoteMin_L := Note_L.Note;
                                repeat
                                    if Note_L.Note > NoteMax_L then
                                        NoteMax_L := Note_L.Note;
                                    if Note_L.Note < NoteMin_L then
                                        NoteMin_L := Note_L.Note;
                                until Note_L.Next() = 0;
                            end;
                        until Student_L.Next() = 0;


                end;
            }

            trigger OnPreDataItem()
            begin
                CompanyInformation_G.Get();
                CompanyInformation_G.CalcFields(Picture);
            end;




        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }



    var
        CompanyInformation_G: Record "Company Information";
        NoteMax_L: Decimal;
        NoteMin_L: Decimal;
}