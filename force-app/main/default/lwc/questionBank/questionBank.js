import { LightningElement, wire, track } from 'lwc';
import getRandomActiveQuestion from '@salesforce/apex/QuestionController.getRandomActiveQuestion';
import { refreshApex } from '@salesforce/apex';

export default class MyQuestionComponent extends LightningElement {
    @track randomQuestion;
    @track error;
    wiredResult;

    @wire(getRandomActiveQuestion)
    wiredQuestion(result) {
        this.wiredResult = result; // Storing the wired result
        const { data, error } = result;
        if (data) {
            this.randomQuestion = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.randomQuestion = undefined;
        }
    }

    get questionText() {
        return this.randomQuestion ? this.randomQuestion.QuestionText__c : 'Loading...';
    }

    getNewQuestion() {
        return refreshApex(this.wiredResult); // Refreshing the wired result
    }
}
