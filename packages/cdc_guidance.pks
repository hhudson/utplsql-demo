create or replace package cdc_guidance as

function days_to_separate(
    p_tested_positive    in boolean,
    p_able_to_mask       in boolean,
    p_exposed            in boolean default null,
    p_vaccine_up_to_date in boolean default null
  ) return number;
  
end cdc_guidance;
/
