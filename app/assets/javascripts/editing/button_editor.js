// used for the background_widget/details view to edit the colours via buttons:

scrivito.on("content", function() { 
  $(document).on("click.button_editor", ".button_editor", function(event) {
    var button = $(event.target);
    $("input.button_editor").removeClass("active");
    button.addClass("active");
    button.scrivito('save', button.attr('button-value'));
  }); 
});
