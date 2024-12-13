table 50103 Notes
{
    DataClassification = ToBeClassified;
    Caption = 'Notes';

    fields
    {
        field(1; CIN; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'CIN';

        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }
        field(3; Subject; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Subject';
            TableRelation = Subjects;
            trigger OnValidate()
            var
                Subject_L: Record Subjects;
                Notes_L: Record Notes;
                ErrorMsg_L: Label 'You have already affected the note %1 to %2';
            begin
                if Subject_L.Get(Rec.Subject) then
                    Rec.Validate("Subject Description", Subject_L.Description);

                Notes_L.Reset();
                Notes_L.SetRange(CIN, Rec.CIN);
                Notes_L.SetRange(Subject, Rec.Subject);
                Notes_L.SetRange(Semester, Rec.Semester);
                if Notes_L.FindFirst() then
                    Error(ErrorMsg_L, Notes_L.Note, Notes_L."Subject Description");

            end;
        }
        field(4; "Subject Description"; Text[150])
        {
            DataClassification = ToBeClassified;
            Caption = 'Subject Description';
        }
        field(5; Note; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Note';
        }
        field(6; Semester; Enum Semester)
        {
            DataClassification = ToBeClassified;
            Caption = 'Semester';
        }

    }

    keys
    {
        key(Key1; CIN, "Line No.")
        {
            Clustered = true;
        }
    }


    var
        myInt: Integer;

    trigger OnInsert()
    var
        Note_L: Record Notes;

    begin
        Note_L.FindLast();
        Rec."Line No." := Note_L."Line No." + 100;
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