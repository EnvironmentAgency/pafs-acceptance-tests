
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

When(/^I select the project urgency as "([^"]*)"$/) do |urgency|
  urgency_slug = urgency
  @app.proposal_overview_page.add_project_urgency.click
  @app.urgency_page.submit(
    option: urgency_slug.to_sym
  )
end
