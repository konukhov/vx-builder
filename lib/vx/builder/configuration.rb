require 'hashr'
require 'logger'
require 'vx/common/tagged_logging'

module Vx
  module Builder
    class Configuration < ::Hashr

      extend Hashr::EnvDefaults

      self.env_namespace = 'vx_builder'
      self.raise_missing_keys = true

      define logger:            Common::TaggedLogging.new(Logger.new STDOUT),
             webdav_cache_url:  nil,
             casher_ruby:       "/usr/local/rbenv/versions/1.9.3-p484/bin/ruby"

    end
  end
end
