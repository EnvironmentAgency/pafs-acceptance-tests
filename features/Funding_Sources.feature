@frontoffice
Feature: Create a new project application for Funding Sources
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

Backgound:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

  @regression @fundingsources @RMAUser @Table
  Scenario Outline: Sumbmit a new proposal with Grant in Aid funding by an RMA User
      Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "<Funding_Source>"
      And I enter my funding values for "<Funding_Source>" current year "<Yr1>", year after "<YearAfter>" and year after "<YearAfter>"
    When I check the proposal overview page
    Then I should see the funding sources as Grant in Aid
      And Total Esitmated Spend as "<Total_Spend>"

    Examples:
      |Funding_Source|Previous|2015-2016|2016-2017|2017-2018|2018-2019|2019-2020|Total_Spend|
      |Grant_in_Aid|1000|1000|1000|1000|1000|1000|3000|



  @regression @fundingsources @internaldrainageboards @Dual_User
  Scenario: Sumbmit a new proposal with Internal Drainage funding for dual area selection
      Given I selected a project area "rma_name_pso_west_of_england"
      And I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for internal drainage boards
      And I enter my funding values for internal drainage boards
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" 
      And I add the standard of protection after project completes as "low_risk"
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I select the project urgency as "emergency" with a project message of "There is an emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review
