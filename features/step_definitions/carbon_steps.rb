Given(/^I select the carbon page$/) do
  @app.proposal_overview_page.add_carbon.click
end

Given(/^I add how much capital carbon will this project produce in tonnes "([^"]*)"$/) do |value|
  @app.carbon_cost_build_page.submit(
    amount: value.to_sym
  )
end

Given(/^I add how much carbon will this project’s assets produce in their lifecycle "([^"]*)"$/) do |value|
  @app.carbon_cost_operation_page.submit(
    amount: value.to_sym
  )
end
