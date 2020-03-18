namespace :ridgepole do
  desc 'Export schema definition'
  task :export do
    sh 'ridgepole', '--config', 'config/database.yml', '--env', ENV.fetch('RAILS_ENV', 'development'), '--export', '--split', '--output', 'db/schemata/Schemafile'
  end

  desc 'Show difference between schema definition and actual schema'
  task :'dry-run' do
    sh 'ridgepole', '--config', 'config/database.yml', '--env', ENV.fetch('RAILS_ENV', 'development'), '--apply', '--dry-run', '--file', 'db/schemata/Schemafile'
  end

  desc 'Apply schema definition'
  task :apply do
    sh 'ridgepole', '--config', 'config/database.yml', '--env', ENV.fetch('RAILS_ENV', 'development'), '--apply', '--file', 'db/schemata/Schemafile'
  end
end
