/// <summary>
/// TableExtension MyTestTableExt1 (ID 50002) extends Record MyTestTable.
/// </summary>
tableextension 50002 MyTestTableExt3 extends MyTestTable
{
    fields
    {
        field(50002; "TextTestField3"; Text[50])
        {
            Caption = 'TextTestField3';
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    begin
        TextTestField3 := 'TextTestField3';
    end;

}