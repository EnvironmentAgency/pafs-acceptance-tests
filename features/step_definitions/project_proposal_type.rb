Given(/^I select a project type "([^"]*)"$/) do |action|
  @app.project_type_page.submit(
    option: action.to_sym
  )
end

When(/^I am returned to the proposal overview page$/) do
  puts "Proposal Overview Page"
end

Then(/^I should see the project type is "([^"]*)"$/) do |project_type|
  expect(@app.proposal_overview_page).to have_text(project_type)
end
