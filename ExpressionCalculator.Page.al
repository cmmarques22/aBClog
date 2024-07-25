page 50119 ExpressionCalculator
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Expression Calculator';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(FirstValue; FirstValue)


                {
                    ApplicationArea = All;
                    ToolTip = 'Enter a value for First Value.';
                    Caption = 'First Value';
                }
                field(SecondValue; SecondValue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter a value for Second Value.';
                    Caption = 'Second Value';


                }
            }
            group(Output)
            {
                Caption = 'Output';
                Editable = false;

                group(left)
                {
                    field(Result; Result)
                    {
                        ApplicationArea = All;
                        ToolTip = 'The result of the operation.';
                        Caption = 'Result';
                        Editable = false;
                    }
                }
                group(Right)
                {
                    field("Greater or not?"; Comparison)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Greater or not?';
                        Caption = 'Greater or not?';
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Addition)
            {
                ApplicationArea = All;
                Caption = 'Add';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Result := FirstValue + SecondValue;


                end;
            }
            action(Subtraction)
            {
                ApplicationArea = All;
                Caption = 'Sub';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Result := FirstValue - SecondValue;


                end;
            }
            action(Multiplication)
            {
                ApplicationArea = All;
                Caption = 'Mult';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Result := FirstValue * SecondValue;


                end;
            }
            action(Divide)
            {
                ApplicationArea = All;
                Caption = '/';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Result := FirstValue / SecondValue;
                end;
            }
            action(GreaterOrNot)
            {
                ApplicationArea = All;
                Caption = 'IsGreater?';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if FirstValue > SecondValue then
                        Comparison := true
                    else
                        Comparison := false;
                end;
            }


            action(MODulus)
            {
                ApplicationArea = All;
                Caption = 'MOD';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Result := FirstValue MOD SecondValue;


                end;
            }

            action(Divide_INT)
            {
                ApplicationArea = All;
                Caption = 'DIV';
                Image = Calculate;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Result := FirstValue DIV SecondValue;


                end;
            }
        }
    }

    var

        FirstValue, SecondValue : Integer;
        Result: Decimal;

        Comparison, IsEqual : Boolean;
}