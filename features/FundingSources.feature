@frontoffice
Feature: Create a new project application
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background:
    Given I am an external user
      And I have a valid username and password

  @regression @fundingsources @GrantInAid
  Scenario: Sumbmit a new proposal with Grant in Aid funding
    Given I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "Grant_in_aid"
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @local_levy
  Scenario: Sumbmit a new proposal with Local Levey funding
    Given I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "Local_Levy"
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @PublicSector
  Scenario: Sumbmit a new proposal with Public Sector funding
    Given I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "Public_Sector"
      And I enter sector contibutors
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @PrivateSector
  Scenario: Sumbmit a new proposal with Private Sector funding
    Given I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "Private_Sector"
      And I enter sector contibutors
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @ContributionsFromOthers
  Scenario: Sumbmit a new proposal with Contributions From Others funding
    Given I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "Contributions_from_others"
      And I enter sector contibutors
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @InternalDrainage
  Scenario: Sumbmit a new proposal with Internal Drainage funding
    Given I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "Internal_Drainage"
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is under review

  @regression @fundingsources @OtherNotIdentifed
  Scenario: Sumbmit a new proposal Other Not Identifed funding
    Given I create a new proposal
      And I enter a project name
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources "Other_Not_Identifed"
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is under review