# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Tester::Application.initialize!

# Running Rails without DB
#config.frameworks -= [ :active_record, :active_resource, :action_mailer]
