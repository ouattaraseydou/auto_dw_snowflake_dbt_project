/*fct_alertes_maintenance_predictive.sql (Suivi de l'usure et alertes)
Ce modèle croise l'âge des véhicules, le type d'énergie et le nombre d'heures 
ou d'interventions cumulées en atelier pour identifier les véhicules susceptibles 
de nécessiter une grosse révision prochaine (par exemple, un nombre d'interventions 
élevé ou une dernière visite qui remonte à longtemps).
*/

with parc as (
    select * from {{ ref('fct_parc_automobiles') }}
)

select
    vin,
    immatriculation,
    marque,
    modele,
    annee,
    2026 - annee as age_vehicule_ans,
    nb_interventions,
    derniere_intervention,
    total_facture_atelier,
    case
        when (2026 - annee) >= 10 and nb_interventions < 2 then 'A surveiller (Ancienneté sans suivi récent)'
        when total_facture_atelier > 1500 then 'Client VIP / Gros porteur de coûts'
        when nb_interventions = 0 then 'Véhicule jamais vu en atelier'
        else 'Standard'
    end as categorie_alerte_atelier
from parc