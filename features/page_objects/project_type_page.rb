class ProjectTypePage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:defence, "#project_type_step_project_type_def")
  element(:cm, "#project_type_step_project_type_cm")
  element(:plp, "#project_type_step_project_type_plp")
  element(:brg, "#project_type_step_project_type_brg")
  element(:str, "#project_type_step_project_type_str")
  element(:households_yes, "#project_type_step_project_type_env_with_households")
  element(:households_no, "#project_type_step_project_type_env_without_households")


  element(:submit_button, "input[name='commit']")


  def submit(args = {})
	project_name.set(args[:project_name]) if args.key?(:project_name)

    submit_button.click
  end

    def select_type(option)
    case option
	# Changing the current standard of service of a flood or coastal erosion risk management asset, or creating a new one
    when :change_or_new_asset
      	defence.click
	# Restore the standard of service of a flood or coastal erosion risk management asset by refurbishment or replacement
    when :restore_asset
      	cm.click
    # Property level protection for properties within the 'very significant' flood band where there is a 5% or greater chance of flooding
    when :property_level_protection
      	plp.click
    # Work done to bridges to enable flood and coastal erosion risk management
    when :bridges
      	brg.click
    # Strategy for complex flood or coastal erosion risk situations across several interconnected areas
    when :strategy
    	str.click 
    # Environmental project that also benefits households
	when :benefits_households_yes
		households_yes.click
	# Environmental project that doesn't benefit any households
	when :benefits_households_no
		households_no.click
	end

    submit_button.click
  	end

end