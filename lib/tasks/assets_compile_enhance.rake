# for out static design pages we need assets with non-digested paths:

Rake::Task["assets:precompile"].enhance do
  manifest_path = Dir.glob(File.join(Rails.root, 'public/assets/manifest-*.json')).first
  manifest_data = JSON.load(File.new(manifest_path))
  manifest_data["assets"].each do |logical_path, digested_path|
    logical_pathname = Pathname.new logical_path
    full_digested_path = File.join(Rails.root, 'public/assets', digested_path)
    full_nondigested_path = File.join(Rails.root, 'public/assets', logical_path)
    FileUtils.copy_file full_digested_path, full_nondigested_path, true
  end
end
