with vehicules as (
    select * from {{ ref('stg_vehicules') }}
),

clients as (
    select * from {{ ref('stg_clients') }}
)

select
    v.vin,
    v.immatriculation,
    v.marque,
    v.modele,
    v.energie,
    v.annee,
    c.client_id,
    c.nom as nom_client,
    c.prenom as prenom_client,
    c.ville,
    c.code_postal,
    c.niveau_fidelite
from vehicules v
left join clients c
    on v.client_id = c.client_id