pageextension 50104 "Employee List Ext" extends "Employee List"
{
    layout
    {
        modify(Comment)
        {
            Visible = false;
        }
        modify("Phone No.")
        {
            Visible = false;
        }
        modify("Mobile Phone No.")
        {
            Visible = true;
        }
        movebefore("Job Title"; "Mobile Phone No.")
        modify("Job Title")
        {
            Visible = false;
        }
        addafter("Mobile Phone No.")
        {
            field(Job; Rec.Job)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}