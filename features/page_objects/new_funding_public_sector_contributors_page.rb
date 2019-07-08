class NewFundingPublicSectorContributorsPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:new_public_contributors_names, "#public_contributors_step_name")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    public_contributors_names.set(args[:new_public_contributors_names]) if args.key?(:new_public_contributors_names)
    submit_button.click
  end

end
