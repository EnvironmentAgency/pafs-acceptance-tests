@frontoffice
Feature: Create a new project application for Project Proposal Type
  As a council
  I want to submit a project type for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

  Background: 
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

#================================================================================================================
# QA Test Environment Tests
#================================================================================================================

  @QA_ProjectTypeTests
  Scenario: Sumbmit a new defence proposal
    Given I select a project type "change_or_new_asset" 
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  @QA_ProjectTypeTests
  Scenario: Sumbmit a new restore asset proposal
    Given I select a project type "restore_asset"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  @QA_ProjectTypeTests
  Scenario: Sumbmit a new property level protection proposal
    Given I select a project type "property_level_protection"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

  @QA_ProjectTypeTests
  Scenario: Sumbmit a new strategy proposal
    Given I select a project type "strategy"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Produce a strategy for complex flood or coastal erosion risk situations across several interconnected areas"

  @QA_ProjectTypeTests
  Scenario: Sumbmit a new benefit hosuseholds yes proposal
    Given I select a project type "benefits_households_yes"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Carry out an environmental project that also benefits households"

  @QA_ProjectTypeTests
  Scenario: Sumbmit a new benefit households no proposal
    Given I select a project type "benefits_households_no"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Carry out an environmental project that doesn't benefit any households"

#================================================================================================================
# QA Test Environment Tests
#================================================================================================================

  @TRA_ProjectTypeTests
  Scenario: Sumbmit a new defence proposal
    Given I select a project type "change_or_new_asset" 
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Create a new flood or coastal erosion risk management asset, or improve the standard of service of an existing one"

  @TRA_ProjectTypeTests
  Scenario: Sumbmit a new restore asset proposal
    Given I select a project type "restore_asset"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement"

  @TRA_ProjectTypeTests
  Scenario: Sumbmit a new property level protection proposal
    Given I select a project type "property_level_protection"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Add property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding"

  @TRA_ProjectTypeTests
  Scenario: Sumbmit a new strategy proposal
    Given I select a project type "strategy"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Produce a strategy for complex flood or coastal erosion risk situations across several interconnected areas"

  @TRA_ProjectTypeTests
  Scenario: Sumbmit a new benefit hosuseholds yes proposal
    Given I select a project type "benefits_households_yes"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Carry out an environmental project that also benefits households"

  @TRA_ProjectTypeTests
  Scenario: Sumbmit a new benefit households no proposal
    Given I select a project type "benefits_households_no"
    And I select financial year to stop spending
  When I am returned to the proposal overview page
  Then I should see the project type is "Carry out an environmental project that doesn't benefit any households"
