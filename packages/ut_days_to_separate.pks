create or replace package ut_days_to_separate is

   --%suite(Tests as documentation)
   --%suitepath(demo)

    --%context(When a person has tested positive for covid)
        --%name(1_positive)

        --%test(and they are able to mask : Separate for 5 days)
        procedure positive_with_masks_separates_for_5_days;
        --%test(but they are not able to mask : Separate for 10 days)
        procedure positive_without_masks_separates_for_10_days;
        --%test(it does not matter what their vaccination status is)
        procedure positive_vaccination_status_does_not_matter;
    --%endcontext;

    --%context(When a person has merely been exposed to covid)
        --%name(2_exposed)

        --%context(and they are up-to-date on their vaccinations)
        --%name(3_vaccinated)

            --%test(and they are able to mask : No need to separate)
            procedure exposed_vaccinated_with_mask_does_not_need_to_separate;
            --%test(but they are not able to mask : Separate for 10 days)
            procedure exposed_vaccinated_without_masks_separates_for_10_days;
        --%endcontext;

        --%context(but they are up-to-date on their vaccinations or unvaccinated)
        --%name(4_unvaccinated)

            --%test(and they are able to mask : Separate for 5 days)
            procedure exposed_unvaccinated_with_mask_separates_for_5_days;
            --%test(but they are not able to mask : Separate for 10 days)
            procedure exposed_unvaccinated_without_masks_separates_for_10_days;
        --%endcontext;
    --%endcontext;



end ut_days_to_separate;
/
