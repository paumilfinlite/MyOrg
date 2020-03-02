public class headerTestController {
    public Decimal a {get;set;}
    public String result {get;set;}
    public String res {get;set;}


 

    public headerTestController() {
        a = 12345678.00;

        //string result = ConvertCurrencyFormat2(a);
        //result = ConvertCurrencyFormat2(a);
        result = rupeeFormat('12345.19');
    }


    // public String ConvertCurrencyFormat2( Decimal dc) {

    //     String afterPoint = '';
    //     if(dc.indexOf('.') > 0){
    //         afterPoint = dc.substring(dc.indexOf('.'),dc.length);//afterpoint value stored saperately
    //     }
    //     dc = Math.floor(dc);
    //     String x = String.valueOf(dc);
    //     String lastThree = x.substring(x.length-3); //last three saved saperately
    //     String otherNumbers = x.substring(0,x.length-3); //other numner saperated with comma
    //     if(otherNumbers != ''){
    //         lastThree = ',' + lastThree;
    //     }
    //     res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
    // }

    public String ConvertCurrencyFormat2(Decimal dc) {

        String input = String.valueof(dc);
        String afterPoint = '';
        if(input.indexOf('.') > 0){
            afterPoint = input.substring(input.indexOf('.'),input.length());//afterpoint value stored saperately
            System.debug('afterPoint:'+afterPoint);
        }
        Decimal decInput = Math.floor(Decimal.valueOf(input));
        input = String.valueOf(decInput);
        String lastThree = input.substring(input.length()-3); //last three saved saperately
        System.debug('lastThree:'+lastThree);
        String otherNumbers = input.substring(0,input.length()-3); //other numner saperated with comma
        System.debug('otherNumbers:'+otherNumbers);
        if(otherNumbers != ''){
            lastThree = ',' + lastThree;
        }
        String res = otherNumbers.replace('/\\B(?=(\\d{2})+(?!\\d))/g', ',') + lastThree + afterPoint;
        return res;
    }

    // public String ConvertCurrencyFormat2(Decimal dc) {
    //     Decimal amount = 1000000.00;
    //     List<String> args = new String[]{'0','number','##,##,##,##0.00'};
    //     String stringFormat = String.format(dc.format(), args);
    //     System.debug('stringFormat:'+stringFormat);
    //     return stringFormat;
    // }

    // public String getIndianCurrencyFormat(String amount) {
    //     String finalString = '';
    //     String amountArray[] = amount.toCharArray();
    //     int a = 0, b = 0;
    //     for (int i = amountArray.length - 1; i >= 0; i--) {
    //         if (a < 3) {
    //             //stringBuilder.append(amountArray[i]);
    //             finalString += amountArray[i];
    //             a++;
    //         } else if (b < 2) {
    //             if (b == 0) {
    //                 finalString += ',';//stringBuilder.append(',');
    //                 finalString += amountArray[i];//stringBuilder.append(amountArray[i]);
    //                 b++;
    //             } else {
    //                 finalString += amountArray[i];//stringBuilder.append(amountArray[i]);
    //                 b = 0;
    //             }
    //         }
    //     }
    //     return finalString;
    // }

    public static String rupeeFormat(String value){
        value=value.replace(',','');
        String formatted = '';
        String afterPlaceDigit = '';
        String beforePlaceDigit = '';
        if(value.contains('.')){
            afterPlaceDigit = value.substringAfter('.');//value.substring(value.lastIndexOf('.') + 1);
            beforePlaceDigit = value.substringBefore('.');
        }else{
            beforePlaceDigit = value;
        }
        formatted += beforePlaceDigit.substring(beforePlaceDigit.length() - 3, beforePlaceDigit.length());
        String leftString = beforePlaceDigit.substring(0, beforePlaceDigit.length() - 3);
        System.debug('leftString:'+leftString);
        if(leftString.length() > 0){
            formatted = ',' + formatted;
        }
        String newStr='';
        String joinerString = '';
        List<String> lstStr = new List<String>();
        Integer j = 0;
        Integer lengthToTrim = 2;
        leftString = leftString.reverse();
        while (j<leftString.length()){
            newStr = leftString.mid(j,lengthToTrim);
            lstStr.add(newStr);
            j = j + lengthToTrim;
        } 

        joinerString = String.join(lstStr, ',');
        System.debug('lstStr=' + lstStr);
        // leftString = String.append(arg0, arg1)
        // String lastString = '';
        // Integer len = leftString.length();
        // for (Integer i = len; i > 0; i--){
        //     Integer reminder = math.mod(i, 2);
            
        //     System.debug('singleChar:'+leftString.substring(i - 1,i));
        //     lastString += leftString.substring(i - 1,i);
            
        //     if(reminder == 0){
        //         lastString += ',';
        //     }
            
        // }
        // System.debug('afterPlaceDigit:'+afterPlaceDigit);
        // System.debug('beforePlaceDigit:'+beforePlaceDigit);
        // if(value.length() > 1){
        //     formatted = value.substring(0,1);
        //     value = value.substring(1);
        // }

        // while(value.length() > 3){
        //     formatted += ',' + value.substring(0,2);
        //     value = value.substring(2);
        // }
        // Integer lastDigit=value.charAt(value.length()-1);
        // System.debug('lastDigit:'+lastDigit);
        // String result = '';
        // Integer len = value.length()-1;
        // System.debug('len:'+len);
        // Integer nDigits = 0;
        
        // for (Integer i = len - 1; i >= 0; i--){
        //     result = value.charAt(i) + result;
        //     nDigits++;
        //     Integer reminder = math.mod(nDigits, 2);
        //     System.debug('reminder:'+reminder);
        //     if ((reminder == 0) && (i > 0)){
        //         result = ',' + result;
        //     }
        // }
        // return (result+lastDigit);
        //return beforePlaceDigit +'---'+afterPlaceDigit;
        return joinerString.reverse() + formatted + '.'+afterPlaceDigit;
    }
}