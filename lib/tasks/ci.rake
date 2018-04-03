unless Rails.env.production?
  require 'rspec/core/rake_task'
  require 'coveralls/rake/task'

  Coveralls::RakeTask.new

  namespace :ci do
    task tests: [:spec, 'coveralls:push']
  end
end
