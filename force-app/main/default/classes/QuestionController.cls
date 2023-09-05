public with sharing class QuestionController {
    
    @AuraEnabled(cacheable=true)
    public static Question__c getRandomActiveQuestion() {
        List<Question__c> activeQuestions = [SELECT Id, QuestionText__c FROM Question__c WHERE Active__c = true];
        if (!activeQuestions.isEmpty()) {
            Integer randomIndex = Math.mod(Math.abs(Crypto.getRandomInteger()), activeQuestions.size());
            return activeQuestions.get(randomIndex);
        } else {
            return null;
        }
    }
    
}
