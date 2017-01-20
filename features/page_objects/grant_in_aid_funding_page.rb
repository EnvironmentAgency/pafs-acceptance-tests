class GrantInAidFundingPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:gia_yes, "#bootstrap_fcerm_gia_true")
  element(:gia_no, "#bootstrap_fcerm_gia_false")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:grant_in_aid]
      gia_yes.click
    else
      gia_no.click
    end

    submit_button.click
  end

end
