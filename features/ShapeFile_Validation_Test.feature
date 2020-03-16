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

#================================================================================================================
# QA Test Environment Tests
#================================================================================================================

  # Valid ShapeFile Validation 
  @QA_ShapeFileTests @QSF1
  Scenario Outline: Sumbmit a new proposal with an valid shapefile
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit area page
    Then I should see the message "<Message>" on the benefit area page

    Examples:
    |ShapeFile|Message|
    |Valid_ShapeFile.zip|The uploaded shapefile|

  # Invalid ShapeFile Validation 
  @QA_ShapeFileTests @QSF2
  Scenario Outline: Sumbmit a new proposal with an invalid shapefile
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |ShapeFile.png|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|
    |Invalid_ShapeFile.zip|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|

  # Virus ShapeFile Validation 
  @QA_ShapeFileTests @QSF3
  Scenario Outline: Sumbmit a new proposal with an pseudo-virus shapefile
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |Virus_ShapeFile.zip|The file was rejected because it may contain a virus. Check the file and try again|

  # Blank File Validation 
  @QA_ShapeFileTests @QSF4
  Scenario Outline: Sumbmit a new proposal with no file
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I click and continue
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |Message|
    |Upload a shapefile that outlines the area the project is likely to benefit|

#================================================================================================================
# TRA Test Environment Tests
#================================================================================================================

  # Valid ShapeFile Validation
  @TRA_ShapeFileTests @TSF1
  Scenario Outline: Sumbmit a new proposal with an valid shapefile
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit area page
    Then I should see the message "<Message>" on the benefit area page

    Examples:
    |ShapeFile|Message|
    |Valid_ShapeFile.zip|The uploaded shapefile|

  # Invalid ShapeFile Validation 
  @TRA_ShapeFileTests @TSF2
  Scenario Outline: Sumbmit a new proposal with an invalid shapefile
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |ShapeFile.png|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|
    |Invalid_ShapeFile.zip|The selected file must be a zip file, containing the following mandatory files: dbf. shx. shp. prj.|

  # Virus ShapeFile Validation 
  @TRA_ShapeFileTests @TSF3
  Scenario Outline: Sumbmit a new proposal with an pseudo-virus shapefile
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload the benefit area file "<ShapeFile>"
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |Virus_ShapeFile.zip|The file was rejected because it may contain a virus. Check the file and try again|

  # Blank File Validation 
  @TRA_ShapeFileTests @TSF4
  Scenario Outline: Sumbmit a new proposal with no file
    Given I select a project type "change_or_new_asset"
      And I select a financial year to stop spending
      And I add a location "ST 58198 72725"
      And I click and continue
    When I view the benefit file page
    Then I should see the message "<Message>" on the benefit file page

    Examples:
    |Message|
    |Upload a shapefile that outlines the area the project is likely to benefit|
