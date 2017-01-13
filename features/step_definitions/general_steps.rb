Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load
  @app.front_office_home_page.start_button.click

end

Given(/^I have a valid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: "tim.stone@environment-agency.gov.uk",
    password: "Abcde12345"
  )

end

Given(/^I create a new proposal$/) do
  @app.projects_page.create_proposal.click
end

Given(/^I request Grant in Aid funding$/) do
  @app.grant_in_aid_funding_page.submit(
    grant_in_aid: true
  )
end

Given(/^I request Local Levy funding$/) do
  @app.local_levy_funding_page.submit(
    local_levy_funding: true
  )
end

Given(/^I name my project$/) do
  @app.project_name_page.submit(
    project_name: "Flood defence test")
end

Given(/^I select project type "([^"]*)"$/) do |action|
  
    @app.project_type_page.submit(
    tab: action.to_sym
  )
end

Given(/^I select financial year to stop spending 'April (\d+) to March (\d+)'$/) do |_arg1, _arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the proposal overview$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
