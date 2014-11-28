# we run the migrations and publish them in order to see anything in a production environment
rake scrivito:migrate
rake scrivito:migrate:publish
