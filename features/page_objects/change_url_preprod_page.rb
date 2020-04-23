class PSOPreProdHomePage < SitePrism::Page

  set_url("https://paf-pre.aws.defra.cloud/pc/bootstraps/new")
  element(:start_button, ".button.button-start")

end
