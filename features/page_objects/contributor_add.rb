class ContributorAdd < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)
  element(:add_contributor, "a:contains('Add another contributor')")

  def submit(_args = {})
    add_contributor.click
  end

end
