select
    client_id,
    initcap(nom) as nom,
    initcap(prenom) as prenom,
    ville,
    code_postal,
    date_creation,

    fidelite as fidelite_code,

    case
        when fidelite = 'Standard' then 'Client Standard'
        when fidelite = 'Silver' then 'Client Argent'
        when fidelite = 'Gold' then 'Client Or'
        else 'Non défini'
    end as niveau_fidelite

from {{ source('raw_auto', 'RAW_CLIENTS') }}