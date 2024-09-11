pageextension 50136 ItemListExt extends "Item List"
{
    Editable = true;
    layout
    {
        addafter(InventoryField)
        {
            field(Availability; Availability)
            {
                Caption = 'Availability';
                ToolTip = 'Calculated as Inventory + "Qty. on Purch. Order" - "Qty. on Sales Order"';
                StyleExpr = "AvailabilityStyle";
                ApplicationArea = all;

            }
        }


    }
    actions
    {
        addlast(Functions)
        {
            action(CalculateAvailability)
            {
                ApplicationArea = all;
                Caption = 'Calculate Availability of Selected Items';
                ToolTip = 'Calculate the total availability of the selected items.';
                ShortcutKey = 'Shift+Ctrl+A';


                trigger OnAction()
                begin
                    CalculateAvailabilitySelected();
                end;

            }
        }
    }

      local procedure CalculateAvailabilitySelected()
    var
        ItemRec: Record Item;
        TotalAvailability: Decimal;
    begin
        // Set selection filter to only work with selected records
        CurrPage.SetSelectionFilter(ItemRec);

        // Check if any items are selected
        if ItemRec.IsEmpty() then
            Error('No items are selected.');

        // Iterate through selected records and calculate total availability
        TotalAvailability := 0;
        if ItemRec.FindSet() then
            repeat
            ItemRec.CalcFields(ItemRec."Qty. on Purch. Order", itemrec."Qty. on Sales Order", itemrec.Inventory);
            TotalAvailability += ItemRec.Inventory + ItemRec."Qty. on Purch. Order" - ItemRec."Qty. on Sales Order";
            until ItemRec.Next() = 0;

        // Display the total availability
        Message('The total availability of the selected items is %1.', TotalAvailability);
    end;




    var
        AvailabilityStyle: Text;
        Availability: Integer;

    trigger OnAfterGetRecord()

    begin


        rec.CalcFields(Rec.Inventory, rec."Qty. on Purch. Order", rec."Qty. on Sales Order");
        Availability := rec.Inventory + rec."Qty. on Purch. Order" - rec."Qty. on Sales Order";

        if Availability = rec.Inventory then AvailabilityStyle := 'Standard';
        if Availability < rec.Inventory then AvailabilityStyle := 'Attention';
        if Availability > rec.Inventory then AvailabilityStyle := 'Favorable';
    end;







}
