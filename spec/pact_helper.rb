require 'pact/provider/rspec'

require_relative 'provider_states'

Pact.service_provider 'Provider' do

  honours_pact_with 'Consumer' do

    # This example points to a local file, however, on a real project with a continuous
    # integration box, you would use a [Pact Broker](https://github.com/bethesque/pact_broker) or publish your pacts as artifacts,
    # and point the pact_uri to the pact published by the last successful build.

    pact_uri 'spec/consumer-provider.json'


  end
end
