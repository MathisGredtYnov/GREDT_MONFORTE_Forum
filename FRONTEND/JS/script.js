

//POPUP DE CONNEXION

var connexion = false;
var connecter = false;

const popup = document.querySelector('.popup');
const loginButton = document.getElementById('login');
console.log(popup)
loginButton.addEventListener('click', function() {
    const closeButton = popup.querySelector('.close-button');
    closeButton.addEventListener('click', function() {
        popup.style.display = 'none';
    });

    if ((connecter === false) & (connexion === false)) {
        popup.style.display = 'flex';
        connecter = true;
    } else {
        popup.style.display = 'none';
        connecter = false;
    }

    // if (loginButton.textContent === 'Se connecter') {
    //     popup.style.display = 'flex';
    // } else {
    //     popup.style.display = 'none';
    // }

});


//POPUP D'INSCRIPTION

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