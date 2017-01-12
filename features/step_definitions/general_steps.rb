Given(/^I am an external user$/) do

  @app = App.new
  @app.front_office_home_page.load
  @app.front_office_home_page.start_button.click

end

Given(/^I have a valid username and password$/) do

  # Back office login page
  @app.login_page.submit(
    email: "tim.stone@environment-agency.gov.uk",
    password: "Abcde12345"
  )

end

Given(/^I create a new proposal$/) do
  @app.projects_page.create_proposal.click
end