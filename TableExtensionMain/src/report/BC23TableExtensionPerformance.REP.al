/// <summary>
/// Report ProcessData (ID 50000).
/// </summary>
report 50000 BC23TableExtensionPerformance
{
    Caption = 'BC23 Table Extension Performance Check';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(MyTestTable; MyTestTable)
        {
            trigger OnPreDataItem()
            begin
                DataTimeSet := CurrentDateTime;
            end;

            trigger OnAfterGetRecord()
            begin

            end;

            trigger OnPostDataItem()
            begin
                Commit();
                LoopRecordDuration := CurrentDateTime - DataTimeSet;
            end;
        }

        dataitem(MyTestTable2; MyTestTable)
        {
            trigger OnPreDataItem()
            begin
                DataTimeSet := CurrentDateTime;
            end;

            trigger OnAfterGetRecord()
            var
                i: Integer;
            begin
                Amount += 1;
                Modify();
            end;

            trigger OnPostDataItem()
            begin
                Commit();
                ModifyRecordDuration := CurrentDateTime - DataTimeSet;
            end;
        }
    }

    trigger OnPreReport()
    var
        MyTestTable: Record MyTestTable;
        i: Integer;
    begin
        MyTestTable.Reset();
        MyTestTable.DeleteAll();

        DataTimeSet := CurrentDateTime;
        for i := 0 to 100000 do begin
            MyTestTable.Init();
            MyTestTable."No." := i;
            MyTestTable.Description := StrSubstNo('Record %1', i);
            MyTestTable.Amount := i;
            MyTestTable.Insert(true);
        end;
        Commit();
        InsertRecordDuration := CurrentDateTime - DataTimeSet;
    end;

    trigger OnPostReport()
    var
        MyTestTable: Record MyTestTable;
        i: Integer;
    begin
        DataTimeSet := CurrentDateTime;
        MyTestTable.Reset();
        MyTestTable.DeleteAll();
        Commit();
        DeleteRecordDuration := CurrentDateTime - DataTimeSet;

        Message(
            'Insert New Records: %1\' +
            'Loop records: %2\' +
            'Loop and modify records: %3\' +
            'Delete All Records: %4',
            InsertRecordDuration,
            LoopRecordDuration,
            ModifyRecordDuration,
            DeleteRecordDuration
        );
    end;

    var
        DataTimeSet: DateTime;
        DeleteRecordDuration: Duration;
        InsertRecordDuration: Duration;
        LoopRecordDuration: Duration;
        ModifyRecordDuration: Duration;
}