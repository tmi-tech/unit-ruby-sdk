# frozen_string_literal: true

# Type representing require id verification
# @see https://docs.unit.co/types/#require-id-verification
module Unit
  module Types
    class RequireIdVerification
      attr_reader :individual, :officer, :beneficial_owners

      # @param optional individual [Boolean] Decide whether to require an ID verification from an individual
      # @param optional officer [Boolean] Decide whether to require an ID verification from an officer
      # @param optional benifical_owners [Boolean] Decide whether to require an ID verification from all beneficial owners
      def initialize(individual = nil, officer = nil, beneficial_owners = nil)
        @individual = individual
        @officer = officer
        @beneficial_owners = beneficial_owners
      end

      def represent
        payload = {
          individual: @individual,
          officer : @officer,
          beneficial_owners: @beneficial_owners
        }
        payload.compact
      end
    end
  end
end
