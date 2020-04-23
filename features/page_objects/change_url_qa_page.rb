class PSOHQAomePage < SitePrism::Page

  set_url("https://paf-tst.aws.defra.cloud/pc/bootstraps/new")
  element(:start_button, ".button.button-start")

end
