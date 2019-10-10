@frontoffice
Feature: Create a new project application for Project Urgency
  As a council
  I want to submit a project urgeny proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background: 
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

  @projecturgencyTests @RMAUser @PU1
  Scenario: Submit a new proposal with not urgent project urgency for rma user
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
    When I select the project urgency as "not_urgent"
    Then I should see the project urgent message of "Your project is not urgent" on the proposal page

  @projecturgencyTests @RMAUser @PU2
  Scenario: Submit a new proposal with business critical statutory need check message box is empty
    Given I select a project type "restore_asset"
      And I select financial year to stop spending
    When I select the project urgency as "stat_need"
    Then  I check the project urgent message box is empty

  @projecturgencyTests @RMAUser @PU3
  Scenario: Submit a new proposal with business critical statutory need for rma user
    Given I select a project type "restore_asset"
      And I select financial year to stop spending
    When I select the project urgency as "stat_need"
      And I enter the project urgent message box of "There is a business critical statutory need"
    Then I should see the project urgent message of "There is a business critical statutory need" on the proposal page

  @projecturgencyTests @RMAUser @PU4
  Scenario: Submit a new property level protection proposal with business critical legal need for rma user
    Given I select a project type "property_level_protection"
      And I select financial year to stop spending
    When I select the project urgency as "legal_need"
      And I enter the project urgent message box of "There is a business critical legal need"
    Then I should see the project urgent message of "There is a business critical legal need" on the proposal page

  @projecturgencyTests @RMAUser @PU5
  Scenario: Submit a new strategy proposal with specific aspect of the project that has a time limit project urgency for rma user
    Given I select a project type "strategy"
      And I select financial year to stop spending
    When I select the project urgency as "time_limit"
      And I enter the project urgent message box of "There is a specific aspect of the project that has a time limit"
    Then I should see the project urgent message of "There is a specific aspect of the project that has a time limit" on the proposal page
 
  @projecturgencyTests @RMAUser @PU6
  Scenario: Submit a new proposal with emergency and change to not urgent project urgency  for rma user
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
    When I select the project urgency as "emergency"
      And I enter the project urgent message box of "There is an emergency"
    Then I should see the project urgent message of "There is an emergency" on the proposal page      
 
  @projecturgencyTests @RMAUser @PU7
  Scenario: Submit a new benefit hosueholds yes proposal with there is a business critical legal need project urgency for rma user
    Given I select a project type "benefits_households_yes"
      And I select financial year to stop spending
    When I select the project urgency as "legal_need"
      And I enter the project urgent message box of "There is a business critical legal need"
    Then I should see the project urgent message of "There is a business critical legal need" on the proposal page 

  @projecturgencyTests @RMAUser
  Scenario: Submit a new benefit households no proposal with there is an emergency for rma user
    Given I select a project type "benefits_households_no"
      And I select financial year to stop spending
    When I select the project urgency as "emergency"
      And I enter the project urgent message box of "There is an emergency"
    Then I should see the project urgent message of "There is an emergency" on the proposal page   

  @projecturgencyTests @RMAUser
  Scenario: Submit a full proposal to check project not urgency with rma user
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for "grant_in_aid"
      And I enter my funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I select the project urgency as "not_urgent"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review
