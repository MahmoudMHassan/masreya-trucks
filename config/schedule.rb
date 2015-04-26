# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
 every 1.minute do
   #command "0 8 * * * /bin/bash -l -c 'cd ~/Documents/workshop/masreya-trucks/lib/tasks/my_namespace.rake && RAILS_ENV=production rake my_namespace:delete 2>&1'"
   #runner "MyModel.some_method"
   rake "my_namespace:delete"
   rake "my_namespace:deleteAd"
 end
 
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
