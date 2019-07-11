class NewFundingPrivateSectorContributorsPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:new_private_contributors_names, "#private_contributors_step_name")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    private_contributors_names.set(args[:new_private_contributors_names]) if args.key?(:new_private_contributors_names)
    submit_button.click
  end

end
