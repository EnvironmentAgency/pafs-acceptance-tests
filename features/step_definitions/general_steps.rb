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

Given(/^I name my project "([^"]*)"$/) do |name|
  @app.project_name_page.submit(
    project_name: name.to_sym
  )
end

Given(/^I select project type "([^"]*)"$/) do |action|
  @app.project_type_page.submit(
    option: action.to_sym
  )
end

Given(/^I select financial year to stop spending "([^"]*)"$/) do |year|
  @app.project_year_page.submit(
    option: year.to_sym
  )
end

Given(/^I add a location "([^"]*)"$/) do |location|
  @app.proposal_overview_page.add_location.click
  @app.location_page.submit(
    location: location.to_sym
  )
end

Given(/^I upload my benefit area file$/) do
  @app.benefit_area_file_page.submit

  @app.benefit_area_file_summary_page.submit

end

Given(/^I enter my business case start date$/) do
  @app.proposal_overview_page.add_important_dates.click
  @app.start_outline_business_case_date_page.submit(
    month: "01",
    year: "2020"
  )

end

Given(/^I enter my award contract date$/) do
  @app.award_contract_date_page.submit(
    month: "01",
    year: "2021"
  )

end

Given(/^I enter my construction start date$/) do
  @app.start_construction_date_page.submit(
    month: "01",
    year: "2022"
  )

end

Given(/^I enter my ready for service date$/) do
  @app.ready_for_service_date_page.submit(
    month: "01",
    year: "2023"
  )

end

Then(/^I should see my entered details in the the proposal overview$/) do
  @project_number = @app.proposal_overview_page.project_number.text
  expect(@app.proposal_overview_page).to have_project_number
  expect(@app.proposal_overview_page.project_name.text).to eq "Flood defence test"

end
