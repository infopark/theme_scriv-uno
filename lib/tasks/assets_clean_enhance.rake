Rake::Task['assets:clean'].enhance do
  puts "Running scrivito:migrate"
  Rake::Task['scrivito:migrate'].invoke
  puts "Running scrivito:migrate:publish"
  Rake::Task['scrivito:migrate:publish'].invoke
end
