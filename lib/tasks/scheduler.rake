desc "This task is called by the Heroku scheduler add-on."

task :update_ilvls => :environment do
  UpdateIlvls.perform_now("Mal'ganis")
end
