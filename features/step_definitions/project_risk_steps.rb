# OM Risk Sources
Given(/^I add my main project risk "([^"]*)"$/) do |risk_source|
  slug_risksource = {
    "river" => "fluvial_flooding",
    "tidal" => "tidal_flooding",
    "ground" => "groundwater_flooding",
    "surface" => "surface_water_flooding",
    "sea" => "sea_flooding",
    "reservoir" => "reservoir_flooding",
    "coastal" => "coastal_erosion"
  }.freeze

  risk_source = slug_risksource[risk_source]

  @app.proposal_overview_page.add_risks.click
  @app.risks_page.submit(
    risks_source: [risk_source]
  )
end

Given(/^I add a second project risk "([^"]*)"$/) do |risk_source|
  slug_risksource = {
    "river" => "fluvial_flooding",
    "tidal" => "tidal_flooding",
    "ground" => "groundwater_flooding",
    "surface" => "surface_water_flooding",
    "sea" => "sea_flooding",
    "reservoir" => "reservoir_flooding",
    "coastal" => "coastal_erosion"
  }.freeze

  risk_source = slug_risksource[risk_source]

  @app.proposal_overview_page.add_risks.click
  @app.risks_page.submit(
    risks_source: [risk_source]
  )
  @app.main_risk_page.submit_button.click
end
