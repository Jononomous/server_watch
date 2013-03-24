$(document).ready(function() {
  $('.primary').click(function() {
    $('#sub-'+$(this).attr('id')).toggle('slow');
  });
  $('.secondary').click(function() {
    $(this).toggle('slow');
  });
});
