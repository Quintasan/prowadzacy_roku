# frozen_string_literal: true

json.array! @contestants, partial: 'contestants/contestant', as: :contestant
