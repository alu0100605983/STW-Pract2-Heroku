task(:default) do
	require './test/test.rb'
end

desc "ejecutar los tests"
task :test => :default

desc "Arrancar la aplicacion"
task :server do
  sh "ruby twitter.rb"
end

desc "Intalacion de gema"
task :bexec do
	sh "bundle exec rackup -p 4567"
end

