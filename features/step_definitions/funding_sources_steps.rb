# Funding Sources
Given(/^I enter my funding sources for "([^"]*)"$/) do |funding_source|
  @app.proposal_overview_page.add_funding_source.click
  @app.funding_sources_page.submit(
    funding_sources: [funding_source]
  )
end

# Funding Contributors
Given(/^I enter a sector contributor of "([^"]*)"$/) do |sector_source|
 SLUG_SOURCE =  {

              "Public Test Council" => "public"
              "Private Investment Company" => "private"
              "Other Contribution Investment Company" => "other"
              }.freeze

              source = SLUG_MAP[funding]         

  @app.funding_"{source}"_sector_contributors_page."{source}"_contributors_names.set()
  @app.funding_"{source}"_sector_contributors_page.submit_button.click

end


# Funding Values
Given(/^I enter my funding values for "([^"]*)" previous year "([^"]*)", 2015-2016 "([^"]*)", 2016-2017 "([^"]*)", 2017-2018 "([^"]*)", 2018-2019 "([^"]*)", 2019-2020 "([^"]*)"$/  ) do |funding, previous, yr15_16, yr16_17, yr17_18, yr18_19, yr19_20|
 SLUG_MAP =  {

              "Grant_in_Aid" => "gia"
              "Local_Levy" => "levy"
              "Public_Sector" => "public"
              "Private_Sector" => "private"
              "Contributions_from_other" => "ea"
              "Growth_Funding" => "growth"
              "Internal_Drainage_Boards" => "drain"
              "Others_not_Identified" => "notyet"
              }.freeze

              slug1 = SLUG_MAP[funding] 

              @app.funding_values_page."#{slug}"_current_year.set previous
              @app.funding_values_page."#{slug}"_2015_2016.set yr15_16
              @app.funding_values_page."#{slug}"_2016_2017.set yr16_17
              @app.funding_values_page."#{slug}"_2016_2017.set yr17_18
              @app.funding_values_page."#{slug}"_2016_2017.set yr18_19
              @app.funding_values_page."#{slug}"_2016_2017.set yr19_20
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
