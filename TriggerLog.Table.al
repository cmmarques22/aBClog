table 50138 TriggerLog
{

    fields
    {
        field(1; TEntryNo; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
            Editable = false;

        }
        field(2; TObjectName; Text[50])
        {
            Caption = 'Object Name';

        }
        field(3; TTriggerName; Text[100])
        {
            Caption = 'Trigger Name';
        }
        field(4; TTime_Stamp; Datetime)
        {
            Caption = 'Time_Stamp';
        }
    }

    keys
    {
        key(OK; TEntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }



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

    procedure InsertLogEntry(ObjectName: Text[100]; TriggerName: Text[100]): Text
    var
        LogRec: Record TriggerLog;
        Entry_No: Integer;
    begin
        Clear(LogRec);

        Clear(Entry_No);
        if LogRec.FindLast() then
            Entry_No := LogRec.TEntryNo + 1
        else
            Entry_No := 1;

        Clear(LogRec);
        LogRec.TEntryNo := Entry_No;
        LogRec.TObjectName := ObjectName;
        LogRec.TTriggerName := TriggerName;
        LogRec.TTime_Stamp := CurrentDateTime();
        LogRec.Insert(true);

    end;


    procedure ClearLogEntries()
    var
        LogRec: Record TriggerLog;
    begin
        Clear(LogRec);
        if not LogRec.IsEmpty() then
            if Confirm('Are you sure you want to delete all trigger log entries?') then

            LogRec.DeleteAll();
    end;









}