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
%                   Chargement des données 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Lr = learning rate
%Nepochs = nombre d iterations
function [] = RegressionLogistique(X, C, lr, Nepochs)
    % Vous disposez désormais de X et C 
    % Regarder les données : contenu, dimensions, ... 
    % On peut aussi les représenter sur une figure:
    N = length(C);

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
    % représenter les données et la droite
    % pour obtenir une nouvelle figure
    subplot(2,2,1)
    plotdata(X,C)
    legend('Groupe A', 'Groupe B')
    hold on
    plotw(w0,w, 'Droite sans Optimization')


    % inférence : calculer les probabilités d'appartenir à la classe 1,
    % selon le modèle de paramètres w0 et w, pour chaque exemple de X`
    a = w0 + w*X;
    Y = 1./(1+exp(-a));

    % calcul de la fonction de coût

    %Fonction de cout pour chaque point
    L =  -(C*log(Y') + (1-C)*log(1-Y'))/N
    % calcul du gradient de cette fonction de coût 
    dw = (-(C-Y)*X')/N;
    dw0 = (-(C-Y)*ones(1,length(X))')/N;
    % Faire la mise à jour: 
    w = w - dw*lr
    w0 = w0 - dw0*lr

    % Représenter la nouvelle droite et jouer avec le pas d'apprentissage 

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Boucle d'apprentissage et monitoring: 
    % Nous pouvons maintenant mettre en place la boucle d'apprentissage
    % Le nombre d'époque d'apprentissage est fixée par une variable. 
    % L'objectif est d'observer l'évolution de certaines grandeurs 
    % au cours de l'apprentissage, en particulier 
    % l'évolution de la fonction de perte que l'on cherche à minimiser. 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Losses = zeros(1,Nepochs);
    for e=1:Nepochs
        a = w0 + w*X;
        Y = 1./(1+exp(-a));
        
                
        %Il faut calculer la norme du vecteur
        norma(e) = sqrt(w0^2 + norm(w)^2);
        erro(e) = sum(abs(Y - C) > 0.5)/N;
        
        % calcul de la fonction de coût

        %Fonction de cout pour chaque point
        L =  -(C*log(Y') + (1-C)*log(1-Y'))/N;
        Losses(e) = L;
        % calcul du gradient de cette fonction de coût 
        dw = (-(C-Y)*X')/N;
        dw0 = (-(C-Y)*ones(1,length(X))')/N;
        % Faire la mise à jour: 
        w = w - dw*lr;
        w0 = w0 - dw0*lr;
        
    end

    hold on
    plotw(w0,w, 'Droite avec Optimization')
    title('Classification')


    subplot(2,2,2)
    plot(1:Nepochs, Losses)
    title('Fonction de Cout')
    xlabel('Nombre de Epochs')
    ylabel('Fonction de Cout')
    
    subplot(2,2,3);
    plot(1:Nepochs, norma);
    title('Evolution de la Norme');
    xlabel('Nombre de Epochs');
    ylabel('Norme')
    
    subplot(2,2,4);
    plot(1:Nepochs, erro);
    title('Taux de Erreur');
    xlabel('Nombre de Epochs');
    ylabel('Evolution du taux d erreur')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Fonction de représentation graphique des données 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function plotw(bias, w, text)
        fplot(@(x) -(bias + w(1)*x )/w(2), [0 20], 'DisplayName', text)
        legend('-DynamicLegend')
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


end