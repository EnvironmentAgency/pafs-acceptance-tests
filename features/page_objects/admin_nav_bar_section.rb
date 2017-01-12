class AdminUserBarSection < SitePrism::Section

  # The CSS selectors were identified by using the Chrome addin
  # http://selectorgadget.com/. You can also test them using the Chrome
  # developer tools. Open them up, select the elements tab and then ctrl/cmd+f
  # You should get an input field into which you can enter your selector and
  # confirm/test its working. See
  # https://developers.google.com/web/updates/2015/05/search-dom-tree-by-css-selector

  SELECTOR = ".user-bar".freeze
  

  element(:projects, "a[href='/pc/projects']")

  element(:sign_out_link, "a[href='/users/sign_out']")

end
