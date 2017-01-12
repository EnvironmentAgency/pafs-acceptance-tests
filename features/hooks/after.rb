After("@frontoffice") do
  # As all our front office tests start with logging in we need to ensure that
  # as each front office scenario finishes that we have logged out. Rather than
  # peppering our steps with calls to click the log out link, we have this hook
  # which is called after every scenario tagged with @frontoffice do it.
  @app.projects_page.user_bar.sign_out_link.click
end
