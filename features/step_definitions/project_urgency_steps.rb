Given(/^I select the project urgency as "([^"]*)" with a project message of "([^"]*)"$/) do |urgency, message|
  @app.proposal_overview_page.add_project_urgency.click
  @app.urgency_page.submit(
    option: urgency.to_sym
  )
  @app.urgency_details_page.submit(
    details: message
  )
end

Given(/^I enter the project urgency as "([^"]*)"$/) do |urgency|
  @app.proposal_overview_page.add_project_urgency.click
  @app.urgency_page.submit(
    option: urgency.to_sym
  )
end

When(/^I enter the project urgency with a message of "([^"]*)"$/) do |message|
  @app.urgency_details_page.submit(
    details: message
  )
end

When(/^I select the project urgency as "([^"]*)"$/) do |urgency|
  @app.proposal_overview_page.add_project_urgency.click
  @app.urgency_page.submit(
    option: urgency.to_sym
  )
end

When(/^I complete my proposal$/) do
  @project_number = @app.proposal_overview_page.project_number.text
  @app.proposal_overview_page.complete_proposal.click
end

When(/^I return to the proposal overview page$/) do
  @app.grant_in_aid_funding_page.user_bar.projects.click
end

When(/^I enter the project urgent message box of "([^"]*)"$/) do |message|
  @app.urgency_details_page.submit(
    details: message
  )
end

Then(/^I check the project urgent message box is empty$/) do
  expect(@app.urgency_details_page).to have_text("")
end

Then(/^I should see the project urgent message of "([^"]*)" on the proposal page$/) do |message|
  expect(@app.proposal_overview_page).to have_text(message)
end
