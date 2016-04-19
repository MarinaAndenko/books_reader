$(function($) 
{
  $(document).ready(function(){
    var preview = $(".image-field-ed img");
    $(".fileinput").change(function(event){
      var input = $(event.currentTarget);
      var file = input[0].files[0];
      var reader = new FileReader();
      reader.onload = function(e){
        image_base64 = e.target.result;
        preview.attr("src", image_base64);
      };
      reader.readAsDataURL(file);
    });
  });

  $(document).on('ajax:success', '#genre-delete', function(e, data, status, xhr) {
    if('genre' in data){
      this.parentNode.parentNode.remove();
    }
  });

  $(document).on('ajax:success', 'form', function(e, data, status, xhr) {
    if ('genre' in data) {
      var parent_node = document.getElementById("genre-list");
      var child_node = document.createElement('div');
      child_node.innerHTML=data.genre;
      parent_node.appendChild(child_node.childNodes[0]);
      $("#genre-field").val("");
    }
  });
});