# Mina Reboot

Generates cron `@reboot` task every time you deploy with [Mina](http://nadarei.co/mina/), so your app will start automatically in case of server reboot.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina_reboot'
```

## Usage

Add these lines to your application's deploy config:
```ruby
require 'mina/reboot'

set :on_reboot, -> {
  # Tasks needed to start application
  invoke 'unicorn:start'
  invoke 'sidekiq:start'
}

task :deploy => :environment do
  # ...
  # Deploy commands
  # ...
  invoke 'reboot:save_startup_script'
end
```

## Contributing

1. [Fork it](https://github.com/localhots/mina_reboot/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
