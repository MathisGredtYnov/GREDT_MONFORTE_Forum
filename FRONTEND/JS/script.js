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

var inscription = false;

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
        if (bouton.textContent === 'Se connecter') {
            popup.style.display = 'none';
            bouton.textContent = 'Se déconnecter';
            connexion = false;
            connecter = true;
        }
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


// Fin Inscription

// Topic

function toggleDropdown(element) {
    var dropdownContent = element.nextElementSibling;
    dropdownContent.classList.toggle('active');
}

function showTopic(topicIndex) {
    var divTopicElement = document.querySelector(".div-topic");
    var topicDetailsElement = document.getElementById("topic-details");
    var topicContentElements = document.querySelectorAll(".topic-content");
    var topicTitleElements = document.querySelectorAll(".topic-title");
    var topicPseudoElements = document.querySelectorAll(".topic-pseudo-first-message");

    divTopicElement.style.display = "none";
    topicDetailsElement.style.display = "flex";

    var topicContent = topicContentElements[topicIndex].innerText;
    var topicTitle = topicTitleElements[topicIndex].innerText;
    var topicPseudo = topicPseudoElements[topicIndex].innerText;
    
    var topicContentElement = topicDetailsElement.querySelector(".topic-content");
    var topicFirstMessageElement = topicDetailsElement.querySelector(".topic-first-message");
    var topicPseudoFirstMessageElement = topicDetailsElement.querySelector(".topic-pseudo-first-message");

    topicContentElement.innerText = topicContent;
    topicFirstMessageElement.innerText = topicTitle;
    topicPseudoFirstMessageElement.innerText = topicPseudo;
}

window.addEventListener('DOMContentLoaded', (event) => {
    var firstMessage = document.querySelector(".topic-content").textContent;
    var topicFirstMessage = document.querySelector(".topic-first-message");
    topicFirstMessage.textContent = firstMessage;
});
