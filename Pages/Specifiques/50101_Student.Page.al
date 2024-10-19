page 50101 Student
{
    PageType = Card;
    SourceTable = Student;
    Caption = 'Student Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(CIN; Rec.CIN)
                {
                    ApplicationArea = All;

                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = All;
                }



            }
            group(ClassInfo)
            {
                Caption = 'Class';
                field(Class; Rec.Class)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin

                    end;
                }
                field("Class Description"; Rec."Class Description")
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