with clients as (
    select * from {{ ref('stg_clients') }}
),

vehicules_clients as (
    select * from {{ ref('int_vehicules_clients') }}
),

atelier_resume as (
    select * from {{ ref('int_atelier_resume') }}
)

select
    c.client_id,
    c.nom,
    c.prenom,
    c.ville,
    c.niveau_fidelite,
    c.date_creation,
    count(distinct vc.vin) as nombre_vehicules_possedes,
    coalesce(sum(ar.nb_interventions), 0) as total_interventions_atelier,
    coalesce(sum(ar.total_facture_atelier), 0) as chiffre_affaires_genere
from clients c
left join vehicules_clients vc
    on c.client_id = vc.client_id
left join atelier_resume ar
    on vc.vin = ar.vin
group by 
    c.client_id, c.nom, c.prenom, c.ville, c.niveau_fidelite, c.date_creation