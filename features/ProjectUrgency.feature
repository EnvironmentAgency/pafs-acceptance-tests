@frontoffice
Feature: Create a new project application
  As a council
  I want to submit a project urgeny proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  @regression @projecturgency
  Scenario: Sumbmit a new proposal with not urgent project urgency for rma user
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I select the project is not urgent
    When I return to the proposal overview page
    Then its status is draft

  @regression @projecturgency
  Scenario: Sumbmit a new proposal with business critical statutory need
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "restore_asset"
      And I select financial year to stop spending
      And I enter the project urgency as "stat_need" with a message of "There is a business critical statutory need"
    When I return to the proposal overview page
    Then its status is draft    

  @regression @projecturgency
  Scenario: Sumbmit a new property level protection proposal with business critical legal need
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "property_level_protection"
      And I select financial year to stop spending
      And I enter the project urgency as "legal_need" with a message of "There is a business critical legal need"
    When I return to the proposal overview page
    Then its status is draft  

  @regression @projecturgency
  Scenario: Sumbmit a new strategy proposal with specific aspect of the project that has a time limit project urgency
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "strategy"
      And I select financial year to stop spending
      And I enter the project urgency as "time_limit" with a message of "There is a specific aspect of the project that has a time limit"
    When I return to the proposal overview page
    Then its status is draft   

  @regression @projecturgency
  Scenario: Sumbmit a new proposal with emergency and change to not urgent project urgency  for rma user
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I enter the project urgency as "emergency" with a message of "There is an emergency"
      And I select the project is not urgent
    When I return to the proposal overview page
    Then its status is draft    

  @regression @projecturgency
  Scenario: Sumbmit a new benefit hosueholds yes proposal with emergency and change to not urgent
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "benefits_households_yes"
      And I select financial year to stop spending
      And I select the project is not urgent
      And I enter the project urgency as "emergency" with a message of "There is an emergency"
      And I select the project is not urgent
    When I return to the proposal overview page
    Then its status is draft 

   @regression @projecturgency
  Scenario: Sumbmit a new benefit households no proposal with not urgent
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "benefits_households_no"
      And I select financial year to stop spending
      And I select the project is not urgent
      And I enter the project urgency as "emergency" with a message of "There is an emergency"
      And I select the project is not urgent
    When I return to the proposal overview page
    Then its status is draft    

  @regression @projecturgency
  Scenario: Sumbmit a new proposal to check all project urgency selections with rma user
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select a project type "change_or_new_asset"
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
      And I select the project is not urgent
      And I enter the project urgency as "stat_need" with a message of "There is a business critical statutory need"
      And I select the project is not urgent
      And I enter the project urgency as "legal_need" with a message of "There is a business critical legal need"
      And I select the project is not urgent
      And I enter the project urgency as "health_and_safety" with a message of "There is a health and safety issue"
      And I select the project is not urgent
      And I enter the project urgency as "emergency" with a message of "There is an emergency"
      And I select the project is not urgent
      And I enter the project urgency as "time_limit" with a message of "There is a specific aspect of the project that has a time limit"
      And I select the project is not urgent
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review
