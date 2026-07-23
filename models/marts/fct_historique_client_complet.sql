/*fct_historique_client_complet.sql (Vue 360 du parcours client)
Une table plate et ultra-détaillée qui croise, pour chaque intervention en atelier,
 le client, son véhicule, le coût, et les éventuels rappels constructeur en cours sur ce véhicule au moment de la visite. C'est le dataset parfait pour 
alimenter un rapport de type "Fiche Client" dans un outil de Business Intelligence.  */

with atelier as (
    select * from {{ ref('stg_atelier') }}
),

parc as (
    select * from {{ ref('fct_parc_automobiles') }}
),

rappels as (
    select * from {{ ref('stg_rappels') }}
)

select
    a.intervention_id,
    a.date_intervention,
    p.client_id,
    p.nom_client,
    p.prenom_client,
    p.immatriculation,
    p.marque,
    p.modele,
    a.type_intervention,
    a.mecanicien,
    a.duree_heures,
    (a.cout_mo + a.cout_piece) as cout_total_intervention,
    case when r.vin is not null then 'Oui' else 'Non' end as vehicule_concerne_par_rappel,
    r.code_rappel
from atelier a
inner join parc p
    on a.vin = p.vin
left join rappels r
    on a.vin = r.vin and r.statut = 'Ouvert'