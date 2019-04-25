class FundingValuesPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:gia_current_year, "#funding_values_step_funding_values_attributes_0_fcerm_gia")
  element(:gia_2015_2016, "#funding_values_step_funding_values_attributes_1_fcerm_gia")
  element(:gia_2016_2017, "#funding_values_step_funding_values_attributes_2_fcerm_gia")

  element(:levy_current_year, "#funding_values_step_funding_values_attributes_0_local_levy")
  element(:levy_2015_2016, "#funding_values_step_funding_values_attributes_1_local_levy")
  element(:levy_2016_2017, "#funding_values_step_funding_values_attributes_2_local_levy")

  element(:public_current_year, "#funding_values_step_funding_values_attributes_0_public_contributions")
  element(:public_2015_2016, "#funding_values_step_funding_values_attributes_1_public_contributions")
  element(:public_2016_2017, "#funding_values_step_funding_values_attributes_2_public_contributions")

  element(:private_current_year, "#funding_values_step_funding_values_attributes_0_private_contributions")
  element(:private_2015_2016, "#funding_values_step_funding_values_attributes_1_private_contributions")
  element(:private_2016_2017, "#funding_values_step_funding_values_attributes_2_private_contributions")

  element(:ea_current_year, "#funding_values_step_funding_values_attributes_0_other_ea_contributions")
  element(:ea_2015_2016, "#funding_values_step_funding_values_attributes_1_other_ea_contributions")
  element(:ea_2016_2017, "#funding_values_step_funding_values_attributes_2_other_ea_contributions")

  element(:growth_current_year, "#funding_values_step_funding_values_attributes_0_growth_funding")
  element(:growth_2015_2016, "#funding_values_step_funding_values_attributes_1_growth_funding")
  element(:growth_2016_2017, "#funding_values_step_funding_values_attributes_2_growth_funding")

  element(:drain_current_year, "#funding_values_step_funding_values_attributes_0_internal_drainage_boards")
  element(:drain_2015_2016, "#funding_values_step_funding_values_attributes_1_internal_drainage_boards")
  element(:drain_2016_2017, "#funding_values_step_funding_values_attributes_2_internal_drainage_boards")

  element(:notyet_current_year, "#funding_values_step_funding_values_attributes_0_not_yet_identified")
  element(:notyet_2015_2016, "#funding_values_step_funding_values_attributes_1_not_yet_identified")
  element(:notyet_2016_2017, "#funding_values_step_funding_values_attributes_2_not_yet_identified")

  elements(:sources, "input[type='number']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    wait_for_sources

    if args.key?(:funding_values)
      args[:funding_values].each do |source|

        search_val_one = "funding_values_step_funding_values_attributes_0_#{source}"
        sources.find { |chk| chk["id"] == search_val_one }.set "1000"

        search_val_two = "funding_values_step_funding_values_attributes_1_#{source}"
        sources.find { |chk| chk["id"] == search_val_two }.set "1000"

        search_val_three = "funding_values_step_funding_values_attributes_2_#{source}"
        sources.find { |chk| chk["id"] == search_val_three }.set "1000"

      end
    end

    submit_button.click
  end

end
