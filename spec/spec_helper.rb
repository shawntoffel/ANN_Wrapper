require 'coveralls'
# coveralls test coverage
Coveralls.wear!

require 'ann_wrapper'
require 'webmock/rspec'
require 'support/fake_ann'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
	# route all api requests to fake api
	config.before(:each) do
		stub_request(:any, /cdn.animenewsnetwork.com/).to_rack(FakeANN)
	end

	# Alias for shared examples
	config.alias_it_should_behave_like_to :it_returns, "it returns"

  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end
