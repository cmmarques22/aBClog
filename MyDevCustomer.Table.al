table 50133 MyDevCustomer
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No.';


        }
        field(2; Name; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name';

        }
        field(3; City; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'City';

        }
    }

    keys
    {
        key(PK; No)
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