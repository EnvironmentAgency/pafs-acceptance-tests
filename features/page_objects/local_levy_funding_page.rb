class LocalLevyFundingPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:local_levy_yes, "#funding_sources_step_local_levy")
  element(:local_levy_no, "#funding_sources_step_local_levy")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:local_levy_funding]
      local_levy_yes.click
    else
      local_levy_no.click
    end

    submit_button.click
  end

end
