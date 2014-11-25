// used for the background_widget/details view to edit the colours via buttons:

scrivito.on("content", function() { 
  $(document).on("click.button_editor", ".button_editor", function(event) {
    var button = $(event.target);
    button.scrivito('save', button.attr('colour'));
  }); 
});
