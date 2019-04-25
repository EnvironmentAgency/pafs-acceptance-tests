class ProjectAreaSelectionPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:bristol_city_council, "#project_area_step_rma_name_bristol_city_council")
  element(:west_of_england, "#project_area_step_rma_name_pso_west_of_england")

  elements(:source, "input[type='radio']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:area_source)
      args[:area_source].each do |areasource|

        search_val = "funding_sources_step_#{areasource}"
        sources.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

end
