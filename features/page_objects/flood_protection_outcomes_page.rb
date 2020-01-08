# There is little we can to about the line length. We always prefer to slect
# by ID, and they are what they are!
# rubocop:disable Metrics/LineLength
class FloodProtectionOutcomesPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:a1, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_0_households_at_reduced_risk")
  element(:a2, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_1_households_at_reduced_risk")
  element(:a3, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_2_households_at_reduced_risk")
  element(:a4, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_3_households_at_reduced_risk")
  element(:a5, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_4_households_at_reduced_risk")
  element(:a6, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_5_households_at_reduced_risk")
  element(:b1, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_0_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:b2, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_1_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:b3, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_2_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:b4, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_3_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:b5, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_4_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:b6, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_5_moved_from_very_significant_and_significant_to_moderate_or_low")
  element(:c1, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_0_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c2, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_1_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c3, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_2_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c4, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_3_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c5, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_4_households_protected_from_loss_in_20_percent_most_deprived")
  element(:c6, "#flood_protection_outcomes_step_flood_protection_outcomes_attributes_5_households_protected_from_loss_in_20_percent_most_deprived")

  element(:select_none, "#flood_protection_outcomes_step_reduced_risk_of_households_for_floods")

  element(:submit_button, "input[name='commit']")
  # There is no value in attempting to break up this method, it would only make
  # things more complex rather than simplify them. Hence we disable the
  # following cops
  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def submit(args = {})
    if args.key?(:outcome) == true
      select_none.set(args[:select_none]).click
    else
      a1.set(args[:a1]) if args.key?(:a1)
      a2.set(args[:a2]) if args.key?(:a2)
      a3.set(args[:a3]) if args.key?(:a3)
      a4.set(args[:a4]) if args.key?(:a4)
      a5.set(args[:a5]) if args.key?(:a5)
      a6.set(args[:a6]) if args.key?(:a6)
      b1.set(args[:b1]) if args.key?(:b1)
      b2.set(args[:b2]) if args.key?(:b2)
      b3.set(args[:b3]) if args.key?(:b3)
      b4.set(args[:b4]) if args.key?(:b4)
      b5.set(args[:b5]) if args.key?(:b5)
      b6.set(args[:b6]) if args.key?(:b6)
      c1.set(args[:c1]) if args.key?(:c1)
      c2.set(args[:c2]) if args.key?(:c2)
      c3.set(args[:c3]) if args.key?(:c3)
      c4.set(args[:c4]) if args.key?(:c4)
      c5.set(args[:c5]) if args.key?(:c5)
      c6.set(args[:c6]) if args.key?(:c6)
    end

    submit_button.click
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end
# rubocop:enable Metrics/LineLength
