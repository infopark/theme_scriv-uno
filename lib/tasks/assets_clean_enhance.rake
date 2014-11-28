Rake::Task['assets:clean'].enhance do
  Rake::Task['scrivito:migrate'].invoke
  Rake::Task['scrivito:migrate:publish'].invoke
end
