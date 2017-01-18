class FloodProtectionOutcomesPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:a1, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_0_households_at_reduced_risk")
  element(:a2, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_1_households_at_reduced_risk")
  element(:a3, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_2_households_at_reduced_risk")
  element(:b1, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_0_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:b2, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_1_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:b3, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_2_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:c1, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_0_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c2, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_1_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c3, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_2_households_protected_from_loss_in_20_percent_most_deprived")

  element(:submit_button, "input[name='commit']")

  def submit(args = {})
    a1.set(args[:a1]) if args.key?(:a1)
    a2.set(args[:a2]) if args.key?(:a2)
    a3.set(args[:a3]) if args.key?(:a3)
    b1.set(args[:b1]) if args.key?(:b1)
    b2.set(args[:b2]) if args.key?(:b2)
    b3.set(args[:b3]) if args.key?(:b3)
    c1.set(args[:c1]) if args.key?(:c1)
    c2.set(args[:c2]) if args.key?(:c2)
    c3.set(args[:c3]) if args.key?(:c3)

    submit_button.click
  end

end
