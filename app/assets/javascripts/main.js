$(document).ready(function(){
  $("input.guest").on('blur', function(event){
    if (event.target.value && event.target.value.trim().length > 0 ) {
      var serial = event.target.dataset.inputId;
      var $span = $('[data-span-id=' + serial + ']');
      var url = '/users/find?email=' + encodeURIComponent(event.target.value);
      $.get(url)
      .done(function(response) {
        $span.html('&#10004;');
      })
      .fail(function(response){
        $span.html('&#10005;');
      });
    }
  });
});
