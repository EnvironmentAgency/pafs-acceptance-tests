class RemoveEelBarrierPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:remove_yes, "#remove_eel_barrier_step_remove_eel_barrier_true")
  element(:remove_no, "#remove_eel_barrier_step_remove_eel_barrier_false")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:remove]
      remove_yes.click
    else
      remove_no.click
    end

    submit_button.click
  end

end
