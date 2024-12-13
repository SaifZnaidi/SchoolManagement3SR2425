tableextension 50102 "Employee Ext" extends Employee //5200
{
    fields
    {
        field(50100; "Job"; Enum Jobs)
        {
            DataClassification = ToBeClassified;
            Caption = 'Job';
        }
    }


}