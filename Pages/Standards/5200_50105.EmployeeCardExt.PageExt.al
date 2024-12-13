pageextension 50105 "Employee Card Ext" extends "Employee Card"
{
    layout
    {
        modify("Job Title")
        {
            Visible = false;
        }
        addafter("Last Name")
        {
            field(Job; Rec.Job)
            {
                ApplicationArea = All;
            }

        }
        modify(Payments)
        {
            Visible = false;
        }
    }

    actions
    {
        // Add changes to page actions here
    }


}