@frontoffice
Feature: OM Test 1 run against the soltuiin
  I Want to run OM tests against the soltion 
  So that I can confirm that the solution still functions as expected

  # User test, rma and pso
  Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal

    @QA_PAFS_INT_GROUP_C @TRA_PAFS_INT_GROUP_C @QA_NEW1
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
      And I enter new funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "local_levy"
      And I enter new funding values for "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "growth_funding"
      And I enter new funding values for "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "internal_drainage_boards"
      And I enter new funding values for "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "not_identified"
      And I enter new funding values for "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter new funding values for "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I click and continue
      # Then I change my funding sources
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery"
      And I enter new funding values for "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I click and continue
      # Then I change my funding sources
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt HAll"
      And I enter new funding values for "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000" 
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
      And I enter the projects goal approach "Submit a new project with new v8 Calc sheet inc. Triple Funding Sources, Flood Protection, V8 PFC Sheet"
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

   @QA_PAFS_INT_GROUP_C @TRA_PAFS_INT_GROUP_C @QA_NEW2
    Scenario: Submit a new project with new 2020 Calc sheet inc. Triple Funding Sources, Flood Protection, 2020 PFC Sheet
    Given I enter a test project name "Pafs_Integration_Demo2"
      And I select a project type "restore_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload a benefit area file "Valid_ShapeFile.zip"
      And I enter a business case start date
      And I enter a award contract date
      And I enter a construction start date
      And I enter a ready for service date
      And I enter a funding source for "grant_in_aid"
      And I enter new funding values for "grant_in_aid" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "local_levy"
      And I enter new funding values for "local_levy" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "growth_funding"
      And I enter new funding values for "growth_funding" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "internal_drainage_boards"
      And I enter new funding values for "internal_drainage_boards" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "not_identified"
      And I enter new funding values for "not_identified" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      # Then I change my funding sources
      And I enter a funding source for "public_sector"
      And I enter a new sector contributor of "public_sector", "Jason Leigh-Griffiths"
      And I enter new funding values for "public_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I click and continue
      # Then I change my funding sources
      And I enter a funding source for "private_sector"
      And I click and continue
      And I click and continue
      And I enter a new sector contributor of "private_sector", "Rose Rothery"
      And I enter new funding values for "private_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000"
      And I click and continue
      # Then I change my funding sources
      And I enter a funding source for "other_sector"
      And I click and continue
      And I click and continue
      And I click and continue
      And I click and continue      
      And I enter a new sector contributor of "other_sector", "Matt HAll"
      And I enter new funding values for "other_sector" previous year "1000", 2015-2016 "2000", 2016-2017 "3000", 2017-2018 "4000", 2018-2019 "5000", 2019-2020 "6000" 
      And I click and continue
      And I answer YES if the project could start sooner "01", "2020"
      And I add my main project risk "tidal"
      And I add the flood protection outcome values for column A a1 "3", a2 "3", a3 "3", a4 "3", a5 "3", a6 "3", column B b1 "2", b2 "2", b3 "2", b4 "2", b5 "2", b6 "2", column C c1 "1", c2 "1", c3 "1", c4 "1", c5 "1", c6 "1"
      And I add a second project risk "coastal"
      And I click and continue
      And I click and continue
      And I add the coastal erosion protection outcome values for column A a1 "6", a2 "6", a3 "6", a4 "6", a5 "6", a6 "6", column B b1 "4", b2 "4", b3 "4", b4 "4", b5 "4", b6 "4", column C c1 "2", c2 "2", c3 "2", c4 "2", c5 "2", c6 "2"
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I add the standard of protection coastal erosion starts as "one_to_four_years"
      And I add the standard of protection after coastal erosion project completes as "less_that_ten_years"
      And I enter the projects goal approach "Submit a new project with new 2020 Calc sheet inc. Triple Funding Sources, Flood Protection, 2020 PFC Sheet"
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency"
      And I enter the project urgent message box of "Beacuse it is an Emercency"
      And I upload a project funding calculator file for option "Yes", "PFCalcVs2020.xlsx"
      And I select the confidence page
      And I add the confidence in number of homes better protected by this project as "high"
      And I add the confidence in homes being delivered by the projects Gateway 4 Readiness for Service date as "high"
      And I add the confidence in securing the required Partnership Funding as "low"
      And I select the carbon page
      And I add how much capital carbon will this project produce in tonnes "1"
      And I add how much carbon will this project’s assets produce in their lifecycle "2"
   When I complete my proposal on QA
   Then I should see that my proposal is sent for review

   # Test Nagvaite message 
