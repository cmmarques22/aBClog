page 50134 DevCustomerPageList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = MyDevCustomer;
    CardPageId = 50135;
    Editable = true;

    layout
    {

        area(Content)
        {

            group(Input)
            {
                Caption = 'Input';
                field(Search; Search)
                {
                    ApplicationArea = All;
                    ToolTip = 'Use * as wildcard';
                    Caption = 'Search by city';


                }
            }

            repeater(GroupName)
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
            action(CopyFromCustomer)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DevCustomer: Record MyDevCustomer;
                    Customer: Record Customer;


                begin
                    if not Search.Contains('*') then
                        Error('Error!!');

                    Clear(DevCustomer);
                    Clear(Customer);

                    Customer.SetFilter(City, Search);
                    // Customer.FindSet();
                    if Customer.FindSet() then begin
                        repeat
                            /* Clear(DevCustomer); */
                            DevCustomer.Init();
                            DevCustomer.No := Customer."No.";
                            DevCustomer.Name := Customer.Name;
                            DevCustomer.City := Customer.City;
                            DevCustomer.Insert(true);
                        until Customer.Next() = 0;
                        Message('Copy completed')
                    end else begin
                        Message('copy error');
                        CurrPage.Update();
                    end;
                end;
            }
            action(EmptyTable)
            {
                ApplicationArea = All;
                Image = Delete;

                trigger OnAction()
                var
                    DevCustomer: Record MyDevCustomer;
                begin
                    Clear(DevCustomer);
                    DevCustomer.Deleteall();
                    CurrPage.Update();
                end;
            }
        }
    }

    var
        Search: Text[200];
}