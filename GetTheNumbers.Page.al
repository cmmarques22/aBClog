page 50121 GetTheNumbers
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
                field(InputField; InputField)
                {
                    ApplicationArea = All;
                    ToolTip = 'Insert any value';
                    Caption = 'Input';

                }
            }
            group(Output)
            {
                Caption = 'Output ';
                field(Result; Result)
                {
                    ApplicationArea = All;
                    ToolTip = 'Result';
                    Editable = false;
                    Caption = 'Result';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetNumbers)
            {
                ApplicationArea = All;
                Caption = 'Show only Numbers';
                Promoted = true;
                PromotedIsBig = true;
                Image = Action;

                trigger OnAction()
                begin

                    Result := ExtractDigits(InputField);
                end;
            }
        }
    }

    var
        InputField: Text[200];
        Result: Text[200];
    // Lenght: Text[200];

    local procedure ExtractDigits(InputField: Text): Text
    var
        i: integer;
        currentChar: Text[1];
        newString: Text[200];
    begin
        newString := '';
        for i := 1 to StrLen(InputField) do begin
            currentChar := CopyStr(InputField, i, 1);
            if (currentChar in ['0' .. '9']) then
                newString += currentChar;
        end;
        exit(newString);


    end;


}