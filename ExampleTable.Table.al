table 50140 Example
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1;FieldOne; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
                begin
                    TriggerLog.InsertLogEntry('example field', 'OnValidate1')
                end;

        }
        field(2; FieldTwo; Integer)
        {
            DataClassification = ToBeClassified;


            trigger OnValidate()
                begin
                    TriggerLog.InsertLogEntry('example field', 'OnValidate2')
                end;
        }
    }

    keys
    {
        key(PK; FieldOne)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        TriggerLog : Record TriggerLog;

    trigger OnInsert()

    begin
        TriggerLog.InsertLogEntry('Example','OnInsert')
    end;

    trigger OnModify()
    begin
        TriggerLog.InsertLogEntry('Example','OnModify')

    end;

    trigger OnDelete()
    begin
        TriggerLog.InsertLogEntry('Example','OnDelete')

    end;

    trigger OnRename()
    begin
        TriggerLog.InsertLogEntry('Example','OnRename')

    end;



}