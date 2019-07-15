@frontoffice
Feature: Create a new project application for Smoke Tests
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

  @smoketest @regression @smoke1
    Scenario: Sumbmit a new proposal with Grant in Aid and Levy funding
      Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my new funding sources for "grant_in_aid"
      And I enter my new funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @smoketest @regression @smoke2
  Scenario: Created proposal is in draft status
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
    When I return to the proposal overview page
    Then its status is draft