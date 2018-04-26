Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load
  # @app.front_office_home_page.start_button.click

end

Given(/^I have a valid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: Quke::Quke.config.custom["accounts"]["pafs_user"]["username"],
    password: Quke::Quke.config.custom["accounts"]["pafs_user"]["password"]
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

# For funding_sources, it looks for end part of ID funding_sources_step_ and clicks on that check box
# If box is already checked then will uncheck box
Given(/^I enter my funding sources$/) do
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: %w[fcerm_gia]
  )
end

Given(/^I enter my funding values$/) do
  @app.funding_values_page.gia_current_year.set "1000"
  @app.funding_values_page.gia_2015_2016.set "1000"
  @app.funding_values_page.gia_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I answer if the project could start sooner if grant in aid funding was made available earlier questions$/) do
  @app.proposal_overview_page.add_earliest_start.click
  @app.earliest_start_page.submit(
    earlier_start: true
  )
  @app.earliest_date_page.submit(
    month: "01",
    year: "2019"
  )
end

# checks each box with the ID endings shown in the risks: array in brackets
Given(/^I add my project risks$/) do
  @app.proposal_overview_page.add_risks.click
  @app.risks_page.submit(
    risks: %w[tidal_flooding sea_flooding]
  )
  # Picks the first risk as the main risk - else picks the last risk
  @app.main_risk_page.submit(
    choose_first: true
  )

  @app.flood_protection_outcomes_page.submit(
    a1: "1000",
    a2: "100",
    a3: "10",
    b1: "1000",
    b2: "100",
    b3: "10",
    c1: "1000",
    c2: "100",
    c3: "10"
  )
end

# rubocop:disable Metrics/LineLength
Given(/^I add the standard of protection before project starts as "([^"]*)" and "([^"]*)" when project completes$/) do |before, after|
  @app.proposal_overview_page.add_standard_of_protection.click
  @app.standard_of_protection_page.submit(
    option: before.to_sym
  )
  @app.standard_of_protection_after_page.submit(
    option: after.to_sym
  )
end
# rubocop:enable Metrics/LineLength

Given(/^I enter the projects goal approach$/) do
  @app.proposal_overview_page.add_goals.click
  @app.approach_page.submit(
    approach: "This is the projects approach...."
  )
end

# rubocop:disable Metrics/BlockLength
Given(/^I enter environmental outcomes improvements$/) do
  @app.proposal_overview_page.add_environmental_outcomes.click
  @app.environmental_outcomes_page.submit(
    improve: true
  )
  @app.surface_and_groundwater_amount_page.submit(
    length: "100"
  )
  @app.improve_spa_or_sac_page.submit(
    improve: true
  )
  @app.improve_habitat_amount_page.submit(
    amount: "100"
  )
  @app.improve_river_page.submit(
    improve: true
  )
  @app.improve_river_amount_page.submit(
    amount: "100"
  )
  @app.habitat_creation_page.submit(
    create: true
  )
  @app.habitat_creation_amount_page.submit(
    amount: "100"
  )
  @app.remove_fish_barrier_page.submit(
    remove: true
  )
  @app.remove_eel_barrier_page.submit(
    remove: true
  )
  @app.fish_or_eel_amount_page.submit(
    amount: "100"
  )
end
# rubocop:enable Metrics/BlockLength

Given(/^I enter the project urgency as "([^"]*)"$/) do |urgency|
  @app.proposal_overview_page.add_project_urgency.click
  @app.urgency_page.submit(
    option: urgency.to_sym
  )
  @app.urgency_details_page.submit(
    details: "These are the urgency details"
  )

end

Then(/^I upload my project funding calculator file$/) do
  @app.proposal_overview_page.add_funding_calculator.click
  @app.funding_calculator_page.submit
  @app.funding_calculator_summary_page.submit

end

Then(/^I should see my entered details in the the proposal overview$/) do
  @project_number = @app.proposal_overview_page.project_number.text
  expect(@app.proposal_overview_page).to have_project_number
  expect(@app.proposal_overview_page.project_name.text).to eq "Flood defence test"

end

When(/^I complete my proposal$/) do
  @project_number = @app.proposal_overview_page.project_number.text
  @app.proposal_overview_page.complete_proposal.click

end

Then(/^I should see that my proposal has been sent for review$/) do
  expect(@app.confirm_page).to have_project_number
  expect(@app.proposal_overview_page).to have_text("Proposal sent for review")

end

When(/^I return to the proposal overview page$/) do
  @app.grant_in_aid_funding_page.user_bar.projects.click
end

Then(/^its status is draft$/) do
  @status = @app.proposal_overview_page.first_project.text
  expect(@app.proposal_overview_page.first_project.text).to eq "Draft"
end
