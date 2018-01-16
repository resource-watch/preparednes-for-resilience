# frozen_string_literal: true

require 'paperclip/media_type_spoof_detector'
module Paperclip
  # Overwriting the spoof detector
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
