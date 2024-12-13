page 50104 "Number of Passed Student"
{
    Caption = 'Number of Passed Student';
    PageType = CardPart;
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            Cuegroup(General)
            {
                Caption = 'General';

                field("Number Of Student Succeeded"; Rec."Number Of Student Succeeded")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number Of Student Succeeded field.', Comment = '%';
                    DrillDownPageId = Students;
                }
                field("Number Of not Student Succeeded"; Rec."Number Of not Student Succeeded")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Number Of Student Not Succeeded field.', Comment = '%';
                    DrillDownPageId = Students;
                }
            }
        }
    }
}
