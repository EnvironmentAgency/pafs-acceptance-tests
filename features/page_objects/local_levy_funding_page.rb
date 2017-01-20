class LocalLevyFundingPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:local_levy_yes, "#bootstrap_local_levy_true")
  element(:local_levy_no, "#bootstrap_local_levy_false")

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
