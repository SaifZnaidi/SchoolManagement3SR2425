report 50100 "Student List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/StudentList.rdl';
    Caption = 'Student List';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;

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
            column(Class; Class)
            {

            }
            column(Class_Description; "Class Description")
            {

            }



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