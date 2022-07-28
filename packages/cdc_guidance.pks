create or replace package cdc_guidance as

------------------------------------------------------------------------------
--  Creator: Hayden Hudson
--     Date: June 21, 2022
-- Synopsis:
--
-- Procedure, used to set employeed salary grade. 
 -- see tests : ut_days_to_separate 
--
------------------------------------------------------------------------------
function days_to_separate(
    p_tested_positive    in boolean,
    p_able_to_mask       in boolean,
    p_exposed            in boolean default null,
    p_vaccine_up_to_date in boolean default null
  ) return number;
  
end cdc_guidance;
/
