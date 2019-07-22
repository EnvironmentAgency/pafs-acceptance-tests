@frontoffice
Feature: Run regression tests against the soltuiin
  I Want to run regression tests against the soltion 
  So that I can confirm that the solution still functions as expected

  Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

 @regressionTests #Funding Sources OLD 
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

  @regressionTests #Project Urgency
  Scenario: Submit a full proposal to check project not urgency with rma user
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for grant in aid
      And I enter my funding values for grant in aid 
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk"
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I select the project urgency as "not_urgent"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regressionTests #@Project Type 
  Scenario: Sumbmit a new defence proposal
    Given I select a project type "change_or_new_asset" 
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  @regressionTests #@Project Type 
  Scenario: Sumbmit a new restore asset proposal
    Given I select a project type "restore_asset"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  @regressionTests #@Project Type 
  Scenario: Sumbmit a new property level protection proposal
    Given I select a project type "property_level_protection"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

  