@frontoffice
Feature: OM Test 1 run against the soltuiin
  I Want to run OM tests against the soltion 
  So that I can confirm that the solution still functions as expected

  # User test, rma and pso
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

    @PAFS_INT @GROUP_B @TRA_OM2a
    Scenario: Submit a new OM2, OM2B proposals (Integration Test 2) with a dual risk source amd with move households 
    Given I enter a test project name "Pafs_Integration_2a"
      And I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for "grant_in_aid"
      And I enter my funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I enter my funding sources for "local_levy"
      And I enter my funding values for "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add a second project risk "coastal"
      And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add the coastal erosion protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "Submit a new proposals (Integration Test 2) with a dual risk source of Tidal & Coastal errosion to households and dual funding sources"
      And I enter no environmental outcomes improvements
	    And I select the project urgency as "not_urgent"
      And I upload my project funding calculator file "OM2a.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @PAFS_INT @GROUP_B @TRA_OM2b
    Scenario: Submit a new OM2, OM2B proposals (Integration Test 2) with a dual risk source amd with move households 
    Given I enter a test project name "Pafs_Integration_2b_New"
      And I select a project type "restore_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for "grant_in_aid"
      And I enter my funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I enter my funding sources for "local_levy"
      And I enter my funding values for "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add a second project risk "coastal"
      And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add the coastal erosion protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "Submit a new proposals (Integration Test 2) with a dual risk source of Tidal & Coastal errosion to households and dual funding sources"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload my project funding calculator file "OM10.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @PAFS_INT @GROUP_B @TRA_OM2c
    Scenario: Submit a new OM4 with All proposals (Integration Test 2c) with a dual and triple funding source & Tidal & Coastal
    Given I enter a test project name "Pafs_Integration_2c"
      And I select a project type "restore_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my new funding sources for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter my new funding values for "public_sector" previous year "1", 2015-2016 "2", 2016-2017 "3", 2017-2018 "4", 2018-2019 "5", 2019-2020 "6"
      # Then I change my funding sources
      And I enter my new funding sources for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery"
      And I enter my new funding values for "private_sector" previous year "7", 2015-2016 "8", 2016-2017 "9", 2017-2018 "10", 2018-2019 "11", 2019-2020 "12"
      # Then I change my funding sources
      And I enter my new funding sources for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt HAll"
      And I enter my new funding values for "other_sector" previous year "13", 2015-2016 "14", 2016-2017 "15", 2017-2018 "16", 2018-2019 "17", 2019-2020 "18" 
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add a second project risk "coastal"
      And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add the coastal erosion protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "AOM4 with All proposals (Integration Test 2c) with a dual and triple funding source & Tidal & Coastal"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload my project funding calculator file "OM10.xlsx"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review

    @PAFS_INT @GROUP_B @TRA_OM2d
    Scenario: Submit a new OM with All proposals (Integration Test 2d) with a dual risk source amd with move households 
    Given I enter a test project name "Pafs_Integration_2d"
      And I select a project type "restore_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my new funding sources for "public_sector"
      And I enter two new sector contributors "public_sector", "Test1", "Test2"
  



      #And I enter my new funding values for "public_sector" previous year "1", 2015-2016 "2", 2016-2017 "3", 2017-2018 "4", 2018-2019 "5", 2019-2020 "6"

      #And I answer YES if the project could start sooner "01", "2020"
      #And I add my main project risk "tidal"
      #And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      #And I add a second project risk "coastal"
      #And I add the flood protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      #And I add the coastal erosion protection outcome values for column A a1 "50", a2 "40", a3 "30", a4 "20", a5 "10", a6 "0", column B b1 "50", b2 "40", b3 "30", b4 "20", b5 "10", b6 "0", column C c1 "10", c2 "10", c3 "10", c4 "10", c5 "10", c6 "0"
      #And I add the standard of protection before project starts as "very_significant_risk"
      #And I add the standard of protection after project completes as "low_risk"
      #And I add the standard of protection coastal erosion starts as "one_to_four_years"
      #And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      #And I enter the projects goal approach "A new OM with All proposals (Integration Test 2c) with a dual risk source of Tidal & Coastal"
      #And I enter environmental outcomes improvements
      #And I select the project urgency as "emergency"
      #And I enter the project urgent message box of "Beacuse it is an Emercency"
      #And I upload my project funding calculator file "OM10.xlsx"
    #When I complete my proposal on training
    #Then I should see that my proposal is sent for review
