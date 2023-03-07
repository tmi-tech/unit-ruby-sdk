# frozen_string_literal: true

# Type representing application form prefill
# @see https://docs.unit.co/types/#applicationformprefill
module Unit
  module Types
    class ApplicationFormSettingsOverride
      attr_reader :redirect_url, :privacy_policy_url, :electronic_disclosures_url,
                  :deposit_terms_url, :client_terms_url, :cardholder_terms_url,
                  :cash_advanced_terms_url, :debit_card_disclosure_url,
                  :additional_disclosures
                  
      # @param optional redirect_url [String] URL that is presented to the user when an application has been submitted
      # @param optional privacy_policy_url [String] Privacy Policy
      # @param optional electronic_disclosures_url [String]  Consent to Electronic Disclosures
      # @param optional deposit_terms_url [String] Deposit Terms & Conditions
      # @param optional client_terms_url [String] Client Terms of Service
      # @param optional cardholder_terms_url [String] Cardholder Terms and Conditions
      # @param optional cash_advanced_terms_url [String] Cash Advance Terms and Conditions
      # @param optional debit_card_disclosure_url [String] Debit Card Disclosure
      # @param optional additional_disclosures [Array] Array of additional disclosures (title, url hashes) that were not covered by the above links
      def initialize(redirect_url = nil, privacy_policy_url = nil, electronic_disclosures_url = nil,
                     deposit_terms_url = nil, client_terms_url = nil, cardholder_terms_url = nil,
                     cash_advanced_terms_url = nil, debit_card_disclosure_url = nil, additional_disclosures = nil)
        @redirect_url = redirect_url
        @privacy_policy_url = privacy_policy_url
        @electronic_disclosures_url = electronic_disclosures_url
        @deposit_terms_url = deposit_terms_url
        @client_terms_url = client_terms_url
        @cardholder_terms_url = cardholder_terms_url
        @cash_advanced_terms_url = cash_advanced_terms_url
        @debit_card_disclosure_url = debit_card_disclosure_url
        @additional_disclosures = additional_disclosures
      end

      def represent
        payload = {
          redirectUrl: redirect_url,
          privacyPolicyUrl: privacy_policy_url,
          electronicDisclosuresUrl: electronic_disclosures_url,
          depositTermsUrl: deposit_terms_url,
          clientTermsUrl: client_terms_url,
          cardholderTermsUrl: cardholder_terms_url,
          cashAdvancedTermsUrl: cash_advanced_terms_url,
          debitCardDisclosureUrl: debit_card_disclosure_url,
          additionalDisclosures: additional_disclosures,
        }
        payload.compact
      end
    end
  end
end
