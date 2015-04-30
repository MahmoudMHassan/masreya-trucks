namespace :my_namespace do
  desc "TODO"

  task delete: :environment do
  	connect = ActiveRecord::Base.connection();
  	connect.execute(ActiveRecord::Base.send(:sanitize_sql_array, ["DELETE FROM users WHERE (created_at < '%s' AND validated is NULL OR validated = 0)",Date.today - 3.days]))
  	 # sql = "DELETE FROM users WHERE (created_at < '#{Date.today - 3.days}' AND validated is NULL OR validated = 0)"
  	  #ActiveRecord::Base.connection.execute(sql)
end
  desc "TODO"
   
  task deleteAd: :environment do 
  connect = ActiveRecord::Base.connection();
  connect.execute(ActiveRecord::Base.send(:sanitize_sql_array,["DELETE FROM makes WHERE (updated_at < '%s')",Date.today - 1.years])) 
  connect.execute(ActiveRecord::Base.send(:sanitize_sql_array,["DELETE FROM ads WHERE (updated_at < '%s')",Date.today - 1.years])) 
  connect.execute(ActiveRecord::Base.send(:sanitize_sql_array,["DELETE FROM bookmarks WHERE (updated_at < '%s')",Date.today - 1.years])) 
 end 
end 
