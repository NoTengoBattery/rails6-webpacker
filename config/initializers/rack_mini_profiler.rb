if Rails.env.development?
  require "rack-mini-profiler"

  # initialization is skipped so trigger it
  Rack::MiniProfilerRails.initialize!(Rails.application)
  # Rack::MiniProfiler.config.enable_hotwire_turbo_drive_support = true
  # TODO: Enable the above config next time rack-mini-profiler is updated
  Rack::MiniProfiler.config.position = "bottom-right"
end
