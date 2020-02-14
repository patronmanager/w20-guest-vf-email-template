public with sharing class EmailExampleController {
    public ShoppingCart__c cart {get;set;}

    public PageReference createCart(){
        cart = new ShoppingCart__c(
                Name = 'Order ' + Date.today(),
                FirstName__c='Bob',
                Email__c='YOUR EMAIL ADDRESS'
        );
        insert cart;
        return null;
    }

    public PageReference retrieveCart(){
        try {
            cart = [SELECT Id, Email__c, Name, FirstName__c, SystemModstamp FROM ShoppingCart__c WHERE Id = :cart.Id];
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
        return null;
    }

    public PageReference emailCart(){
        try {
            WithoutSharingUtil.sendConfirmationEmail(cart);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Email sent!'));
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
        return null;
    }
}