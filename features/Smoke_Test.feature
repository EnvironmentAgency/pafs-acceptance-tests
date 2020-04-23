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

# ==================================================================================================================================
# QA Test Environment
# ==================================================================================================================================

  @QA_SmokeTests @OM_QA1
  Scenario: Created proposal is in draft status for QA
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
    When I return to the proposal overview page
    Then its status is draft

  @QA_SmokeTests @OM_QA2
    Scenario: Submit a new smoke test QA proposals with one funding source and PFC-Vs8 Calc
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter funding values for single contributor "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "local_levy"
      And I enter funding values for single contributor "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I answer YES if the project could start sooner "01", "2020"
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my main project risk "river"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "Smoke Test on QA"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 Readiness for Service date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I complete my proposal on qa
    Then I should see that my proposal is sent for review

# ==================================================================================================================================
# Training Test Environment
# ==================================================================================================================================

  @TRA_SmokeTests @OM_SM1
  Scenario: Created proposal is in draft status for training
    Given I select a project type "benefits_households_yes"
      And I select a financial year to stop spending
    When I return to the proposal overview page
    Then its status is draft

  @TRA_SmokeTests @OM_SM2
  Scenario: Sumbmit a new smoke test training proposals with one funding source and PFC-Vs8 Calc 
    Given I select a project type "property_level_protection"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter funding values for single contributor "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "local_levy"
      And I enter funding values for single contributor "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "river"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "Smoke Test on Training 1"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 Readiness for Service date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

  @TRA_SmokeTests @OM_SM3
  Scenario: Submit a new smoke test training proposals with one funding source and PFC-Vs2020 Calc 
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter funding values for single contributor "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I answer YES if the project could start sooner "03", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome as none
      And I add a second project risk "coastal"
      And I add the flood protection outcome as none
      And I add the coastal erosion protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new smoke test training proposals with one funding source and PFC-Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I select the project urgency as "not_urgent"
      And I upload a project funding calculator with file option "Yes", "PFCalcVs2020.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 Readiness for Service date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review    

# ==================================================================================================================================
# Pre-Prod Test Environment
# ==================================================================================================================================

  @PreProd_SmokeTests @PP_SM1
  Scenario: Created proposal is in draft status for Pre-Prod
    Given I select a project type "benefits_households_yes"
      And I select a financial year to stop spending
    When I return to the proposal overview page
    Then its status is draft

  @PreProd_SmokeTests @PP_SM2
  Scenario: Submit a new smoke test pre-prod proposals with two funding sources and PFC-Vs8 Calc 
    Given I select a project type "property_level_protection"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter pp funding values for a single contributor "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "local_levy"
      And I enter pp funding values for a single contributor "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "river"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "Smoke Test on Training 1"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8LA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 Readiness for Service date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I complete my proposal on preprod
    Then I should see that my proposal is sent for review
