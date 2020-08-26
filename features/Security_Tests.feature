  # SHAPEFILE - Virus 
  @QA_Security @QA_R7 
  Scenario Outline: Sumbmit a new proposal with an pseudo-virus shapefile
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a project name
    And I select a project type "change_or_new_asset"
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I upload the benefit area file "<ShapeFile>"
  When I view the benefit file page
  Then I should see the message "<Message>" on the benefit file page

    Examples:
    |ShapeFile|Message|
    |Virus_ShapeFile.zip|The file was rejected because it may contain a virus. Check the file and try again|

 @TRA_Security @TRA_R5
  Scenario Outline: Sumbmit a new proposal with an valid shapefile
  Given I am an external user
    And I have a valid "rma" username and password
    And I select "yes" for Pafs to store cookies on my device
    And I create a new proposal
    And I enter a project name 
    And I select a project type "change_or_new_asset"
    And I select a financial year to stop spending
    And I add a location "ST 58198 72725"
    And I upload the benefit area file "<ShapeFile>"
  When I view the benefit area page
  Then I should see the message "<Message>" on the benefit area page

    Examples:
    |ShapeFile|Message|
    |Valid_ShapeFile.zip|The uploaded shapefile|
