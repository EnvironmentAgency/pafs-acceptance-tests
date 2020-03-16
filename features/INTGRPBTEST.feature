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
# QA Test Environment
# ============================================================================================================

    @PAFS_INT @GROUP_B @TRA_INTB1
    Scenario: Submit a new Test with Multiple Contributors in the Public Sector 
    Given I enter a test project name "Pafs_Integration_2d"
      And I select a project type "restore_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter two new sector contributors "public_sector", "Test1", "Test2"
      And I enter new funding values for "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "3000", a2 "3000", a3 "3000", a4 "3000", a5 "3000", a6 "3000", column B b1 "2000", b2 "2000", b3 "2000", b4 "2000", b5 "2000", b6 "2000", column C c1 "1000", c2 "1000", c3 "1000", c4 "1000", c5 "1000", c6 "1000"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "Submit a new test with multiple contributors in the Public Sector "
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
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

# ============================================================================================================
# Training Test Environment
# ============================================================================================================

    @PAFS_INT @GROUP_B @TRA_INTB2
    Scenario: Submit a new OM2, OM2B proposals (Integration Test 2) with a dual risk source amd with move households 
    Given I enter a test project name "Pafs_Integration_2a"
      And I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Valid_ShapeFile.zip"
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
      And I upload a project funding calculator file for option "Yes", "PFCalcVs2020.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 Readiness for Service date as "high"
      And I add the confidence in securing the required Partnership Funding as "low"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
    When I complete my proposal on training
    Then I should see that my proposal is sent for review
