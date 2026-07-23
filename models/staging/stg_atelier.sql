select
    intervention_id,
    vin,
    date_intervention,
    initcap(type) as type_intervention,
    initcap(mecanicien) as mecanicien,
    duree_heures,
    cout_mo,
    cout_piece,
    tva
from {{ source('raw_auto', 'RAW_ATELIER') }}