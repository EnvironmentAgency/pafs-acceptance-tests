@frontoffice
Feature: Create a new project application
  As a 
  I want to 
  So that ...

  Background:
    Given I am an external user
      And I have a valid username and password

  @happy_path
  Scenario: Create a new proposal overview
    Given I create a new proposal
      And I request Grant in Aid funding
      And I request Local Levy funding
      And I name my project
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending "Year_2016_2017"
     Then I should see the proposal overview
