select
    vin,
    immatriculation,
    initcap(marque) as marque,
    initcap(modele) as modele,
    upper(energie) as energie,
    annee,
    client_id
from {{ source('raw_auto', 'RAW_VEHICULES') }}