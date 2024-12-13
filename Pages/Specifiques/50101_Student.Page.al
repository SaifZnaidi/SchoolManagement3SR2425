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
                }
                field("Class Description"; Rec."Class Description")
                {
                    ApplicationArea = All;
                }
            }
            group(Averages)
            {
                Caption = 'Averages';
                field("AVG S1"; Rec."AVG S1")
                {
                    ApplicationArea = All;
                }
                field("AVG S2"; Rec."AVG S2")
                {
                    ApplicationArea = All;
                }
                field("Overall Year AVG"; Rec."Overall Year AVG")
                {
                    ApplicationArea = All;
                }
                field("Over Year Status"; Rec."Over Year Status")
                {
                    ApplicationArea = All;
                }

            }
            part(Note; "Note ListPart")
            {
                ApplicationArea = All;
                SubPageLink = CIN = FIELD(CIN);
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {


        }
    }
}