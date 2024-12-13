page 50107 "Subject List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Subjects;
    Caption = 'Subject List';
    CardPageId = "Subject Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
}