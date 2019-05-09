# frozen_string_literal: true

require 'xml'

# app/services/soap_service.rb
module SoapService
  include XML

  class << self
    def call(request)
      soap_envelope = XML::Document.new
      soap_envelope.root = XML::Node.new('soap:Envelope')

      request.namespaces.each do |i, v|
        soap_envelope.root[i.to_s] = v
      end

      soap_envelope.root << soap_header = XML::Node.new('soap:Header')
      soap_header << wsse_security = XML::Node.new('wsse:Security')
      wsse_security['soap:mustUnderstand'] = 'true'
      wsse_security['xmlns:wsse'] = 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd'
      wsse_security['xmlns:wsu'] = 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd'
      wsse_security << wsse_username_token = XML::Node.new('wsse:UsernameToken')
      wsse_username_token['wsu:Id'] = 'UsernameToken-1'
      wsse_username_token << XML::Node.new('wsse:Username', 'CNES.PUBLICO')
      wsse_username_token << wsse_password = XML::Node.new('wsse:Password', 'cnes#2015public')
      wsse_password['Type'] = 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText'

      soap_envelope.root << soap_body = XML::Node.new('soap:Body')
      soap_body << request.body

      puts soap_envelope

      client = Faraday.new(url: request.url)

      response = client.post do |req|
        req.headers['Content-Type'] = 'text/xml'
        req.body = soap_envelope.root.to_s.to_s.delete("\n")
                                .delete("\r").gsub(/\n\t/, ' ').gsub(/>\s*</, '><')
      end
      xml = response.body

      if xml.present?
        nori = Nori.new
        xml = Nokogiri::XML(xml).remove_namespaces!
        xml = xml.root.to_s.delete("\n")
                 .delete("\r").gsub(/\n\t/, ' ').gsub(/>\s*</, '><')
        xml = nori.parse(xml)
      end
      xml['Envelope']['Body'] if xml['Envelope']
    end
  end
end
