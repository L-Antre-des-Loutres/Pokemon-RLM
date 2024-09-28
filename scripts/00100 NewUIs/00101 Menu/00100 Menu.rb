module GamePlay
  class Menu < BaseCleanUpdate
    ENTERING_ANIMATION_OFFSET = 300
  end
end


module UI
  # Button that is shown in the main menu
  class PSDKMenuButtonBase < SpriteStack
    # Basic coordinate of the button on screen
    BASIC_COORDINATE = [492, 16]
  end
end