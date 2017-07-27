require 'spec_helper'

RSpec.describe RackCustomTmpdir do
  include Rack::Test::Methods

  let(:tmpdir) { Dir.mktmpdir }
  let(:filename) { 'hello.jpg' }
  let(:content_type) { 'image/jpeg' }
  let(:app) { RackCustomTmpdir.new(TestApp.new, tmpdir) }

  specify do
    get '/'
    expect(last_response.status).to eq 200
    expect(last_response.body).to eq 'OK'

    tempfile_factory = last_request.env[Rack::RACK_MULTIPART_TEMPFILE_FACTORY]
    expect(tempfile_factory).to be_kind_of Proc

    tempfile = tempfile_factory.call(filename, content_type)
    expect(File.dirname(tempfile.path)).to eq tmpdir
    expect(File.basename(tempfile.path)).to match /\A#{RackCustomTmpdir::BASENAME_PREFIX}.+\.jpg\z/
  end

  after do
    FileUtils.remove_entry_secure(tmpdir)
  end
end
