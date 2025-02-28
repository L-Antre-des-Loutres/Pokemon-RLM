module UI
  class TeamButton
    def initial_coordinates
      columns = 3 # Nombre de Pokémon par ligne
      rows = 2    # Nombre de lignes max
      spacing_x = 180  # Espacement horizontal entre les boutons
      spacing_y = 120   # Espacement vertical entre les boutons
      start_x = (640 - (columns * spacing_x)) / 2 # Centre la grille horizontalement
      start_y = (470 - (rows * spacing_y)) / 2    # Centre la grille verticalement
  
      col = @index % columns
      row = @index / columns
  
      x = start_x + col * spacing_x
      y = start_y + row * spacing_y
  
      return x, y
    end
  end

  class TeamButton < SpriteStack
    def create_sprites
      @background = add_sprite(15, 7, background_name)
      @background.src_rect.height = TextureBackgroundHeight

      @icon = add_sprite(80, 18, NO_INITIAL_IMAGE, type: PokemonFaceSprite)
      add_text(50, 17, 79, 16, :given_name, type: SymText, color: 9)
      add_sprite(132, 20, NO_INITIAL_IMAGE, type: GenderSprite)
      add_sprite(123, 31, 'team/Item', type: HoldSprite)
      add_text(38, 38, 61, 16, :level_pokemon_number, type: SymText, color: 9)
      add_sprite(119, 46, NO_INITIAL_IMAGE, type: StatusSprite)

      @hp = add_custom_sprite(create_hp_bar)
      with_font(20) do
        add_text(62, 34 + 5, 56, 13, :hp_text, 1, type: SymText, color: 9)
      end
      @item_sprite = add_sprite(24, 39, 'team/But_Object', 1, 2, type: SpriteSheet)
      @item_text = add_text(27, 40, 113, 16, :item_name, type: SymText)
      hide_item_name
    end
  end
end

module GamePlay
  # Show the black frame for the currently selected Pokemon
  def show_black_frame
    @black_frame.set_bitmap("team/new_dark#{@index + 1}", :interface)
    @black_frame.visible = true
    @black_frame.src_rect.height = FRAME_HEIGHT if FRAME_HEIGHT
    1.upto(8) do |i|
      @black_frame.opacity = i * 255 / 8
      update_during_process
      Graphics.update
    end
  end
end