@frontoffice
Feature: Run regression tests against the soltuiin
  I Want to run regression tests against the soltion 
  So that I can confirm that the solution still functions as expected

  Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

# ==================================================================================================================================
# QA Test Environment
# ==================================================================================================================================

 @QA_RegressionTests @R1
  Scenario Outline: Submit a new proposals with a funding source
    Given I select a project type "<project_type>"
      And I select a financial year to stop spending
      And I add a location "<location>"
      And I upload a benefit area file "<shapefile>"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "<funding_source>"
      And I enter funding values for "<funding_source>" previous year "<previous>", 2015-2016 "<2015-2016>", 2016-2017 "<2016-2017>", 2017-2018 "<2017-2018>", 2018-2019 "<2018-2019>", 2019-2020 "<2019-2020>"
    When I check the proposal overview page
    Then I should see the total estimated spend as "<total_spend>"
      And I should see the funding source contributor "<funding_source>"

    Examples:
      |project_type|location|shapefile|funding_source|previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|total_spend|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile.zip|grant_in_aid|1000|2000|3000|4000|5000|6000|21,000|

  #Project Urgency
  @QA_RegressionTests @R2
  Scenario: Submit a full proposal to check project not urgency with rma user
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "QA: Full proposal to check project not urgency with rma user"
      And I enter environmental outcomes improvements
      And I select the project urgency as "not_urgent"
      And I upload a project funding calculator file for option "No", "PFCalcVs8.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 Readiness for Service date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I complete my proposal on QA
    Then I should see that my proposal is sent for review

  #@Project Type 
  @QA_RegressionTests @R3 
  Scenario: Sumbmit a new defence proposal
    Given I select a project type "change_or_new_asset" 
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  #@Project Type 
  @QA_RegressionTests @R4
  Scenario: Sumbmit a new restore asset proposal
    Given I select a project type "restore_asset"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  #@Project Type 
  @QA_RegressionTests @R5
  Scenario: Sumbmit a new property level protection proposal
    Given I select a project type "property_level_protection"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

# ==================================================================================================================================
# Training Test Environment 
# ==================================================================================================================================

 @TRA_RegressionTests @TRA_R1
  Scenario Outline: Submit a new proposals with a funding source
    Given I select a project type "<project_type>"
      And I select a financial year to stop spending
      And I add a location "<location>"
      And I upload a benefit area file "<shapefile>"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "<funding_source>"
      And I enter new funding values for "<funding_source>" previous year "<previous>", 2015-2016 "<2015-2016>", 2016-2017 "<2016-2017>", 2017-2018 "<2017-2018>", 2018-2019 "<2018-2019>", 2019-2020 "<2019-2020>"
    When I check the proposal overview page
    Then I should see the total estimated spend as "<total_spend>"
      And I should see the funding source contributor "<funding_source>"

    Examples:
      |project_type|location|shapefile|funding_source|previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|total_spend|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile.zip|grant_in_aid|1000|2000|3000|4000|5000|6000|21,000|

  #Project Urgency
  @TRA_RegressionTests
  Scenario: Submit a full proposal to check project not urgency with rma user
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "grant_in_aid"
      And I enter new funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "Training: full proposal to check project not urgency with rma user"
      And I enter environmental outcomes improvements
      And I select the project urgency as "not_urgent"
      And I upload a project funding calculator file "PFCalcVs8.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

  #@Project Type 
  @TRA_RegressionTests
  Scenario: Sumbmit a new defence proposal
    Given I select a project type "change_or_new_asset" 
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  #@Project Type 
  @TRA_RegressionTests
  Scenario: Sumbmit a new restore asset proposal
    Given I select a project type "restore_asset"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  #@Project Type 
  @TRA_RegressionTests
  Scenario: Sumbmit a new property level protection proposal
    Given I select a project type "property_level_protection"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"
