page 50141 ExampleCard
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Example;

    layout
    {
        area(Content)
        {
            group(General)
            {

                field(FieldOne; Rec.FieldOne)
                {
                    ToolTip = 'Specifies the value of the FieldOne field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        TriggerLog.InsertLogEntry('example card', 'examplevalidate1')
                    end;
                }
                field(FieldTwo; Rec.FieldTwo)
                {
                    ToolTip = 'Specifies the value of the FieldTwo field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        TriggerLog.InsertLogEntry('example card', 'examplevalidate2')
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
var
        Triggerlog: Record TriggerLog;
    trigger OnAfterGetCurrRecord()

    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnAfterGetCurrRecord');
    end;

    trigger OnAfterGetRecord()
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnAfterGetRecord');
    end;

    trigger OnClosePage()
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnClosePage');
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnDeleteRecord');
    end;

    trigger OnFindRecord(Which: Text): Boolean
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnFindRecord');
    end;

    trigger OnInit()
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnInit');
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnInsertRecord');
    end;

    trigger OnModifyRecord(): Boolean
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnModifyRecord');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnNewRecord');
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnNextRecord');
    end;

    trigger OnOpenPage()
    begin
        TriggerLog.InsertLogEntry('Example Card Page', 'OnOpenPage');
    end;

}