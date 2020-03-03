class ClickAndContinue < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)
  element(:submit_button, "input[name='commit']")

  def submit(_args = {})
    submit_button.click
  end

end
