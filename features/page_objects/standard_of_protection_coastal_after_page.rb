class StandardOfProtectionCoastalAfterPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:less_that_ten_years, "#standard_of_protection_coastal_after_step_coastal_protection_after_0", visible: false)
  element(:ten_to_nighteen_years, "#standard_of_protection_coastal_after_step_coastal_protection_after_1", visible: false)
  element(:twenty_to_fourtynine_years, "#standard_of_protection_coastal_after_step_coastal_protection_after_2", visible: false)
  element(:fifty_years_or_more, "#standard_of_protection_coastal_after_step_coastal_protection_after_3", visible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:option]
    when :less_that_ten_years
      less_that_ten_years.click
    when :ten_to_nighteen_years
      ten_to_nighteen_years.click
    when :twenty_to_fourtynine_years
      twenty_to_fourtynine_years.click
    when :fifty_years_or_more
      fifty_years_or_more.click
    end
    submit_button.click
  end

end
