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

  def start_outline_business_case_date_page
    @last_page = StartOutlineBusinessCaseDatePage.new
  end

  def award_contract_date_page
    @last_page = AwardContractDatePage.new
  end

  def start_construction_date_page
    @last_page = StartConstructionDatePage.new
  end

  def ready_for_service_date_page
    @last_page = ReadyForServiceDatePage.new
  end

  def funding_sources_page
    @last_page = FundingSourcesPage.new
  end

  def funding_values_page
    @last_page = FundingValuesPage.new
  end

  def earliest_start_page
    @last_page = EarliestStartPage.new
  end

  def earliest_date_page
    @last_page = EarliestDatePage.new
  end

  def risks_page
    @last_page = RisksPage.new
  end

  def main_risk_page
    @last_page = MainRiskPage.new
  end

  def flood_protection_outcomes_page
    @last_page = FloodProtectionOutcomesPage.new
  end

  def standard_of_protection_page
    @last_page = StandardOfProtectionPage.new
  end

  def standard_of_protection_after_page
    @last_page = StandardOfProtectionAfterPage.new
  end

  def approach_page
    @last_page = ApproachPage.new
  end

  def environmental_outcomes_page
    @last_page = EnvironmentalOutcomesPage.new
  end

  def surface_and_groundwater_amount_page
    @last_page = SurfaceAndGroundwaterAmountPage.new
  end

  def improve_spa_or_sac_page
    @last_page = ImproveSpaOrSacPage.new
  end

  def improve_habitat_amount_page
    @last_page = ImproveHabitatAmountPage.new
  end

  def improve_river_page
    @last_page = ImproveRiverPage.new
  end

  def improve_river_amount_page
    @last_page = ImproveRiverAmountPage.new
  end

  def habitat_creation_page
    @last_page = HabitatCreationPage.new
  end

  def habitat_creation_amount_page
    @last_page = HabitatCreationAmountPage.new
  end

  def remove_fish_barrier_page
    @last_page = RemoveFishBarrierPage.new
  end

  def remove_eel_barrier_page
    @last_page = RemoveEelBarrierPage.new
  end

  def fish_or_eel_amount_page
    @last_page = FishOrEelAmountPage.new
  end

  def urgency_page
    @last_page = UrgencyPage.new
  end

  def urgency_details_page
    @last_page = UrgencyDetailsPage.new
  end
end
