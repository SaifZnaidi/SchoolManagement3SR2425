page 50108 "Subject Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Subjects;
    Caption = 'Subject Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = ALl;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALl;
                }
                field(Coeff; Rec.Coeff)
                {
                    ApplicationArea = ALl;
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