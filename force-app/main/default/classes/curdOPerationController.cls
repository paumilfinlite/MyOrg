public class curdOPerationController{
    public Product2 insertProduct             {get; set;}
    public Product2 updateProduct             {get; set;}
    public Product2 cloneProduct              {get; set;}
    public Product2 prod2                     {get; set;}
    public PricebookEntry priceBook           {get; set;}
    public Pricebook2 priceBookRecordType     {get; set;}
    public boolean name                       {get; set;}
    public boolean MilimeterShow              {get; set;}
    public boolean insertBtnShow              {get; set;}
    public boolean adhesiveCategory           {get; set;}


    public curdOPerationController(ApexPages.StandardController controller){

        insertProduct = new Product2();
        updateProduct = new Product2();
        cloneProduct = new Product2();
        prod2 = new Product2();
        priceBook = new PricebookEntry();
        MilimeterShow = false;
        insertBtnShow = false;
        priceBookRecordType = [SELECT Id, Name from Pricebook2 where isStandard = true limit 1];
    } 

    public void insertFunction(){
        if (insertProduct.Category__c == 'RAWMATERIAL FILM') {
            name = false;
            MilimeterShow = true;
            insertBtnShow = false;

            
        }else if(insertproduct.Category__c == 'RAWMATERIAL ADHESIVE'){
             name = true;
             MilimeterShow = false;
            insertBtnShow = true;


        }else{
             name = true;
             MilimeterShow = false;
             insertBtnShow = false;


       } 
    }

     public void updateFunction(){
        if (insertProduct.Category__c == 'RAWMATERIAL FILM') {
            
        }else if(insertproduct.Category__c == 'RAWMATERIAL ADHESIVE'){

        }else{
            
        } 
     } 

     public void cloneFunction(){
        if (insertProduct.Category__c == 'RAWMATERIAL FILM') {
            
        }else if(insertproduct.Category__c == 'RAWMATERIAL ADHESIVE'){

        }else{
            
        } 
     } 

     public pageReference insertRecord(){
         if(insertProduct.Category__c == 'RAWMATERIAL FILM'){
             insertProduct.Name = insertProduct.Millimeter__c + ' MM X ' + insertproduct.Micron__c +  ' Micron';
             if(insertProduct.Category__c != null){
                 insertProduct.Name  += ' ';
                 insertProduct.Name  += insertProduct.Film_Category__c;
             }
         }
         insertproduct.IsActive = true;
         prod2.Name = insertProduct.Name;
         prod2.Category__c = insertProduct.Category__c;
         prod2.Adhesive_Category__c = insertProduct.Adhesive_Category__c;
         prod2.Film_Category__c = insertProduct.Film_Category__c;
         prod2.Macaron_Flavor__c = insertProduct.Macaron_Flavor__c;
         prod2.Micron__c = insertProduct.Micron__c;
         prod2.Millimeter__c = insertProduct.Millimeter__c;
         prod2.Product_Description__c = insertProduct.Product_Description__c;
         prod2.Shirt__c = insertProduct.Shirt__c;
         prod2.Unit__c = insertProduct.Unit__c;
        
         Database.SaveResult results = Database.Insert(prod2);
         
        priceBook.Product2Id = prod2.Id;
        priceBook.Pricebook2Id = priceBookRecordType.Id;
        priceBook.UnitPrice = 0.00;
        priceBook.IsActive = True;
        insert priceBook;

        if(!results.isSuccess()){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,''+results.getErrors()));
            return null;
        }else{
            PageReference pageRef = new PageReference('/'+ results.getId());
            pageRef.setRedirect(true);
            return pageRef;
        }

     } 

    //  public pageReference updateRecord(){

    //  }     
}