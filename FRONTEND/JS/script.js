function toggleDropdown(element) {
    var dropdownContent = element.nextElementSibling;
    dropdownContent.classList.toggle('active');
}

function showTopic(topicId) {
    var divTopicElement = document.querySelector(".div-topic");
    var topicDetailsElement = document.getElementById("topic-details");
    var topicContentElement = topicDetailsElement.querySelector(".topic-content");
    var topicTitleElement = topicDetailsElement.querySelector(".topic-title");

    divTopicElement.style.display = "none";
    topicDetailsElement.style.display = "flex";

    var topicElements = document.getElementsByClassName("topic");
    var topicElement = null;

    for (var i = 0; i < topicElements.length; i++) {
        var topicIdAttribute = topicElements[i].getAttribute("data-topic-id");
        if (topicIdAttribute === topicId) {
            topicElement = topicElements[i];
            break;
        }
    }

    if (topicElement === null) {
        return;
    }

    var topicContent = topicElement.querySelector(".topic-content span").innerHTML;
    var topicTitle = topicElement.querySelector(".topic-title span").innerHTML;
    topicContentElement.innerHTML = "<p id=\"red_arrow\">&#10173;</p><span>" + topicContent + "</span>";
    topicTitleElement.innerHTML = "<p id=\"blue_arrow\">&#10173;</p><span>" + topicTitle + "</span>";
}

//fermer le topic selectionné 
function closeTopic() {
    window.location.href = "/";
}