class FundingCalculatorPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:choose_file, "#funding_calculator_step_funding_calculator")

  element(:submit_button, "input[name='commit']")

  def submit(_args = {})
    # Capybara attach file method
    attach_file(choose_file[:name], File.absolute_path("./features/support/wrington_pf_calc_14jan14.xlsx"))
    submit_button.click
  end

end
