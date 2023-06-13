
function toggleDropdown(element) {
    var dropdownContent = element.nextElementSibling;
    dropdownContent.classList.toggle('active');
}

function showTopic(topicIndex) {
    var divTopicElement = document.querySelector(".div-topic");
    var topicDetailsElement = document.getElementById("topic-details");
    var topicContentElement = topicDetailsElement.querySelector(".topic-content span");
    var topicTitleElement = topicDetailsElement.querySelector(".topic-title span");
    var topicPseudoElement = topicDetailsElement.querySelector(".topic-pseudo-first-message span");

    divTopicElement.style.display = "none";
    topicDetailsElement.style.display = "flex";

    var topicElements = document.getElementsByClassName("topic");
    var topic = topicElements[topicIndex];

    var topicContent = topic.querySelector(".topic-content span").innerHTML;
    var topicTitle = topic.querySelector(".topic-title span").innerHTML;
    var topicPseudo = ""; // Assurez-vous de définir correctement la valeur de topicPseudo

    var topicContentElementDetails = topicDetailsElement.querySelector(".topic-content");
    var topicFirstMessageElement = topicDetailsElement.querySelector(".topic-first-message");
    var topicPseudoFirstMessageElement = topicDetailsElement.querySelector(".topic-pseudo-first-message");

    topicContentElementDetails.innerHTML = "<p id=\"red_arrow\">&#10173;</p><span>" + topicContent + "</span>";
    topicFirstMessageElement.innerHTML = "<p id=\"blue_arrow\">&#10173;</p><span>" + topicTitle + "</span>";
    topicPseudoFirstMessageElement.innerHTML = "<span>" + topicPseudo + "</span>";
}




//fermer le topic selectionné 
function closeTopic() {
    window.location.href = "/";
}