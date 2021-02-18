# This automation soltution was created bu Jason Leigh-Griffiths during 2019 - 2020
# The Pafs team was Rose Rothery BA, Matt Hall Developer

@frontoffice
Feature: Run regression tests against the soltuiin
  I Want to run regression tests against the soltion 
  So that I can confirm that the solution still functions as expected
   
# ==================================================================================================================================
# QA, Training & Pre_Prod Tests and Environments 
# ==================================================================================================================================

  @QA_RegressionTests @Train_RegressionTests @PreProd_RegressionTests @RG_A1
  Scenario: Sumbmit a new defence proposal with no for stored cookies
  Given I am an external user
    And I select "no" for Pafs to store cookies on my device
    And I have a valid "rma" username and password
    And I create a new proposal
    And I enter a new project name
    And I select a project type "change_or_new_asset" 
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  @QA_RegressionTests @Train_RegressionTests @PreProd_RegressionTests @RG_A2
  Scenario: Sumbmit a new restore asset proposal with yes for stored cookies 
  Given I am an external user
    And I select "yes" for Pafs to store cookies on my device  
    And I have a valid "rma" username and password
    And I create a new proposal
    And I enter a new project name
    And I select a project type "restore_asset"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  @QA_RegressionTests @TRA_RegressionTests @PreProd_RegressionTests @RG_A3
  Scenario: Sumbmit a new property level protection proposal and check very significant
  Given I am an external user
    And I select "yes" for Pafs to store cookies on my device  
    And I have a valid "rma" username and password
    And I create a new proposal
    And I enter a new project name
    And I select a project type "property_level_protection"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

  @QA_RegressionTests @TRA_RegressionTests @QA_RegressionTests @RG_A4
  Scenario Outline: Sumbmit a new proposal with an valid shapefile
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a new project name
    And I select a project type "change_or_new_asset"
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I upload the benefit area file "<ShapeFile>"
  When I view the benefit area page
  Then I should see the message "<Message>" on the benefit area page

    Examples:
    |ShapeFile|Message|
    |Valid_ShapeFile.zip|The uploaded shapefile|

  @QA_RegressionTests @TRA_RegressionTests @PreProd_RegressionTests @RG_A5
  Scenario Outline: [EdgeCase] Sumbmit a new proposal with an invalid shapefile
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a new project name
    And I select a project type "change_or_new_asset"
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I upload the benefit area file "<ShapeFile>"
  When I view the benefit file page
  Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |ShapeFile.png|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|
    |Invalid_ShapeFile.zip|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|

  @QA_RegressionTests @TRA_RegressionTests @PreProd_RegressionTests @RG_A6
  Scenario Outline: [EdgeCase] Sumbmit a new proposal with no shapefile
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a new project name
    And I select a project type "change_or_new_asset"
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I click and continue
  When I view the benefit file page
  Then I should see the message "<Message>" on the benefit file page

    Examples:
    |Message|
    |Upload a shapefile that outlines the area the project is likely to benefit|

  @QA_RegressionTests @TRA_RegressionTests @PreProd_RegressionTests @RG_A7
  Scenario Outline: [EdgeCase] Sumbmit a new proposal with both a valid and invalid shapefile
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a new project name
    And I select a project type "change_or_new_asset"
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I upload the benefit area file "<ShapeFile>"
  When I view the benefit file page
  Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |ShapeFile.png|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|
    |Invalid_ShapeFile.zip|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|

  @QA_RegressionTests @TRA_RegressionTests @PreProd_RegressionTests @RG_A8
  Scenario Outline: Submit a new proposals with a funding source
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a new project name
    And I select a project type "<project_type>"
    And I select a financial year to stop spending
    And I add a location "<location>"
    And I upload a benefit area file "<shapefile>"
    And I enter a business case start date
    And I enter a award contract date
    And I enter a construction start date
    And I enter a ready for service date
    And I enter a funding source for "<funding_source>"
    And I enter funding values for single contributor "<funding_source>" previous year "<previous>", 2015-2016 "<2015-2016>", 2016-2017 "<2016-2017>", 2017-2018 "<2017-2018>", 2018-2019 "<2018-2019>", 2019-2020 "<2019-2020>", 2020-2021 "<2020-2021>"
  When I check the proposal overview page
  Then I should see the total estimated spend as "<total_spend>"
     And I should see the funding source contributor "<funding_source>"
     
    Examples:
      |project_type|location|shapefile|funding_source|previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|2020-2021|total_spend|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile.zip|grant_in_aid|1000|2000|3000|4000|5000|6000|7000|28,000|

@QA_RegressionTests @TRA_RegressionTests @PreProd_RegressionTests @RG_A9
  Scenario Outline: Submit a new proposals with a funding source
  Given I am an external user
    And I select "yes" for Pafs to store cookies on my device   
    And I have a valid "rma" username and password
    And I create a new proposal
    And I enter a new project name
    And I select a project type "<project_type>"
    And I select a financial year to stop spending
    And I add a location "<location>"
    And I upload a benefit area file "<shapefile>"
    And I enter a business case start date
    And I enter a award contract date
    And I enter a construction start date
    And I enter a ready for service date
    And I enter a funding source for "<funding_source>"
    And I enter funding values for single contributor "<funding_source>" previous year "<previous>", 2015-2016 "<2015-2016>", 2016-2017 "<2016-2017>", 2017-2018 "<2017-2018>", 2018-2019 "<2018-2019>", 2019-2020 "<2019-2020>", 2020-2021 "<2020-2021>"
  When I check the proposal overview page
  Then I should see the total estimated spend as "<total_spend>"
    And I should see the funding source contributor "<funding_source>"

    Examples:
      |project_type|location|shapefile|funding_source|previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|2020-2021|total_spend|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile.zip|grant_in_aid|1000|2000|3000|4000|5000|6000|7000|28,000|

  @QA_RegressionTests @Train_RegressionTests @PreProd_RegressionTests  @RG_A10
  Scenario: Submit a new RMA project with triple funding sources and PFC Vs8 Calc
    Given I am an external user
      And I have a valid "rma" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths Test"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery BA "
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall Developer"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs8 Calc"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8LA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
  When I complete my proposal on qa
  Then I should see that my proposal is sent for review

# ==================================================================================================================================
# Specif Training (Integration between PAFS and PoL ) Tests and Environments 
# ==================================================================================================================================

   @TRA_RegressionTests @TRA_E2E @TRA_R1 #Done 
   Scenario: Submit a new RMA project with multi funding sources and PFC Vs2020 Calc
    Given I am an external user
      And I have a valid "rma" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths Tester"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery BA"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall Developer"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "Yes", "PFCalcVs2020LA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I submit my proposal on training
    Then I should see the proposal sent for review

   @TRA_RegressionTests @TRA_E2E @TRA_R2 #Done 
   Scenario: Submit a new RMA project with multi funding sources and PFC Vs8 Calc
    Given I am an external user
      And I have a valid "rma" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths Tester"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery BA"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall Developer"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8EA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I submit my proposal on training
    Then I should see the proposal sent for review

   @TRA_RegressionTests @TRA_E2E1 @TRA_R2 #New
   Scenario: Submit a new RMA project with multi funding sources and PFC Vs8 Calc
    Given I am an external user
      And I have a valid "rma" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I create a new proposal
      And I enter a new project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter funding values for single contributor "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000"
      And I enter a funding source for "local_levy"
      And I enter funding values for single contributor "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000"
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths Tester"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery BA"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall Developer"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000", 2021-2022 "8000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8EA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I submit my proposal on training
    Then I should see the proposal sent for review



  @TRA_RegressionTests @TRA_R3
  Scenario: Submit a new PSO project with multi funding sources and PFC Vs8 Calc
    Given I am an external user
      And I have a valid "pso" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I change the url page for pso on training
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths Tester"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery BA"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall Developer"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "600 ", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc as PSO"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "Beacuse it is an Emercency"   
      And I upload a project funding calculator with file option "No", "PFCalcVs8EA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I submit my proposal on training
    Then I should see the proposal sent for review

  @TRA_RegressionTests @TRA_R4
  Scenario: Submit a new PSO project with multi funding sources and PFC Vs2020 Calc
    Given I am an external user
      And I have a valid "pso" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I change the url page for pso on training
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths Tester"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery BA"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall Developer"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc as PSO"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "Yes", "PFCalcVs2020IDB.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I submit my proposal on training
    Then I should see the proposal sent for review

  @TRA_RegressionTests @TRA_R5
  Scenario: Submit a new PSO project revert to draft, change and resubmit
    Given I am an external user
      And I have a valid "pso" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I change the url page for pso on training
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths Tester"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery BA"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall Developer"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc as PSO"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "Beacuse it is an Emercency"   
      And I upload a project funding calculator with file option "Yes", "PFCalcVs2020IDB.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
      And I complete my proposal on training
      And I should see that my proposal is under review
      And I click on the return to your proposal overview button as a PSO
      And I revert my proposal to draft on training
      And I should see that my proposal status is draft
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Change message as part of the automated test process"  
      And I complete my proposal on training
      And I click on the return to your proposal overview button as a PSO
    When I submit the proposal to PoL as a PSO
    Then I should see that my proposal is under review as a PSO

# ==================================================================================================================================
# Pre-Prod Test Environment 
# ==================================================================================================================================

  @PreProd_RegressionTests @PP_R1
  Scenario Outline: Submit a new proposals with a funding source
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a new project name
    And I select a project type "<project_type>"
    And I select a financial year to stop spending
    And I add a location "<location>"
    And I upload a benefit area file "<shapefile>"
    And I enter a business case start date
    And I enter a award contract date
    And I enter a construction start date
    And I enter a ready for service date
    And I enter a funding source for "<funding_source>"
    And I enter funding values for single contributor "<funding_source>" previous year "<previous>", 2015-2016 "<2015-2016>", 2016-2017 "<2016-2017>", 2017-2018 "<2017-2018>", 2018-2019 "<2018-2019>", 2019-2020 "<2019-2020>", 2020-2021 "<2020-2021>"
  When I check the proposal overview page
  Then I should see the total estimated spend as "<total_spend>"
     And I should see the funding source contributor "<funding_source>"

    Examples:
      |project_type|location|shapefile|funding_source|previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|2020-2021|total_spend|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile.zip|grant_in_aid|1000|2000|3000|4000|5000|6000|7000|28,000|

  @PreProd_RegressionTests @PP_R2
  Scenario: Submit a new RMA project with multi funding sources and PFC Vs8 Calc
    Given I am an external user
      And I have a valid "rma" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt HAll"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs8 Calc"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8LA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
      And I complete my proposal on preprod
      And I should see that my proposal is sent for review
      And I sign out of the proposal
      And I have a valid "pso" username and password
      And I search for an existing proposal
    When I submit my proposal on training
    Then I should see that my proposal is under review

   @PreProd_RegressionTests @PP_R3
   Scenario: Submit a new RMA project with multi funding sources and PFC Vs2020 Calc
    Given I am an external user
      And I have a valid "rma" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I create a new proposal
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt HAll"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "Yes", "PFCalcVs2020LA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
      And I complete my proposal on preprod
      And I should see that my proposal is sent for review
      And I sign out of the proposal
      And I have a valid "pso" username and password
      And I search for an existing proposal
    When I submit my proposal on training
    Then I should see that my proposal is under review

  @PreProd_RegressionTests @PP_R4
  Scenario: Submit a new PSO project with multi funding sources and PFC Vs8 Calc
    Given I am an external user
      And I have a valid "pso" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I change the url page for pso on preprod
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc as PSO"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "No", "PFCalcVs8EA.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "medium_low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
      And I complete my proposal on preprod
      And I click on the return to your proposal overview button
    When I submit my proposal on training
    Then I should see that my proposal is under review

  @PreProd_RegressionTests @PP_R5
  Scenario: Submit a new PSO project with multi funding sources and PFC Vs2020 Calc
    Given I am an external user
      And I have a valid "pso" username and password
      And I select "yes" for Pafs to store cookies on my device
      And I change the url page for pso on preprod
      And I enter a new project name
      And I select a project type "restore_asset"
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
      And I enter a funding source for "growth_funding"
      And I enter funding values for single contributor "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "internal_drainage_boards"
      And I enter funding values for single contributor "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "not_identified"
      And I enter funding values for single contributor "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter funding values for single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery"
      And I enter funding values for single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000"
      And I click and continue
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt Hall"
      And I enter funding values for single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", a7 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", b7 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000", c7 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "A new project with multi funding sources and PFC Vs2020 Calc as PSO"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload a project funding calculator with file option "Yes", "PFCalcVs2020IDB.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 date as "low"
      And I add the confidence in securing the required Partnership Funding as "not_applicable"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
      And I complete my proposal on preprod
      And I click on the return to your proposal overview button
    When I submit the proposal to PoL as a PSO
    Then I should see that my proposal is under review
