with vehicules_clients as (
    select * from {{ ref('int_vehicules_clients') }}
),

atelier_resume as (
    select * from {{ ref('int_atelier_resume') }}
)

select
    vc.vin,
    vc.immatriculation,
    vc.marque,
    vc.modele,
    vc.energie,
    vc.annee,
    vc.client_id,
    vc.nom_client,
    vc.prenom_client,
    vc.ville,
    vc.code_postal,
    vc.niveau_fidelite,
    coalesce(ar.nb_interventions, 0) as nb_interventions,
    coalesce(ar.total_heures_mo, 0) as total_heures_mo,
    coalesce(ar.total_cout_mo, 0) as total_cout_mo,
    coalesce(ar.total_cout_pieces, 0) as total_cout_pieces,
    coalesce(ar.total_facture_atelier, 0) as total_facture_atelier,
    ar.derniere_intervention
from vehicules_clients vc
left join atelier_resume ar
    on vc.vin = ar.vin