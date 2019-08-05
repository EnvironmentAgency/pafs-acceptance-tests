@frontoffice
Feature: Create a new project application for ShapeFile validation
  As a council
  I want to submit a proposal for flood and coastal erosion risk management project funding
  So that my local area can have improved protection from flooding

Background:
    Given I am an external user
      And I have a valid "rma" username and password
      And I create a new proposal
      And I enter a project name

  # Valid ShapeFile Validation 
  @shapefile @sf1
  Scenario Outline: Sumbmit a new proposal with an valid shapefile
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit area page
    Then I should see the message "<Message>" on the benefit area page

    Examples:
    |ShapeFile|Message|
    |Valid_ShapeFile1.zip|The uploaded shapefile|
    |Valid_ShapeFile2.zip|The uploaded shapefile|
    |Valid_ShapeFile3.zip|The uploaded shapefile|

  # Invalid ShapeFile Validation 
  @shapefile @sf2
  Scenario Outline: Sumbmit a new proposal with an invalid shapefile
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |ShapeFile.png|This file type is not supported. Upload a .zip shapefile|
    |Invalid_ShapeFile.zip|The selected file must be a zip file containing a shapefile|

  # Virus ShapeFile Validation 
  @shapefile @sf3
  Scenario Outline: Sumbmit a new proposal with an pseudo-virus shapefile
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |virus.zip|The file was rejected because it may contain a virus. Check the file and try again|

  @shapefile @sf4
  Scenario Outline: Sumbmit a new proposal with an pseudo-virus shapefile
    Given I select a project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |virus.zip|The file was rejected because it may contain a virus. Check the file and try again|
