require 'fileutils'

FileUtils.mkpath(projects_results_directory)
FileUtils.mkpath(File.dirname(results_file))

projects.each do |name, path|
  Dir.chdir(path) do
    system "git log --all --pretty=format:\"%ad%x09#{name}%x09%ae%x09%h%x09%s\" --date=iso > #{File.expand_path(File.join(projects_results_directory, "#{name}.csv"))}"
  end
end

Dir.chdir(projects_results_directory) do
  # -h, --no-filename         suppress the file name prefix on output
  system "grep -h #{grep_options_and_pattern} *.csv > #{results_file}"

  puts "File with results: #{results_file}"
end
