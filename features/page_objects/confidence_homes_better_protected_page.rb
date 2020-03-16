class ConfidenceHomesBetterProtectedPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:high, "#confidence_homes_better_protected_step_confidence_homes_better_protected_high")
  element(:mednium_high, "#confidence_homes_better_protected_step_confidence_homes_better_protected_medium_high")
  element(:medium_low, "#confidence_homes_better_protected_step_confidence_homes_better_protected_medium_low")
  element(:low, "#confidence_homes_better_protected_step_confidence_homes_better_protected_low")
  element(:not_applicable, "#confidence_homes_better_protected_step_confidence_homes_better_protected_not_applicable")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:option]
    when :high
      high.click
    when :mednium_high
      mednium_high.click
    when :medium_low
      medium_low.click
    when :low
      low.click
    when :not_applicable
      not_applicable.click
    end

    submit_button.click
  end

end
