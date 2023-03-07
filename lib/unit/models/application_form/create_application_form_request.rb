# frozen_string_literal: true

require "unit/types/application_form_prefill"
require "unit/types/application_form_settings_override"
require "unit/types/require_id_verification"

# Request to create an individual application
# @see https://docs.unit.co/application-forms/#create-application-form
module Unit
  module ApplicationForm
    class CreateApplicationFormRequest
      attr_reader :tags, :applicant_details, :allowed_application_types, :lang,
                  :settings_override, :require_id_verification, :hide_application_progress_tracker

      # @param tags [Hash]- optional
      # @param applicant_details [ApplicationFormPrefill] - optional
      # @param applowed_application_types [List] - optional
      # @param lang [String] - optional
      # @param settings_override [ApplicationFormSettingsOverride] - optional
      # @param require_id_verification [RequireIdVerification] - optional
      # @param hideApplicationProgressTracker
      def initialize(tags = nil, applicant_details = nil, allowed_application_types = nil, lang = nil, settings_override = nil, require_id_verification = nil, hide_application_progress_tracker = nil)
        @tags = tags
        @applicant_details = applicant_details
        @allowed_application_types = allowed_application_types
        @lang = lang
        @settings_override = settings_override
        @require_id_verification = require_id_verification
        @hide_application_progress_tracker = hide_application_progress_tracker
      end

      def to_json_api
        payload = {
          data: {
            type: "applicationForm",
            attributes: {
              tags: tags,
              applicantDetails: applicant_details&.represent,
              allowedApplicationTypes: allowed_application_types,
              lang: lang,
              settingsOverride: settings_override&.represent,
              requireIdVerfication: require_id_verification&.represent,
              hideApplicationProgressTracker: hide_application_progress_tracker
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
