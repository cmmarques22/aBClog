// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.ProgrammingExercises;
using Microsoft.Sales.Customer;

pageextension 50112 CustomerListPage extends "Customer List"
{
    

    actions
    {

        addfirst("&Customer")
        {
            action(MyAction)
            {

                ApplicationArea = All;
                Caption = 'ActionName';
                ToolTip = 'Click to run MyCodeunit';
                trigger  OnAction()

                var
                VariablesAndDatatypestest: Codeunit VariablesAndDatatypes ;
                begin
                    VariablesAndDatatypestest.Run();
                    

                end;


            }
            
        
            
        }
        
    

}
    
    var
        myInt, FirstValue,SecondValue, Result: Decimal;
        IsBigger, IsSmaller, IsEqual: Boolean;


}

