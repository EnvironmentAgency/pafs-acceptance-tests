class ConfidenceSecuredPartnershipFundingPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)
  # rubocop:disable Metrics/LineLength
  element(:high, "#confidence_secured_partnership_funding_step_confidence_secured_partnership_funding_high")
  element(:mednium_high, "#confidence_secured_partnership_funding_step_confidence_secured_partnership_funding_medium_high")
  element(:medium_low, "#confidence_secured_partnership_funding_step_confidence_secured_partnership_funding_medium_low")
  element(:low, "#confidence_secured_partnership_funding_step_confidence_secured_partnership_funding_low")
  element(:not_applicable, "#confidence_secured_partnership_funding_step_confidence_secured_partnership_funding_not_applicable")
  element(:submit_button, "input[name='commit']")
  # rubocop:enable Metrics/LineLength

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
