table 50100 Student
{
    DataClassification = ToBeClassified;
    Caption = 'Student';

    fields
    {
        field(1; CIN; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'CIN';
            trigger OnValidate()
            var
                ErorMsg_L: Label 'The CIN should be 8 caracters';
            begin
                if StrLen(Format(Rec.CIN)) <> 8 then
                    Error(ErorMsg_L);
            end;
        }
        field(2; "First Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'First Name';
        }
        field(3; "Last Name"; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Name';
        }
        field(4; "Birth Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Birth Date';
        }
        field(5; Class; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Class';
            TableRelation = Class;

            trigger OnValidate()
            var
                Class_L: Record Class;
            begin
                if Class_L.Get(Rec.Class) then
                    Validate(Rec."Class Description", Class_L.Description);
            end;
        }
        field(6; "Class Description"; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Class Description';
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
        field(7; "AVG S1"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'AVG S1';
            Editable = false;
        }
        field(8; "AVG S2"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'AVG S2';
            Editable = false;
        }
        field(9; "Overall Year AVG"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Overall Year AVG';
            Editable = false;
        }
        field(10; "Over Year Status"; Enum "Over Year Status")
        {
            Caption = 'Over Year Status';
            DataClassification = ToBeClassified;
            //Editable = false;

        }
        field(11; "Number Of Student Succeeded"; Integer)
        {
            //DataClassification = ToBeClassified;
            Caption = 'Number Of Student Succeeded';
            FieldClass = FlowField;
            CalcFormula = count(Student where("Over Year Status" = filter(Succeed)));
        }

        field(12; "Number Of not Student Succeeded"; Integer)
        {
            //DataClassification = ToBeClassified;
            Caption = 'Number Of Student Succeeded';
            FieldClass = FlowField;
            CalcFormula = count(Student where("Over Year Status" = filter("Not Succeed")));
        }
    }

    keys
    {
        key(Key1; CIN)
        {
            Clustered = true;
        }

    }

    fieldgroups
    {

    }

    var


    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;



}