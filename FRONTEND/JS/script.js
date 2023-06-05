// Sélectionnez le bouton "Se connecter"
const loginButton = document.getElementById('login');

// Ajoutez un événement de clic au bouton
loginButton.addEventListener('click', function() {
    // Créez une fenêtre contextuelle (pop-up)
    const popup = document.createElement('div');
    popup.className = 'popup';

    // Contenu de la fenêtre contextuelle
    popup.innerHTML = `
        <div class="main-div">
            <h1 class=log>Se connecter</h1>
            <div class="input-div">
                <label for="email">E-mail: </label>
                <input type="email" class="email" placeholder="E-mail">
                <label for="password">Mot de passe: </label>
                <input type="password" class="password" placeholder="Mot de passe">
            </div>
            <div class ="conditions">
            <p>En vous connectant, vous acceptez les <a href="/CGU">Conditions d'utilisation</a> et la <a href="/Private">Politique de confidentialité</a> de BlueDit.</p>
            </div>
            <div class="inscription">
                <h1>Première fois sur BlueDit ?</h1>
                <button>S'inscrire</button>
            </div>
        </div>
    `;

    // Ajoutez la fenêtre contextuelle à la page
    document.body.appendChild(popup);
});



