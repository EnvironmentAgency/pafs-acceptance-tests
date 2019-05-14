# Funding Sources
Given(/^I enter my funding sources for "([^"]*)"$/) do |funding_source|
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source]
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
Given(/^I enter my funding values for grant in aid current year "([^"]*)", year2015-2016 "([^"]*)", year2016-2017 "([^"]*)"$/) do |yearone, yeartwo, yearthree|
  @app.funding_values_page.gia_current_year.set yearone
  @app.funding_values_page.gia_2015_2016.set yeartwo
  @app.funding_values_page.gia_2016_2017.set yearthree
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
