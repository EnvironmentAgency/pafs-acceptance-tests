class FundingCalculatorPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:choose_file, "#funding_calculator_step_funding_calculator")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:file)
      filename = args[:file]
      # Capybara attach file method
	    attach_file(choose_file[:name], File.absolute_path("./features/support/#{filename}"))
      submit_button.click
    end
  end

end
