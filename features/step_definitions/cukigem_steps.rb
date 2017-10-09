Given %r{I have a rails application} do
  step %{I generate a rails application}
  step %{This gem is available in the Gemfile}
  step %{I run "bundle install" in the rails application}
end

Given %r{I generate a rails application} do
  FileUtils.rm_rf(Cukagem.temp_root)
  FileUtils.mkdir_p(Cukagem.temp_root)

  Dir.chdir(Cukagem.temp_root) do
    `rails new #{Cukagem.application_name}`
  end
end

When %r{This gem is available in the Gemfile} do
  step %{I append the following to "Gemfile" in the rails application}, %{
    gem "#{File.basename(Cukagem.project_root)}", :path => "#{Cukagem.project_root}"
  }
  step %{I append the following to "Gemfile" in the rails application}, %{
    group :test do
      gem "capybara"
      gem "rspec"
      gem "childprocess"
    end
  }
end

When %r{I setup the database for the rails application} do
  step %{I run "bundle exec rake db:create db:migrate --trace" in the rails application}
end

When %r{The rails application is running} do
  Dir.chdir(Cukagem.app_root) do
    require File.expand_path("config/environment.rb")

    if Object.const_defined?(:Capybara)
      require "capybara/rails"
    elsif Object.const_defined?(:Webrat)
      require "webrat/rails"
    end
  end
end

When %r{I save the following as "([^"]*)" in the rails application} do |path, string|
  FileUtils.mkdir_p(File.join(Cukagem.app_root, File.dirname(path)))

  File.open(File.join(Cukagem.app_root, path), "w") do |file|
    file.write(string)
  end
end

When %r{I append the following to "([^"]*)" in the rails application} do |path, string|
  FileUtils.mkdir_p(File.join(Cukagem.app_root, File.dirname(path)))
  File.open(File.join(Cukagem.app_root, path), "a+") do |file|
    file.write(string)
  end
end

When %r{I run "([^"]*)" in the rails application} do |command|
  Dir.chdir(Cukagem.app_root) do
    `#{command}`
  end
end
