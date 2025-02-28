module GamePlay
    # Scene displaying the trainer card
    class TCard < BaseCleanUpdate::FrameBalanced
    # Coordinates of the player sprite
    PLAYER_COORDINATES = [-3, 94]
    # Surface given to the player sprite
    PLAYER_SURFACE = [80, 73]
    # Coordinate of the first badge
    BADGE_ORIGIN_COORDINATE = [14, 30]
    # Offset between badges (x/y)
    BADGE_OFFSET = [48, 49]
    # Size of a badge in the badge image
    BADGE_SIZE = [32, 32]
    # Nmber of badge we can show in this UI


    # Modify the background of the trainer card
    def create_sub_background
        @sub_background = Sprite.new(@viewport).set_bitmap('tcard/newBackground', :interface)
    end

       # Create the trainer sprite
    def create_trainer_sprite
        gender = $game_switches[1] ? '_f' : '_m'
        gp = $game_player
        filename = "tcard/#{gp.charset_base}#{gender}" if RPG::Cache.interface_exist?("tcard/#{gp.charset_base}#{gender}")
        filename ||= "tcard/#{$game_player.charset_base}"
        @trainer_sprite = Sprite.new(@viewport).set_bitmap(filename, :interface)
        @trainer_sprite.set_origin((@trainer_sprite.width - PLAYER_SURFACE.first) / 2, (@trainer_sprite.height - PLAYER_SURFACE.last) / 2)
        @trainer_sprite.set_position(*PLAYER_COORDINATES)
        @trainer_sprite.zoom_x = 1.75  # Augmenter de 50%
        @trainer_sprite.zoom_y = 1.75  # Augmenter de 50%
      end
      
      # Placement of the text

      # Start of the adventure
      def create_start_time
        @texts.add_text(125, 89, 201, 20, "#{text_get(34, 14)} #{Time.at($trainer.start_time).strftime('%d/%m/%Y')}", color: 0)
      end

      # Money of the player
      def create_money
        @texts.add_text(119, 151, 145, 20, "#{PFM.game_state.money}$", 1, color: 0)
      end

      # Name of the player
      def create_name
        @texts.add_text(20, 255, 90, 20, $trainer.name, 1, color: 0)
      end

      # Do of the player
      def create_do
        # Delte text for the DO of the player
      end

      # Badges of the player
      def create_badge
        # Delete text for the number of badges
      end

      # Play time of the player
      def create_play_time
        @texts.add_text(125, 112, 123, 20, "#{text_get(25, 5)} #{current_play_time}", color: 0)
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
        @icon_bar.load('tcard/icon_bar_tcard', :interface)
        @icon_bar.set_position(icon_bar_x, icon_bar_y)
        @icon_bar.set_z(icon_bar_layer)
        
        ya = Yuki::Animation
        duration = 10.5
  
        @icon_bar_animation = ya.timed_loop_animation(duration)
        @icon_bar_animation.play_before(ya.shift(duration, @icon_bar, 161, icon_bar_y, 0, icon_bar_y))
        @icon_bar_animation.start
      end
      
      def create_frame
        @frame = Sprite.new(@viewport)
        @frame.load('load/new_frame_save', :interface)
      end

      # Create the UI Graphics
      def create_graphics
        create_viewport
        create_base_ui
        create_sub_background
        create_trainer_sprite
        create_badge_sprites
        create_texts
        create_frame
        create_icon_bar
      end
    
    end
end
