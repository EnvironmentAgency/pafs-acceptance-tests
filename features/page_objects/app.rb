# Represents all pages in the application. Was created to avoid needing to
# create individual instances of each page throughout the steps.
# https://github.com/natritmeyer/site_prism#epilogue
class App
  # Using an attr_reader automatically gives us a my_app.last_page method
  attr_reader :last_page

  # FRONT OFFICE SPECIFIC PAGES
  # /
  def front_office_home_page
    @last_page = FrontOfficeHomePage.new
  end

  def login_page
    @last_page = LoginPage.new
  end

  def projects_page
    @last_page = ProjectsPage.new
  end

  def grant_in_aid_funding_page
    @last_page = GrantInAidFundingPage.new
  end

  def local_levy_funding_page
    @last_page = LocalLevyFundingPage.new
  end

  def project_name_page
    @last_page = ProjectNamePage.new
  end

  def project_type_page
    @last_page = ProjectTypePage.new
  end

  def project_year_page
    @last_page = ProjectYearPage.new
  end

  def proposal_overview_page
    @last_page = ProposalOverviewPage.new
  end

  def location_page
    @last_page = LocationPage.new
  end

  def benefit_area_file_page
    @last_page = BenefitAreaFilePage.new
  end

  def benefit_area_file_summary_page
    @last_page = BenefitAreaFileSummaryPage.new
  end

end
