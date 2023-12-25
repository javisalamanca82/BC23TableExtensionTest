/// <summary>
/// TableExtension MyTestTableExt5 (ID 50004) extends Record MyTestTable.
/// </summary>
tableextension 50004 MyTestTableExt5 extends MyTestTable
{
    fields
    {
        field(50004; "TextTestField5"; Text[50])
        {
            Caption = 'TextTestField5';
            DataClassification = CustomerContent;
        }
    }

    trigger OnInsert()
    begin
        TextTestField5 := 'TextTestField5';
    end;

}