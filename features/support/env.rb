require 'capybara/cucumber'
require 'report_builder'

# Maximize the browser
Before do
  page.driver.browser.manage.window.maximize
end

# Find a config Path
# @param file_name the file name that will be find
# @return configuration path if exist
def find_config_file(file_name)
  path = Pathname.new(file_name)
  return path if path.exist?
  raise "Configuration file #{file_name} not found!"
end

# Load config file
# @param filename the file name that will be loaded
# @return configuration readed from file
def load_app_config_file(filename)
  config_file = find_config_file(filename)
  config = YAML.load_file(config_file)
  return config
end

# Define the current driver to use
Capybara.register_driver :selenium do |app|
  if ENV['remote'] == 'true'
    raise 'Need to specify target URL for remote drivers' if ENV['url'].nil?
    opts = { browser: :remote, url: ENV['url'], desired_capabilities: $browser }
  else
    opts = { browser: $browser }
  end
  Capybara::Selenium::Driver.new(app, opts)
end

# Set the javascript driver used
Capybara.javascript_driver = :selenium

AfterConfiguration do
  $config_path = ENV['config_path'] || 'config/config.yml'
  $configuration = load_app_config_file($config_path)

  # Environment configurations
  execution = $configuration['Execution']
  $browser = (ENV['browser'] || execution['browser']).to_sym
  USER_A_HOST = ENV['Host'] || execution['Host User A']
  USER_B_HOST = ENV['Host'] || execution['Host User B']
  $wait_time = execution['max_wait_time']
  $min_wait_time = execution['min_wait_time']

  $credentials = $configuration['credentials']

  # Capybara Basic Configurations
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = $wait_time
    config.wait_on_first_by_default = $wait_time
  end
end

at_exit do
  report_name = ENV['report_name']
  unless report_name.nil?
    ReportBuilder.configure do |config|
      report_path = 'reports/' + report_name
      config.json_path = report_name + '.json'
      config.report_path = ENV['report_path'] || report_path
      config.report_types = [:html]
      config.report_tabs = [:overview, :features, :scenarios]
      config.report_title = ENV['report_title'] || $report_title
      config.compress_images = false
      config.additional_info = { browser: $browser,
                                 environment: $org_name,
                                 date: Time.now.strftime('%Y-%m-%d-%H:%M') }
    end
    ReportBuilder.build_report
  end
end

After do |scenario|
  name = scenario.name[0..200]
  if scenario.failed?
    datetime = Time.now.strftime('%Y-%m-%d-%H-%M-')
    browser = "#{$browser}-"
    scenario_path = 'screenshots/FAILED-' + datetime + browser + name + '.png'
    page.driver.browser.save_screenshot(scenario_path)
    embed(File.expand_path(scenario_path), 'image/png', 'Scenario_Failed_Screenshot')
  else
  end
end