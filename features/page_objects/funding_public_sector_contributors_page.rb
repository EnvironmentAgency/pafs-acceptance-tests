class FundingPublicSectorContributorsPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:public_contributors_names, "#public_contributors_step_public_contributor_names")
  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    public_contributors_names.set(args[:public_contributors_names]) if args.key?(:public_contributors_names)
    submit_button.click
  end

end
