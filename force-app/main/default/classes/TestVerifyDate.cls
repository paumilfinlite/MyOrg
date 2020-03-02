@isTest
public class TestVerifyDate {
    @isTest static void testDates(){
        Date D1= VerifyDate.CheckDates(System.today(), System.today()+10);
        Date D2 = VerifyDate.CheckDates(System.today(), System.today()+35);
       // Date D3 = VerifyDate.SetEndOfMonthDate(System.today());
        System.assertEquals(D1,System.today()+10);
        //System.assertEquals(D2,D3);
        
    }
}