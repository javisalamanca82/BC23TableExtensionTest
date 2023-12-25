/// <summary>
/// TableExtension MyTestTableExt1 (ID 50000) extends Record MyTestTable.
/// </summary>
tableextension 50000 MyTestTableExt1 extends MyTestTable
{
    fields
    {
        field(50000; "TextTestField1"; Text[50])
        {
            Caption = 'TextTestField1';
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    begin
        TextTestField1 := 'TextTestField1';
    end;

}