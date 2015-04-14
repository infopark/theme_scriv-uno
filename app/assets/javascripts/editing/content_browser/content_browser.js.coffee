scrivito.on 'load', ->
  scrivito.content_browser.filters =
    _obj_class:
      field: '_obj_class'
      options:
        Image:
          icon: 'image'
          title: 'Images'
        Page:
          enable_create: true
          icon: 'text'
          preset:
            _obj_class: 'Person'
          title: 'Pages'
        Person:
          enable_create: true
          icon: 'person'
          preset:
            _obj_class: 'Person'
          title: 'People'
