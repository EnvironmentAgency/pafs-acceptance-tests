@GrantInAid @DualAreaUser
  Scenario: Sumbmit a new proposal with Grant in Aid funding for dual area selection
    Given I am an external user
      And I have a valid dual_area_user username and password
      And I create a new proposal
      And I enter a project name
      And I selected a project area "bristol_city_council"
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
      And I enter my business case start date
      And I enter my award contract date
      And I enter my construction start date
      And I enter my ready for service date
      And I enter my funding sources for others not identified
      And I enter my funding values for other not identified
      And I answer if the project could start sooner if grant in aid funding was made available earlier questions
      And I add my project risks
      And I add the standard of protection before project starts as "very_significant_risk" and "low_risk" when project completes
      And I enter the projects goal approach
      And I enter environmental outcomes improvements
      And I enter the project urgency as "emergency"
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is sent for review

 @GrantInAid @DualAreaUser
  Scenario: Sumbmit a new proposal with Internal Drainage funding for dual area selection
    Given I am an external user
      And I have a valid dual_area_user username and password
      And I create a new proposal
      And I enter a project name
      And I selected a project area "west_of_england"
      And I select project type "change_or_new_asset"
      And I select financial year to stop spending
      And I add a location "ST 58198 72725"
      And I upload my benefit area file
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
      And I upload my project funding calculator file
    When I complete my proposal
    Then I should see that my proposal is sent for review