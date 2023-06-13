//POPUP DE CONNEXION

var connexion = false;

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

    if (!connexion) {
        popupconnexion.style.display = 'flex';
        connexion = true;
    } else {
        popupconnexion.style.display = 'none';
        connexion = false;
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

// Fin Inscription
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


//fermer le topic selectionné
function closeTopic() {
    window.location.href = "/";
}