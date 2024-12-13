table 50101 Class
{
    DataClassification = ToBeClassified;
    Caption = 'Class';

    fields
    {
        field(1; Code; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(2; Description; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
        }
        field(3; "Student's Number"; Integer)
        {
            Caption = 'Student''s Number';
            FieldClass = FlowField;
            CalcFormula = count(Student where(Class = field(Code)));
            Editable = false;
        }
        field(4; Teacher; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Teacher';
            TableRelation = Employee where(Job = const(Teacher));
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

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