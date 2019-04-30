class ProjectAreaSelectionPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  #element(:rmabristolcitycouncil, "#project_area_step_rma_name_bristol_city_council")
  #element(:psowestofengland, "#project_area_step_rma_name_pso_west_of_england")

  elements(:source, "input[type='radio']")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:area)

      area_source = args[:area]
      search_val = "project_area_step_#{area_source}"
      source.find { |chk| chk["id"] == search_val }.click
    end

    submit_button.click
  end

end
