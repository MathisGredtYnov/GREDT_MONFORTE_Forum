
function toggleDropdown(element) {
    var dropdownContent = element.nextElementSibling;
    dropdownContent.classList.toggle('active');
}

function showTopic(topicIndex) {
    var divTopicElement = document.querySelector(".div-topic");
    var topicDetailsElement = document.getElementById("topic-details");
    var topicContentElement = document.querySelector("#topic-" + topicIndex + " .topic-content");
    var topicTitleElement = document.querySelector("#topic-" + topicIndex + " .topic-title");
    var topicPseudoElement = document.querySelector("#topic-" + topicIndex + " .topic-pseudo-first-message");

    divTopicElement.style.display = "none";
    topicDetailsElement.style.display = "flex";

    var topicContent = topicContentElement.innerText;
    var topicTitle = topicTitleElement.innerText;
    var topicPseudo = topicPseudoElement.innerText;

    var topicContentElementDetails = topicDetailsElement.querySelector(".topic-content");
    var topicFirstMessageElement = topicDetailsElement.querySelector(".topic-first-message");
    var topicPseudoFirstMessageElement = topicDetailsElement.querySelector(".topic-pseudo-first-message");

    topicContentElementDetails.innerText = topicContent;
    topicFirstMessageElement.innerText = topicTitle;
    topicPseudoFirstMessageElement.innerText = topicPseudo;
}





//fermer le topic selectionné 
function closeTopic() {
    window.location.href = "/";
}