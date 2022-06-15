/* 4. Création et affichage des requêtes SQL demandées */

/* 1) J'aimerais obtenir l'ID du client, son nom, son prénom et l'ID de sa commande */
SELECT c.id_Client, nom_Client, prenom_Client, id_Commande_Client
FROM clients c
    INNER JOIN `commandes clients` cc ON c.id_Client = cc.id_Client;

/* 2) J'aimerais obtenir le nom des fournisseurs et le total (nombre de commandes) des commandes effectuées */
SELECT nom_Fournisseur, COUNT(id_Commande_Fournisseur) AS 'Total Nombre commandes'
FROM fournisseurs f
    INNER JOIN `commandes fournisseurs` cf on f.id_Fournisseur = cf.id_Fournisseur
GROUP BY nom_Fournisseur;

/* 3) Pour chaque magasin je désire obtenir le stock actuel en sets LEGO
BONUS : version facile -> 5 requêtes ¦¦ version difficile -> 1 requête */
SELECT nom_Magasin, SUM(quantite_Stock) AS 'Somme du stock total disponible par magasin'
FROM magasins m
    INNER JOIN stock s on m.id_Magasin = s.id_Magasin
GROUP BY nom_Magasin;

/* 4) J'aimerais obtenir la liste de tous les employés et savoir également dans quel magasin ils
travaillent (nom et adresse du magasin) */
SELECT nom_Employe, prenom_Employe, nom_Magasin, adresse_Magasin
FROM employes e
    INNER JOIN magasins m on e.id_Magasin = m.id_Magasin;

/* 5) J'aimerais obtenir une requête générique afin de savoir quel(s) magasin(s) a (ont) le set LEGO recherché */
SELECT nom_Magasin
FROM magasins m
    INNER JOIN stock s on m.id_Magasin = s.id_Magasin
WHERE id_LEGO_Set = '30161'/* Inserer ici l'id du set voulu */;

/* 6) J'aimerais obtenir pour un set LEGO donné, le numéro des pièces du set, la quantité de pièces
ainsi que leur couleur */
SELECT id_LEGO_Set, lp.id_LEGO_Piece, quantite_Piece, nom_LEGO_Couleur
FROM lego_sets ls
    INNER JOIN lego_pieces lp on ls.id_LEGO_Piece = lp.id_LEGO_Piece
    INNER JOIN lego_couleurs lc on ls.id_Couleur = lc.id_Couleur
WHERE id_LEGO_Set = '30161' /* Inserer ici l'id du set voulu */;

/* 7) J'aimerais obtenir la liste de tous les thèmes LEGO présents dans le stock ainsi que le nombre
de sets LEGO par thèmes en stock */
SELECT nom_LEGO_Theme, COUNT(s.id_LEGO_Set)
FROM stock s
    INNER JOIN lego_sets ls on s.id_LEGO_Set = ls.id_LEGO_Set
    INNER JOIN lego_themes lt on ls.id_LEGO_Theme = lt.id_LEGO_Theme
GROUP BY nom_LEGO_Theme;

/* 8) J'aimerais obtenir la liste des commandes clients avec un montant supérieur à 70 CHF */
SELECT *
FROM `commandes clients`
WHERE prix_Commande_Client > 70;

/* 9) J'aimerais obtenir le total de pièces en stock */
SELECT SUM(quantite_Piece) As 'Total pieces en stock'
FROM lego_pieces lp
    INNER JOIN lego_sets ls on lp.id_LEGO_Piece = ls.id_LEGO_Piece
    INNER JOIN stock s on ls.id_LEGO_Set = s.id_LEGO_Set;


/* 10) J'aimerais obtenir la liste de quel fournisseur s'occupe de fournir quel set
BONUS : version facile -> 5 requêtes ¦¦ version difficile -> 1 requête */
SELECT DISTINCT nom_Fournisseur, id_LEGO_Set
FROM fournisseurs f
    INNER JOIN `commandes fournisseurs` cf on f.id_Fournisseur = cf.id_Fournisseur;

/* 11) J’aimerais obtenir la liste des catégories (numéro et nom, sans doublon) commandées chez les
fournisseurs. La liste doit être triée par nom. */
SELECT DISTINCT lc.id_LEGO_Categorie_Impose, nom_LEGO_Categorie
FROM `commandes fournisseurs` cf
    INNER JOIN lego_sets ls on cf.id_LEGO_Set = ls.id_LEGO_Set
    INNER JOIN lego_pieces lp on ls.id_LEGO_Piece = lp.id_LEGO_Piece
    INNER JOIN lego_categories lc on lp.id_LEGO_Categorie_Impose = lc.id_LEGO_Categorie_Impose
ORDER BY nom_LEGO_Categorie;

/* 12) J’aimerais obtenir la quantité de SET commandée chez les fournisseurs par chaque magasin */
SELECT nom_Magasin, SUM(quantite) AS 'Quantite sets commandees'
FROM `commandes fournisseurs` cf
    INNER JOIN `livraisons magasins fournisseurs` lmf on cf.id_Commande_Fournisseur = lmf.id_Commande_Fournisseur
    INNER JOIN magasins m on lmf.id_Magasin = m.id_Magasin
GROUP BY nom_Magasin;