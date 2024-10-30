module Battle
  module Effects
    class Ability < EffectBase
      # "Unpredictable" gives the user random stats and a random ability
      class Unpredictable < Ability
        # Function called when a Pokemon has actually switched with another one
        # @param handler [Battle::Logic::SwitchHandler]
        # @param who [PFM::PokemonBattler] Pokemon that is switched out
        # @param with [PFM::PokemonBattler] Pokemon that is switched in
        def on_switch_event(handler, who, with) # Must give random stats and random ability
          return if with != @target
          foes = handler.logic.foes_of(with).select do |foe|
            next(foe.alive? && foe.ability_db_symbol != :__undef__ && handler.logic.ability_change_handler.can_change_ability?(with, foe.ability_db_symbol))
          end
          return if foes.none?

          # Change the ability of the target with a random ability
          random_ability_id = handler.logic.generic_rng.rand(0..231)
          handler.scene.visual.show_ability(with)
          handler.logic.ability_change_handler.change_ability(with, random_ability_id)
          handler.scene.display_message_and_wait(parse_text_with_pokemon(19, 1253, target, PFM::Text::ABILITY[1] => with.ability_name))
          with.ability_effect.on_switch_event(handler, who, with) if with.ability_effect.class != Unpredictable

          # Change the stats of the target with random stats
          handler.scene.display_message_and_wait(parse_text_with_pokemon(19, 1254, with))
          random_atk = handler.logic.generic_rng.rand(-6..6)
          random_dfe = handler.logic.generic_rng.rand(-6..6)
          random_spd = handler.logic.generic_rng.rand(-6..6)
          random_ats = handler.logic.generic_rng.rand(-6..6)
          random_dfs = handler.logic.generic_rng.rand(-6..6)
          handler.logic.stat_change_handler.stat_change_with_process(:atk, random_atk, with)
          handler.logic.stat_change_handler.stat_change_with_process(:dfe, random_dfe, with)
          handler.logic.stat_change_handler.stat_change_with_process(:spd, random_spd, with)
          handler.logic.stat_change_handler.stat_change_with_process(:ats, random_ats, with)
          handler.logic.stat_change_handler.stat_change_with_process(:dfs, random_dfs, with)
        end
      end  # Closing Unpredictable class
      register(:unpredictable, Unpredictable)
    end  # Closing Ability class
  end  # Closing Effects module
end  # Closing Battle module
