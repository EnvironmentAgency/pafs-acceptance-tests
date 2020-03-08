class ImproveSssiPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:improve_yes, "#improve_sssi_step_improve_sssi_true")
  element(:improve_no, "#improve_sssi_step_improve_sssi_false")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:improve]
      improve_yes.click
    else
      improve_no.click
    end

    submit_button.click
  end

end
