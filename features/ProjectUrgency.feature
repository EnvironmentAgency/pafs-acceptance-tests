@frontoffice
Feature: Create a new project application
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  @regression @projecturgency @RMAUser
  Scenario: Sumbmit a new proposal with Grant to test Project Urgency
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for grant in aid
      And I enter my funding values for grant in aid 
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "stat_need" with a message of "There is a business critical statutory need"
      And I enter the project urgency as "legal_need" with a message of "There is a business critical legal need"
      And I enter the project urgency as "health_and_safety" with a message of "There is a health and safety issue"
      And I enter the project urgency as "emergency" with a message of "There is an emergency"
      And I enter the project urgency as "time_limit" with a message of "There is a specific aspect of the project that has a time limit"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review