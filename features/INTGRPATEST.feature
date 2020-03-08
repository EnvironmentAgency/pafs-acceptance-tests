@frontoffice
Feature: OM Test 1 run against the soltuiin
  I Want to run OM tests against the soltion 
  So that I can confirm that the solution still functions as expected

  Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
    #  And I enter a project name

# ============================================================================================================
# Training Test Environment
# ============================================================================================================

    # Option: Project Type: change_or_new_asset, restore_asset, property_level_protection, bridges, strategy, benefits_households_yes, benefits_households_no  Note: benefit_housefold_no does not have any risk 
    # Option: Funding Source: grant_in_aid, local_levy, public_sector, private_sector, growth_funding, internal_drainge_board, not_identified
    # Option: Risk: river, tidal, ground, surface, sea, reservoir, coastal
    # Option: Fllod Outcome: None or A1 - C6 
    # Future Work 
    # Need to check on the Urgency selections
    # 1.4 Urgent selections to do 

    @TRA_PAFS_INT_GROUP_A @TRA_OM1a
    Scenario: Submit a new OM1 proposals (Integration Test 1a) with a single Risk Source: river, Funding Source: grant in aid, Risk: VS Before and LR After 
    Given I enter a test project name "Pafs_Integration_1a"
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "grant_in_aid"
      And I enter new funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer NO if the project could start sooner
      And I add my main project risk "river"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "OM1a proposals (Integration Test 1a) with a single Risk Source: river, Funding Source: grant in aid, Risk: VS Before and LR After"
      And I enter no environmental outcomes improvements
      And I select the project urgency as "not_urgent"
      And I upload my project funding calculator file "OM1a.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review
    
    @TRA_PAFS_INT_GROUP_A @TRA_OM1b
    Scenario: Submit a new OM1 proposals (Integration Test 1b) with a single Risk Source: tidal, Funding Source: local levey, Risk: VS Before and LR After 
    Given I enter a test project name "Pafs_Integration_1b"
      And I select a project type "restore_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "local_levy"
      And I enter new funding values for "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer NO if the project could start sooner
      And I add my main project risk "tidal"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "OM1b proposals (Integration Test 1b) with a single Risk Source: tidal, Funding Source: local levey, Risk: VS Before and LR After"
      And I enter no environmental outcomes improvements
      And I select the project urgency as "stat_need"
      And I enter the project urgent message box of "Because Stats Needed"
      And I upload my project funding calculator file "OM1b.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @TRA_PAFS_INT_GROUP_A @TRA_OM1c
    Scenario: Submit a new OM1 proposals (Integration Test 1c) with a single Risk Source: ground, Funding Source: public sector, Risk: Low Before and Low After
    Given I enter a test project name "Pafs_Integration_1c"
      And I select a project type "property_level_protection"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "public_sector"
      And I enter new funding values for "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I click and continue
      And I answer NO if the project could start sooner
      And I add my main project risk "ground"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "low_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "OM1c proposals (Integration Test 1c) with a single Risk Source: ground, Funding Source: public sector, Risk: Low Before and Low After"
      And I enter no environmental outcomes improvements
      And I select the project urgency as "legal_need"
      And I enter the project urgent message box of "Because it a legal need"
      And I upload my project funding calculator file "OM1c.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @TRA_PAFS_INT_GROUP_A @TRA_OM1d
    Scenario: Submit a new OM1 proposals (Integration Test 1d) with a single Risk Source: surface, Funding Source: Private Sector, Risk: Low Before and Low After
    Given I enter a test project name "Pafs_Integration_1d"
      And I select a project type "benefits_households_yes"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "private_sector"
      And I enter a new sector contributor of "private_sector", "private_sector"
      And I enter new funding values for "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I click and continue
      And I answer NO if the project could start sooner
      And I add my main project risk "surface"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "low_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "OM1d proposals (Integration Test 1d) with a single Risk Source: surface, Funding Source: Private Sector, Risk: Low Before and Low After"
      And I enter no environmental outcomes improvements
      And I select the project urgency as "health_and_safety"
      And I enter the project urgent message box of "Because it is an Health and Saftey Need"
      And I upload my project funding calculator file "OM1d.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @TRA_PAFS_INT_GROUP_A @TRA_OM1e
    Scenario: Submit a new OM1 proposals (Integration Test 1e) with a single risk source amd with move households 
    Given I enter a test project name "Pafs_Integration_1e"
      And I select a project type "benefits_households_no"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "internal_drainage_boards"
      And I enter new funding values for "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer NO if the project could start sooner
      And I enter the projects goal approach "Submit a new OM1 proposals (Integration Test 1e) with a single risk source amd with move households"
      And I enter no environmental outcomes improvements
      And I select the project urgency as "time_limit"
      And I enter the project urgent message box of "Because it is an Time Limit"
      And I upload my project funding calculator file "OM1e.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @TRA_PAFS_INT_GROUP_A @TRA_OM1f
    Scenario: Submit a new OM1 proposals (Integration Test 1f) with a single risk source amd with move households and zero funding
    Given I enter a test project name "Pafs_Integration_1f"
      And I select a project type "benefits_households_no"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "internal_drainage_boards"
      And I enter new funding values for "internal_drainage_boards" previous year "20", 2015-2016 "0", 2016-2017 "0", 2017-2018 "0", 2018-2019 "0", 2019-2020 "0"
      And I answer NO if the project could start sooner
      And I enter the projects goal approach "OM1 proposals (Integration Test 1f) with a single risk source amd with move households and zero funding"
      And I enter no environmental outcomes improvements
      And I select the project urgency as "time_limit"
      And I enter the project urgent message box of "Because it is an Time Limit"
      And I upload my project funding calculator file "OM1f.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @TRA_PAFS_INT_GROUP_A @TRA_OM1g
    Scenario: Submit a new OM1 proposals (Integration Test 1g) with a single risk source amd with move households and zero funding
    Given I enter a test project name "Pafs_Integration_1g"
      And I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a new funding source for "grant_in_aid"
      And I enter new funding values for "grant_in_aid" previous year "10", 2015-2016 "20", 2016-2017 "30", 2017-2018 "40", 2018-2019 "50", 2019-2020 "60"
      And I answer NO if the project could start sooner
      And I add my main project risk "river"
      And I add the flood protection outcome as none
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach "OM1 proposals (Integration Test 1g) with a single risk source amd with move households and zero funding"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Because it is an emergency"
      And I upload my project funding calculator file "OM1a.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

   # Funding Source is Zero validation test 
