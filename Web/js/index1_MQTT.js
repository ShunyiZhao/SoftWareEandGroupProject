var checkBoxContainer = document.getElementsByClassName('checkBoxContainer')[0];
var copyCheckBoxContainer = checkBoxContainer.cloneNode();
var checkBoxButton = checkBoxContainer.getElementsByClassName("checkBoxButton")[0];
checkBoxButton.addEventListener('click', checkTickedItems);

function checkTickedItems () {
  let Text = [];
  var getFoodCategory = checkBoxContainer.getElementsByClassName("foodCategory");
  for (var i = 0; i < getFoodCategory.length; i++) {
      var reviewCheckBox = getFoodCategory[i].getElementsByClassName("checkBox")
      var getImgAltTag = getFoodCategory[i].getElementsByClassName("checkBoxImage");
      for (var j = 0; j < reviewCheckBox.length; j++) {
          var getAltName = getImgAltTag[j].getAttribute("alt");
          if (reviewCheckBox[j].checked == true) {
              Text.push(getAltName);
              reviewCheckBox[j].checked = false
          }
      }
  }
  console.log(Text.length)
  if(Text.length>1&&Text.length<4){
    $(".checkBoxInformation").hide();
    var data = buildMessage("checkbox",Text)
    onSubmit(data);
    return;
  }
  $(".checkBoxInformation").show();
}

// called when the client connects
function onSubmit(payload) {
  // Once a connection has been made, make a subscription and send a message.
  console.log("onSubmit");
  client.subscribe("/BigEater");
  message = new Paho.MQTT.Message(payload);
  message.destinationName = "/BigEater";
  client.send(message);
}
