# frozen_string_literal: true

module Unit
  module ApplicationForm
    autoload :CreateApplicationFormRequest, "unit/models/application_form/create_application_form_request"

    class << self
      # Create a new application form by calling Unit's API
      # @param tags [Hash]- optional
      # @param applicant_details [ApplicationFormPrefill] - optional
      # @param applowed_application_types [List] - optional
      # @param lang [String] - optional
      # @param settings_override [ApplicationFormSettingsOverride] - optional
      # @param require_id_verification [RequireIdVerification] - optional
      # @param hideApplicationProgressTracker
      # @return [UnitResponse, UnitError]
      def create_application_form(tags: nil, applicant_details: nil, allowed_application_types: nil,
                                  lang: nil, settings_override: nil, require_id_verification: nil,
                                  hide_application_progress_tracker: nil)

        request = CreateApplicationFormRequest.new(
          tags, applicant_details, allowed_application_types, lang, settings_override,
          require_id_verification, hide_application_progress_tracker
        )

        Unit::Resource::ApplicationFormResource.create_application_form(request)
      end
    end
  end
end
