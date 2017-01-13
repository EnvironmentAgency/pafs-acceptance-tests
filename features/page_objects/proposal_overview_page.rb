class ProposalOverviewPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:project_number, "dd:nth-child(2)")
  element(:project_name, "#project-project_name-content p")
  element(:project_type, "#project-project_type-content p")
  element(:project_year, "#project-financial_year-content p")

  element(:complete_proposal, "a[href$='complete']")

  def submit(_args = {})
    search_button.click
  end

end
