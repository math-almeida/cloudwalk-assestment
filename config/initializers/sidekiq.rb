#!/usr/bin/env ruby

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://queue:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://queue:6379/0' }
end
