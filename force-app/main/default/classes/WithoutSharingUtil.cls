public without sharing class WithoutSharingUtil {
    class EmailException extends Exception{}

    public static void sendConfirmationEmail(ShoppingCart__c cart){
        EmailTemplate templ = [SELECT Id FROM EmailTemplate WHERE DeveloperName = 'ExampleTemplate'];

        if(templ.Id == null){
            throw new EmailException('Can\'t find Email Template');
        }

        Contact c = new Contact(
                Email = cart.Email__c,
                LastName=cart.FirstName__c
        );

        insert c;

        try {
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();

            msg.setTargetObjectId(c.Id);

            msg.setWhatId(cart.Id);
            msg.setTemplateId(templ.Id);
            msg.setSaveAsActivity(false);

            Messaging.sendEmail(new List<Messaging.Email>{
                    msg
            });
        }
        finally{
            delete c; //delete the temporary Contact
        }
    }
}