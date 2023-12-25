/// <summary>
/// TableExtension MyTestTableExt4 (ID 50003) extends Record MyTestTable.
/// </summary>
tableextension 50003 MyTestTableExt4 extends MyTestTable
{
    fields
    {
        field(50003; "TextTestField4"; Text[50])
        {
            Caption = 'TextTestField4';
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    begin
        TextTestField4 := 'TextTestField4';
    end;

}