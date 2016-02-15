public with sharing class CarController
{
    public static Boolean DEV_MODE { get { return true; } }
    public static String EMPTY = '';

    /**
     * Remote Actions
     */
    @RemoteAction
    public static List<Car__c> getCars()
    {
        return [SELECT Brand__c, Colour__c, Fuel__c, Id, LicenseNumber__c, Name, Price__c, Sold__c from Car__c];
    }
    
    @RemoteAction
    public static List<Brand__c> getBrands()
    {
        return [SELECT Id, Name from Brand__c];
    }

    /**
     * Lightning remote actions
     */
    @AuraEnabled
    public static RequestResult getCarsByBrandL(Id brand)
    {
        try 
        {
            List <Object> result = new List <Object>();
            if(brand == null){
                result = [SELECT Brand__r.Name, Colour__c, Fuel__c, Id, LicenseNumber__c, Name, Price__c, Sold__c from Car__c];
            } else{
                result = [SELECT Brand__r.Name, Colour__c, Fuel__c, Id, LicenseNumber__c, Name, Price__c, Sold__c from Car__c where Brand__c =: brand];
            }
            return new RequestResult(result, false, EMPTY);
        } 
        catch (LightningException e)
        {
            return new RequestResult(null, true, e.getMessage());
        }
    }

    @AuraEnabled
    public static RequestResult getBrandsL()
    {
        try 
        {
            List <Object> result = [SELECT Id, Name from Brand__c];
            return new RequestResult(result, false, EMPTY);
        } 
        catch (LightningException e)
        {
            return new RequestResult(null, true, e.getMessage());
        }
    }

    /*
     *  result wrapper
     */
    public class RequestResult 
    {
        @AuraEnabled 
        public Object data;
        @AuraEnabled 
        public Boolean error;
        @AuraEnabled 
        public String message;

        public RequestResult(Object data, Boolean error, String message)
        {
            this.data = data;
            this.error = error;
            this.message = message;
        }
    }


    public class LightningException extends Exception 
    {   
    }
}