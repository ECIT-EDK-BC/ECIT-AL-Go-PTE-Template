codeunit 80100 "EDK TestInstall TEST"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        ALTestSuite: Record "AL Test Suite";
        ALTestSuiteMgt: Codeunit "Test Suite Mgt.";
        SuiteNameLbl: Label 'DEFAULT', Locked = true;
    begin
        if not ALTestSuite.Get(SuiteNameLbl) then begin
            ALTestSuite.Init();
            ALTestSuite.Name := CopyStr(SuiteNameLbl, 1, MaxStrLen(ALTestSuite.Name));
            ALTestSuite.Insert(true);
        end;

        ALTestSuiteMgt.DeleteAllMethods(ALTestSuite); //Outcomment if you need to keep the test methods in the test suite
        ALTestSuiteMgt.SelectTestMethodsByRange(ALTestSuite, '80101..80103'); //If you add more test codeunits add them to this range to include them in the test suite as default
    end;
}