create or replace package cdc_guidance as

function days_to_separate(
    p_tested_positive    in boolean, /* did you test positive for covid?*/
    p_able_to_mask       in boolean, /* are you able to consistently wear a mask?*/
    p_exposed            in boolean default null, /* were you exposed to someone who tested positive for covid?*/
    p_vaccine_up_to_date in boolean default null /* have you received all the recommended vaccinations?*/
  ) return number; /* days to isolate or quarantine*/

end cdc_guidance;
/
