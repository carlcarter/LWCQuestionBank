# Salesforce Randomized Question Component

## Introduction

This repository contains a Salesforce Lightning Web Component (LWC) designed for demonstration purposes only. It serves as a guide on how to display a randomized question to a Salesforce user from a list of active questions stored in a custom object called "Question__c". 

## Setup and Installation

### Step 1: Deployment

Deploy all the necessary components to your Salesforce organization. This includes the Lightning Web Component, Apex Controller, and the necessary object and field definitions. Additionally, deploy the created permission sets "Questions User" and "Questions Admin" to manage access levels to the `Question__c` object.

### Step 2: Permission Set Assignment

After deploying the components, you need to assign a permission set to the respective users. There are two permission sets available:

1. **Questions User**: Grants read-only and view all access to the `Question__c` object.
2. **Questions Admin**: Grants full CRUD access to the `Question__c` object.

Assign the appropriate permission set based on the user's role and responsibilities.

### Step 3: Including the Component in a Flow

To use this component, include it in a Salesforce flow. An example metadata file for a flow is `Question_Bank.flow-meta.xml`. However, the component can be modified to be used in other contexts as per your requirements.

### Step 4: Importing Sample Data (Optional)

If required, you can import sample questions to populate the `Question__c` object. Use the following Salesforce CLI command to import the data:

```
sfdx force:data:tree:import -p ./scripts/data/Question__c.json -u <org name>
```

Replace `<org name>` with the alias or username of your Salesforce organization.

## Component Details
- **Component Name**: questionBank
- **Apex Controller**: QuestionController
- **Primary Function**: The component relies on the `QuestionController` Apex class to select a random question from the `Question__c` object where `Active__c` is set to true.

## Disclaimer
This component is created for demonstration purposes only and serves as a guide to showcase how a randomized question can be displayed to a Salesforce user. It is not intended for production use.

## Conclusion
By following the above steps, you should have the `questionBank` component set up and running in your Salesforce organization. This component serves as a great starting point for developers looking to understand how to create and use custom Lightning Web Components in Salesforce.

Feel free to modify and adapt the component as per your requirements and use case.