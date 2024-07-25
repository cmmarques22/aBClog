codeunit 50132 ArmstrongCodeunit
{
    trigger OnRun()
    begin

    end;

    // variables
    var
        StartNumber, EndNumber, TempNumber, InputNumber : integer;
        Result, TempResult, Digit : decimal;
        AmstrongList : List of [Integer];


    // procedures

    // Get Power of a digit
    procedure GetPower(Digit: Decimal; PowerValue: Integer): Decimal
    var
        PowerResult: Decimal;
    begin
        PowerResult := Power(Digit, PowerValue);
        exit(PowerResult);
    end;


    // Get Last Digit
    procedure GetLastDigit(TempNumber: Integer): Integer
    var
        TempNumberStr: Text;
        LastDigitStr: Text[1];
        LastDigit: Integer;
        Success: Boolean;

    begin
        TempNumberStr := Format(TempNumber);
        LastDigitStr := CopyStr(TempNumberStr, StrLen(TempNumberStr), 1);
        Success := Evaluate(LastDigit, LastDigitStr);                       // converte de texto para numero


        exit(LastDigit);                                                    // Retorna o último dígito
    end;


    // Sum of Powers of Digits
    procedure SumOfPowersOfDigits(InputNumber: Integer): Decimal
    var
        Sum: Decimal;
        Digit, PowerValue: Integer;
        TempNumber: Integer;
    begin
        Sum := 0;
        TempNumber := InputNumber;


        PowerValue := GetLastDigit(InputNumber);                            // Obter o último dígito do número de entrada para usar como potência

        while TempNumber > 0 do begin
            Digit := GetLastDigit(TempNumber);
            Sum += GetPower(Digit, PowerValue);
            TempNumber := TempNumber DIV 10;                                // Remove o último dígito
        end;

        exit(Sum);
    end;




    // Check Armstrong Number
    procedure CheckArmstrongNumber(InputNumber: Integer): Boolean
    begin
        if InputNumber = SumOfPowersOfDigits(InputNumber) then begin
            AmstrongList.Add(InputNumber);
            exit(true);
        end;
        exit(false);
    end;
}



