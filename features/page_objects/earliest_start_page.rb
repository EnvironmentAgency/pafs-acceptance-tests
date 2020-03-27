class EarliestStartPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:start_sooner_yes, "#earliest_start_step_could_start_early_true", vidible: false)
  element(:start_sooner_no, "#earliest_start_step_could_start_early_false", vidible: false)

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args[:earlier_start]
      start_sooner_yes.click
    else
      start_sooner_no.click
    end

    submit_button.click
  end

end
