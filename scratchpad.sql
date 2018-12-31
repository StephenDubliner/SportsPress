select distinct pm.meta_key, pm.meta_value
from wp_postmeta pm
where pm.meta_key like 'sp_%'
order by pm.meta_key
-- group by pm.meta_key
;

-- $gwfor * $ddivfor + $glfor

-- $winfactor * 10 + $lostfactor