//POPUP DE CONNEXION

var connexion = false;
var connecter = false;

const popupconnexion = document.querySelector('.popupconnexion');
const loginButton = document.getElementById('login');

loginButton.addEventListener('click', function() {
    const closeButton = popupconnexion.querySelector('.close-button');
    if (closeButton) {
        closeButton.addEventListener('click', function() {
            popupconnexion.style.display = 'none';
            connexion = false;
        });
    }

    if ((connecter === false) & (connexion === false)) {
        popupconnexion.style.display = 'flex';
        connexion = true;
        connecter = false;
    } else {
        popupconnexion.style.display = 'none';
        connexion = false;
        connecter = false;
    }
});

//POPUP D'INSCRIPTION

var inscription = false;

const BoutonInscription = document.getElementById('BoutonInscription');
const popupinscription = document.querySelector('.popupinscription');

BoutonInscription.addEventListener('click', function() {
    const closeButton = popupinscription.querySelector('.close-button');
    closeButton.addEventListener('click', function() {
        popupinscription.style.display = 'none';
        inscription = false;
        connexion = false;
    });

    if ((connecter === false) & (connexion === true) & (inscription === false)) {
        popupconnexion.style.display = 'none';
        popupinscription.style.display = 'flex';
        connexion = false;
        inscription = true;
    } else {
        popupinscription.style.display = 'none';
        inscription = false;
    }
});

// Connexion
function Deconnexion() {
    var bouton = document.getElementById('login');
    
    if (connecter === true) {
    
        bouton.textContent = 'Se connecter';
        connexion = false;
        connecter = false;
    }
}

function Connexionpopup() {
    var popup = document.querySelector('.popupconnexion');
    var popupbouton = document.querySelector('.BoutonConnexionPopup');
    var bouton = document.getElementById('login');
    
    if (connexion === true) {
        popup.style.display = 'none';
        bouton.textContent = 'Se déconnecter';
        connexion = false;
        connecter = true;
    }
}

// Fin Connexion

// Inscription

const BoutonInscriptionpopup = document.querySelector('.BoutonInscriptionpopup');

function Inscription() {
    var popup = document.querySelector('.popupinscription');
    var bouton = document.getElementById('login');
    
    if (inscription === true) {
        popup.style.display = 'none';
        bouton.textContent = 'Se déconnecter';
        inscription = false;
        connecter = true;
    }
}