@frontoffice
Feature: Run regression tests against the soltuiin
  I Want to run regression tests against the soltion 
  So that I can confirm that the solution still functions as expected

  Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal


# FIXES
# I add the coastal erosion protection outcome values for column A a1 Yes and No Radio buttons
# Funding journey needs to be as manually entered.      

# ==================================================================================================================================
# QA Test Environment
# ==================================================================================================================================

  # Project Type 
  @QA_RegressionTests @QA_R1
  Scenario: Sumbmit a new defence proposal
    Given I enter a project name
    And I select a project type "change_or_new_asset" 
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  # Project Type 
  @QA_RegressionTests @QA_R2
  Scenario: Sumbmit a new restore asset proposal
    Given I enter a project name
    And I select a project type "restore_asset"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  # Project Type 
  @QA_RegressionTests @QA_R3
  Scenario: Sumbmit a new property level protection proposal
    Given I enter a project name
    And I select a project type "property_level_protection"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

  @QA_RegressionTests @QA_R4
  Scenario Outline: Submit a new proposals with a funding source
    Given I enter a project name
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

  # SHAPEFILE - Valid  
  @QA_RegressionTests @QA_R5
  Scenario Outline: Sumbmit a new proposal with an valid shapefile
    Given I enter a project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit area page
    Then I should see the message "<Message>" on the benefit area page

    Examples:
    |ShapeFile|Message|
    |Valid_ShapeFile.zip|The uploaded shapefile|

  # SHAPEFILE - Invalid
  @QA_RegressionTests @QA_R6
  Scenario Outline: Sumbmit a new proposal with an invalid shapefile
    Given I enter a project name
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

  # SHAPEFILE - Virus 
  @QA_RegressionTests @QA_R7
  Scenario Outline: Sumbmit a new proposal with an pseudo-virus shapefile
    Given I enter a project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |Virus_ShapeFile.zip|The file was rejected because it may contain a virus. Check the file and try again|

  # SHAPEFILE - Blank File 
  @QA_RegressionTests @QA_R8
  Scenario Outline: Sumbmit a new proposal with no file
    Given I enter a project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I click and continue
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |Message|
    |Upload a shapefile that outlines the area the project is likely to benefit|

  @QA_RegressionTests @QA_R9
 Scenario Outline: Submit a project with PFC v8 Calc inc Triple Funding Sources
    Given I enter a project name
      And I select a project type "restore_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |Virus_ShapeFile.zip|The file was rejected because it may contain a virus. Check the file and try again|

  # SHAPEFILE - Blank File 
  @QA_RegressionTests @QA_R10
  Scenario Outline: Sumbmit a new proposal with no file
    Given I enter a project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I click and continue
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |Message|
    |Upload a shapefile that outlines the area the project is likely to benefit|

  @QA_RegressionTests @QA_R11
 Scenario: Submit a new full project with PFC v8 Calc with Triple Funding Sources
    Given I enter a test project name "Pafs_Integration_Test1"
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
      And I enter the projects goal approach "Submit a new project with new v8 Calc sheet inc. Triple Funding Sources, Flood Protection, V8 PFC Sheet"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
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

  #@Project Type 
  @TRA_RegressionTests @TRA_R1
  Scenario: Sumbmit a new defence proposal
    Given I enter a project name
    And I select a project type "change_or_new_asset" 
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  #@Project Type 
  @TRA_RegressionTests @TRA_R2
  Scenario: Sumbmit a new restore asset proposal
    Given I enter a project name
    And I select a project type "restore_asset"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  #@Project Type 
  @TRA_RegressionTests @TRA_R3
  Scenario: Sumbmit a new property level protection proposal
    Given I enter a project name
    And I select a project type "property_level_protection"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

 @TRA_RegressionTests @TRA_R4
  Scenario Outline: Submit a new proposals with a funding source
    Given I enter a project name
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

 # SHAPEFILE - Valid
 @TRA_RegressionTests @TRA_R5
  Scenario Outline: Sumbmit a new proposal with an valid shapefile
    Given I enter a project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit area page
    Then I should see the message "<Message>" on the benefit area page

    Examples:
    |ShapeFile|Message|
    |Valid_ShapeFile.zip|The uploaded shapefile|

  # SHAPEFILE - Invalid 
  @TRA_RegressionTests @TRA_R6
  Scenario Outline: Sumbmit a new proposal with an invalid shapefile
    Given I enter a project name
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

  # SHAPEFILE - Virus 
  @TRA_RegressionTests @TRA_R7
  Scenario Outline: Sumbmit a new proposal with an pseudo-virus shapefile
    Given I enter a project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |Virus_ShapeFile.zip|The file was rejected because it may contain a virus. Check the file and try again|

  # SHAPEFILE - Blank File 
  @TRA_RegressionTests @TRA_R8
  Scenario Outline: Sumbmit a new proposal with no file
    Given I enter a project name
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I click and continue
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |Message|
    |Upload a shapefile that outlines the area the project is likely to benefit|

  @TRA_RegressionTests @TRA_R9
    Scenario: Submit a new project with multi funding sources and PFC Vs8 Calc (TRA_R9)
    Given I enter a test project name "Pafs_Integration_Test1"
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
      And I enter the projects goal approach "Submit a new project with new v8 Calc sheet inc. Triple Funding Sources, Flood Protection, V8 PFC Sheet"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
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

# ==================================================================================================================================
# Pre-Prod Test Environment 
# ==================================================================================================================================

  #@Project Type 
  @PreProd_RegressionTests @PP_R1
  Scenario: Sumbmit a new defence proposal
    Given I enter a project name
    And I select a project type "change_or_new_asset" 
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  #@Project Type 
  @PreProd_RegressionTests @PP_R2
  Scenario: Sumbmit a new restore asset proposal
    Given I enter a project name
    And I select a project type "restore_asset"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  #@Project Type 
  @PreProd_RegressionTests @PP_R3
  Scenario: Sumbmit a new property level protection proposal
    Given I enter a project name
    And I select a project type "property_level_protection"
    And I select a financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

  @PreProd_RegressionTests @PP_R4
  Scenario Outline: Submit a new proposals with a funding source
    Given I enter a project name
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

  @PreProd_RegressionTests @PP_R5
  Scenario: Submit a new project with new v8 Calc sheet inc. Triple Funding Sources, Flood Protection, V8 PFC Sheet
    Given I enter a test project name "Pafs_Integration_Test1"
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
      And I enter pp a sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter pp funding values for a single contributor "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I enter a funding source for "private_sector"
      And I click and continue
      And I enter pp a sector contributor of "private_sector", "Rose Rothery"
      And I enter pp funding values for a single contributor "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue    
      And I enter pp a sector contributor of "other_sector", "Matt Hall"
      And I enter pp funding values for a single contributor "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000", 2020-2021 "7000" 
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
      And I enter the projects goal approach "Submit a new project with new v8 Calc sheet inc. Triple Funding Sources, Flood Protection, V8 PFC Sheet"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload a project funding calculator file "PFCalcVs8.xlsx"
    When I complete my proposal on preprod
    Then I should see that my proposal is sent for review
