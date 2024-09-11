page 50142 ExampleList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Example;
    CardPageId = ExampleCard;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(FieldOne; Rec.FieldOne)
                {
                    ToolTip = 'Specifies the value of the FieldOne field.', Comment = '%';
                }
                field(FieldTwo; Rec.FieldTwo)
                {
                    ToolTip = 'Specifies the value of the FieldTwo field.', Comment = '%';
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