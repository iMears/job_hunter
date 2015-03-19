$(document).ready (function(){
  $(".save-note-btn").on('click', function(event) {
    event.preventDefault();
    if (event.target.text === "Save") {
      addNote(event);
    }
  });

  function addNote(event) {
    event.preventDefault();
    console.log(event);
    var $action = $(event.target.attributes.nodeValue);
    var $data   = $(this).serialize();
    var request = $.ajax({
      url: $action,
      type: 'post',
      data: $data,
      dataType: 'json'
    });
    request.done(function(response) {
      console.log("got a request");
    });
    request.fail(function(xhr, status, error) {
      var err = eval("(" + xhr.responseText + ")");
      console.log(err);
    });
  }
});