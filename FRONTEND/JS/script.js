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

    var topicTitle = topicElement.querySelector(".topic-title span").textContent;
    var topicContent = topicElement.querySelector(".topic-content span").textContent;

    topicTitleElement.innerHTML = "<p id=\"blue_arrow\">&#10173;</p><span>" + topicTitle + "</span>";
    topicContentElement.innerHTML = "<p id=\"red_arrow\">&#10173;</p><span>" + topicContent + "</span>";
}


function showTopicDetails(element) {
    var divTopicElement = document.querySelector('.div-topic');
    var topicDetailsElement = document.getElementById('topic-details');
    var topicTitleElement = topicDetailsElement.querySelector('.topic-title');
    var topicContentElement = topicDetailsElement.querySelector('.topic-content');
    var clickedTopic = element.textContent;
  
    var topicData = {
      nom: element.dataset.nom,
      contenu: element.dataset.contenu
    };
  
    if (!topicData.nom || !topicData.contenu) {
      return;
    }
  
    // Afficher les données du topic dans les éléments correspondants
    topicTitleElement.innerHTML = "<p id=\"blue_arrow\">&#10173;</p><span>" + topicData.nom + "</span>";
    topicContentElement.innerHTML = "<p id=\"red_arrow\">&#10173;</p><span>" + topicData.contenu + "</span>";
  
    // Afficher la div des détails du topic
    topicDetailsElement.style.display = 'flex';
    divTopicElement.style.display = 'none';
  }
  
  
  
  
  
  
  





//fermer le topic selectionné 
function closeTopic() {
    window.location.href = "/";
}