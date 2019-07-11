class NewFundingOtherSectorContributorsPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:new_other_contributors_names, "#other_ea_contributors_step_name")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    other_contributors_names.set(args[:new_other_contributors_names]) if args.key?(:new_other_contributors_names)
    submit_button.click
  end

end
