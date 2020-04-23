class ConfirmPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:project_number, ".govuk-box-highlight .heading-medium")
  element(:return_to_proposals, ".form-group headroom a[href$='pc/projects']")

end
