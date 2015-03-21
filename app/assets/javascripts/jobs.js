$(document).ready (function(){
  $(document).on('ajax:success', '.note-form', function(event, data) {
    console.log(data);
    var template = "";

    template += '<a href="/users/' + data.user.id + '/jobs/' + data.note.job_id + '/notes/' + data.note.id + '/edit">';
    template += '<div class="note-container">';
    template += '<div class="row">';
    template += '<div class="pull-left">';
    template += '<h4 class="single-note-title">';
    template += '<em class="insert-note-title"></em>';
    template += '</h4>';
    template += '</div>';
    template += '<div class="pull-right note insert-note-date"></div>';
    template += '</div>';
    template += '<div><pre class="pre-note insert-note-text"></pre></div>';
    template += '</div>';
    template += '</a>';

    $template = $(template);
    $template.find('.insert-note-title').text(data.note.title).removeClass('insert-note-title');
    $template.find('.insert-note-date').text(data.note.updated_at).removeClass('insert-note-date');
    $template.find('.insert-note-text').text(data.note.text).removeClass('insert-note-text');

    $('.all-notes').prepend($template);

    $('.note-form').html('');
  });
  $(document).on('ajax:error', '.note-form', function(xhr, status, error) {
    console.log(status);
    console.log(error);
  });

  $(document).on('click', '.cancel-note-btn', function() {
    $('#note-form').html('');
  });

  $(document).on('click', '.move', function(event) {
    event.preventDefault();
    $(this).closest('.job').find('.move-dropdown').toggle();
  });

    // $('.add-job-btn').on('click', function() {
    //     swal('show me your divs!!!');
    // });
});
