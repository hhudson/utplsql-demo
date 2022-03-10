create or replace package body cdc_guidance as

  gc_scope_prefix constant varchar2(31) := lower($$plsql_unit) || '.';

  function days_to_separate(
    p_tested_positive    in boolean, /* did you test positive for covid?*/
    p_able_to_mask       in boolean, /* are you able to consistently wear a mask?*/
    p_exposed            in boolean default null, /* were you exposed to someone who tested positive for covid?*/
    p_vaccine_up_to_date in boolean default null /* have you received all the recommended vaccinations?*/
  ) return number
  as
    l_scope logger_logs.scope%type := gc_scope_prefix || 'quarantine_isolation_guidance';
    l_params logger.tab_param;
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
     
  exception
    when others then
      logger.log_error('Unhandled Exception', l_scope, null, l_params);
      raise;
  end days_to_separate;


end cdc_guidance;
/
