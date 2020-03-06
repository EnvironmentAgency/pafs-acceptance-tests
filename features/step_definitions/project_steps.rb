Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load
  sleep 0.75
end

Given(/^I have a valid "([^"]*)" username and password$/) do |user_type|
  @app.login_page.submit(
    email: Quke::Quke.config.custom["user_accounts"][user_type]["username"],
    password: Quke::Quke.config.custom["user_accounts"][user_type]["password"]
  )
end

Given(/^I create a new proposal$/) do
  @app.projects_page.create_proposal.click
end

Given(/^I enter a project name$/) do
  newname = "Project_Name_#{Time.now.to_i}"
  @app.project_name_page.submit(
    project_name: newname.to_sym
  )
end

Given(/^I enter a test project name "([^"]*)"$/) do |project_name|
  @app.project_name_page.submit(
    project_name: project_name.to_sym
  )
end

Given(/^I selected a project area "([^"]*)"$/) do |area_source|
  @app.project_area_selection_page.submit(
    areasource: area_source
  )
end

Given(/^I select a financial year to stop spending$/) do
  current_year = Time.now.year
  next_year = current_year + 1
  financial_year = "Year_#{current_year}_#{next_year}"
  @app.project_year_page.submit(
    option: financial_year.to_sym
  )
end

Given(/^I add a location "([^"]*)"$/) do |location|
  @app.proposal_overview_page.add_location.click
  @app.location_page.submit(
    location: location.to_sym
  )
end

Given(/^I upload a benefit area file "([^"]*)"$/) do |filename|
  @app.benefit_area_file_page.submit(
    file: filename
  )
  @app.benefit_area_file_summary_page.submit
end

Given(/^I enter a business case start date$/) do
  @app.proposal_overview_page.add_important_dates.click
  @app.start_outline_business_case_date_page.submit(
    month: "01",
    year: "2020"
  )
end

Given(/^I enter a award contract date$/) do
  @app.award_contract_date_page.submit(
    month: "01",
    year: "2021"
  )
end

Given(/^I enter a construction start date$/) do
  @app.start_construction_date_page.submit(
    month: "01",
    year: "2022"
  )
end

Given(/^I enter a ready for service date$/) do
  @app.ready_for_service_date_page.submit(
    month: "01",
    year: "2023"
  )
end

Given(/^I add the flood protection outcome as none$/) do
  @app.flood_protection_outcomes_page.submit(
    outcome: true
  )
end

Given(/^I add the coastal erosion protection outcome as none$/) do
  @app.coastal_erosion_protection_outcomes_page.submit(
    outcome: true
  )
end

# rubocop:disable Metrics/LineLength, Metrics/ParameterLists
Given(/^I add the flood protection outcome values for column A a1 "([^"]*)", a2 "([^"]*)", a3 "([^"]*)", a4 "([^"]*)", a5 "([^"]*)", a6 "([^"]*)", column B b1 "([^"]*)", b2 "([^"]*)", b3 "([^"]*)", b4 "([^"]*)", b5 "([^"]*)", b6 "([^"]*)", column C c1 "([^"]*)", c2 "([^"]*)", c3 "([^"]*)", c4 "([^"]*)", c5 "([^"]*)", c6 "([^"]*)"$/) do |a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3, c4, c5, c6|
  @app.flood_protection_outcomes_page.submit(
    a1: a1.to_sym,
    a2: a2.to_sym,
    a3: a3.to_sym,
    a4: a4.to_sym,
    a5: a5.to_sym,
    a6: a6.to_sym,
    b1: b1.to_sym,
    b2: b2.to_sym,
    b3: b3.to_sym,
    b4: b4.to_sym,
    b5: b5.to_sym,
    b6: b6.to_sym,
    c1: c1.to_sym,
    c2: c2.to_sym,
    c3: c3.to_sym,
    c4: c4.to_sym,
    c5: c5.to_sym,
    c6: c6.to_sym
  )
end
# rubocop:enable Metrics/LineLength, Metrics/ParameterLists

# rubocop:disable Metrics/LineLength, Metrics/ParameterLists
Given(/^I add the coastal erosion protection outcome values for column A a1 "([^"]*)", a2 "([^"]*)", a3 "([^"]*)", a4 "([^"]*)", a5 "([^"]*)", a6 "([^"]*)", column B b1 "([^"]*)", b2 "([^"]*)", b3 "([^"]*)", b4 "([^"]*)", b5 "([^"]*)", b6 "([^"]*)", column C c1 "([^"]*)", c2 "([^"]*)", c3 "([^"]*)", c4 "([^"]*)", c5 "([^"]*)", c6 "([^"]*)"$/) do |a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3, c4, c5, c6|
  @app.flood_protection_outcomes_page.submit(
    a1: a1.to_sym,
    a2: a2.to_sym,
    a3: a3.to_sym,
    a4: a4.to_sym,
    a5: a5.to_sym,
    a6: a6.to_sym,
    b1: b1.to_sym,
    b2: b2.to_sym,
    b3: b3.to_sym,
    b4: b4.to_sym,
    b5: b5.to_sym,
    b6: b6.to_sym,
    c1: c1.to_sym,
    c2: c2.to_sym,
    c3: c3.to_sym,
    c4: c4.to_sym,
    c5: c5.to_sym,
    c6: c6.to_sym
  )
end
# rubocop:enable Metrics/LineLength, Metrics/ParameterLists

# rubocop:disable Metrics/LineLength, Metrics/ParameterLists
Given(/^I add the coastal erosion protection outcome values for column A a1 "([^"]*)", a2 "([^"]*)", a3 "([^"]*)", a4 "([^"]*)", a5 "([^"]*)", a6 "([^"]*)", column B b1 "([^"]*)", b2 "([^"]*)", b3 "([^"]*)", b4 "([^"]*)", b5 "([^"]*)", b6 "([^"]*)", column C c1 "([^"]*)", c2 "([^"]*)", c3 "([^"]*)", c4 "([^"]*)", c5 "([^"]*)", c6 "([^"]*)"$/) do |a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3, c4, c5, c6|
  @app.coastal_erosion_protection_outcomes_page.submit(
    a1: a1.to_sym,
    a2: a2.to_sym,
    a3: a3.to_sym,
    a4: a4.to_sym,
    a5: a5.to_sym,
    a6: a6.to_sym,
    b1: b1.to_sym,
    b2: b2.to_sym,
    b3: b3.to_sym,
    b4: b4.to_sym,
    b5: b5.to_sym,
    b6: b6.to_sym,
    c1: c1.to_sym,
    c2: c2.to_sym,
    c3: c3.to_sym,
    c4: c4.to_sym,
    c5: c5.to_sym,
    c6: c6.to_sym
  )
end

# rubocop:enable Metrics/LineLength, Metrics/ParameterLists

Given(/^I return to the overview page$/) do
  @app.proposal_under_review_page.return_to_the_proposal_overview_page.click
end

Given(/^I revert to draft$/) do
  @app.proposal_overview_page.revert_to_draft.click
end

Given(/^I add the standard of protection before project starts as "([^"]*)"$/) do |before|
  @app.proposal_overview_page.add_standard_of_protection.click
  @app.standard_of_protection_page.submit(
    option: before.to_sym
  )
end

Given(/^I add the standard of protection after project completes as "([^"]*)"$/) do |after|
  @app.standard_of_protection_after_page.submit(
    option: after.to_sym
  )
end

Given(/^I add the standard of protection coastal erosion starts as "([^"]*)"$/) do |before|
  @app.standard_of_protection_coastal_before_page.submit(
    option: before.to_sym
  )
end

Given(/^I add the standard of protection before coastal erosion starts as "([^"]*)"$/) do |before|
  @app.proposal_overview_page.add_standard_of_coastal_protection.click
  @app.standard_of_protection_coastal_before_page.submit(
    option: before.to_sym
  )
end

Given(/^I add the standard of protection after coastal erosion project completes as "([^"]*)"$/) do |after|
  @app.standard_of_protection_coastal_after_page.submit(
    option: after.to_sym
  )
end

Given(/^I enter the projects goal approach "([^"]*)"$/) do |msg|
  @app.proposal_overview_page.add_goals.click
  @app.approach_page.submit(
    approach: msg.to_sym
  )
end

# rubocop:disable Metrics/BlockLength
Given(/^I enter environmental outcomes improvements$/) do
  @app.proposal_overview_page.add_environmental_outcomes.click
  @app.environmental_outcomes_page.submit(
    improve: true
  )
  @app.surface_and_groundwater_amount_page.submit(
    length: "1000"
  )
  @app.improve_spa_or_sac_page.submit(
    improve: true
  )
  @app.improve_habitat_amount_page.submit(
    amount: "2000"
  )
  @app.improve_river_page.submit(
    improve: true
  )
  @app.improve_river_amount_page.submit(
    amount: "3000"
  )
  @app.habitat_creation_page.submit(
    create: true
  )
  @app.habitat_creation_amount_page.submit(
    amount: "4000"
  )
  @app.remove_fish_barrier_page.submit(
    remove: true
  )
  @app.remove_eel_barrier_page.submit(
    remove: true
  )
  @app.fish_or_eel_amount_page.submit(
    amount: "5000"
  )
end
# rubocop:enable Metrics/BlockLength

Given(/^I enter no environmental outcomes improvements$/) do
  @app.proposal_overview_page.add_environmental_outcomes.click
  @app.environmental_outcomes_page.submit(
    improve: false
  )
  @app.improve_spa_or_sac_page.submit(
    improve: false
  )
  @app.improve_sssi_page.submit(
    improve: false
  )
  @app.improve_hbi_page.submit(
    improve: false
  )
  @app.habitat_creation_page.submit(
    create: false
  )
  @app.remove_fish_barrier_page.submit(
    remove: false
  )
  @app.remove_eel_barrier_page.submit(
    remove: false
  )
end

Given(/^I click and continue$/) do
  @app.click_and_continue.submit_button.click
end

# Then Actions
Then(/^I upload my project funding calculator file "([^"]*)"$/) do |filename|
  @app.proposal_overview_page.add_funding_calculator.click
  @app.funding_calculator_page.submit(
    file: filename
  )
  @app.funding_calculator_summary_page.submit
end

Then(/^I should see that my proposal is sent for review$/) do
  expect(@app.confirm_page).to have_project_number
  expect(@app.proposal_overview_page).to have_text("Proposal sent for review")
end

Then(/^I should see that my proposal is submitted$/) do
  expect(@app.confirm_page).to have_project_number
  expect(@app.proposal_overview_page).to have_text("Proposal submitted")
end

Then(/^I should see that my proposal is under review$/) do
  expect(@app.confirm_page).to have_project_number
  expect(@app.proposal_overview_page).to have_text("Proposal under review")
end

Then(/^its status is draft$/) do
  @status = @app.proposal_overview_page.first_project.text
  expect(@app.proposal_overview_page.first_project.text).to eq "Draft"
end
