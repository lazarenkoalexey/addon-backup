<p align="left">
<img src="swissBackup.png" width="100">
</p>

# Add-on SwissBackup 

Une solution dédiée pour l'ensemble de vos noeuds Jelastic permettant la configuration simple de plan de sauvegardes pour
chacuns de vos containers. Utilisant la fiabilité des infrastructures dédiées à SwissBackup l'ensemble de vos données sont
chiffrées end-to-end et répliquées 3 fois sur 3 lieux géographiques différents. Vous pouvez aisément restauré une sauvegarde
sur n'importe quel noeud de votre compte.

## Backup Process

Il y a 2 types de sauvegardes possbiles.

### Back-up specific folders
<img src="Capture d’écran 2020-04-13 à 09.44.15.png" width="400">

Quand vous sélectionnez Back-up specifics folders le champ Folders to back-up apparait.Celui-ci permet la spécification
des dossiers à sauvegarder, vous pouvez specifier plusieurs dossiers ( séparer chaques chemins par une "," ). Il faut renseigner le chemin absoliue de chaques dossiers que l'on désire sauvegarder.


Exemple : /root/admin/, /home/user1/, /jelastic/containers/

Dans cet exemple 3 dossiers ont été spécifié.

Après avoir spécifié ces dossiers il faut sélectionner un plan de sauvegarde. 

2 plans de sauvegardes sont proposés:

    - Daily 
    
    - Hourly
    
Daily assure une sauvegarde de vos dossiers 1 fois par jour à 23h00. 

La politique de rétenttion associée est la suivante : It will keep the most recent 7 daily snapshots, then 3 (remember, 7 dailies already include a week!) last-day-of-the-weeks and 6 last-day-of-the-months. And finally 3 last-day-of-the-year snapshots. Cette politique est appliqué tout les jours à 23h00 sur le container cible.

Hourly assure une sauvegarde de vos dossiers toutes les heures ( en début d'heure 13h00 par exemple ) 

La politique de rétention associée est la suivante : It will keep the most recent 24 hourly snapshots, the most recent 7 daily snapshots, then 3  last-day-of-the-weeks and 6 last-day-of-the-months. And finally 3 last-day-of-the-year snapshots. Cette politique est appliqué toutes les heures sur le container cible.
