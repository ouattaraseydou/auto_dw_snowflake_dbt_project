with atelier as (
    select * from {{ ref('stg_atelier') }}
)

select
    vin,
    count(intervention_id) as nb_interventions,
    sum(duree_heures) as total_heures_mo,
    sum(cout_mo) as total_cout_mo,
    sum(cout_piece) as total_cout_pieces,
    sum(cout_mo + cout_piece) as total_facture_atelier,
    max(date_intervention) as derniere_intervention
from atelier
group by vin