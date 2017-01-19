class UrgencyPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:nu, "#urgency_step_urgency_reason_not_urgent")
  element(:stat, "#urgency_step_urgency_reason_statutory_need")
  element(:legal, "#urgency_step_urgency_reason_legal_need")
  element(:hs, "#urgency_step_urgency_reason_health_and_safety")
  element(:emer, "#urgency_step_urgency_reason_emergency_works")
  element(:time, "#urgency_step_urgency_reason_time_limited")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    case args[:option]

    when :not_urgent
      nu.click
    when :stat_need
      stat.click
    when :legal_need
      legal.click
    when :health_and_safety
      hs.click
    when :emergency
      emer.click
    when :time_limit
      time.click
    end

    submit_button.click
  end

end
