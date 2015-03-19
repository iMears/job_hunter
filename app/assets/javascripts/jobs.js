$(document).ready (function(){
  $(document).on('ajax:success', '.note-form', function(e, data, status, xhr) {
    // console.log(status);
    // console.log(xhr);
    // console.log(e);
    var template = "";
    template += "<a href='/users/" + 6 + "/jobs/" + 33 + "/notes/" + 87 + "'>";
    template += "<div class='note-container'>";
    template += "<div class='row'>";
    template += "<div class='pull-left'>";
    template += "<h4 class='single-note-title'>";
    template += "<em>FUCK STICK</em>";
    template += "</h4>";
    template += "</div>";
    template += "<div class='pull-right note'>11/13/3333</div>";
    template += "<div>this is how we do is bitches</div>";
    template += "</div>";
    template += "</a>";

    $('.all-notes').append(template);
  });
  $(document).on('ajax:error', '.note-form', function(xhr, status, error) {
    console.log("Error!!");
    console.log(xhr);
    console.log(status);
    console.log(error);
  });
});