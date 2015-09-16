$(document).ready(function() {
  scrivito.page_menu().add('logout', {
    title: 'Log out',
    icon: 'exit',
    execute: function() {
      return $.ajax({
        url: '/session',
        type: 'post',
        data: {
          _method: 'delete'
        },
        success: function() {
          return window.location.reload();
        }
      });
    }
  });
});