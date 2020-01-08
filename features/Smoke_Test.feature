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

#==================================================================================================================================
# QA Test Environment
# ==================================================================================================================================

  @QA_SmokeTests @OM_QA1
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
      And I enter my funding sources for "local_levy"
      And I enter my funding values for "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000" 
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my main project risk "river"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "Smoke Test on QA 1"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal on QA
    Then I should see that my proposal is sent for review

  @QA_SmokeTests @OM_QA2
  Scenario: Created proposal is in draft status
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
    When I return to the proposal overview page
    Then its status is draft

#==================================================================================================================================
# Training Test Environment
# ==================================================================================================================================

    @TRA_SmokeTests @OM_SM1
    Scenario: Sumbmit a new proposal with Grant in Aid and Levy funding for training
    Given I select a project type "property_level_protection"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my new funding sources for "grant_in_aid"
      And I enter my new funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I enter my funding sources for "local_levy"
      And I enter my funding values for "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"      
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my main project risk "river"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "Smoke Test on Training 1"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM3TEST.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

  @TRA_SmokeTests @OM_SM2
  Scenario: Submit a new OM1 proposals (test 3: Dual Risk) with a dual risk source of Tidal & Coastal errosion to households 
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
      And I add my main project risk "tidal"
      And I add the flood protection outcome as none
      And I add a second project risk "coastal"
      And I add the flood protection outcome as none
      And I add the coastal erosion protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "Submit a new OM1 proposals (test 3: Dual Risk) with a dual  risk source of Rivers & Coastal to households"
      And I enter environmental outcomes improvements
      And I select the project urgency as "not_urgent"
      And I upload my project funding calculator file "LIT_9160_97331cOM1TEST.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review    

  @TRA_SmokeTests @OM_SM3
  Scenario: Created proposal is in draft status for training
    Given I select a project type "benefits_households_yes"
      And I select financial year to stop spending
    When I return to the proposal overview page
    Then its status is draft