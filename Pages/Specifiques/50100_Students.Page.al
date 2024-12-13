page 50100 Students
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Student;
    Caption = 'Student List';
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
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
                field(Class; Rec.Class)
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
            action(StudentList)
            {
                ApplicationArea = all;
                Caption = 'Student List';
                Image = CustomerList;
                Promoted = true;
                PromotedCategory = Report;
                RunObject = report 50100;
            }
            action(Notes)
            {
                Caption = 'Notes';
                Image = NewProperties;
                Promoted = true;
                PromotedCategory = Report;
                ApplicationArea = All;
                trigger OnAction()
                var
                    Student_L: Record Student;
                    StudentNote_L: Report "Student's Notes";
                begin
                    CurrPage.SetSelectionFilter(Student_L);
                    StudentNote_L.SetTableView(Student_L);
                    StudentNote_L.Run();
                end;
            }
            action(CalsFirstSemesterAVG)
            {
                Caption = 'Calculate First Semester Average';
                Promoted = true;
                PromotedCategory = Process;
                Image = CalculateDiscount;
                ApplicationArea = ALL;

                trigger OnAction()
                var
                    AVGCalcMgt_L: Codeunit "Average Calculation Management";
                    SemesterAVG_L: Decimal;
                    Message_L: Label 'The semester average of %1 %2 is %3';
                    Semester_L: Enum Semester;
                begin
                    //  SemesterAVG_L := AVGCalcMgt_L.CalcSemesterAvg(Rec.CIN);
                    //  Message(Message_L, Rec."First Name", Rec."Last Name", Format(SemesterAVG_L));
                    AVGCalcMgt_L.CalcSemesterAvg(Rec.CIN, Semester_L::S1);
                end;
            }
            action(CalsSecondSemesterAVG)
            {
                Caption = 'Calculate Second Semester Average';
                Promoted = true;
                PromotedCategory = Process;
                Image = CalculateDiscount;
                ApplicationArea = ALL;

                trigger OnAction()
                var
                    AVGCalcMgt_L: Codeunit "Average Calculation Management";
                    SemesterAVG_L: Decimal;
                    Message_L: Label 'The semester average of %1 %2 is %3';
                    Semester_L: Enum Semester;
                begin
                    //  SemesterAVG_L := AVGCalcMgt_L.CalcSemesterAvg(Rec.CIN);
                    //  Message(Message_L, Rec."First Name", Rec."Last Name", Format(SemesterAVG_L));
                    AVGCalcMgt_L.CalcSemesterAvg(Rec.CIN, Semester_L::S2);
                end;
            }
            action(CalsOverallYearAVG)
            {
                Caption = 'Calculate Overall Year Average';
                Promoted = true;
                PromotedCategory = Process;
                Image = Calculate;
                ApplicationArea = ALL;

                trigger OnAction()
                var
                    AVGCalcMgt_L: Codeunit "Average Calculation Management";
                    ConfirmMessage_L: Label 'Are your that you wont to calculate this student''s Averall year average ?';
                begin
                    if Confirm(ConfirmMessage_L, false) then
                        AVGCalcMgt_L.CalcOverallYearAvg(Rec.CIN)
                    else
                        exit;

                end;
            }
        }
    }
}