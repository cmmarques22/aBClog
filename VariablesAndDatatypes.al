codeunit 50110 VariablesAndDatatypes
{
    trigger OnRun()
    begin
        begin
            // String1 := GetLongString();
            String1 := 'HelloworldofManyqweretyuiop';
            String2 := 'camane';
            String3 := 'David';
            Message('length of String1: %1', StrLen(String1)); // 
            Message('maximum length of String1 : %1', MaxStrLen(String1));
            Message('length of String2 :%1', StrLen(String2));
            Message('maximum length of String2 : %1', MaxStrLen(String2));



            Message('copying string1 to string2....mathing....');
            String2 := CopyStr(String1, 1, MaxStrLen(String2));
            String4 := InsStr(String1, ' or '+ String3  , 10);
            // String3 := String1.Substring(1,3);

            Message('string2 is now : %1', String2);
            Message(String3);
                        Message(String4);


            // Message(' 1o string1 é igual a ',String1);
            // Message('2o string1 é igual a ' + String1);

            // Message((' 3o the value of ' + String1 + ' caracters' ));
            // Message(('4o the value of ' + String1 + ' caracters'));
            // Message('5o teste com cifrao +  String1');
        end;

    end;

    var
        Color: Option Red,Green,Blue;
        LoopNo: Integer;
        MyDate: Date;
        MyText: Text;
        LoopNoDec: Decimal;
        String1: Text[60];
        String2: Text[30];
        String3: Text[30];
        String4: Text[30];
        



}