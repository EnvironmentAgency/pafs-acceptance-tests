Then(/^I upload my project funding calculator file "([^"]*)"$/) do |filename|
  @app.proposal_overview_page.add_funding_calculator.click
  @app.funding_calculator_page.submit(
    file: filename
  )
  @app.funding_calculator_summary_page.submit
end

Then(/^I should see my entered details in the the proposal overview$/) do
  @project_number = @app.proposal_overview_page.project_number.text
  expect(@app.proposal_overview_page).to have_project_number
  expect(@app.proposal_overview_page.project_name.text).to eq "Flood defence test"
end

Then(/^I should see that my proposal is sent for review$/) do
  expect(@app.confirm_page).to have_project_number
  expect(@app.proposal_overview_page).to have_text("Proposal sent for review")
end

Then(/^I should see that my proposal is under review$/) do
  expect(@app.confirm_page).to have_project_number
  expect(@app.proposal_overview_page).to have_text("Proposal under review")
end

Then(/^its status is draft$/) do
  @status = @app.proposal_overview_page.first_project.text
  expect(@app.proposal_overview_page.first_project.text).to eq "Draft"
end

Then(/^I should see the project urgent message of "([^"]*)" on the proposal page$/) do |message|
  expect(@app.proposal_overview_page).to have_text(message)
end
