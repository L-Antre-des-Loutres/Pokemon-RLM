module UI
    # Module containing all the bag related UI
    
    module Bag

        # Utility showing the pocket list
        class PocketList < SpriteStack

            # Base coordinate of the active items
            ACTIVE_BASE_COORDINATES = [0, 192]

            # Base coordinate of the inactive items
            INACTIVE_BASE_COORDINATES = [0, 198]

            # Name of the active image
            ACTIVE_IMAGE = 'bag/pockets_active'

            # Name of the inactive image
            INACTIVE_IMAGE = 'bag/pockets_inactive'


        end

        # UI element showing the name of the Pocket in the bag
        class WinPocket < SpriteStack

            # Name of the background file
            BACKGROUND = 'bag/win_pocket'

            # Coordinate of the spritestack
            COORDINATES = 15, 4

        end

        # Scrollbar UI element for the bag
        class ScrollBar < SpriteStack

            # Number of pixel the scrollbar use to move the button
            HEIGHT = 160

            # Base Y for the scrollbar
            BASE_Y = 36

            # BASE X for the scrollbar
            BASE_X = 309

            # Background of the scrollbar
            BACKGROUND = 'bag/scroll'

            # Image of the button
            BUTTON = 'bag/button_scroll'

        end

        # Class that show the bag sprite in the Bag UI
        class BagSprite < SpriteSheet

            # Array translating real pocket id to sprite piece
            POCKET_TRANSLATION = [0, 0, 1, 3, 5, 4, 2, 6, 7]
            # Coordinates of the bag
            COORDINATES = [71, 103]
        
        end

        # List of button showing the item name
        class ButtonList < Array

            # Number of button in the list
            AMOUNT = 9

            # Offset between each button
            BUTTON_OFFSET = 25

            # Offset between active button & inative button
            ACTIVE_OFFSET = -8

            # Base X coordinate
            BASE_X = 191

            # Base Y coordinate
            BASE_Y = 18

        end

        # Button showing the item name
        class ItemButton < SpriteStack

            # Name of the button background
            BACKGROUND = 'bag/button_list'
        
        end

        # Arrow telling which item is selected
        class Arrow < Sprite

            def image_name
                'bag/arrow'
            end

        end

        # Class that shows the minimal item info
        class InfoCompact < SpriteStack

            # Coordinate of the UI
            COORDINATES = 9, 145

        end

        # Class that shows the full item info (descr)
        class InfoWide < SpriteStack

            # Coordinate of the UI
            COORDINATES = 0, 33

        end

        # Class that shows a search bar
        class SearchBar < SpriteStack

            # Coordinate of the search bar
            COORDINATES = 3, 220
        end
        
            # Animation of the tcard banner
            def update
                super
                @icon_bar_animation&.update
            end
        
            def update_icon_bar_animation
                @icon_bar_animation&.update
            end
        
            def create_icon_bar
                icon_bar_layer = -10
                icon_bar_y = 0
                icon_bar_x = 0
        
                @icon_bar = Sprite.new(@viewport)
                @icon_bar.load('bag/icon_bar_bag', :interface)
                @icon_bar.set_position(icon_bar_x, icon_bar_y)
                @icon_bar.set_z(icon_bar_layer)
                
                ya = Yuki::Animation
                duration = 10.5
        
                @icon_bar_animation = ya.timed_loop_animation(duration)
                @icon_bar_animation.play_before(ya.shift(duration, @icon_bar, 161, icon_bar_y, 0, icon_bar_y))
                @icon_bar_animation.start
            end

            def create_graphics
                create_viewport
                create_base_ui
                create_pocket_ui
                create_scroll_bar
                create_bag_sprite
                create_item_list
                create_arrow
                create_info
                create_shadow
                create_search
                create_frame
                create_icon_bar
                Graphics.sort_z
            end
    end
    module GamePlay
        class Bag
        end
    end
end