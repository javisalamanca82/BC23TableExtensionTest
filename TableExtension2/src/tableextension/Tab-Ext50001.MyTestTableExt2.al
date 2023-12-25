/// <summary>
/// TableExtension MyTestTableExt1 (ID 50001) extends Record MyTestTable.
/// </summary>
tableextension 50001 MyTestTableExt2 extends MyTestTable
{
    fields
    {
        field(50001; "TextTestField2"; Text[50])
        {
            Caption = 'TextTestField2';
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    begin
        TextTestField2 := 'TextTestField2';
    end;

}