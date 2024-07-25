page 50131 FindArmstrongNumber
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Find Armstrong Number';

    layout
    {
        area(Content)
        {
            group(RetirarDepois)
            {
                Caption = 'Enter a Start and End Number';

                field(StartNumber; StartNumber)
                {
                    Caption = 'Start Number';
                    ToolTip = 'Start Number';
                    ApplicationArea = All;
                }
                field(EndNumber; EndNumber)
                {
                    Caption = 'End Number';
                    ToolTip = 'End Number';
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetAmstrongNumbers)
            {
                Caption = 'Get Armstrong Numbers';
                ApplicationArea = All;
                Image = FileContract;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ArmstrongCodeunit: Codeunit ArmstrongCodeunit;
                    ArmstrongNumbers: List of [Integer];
                    i: Integer;
                    NumberText: Text;
                    ArmstrongNumbersMessage: Text;
                begin

                    // Loop from StartNumber to EndNumber
                    for i := StartNumber to EndNumber do begin
                        if ArmstrongCodeunit.CheckArmstrongNumber(i) then begin
                            ArmstrongNumbers.Add(i);
                        end;
                    end;

                    // Display the results
                    if ArmstrongNumbers.Count > 0 then begin
                        ArmstrongNumbersMessage := '';
                        foreach i in ArmstrongNumbers do begin
                            NumberText := Format(i);
                            if StrLen(ArmstrongNumbersMessage) > 0 then
                                ArmstrongNumbersMessage += ', ';
                            ArmstrongNumbersMessage += NumberText;
                        end;

                        Message('Found %1 Armstrong numbers: %2', ArmstrongNumbers.Count, ArmstrongNumbersMessage);
                    end else begin
                        Message('No Armstrong numbers found in the given range.');
                    end;
                end;
            }
        }
    }

    var
        StartNumber, EndNumber : Integer;
}