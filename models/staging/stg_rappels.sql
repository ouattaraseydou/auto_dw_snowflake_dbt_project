select
    raw_data:campaign_id::string as campaign_id,
    raw_data:code_rappel::string as code_rappel,
    raw_data:vin::string as vin,
    raw_data:details:marque::string as marque,
    raw_data:details:modele::string as modele,
    raw_data:details:priorite::string as priorite,
    raw_data:metadata:date_emission::date as date_emission,
    raw_data:metadata:statut::string as statut

from {{ source('raw_auto', 'RAW_RAPPELS_STELLANTIS') }}