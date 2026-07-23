select
    piece_ref,
    initcap(designation) as designation,
    initcap(famille) as famille,
    stock,
    prix_achat,
    prix_vente
from {{ source('raw_auto', 'RAW_PIECES') }}