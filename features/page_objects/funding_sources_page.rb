class FundingSourcesPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:grant_in_aid, "#funding_sources_step_fcerm_gia")
  element(:local_levy, "#funding_sources_step_local_levy")
  element(:public_sector, "#funding_sources_step_public_contributions")
  element(:private_sector, "#funding_sources_step_private_contributions")
  element(:ea_contributions, "#funding_sources_step_other_ea_contributions")
  element(:growth_funding, "#funding_sources_step_growth_funding")
  element(:drainage_board, "#funding_sources_step_internal_drainage_boards")
  element(:other, "#funding_sources_step_not_yet_identified")

  elements(:sources, "input[type='checkbox']")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    if args.key?(:funding_sources)
      args[:funding_sources].each do |source|

        search_val = "funding_sources_step_#{source}"
        sources.find { |chk| chk["id"] == search_val }.click
      end
    end

    submit_button.click
  end

end
