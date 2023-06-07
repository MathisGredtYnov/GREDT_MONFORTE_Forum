//POPUP DE CONNEXION

var connexion = false;
var connecter = false;

const popupconnexion = document.querySelector('.popupconnexion');
const loginButton = document.getElementById('login');

console.log(popupconnexion)

loginButton.addEventListener('click', function() {
    const closeButton = popupconnexion.querySelector('.close-button');
    closeButton.addEventListener('click', function() {
        popupconnexion.style.display = 'none';
    });

    if ((connecter === false) & (connexion === false)) {
        popupconnexion.style.display = 'flex';
        connecter = true;
    } else {
        popupconnexion.style.display = 'none';
        connecter = false;
    }
});


//POPUP D'INSCRIPTION

const BoutonInscription = document.getElementById('BoutonInscription');
const popupinscription = document.querySelector('.popupinscription');

console.log(popupinscription)

BoutonInscription.addEventListener('click', function() {
    const closeButton = popupinscription.querySelector('.close-button');
    closeButton.addEventListener('click', function() {
        popupinscription.style.display = 'none';
    });

    if ((connecter === false) & (connexion === false) & (inscription === false)) {
        popupconnexion.style.display = 'none';
        popupinscription.style.display = 'flex';
    } else {
        popupinscription.style.display = 'none';
    }
});

// Connexion

function Connexion() {
    var bouton = document.getElementById('login');
    
    if (bouton.textContent === 'Se déconnecter') {
      bouton.textContent = 'Se connecter';
      connexion = true;
      connecter = false;
    }
    var connexionpopup = document.getElementById('BoutonConnexionPopup');
    connexionpopup.addEventListener('click', function() {
        popup.style.display = 'none';
        bouton.textContent = 'Se déconnecter';
        connexion = false;
        connecter = true;
    });
}

// Fin Connexion

// Inscription

const BoutonInscriptionpopup = document.querySelector('.BoutonInscriptionpopup');

function Inscription() {
    // var Inscriptionpopup = document.getElementById('BoutonInscriptionpopup');
    BoutonInscriptionpopup.addEventListener('click', function() {
        popup.style.display = 'none';
        bouton.textContent = 'Se déconnecter';
        connexion = false;
        connecter = true;
    });
}