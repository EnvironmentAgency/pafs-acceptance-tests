class FundingValuesPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:gia_current_year, "#funding_values_step_funding_values_attributes_0_fcerm_gia")
  element(:gia_2015_2016, "#funding_values_step_funding_values_attributes_1_fcerm_gia")
  element(:gia_2016_2017, "#funding_values_step_funding_values_attributes_2_fcerm_gia")

  elements(:sources, "input[type='number']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    wait_for_sources
    puts sources.text
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
