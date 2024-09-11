page 50139 TriggerLogPageList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TriggerLog;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(TEntryNo; Rec.TEntryNo)
                {
                    ToolTip = 'Entry No. field.', Comment = '%';
                }
                field(TObjectName; Rec.TObjectName)
                {
                    ToolTip = 'Object Name field.', Comment = '%';
                }
                field(TTriggerName; Rec.TTriggerName)
                {
                    ToolTip = 'Trigger Name field.', Comment = '%';
                }
                field(TTime_Stamp; Rec.TTime_Stamp)
                {
                    ToolTip = 'Time_Stamp field.', Comment = '%';
                }
            }
        }
        area(Factboxes)
        {

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
}