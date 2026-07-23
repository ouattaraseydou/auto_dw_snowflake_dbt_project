/*mart_analyse_stocks_pieces.sql (Optimisation du stock critique)
Ce modèle croise le catalogue des pièces (stg_pieces) avec les quantités
 consommées dans l'atelier pour calculer la valeur totale immobilisée en stock 
 et identifier les pièces à recommander en urgence (rotation ou stock bas).*/

 with pieces as (
    select * from {{ ref('stg_pieces') }}
),

atelier as (
    select * from {{ ref('stg_atelier') }}
)

-- Si tu as une table ou un détail de consommation par pièce, tu peux l'agréger ici.
-- En attendant, voici une vue de valorisation du stock par famille :
select
    famille,
    count(piece_ref) as nombre_references,
    sum(stock) as stock_total_unites,
    sum(stock * prix_achat) as valeur_totale_stock_achat,
    sum(stock * prix_vente) as valeur_potentielle_vente
from pieces
group by famille