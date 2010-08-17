"Run Heroku Cron to check changes in victims. muhahahah."
task :cron => :environment do
   if Time.now.hour == 0 # run at midnight
     victims = VictimUrl.find(:all, :conditions => {:visit_frequency => "daily"})
     victims.each { |e| e.check_for_updates }
   end
   if (Time.now.hour % 1) == 0  # run every hour
     victims = VictimUrl.find(:all, :conditions => {:visit_frequency => "hourly"})
     victims.each { |e| e.check_for_updates }
   end
end
