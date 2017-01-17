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
 
        search_val_0 = "funding_values_step_funding_values_attributes_0_#{source}"
        puts search_val_0
        sources.find { |chk| chk["id"] == search_val_0 }.set "1000"

        search_val_1 = "funding_values_step_funding_values_attributes_1_#{source}"
        sources.find { |chk| chk["id"] == search_val_1 }.set "1000"

        search_val_2 = "funding_values_step_funding_values_attributes_2_#{source}"
        sources.find { |chk| chk["id"] == search_val_2 }.set "1000"

      end
    end

    submit_button.click
  end

  end
