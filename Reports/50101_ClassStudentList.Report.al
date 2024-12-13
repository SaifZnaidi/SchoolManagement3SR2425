report 50101 "Class Student List"
{


    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ClassStudentList.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Class Student List';

    dataset
    {
        dataitem(Class; Class)
        {
            // CalcFields = "Student's Number";
            column(Code; Code)
            {

            }
            column(Description; Description)
            {

            }
            column(Student_s_Number; "Student's Number")
            {

            }


            dataitem(Student; Student)
            {
                DataItemLink = Class = field(code);
                column(CIN; CIN)
                {

                }
                column(First_Name; "First Name")
                {

                }
                column(Last_Name; "Last Name")
                {

                }
            }
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                CalcFields("Student's Number");
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
        myInt: Integer;
}