/*mart_performance_mecaniciens.sql (KPIs de l'atelier par mécanicien)
 Analyser la productivité de ton équipe en atelier, 
ce modèle agrège les interventions par mécanicien pour voir qui réalise le plus d'heures, 
génère le plus de chiffre d'affaires (main d'œuvre + pièces)
 et quelles sont leurs spécialités.*/

 with atelier as (
    select * from {{ ref('stg_atelier') }}
)

select
    mecanicien,
    count(distinct intervention_id) as total_interventions_realisees,
    count(distinct vin) as nombre_vehicules_pris_en_charge,
    sum(duree_heures) as total_heures_travaillees,
    sum(cout_mo) as total_ca_main_doeuvre,
    sum(cout_piece) as total_ca_pieces_associees,
    sum(cout_mo + cout_piece) as chiffre_affaires_total,
    round(sum(cout_mo) / nullif(sum(duree_heures), 0), 2) as taux_horaire_moyen_mo
from atelier
where mecanicien is not null
group by mecanicien