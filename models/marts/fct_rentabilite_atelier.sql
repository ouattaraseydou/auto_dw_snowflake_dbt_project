/*fct_rentabilite_atelier.sql (Analyse de la rentabilité des interventions)
Ce modèle croise les interventions de l'atelier avec le catalogue des pièces pour
 analyser le coût d'achat par rapport au prix de vente et évaluer la marge générée par l'atelier.
*/
with atelier as (
    select * from {{ ref('stg_atelier') }}
),

vehicules as (
    select * from {{ ref('stg_vehicules') }}
)

select
    a.intervention_id,
    a.vin,
    v.marque,
    v.modele,
    a.type_intervention,
    a.mecanicien,
    a.duree_heures,
    a.cout_mo,
    a.cout_piece,
    a.tva,
    (a.cout_mo + a.cout_piece) as montant_ht,
    (a.cout_mo + a.cout_piece) * (1 + a.tva / 100.0) as montant_ttc
from atelier a
left join vehicules v
    on a.vin = v.vin