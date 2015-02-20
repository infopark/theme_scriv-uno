scrivito.content_browser.filters = 
  legacy:
    options:
      images: 
        title: 'Images',
        query: scrivito.obj_where('_obj_class', 'equals', 'Image'),
        icon: 'image',
      people: 
        title: 'People',
        query: scrivito.obj_where('_obj_class', 'equals', 'Person'),
        icon: 'person',
      pages: 
        title: 'Pages',
        query: scrivito.obj_where('_obj_class', 'equals', 'Page'),
        icon: 'content',
