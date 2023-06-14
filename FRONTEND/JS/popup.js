// Constructions et variables

const popupconnexion = document.querySelector('.popupconnexion');
const BoutonConnexion = document.getElementById('login');
const BoutonInscription = document.getElementById('BoutonInscription');
const popupinscription = document.querySelector('.popupinscription');
const BoutonInscriptionpopup = document.querySelector('.BoutonInscriptionpopup');
const closeButton = popupconnexion.querySelector('.close-button');
const BoutonMenu = document.querySelector('.BoutonMenu');
const Menu = document.querySelector('.MenuLatéral');

var connexion = false;
var connecter = false;
var inscription = false;

//POPUP DE CONNEXION

BoutonConnexion.addEventListener('click', function () {
    var ligneinscription = document.querySelector('.inscription');

    if (closeButton) {
        closeButton.addEventListener('click', function () {
            popupconnexion.style.display = 'none';
            connexion = false;
        });
    }

    if ((connecter === false) & (connexion === false)) {
        popupconnexion.style.display = 'flex';
        ligneinscription.style.display = 'flex';
        connexion = true;
        connecter = false;
    } else {
        popupconnexion.style.display = 'none';
        connexion = false;
        connecter = false;
    }
});

//POPUP D'INSCRIPTION

BoutonInscription.addEventListener('click', function () {
    const closeButton = popupinscription.querySelector('.close-button');
    closeButton.addEventListener('click', function () {
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

function Inscription() {
    var popupinscription = document.querySelector('.popupinscription');
    var popupconnexion = document.querySelector('.popupconnexion');
    var ligneinscription = document.querySelector('.inscription');

    if (inscription === true) {
        popupinscription.style.display = 'none';
        popupconnexion.style.display = 'flex';
        ligneinscription.style.display = 'none';
        inscription = false;
        connexion = true;
    }
}

// Fin Inscription

// Debut menu

let MenuLatéralOuvert = false;

BoutonMenu.addEventListener('click', OuvertureMenu)

function OuvertureMenu() {

    Menu.classList.toggle('MenuLatéralOuvert');

    // MenuLatéralOuvert = !MenuLatéralOuvert;
    // if (MenuLatéralOuvert) {
    //     Menu.classList.add('MenuLatéralOuvert');
    // } else {
    //     Menu.classList.remove('MenuLatéralOuvert');
    // }
}

// Fin menu