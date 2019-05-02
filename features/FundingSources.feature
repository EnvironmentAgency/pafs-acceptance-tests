@frontoffice
Feature: Create a new project application
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  @regression @fundingsources @grantinaid @RMAUser
  Scenario: Sumbmit a new proposal with Grant in Aid funding by an RMA User
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
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
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @locallevy @RMAUser
  Scenario: Sumbmit a new proposal with Local Levey funding by an RMA User
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for local levy
      And I enter my funding values for local levy
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @publicsector @RMAUser
  Scenario: Sumbmit a new proposal with Public Sector funding by an RMA User
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for public sector
      And I enter a sector contributor of public sector
      And I enter my funding values for public sector
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @privatesector @RMAUser
  Scenario: Sumbmit a new proposal with Private Sector funding by an RMA User
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for private sector
      And I enter a sector contributor of private sector
      And I enter my funding values for private sector
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @contributionsfromothers @RMAUser
  Scenario: Sumbmit a new proposal with Contributions From Others funding by an RMA User
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for contributions from others
      And I enter a sector contributor of contributions from others
      And I enter my funding values for contributions from others
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @internaldrainageboards @RMAUser
  Scenario: Sumbmit a new proposal with Internal Drainage funding by an RMA User
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
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
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @othernotidentifed @RMAUser
  Scenario: Sumbmit a new proposal Other Not Identifed funding by an RMA User
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for others not identified
      And I enter my funding values for others not identified
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @grantgnaid @PSOUser
  Scenario: Sumbmit a new proposal with Grant in Aid funding by an PSO User
    Given I am an external user
      And I have a valid "pso" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
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
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @locallevy @PSOUser
  Scenario: Sumbmit a new proposal with Local Levey funding by an PSO User
    Given I am an external user
      And I have a valid "pso" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for local levy
      And I enter my funding values for local levy
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @publicsector @PSOUser
  Scenario: Sumbmit a new proposal with Public Sector funding by an PSO User
    Given I am an external user
      And I have a valid "pso" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for public sector
      And I enter a sector contributor of public sector
      And I enter my funding values for public sector
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @privatesector @PSOUser
  Scenario: Sumbmit a new proposal with Private Sector funding by an PSO User
    Given I am an external user
      And I have a valid "pso" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for private sector
      And I enter a sector contributor of private sector
      And I enter my funding values for private sector
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @contributionsfromothers @PSOUser
  Scenario: Sumbmit a new proposal with Contributions From Others funding by an PSO User
    Given I am an external user
      And I have a valid "pso" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for contributions from others
      And I enter a sector contributor of contributions from others
      And I enter my funding values for contributions from others
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @internaldrainageboards @PSOUser
  Scenario: Sumbmit a new proposal with Internal Drainage Boards funding by an PSO User
    Given I am an external user
      And I have a valid "pso" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
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
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @othernotidentified @PSOUser
  Scenario: Sumbmit a new proposal Other Not Identified funding by an PSO User
    Given I am an external user
      And I have a valid "pso" username and password
      And I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for others not identified
      And I enter my funding values for others not identified
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is under review

  # User with Two Areas 
  @regression @fundingsources @grantinaid @Dual_User
  Scenario: Sumbmit a new proposal with Grant in Aid funding for dual area selection
    Given I am an external user
      And I have a valid "dual" username and password
      And I create a new proposal
      And I enter a project name
      And I selected a project area "rma_name_bristol_city_council"
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file "Test_ShapeFile.zip"
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for others not identified
      And I enter my funding values for others not identified
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review

  @regression @fundingsources @internaldrainageboards @Dual_User
  Scenario: Sumbmit a new proposal with Internal Drainage funding for dual area selection
    Given I am an external user
      And I have a valid "dual" username and password
      And I create a new proposal
      And I enter a project name
      And I selected a project area "rma_name_pso_west_of_england"
      And I select project type "change_or_new_asset"
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
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file "LIT_9160_97331cOM4TEST.xlsx"
    When I complete my proposal
    Then I should see that my proposal is sent for review
