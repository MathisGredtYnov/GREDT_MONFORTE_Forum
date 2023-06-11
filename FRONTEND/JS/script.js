

//POPUP DE CONNEXION

const loginButton = document.getElementById('login');
loginButton.addEventListener('click', function() {
    // Créez une fenêtre contextuelle (pop-up)
    const popup = document.createElement('div');
    popup.className = 'popup';

    // Contenu de la fenêtre contextuelle
    popup.innerHTML = `
        <div class="popup-header">
            <span class="close-button">&times;</span>
        </div>
        <div class="main-div">
            <h1 class="title_popup">Se connecter</h1>
            <div class="input-div">
                <input type="email" class="email" placeholder="E-mail">
                <input type="password" class="password" placeholder="Mot de passe">
            </div>
            <div class = "log">
                <button class="login" onclick="Connexion()">Se connecter</button>
            </div>
            <div class="conditions">
                <p>En vous connectant, vous acceptez les <a href="/CGU">Conditions d'utilisation</a> et la <a href="/Private">Politique de confidentialité</a> de BlueDit.</p>
            </div>
            <div class="inscription">
                <h1>Première fois sur BlueDit ?</h1>
                <p>S'inscrire</p>
            </div>
        </div>
    `;

    // Ajoutez un événement de clic à la croix pour fermer la fenêtre
    const closeButton = popup.querySelector('.close-button');
    closeButton.addEventListener('click', function() {
        document.body.removeChild(popup);
    });

    if (loginButton.textContent === 'Se déconnecter') {
        document.body.appendChild(popup);
    } else {
        document.body.removeChild(popup);
    }
        
});


//POPUP D'INSCRIPTION



// Changer texte bouton login

function changerTexte() {
    var bouton = document.getElementById('login');
    
    if (bouton.textContent === 'Se connecter') {
      bouton.textContent = 'Se déconnecter';
    } else {
      bouton.textContent = 'Se connecter';
    }
}

// Fin changer texte bouton login
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
