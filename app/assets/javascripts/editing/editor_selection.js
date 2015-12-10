scrivito.on("load", function() {
  scrivito.select_editor(function(element, editor) {
    editor.use("medium");
    editor.use("toggle_button_editor");
    editor.use("toggle_multi_select_editor");
    editor.use("color_picker");
  });
});