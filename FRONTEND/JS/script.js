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
            <h1 class="log">Se connecter</h1>
            <div class="input-div">
                <input type="email" class="email" placeholder="E-mail">
                <input type="password" class="password" placeholder="Mot de passe">
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

    document.body.appendChild(popup);
});


//POPUP D'INSCRIPTION



