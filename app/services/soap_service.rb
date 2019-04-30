# frozen_string_literal: true

module SoapService
  class << self
    def call(operation, xml, wsdl)
      client = Savon::Client.new(wsdl: wsdl,
                                 soap_version: 2,
                                 namespace_identifier: nil,
                                 ssl_verify_mode: :none,
                                 convert_request_keys_to: :none,
                                 log: true,
                                 env_namespace: :soap,
                                 pretty_print_xml: true)
      client.call(operation, xml: xml)
    end
  end
end
