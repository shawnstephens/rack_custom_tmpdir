require 'rack_custom_tmpdir/version'

class RackCustomTmpdir
  BASENAME_PREFIX = 'RackMultipart'

  def initialize(app, tmpdir = nil)
    @app = app

    @tempfile_factory = lambda do |filename, content_type|
      basename_suffix = ::File.extname(filename.gsub("\0".freeze, '%00'.freeze))
      Tempfile.new([BASENAME_PREFIX, basename_suffix], tmpdir)
    end
  end

  def call(env)
    env[Rack::RACK_MULTIPART_TEMPFILE_FACTORY] = @tempfile_factory
    @app.call(env)
  end
end
