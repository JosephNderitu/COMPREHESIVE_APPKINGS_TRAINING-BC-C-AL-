/// <summary>
/// this is an xml code block
/// here we can be able to add any thing and it wont be executed 
/// </summary>
/// <remark>
/// this is a remark block  
/// </remark>

page 50111 "Expressions Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Expressions Card';
    Editable = true;

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                    Tooltip = 'Enter the first value.';
                    Caption = 'Value 1';

                    trigger OnValidate()
                    begin
                        Sum := Value1 + Value2;
                    end;
                }
                field(Value2; Value2)
                {
                    ApplicationArea = All;
                    Tooltip = 'Enter the second value.';
                    Caption = 'Value 2';

                    trigger OnValidate()
                    begin
                        Sum := Value1 + Value2;
                    end;
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Result; Result)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Tooltip = 'The result of the expression.';
                    Caption = 'Result';
                }
                field(Sum; Sum)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Tooltip = 'The sum of Value 1 and Value 2.';
                    Caption = 'Sum';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                Caption = 'Calculate';
                Tooltip = 'Calculate the result of the expression.';
                Image = ExecuteBatch;

                trigger OnAction()
                begin
                    Result := value1 > value2;
                    message('The result of the expression is: %1', Result);
                end;
            }
        }
    }

    var
        Value1: Integer;
        Value2: Integer;
        Result: Boolean;
        Sum: Integer;
}