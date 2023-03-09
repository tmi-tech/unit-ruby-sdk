# frozen_string_literal: true

# Type representing application form prefill
# @see https://docs.unit.co/types/#applicationformprefill
module Unit
  module Types
    class ApplicationFormPrefill
      attr_reader :application_type, :full_name, :ssn, :passport, :nationality,
                  :date_of_birth, :email, :name, :state_of_incorporation, :entity_type,
                  :contact, :officer, :beneficial_owners, :website, :dba, :ein,
                  :industry, :address, :phone, :jwt_subject

      # @param optional application_type [String] One of "Individual", "Business" or "SoleProprietorship".
      # @param optional full_name [FullName] Full name of the individual.
      # @param optional ssn [String] SSN of the individual (numbers only). Either an SSN or a passport number is required.
      # @param optional passport [String] Passport number of the individual. Either an SSN or a passport is required.
      # @param optional nationality [String] Two letters representing the individual nationality. (e.g. "US").
      # @param optional date_of_birth [String] Date only (e.g. "2001-08-15").
      # @param optional email [String] Email address of the individual.
      # @param optional name [String] Name of the business.
      # @param optional state_of_incorporation [String] Two letters representing a US state.
      # @param optional entity_type [String] One of "Corporation", "LLC" or "Partnership".
      # @param optional contact [BusinessContact] Primary contact of the business.
      # @param optional officer [Officer] Officer representing the business (must be the CEO, COO, CFO, President, BenefitsAdministrationOfficer, CIO, VP, AVP, Treasurer, Secretary, Controller, Manager, Partner or Member). To onboard a business successfully, you must provide the officer's personal details.
      # @param optional beneficial_owners [Array[BeneficialOwner]] Array of beneficial owners in the business. Beneficial owners are all people that, directly or indirectly, own 25% or more of the business. To onboard a business successfully, you must provide each beneficial owner's personal details.
      # @param optional website [String] Business's website.
      # @param optional dba [String] "Doing business as". If the individual is a sole proprietor who is doing business under a different name, specify it here.
      # @param optional ein [String] If the individual is a sole proprietor who has an Employer Identification Number, specify it here. / Business EIN (numbers only).
      # @param optional industry [Industry] If the individual is a sole proprietor, specify the industry / Business industry.
      # @param optional address [Address] Address of the individual / Address of the business.
      # @param optional phone [Phone] Phone number of the individual / Phone number of the business.
      # @param optional jwt_subject [String] The JWT subject of the authorized user. See https://docs.unit.co/customer-api-tokens/#customers-create-customer-bearer-token-jwt
      def initialize(application_type: nil, full_name: nil, ssn: nil, passport: nil, nationality: nil,
                     date_of_birth: nil, email: nil, name: nil, state_of_incorporation: nil, entity_type: nil,
                     contact: nil, officer: nil, beneficial_owners: nil, website: nil, dba: nil, ein: nil,
                     industry: nil, address: nil, phone: nil, jwt_subject: nil)
        @application_type = application_type
        @full_name = full_name
        @ssn = ssn
        @passport = passport
        @nationality = nationality
        @date_of_birth = date_of_birth
        @email = email
        @name = name
        @state_of_incorporation = state_of_incorporation
        @entity_type = entity_type
        @contact = contact
        @officer = officer
        @beneficial_owners = beneficial_owners
        @website = website
        @dba = dba
        @ein = ein
        @industry = industry
        @address = address
        @phone = phone
        @jwt_subject = jwt_subject
      end

      def represent
        payload = {
          applicationType: application_type,
          fullName: full_name.represent,
          ssn: ssn,
          passport: passport,
          nationality: nationality,
          dateOfBirth: date_of_birth,
          email: email,
          name: name,
          stateOfIncorporation: state_of_incorporation,
          entityType: entity_type,
          contact: contact.represent,
          officer: officer.represent,
          beneficialOwners: beneficial_owners.map(&:represent),
          website: website,
          dba: dba,
          ein: ein,
          industry: industry.represent,
          address: address.represent,
          phone: phone.represent,
          jwtSubject: jwt_subject
        }
        payload.compact
      end
    end
  end
end
