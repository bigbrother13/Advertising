$(document).ready(function(){
  $("input#search").keyup(function() {
    $.ajax({
      url: $("#pins_search").attr("action"),
      data: $("#pins_search").serialize(),
      dataType: 'script'     
    });
    return false;
  });

  $('.dropdown-submenu a.test').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});
