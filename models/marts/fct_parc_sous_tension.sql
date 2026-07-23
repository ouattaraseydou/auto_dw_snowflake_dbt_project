/*fct_parc_sous_tension.sql (Croisement Rappels Stellantis & Valeur Client)
Ce modèle croise les véhicules rappelés avec la table de ton parc pour identifier
 immédiatement les clients prioritaires à contacter 
 (par exemple, si un véhicule a un rappel de "Haute" priorité et appartient à 
 un client très fidèle ou possédant plusieurs véhicules).*/

 with rappels as (
    select * from {{ ref('stg_rappels') }}
),

parc as (
    select * from {{ ref('fct_parc_automobiles') }}
)

select
    p.client_id,
    p.nom_client,
    p.prenom_client,
    p.ville,
    p.immatriculation,
    p.marque,
    p.modele,
    r.code_rappel,
    r.priorite,
    r.statut as statut_rappel,
    r.date_emission
from rappels r
inner join parc p
    on r.vin = p.vin
where r.statut = 'Ouvert'