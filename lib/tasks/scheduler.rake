desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Importing ilvls...."
  UpdateIlvls.perform_now
  puts "Done!"
end
