require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module WakuwakuJudge
	class Application < Rails::Application
		config.load_defaults 5.2
		config.time_zone = "Tokyo"
		config.active_record.default_timezone = :local
		config.autoload_paths += %W(#{config.root}/lib)

		# 細部の日本語化
		config.i18n.default_locale = :ja
	end
end
