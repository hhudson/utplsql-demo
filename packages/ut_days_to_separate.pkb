create or replace package body ut_days_to_separate is

  procedure positive_with_masks_separates_for_5_days
  is
  begin
    ut.expect(cdc_guidance.days_to_separate(
                  p_tested_positive => true, 
                  p_able_to_mask    => true
                  )
              )
      .to_equal(5);
  end positive_with_masks_separates_for_5_days;
  
  procedure positive_without_masks_separates_for_10_days
  is
  begin
    ut.expect(cdc_guidance.days_to_separate(
                  p_tested_positive => true, 
                  p_able_to_mask    => false
                  )
              )
      .to_equal(10);
  end positive_without_masks_separates_for_10_days;

  procedure positive_vaccination_status_does_not_matter
  is 
  begin
    ut.expect(cdc_guidance.days_to_separate(
                  p_tested_positive    => true, 
                  p_able_to_mask       => true,
                  p_vaccine_up_to_date => true
                  )
              )
      .to_equal(
        cdc_guidance.days_to_separate(
                  p_tested_positive    => true, 
                  p_able_to_mask       => true,
                  p_vaccine_up_to_date => false
                  )
      );
  end positive_vaccination_status_does_not_matter;

  procedure exposed_vaccinated_with_mask_does_not_need_to_separate
  is
  begin
    ut.expect(cdc_guidance.days_to_separate(
                  p_tested_positive    => false, 
                  p_able_to_mask       => true,
                  p_exposed            => true,
                  p_vaccine_up_to_date => true
                  )
              )
      .to_equal(0);
  end exposed_vaccinated_with_mask_does_not_need_to_separate;
  
  procedure exposed_vaccinated_without_masks_separates_for_10_days
  is
  begin
    ut.expect(cdc_guidance.days_to_separate(
                  p_tested_positive    => false, 
                  p_able_to_mask       => false,
                  p_exposed            => true,
                  p_vaccine_up_to_date => true
                  )
              )
      .to_equal(10);
  end exposed_vaccinated_without_masks_separates_for_10_days;

  procedure exposed_unvaccinated_with_mask_separates_for_5_days
  is
  begin
    ut.expect(cdc_guidance.days_to_separate(
                  p_tested_positive    => false, 
                  p_able_to_mask       => true,
                  p_exposed            => true,
                  p_vaccine_up_to_date => false
                  )
              )
      .to_equal(5);
  end exposed_unvaccinated_with_mask_separates_for_5_days;
  
  procedure exposed_unvaccinated_without_masks_separates_for_10_days
  is
  begin
    ut.expect(cdc_guidance.days_to_separate(
                  p_tested_positive    => false, 
                  p_able_to_mask       => false,
                  p_exposed            => true,
                  p_vaccine_up_to_date => false
                  )
              )
      .to_equal(10);
  end exposed_unvaccinated_without_masks_separates_for_10_days;

end ut_days_to_separate;
/