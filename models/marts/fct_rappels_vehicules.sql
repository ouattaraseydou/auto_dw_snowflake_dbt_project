/*
Modèle : fct_rappels_vehicules.sql

Suivi des véhicules concernés par des campagnes de rappel constructeur.

Ce modèle consolide les informations des rappels avec les données
des véhicules et de leurs propriétaires afin de fournir une vision
complète des actions de rappel.

Il permet d'analyser :
- le nombre de véhicules concernés par les rappels ;
- les campagnes de rappel actives ;
- les priorités des rappels ;
- les clients impactés ;
- les caractéristiques des véhicules concernés.

Cette table est destinée aux analyses métier et aux tableaux de bord
de suivi des rappels constructeur.
*/

with rappels as (
    select * from {{ ref('stg_rappels') }}
),

vehicules_clients as (
    select * from {{ ref('int_vehicules_clients') }}
)

select
    r.campaign_id,
    r.code_rappel,
    r.priorite,
    r.date_emission,
    r.statut,
    vc.vin,
    vc.immatriculation,
    vc.marque,
    vc.modele,
    vc.client_id,
    vc.nom_client,
    vc.prenom_client
from rappels r
inner join vehicules_clients vc
    on r.vin = vc.vin