require "fileutils"
require "erb"

# Example:
#
# Jets::Build::HandlerGenerator.new(
#   "PostsController",
#   :create, :update
# )
class Jets::Build
  class HandlerGenerator
    def initialize(path)
      @path = path
    end

    def generate
      Jets.boot

      deducer = Jets::Build::Deducer.new(@path)

      # TODO: move LinuxRuby.temp_app_code to a common level for HandlerGenerator and LinuxRuby
      temp_app_code = "#{Jets.tmpdir}/#{TravelingRuby.temp_app_code}"
      js_path = "#{temp_app_code}/#{deducer.js_path}"
      FileUtils.mkdir_p(File.dirname(js_path))

      template_path = File.expand_path('../node-shim.js', __FILE__)
      result = Jets::Erb.result(template_path, deducer: deducer)

      IO.write(js_path, result)
    end

  end
end
