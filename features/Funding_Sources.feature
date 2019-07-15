@frontoffice
Feature: Create a new project application for Funding Sources
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

  # Single Funding Source of Grant in Aid, Local Levy, Growth Funding, Internal Drainge Board, Not Yet Identified
  @Regression @Oldfundingsources @RMAUser @fs1
  Scenario Outline: Submit a new proposals with a funding source
    Given I select a project type "<project_type>"
      And I select financial year to stop spending
      And I add a location "<location>"
      And I upload my benefit area file "<shapefile>"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for "<funding_source>"
      And I enter my funding values for "<funding_source>" previous year "<previous>", 2015-2016 "<2015-2016>", 2016-2017 "<2016-2017>", 2017-2018 "<2017-2018>", 2018-2019 "<2018-2019>", 2019-2020 "<2019-2020>"
    When I check the proposal overview page
    Then I should see the total estimated spend as "<total_spend>"
      And I should see the funding source contributor "<funding_source>"

    Examples:
      |project_type|location|shapefile|funding_source|previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|total_spend|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|grant_in_aid|1000|2000|3000|4000|5000|6000|21,000|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|local_levy|10|2000|3000|4000|5000|6000|20,010|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|growth_funding|10|2000|3000|4000|5000|6000|20,010|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|internal_drainage_boards|10|2000|3000|4000|5000|6000|20,010|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|not_identified|1000|2000|2000|4000|2000|6000|17,000|      

  # Single Contributor: Public, Private and Other Sector
  @Regression @Oldfundingsources @RMAUser @fs2
  Scenario Outline: Submit a new proposals with a funding source
    Given I select a project type "<project_type>"
      And I select financial year to stop spending
      And I add a location "<location>"
      And I upload my benefit area file "<shapefile>"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for "<funding_source>"
      And I enter a sector contributor of "<funding_source>", "<contributor>"
      And I enter my funding values for "<funding_source>" previous year "<previous>", 2015-2016 "<2015-2016>", 2016-2017 "<2016-2017>", 2017-2018 "<2017-2018>", 2018-2019 "<2018-2019>", 2019-2020 "<2019-2020>"
    When I check the proposal overview page
    Then I should see the total estimated spend as "<total_spend>"
      And I should see the funding source contributor "<contributor>"

    Examples:
      |project_type|location|shapefile|funding_source|contributor|previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|total_spend|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|public_sector|Public Test Council|1000|2000|3000|4000|5000|6000|21,000|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|private_sector|Private Investment Company|0|2000|3000|4000|5000|6000|20,000|
      |change_or_new_asset|ST 58198 72725|Valid_ShapeFile1.zip|other_sector|Other Contribution Investment Company|5000|5000|5000|5000|5000|5000|30,000|
