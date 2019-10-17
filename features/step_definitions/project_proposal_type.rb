Given(/^I select a project type "([^"]*)"$/) do |action|
  @app.project_type_page.submit(
    option: action.to_sym
  )
end

When(/^I am returned to the proposal overview page$/) do
  puts "Proposal Overview Page"
end

When(/^I complete my proposal on training$/) do
  @project_number = @app.proposal_overview_page.project_number.text
  @app.proposal_overview_page.complete_proposal_training.click
end

When(/^I complete my proposal$ on QA/) do
  @project_number = @app.proposal_overview_page.project_number.text
  @app.proposal_overview_page.complete_proposal.click
end

When(/^I return to the proposal overview page$/) do
  @app.grant_in_aid_funding_page.user_bar.projects.click
end

Then(/^I should see the project type is "([^"]*)"$/) do |project_type|
  expect(@app.proposal_overview_page).to have_text(project_type)
end
