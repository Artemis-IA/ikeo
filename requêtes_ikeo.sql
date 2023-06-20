* Afficher les noms et descriptions de tous les produits : 
SELECT nom, description FROM produits


* Afficher tous les meubles qui sont abandonnés : 
SELECT nom FROM produits WHERE etat='oui'


* Effacer le Bo Meuble de Brest : 
DELETE FROM clients WHERE ville_c='Brest' AND raison_sociale='Bo Meuble'


* Il y a une erreur sur le nom du meuble Apfelgluk, il faut le récrire Apfelgluck,
UPDATE produits SET nom='Apfelgluck' WHERE nom='Apfelgluk'"


* Ajouter un nouveau client : Tout à la maison, Place Terreaux, Lyon
INSERT INTO clients(type, raison_sociale, adresse_c, ville_c, pays_c) VALUES('magasin','Tout à la maison','Place Terreaux','Lyon','France')


* Ajouter une nouvelle facture pour le tout à la maison de Lyon , enregistré le 28/08/2018, à 18h.
INSERT INTO factures(numero,date,id_client) VALUES('MSQ298','2018-08-28',(SELECT id_client FROM clients WHERE adresse_c='Place Terreaux'))


* La commande est composé de 18 Naess.
INSERT INTO factures_produits(id_fact,id_produit,quantite) VALUES ((SELECT id_fact FROM factures WHERE date='2018-08-28'),(SELECT id_produit FROM produits WHERE nom='Naess'),18)


* Retrouver tous les meubles achetés par le Bo Meuble de Paris
SELECT p.nom, fp.quantite FROM factures_produits fp LEFT JOIN produits p ON p.id_produit=fp.id_produit LEFT JOIN factures f on f.id_fact=fp.id_fact LEFT JOIN clients c on c.id_client=f.id_client WHERE raison_sociale='Bo Meuble' AND ville_c='Paris'


* Retrouver toutes les factures enregistrées depuis le 1er juillet 2018
SELECT numero from factures WHERE date>'2018-07-01'


* Afficher le nombre de commandes par meubles
SELECT p.nom, SUM(fp.quantite) as 'Quantité commandée' FROM factures f LEFT JOIN factures_produits fp ON fp.id_fact=f.id_fact LEFT JOIN produits p ON p.id_produit=fp.id_produit GROUP BY p.nom


* Afficher tous les produits ainsi que leurs sites de production
SELECT p.nom, spt.usine FROM produits p LEFT JOIN sites_produits sp ON sp.id_produit=p.id_produit LEFT JOIN sites_production spt ON spt.id_site=sp.id_site


* Afficher le nombre de commandes par clients.
SELECT c.raison_sociale, c.ville_c, SUM(fp.quantite) as 'Quantité commandée' FROM factures f LEFT JOIN factures_produits fp ON fp.id_fact=f.id_fact LEFT JOIN clients c ON f.id_client=c.id_client GROUP BY c.id_client