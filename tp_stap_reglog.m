% TP regression logistique STAP 2021
% Ce script contient de quoi démarrer le TP et des fonctions (en fin de
% script) pour représenter les données et les solutions trouvées. 
% 
% Une partie du TP consiste à écrire les grandes étapes nécessaires à 
% l'apprentissage. 
% Rappel : en Matlab, les fonctions se mettent en fin de script. 
% Le script est alors organisé comme suit: 
% - une partie avec les expériences et commandes 
% - en fin de script, toutes les fonctions écrites pour faire les
% expériences. 
%
% Autre solution, créer un fichier par fonction (le nom du fichier est le
% nom de la fonction)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chargement des données 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load reglog_data_1.mat
% Vous disposez désormais de X et C 
% Regarder les données : contenu, dimensions, ... 
% On peut aussi les représenter sur une figure:
plotdata(X,C)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ecriture pas à pas d'une itération d'apprentissage:
% Nous  allons considérer l'ensemble des données d'apprentissage: 
% soit le couple X et C. 
% Vous trouverez plus loin des lignes de codes commentées 
% avec des "...", que vous pouvez décommenter et terminer. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialisation des paramètres: 
w0 = -5;
w = randn(1,2);
% Choix du pas d'apprentissage (ou learning rate): 
lr = 0.01
% représenter les données et la droite
figure % pour obtenir une nouvelle figure
plotdata(X,C,w0,w)


% inférence : calculer les probabilités d'appartenir à la classe 1,
% selon le modèle de paramètres w0 et w, pour chaque exemple de X
% Y = ... 
% calcul de la fonction de coût
% L = ... 
% calcul du gradient de cette fonction de coût 
% dw = ...
% dw0 = ...
% Faire la mise à jour: 
% w = ... 
% w0 = ... 
% Représenter la nouvelle droite et jouer avec le pas d'apprentissage 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Boucle d'apprentissage et monitoring: 
% Nous pouvons maintenant mettre en place la boucle d'apprentissage
% Le nombre d'époque d'apprentissage est fixée par une variable. 
% L'objectif est d'observer l'évolution de certaines grandeurs 
% au cours de l'apprentissage, en particulier 
% l'évolution de la fonction de perte que l'on cherche à minimiser. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nepochs = 1000 
Losses = zeros(1,Nepochs);
%for e=1:Nepochs
% ...    
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction de représentation graphique des données 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function plotw(bias, w)
fplot(@(x) -(bias + w(1)*x )/w(2), [0 20])
end

function plotdata(MX, MY,b,w)
    neg = MY==0;
    pos = MY==1;
    plot(MX(1,neg), MX(2,neg), 'r.'); hold on;  
    plot(MX(1,pos), MX(2,pos), 'g+');
    if nargin == 4
        plotw(b,w)
    end
    xlim([0 20])
    ylim([0 20])
    hold off
end
