page 50118 PriceCalculator
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                group(Ileft)
                {
                    field(Quantity; Quantity)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Enter a value';
                        Caption = 'Quantity';
                    }
                }
                group(IRight)
                {
                    field(Price; Price)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Enter a price';
                        Caption = 'Price';
                    }

                }

            }
            group(Output)
            {
                group(OLeft)
                {
                    Caption = 'Output Left';
                    field(Result; Result)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Result';
                        Editable = false;
                        Caption = 'Result';
                    }
                    field(TotalSales; TotalSales)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Total Sales';
                        Editable = false;
                        Caption = 'Total Sales';
                    }
                }
                group(ORight)
                {
                    field(TotalCredits; TotalCredits)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Total Credits';
                        Editable = false;

                        Caption = 'Total Credits';
                    }
                    field(GrandTotal; GrandTotal)
                    {
                        ApplicationArea = All;
                        ToolTip = 'GrandTotal';
                        Editable = false;
                        Caption = 'GrandTotal';
                    }
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Execute';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    if (Quantity <> 0) OR (Price <> 0) then
                        Result := Quantity * Price;
                    if Result < 0 then
                        TotalCredits += Result
                    else
                        TotalSales +=  Result;

                    GrandTotal += Result;
                    //no support for ternary?
                    //(Result >= 0) ? TotalCredits := Result + TotalCredits : TotalSales := Result + TotalSales;
                end;
            }
            action(Clear)
            {
                ApplicationArea = All;
                Caption = 'Clear';
                ToolTip = 'Clear';
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                begin
                    ClearAll();
                end;
            }
        }
    }


    var
        Quantity, Price, Result, TotalSales, TotalCredits, GrandTotal : Decimal;


}