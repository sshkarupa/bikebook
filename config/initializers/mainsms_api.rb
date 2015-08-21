MainsmsApi::Configuration.setup YAML.load_file(Rails.root.join('config', 'application.yml'))['mainsms']
