page 50132 DataManipuationExamples
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            // group(GroupName)
            // {
            //     field(Name; Name)
            //     {
            //         ApplicationArea = All;

            //     }
            // }
        }
    }

    actions
    {
        area(Processing)
        {
            action(FindAllRecords)
            {
                ApplicationArea = All;
                Caption = 'Find Records';
                ToolTip = 'Find Records';

                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.FindLast();
                    Message('%1', Customer);

                end;
            }
            action(LoopOverAllVendors)
            {
                ApplicationArea = All;
                Caption = 'Find Vendors';
                ToolTip = 'Find Vendors';
                Image = Find;

                trigger OnAction()
                var
                    vendor: Record Vendor;
                begin
                    Vendor.FindSet();
                    repeat
                        Message('%1', vendor);
                    until vendor.Next() = 0;


                end;
            }
            action(GetItem)
            {
                ApplicationArea = All;
                Caption = 'Get Item';
                ToolTip = 'Get Item';
                Image = Find;

                trigger OnAction()
                var
                    Item: Record Item;
                begin

                    Item.Get('1900-S');
                    if Item.Get('1900-S') then
                        Message('%1', Item)
                    else
                        Error('Not found');
                    // if Item.IsEmpty();
                end;
            }


            action(AtlantaWithLove)
            {
                ApplicationArea = All;
                Caption = 'Find Atlanta Customers';
                ToolTip = 'Find Atlanta Customers';
                Image = Find;
                trigger OnAction()
                var
                    Customers: Record Customer;

                begin
                    Customers.SetFilter(City, 'Cambridge');
                    Customers.FindSet();
                    if Customers.FindSet() then
                        repeat
                            Message('%1', Customers);
                        until Customers.Next() = 0;
                end;
            }
            action(NoLoveForAtlanta)
            {
                ApplicationArea = All;
                Caption = 'Find Customers not from Atlanta';
                ToolTip = 'Find Customers not from Atlanta';
                Image = Find;

                trigger OnAction()
                var
                    CustomersNotAtlanta: Record Customer;
                begin
                    CustomersNotAtlanta.SetFilter(City, '<> Atlanta');
                    CustomersNotAtlanta.FindSet();

                    if CustomersNotAtlanta.FindSet() then
                        repeat
                            Message('%1', CustomersNotAtlanta);
                        until CustomersNotAtlanta.Next() = 0;
                end;
            }
        }
    }
    var
        myInt: Integer;
}
