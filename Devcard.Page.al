page 50135 Devcard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = MyDevCustomer;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
               
                field(No; Rec.No)
                {
                    ToolTip = 'No.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Name';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'City';
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
        myInt: Integer;
}