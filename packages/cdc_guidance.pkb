create or replace package body cdc_guidance as

  gc_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

  /**
  * This public function attempts to capture the CDC guidance from the following 
  * source: https://www.mass.gov/info-details/covid-19-isolation-and-quarantine-guidance-for-the-general-public
  *
  * @author Hayden Hudson
  * @created March 11, 2022
  * 
  * @p_tested_positive    → did you test positive for covid?
  * @p_able_to_mask       → are you able to consistently wear a mask?
  * @p_exposed            → were you exposed to someone who tested positive for covid?
  * @p_vaccine_up_to_date → have you received all the recommended vaccinations?
  * 
  * @return → number of days to isolate or quarantine
  */ 
  function days_to_separate(
    p_tested_positive    in boolean,
    p_able_to_mask       in boolean,
    p_exposed            in boolean default null,
    p_vaccine_up_to_date in boolean default null
  ) return number
  as
  begin

    return
    case  when p_tested_positive
          then case when p_able_to_mask 
                    then 5
                    else 10 
                    end
          when p_exposed
          then case when p_vaccine_up_to_date
                    then case when p_able_to_mask
                              then 0
                              else 10
                              end 
                    else case when p_able_to_mask
                              then 5
                              else 10
                              end
                    end
          else 0
          end;
  
  end days_to_separate;


end cdc_guidance;
/
