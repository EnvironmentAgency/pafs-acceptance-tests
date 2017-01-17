@frontoffice @wip
Feature: Create a new project application
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background:
    Given I am an external user
      And I have a valid username and password

  @happy_path
  Scenario: Create a new proposal overview with Grant in Aid and Levy funding
    Given I create a new proposal
      And I request Grant in Aid funding
      And I request Local Levy funding
      And I name my project "Flood defence test"
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending "Year_2016_2017"
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
     Then I should see my entered details in the the proposal overview


