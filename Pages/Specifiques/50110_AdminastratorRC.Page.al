page 50110 "Administrator RoleCenter"
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part("Number of Passed Student"; "Number of Passed Student")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(Student)
            {
                Caption = 'Student';
                RunObject = Page Student;
                ApplicationArea = All;
                RunPageMode = Create;
            }
            action(Class)
            {
                Caption = 'Class';
                RunObject = Page Class;
                ApplicationArea = All;
                RunPageMode = Create;
            }
            action(Subject)
            {
                Caption = 'Subject';
                RunObject = Page "Subject Card";
                ApplicationArea = All;
                RunPageMode = Create;
            }
        }
        area(Sections)
        {
            group(Exams)
            {
                Caption = 'Exams';
                action("Subject List")
                {
                    ApplicationArea = All;
                    RunObject = Page "Subject List";
                }
                action("Class List")
                {
                    ApplicationArea = All;
                    RunObject = Page Classes;
                }
            }
            group(HR)
            {
                Caption = 'HR';
                action("Employees")
                {
                    ApplicationArea = All;
                    RunObject = Page "Employee List";
                }
                action("Teachers")
                {
                    ApplicationArea = All;
                    RunObject = Page Teachers;
                }
                Action(Students)
                {
                    ApplicationArea = All;
                    RunObject = Page Students;
                }
            }
        }
        area(Embedding)
        {
            action("Student List")
            {
                ApplicationArea = All;
                RunObject = report "Student List";
            }
        }
    }
}