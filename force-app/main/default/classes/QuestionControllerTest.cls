@IsTest
public class QuestionControllerTest {
    
    @IsTest
    static void testGetRandomActiveQuestion() {
        // Step 1: Set up test data
        List<Question__c> questions = new List<Question__c>();
        for(Integer i = 0; i < 5; i++) {
            questions.add(new Question__c(Active__c = true, QuestionText__c = 'Active Question ' + i));
            questions.add(new Question__c(Active__c = false, QuestionText__c = 'Inactive Question ' + i));
        }
        insert questions;

        // Step 2: Test the method
        Test.startTest();
        Question__c randomQuestion = QuestionController.getRandomActiveQuestion();
        Test.stopTest();

        // Step 3: Verify the results
        System.assertNotEquals(null, randomQuestion, 'Random question should not be null');
    }

    @IsTest
    static void testGetRandomActiveQuestionWithNoActiveRows() {
        // Step 1: Set up test data with only inactive questions
        List<Question__c> questions = new List<Question__c>();
        for(Integer i = 0; i < 5; i++) {
            questions.add(new Question__c(Active__c = false, QuestionText__c = 'Inactive Question ' + i));
        }
        insert questions;

        // Step 2: Test the method with no active questions
        Test.startTest();
        Question__c randomQuestion = QuestionController.getRandomActiveQuestion();
        Test.stopTest();

        // Step 3: Verify the results with no active questions
        System.assertEquals(null, randomQuestion, 'Random question should be null as there are no active questions');
    }
    
}
