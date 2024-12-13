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
            trigger OnPreDataItem()

            begin
                if ClassCode_G <> '' then
                    Student.SetRange(Class, ClassCode_G);
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
                    field(ClassCode_G; ClassCode_G)
                    {
                        ApplicationArea = All;
                        Caption = 'Class';
                        TableRelation = Class;
                    }

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


    trigger OnPreReport()
    var
        myInt: Integer;
    begin

    end;

    var
        ClassCode_G: Code[50];
}