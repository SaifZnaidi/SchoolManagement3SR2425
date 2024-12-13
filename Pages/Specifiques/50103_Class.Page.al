page 50103 Class
{
    PageType = Card;
    SourceTable = Class;
    Caption = 'Class Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Student's Number"; Rec."Student's Number")
                {
                    ApplicationArea = All;
                }
                field(Teacher; Rec.Teacher)
                {
                    ApplicationArea = All;
                }


            }
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

    var
        myInt: Integer;
}

