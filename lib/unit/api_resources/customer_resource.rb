# frozen_string_literal: true

require "httparty"

require_relative "../api_resources/base_resource"
require_relative "../models/unit_response"
require_relative "../errors/unit_error"
require_relative "../models/customers/patch_individual_customer_request"
require_relative "../models/customers/patch_business_customer_request"

# class for creating requests for customers to Unit API and parsing responses
class CustomerResource < BaseResource
  # Update a customer by calling Unit's API
  # @param [PatchIndividualCustomerRequest, PatchBusinessCustomerRequest] request
  # @return [UnitResponse, UnitError]
  def update(request)
    payload = request.to_json_api
    response = HTTParty.patch("#{api_url}/customers/#{request.customer_id}", body: payload, headers: headers)
    response_handler(response)
  end

  # Get a customer's documents by calling Unit's API
  # @param [Integer] customer_id
  # @return [UnitResponse, UnitError]
  def get(customer_id)
    response = HTTParty.get("#{api_url}/customers/#{customer_id}", headers: headers)
    response_handler(response)
  end

  # Get a customers by calling Unit's API
  # @param [ListCustomerParams] params
  # @return [UnitResponse, UnitError]
  def list(params = nil)
    response = HTTParty.get("#{api_url}/customers", body: params&.to_hash&.to_json, headers: headers)
    response_handler(response)
  end

  # Archive customers by calling Unit's API
  # @param [ArchiveCustomerRequest] request
  # @return [UnitResponse, UnitError]
  def archive(request)
    payload = request.to_json_api
    response = HTTParty.post("#{api_url}/customers/#{request.customer_id}/archive", body: payload, headers: headers)
    response_handler(response)
  end

  # Add authorized users to a customer by calling Unit's API
  # @param [AddAuthorizedUsersRequest] request
  # @return [UnitResponse, UnitError]
  def add_authorized_users(request)
    payload = request.to_json_api
    response = HTTParty.post("#{api_url}/customers/#{request.customer_id}/authorized-users",
                             body: payload,
                             headers: headers)
    response_handler(response)
  end

  # Remove authorized users from a customer by calling Unit's API
  # @param [RemoveAuthorizedUsersRequest] request
  # @return [UnitResponse, UnitError]
  def remove_authorized_users(request)
    payload = request.to_json_api
    response = HTTParty.delete("#{api_url}/customers/#{request.customer_id}/authorized-users", body: payload, headers: headers)
    response_handler(response)
  end

  # Check the response code and return a UnitResponse or UnitError
  # @param [HTTParty::Response] response
  def response_handler(response)
    meta = response["meta"].nil? ? nil : response["meta"]
    case response.code
    when 200...300
      UnitResponse.new(response["data"], meta)
    else
      UnitError.from_json_api(response)
    end
  end
end
