page 50109 "Note ListPart"
{
    PageType = ListPart;
    SourceTable = Notes;
    Caption = 'Notes';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = All;
                }
                field("Subject Description"; Rec."Subject Description")
                {
                    ApplicationArea = All;
                }
                field(Note; Rec.Note)
                {
                    ApplicationArea = All;
                }
                field(Semester; Rec.Semester)
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
}