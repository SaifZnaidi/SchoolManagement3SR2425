page 50106 Teachers
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Employee;
    Caption = 'Teachers';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = All;
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetRange(Job, Rec.Job::Teacher);
    end;
}