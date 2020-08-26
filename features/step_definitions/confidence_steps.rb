Given(/^I select the confidence page$/) do
  @app.proposal_overview_page.add_confidence.click
end

Given(/^I add the confidence in number of homes better protected by this project as "([^"]*)"$/) do |radio_option|
  @app.confidence_homes_better_protected_page.submit(
    option: radio_option.to_sym
  )
end

Given(/^I add the confidence in homes being delivered by the projects Gateway 4 date as "([^"]*)"$/) do |radio_option|
  @app.confidence_homes_by_gateway_four_page.submit(
    option: radio_option.to_sym
  )
end

Given(/^I add the confidence in securing the required Partnership Funding as "([^"]*)"$/) do |radio_option|
  @app.confidence_secured_partnership_funding_page.submit(
    option: radio_option.to_sym
  )
end
