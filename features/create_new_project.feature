@frontoffice
Feature: Create a new project application
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background:
    Given I am an external user
      And I have a valid username and password

  @happy_path
  Scenario: Sumbmit a new proposal with Grant in Aid and Levy funding
    Given I create a new proposal
      And I request Grant in Aid funding
      And I request Local Levy funding
      And I name my project "Flood defence test"
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending "Year_2016_2017"
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources
      And I enter my funding values
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
	   When I complete my proposal
     Then I should see that my proposal has been sent for review
