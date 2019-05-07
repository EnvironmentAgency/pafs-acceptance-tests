Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load
  # @app.front_office_home_page.start_button.click
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

Given(/^I selected a project area "([^"]*)"$/) do |area_source|
  @app.project_area_selection_page.submit(
    areasource: area_source
  )
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

Given(/^I enter a project name$/) do
  newname = "Project_Name_#{Time.now.to_i}"
  @app.project_name_page.submit(
    project_name: newname.to_sym
  )
end

Given(/^I select a project type "([^"]*)"$/) do |action|
  @app.project_type_page.submit(
    option: action.to_sym
  )
end

Given(/^I select financial year to stop spending$/) do
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

Given(/^I upload my benefit area file "([^"]*)"$/) do |filename|
  @app.benefit_area_file_page.submit(
    file: filename
  )
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

# Funding Sources
Given(/^I enter my funding sources for grant in aid$/) do
  funding_source_slug = "fcerm_gia"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

Given(/^I enter my funding sources for local levy$/) do
  funding_source_slug = "local_levy"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

Given(/^I enter my funding sources for public sector$/) do
  funding_source_slug = "public_contributions"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

Given(/^I enter my funding sources for private sector$/) do
  funding_source_slug = "private_contributions"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

Given(/^I enter my funding sources for contributions from others$/) do
  funding_source_slug = "other_ea_contributions"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

Given(/^I enter my funding sources for growth funding$/) do
  funding_source_slug = "growth_funding"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

Given(/^I enter my funding sources for internal drainage boards$/) do
  funding_source_slug = "internal_drainage_boards"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

Given(/^I enter my funding sources for others not identified$/) do
  funding_source_slug = "not_yet_identified"
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source_slug]
  )
end

# Funding Contributors
Given(/^I enter a sector contributor of public sector$/) do
  @app.funding_public_sector_contributors_page.public_contributors_names.set(
    "Public Test Council"
  )
  @app.funding_public_sector_contributors_page.submit_button.click
end

Given(/^I enter a sector contributor of private sector$/) do
  @app.funding_private_sector_contributors_page.private_contributors_names.set(
    "Private Investment Company"
  )
  @app.funding_private_sector_contributors_page.submit_button.click
end

Given(/^I enter a sector contributor of contributions from others$/) do
  @app.funding_other_sector_contributors_page.other_contributors_names.set(
    "Other Contribution Investment Company"
  )
  @app.funding_other_sector_contributors_page.submit_button.click
end

# Funding Values
Given(/^I enter my funding values for grant in aid$/) do
  @app.funding_values_page.gia_current_year.set "1000"
  @app.funding_values_page.gia_2015_2016.set "1000"
  @app.funding_values_page.gia_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I enter my funding values for local levy$/) do
  @app.funding_values_page.levy_current_year.set "1000"
  @app.funding_values_page.levy_2015_2016.set "1000"
  @app.funding_values_page.levy_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I enter my funding values for public sector$/) do
  @app.funding_values_page.public_current_year.set "1000"
  @app.funding_values_page.public_2015_2016.set "1000"
  @app.funding_values_page.public_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I enter my funding values for private sector$/) do
  @app.funding_values_page.private_current_year.set "1000"
  @app.funding_values_page.private_2015_2016.set "1000"
  @app.funding_values_page.private_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I enter my funding values for contributions from others$/) do
  @app.funding_values_page.ea_current_year.set "1000"
  @app.funding_values_page.ea_2015_2016.set "1000"
  @app.funding_values_page.ea_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I enter my funding values for growth funding$/) do
  @app.funding_values_page.growth_current_year.set "1000"
  @app.funding_values_page.growth_2015_2016.set "1000"
  @app.funding_values_page.growth_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I enter my funding values for internal drainage boards$/) do
  @app.funding_values_page.drain_current_year.set "1000"
  @app.funding_values_page.drain_2015_2016.set "1000"
  @app.funding_values_page.drain_2016_2017.set "1000"
  @app.funding_values_page.submit_button.click
end

Given(/^I enter my funding values for others not identified$/) do
  @app.funding_values_page.notyet_current_year.set "1000"
  @app.funding_values_page.notyet_2015_2016.set "1000"
  @app.funding_values_page.notyet_2016_2017.set "1000"
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

Given(/^I select the project is not urgent$/) do
  urgency_slug = "not_urgent"
  @app.proposal_overview_page.add_project_urgency.click
  @app.urgency_page.submit(
    option: urgency_slug.to_sym
  )
  expect(@app.proposal_overview_page).to have_text("Your project is not urgent")
end

Given(/^I enter the project urgency as "([^"]*)" with a message of "([^"]*)"$/) do |urgency, message|
  @app.proposal_overview_page.add_project_urgency.click
  @app.urgency_page.submit(
    option: urgency.to_sym
  )
  @app.urgency_details_page.submit(
    details: message
  )
  expect(@app.proposal_overview_page).to have_text(message)
end
# rubocop:enable Metrics/BlockLength

Given(/^I return to the overview page$/) do
  @app.proposal_under_review_page.return_to_the_proposal_overview_page.click
end

Given(/^I revert to draft$/) do
  @app.proposal_overview_page.revert_to_draft.click
end