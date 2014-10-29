$ ->
  Resourcebrowser.filters = {
    'images': {
      title: 'Images',
      query: scrivito.obj_where('_obj_class', 'equals', 'Image'),
      icon: 'scrivito-resourcebrowser-icon-image',
      }
    }