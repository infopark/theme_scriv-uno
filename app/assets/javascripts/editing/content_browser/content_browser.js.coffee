scrivito.content_browser.filters = {
  'images': {
    title: 'Images',
    query: scrivito.obj_where('_obj_class', 'equals', 'Image'),
    icon: 'scrivito-content_browser-icon-image',
    },
  'people': {
    title: 'People',
    query: scrivito.obj_where('_obj_class', 'equals', 'Person'),
    icon: 'scrivito-content_browser-icon-person',
    },
  'pages': {
    title: 'Pages',
    query: scrivito.obj_where('_obj_class', 'equals', 'Page'),
    icon: 'scrivito-content_browser-icon-content',
    }
  }
