# Create an arrow schema for 17lands data

Not all sets are available. To see the available files, visit
<https://www.17lands.com/public_datasets>.

## Usage

``` r
mr_make_17lands_schema(
  set,
  data_type,
  event_type,
  use_cache = TRUE,
  overwrite = FALSE,
  cache_dir = mr_cache_dir(),
  quiet = FALSE
)
```

## Arguments

- set:

  Three-letter set code. Not case-sensitive. For a complete list of set
  names and codes, run [`mr_get_sets()`](mr_get_sets.md) (not all sets
  are available on 17lands).

- data_type:

  Type of data. Must be one of "game", "draft", or "replay".

- event_type:

  Type of event. Must be one of "premier", "traditional", "sealed", or
  "quick". Not all formats are available for all event types (in
  particular, Quick Draft is only available for one set at the time of
  writing).

- use_cache:

  Logical; should the cache be used?

- overwrite:

  Logical: should any existing file be overwritten?

- cache_dir:

  Path to the folder used for caching data.

- quiet:

  Logical: should messages emitted by this function be silenced?

## Value

Character vector

## Details

Currently only works for 'replay' data.

## Examples

``` r
mr_make_17lands_schema("KTK", "replay", "premier")
#> ℹ Starting download
#> ✔ Data downloaded to /home/runner/.local/share/R/mtgr/replay_data_public.KTK.PremierDraft.csv.gz
#> Schema
#> expansion: string
#> event_type: string
#> draft_id: string
#> draft_time: string
#> build_index: int8
#> match_number: int8
#> game_number: int8
#> game_time: string
#> rank: string
#> opp_rank: string
#> main_colors: string
#> splash_colors: string
#> on_play: bool
#> num_mulligans: int8
#> opp_num_mulligans: int8
#> opp_colors: string
#> num_turns: int8
#> won: string
#> candidate_hand_1: string
#> candidate_hand_2: string
#> candidate_hand_3: string
#> candidate_hand_4: string
#> candidate_hand_5: string
#> candidate_hand_6: string
#> candidate_hand_7: string
#> opening_hand: string
#> user_turn_1_cards_drawn: string
#> user_turn_1_cards_tutored: string
#> user_turn_1_cards_discarded: string
#> user_turn_1_lands_played: string
#> user_turn_1_creatures_cast: string
#> user_turn_1_non_creatures_cast: string
#> user_turn_1_user_instants_sorceries_cast: string
#> user_turn_1_oppo_instants_sorceries_cast: string
#> user_turn_1_user_abilities: string
#> user_turn_1_oppo_abilities: string
#> user_turn_1_creatures_attacked: string
#> user_turn_1_creatures_blocked: string
#> user_turn_1_creatures_unblocked: string
#> user_turn_1_creatures_blocking: string
#> user_turn_1_oppo_combat_damage_taken: string
#> user_turn_1_user_combat_damage_taken: string
#> user_turn_1_user_creatures_killed_combat: string
#> user_turn_1_oppo_creatures_killed_combat: string
#> user_turn_1_user_creatures_killed_non_combat: string
#> user_turn_1_oppo_creatures_killed_non_combat: string
#> user_turn_1_user_mana_spent: float
#> user_turn_1_oppo_mana_spent: float
#> user_turn_1_eot_user_cards_in_hand: string
#> user_turn_1_eot_oppo_cards_in_hand: float
#> user_turn_1_eot_user_lands_in_play: string
#> user_turn_1_eot_oppo_lands_in_play: string
#> user_turn_1_eot_user_creatures_in_play: string
#> user_turn_1_eot_oppo_creatures_in_play: string
#> user_turn_1_eot_user_non_creatures_in_play: string
#> user_turn_1_eot_oppo_non_creatures_in_play: string
#> user_turn_1_eot_user_life: float
#> user_turn_1_eot_oppo_life: float
#> oppo_turn_1_cards_drawn: int8
#> oppo_turn_1_cards_tutored: int8
#> oppo_turn_1_cards_discarded: string
#> oppo_turn_1_lands_played: string
#> oppo_turn_1_creatures_cast: string
#> oppo_turn_1_non_creatures_cast: string
#> oppo_turn_1_user_instants_sorceries_cast: string
#> oppo_turn_1_oppo_instants_sorceries_cast: string
#> oppo_turn_1_user_abilities: string
#> oppo_turn_1_oppo_abilities: string
#> oppo_turn_1_creatures_attacked: string
#> oppo_turn_1_creatures_blocked: string
#> oppo_turn_1_creatures_unblocked: string
#> oppo_turn_1_creatures_blocking: string
#> oppo_turn_1_oppo_combat_damage_taken: string
#> oppo_turn_1_user_combat_damage_taken: string
#> oppo_turn_1_user_creatures_killed_combat: string
#> oppo_turn_1_oppo_creatures_killed_combat: string
#> oppo_turn_1_user_creatures_killed_non_combat: string
#> oppo_turn_1_oppo_creatures_killed_non_combat: string
#> oppo_turn_1_user_mana_spent: float
#> oppo_turn_1_oppo_mana_spent: float
#> oppo_turn_1_eot_user_cards_in_hand: string
#> oppo_turn_1_eot_oppo_cards_in_hand: float
#> oppo_turn_1_eot_user_lands_in_play: string
#> oppo_turn_1_eot_oppo_lands_in_play: string
#> oppo_turn_1_eot_user_creatures_in_play: string
#> oppo_turn_1_eot_oppo_creatures_in_play: string
#> oppo_turn_1_eot_user_non_creatures_in_play: string
#> oppo_turn_1_eot_oppo_non_creatures_in_play: string
#> oppo_turn_1_eot_user_life: float
#> oppo_turn_1_eot_oppo_life: float
#> user_turn_2_cards_drawn: string
#> user_turn_2_cards_tutored: string
#> user_turn_2_cards_discarded: string
#> user_turn_2_lands_played: string
#> user_turn_2_creatures_cast: string
#> user_turn_2_non_creatures_cast: string
#> user_turn_2_user_instants_sorceries_cast: string
#> user_turn_2_oppo_instants_sorceries_cast: string
#> user_turn_2_user_abilities: string
#> user_turn_2_oppo_abilities: string
#> user_turn_2_creatures_attacked: string
#> user_turn_2_creatures_blocked: string
#> user_turn_2_creatures_unblocked: string
#> user_turn_2_creatures_blocking: string
#> user_turn_2_oppo_combat_damage_taken: string
#> user_turn_2_user_combat_damage_taken: string
#> user_turn_2_user_creatures_killed_combat: string
#> user_turn_2_oppo_creatures_killed_combat: string
#> user_turn_2_user_creatures_killed_non_combat: string
#> user_turn_2_oppo_creatures_killed_non_combat: string
#> user_turn_2_user_mana_spent: float
#> user_turn_2_oppo_mana_spent: float
#> user_turn_2_eot_user_cards_in_hand: string
#> user_turn_2_eot_oppo_cards_in_hand: float
#> user_turn_2_eot_user_lands_in_play: string
#> user_turn_2_eot_oppo_lands_in_play: string
#> user_turn_2_eot_user_creatures_in_play: string
#> user_turn_2_eot_oppo_creatures_in_play: string
#> user_turn_2_eot_user_non_creatures_in_play: string
#> user_turn_2_eot_oppo_non_creatures_in_play: string
#> user_turn_2_eot_user_life: float
#> user_turn_2_eot_oppo_life: float
#> oppo_turn_2_cards_drawn: int8
#> oppo_turn_2_cards_tutored: int8
#> oppo_turn_2_cards_discarded: string
#> oppo_turn_2_lands_played: string
#> oppo_turn_2_creatures_cast: string
#> oppo_turn_2_non_creatures_cast: string
#> oppo_turn_2_user_instants_sorceries_cast: string
#> oppo_turn_2_oppo_instants_sorceries_cast: string
#> oppo_turn_2_user_abilities: string
#> oppo_turn_2_oppo_abilities: string
#> oppo_turn_2_creatures_attacked: string
#> oppo_turn_2_creatures_blocked: string
#> oppo_turn_2_creatures_unblocked: string
#> oppo_turn_2_creatures_blocking: string
#> oppo_turn_2_oppo_combat_damage_taken: string
#> oppo_turn_2_user_combat_damage_taken: string
#> oppo_turn_2_user_creatures_killed_combat: string
#> oppo_turn_2_oppo_creatures_killed_combat: string
#> oppo_turn_2_user_creatures_killed_non_combat: string
#> oppo_turn_2_oppo_creatures_killed_non_combat: string
#> oppo_turn_2_user_mana_spent: float
#> oppo_turn_2_oppo_mana_spent: float
#> oppo_turn_2_eot_user_cards_in_hand: string
#> oppo_turn_2_eot_oppo_cards_in_hand: float
#> oppo_turn_2_eot_user_lands_in_play: string
#> oppo_turn_2_eot_oppo_lands_in_play: string
#> oppo_turn_2_eot_user_creatures_in_play: string
#> oppo_turn_2_eot_oppo_creatures_in_play: string
#> oppo_turn_2_eot_user_non_creatures_in_play: string
#> oppo_turn_2_eot_oppo_non_creatures_in_play: string
#> oppo_turn_2_eot_user_life: float
#> oppo_turn_2_eot_oppo_life: float
#> user_turn_3_cards_drawn: string
#> user_turn_3_cards_tutored: string
#> user_turn_3_cards_discarded: string
#> user_turn_3_lands_played: string
#> user_turn_3_creatures_cast: string
#> user_turn_3_non_creatures_cast: string
#> user_turn_3_user_instants_sorceries_cast: string
#> user_turn_3_oppo_instants_sorceries_cast: string
#> user_turn_3_user_abilities: string
#> user_turn_3_oppo_abilities: string
#> user_turn_3_creatures_attacked: string
#> user_turn_3_creatures_blocked: string
#> user_turn_3_creatures_unblocked: string
#> user_turn_3_creatures_blocking: string
#> user_turn_3_oppo_combat_damage_taken: string
#> user_turn_3_user_combat_damage_taken: string
#> user_turn_3_user_creatures_killed_combat: string
#> user_turn_3_oppo_creatures_killed_combat: string
#> user_turn_3_user_creatures_killed_non_combat: string
#> user_turn_3_oppo_creatures_killed_non_combat: string
#> user_turn_3_user_mana_spent: float
#> user_turn_3_oppo_mana_spent: float
#> user_turn_3_eot_user_cards_in_hand: string
#> user_turn_3_eot_oppo_cards_in_hand: float
#> user_turn_3_eot_user_lands_in_play: string
#> user_turn_3_eot_oppo_lands_in_play: string
#> user_turn_3_eot_user_creatures_in_play: string
#> user_turn_3_eot_oppo_creatures_in_play: string
#> user_turn_3_eot_user_non_creatures_in_play: string
#> user_turn_3_eot_oppo_non_creatures_in_play: string
#> user_turn_3_eot_user_life: float
#> user_turn_3_eot_oppo_life: float
#> oppo_turn_3_cards_drawn: int8
#> oppo_turn_3_cards_tutored: int8
#> oppo_turn_3_cards_discarded: string
#> oppo_turn_3_lands_played: string
#> oppo_turn_3_creatures_cast: string
#> oppo_turn_3_non_creatures_cast: string
#> oppo_turn_3_user_instants_sorceries_cast: string
#> oppo_turn_3_oppo_instants_sorceries_cast: string
#> oppo_turn_3_user_abilities: string
#> oppo_turn_3_oppo_abilities: string
#> oppo_turn_3_creatures_attacked: string
#> oppo_turn_3_creatures_blocked: string
#> oppo_turn_3_creatures_unblocked: string
#> oppo_turn_3_creatures_blocking: string
#> oppo_turn_3_oppo_combat_damage_taken: string
#> oppo_turn_3_user_combat_damage_taken: string
#> oppo_turn_3_user_creatures_killed_combat: string
#> oppo_turn_3_oppo_creatures_killed_combat: string
#> oppo_turn_3_user_creatures_killed_non_combat: string
#> oppo_turn_3_oppo_creatures_killed_non_combat: string
#> oppo_turn_3_user_mana_spent: float
#> oppo_turn_3_oppo_mana_spent: float
#> oppo_turn_3_eot_user_cards_in_hand: string
#> oppo_turn_3_eot_oppo_cards_in_hand: float
#> oppo_turn_3_eot_user_lands_in_play: string
#> oppo_turn_3_eot_oppo_lands_in_play: string
#> oppo_turn_3_eot_user_creatures_in_play: string
#> oppo_turn_3_eot_oppo_creatures_in_play: string
#> oppo_turn_3_eot_user_non_creatures_in_play: string
#> oppo_turn_3_eot_oppo_non_creatures_in_play: string
#> oppo_turn_3_eot_user_life: float
#> oppo_turn_3_eot_oppo_life: float
#> user_turn_4_cards_drawn: string
#> user_turn_4_cards_tutored: string
#> user_turn_4_cards_discarded: string
#> user_turn_4_lands_played: string
#> user_turn_4_creatures_cast: string
#> user_turn_4_non_creatures_cast: string
#> user_turn_4_user_instants_sorceries_cast: string
#> user_turn_4_oppo_instants_sorceries_cast: string
#> user_turn_4_user_abilities: string
#> user_turn_4_oppo_abilities: string
#> user_turn_4_creatures_attacked: string
#> user_turn_4_creatures_blocked: string
#> user_turn_4_creatures_unblocked: string
#> user_turn_4_creatures_blocking: string
#> user_turn_4_oppo_combat_damage_taken: string
#> user_turn_4_user_combat_damage_taken: string
#> user_turn_4_user_creatures_killed_combat: string
#> user_turn_4_oppo_creatures_killed_combat: string
#> user_turn_4_user_creatures_killed_non_combat: string
#> user_turn_4_oppo_creatures_killed_non_combat: string
#> user_turn_4_user_mana_spent: float
#> user_turn_4_oppo_mana_spent: float
#> user_turn_4_eot_user_cards_in_hand: string
#> user_turn_4_eot_oppo_cards_in_hand: float
#> user_turn_4_eot_user_lands_in_play: string
#> user_turn_4_eot_oppo_lands_in_play: string
#> user_turn_4_eot_user_creatures_in_play: string
#> user_turn_4_eot_oppo_creatures_in_play: string
#> user_turn_4_eot_user_non_creatures_in_play: string
#> user_turn_4_eot_oppo_non_creatures_in_play: string
#> user_turn_4_eot_user_life: float
#> user_turn_4_eot_oppo_life: float
#> oppo_turn_4_cards_drawn: int8
#> oppo_turn_4_cards_tutored: int8
#> oppo_turn_4_cards_discarded: string
#> oppo_turn_4_lands_played: string
#> oppo_turn_4_creatures_cast: string
#> oppo_turn_4_non_creatures_cast: string
#> oppo_turn_4_user_instants_sorceries_cast: string
#> oppo_turn_4_oppo_instants_sorceries_cast: string
#> oppo_turn_4_user_abilities: string
#> oppo_turn_4_oppo_abilities: string
#> oppo_turn_4_creatures_attacked: string
#> oppo_turn_4_creatures_blocked: string
#> oppo_turn_4_creatures_unblocked: string
#> oppo_turn_4_creatures_blocking: string
#> oppo_turn_4_oppo_combat_damage_taken: string
#> oppo_turn_4_user_combat_damage_taken: string
#> oppo_turn_4_user_creatures_killed_combat: string
#> oppo_turn_4_oppo_creatures_killed_combat: string
#> oppo_turn_4_user_creatures_killed_non_combat: string
#> oppo_turn_4_oppo_creatures_killed_non_combat: string
#> oppo_turn_4_user_mana_spent: float
#> oppo_turn_4_oppo_mana_spent: float
#> oppo_turn_4_eot_user_cards_in_hand: string
#> oppo_turn_4_eot_oppo_cards_in_hand: float
#> oppo_turn_4_eot_user_lands_in_play: string
#> oppo_turn_4_eot_oppo_lands_in_play: string
#> oppo_turn_4_eot_user_creatures_in_play: string
#> oppo_turn_4_eot_oppo_creatures_in_play: string
#> oppo_turn_4_eot_user_non_creatures_in_play: string
#> oppo_turn_4_eot_oppo_non_creatures_in_play: string
#> oppo_turn_4_eot_user_life: float
#> oppo_turn_4_eot_oppo_life: float
#> user_turn_5_cards_drawn: string
#> user_turn_5_cards_tutored: string
#> user_turn_5_cards_discarded: string
#> user_turn_5_lands_played: string
#> user_turn_5_creatures_cast: string
#> user_turn_5_non_creatures_cast: string
#> user_turn_5_user_instants_sorceries_cast: string
#> user_turn_5_oppo_instants_sorceries_cast: string
#> user_turn_5_user_abilities: string
#> user_turn_5_oppo_abilities: string
#> user_turn_5_creatures_attacked: string
#> user_turn_5_creatures_blocked: string
#> user_turn_5_creatures_unblocked: string
#> user_turn_5_creatures_blocking: string
#> user_turn_5_oppo_combat_damage_taken: string
#> user_turn_5_user_combat_damage_taken: string
#> user_turn_5_user_creatures_killed_combat: string
#> user_turn_5_oppo_creatures_killed_combat: string
#> user_turn_5_user_creatures_killed_non_combat: string
#> user_turn_5_oppo_creatures_killed_non_combat: string
#> user_turn_5_user_mana_spent: float
#> user_turn_5_oppo_mana_spent: float
#> user_turn_5_eot_user_cards_in_hand: string
#> user_turn_5_eot_oppo_cards_in_hand: float
#> user_turn_5_eot_user_lands_in_play: string
#> user_turn_5_eot_oppo_lands_in_play: string
#> user_turn_5_eot_user_creatures_in_play: string
#> user_turn_5_eot_oppo_creatures_in_play: string
#> user_turn_5_eot_user_non_creatures_in_play: string
#> user_turn_5_eot_oppo_non_creatures_in_play: string
#> user_turn_5_eot_user_life: float
#> user_turn_5_eot_oppo_life: float
#> oppo_turn_5_cards_drawn: int8
#> oppo_turn_5_cards_tutored: int8
#> oppo_turn_5_cards_discarded: string
#> oppo_turn_5_lands_played: string
#> oppo_turn_5_creatures_cast: string
#> oppo_turn_5_non_creatures_cast: string
#> oppo_turn_5_user_instants_sorceries_cast: string
#> oppo_turn_5_oppo_instants_sorceries_cast: string
#> oppo_turn_5_user_abilities: string
#> oppo_turn_5_oppo_abilities: string
#> oppo_turn_5_creatures_attacked: string
#> oppo_turn_5_creatures_blocked: string
#> oppo_turn_5_creatures_unblocked: string
#> oppo_turn_5_creatures_blocking: string
#> oppo_turn_5_oppo_combat_damage_taken: string
#> oppo_turn_5_user_combat_damage_taken: string
#> oppo_turn_5_user_creatures_killed_combat: string
#> oppo_turn_5_oppo_creatures_killed_combat: string
#> oppo_turn_5_user_creatures_killed_non_combat: string
#> oppo_turn_5_oppo_creatures_killed_non_combat: string
#> oppo_turn_5_user_mana_spent: float
#> oppo_turn_5_oppo_mana_spent: float
#> oppo_turn_5_eot_user_cards_in_hand: string
#> oppo_turn_5_eot_oppo_cards_in_hand: float
#> oppo_turn_5_eot_user_lands_in_play: string
#> oppo_turn_5_eot_oppo_lands_in_play: string
#> oppo_turn_5_eot_user_creatures_in_play: string
#> oppo_turn_5_eot_oppo_creatures_in_play: string
#> oppo_turn_5_eot_user_non_creatures_in_play: string
#> oppo_turn_5_eot_oppo_non_creatures_in_play: string
#> oppo_turn_5_eot_user_life: float
#> oppo_turn_5_eot_oppo_life: float
#> user_turn_6_cards_drawn: string
#> user_turn_6_cards_tutored: string
#> user_turn_6_cards_discarded: string
#> user_turn_6_lands_played: string
#> user_turn_6_creatures_cast: string
#> user_turn_6_non_creatures_cast: string
#> user_turn_6_user_instants_sorceries_cast: string
#> user_turn_6_oppo_instants_sorceries_cast: string
#> user_turn_6_user_abilities: string
#> user_turn_6_oppo_abilities: string
#> user_turn_6_creatures_attacked: string
#> user_turn_6_creatures_blocked: string
#> user_turn_6_creatures_unblocked: string
#> user_turn_6_creatures_blocking: string
#> user_turn_6_oppo_combat_damage_taken: string
#> user_turn_6_user_combat_damage_taken: string
#> user_turn_6_user_creatures_killed_combat: string
#> user_turn_6_oppo_creatures_killed_combat: string
#> user_turn_6_user_creatures_killed_non_combat: string
#> user_turn_6_oppo_creatures_killed_non_combat: string
#> user_turn_6_user_mana_spent: float
#> user_turn_6_oppo_mana_spent: float
#> user_turn_6_eot_user_cards_in_hand: string
#> user_turn_6_eot_oppo_cards_in_hand: float
#> user_turn_6_eot_user_lands_in_play: string
#> user_turn_6_eot_oppo_lands_in_play: string
#> user_turn_6_eot_user_creatures_in_play: string
#> user_turn_6_eot_oppo_creatures_in_play: string
#> user_turn_6_eot_user_non_creatures_in_play: string
#> user_turn_6_eot_oppo_non_creatures_in_play: string
#> user_turn_6_eot_user_life: float
#> user_turn_6_eot_oppo_life: float
#> oppo_turn_6_cards_drawn: int8
#> oppo_turn_6_cards_tutored: int8
#> oppo_turn_6_cards_discarded: string
#> oppo_turn_6_lands_played: string
#> oppo_turn_6_creatures_cast: string
#> oppo_turn_6_non_creatures_cast: string
#> oppo_turn_6_user_instants_sorceries_cast: string
#> oppo_turn_6_oppo_instants_sorceries_cast: string
#> oppo_turn_6_user_abilities: string
#> oppo_turn_6_oppo_abilities: string
#> oppo_turn_6_creatures_attacked: string
#> oppo_turn_6_creatures_blocked: string
#> oppo_turn_6_creatures_unblocked: string
#> oppo_turn_6_creatures_blocking: string
#> oppo_turn_6_oppo_combat_damage_taken: string
#> oppo_turn_6_user_combat_damage_taken: string
#> oppo_turn_6_user_creatures_killed_combat: string
#> oppo_turn_6_oppo_creatures_killed_combat: string
#> oppo_turn_6_user_creatures_killed_non_combat: string
#> oppo_turn_6_oppo_creatures_killed_non_combat: string
#> oppo_turn_6_user_mana_spent: float
#> oppo_turn_6_oppo_mana_spent: float
#> oppo_turn_6_eot_user_cards_in_hand: string
#> oppo_turn_6_eot_oppo_cards_in_hand: float
#> oppo_turn_6_eot_user_lands_in_play: string
#> oppo_turn_6_eot_oppo_lands_in_play: string
#> oppo_turn_6_eot_user_creatures_in_play: string
#> oppo_turn_6_eot_oppo_creatures_in_play: string
#> oppo_turn_6_eot_user_non_creatures_in_play: string
#> oppo_turn_6_eot_oppo_non_creatures_in_play: string
#> oppo_turn_6_eot_user_life: float
#> oppo_turn_6_eot_oppo_life: float
#> user_turn_7_cards_drawn: string
#> user_turn_7_cards_tutored: string
#> user_turn_7_cards_discarded: string
#> user_turn_7_lands_played: string
#> user_turn_7_creatures_cast: string
#> user_turn_7_non_creatures_cast: string
#> user_turn_7_user_instants_sorceries_cast: string
#> user_turn_7_oppo_instants_sorceries_cast: string
#> user_turn_7_user_abilities: string
#> user_turn_7_oppo_abilities: string
#> user_turn_7_creatures_attacked: string
#> user_turn_7_creatures_blocked: string
#> user_turn_7_creatures_unblocked: string
#> user_turn_7_creatures_blocking: string
#> user_turn_7_oppo_combat_damage_taken: string
#> user_turn_7_user_combat_damage_taken: string
#> user_turn_7_user_creatures_killed_combat: string
#> user_turn_7_oppo_creatures_killed_combat: string
#> user_turn_7_user_creatures_killed_non_combat: string
#> user_turn_7_oppo_creatures_killed_non_combat: string
#> user_turn_7_user_mana_spent: float
#> user_turn_7_oppo_mana_spent: float
#> user_turn_7_eot_user_cards_in_hand: string
#> user_turn_7_eot_oppo_cards_in_hand: float
#> user_turn_7_eot_user_lands_in_play: string
#> user_turn_7_eot_oppo_lands_in_play: string
#> user_turn_7_eot_user_creatures_in_play: string
#> user_turn_7_eot_oppo_creatures_in_play: string
#> user_turn_7_eot_user_non_creatures_in_play: string
#> user_turn_7_eot_oppo_non_creatures_in_play: string
#> user_turn_7_eot_user_life: float
#> user_turn_7_eot_oppo_life: float
#> oppo_turn_7_cards_drawn: int8
#> oppo_turn_7_cards_tutored: int8
#> oppo_turn_7_cards_discarded: string
#> oppo_turn_7_lands_played: string
#> oppo_turn_7_creatures_cast: string
#> oppo_turn_7_non_creatures_cast: string
#> oppo_turn_7_user_instants_sorceries_cast: string
#> oppo_turn_7_oppo_instants_sorceries_cast: string
#> oppo_turn_7_user_abilities: string
#> oppo_turn_7_oppo_abilities: string
#> oppo_turn_7_creatures_attacked: string
#> oppo_turn_7_creatures_blocked: string
#> oppo_turn_7_creatures_unblocked: string
#> oppo_turn_7_creatures_blocking: string
#> oppo_turn_7_oppo_combat_damage_taken: string
#> oppo_turn_7_user_combat_damage_taken: string
#> oppo_turn_7_user_creatures_killed_combat: string
#> oppo_turn_7_oppo_creatures_killed_combat: string
#> oppo_turn_7_user_creatures_killed_non_combat: string
#> oppo_turn_7_oppo_creatures_killed_non_combat: string
#> oppo_turn_7_user_mana_spent: float
#> oppo_turn_7_oppo_mana_spent: float
#> oppo_turn_7_eot_user_cards_in_hand: string
#> oppo_turn_7_eot_oppo_cards_in_hand: float
#> oppo_turn_7_eot_user_lands_in_play: string
#> oppo_turn_7_eot_oppo_lands_in_play: string
#> oppo_turn_7_eot_user_creatures_in_play: string
#> oppo_turn_7_eot_oppo_creatures_in_play: string
#> oppo_turn_7_eot_user_non_creatures_in_play: string
#> oppo_turn_7_eot_oppo_non_creatures_in_play: string
#> oppo_turn_7_eot_user_life: float
#> oppo_turn_7_eot_oppo_life: float
#> user_turn_8_cards_drawn: string
#> user_turn_8_cards_tutored: string
#> user_turn_8_cards_discarded: string
#> user_turn_8_lands_played: string
#> user_turn_8_creatures_cast: string
#> user_turn_8_non_creatures_cast: string
#> user_turn_8_user_instants_sorceries_cast: string
#> user_turn_8_oppo_instants_sorceries_cast: string
#> user_turn_8_user_abilities: string
#> user_turn_8_oppo_abilities: string
#> user_turn_8_creatures_attacked: string
#> user_turn_8_creatures_blocked: string
#> user_turn_8_creatures_unblocked: string
#> user_turn_8_creatures_blocking: string
#> user_turn_8_oppo_combat_damage_taken: string
#> user_turn_8_user_combat_damage_taken: string
#> user_turn_8_user_creatures_killed_combat: string
#> user_turn_8_oppo_creatures_killed_combat: string
#> user_turn_8_user_creatures_killed_non_combat: string
#> user_turn_8_oppo_creatures_killed_non_combat: string
#> user_turn_8_user_mana_spent: float
#> user_turn_8_oppo_mana_spent: float
#> user_turn_8_eot_user_cards_in_hand: string
#> user_turn_8_eot_oppo_cards_in_hand: float
#> user_turn_8_eot_user_lands_in_play: string
#> user_turn_8_eot_oppo_lands_in_play: string
#> user_turn_8_eot_user_creatures_in_play: string
#> user_turn_8_eot_oppo_creatures_in_play: string
#> user_turn_8_eot_user_non_creatures_in_play: string
#> user_turn_8_eot_oppo_non_creatures_in_play: string
#> user_turn_8_eot_user_life: float
#> user_turn_8_eot_oppo_life: float
#> oppo_turn_8_cards_drawn: int8
#> oppo_turn_8_cards_tutored: int8
#> oppo_turn_8_cards_discarded: string
#> oppo_turn_8_lands_played: string
#> oppo_turn_8_creatures_cast: string
#> oppo_turn_8_non_creatures_cast: string
#> oppo_turn_8_user_instants_sorceries_cast: string
#> oppo_turn_8_oppo_instants_sorceries_cast: string
#> oppo_turn_8_user_abilities: string
#> oppo_turn_8_oppo_abilities: string
#> oppo_turn_8_creatures_attacked: string
#> oppo_turn_8_creatures_blocked: string
#> oppo_turn_8_creatures_unblocked: string
#> oppo_turn_8_creatures_blocking: string
#> oppo_turn_8_oppo_combat_damage_taken: string
#> oppo_turn_8_user_combat_damage_taken: string
#> oppo_turn_8_user_creatures_killed_combat: string
#> oppo_turn_8_oppo_creatures_killed_combat: string
#> oppo_turn_8_user_creatures_killed_non_combat: string
#> oppo_turn_8_oppo_creatures_killed_non_combat: string
#> oppo_turn_8_user_mana_spent: float
#> oppo_turn_8_oppo_mana_spent: float
#> oppo_turn_8_eot_user_cards_in_hand: string
#> oppo_turn_8_eot_oppo_cards_in_hand: float
#> oppo_turn_8_eot_user_lands_in_play: string
#> oppo_turn_8_eot_oppo_lands_in_play: string
#> oppo_turn_8_eot_user_creatures_in_play: string
#> oppo_turn_8_eot_oppo_creatures_in_play: string
#> oppo_turn_8_eot_user_non_creatures_in_play: string
#> oppo_turn_8_eot_oppo_non_creatures_in_play: string
#> oppo_turn_8_eot_user_life: float
#> oppo_turn_8_eot_oppo_life: float
#> user_turn_9_cards_drawn: string
#> user_turn_9_cards_tutored: string
#> user_turn_9_cards_discarded: string
#> user_turn_9_lands_played: string
#> user_turn_9_creatures_cast: string
#> user_turn_9_non_creatures_cast: string
#> user_turn_9_user_instants_sorceries_cast: string
#> user_turn_9_oppo_instants_sorceries_cast: string
#> user_turn_9_user_abilities: string
#> user_turn_9_oppo_abilities: string
#> user_turn_9_creatures_attacked: string
#> user_turn_9_creatures_blocked: string
#> user_turn_9_creatures_unblocked: string
#> user_turn_9_creatures_blocking: string
#> user_turn_9_oppo_combat_damage_taken: string
#> user_turn_9_user_combat_damage_taken: string
#> user_turn_9_user_creatures_killed_combat: string
#> user_turn_9_oppo_creatures_killed_combat: string
#> user_turn_9_user_creatures_killed_non_combat: string
#> user_turn_9_oppo_creatures_killed_non_combat: string
#> user_turn_9_user_mana_spent: float
#> user_turn_9_oppo_mana_spent: float
#> user_turn_9_eot_user_cards_in_hand: string
#> user_turn_9_eot_oppo_cards_in_hand: float
#> user_turn_9_eot_user_lands_in_play: string
#> user_turn_9_eot_oppo_lands_in_play: string
#> user_turn_9_eot_user_creatures_in_play: string
#> user_turn_9_eot_oppo_creatures_in_play: string
#> user_turn_9_eot_user_non_creatures_in_play: string
#> user_turn_9_eot_oppo_non_creatures_in_play: string
#> user_turn_9_eot_user_life: float
#> user_turn_9_eot_oppo_life: float
#> oppo_turn_9_cards_drawn: int8
#> oppo_turn_9_cards_tutored: int8
#> oppo_turn_9_cards_discarded: string
#> oppo_turn_9_lands_played: string
#> oppo_turn_9_creatures_cast: string
#> oppo_turn_9_non_creatures_cast: string
#> oppo_turn_9_user_instants_sorceries_cast: string
#> oppo_turn_9_oppo_instants_sorceries_cast: string
#> oppo_turn_9_user_abilities: string
#> oppo_turn_9_oppo_abilities: string
#> oppo_turn_9_creatures_attacked: string
#> oppo_turn_9_creatures_blocked: string
#> oppo_turn_9_creatures_unblocked: string
#> oppo_turn_9_creatures_blocking: string
#> oppo_turn_9_oppo_combat_damage_taken: string
#> oppo_turn_9_user_combat_damage_taken: string
#> oppo_turn_9_user_creatures_killed_combat: string
#> oppo_turn_9_oppo_creatures_killed_combat: string
#> oppo_turn_9_user_creatures_killed_non_combat: string
#> oppo_turn_9_oppo_creatures_killed_non_combat: string
#> oppo_turn_9_user_mana_spent: float
#> oppo_turn_9_oppo_mana_spent: float
#> oppo_turn_9_eot_user_cards_in_hand: string
#> oppo_turn_9_eot_oppo_cards_in_hand: float
#> oppo_turn_9_eot_user_lands_in_play: string
#> oppo_turn_9_eot_oppo_lands_in_play: string
#> oppo_turn_9_eot_user_creatures_in_play: string
#> oppo_turn_9_eot_oppo_creatures_in_play: string
#> oppo_turn_9_eot_user_non_creatures_in_play: string
#> oppo_turn_9_eot_oppo_non_creatures_in_play: string
#> oppo_turn_9_eot_user_life: float
#> oppo_turn_9_eot_oppo_life: float
#> user_turn_10_cards_drawn: string
#> user_turn_10_cards_tutored: string
#> user_turn_10_cards_discarded: string
#> user_turn_10_lands_played: string
#> user_turn_10_creatures_cast: string
#> user_turn_10_non_creatures_cast: string
#> user_turn_10_user_instants_sorceries_cast: string
#> user_turn_10_oppo_instants_sorceries_cast: string
#> user_turn_10_user_abilities: string
#> user_turn_10_oppo_abilities: string
#> user_turn_10_creatures_attacked: string
#> user_turn_10_creatures_blocked: string
#> user_turn_10_creatures_unblocked: string
#> user_turn_10_creatures_blocking: string
#> user_turn_10_oppo_combat_damage_taken: string
#> user_turn_10_user_combat_damage_taken: string
#> user_turn_10_user_creatures_killed_combat: string
#> user_turn_10_oppo_creatures_killed_combat: string
#> user_turn_10_user_creatures_killed_non_combat: string
#> user_turn_10_oppo_creatures_killed_non_combat: string
#> user_turn_10_user_mana_spent: float
#> user_turn_10_oppo_mana_spent: float
#> user_turn_10_eot_user_cards_in_hand: string
#> user_turn_10_eot_oppo_cards_in_hand: float
#> user_turn_10_eot_user_lands_in_play: string
#> user_turn_10_eot_oppo_lands_in_play: string
#> user_turn_10_eot_user_creatures_in_play: string
#> user_turn_10_eot_oppo_creatures_in_play: string
#> user_turn_10_eot_user_non_creatures_in_play: string
#> user_turn_10_eot_oppo_non_creatures_in_play: string
#> user_turn_10_eot_user_life: float
#> user_turn_10_eot_oppo_life: float
#> oppo_turn_10_cards_drawn: int8
#> oppo_turn_10_cards_tutored: int8
#> oppo_turn_10_cards_discarded: string
#> oppo_turn_10_lands_played: string
#> oppo_turn_10_creatures_cast: string
#> oppo_turn_10_non_creatures_cast: string
#> oppo_turn_10_user_instants_sorceries_cast: string
#> oppo_turn_10_oppo_instants_sorceries_cast: string
#> oppo_turn_10_user_abilities: string
#> oppo_turn_10_oppo_abilities: string
#> oppo_turn_10_creatures_attacked: string
#> oppo_turn_10_creatures_blocked: string
#> oppo_turn_10_creatures_unblocked: string
#> oppo_turn_10_creatures_blocking: string
#> oppo_turn_10_oppo_combat_damage_taken: string
#> oppo_turn_10_user_combat_damage_taken: string
#> oppo_turn_10_user_creatures_killed_combat: string
#> oppo_turn_10_oppo_creatures_killed_combat: string
#> oppo_turn_10_user_creatures_killed_non_combat: string
#> oppo_turn_10_oppo_creatures_killed_non_combat: string
#> oppo_turn_10_user_mana_spent: float
#> oppo_turn_10_oppo_mana_spent: float
#> oppo_turn_10_eot_user_cards_in_hand: string
#> oppo_turn_10_eot_oppo_cards_in_hand: float
#> oppo_turn_10_eot_user_lands_in_play: string
#> oppo_turn_10_eot_oppo_lands_in_play: string
#> oppo_turn_10_eot_user_creatures_in_play: string
#> oppo_turn_10_eot_oppo_creatures_in_play: string
#> oppo_turn_10_eot_user_non_creatures_in_play: string
#> oppo_turn_10_eot_oppo_non_creatures_in_play: string
#> oppo_turn_10_eot_user_life: float
#> oppo_turn_10_eot_oppo_life: float
#> user_turn_11_cards_drawn: string
#> user_turn_11_cards_tutored: string
#> user_turn_11_cards_discarded: string
#> user_turn_11_lands_played: string
#> user_turn_11_creatures_cast: string
#> user_turn_11_non_creatures_cast: string
#> user_turn_11_user_instants_sorceries_cast: string
#> user_turn_11_oppo_instants_sorceries_cast: string
#> user_turn_11_user_abilities: string
#> user_turn_11_oppo_abilities: string
#> user_turn_11_creatures_attacked: string
#> user_turn_11_creatures_blocked: string
#> user_turn_11_creatures_unblocked: string
#> user_turn_11_creatures_blocking: string
#> user_turn_11_oppo_combat_damage_taken: string
#> user_turn_11_user_combat_damage_taken: string
#> user_turn_11_user_creatures_killed_combat: string
#> user_turn_11_oppo_creatures_killed_combat: string
#> user_turn_11_user_creatures_killed_non_combat: string
#> user_turn_11_oppo_creatures_killed_non_combat: string
#> user_turn_11_user_mana_spent: float
#> user_turn_11_oppo_mana_spent: float
#> user_turn_11_eot_user_cards_in_hand: string
#> user_turn_11_eot_oppo_cards_in_hand: float
#> user_turn_11_eot_user_lands_in_play: string
#> user_turn_11_eot_oppo_lands_in_play: string
#> user_turn_11_eot_user_creatures_in_play: string
#> user_turn_11_eot_oppo_creatures_in_play: string
#> user_turn_11_eot_user_non_creatures_in_play: string
#> user_turn_11_eot_oppo_non_creatures_in_play: string
#> user_turn_11_eot_user_life: float
#> user_turn_11_eot_oppo_life: float
#> oppo_turn_11_cards_drawn: int8
#> oppo_turn_11_cards_tutored: int8
#> oppo_turn_11_cards_discarded: string
#> oppo_turn_11_lands_played: string
#> oppo_turn_11_creatures_cast: string
#> oppo_turn_11_non_creatures_cast: string
#> oppo_turn_11_user_instants_sorceries_cast: string
#> oppo_turn_11_oppo_instants_sorceries_cast: string
#> oppo_turn_11_user_abilities: string
#> oppo_turn_11_oppo_abilities: string
#> oppo_turn_11_creatures_attacked: string
#> oppo_turn_11_creatures_blocked: string
#> oppo_turn_11_creatures_unblocked: string
#> oppo_turn_11_creatures_blocking: string
#> oppo_turn_11_oppo_combat_damage_taken: string
#> oppo_turn_11_user_combat_damage_taken: string
#> oppo_turn_11_user_creatures_killed_combat: string
#> oppo_turn_11_oppo_creatures_killed_combat: string
#> oppo_turn_11_user_creatures_killed_non_combat: string
#> oppo_turn_11_oppo_creatures_killed_non_combat: string
#> oppo_turn_11_user_mana_spent: float
#> oppo_turn_11_oppo_mana_spent: float
#> oppo_turn_11_eot_user_cards_in_hand: string
#> oppo_turn_11_eot_oppo_cards_in_hand: float
#> oppo_turn_11_eot_user_lands_in_play: string
#> oppo_turn_11_eot_oppo_lands_in_play: string
#> oppo_turn_11_eot_user_creatures_in_play: string
#> oppo_turn_11_eot_oppo_creatures_in_play: string
#> oppo_turn_11_eot_user_non_creatures_in_play: string
#> oppo_turn_11_eot_oppo_non_creatures_in_play: string
#> oppo_turn_11_eot_user_life: float
#> oppo_turn_11_eot_oppo_life: float
#> user_turn_12_cards_drawn: string
#> user_turn_12_cards_tutored: string
#> user_turn_12_cards_discarded: string
#> user_turn_12_lands_played: string
#> user_turn_12_creatures_cast: string
#> user_turn_12_non_creatures_cast: string
#> user_turn_12_user_instants_sorceries_cast: string
#> user_turn_12_oppo_instants_sorceries_cast: string
#> user_turn_12_user_abilities: string
#> user_turn_12_oppo_abilities: string
#> user_turn_12_creatures_attacked: string
#> user_turn_12_creatures_blocked: string
#> user_turn_12_creatures_unblocked: string
#> user_turn_12_creatures_blocking: string
#> user_turn_12_oppo_combat_damage_taken: string
#> user_turn_12_user_combat_damage_taken: string
#> user_turn_12_user_creatures_killed_combat: string
#> user_turn_12_oppo_creatures_killed_combat: string
#> user_turn_12_user_creatures_killed_non_combat: string
#> user_turn_12_oppo_creatures_killed_non_combat: string
#> user_turn_12_user_mana_spent: float
#> user_turn_12_oppo_mana_spent: float
#> user_turn_12_eot_user_cards_in_hand: string
#> user_turn_12_eot_oppo_cards_in_hand: float
#> user_turn_12_eot_user_lands_in_play: string
#> user_turn_12_eot_oppo_lands_in_play: string
#> user_turn_12_eot_user_creatures_in_play: string
#> user_turn_12_eot_oppo_creatures_in_play: string
#> user_turn_12_eot_user_non_creatures_in_play: string
#> user_turn_12_eot_oppo_non_creatures_in_play: string
#> user_turn_12_eot_user_life: float
#> user_turn_12_eot_oppo_life: float
#> oppo_turn_12_cards_drawn: int8
#> oppo_turn_12_cards_tutored: int8
#> oppo_turn_12_cards_discarded: string
#> oppo_turn_12_lands_played: string
#> oppo_turn_12_creatures_cast: string
#> oppo_turn_12_non_creatures_cast: string
#> oppo_turn_12_user_instants_sorceries_cast: string
#> oppo_turn_12_oppo_instants_sorceries_cast: string
#> oppo_turn_12_user_abilities: string
#> oppo_turn_12_oppo_abilities: string
#> oppo_turn_12_creatures_attacked: string
#> oppo_turn_12_creatures_blocked: string
#> oppo_turn_12_creatures_unblocked: string
#> oppo_turn_12_creatures_blocking: string
#> oppo_turn_12_oppo_combat_damage_taken: string
#> oppo_turn_12_user_combat_damage_taken: string
#> oppo_turn_12_user_creatures_killed_combat: string
#> oppo_turn_12_oppo_creatures_killed_combat: string
#> oppo_turn_12_user_creatures_killed_non_combat: string
#> oppo_turn_12_oppo_creatures_killed_non_combat: string
#> oppo_turn_12_user_mana_spent: float
#> oppo_turn_12_oppo_mana_spent: float
#> oppo_turn_12_eot_user_cards_in_hand: string
#> oppo_turn_12_eot_oppo_cards_in_hand: float
#> oppo_turn_12_eot_user_lands_in_play: string
#> oppo_turn_12_eot_oppo_lands_in_play: string
#> oppo_turn_12_eot_user_creatures_in_play: string
#> oppo_turn_12_eot_oppo_creatures_in_play: string
#> oppo_turn_12_eot_user_non_creatures_in_play: string
#> oppo_turn_12_eot_oppo_non_creatures_in_play: string
#> oppo_turn_12_eot_user_life: float
#> oppo_turn_12_eot_oppo_life: float
#> user_turn_13_cards_drawn: string
#> user_turn_13_cards_tutored: string
#> user_turn_13_cards_discarded: string
#> user_turn_13_lands_played: string
#> user_turn_13_creatures_cast: string
#> user_turn_13_non_creatures_cast: string
#> user_turn_13_user_instants_sorceries_cast: string
#> user_turn_13_oppo_instants_sorceries_cast: string
#> user_turn_13_user_abilities: string
#> user_turn_13_oppo_abilities: string
#> user_turn_13_creatures_attacked: string
#> user_turn_13_creatures_blocked: string
#> user_turn_13_creatures_unblocked: string
#> user_turn_13_creatures_blocking: string
#> user_turn_13_oppo_combat_damage_taken: string
#> user_turn_13_user_combat_damage_taken: string
#> user_turn_13_user_creatures_killed_combat: string
#> user_turn_13_oppo_creatures_killed_combat: string
#> user_turn_13_user_creatures_killed_non_combat: string
#> user_turn_13_oppo_creatures_killed_non_combat: string
#> user_turn_13_user_mana_spent: float
#> user_turn_13_oppo_mana_spent: float
#> user_turn_13_eot_user_cards_in_hand: string
#> user_turn_13_eot_oppo_cards_in_hand: float
#> user_turn_13_eot_user_lands_in_play: string
#> user_turn_13_eot_oppo_lands_in_play: string
#> user_turn_13_eot_user_creatures_in_play: string
#> user_turn_13_eot_oppo_creatures_in_play: string
#> user_turn_13_eot_user_non_creatures_in_play: string
#> user_turn_13_eot_oppo_non_creatures_in_play: string
#> user_turn_13_eot_user_life: float
#> user_turn_13_eot_oppo_life: float
#> oppo_turn_13_cards_drawn: int8
#> oppo_turn_13_cards_tutored: int8
#> oppo_turn_13_cards_discarded: string
#> oppo_turn_13_lands_played: string
#> oppo_turn_13_creatures_cast: string
#> oppo_turn_13_non_creatures_cast: string
#> oppo_turn_13_user_instants_sorceries_cast: string
#> oppo_turn_13_oppo_instants_sorceries_cast: string
#> oppo_turn_13_user_abilities: string
#> oppo_turn_13_oppo_abilities: string
#> oppo_turn_13_creatures_attacked: string
#> oppo_turn_13_creatures_blocked: string
#> oppo_turn_13_creatures_unblocked: string
#> oppo_turn_13_creatures_blocking: string
#> oppo_turn_13_oppo_combat_damage_taken: string
#> oppo_turn_13_user_combat_damage_taken: string
#> oppo_turn_13_user_creatures_killed_combat: string
#> oppo_turn_13_oppo_creatures_killed_combat: string
#> oppo_turn_13_user_creatures_killed_non_combat: string
#> oppo_turn_13_oppo_creatures_killed_non_combat: string
#> oppo_turn_13_user_mana_spent: float
#> oppo_turn_13_oppo_mana_spent: float
#> oppo_turn_13_eot_user_cards_in_hand: string
#> oppo_turn_13_eot_oppo_cards_in_hand: float
#> oppo_turn_13_eot_user_lands_in_play: string
#> oppo_turn_13_eot_oppo_lands_in_play: string
#> oppo_turn_13_eot_user_creatures_in_play: string
#> oppo_turn_13_eot_oppo_creatures_in_play: string
#> oppo_turn_13_eot_user_non_creatures_in_play: string
#> oppo_turn_13_eot_oppo_non_creatures_in_play: string
#> oppo_turn_13_eot_user_life: float
#> oppo_turn_13_eot_oppo_life: float
#> user_turn_14_cards_drawn: string
#> user_turn_14_cards_tutored: string
#> user_turn_14_cards_discarded: string
#> user_turn_14_lands_played: string
#> user_turn_14_creatures_cast: string
#> user_turn_14_non_creatures_cast: string
#> user_turn_14_user_instants_sorceries_cast: string
#> user_turn_14_oppo_instants_sorceries_cast: string
#> user_turn_14_user_abilities: string
#> user_turn_14_oppo_abilities: string
#> user_turn_14_creatures_attacked: string
#> user_turn_14_creatures_blocked: string
#> user_turn_14_creatures_unblocked: string
#> user_turn_14_creatures_blocking: string
#> user_turn_14_oppo_combat_damage_taken: string
#> user_turn_14_user_combat_damage_taken: string
#> user_turn_14_user_creatures_killed_combat: string
#> user_turn_14_oppo_creatures_killed_combat: string
#> user_turn_14_user_creatures_killed_non_combat: string
#> user_turn_14_oppo_creatures_killed_non_combat: string
#> user_turn_14_user_mana_spent: float
#> user_turn_14_oppo_mana_spent: float
#> user_turn_14_eot_user_cards_in_hand: string
#> user_turn_14_eot_oppo_cards_in_hand: float
#> user_turn_14_eot_user_lands_in_play: string
#> user_turn_14_eot_oppo_lands_in_play: string
#> user_turn_14_eot_user_creatures_in_play: string
#> user_turn_14_eot_oppo_creatures_in_play: string
#> user_turn_14_eot_user_non_creatures_in_play: string
#> user_turn_14_eot_oppo_non_creatures_in_play: string
#> user_turn_14_eot_user_life: float
#> user_turn_14_eot_oppo_life: float
#> oppo_turn_14_cards_drawn: int8
#> oppo_turn_14_cards_tutored: int8
#> oppo_turn_14_cards_discarded: string
#> oppo_turn_14_lands_played: string
#> oppo_turn_14_creatures_cast: string
#> oppo_turn_14_non_creatures_cast: string
#> oppo_turn_14_user_instants_sorceries_cast: string
#> oppo_turn_14_oppo_instants_sorceries_cast: string
#> oppo_turn_14_user_abilities: string
#> oppo_turn_14_oppo_abilities: string
#> oppo_turn_14_creatures_attacked: string
#> oppo_turn_14_creatures_blocked: string
#> oppo_turn_14_creatures_unblocked: string
#> oppo_turn_14_creatures_blocking: string
#> oppo_turn_14_oppo_combat_damage_taken: string
#> oppo_turn_14_user_combat_damage_taken: string
#> oppo_turn_14_user_creatures_killed_combat: string
#> oppo_turn_14_oppo_creatures_killed_combat: string
#> oppo_turn_14_user_creatures_killed_non_combat: string
#> oppo_turn_14_oppo_creatures_killed_non_combat: string
#> oppo_turn_14_user_mana_spent: float
#> oppo_turn_14_oppo_mana_spent: float
#> oppo_turn_14_eot_user_cards_in_hand: string
#> oppo_turn_14_eot_oppo_cards_in_hand: float
#> oppo_turn_14_eot_user_lands_in_play: string
#> oppo_turn_14_eot_oppo_lands_in_play: string
#> oppo_turn_14_eot_user_creatures_in_play: string
#> oppo_turn_14_eot_oppo_creatures_in_play: string
#> oppo_turn_14_eot_user_non_creatures_in_play: string
#> oppo_turn_14_eot_oppo_non_creatures_in_play: string
#> oppo_turn_14_eot_user_life: float
#> oppo_turn_14_eot_oppo_life: float
#> user_turn_15_cards_drawn: string
#> user_turn_15_cards_tutored: string
#> user_turn_15_cards_discarded: string
#> user_turn_15_lands_played: string
#> user_turn_15_creatures_cast: string
#> user_turn_15_non_creatures_cast: string
#> user_turn_15_user_instants_sorceries_cast: string
#> user_turn_15_oppo_instants_sorceries_cast: string
#> user_turn_15_user_abilities: string
#> user_turn_15_oppo_abilities: string
#> user_turn_15_creatures_attacked: string
#> user_turn_15_creatures_blocked: string
#> user_turn_15_creatures_unblocked: string
#> user_turn_15_creatures_blocking: string
#> user_turn_15_oppo_combat_damage_taken: string
#> user_turn_15_user_combat_damage_taken: string
#> user_turn_15_user_creatures_killed_combat: string
#> user_turn_15_oppo_creatures_killed_combat: string
#> user_turn_15_user_creatures_killed_non_combat: string
#> user_turn_15_oppo_creatures_killed_non_combat: string
#> user_turn_15_user_mana_spent: float
#> user_turn_15_oppo_mana_spent: float
#> user_turn_15_eot_user_cards_in_hand: string
#> user_turn_15_eot_oppo_cards_in_hand: float
#> user_turn_15_eot_user_lands_in_play: string
#> user_turn_15_eot_oppo_lands_in_play: string
#> user_turn_15_eot_user_creatures_in_play: string
#> user_turn_15_eot_oppo_creatures_in_play: string
#> user_turn_15_eot_user_non_creatures_in_play: string
#> user_turn_15_eot_oppo_non_creatures_in_play: string
#> user_turn_15_eot_user_life: float
#> user_turn_15_eot_oppo_life: float
#> oppo_turn_15_cards_drawn: int8
#> oppo_turn_15_cards_tutored: int8
#> oppo_turn_15_cards_discarded: string
#> oppo_turn_15_lands_played: string
#> oppo_turn_15_creatures_cast: string
#> oppo_turn_15_non_creatures_cast: string
#> oppo_turn_15_user_instants_sorceries_cast: string
#> oppo_turn_15_oppo_instants_sorceries_cast: string
#> oppo_turn_15_user_abilities: string
#> oppo_turn_15_oppo_abilities: string
#> oppo_turn_15_creatures_attacked: string
#> oppo_turn_15_creatures_blocked: string
#> oppo_turn_15_creatures_unblocked: string
#> oppo_turn_15_creatures_blocking: string
#> oppo_turn_15_oppo_combat_damage_taken: string
#> oppo_turn_15_user_combat_damage_taken: string
#> oppo_turn_15_user_creatures_killed_combat: string
#> oppo_turn_15_oppo_creatures_killed_combat: string
#> oppo_turn_15_user_creatures_killed_non_combat: string
#> oppo_turn_15_oppo_creatures_killed_non_combat: string
#> oppo_turn_15_user_mana_spent: float
#> oppo_turn_15_oppo_mana_spent: float
#> oppo_turn_15_eot_user_cards_in_hand: string
#> oppo_turn_15_eot_oppo_cards_in_hand: float
#> oppo_turn_15_eot_user_lands_in_play: string
#> oppo_turn_15_eot_oppo_lands_in_play: string
#> oppo_turn_15_eot_user_creatures_in_play: string
#> oppo_turn_15_eot_oppo_creatures_in_play: string
#> oppo_turn_15_eot_user_non_creatures_in_play: string
#> oppo_turn_15_eot_oppo_non_creatures_in_play: string
#> oppo_turn_15_eot_user_life: float
#> oppo_turn_15_eot_oppo_life: float
#> user_turn_16_cards_drawn: string
#> user_turn_16_cards_tutored: string
#> user_turn_16_cards_discarded: string
#> user_turn_16_lands_played: string
#> user_turn_16_creatures_cast: string
#> user_turn_16_non_creatures_cast: string
#> user_turn_16_user_instants_sorceries_cast: string
#> user_turn_16_oppo_instants_sorceries_cast: string
#> user_turn_16_user_abilities: string
#> user_turn_16_oppo_abilities: string
#> user_turn_16_creatures_attacked: string
#> user_turn_16_creatures_blocked: string
#> user_turn_16_creatures_unblocked: string
#> user_turn_16_creatures_blocking: string
#> user_turn_16_oppo_combat_damage_taken: string
#> user_turn_16_user_combat_damage_taken: string
#> user_turn_16_user_creatures_killed_combat: string
#> user_turn_16_oppo_creatures_killed_combat: string
#> user_turn_16_user_creatures_killed_non_combat: string
#> user_turn_16_oppo_creatures_killed_non_combat: string
#> user_turn_16_user_mana_spent: float
#> user_turn_16_oppo_mana_spent: float
#> user_turn_16_eot_user_cards_in_hand: string
#> user_turn_16_eot_oppo_cards_in_hand: float
#> user_turn_16_eot_user_lands_in_play: string
#> user_turn_16_eot_oppo_lands_in_play: string
#> user_turn_16_eot_user_creatures_in_play: string
#> user_turn_16_eot_oppo_creatures_in_play: string
#> user_turn_16_eot_user_non_creatures_in_play: string
#> user_turn_16_eot_oppo_non_creatures_in_play: string
#> user_turn_16_eot_user_life: float
#> user_turn_16_eot_oppo_life: float
#> oppo_turn_16_cards_drawn: int8
#> oppo_turn_16_cards_tutored: int8
#> oppo_turn_16_cards_discarded: string
#> oppo_turn_16_lands_played: string
#> oppo_turn_16_creatures_cast: string
#> oppo_turn_16_non_creatures_cast: string
#> oppo_turn_16_user_instants_sorceries_cast: string
#> oppo_turn_16_oppo_instants_sorceries_cast: string
#> oppo_turn_16_user_abilities: string
#> oppo_turn_16_oppo_abilities: string
#> oppo_turn_16_creatures_attacked: string
#> oppo_turn_16_creatures_blocked: string
#> oppo_turn_16_creatures_unblocked: string
#> oppo_turn_16_creatures_blocking: string
#> oppo_turn_16_oppo_combat_damage_taken: string
#> oppo_turn_16_user_combat_damage_taken: string
#> oppo_turn_16_user_creatures_killed_combat: string
#> oppo_turn_16_oppo_creatures_killed_combat: string
#> oppo_turn_16_user_creatures_killed_non_combat: string
#> oppo_turn_16_oppo_creatures_killed_non_combat: string
#> oppo_turn_16_user_mana_spent: float
#> oppo_turn_16_oppo_mana_spent: float
#> oppo_turn_16_eot_user_cards_in_hand: string
#> oppo_turn_16_eot_oppo_cards_in_hand: float
#> oppo_turn_16_eot_user_lands_in_play: string
#> oppo_turn_16_eot_oppo_lands_in_play: string
#> oppo_turn_16_eot_user_creatures_in_play: string
#> oppo_turn_16_eot_oppo_creatures_in_play: string
#> oppo_turn_16_eot_user_non_creatures_in_play: string
#> oppo_turn_16_eot_oppo_non_creatures_in_play: string
#> oppo_turn_16_eot_user_life: float
#> oppo_turn_16_eot_oppo_life: float
#> user_turn_17_cards_drawn: string
#> user_turn_17_cards_tutored: string
#> user_turn_17_cards_discarded: string
#> user_turn_17_lands_played: string
#> user_turn_17_creatures_cast: string
#> user_turn_17_non_creatures_cast: string
#> user_turn_17_user_instants_sorceries_cast: string
#> user_turn_17_oppo_instants_sorceries_cast: string
#> user_turn_17_user_abilities: string
#> user_turn_17_oppo_abilities: string
#> user_turn_17_creatures_attacked: string
#> user_turn_17_creatures_blocked: string
#> user_turn_17_creatures_unblocked: string
#> user_turn_17_creatures_blocking: string
#> user_turn_17_oppo_combat_damage_taken: string
#> user_turn_17_user_combat_damage_taken: string
#> user_turn_17_user_creatures_killed_combat: string
#> user_turn_17_oppo_creatures_killed_combat: string
#> user_turn_17_user_creatures_killed_non_combat: string
#> user_turn_17_oppo_creatures_killed_non_combat: string
#> user_turn_17_user_mana_spent: float
#> user_turn_17_oppo_mana_spent: float
#> user_turn_17_eot_user_cards_in_hand: string
#> user_turn_17_eot_oppo_cards_in_hand: float
#> user_turn_17_eot_user_lands_in_play: string
#> user_turn_17_eot_oppo_lands_in_play: string
#> user_turn_17_eot_user_creatures_in_play: string
#> user_turn_17_eot_oppo_creatures_in_play: string
#> user_turn_17_eot_user_non_creatures_in_play: string
#> user_turn_17_eot_oppo_non_creatures_in_play: string
#> user_turn_17_eot_user_life: float
#> user_turn_17_eot_oppo_life: float
#> oppo_turn_17_cards_drawn: int8
#> oppo_turn_17_cards_tutored: int8
#> oppo_turn_17_cards_discarded: string
#> oppo_turn_17_lands_played: string
#> oppo_turn_17_creatures_cast: string
#> oppo_turn_17_non_creatures_cast: string
#> oppo_turn_17_user_instants_sorceries_cast: string
#> oppo_turn_17_oppo_instants_sorceries_cast: string
#> oppo_turn_17_user_abilities: string
#> oppo_turn_17_oppo_abilities: string
#> oppo_turn_17_creatures_attacked: string
#> oppo_turn_17_creatures_blocked: string
#> oppo_turn_17_creatures_unblocked: string
#> oppo_turn_17_creatures_blocking: string
#> oppo_turn_17_oppo_combat_damage_taken: string
#> oppo_turn_17_user_combat_damage_taken: string
#> oppo_turn_17_user_creatures_killed_combat: string
#> oppo_turn_17_oppo_creatures_killed_combat: string
#> oppo_turn_17_user_creatures_killed_non_combat: string
#> oppo_turn_17_oppo_creatures_killed_non_combat: string
#> oppo_turn_17_user_mana_spent: float
#> oppo_turn_17_oppo_mana_spent: float
#> oppo_turn_17_eot_user_cards_in_hand: string
#> oppo_turn_17_eot_oppo_cards_in_hand: float
#> oppo_turn_17_eot_user_lands_in_play: string
#> oppo_turn_17_eot_oppo_lands_in_play: string
#> oppo_turn_17_eot_user_creatures_in_play: string
#> oppo_turn_17_eot_oppo_creatures_in_play: string
#> oppo_turn_17_eot_user_non_creatures_in_play: string
#> oppo_turn_17_eot_oppo_non_creatures_in_play: string
#> oppo_turn_17_eot_user_life: float
#> oppo_turn_17_eot_oppo_life: float
#> user_turn_18_cards_drawn: string
#> user_turn_18_cards_tutored: string
#> user_turn_18_cards_discarded: string
#> user_turn_18_lands_played: string
#> user_turn_18_creatures_cast: string
#> user_turn_18_non_creatures_cast: string
#> user_turn_18_user_instants_sorceries_cast: string
#> user_turn_18_oppo_instants_sorceries_cast: string
#> user_turn_18_user_abilities: string
#> user_turn_18_oppo_abilities: string
#> user_turn_18_creatures_attacked: string
#> user_turn_18_creatures_blocked: string
#> user_turn_18_creatures_unblocked: string
#> user_turn_18_creatures_blocking: string
#> user_turn_18_oppo_combat_damage_taken: string
#> user_turn_18_user_combat_damage_taken: string
#> user_turn_18_user_creatures_killed_combat: string
#> user_turn_18_oppo_creatures_killed_combat: string
#> user_turn_18_user_creatures_killed_non_combat: string
#> user_turn_18_oppo_creatures_killed_non_combat: string
#> user_turn_18_user_mana_spent: float
#> user_turn_18_oppo_mana_spent: float
#> user_turn_18_eot_user_cards_in_hand: string
#> user_turn_18_eot_oppo_cards_in_hand: float
#> user_turn_18_eot_user_lands_in_play: string
#> user_turn_18_eot_oppo_lands_in_play: string
#> user_turn_18_eot_user_creatures_in_play: string
#> user_turn_18_eot_oppo_creatures_in_play: string
#> user_turn_18_eot_user_non_creatures_in_play: string
#> user_turn_18_eot_oppo_non_creatures_in_play: string
#> user_turn_18_eot_user_life: float
#> user_turn_18_eot_oppo_life: float
#> oppo_turn_18_cards_drawn: int8
#> oppo_turn_18_cards_tutored: int8
#> oppo_turn_18_cards_discarded: string
#> oppo_turn_18_lands_played: string
#> oppo_turn_18_creatures_cast: string
#> oppo_turn_18_non_creatures_cast: string
#> oppo_turn_18_user_instants_sorceries_cast: string
#> oppo_turn_18_oppo_instants_sorceries_cast: string
#> oppo_turn_18_user_abilities: string
#> oppo_turn_18_oppo_abilities: string
#> oppo_turn_18_creatures_attacked: string
#> oppo_turn_18_creatures_blocked: string
#> oppo_turn_18_creatures_unblocked: string
#> oppo_turn_18_creatures_blocking: string
#> oppo_turn_18_oppo_combat_damage_taken: string
#> oppo_turn_18_user_combat_damage_taken: string
#> oppo_turn_18_user_creatures_killed_combat: string
#> oppo_turn_18_oppo_creatures_killed_combat: string
#> oppo_turn_18_user_creatures_killed_non_combat: string
#> oppo_turn_18_oppo_creatures_killed_non_combat: string
#> oppo_turn_18_user_mana_spent: float
#> oppo_turn_18_oppo_mana_spent: float
#> oppo_turn_18_eot_user_cards_in_hand: string
#> oppo_turn_18_eot_oppo_cards_in_hand: float
#> oppo_turn_18_eot_user_lands_in_play: string
#> oppo_turn_18_eot_oppo_lands_in_play: string
#> oppo_turn_18_eot_user_creatures_in_play: string
#> oppo_turn_18_eot_oppo_creatures_in_play: string
#> oppo_turn_18_eot_user_non_creatures_in_play: string
#> oppo_turn_18_eot_oppo_non_creatures_in_play: string
#> oppo_turn_18_eot_user_life: float
#> oppo_turn_18_eot_oppo_life: float
#> user_turn_19_cards_drawn: string
#> user_turn_19_cards_tutored: string
#> user_turn_19_cards_discarded: string
#> user_turn_19_lands_played: string
#> user_turn_19_creatures_cast: string
#> user_turn_19_non_creatures_cast: string
#> user_turn_19_user_instants_sorceries_cast: string
#> user_turn_19_oppo_instants_sorceries_cast: string
#> user_turn_19_user_abilities: string
#> user_turn_19_oppo_abilities: string
#> user_turn_19_creatures_attacked: string
#> user_turn_19_creatures_blocked: string
#> user_turn_19_creatures_unblocked: string
#> user_turn_19_creatures_blocking: string
#> user_turn_19_oppo_combat_damage_taken: string
#> user_turn_19_user_combat_damage_taken: string
#> user_turn_19_user_creatures_killed_combat: string
#> user_turn_19_oppo_creatures_killed_combat: string
#> user_turn_19_user_creatures_killed_non_combat: string
#> user_turn_19_oppo_creatures_killed_non_combat: string
#> user_turn_19_user_mana_spent: float
#> user_turn_19_oppo_mana_spent: float
#> user_turn_19_eot_user_cards_in_hand: string
#> user_turn_19_eot_oppo_cards_in_hand: float
#> user_turn_19_eot_user_lands_in_play: string
#> user_turn_19_eot_oppo_lands_in_play: string
#> user_turn_19_eot_user_creatures_in_play: string
#> user_turn_19_eot_oppo_creatures_in_play: string
#> user_turn_19_eot_user_non_creatures_in_play: string
#> user_turn_19_eot_oppo_non_creatures_in_play: string
#> user_turn_19_eot_user_life: float
#> user_turn_19_eot_oppo_life: float
#> oppo_turn_19_cards_drawn: int8
#> oppo_turn_19_cards_tutored: int8
#> oppo_turn_19_cards_discarded: string
#> oppo_turn_19_lands_played: string
#> oppo_turn_19_creatures_cast: string
#> oppo_turn_19_non_creatures_cast: string
#> oppo_turn_19_user_instants_sorceries_cast: string
#> oppo_turn_19_oppo_instants_sorceries_cast: string
#> oppo_turn_19_user_abilities: string
#> oppo_turn_19_oppo_abilities: string
#> oppo_turn_19_creatures_attacked: string
#> oppo_turn_19_creatures_blocked: string
#> oppo_turn_19_creatures_unblocked: string
#> oppo_turn_19_creatures_blocking: string
#> oppo_turn_19_oppo_combat_damage_taken: string
#> oppo_turn_19_user_combat_damage_taken: string
#> oppo_turn_19_user_creatures_killed_combat: string
#> oppo_turn_19_oppo_creatures_killed_combat: string
#> oppo_turn_19_user_creatures_killed_non_combat: string
#> oppo_turn_19_oppo_creatures_killed_non_combat: string
#> oppo_turn_19_user_mana_spent: float
#> oppo_turn_19_oppo_mana_spent: float
#> oppo_turn_19_eot_user_cards_in_hand: string
#> oppo_turn_19_eot_oppo_cards_in_hand: float
#> oppo_turn_19_eot_user_lands_in_play: string
#> oppo_turn_19_eot_oppo_lands_in_play: string
#> oppo_turn_19_eot_user_creatures_in_play: string
#> oppo_turn_19_eot_oppo_creatures_in_play: string
#> oppo_turn_19_eot_user_non_creatures_in_play: string
#> oppo_turn_19_eot_oppo_non_creatures_in_play: string
#> oppo_turn_19_eot_user_life: float
#> oppo_turn_19_eot_oppo_life: float
#> user_turn_20_cards_drawn: string
#> user_turn_20_cards_tutored: string
#> user_turn_20_cards_discarded: string
#> user_turn_20_lands_played: string
#> user_turn_20_creatures_cast: string
#> user_turn_20_non_creatures_cast: string
#> user_turn_20_user_instants_sorceries_cast: string
#> user_turn_20_oppo_instants_sorceries_cast: string
#> user_turn_20_user_abilities: string
#> user_turn_20_oppo_abilities: string
#> user_turn_20_creatures_attacked: string
#> user_turn_20_creatures_blocked: string
#> user_turn_20_creatures_unblocked: string
#> user_turn_20_creatures_blocking: string
#> user_turn_20_oppo_combat_damage_taken: string
#> user_turn_20_user_combat_damage_taken: string
#> user_turn_20_user_creatures_killed_combat: string
#> user_turn_20_oppo_creatures_killed_combat: string
#> user_turn_20_user_creatures_killed_non_combat: string
#> user_turn_20_oppo_creatures_killed_non_combat: string
#> user_turn_20_user_mana_spent: float
#> user_turn_20_oppo_mana_spent: float
#> user_turn_20_eot_user_cards_in_hand: string
#> user_turn_20_eot_oppo_cards_in_hand: float
#> user_turn_20_eot_user_lands_in_play: string
#> user_turn_20_eot_oppo_lands_in_play: string
#> user_turn_20_eot_user_creatures_in_play: string
#> user_turn_20_eot_oppo_creatures_in_play: string
#> user_turn_20_eot_user_non_creatures_in_play: string
#> user_turn_20_eot_oppo_non_creatures_in_play: string
#> user_turn_20_eot_user_life: float
#> user_turn_20_eot_oppo_life: float
#> oppo_turn_20_cards_drawn: int8
#> oppo_turn_20_cards_tutored: int8
#> oppo_turn_20_cards_discarded: string
#> oppo_turn_20_lands_played: string
#> oppo_turn_20_creatures_cast: string
#> oppo_turn_20_non_creatures_cast: string
#> oppo_turn_20_user_instants_sorceries_cast: string
#> oppo_turn_20_oppo_instants_sorceries_cast: string
#> oppo_turn_20_user_abilities: string
#> oppo_turn_20_oppo_abilities: string
#> oppo_turn_20_creatures_attacked: string
#> oppo_turn_20_creatures_blocked: string
#> oppo_turn_20_creatures_unblocked: string
#> oppo_turn_20_creatures_blocking: string
#> oppo_turn_20_oppo_combat_damage_taken: string
#> oppo_turn_20_user_combat_damage_taken: string
#> oppo_turn_20_user_creatures_killed_combat: string
#> oppo_turn_20_oppo_creatures_killed_combat: string
#> oppo_turn_20_user_creatures_killed_non_combat: string
#> oppo_turn_20_oppo_creatures_killed_non_combat: string
#> oppo_turn_20_user_mana_spent: float
#> oppo_turn_20_oppo_mana_spent: float
#> oppo_turn_20_eot_user_cards_in_hand: string
#> oppo_turn_20_eot_oppo_cards_in_hand: float
#> oppo_turn_20_eot_user_lands_in_play: string
#> oppo_turn_20_eot_oppo_lands_in_play: string
#> oppo_turn_20_eot_user_creatures_in_play: string
#> oppo_turn_20_eot_oppo_creatures_in_play: string
#> oppo_turn_20_eot_user_non_creatures_in_play: string
#> oppo_turn_20_eot_oppo_non_creatures_in_play: string
#> oppo_turn_20_eot_user_life: float
#> oppo_turn_20_eot_oppo_life: float
#> user_turn_21_cards_drawn: string
#> user_turn_21_cards_tutored: string
#> user_turn_21_cards_discarded: string
#> user_turn_21_lands_played: string
#> user_turn_21_creatures_cast: string
#> user_turn_21_non_creatures_cast: string
#> user_turn_21_user_instants_sorceries_cast: string
#> user_turn_21_oppo_instants_sorceries_cast: string
#> user_turn_21_user_abilities: string
#> user_turn_21_oppo_abilities: string
#> user_turn_21_creatures_attacked: string
#> user_turn_21_creatures_blocked: string
#> user_turn_21_creatures_unblocked: string
#> user_turn_21_creatures_blocking: string
#> user_turn_21_oppo_combat_damage_taken: string
#> user_turn_21_user_combat_damage_taken: string
#> user_turn_21_user_creatures_killed_combat: string
#> user_turn_21_oppo_creatures_killed_combat: string
#> user_turn_21_user_creatures_killed_non_combat: string
#> user_turn_21_oppo_creatures_killed_non_combat: string
#> user_turn_21_user_mana_spent: float
#> user_turn_21_oppo_mana_spent: float
#> user_turn_21_eot_user_cards_in_hand: string
#> user_turn_21_eot_oppo_cards_in_hand: float
#> user_turn_21_eot_user_lands_in_play: string
#> user_turn_21_eot_oppo_lands_in_play: string
#> user_turn_21_eot_user_creatures_in_play: string
#> user_turn_21_eot_oppo_creatures_in_play: string
#> user_turn_21_eot_user_non_creatures_in_play: string
#> user_turn_21_eot_oppo_non_creatures_in_play: string
#> user_turn_21_eot_user_life: float
#> user_turn_21_eot_oppo_life: float
#> oppo_turn_21_cards_drawn: int8
#> oppo_turn_21_cards_tutored: int8
#> oppo_turn_21_cards_discarded: string
#> oppo_turn_21_lands_played: string
#> oppo_turn_21_creatures_cast: string
#> oppo_turn_21_non_creatures_cast: string
#> oppo_turn_21_user_instants_sorceries_cast: string
#> oppo_turn_21_oppo_instants_sorceries_cast: string
#> oppo_turn_21_user_abilities: string
#> oppo_turn_21_oppo_abilities: string
#> oppo_turn_21_creatures_attacked: string
#> oppo_turn_21_creatures_blocked: string
#> oppo_turn_21_creatures_unblocked: string
#> oppo_turn_21_creatures_blocking: string
#> oppo_turn_21_oppo_combat_damage_taken: string
#> oppo_turn_21_user_combat_damage_taken: string
#> oppo_turn_21_user_creatures_killed_combat: string
#> oppo_turn_21_oppo_creatures_killed_combat: string
#> oppo_turn_21_user_creatures_killed_non_combat: string
#> oppo_turn_21_oppo_creatures_killed_non_combat: string
#> oppo_turn_21_user_mana_spent: float
#> oppo_turn_21_oppo_mana_spent: float
#> oppo_turn_21_eot_user_cards_in_hand: string
#> oppo_turn_21_eot_oppo_cards_in_hand: float
#> oppo_turn_21_eot_user_lands_in_play: string
#> oppo_turn_21_eot_oppo_lands_in_play: string
#> oppo_turn_21_eot_user_creatures_in_play: string
#> oppo_turn_21_eot_oppo_creatures_in_play: string
#> oppo_turn_21_eot_user_non_creatures_in_play: string
#> oppo_turn_21_eot_oppo_non_creatures_in_play: string
#> oppo_turn_21_eot_user_life: float
#> oppo_turn_21_eot_oppo_life: float
#> user_turn_22_cards_drawn: string
#> user_turn_22_cards_tutored: string
#> user_turn_22_cards_discarded: string
#> user_turn_22_lands_played: string
#> user_turn_22_creatures_cast: string
#> user_turn_22_non_creatures_cast: string
#> user_turn_22_user_instants_sorceries_cast: string
#> user_turn_22_oppo_instants_sorceries_cast: string
#> user_turn_22_user_abilities: string
#> user_turn_22_oppo_abilities: string
#> user_turn_22_creatures_attacked: string
#> user_turn_22_creatures_blocked: string
#> user_turn_22_creatures_unblocked: string
#> user_turn_22_creatures_blocking: string
#> user_turn_22_oppo_combat_damage_taken: string
#> user_turn_22_user_combat_damage_taken: string
#> user_turn_22_user_creatures_killed_combat: string
#> user_turn_22_oppo_creatures_killed_combat: string
#> user_turn_22_user_creatures_killed_non_combat: string
#> user_turn_22_oppo_creatures_killed_non_combat: string
#> user_turn_22_user_mana_spent: float
#> user_turn_22_oppo_mana_spent: float
#> user_turn_22_eot_user_cards_in_hand: string
#> user_turn_22_eot_oppo_cards_in_hand: float
#> user_turn_22_eot_user_lands_in_play: string
#> user_turn_22_eot_oppo_lands_in_play: string
#> user_turn_22_eot_user_creatures_in_play: string
#> user_turn_22_eot_oppo_creatures_in_play: string
#> user_turn_22_eot_user_non_creatures_in_play: string
#> user_turn_22_eot_oppo_non_creatures_in_play: string
#> user_turn_22_eot_user_life: float
#> user_turn_22_eot_oppo_life: float
#> oppo_turn_22_cards_drawn: int8
#> oppo_turn_22_cards_tutored: int8
#> oppo_turn_22_cards_discarded: string
#> oppo_turn_22_lands_played: string
#> oppo_turn_22_creatures_cast: string
#> oppo_turn_22_non_creatures_cast: string
#> oppo_turn_22_user_instants_sorceries_cast: string
#> oppo_turn_22_oppo_instants_sorceries_cast: string
#> oppo_turn_22_user_abilities: string
#> oppo_turn_22_oppo_abilities: string
#> oppo_turn_22_creatures_attacked: string
#> oppo_turn_22_creatures_blocked: string
#> oppo_turn_22_creatures_unblocked: string
#> oppo_turn_22_creatures_blocking: string
#> oppo_turn_22_oppo_combat_damage_taken: string
#> oppo_turn_22_user_combat_damage_taken: string
#> oppo_turn_22_user_creatures_killed_combat: string
#> oppo_turn_22_oppo_creatures_killed_combat: string
#> oppo_turn_22_user_creatures_killed_non_combat: string
#> oppo_turn_22_oppo_creatures_killed_non_combat: string
#> oppo_turn_22_user_mana_spent: float
#> oppo_turn_22_oppo_mana_spent: float
#> oppo_turn_22_eot_user_cards_in_hand: string
#> oppo_turn_22_eot_oppo_cards_in_hand: float
#> oppo_turn_22_eot_user_lands_in_play: string
#> oppo_turn_22_eot_oppo_lands_in_play: string
#> oppo_turn_22_eot_user_creatures_in_play: string
#> oppo_turn_22_eot_oppo_creatures_in_play: string
#> oppo_turn_22_eot_user_non_creatures_in_play: string
#> oppo_turn_22_eot_oppo_non_creatures_in_play: string
#> oppo_turn_22_eot_user_life: float
#> oppo_turn_22_eot_oppo_life: float
#> user_turn_23_cards_drawn: string
#> user_turn_23_cards_tutored: string
#> user_turn_23_cards_discarded: string
#> user_turn_23_lands_played: string
#> user_turn_23_creatures_cast: string
#> user_turn_23_non_creatures_cast: string
#> user_turn_23_user_instants_sorceries_cast: string
#> user_turn_23_oppo_instants_sorceries_cast: string
#> user_turn_23_user_abilities: string
#> user_turn_23_oppo_abilities: string
#> user_turn_23_creatures_attacked: string
#> user_turn_23_creatures_blocked: string
#> user_turn_23_creatures_unblocked: string
#> user_turn_23_creatures_blocking: string
#> user_turn_23_oppo_combat_damage_taken: string
#> user_turn_23_user_combat_damage_taken: string
#> user_turn_23_user_creatures_killed_combat: string
#> user_turn_23_oppo_creatures_killed_combat: string
#> user_turn_23_user_creatures_killed_non_combat: string
#> user_turn_23_oppo_creatures_killed_non_combat: string
#> user_turn_23_user_mana_spent: float
#> user_turn_23_oppo_mana_spent: float
#> user_turn_23_eot_user_cards_in_hand: string
#> user_turn_23_eot_oppo_cards_in_hand: float
#> user_turn_23_eot_user_lands_in_play: string
#> user_turn_23_eot_oppo_lands_in_play: string
#> user_turn_23_eot_user_creatures_in_play: string
#> user_turn_23_eot_oppo_creatures_in_play: string
#> user_turn_23_eot_user_non_creatures_in_play: string
#> user_turn_23_eot_oppo_non_creatures_in_play: string
#> user_turn_23_eot_user_life: float
#> user_turn_23_eot_oppo_life: float
#> oppo_turn_23_cards_drawn: int8
#> oppo_turn_23_cards_tutored: int8
#> oppo_turn_23_cards_discarded: string
#> oppo_turn_23_lands_played: string
#> oppo_turn_23_creatures_cast: string
#> oppo_turn_23_non_creatures_cast: string
#> oppo_turn_23_user_instants_sorceries_cast: string
#> oppo_turn_23_oppo_instants_sorceries_cast: string
#> oppo_turn_23_user_abilities: string
#> oppo_turn_23_oppo_abilities: string
#> oppo_turn_23_creatures_attacked: string
#> oppo_turn_23_creatures_blocked: string
#> oppo_turn_23_creatures_unblocked: string
#> oppo_turn_23_creatures_blocking: string
#> oppo_turn_23_oppo_combat_damage_taken: string
#> oppo_turn_23_user_combat_damage_taken: string
#> oppo_turn_23_user_creatures_killed_combat: string
#> oppo_turn_23_oppo_creatures_killed_combat: string
#> oppo_turn_23_user_creatures_killed_non_combat: string
#> oppo_turn_23_oppo_creatures_killed_non_combat: string
#> oppo_turn_23_user_mana_spent: float
#> oppo_turn_23_oppo_mana_spent: float
#> oppo_turn_23_eot_user_cards_in_hand: string
#> oppo_turn_23_eot_oppo_cards_in_hand: float
#> oppo_turn_23_eot_user_lands_in_play: string
#> oppo_turn_23_eot_oppo_lands_in_play: string
#> oppo_turn_23_eot_user_creatures_in_play: string
#> oppo_turn_23_eot_oppo_creatures_in_play: string
#> oppo_turn_23_eot_user_non_creatures_in_play: string
#> oppo_turn_23_eot_oppo_non_creatures_in_play: string
#> oppo_turn_23_eot_user_life: float
#> oppo_turn_23_eot_oppo_life: float
#> user_turn_24_cards_drawn: string
#> user_turn_24_cards_tutored: string
#> user_turn_24_cards_discarded: string
#> user_turn_24_lands_played: string
#> user_turn_24_creatures_cast: string
#> user_turn_24_non_creatures_cast: string
#> user_turn_24_user_instants_sorceries_cast: string
#> user_turn_24_oppo_instants_sorceries_cast: string
#> user_turn_24_user_abilities: string
#> user_turn_24_oppo_abilities: string
#> user_turn_24_creatures_attacked: string
#> user_turn_24_creatures_blocked: string
#> user_turn_24_creatures_unblocked: string
#> user_turn_24_creatures_blocking: string
#> user_turn_24_oppo_combat_damage_taken: string
#> user_turn_24_user_combat_damage_taken: string
#> user_turn_24_user_creatures_killed_combat: string
#> user_turn_24_oppo_creatures_killed_combat: string
#> user_turn_24_user_creatures_killed_non_combat: string
#> user_turn_24_oppo_creatures_killed_non_combat: string
#> user_turn_24_user_mana_spent: float
#> user_turn_24_oppo_mana_spent: float
#> user_turn_24_eot_user_cards_in_hand: string
#> user_turn_24_eot_oppo_cards_in_hand: float
#> user_turn_24_eot_user_lands_in_play: string
#> user_turn_24_eot_oppo_lands_in_play: string
#> user_turn_24_eot_user_creatures_in_play: string
#> user_turn_24_eot_oppo_creatures_in_play: string
#> user_turn_24_eot_user_non_creatures_in_play: string
#> user_turn_24_eot_oppo_non_creatures_in_play: string
#> user_turn_24_eot_user_life: float
#> user_turn_24_eot_oppo_life: float
#> oppo_turn_24_cards_drawn: int8
#> oppo_turn_24_cards_tutored: int8
#> oppo_turn_24_cards_discarded: string
#> oppo_turn_24_lands_played: string
#> oppo_turn_24_creatures_cast: string
#> oppo_turn_24_non_creatures_cast: string
#> oppo_turn_24_user_instants_sorceries_cast: string
#> oppo_turn_24_oppo_instants_sorceries_cast: string
#> oppo_turn_24_user_abilities: string
#> oppo_turn_24_oppo_abilities: string
#> oppo_turn_24_creatures_attacked: string
#> oppo_turn_24_creatures_blocked: string
#> oppo_turn_24_creatures_unblocked: string
#> oppo_turn_24_creatures_blocking: string
#> oppo_turn_24_oppo_combat_damage_taken: string
#> oppo_turn_24_user_combat_damage_taken: string
#> oppo_turn_24_user_creatures_killed_combat: string
#> oppo_turn_24_oppo_creatures_killed_combat: string
#> oppo_turn_24_user_creatures_killed_non_combat: string
#> oppo_turn_24_oppo_creatures_killed_non_combat: string
#> oppo_turn_24_user_mana_spent: float
#> oppo_turn_24_oppo_mana_spent: float
#> oppo_turn_24_eot_user_cards_in_hand: string
#> oppo_turn_24_eot_oppo_cards_in_hand: float
#> oppo_turn_24_eot_user_lands_in_play: string
#> oppo_turn_24_eot_oppo_lands_in_play: string
#> oppo_turn_24_eot_user_creatures_in_play: string
#> oppo_turn_24_eot_oppo_creatures_in_play: string
#> oppo_turn_24_eot_user_non_creatures_in_play: string
#> oppo_turn_24_eot_oppo_non_creatures_in_play: string
#> oppo_turn_24_eot_user_life: float
#> oppo_turn_24_eot_oppo_life: float
#> user_turn_25_cards_drawn: string
#> user_turn_25_cards_tutored: string
#> user_turn_25_cards_discarded: string
#> user_turn_25_lands_played: string
#> user_turn_25_creatures_cast: string
#> user_turn_25_non_creatures_cast: string
#> user_turn_25_user_instants_sorceries_cast: string
#> user_turn_25_oppo_instants_sorceries_cast: string
#> user_turn_25_user_abilities: string
#> user_turn_25_oppo_abilities: string
#> user_turn_25_creatures_attacked: string
#> user_turn_25_creatures_blocked: string
#> user_turn_25_creatures_unblocked: string
#> user_turn_25_creatures_blocking: string
#> user_turn_25_oppo_combat_damage_taken: string
#> user_turn_25_user_combat_damage_taken: string
#> user_turn_25_user_creatures_killed_combat: string
#> user_turn_25_oppo_creatures_killed_combat: string
#> user_turn_25_user_creatures_killed_non_combat: string
#> user_turn_25_oppo_creatures_killed_non_combat: string
#> user_turn_25_user_mana_spent: float
#> user_turn_25_oppo_mana_spent: float
#> user_turn_25_eot_user_cards_in_hand: string
#> user_turn_25_eot_oppo_cards_in_hand: float
#> user_turn_25_eot_user_lands_in_play: string
#> user_turn_25_eot_oppo_lands_in_play: string
#> user_turn_25_eot_user_creatures_in_play: string
#> user_turn_25_eot_oppo_creatures_in_play: string
#> user_turn_25_eot_user_non_creatures_in_play: string
#> user_turn_25_eot_oppo_non_creatures_in_play: string
#> user_turn_25_eot_user_life: float
#> user_turn_25_eot_oppo_life: float
#> oppo_turn_25_cards_drawn: int8
#> oppo_turn_25_cards_tutored: int8
#> oppo_turn_25_cards_discarded: string
#> oppo_turn_25_lands_played: string
#> oppo_turn_25_creatures_cast: string
#> oppo_turn_25_non_creatures_cast: string
#> oppo_turn_25_user_instants_sorceries_cast: string
#> oppo_turn_25_oppo_instants_sorceries_cast: string
#> oppo_turn_25_user_abilities: string
#> oppo_turn_25_oppo_abilities: string
#> oppo_turn_25_creatures_attacked: string
#> oppo_turn_25_creatures_blocked: string
#> oppo_turn_25_creatures_unblocked: string
#> oppo_turn_25_creatures_blocking: string
#> oppo_turn_25_oppo_combat_damage_taken: string
#> oppo_turn_25_user_combat_damage_taken: string
#> oppo_turn_25_user_creatures_killed_combat: string
#> oppo_turn_25_oppo_creatures_killed_combat: string
#> oppo_turn_25_user_creatures_killed_non_combat: string
#> oppo_turn_25_oppo_creatures_killed_non_combat: string
#> oppo_turn_25_user_mana_spent: float
#> oppo_turn_25_oppo_mana_spent: float
#> oppo_turn_25_eot_user_cards_in_hand: string
#> oppo_turn_25_eot_oppo_cards_in_hand: float
#> oppo_turn_25_eot_user_lands_in_play: string
#> oppo_turn_25_eot_oppo_lands_in_play: string
#> oppo_turn_25_eot_user_creatures_in_play: string
#> oppo_turn_25_eot_oppo_creatures_in_play: string
#> oppo_turn_25_eot_user_non_creatures_in_play: string
#> oppo_turn_25_eot_oppo_non_creatures_in_play: string
#> oppo_turn_25_eot_user_life: float
#> oppo_turn_25_eot_oppo_life: float
#> user_turn_26_cards_drawn: string
#> user_turn_26_cards_tutored: string
#> user_turn_26_cards_discarded: string
#> user_turn_26_lands_played: string
#> user_turn_26_creatures_cast: string
#> user_turn_26_non_creatures_cast: string
#> user_turn_26_user_instants_sorceries_cast: string
#> user_turn_26_oppo_instants_sorceries_cast: string
#> user_turn_26_user_abilities: string
#> user_turn_26_oppo_abilities: string
#> user_turn_26_creatures_attacked: string
#> user_turn_26_creatures_blocked: string
#> user_turn_26_creatures_unblocked: string
#> user_turn_26_creatures_blocking: string
#> user_turn_26_oppo_combat_damage_taken: string
#> user_turn_26_user_combat_damage_taken: string
#> user_turn_26_user_creatures_killed_combat: string
#> user_turn_26_oppo_creatures_killed_combat: string
#> user_turn_26_user_creatures_killed_non_combat: string
#> user_turn_26_oppo_creatures_killed_non_combat: string
#> user_turn_26_user_mana_spent: float
#> user_turn_26_oppo_mana_spent: float
#> user_turn_26_eot_user_cards_in_hand: string
#> user_turn_26_eot_oppo_cards_in_hand: float
#> user_turn_26_eot_user_lands_in_play: string
#> user_turn_26_eot_oppo_lands_in_play: string
#> user_turn_26_eot_user_creatures_in_play: string
#> user_turn_26_eot_oppo_creatures_in_play: string
#> user_turn_26_eot_user_non_creatures_in_play: string
#> user_turn_26_eot_oppo_non_creatures_in_play: string
#> user_turn_26_eot_user_life: float
#> user_turn_26_eot_oppo_life: float
#> oppo_turn_26_cards_drawn: int8
#> oppo_turn_26_cards_tutored: int8
#> oppo_turn_26_cards_discarded: string
#> oppo_turn_26_lands_played: string
#> oppo_turn_26_creatures_cast: string
#> oppo_turn_26_non_creatures_cast: string
#> oppo_turn_26_user_instants_sorceries_cast: string
#> oppo_turn_26_oppo_instants_sorceries_cast: string
#> oppo_turn_26_user_abilities: string
#> oppo_turn_26_oppo_abilities: string
#> oppo_turn_26_creatures_attacked: string
#> oppo_turn_26_creatures_blocked: string
#> oppo_turn_26_creatures_unblocked: string
#> oppo_turn_26_creatures_blocking: string
#> oppo_turn_26_oppo_combat_damage_taken: string
#> oppo_turn_26_user_combat_damage_taken: string
#> oppo_turn_26_user_creatures_killed_combat: string
#> oppo_turn_26_oppo_creatures_killed_combat: string
#> oppo_turn_26_user_creatures_killed_non_combat: string
#> oppo_turn_26_oppo_creatures_killed_non_combat: string
#> oppo_turn_26_user_mana_spent: float
#> oppo_turn_26_oppo_mana_spent: float
#> oppo_turn_26_eot_user_cards_in_hand: string
#> oppo_turn_26_eot_oppo_cards_in_hand: float
#> oppo_turn_26_eot_user_lands_in_play: string
#> oppo_turn_26_eot_oppo_lands_in_play: string
#> oppo_turn_26_eot_user_creatures_in_play: string
#> oppo_turn_26_eot_oppo_creatures_in_play: string
#> oppo_turn_26_eot_user_non_creatures_in_play: string
#> oppo_turn_26_eot_oppo_non_creatures_in_play: string
#> oppo_turn_26_eot_user_life: float
#> oppo_turn_26_eot_oppo_life: float
#> user_turn_27_cards_drawn: string
#> user_turn_27_cards_tutored: string
#> user_turn_27_cards_discarded: string
#> user_turn_27_lands_played: string
#> user_turn_27_creatures_cast: string
#> user_turn_27_non_creatures_cast: string
#> user_turn_27_user_instants_sorceries_cast: string
#> user_turn_27_oppo_instants_sorceries_cast: string
#> user_turn_27_user_abilities: string
#> user_turn_27_oppo_abilities: string
#> user_turn_27_creatures_attacked: string
#> user_turn_27_creatures_blocked: string
#> user_turn_27_creatures_unblocked: string
#> user_turn_27_creatures_blocking: string
#> user_turn_27_oppo_combat_damage_taken: string
#> user_turn_27_user_combat_damage_taken: string
#> user_turn_27_user_creatures_killed_combat: string
#> user_turn_27_oppo_creatures_killed_combat: string
#> user_turn_27_user_creatures_killed_non_combat: string
#> user_turn_27_oppo_creatures_killed_non_combat: string
#> user_turn_27_user_mana_spent: float
#> user_turn_27_oppo_mana_spent: float
#> user_turn_27_eot_user_cards_in_hand: string
#> user_turn_27_eot_oppo_cards_in_hand: float
#> user_turn_27_eot_user_lands_in_play: string
#> user_turn_27_eot_oppo_lands_in_play: string
#> user_turn_27_eot_user_creatures_in_play: string
#> user_turn_27_eot_oppo_creatures_in_play: string
#> user_turn_27_eot_user_non_creatures_in_play: string
#> user_turn_27_eot_oppo_non_creatures_in_play: string
#> user_turn_27_eot_user_life: float
#> user_turn_27_eot_oppo_life: float
#> oppo_turn_27_cards_drawn: int8
#> oppo_turn_27_cards_tutored: int8
#> oppo_turn_27_cards_discarded: string
#> oppo_turn_27_lands_played: string
#> oppo_turn_27_creatures_cast: string
#> oppo_turn_27_non_creatures_cast: string
#> oppo_turn_27_user_instants_sorceries_cast: string
#> oppo_turn_27_oppo_instants_sorceries_cast: string
#> oppo_turn_27_user_abilities: string
#> oppo_turn_27_oppo_abilities: string
#> oppo_turn_27_creatures_attacked: string
#> oppo_turn_27_creatures_blocked: string
#> oppo_turn_27_creatures_unblocked: string
#> oppo_turn_27_creatures_blocking: string
#> oppo_turn_27_oppo_combat_damage_taken: string
#> oppo_turn_27_user_combat_damage_taken: string
#> oppo_turn_27_user_creatures_killed_combat: string
#> oppo_turn_27_oppo_creatures_killed_combat: string
#> oppo_turn_27_user_creatures_killed_non_combat: string
#> oppo_turn_27_oppo_creatures_killed_non_combat: string
#> oppo_turn_27_user_mana_spent: float
#> oppo_turn_27_oppo_mana_spent: float
#> oppo_turn_27_eot_user_cards_in_hand: string
#> oppo_turn_27_eot_oppo_cards_in_hand: float
#> oppo_turn_27_eot_user_lands_in_play: string
#> oppo_turn_27_eot_oppo_lands_in_play: string
#> oppo_turn_27_eot_user_creatures_in_play: string
#> oppo_turn_27_eot_oppo_creatures_in_play: string
#> oppo_turn_27_eot_user_non_creatures_in_play: string
#> oppo_turn_27_eot_oppo_non_creatures_in_play: string
#> oppo_turn_27_eot_user_life: float
#> oppo_turn_27_eot_oppo_life: float
#> user_turn_28_cards_drawn: string
#> user_turn_28_cards_tutored: string
#> user_turn_28_cards_discarded: string
#> user_turn_28_lands_played: string
#> user_turn_28_creatures_cast: string
#> user_turn_28_non_creatures_cast: string
#> user_turn_28_user_instants_sorceries_cast: string
#> user_turn_28_oppo_instants_sorceries_cast: string
#> user_turn_28_user_abilities: string
#> user_turn_28_oppo_abilities: string
#> user_turn_28_creatures_attacked: string
#> user_turn_28_creatures_blocked: string
#> user_turn_28_creatures_unblocked: string
#> user_turn_28_creatures_blocking: string
#> user_turn_28_oppo_combat_damage_taken: string
#> user_turn_28_user_combat_damage_taken: string
#> user_turn_28_user_creatures_killed_combat: string
#> user_turn_28_oppo_creatures_killed_combat: string
#> user_turn_28_user_creatures_killed_non_combat: string
#> user_turn_28_oppo_creatures_killed_non_combat: string
#> user_turn_28_user_mana_spent: float
#> user_turn_28_oppo_mana_spent: float
#> user_turn_28_eot_user_cards_in_hand: string
#> user_turn_28_eot_oppo_cards_in_hand: float
#> user_turn_28_eot_user_lands_in_play: string
#> user_turn_28_eot_oppo_lands_in_play: string
#> user_turn_28_eot_user_creatures_in_play: string
#> user_turn_28_eot_oppo_creatures_in_play: string
#> user_turn_28_eot_user_non_creatures_in_play: string
#> user_turn_28_eot_oppo_non_creatures_in_play: string
#> user_turn_28_eot_user_life: float
#> user_turn_28_eot_oppo_life: float
#> oppo_turn_28_cards_drawn: int8
#> oppo_turn_28_cards_tutored: int8
#> oppo_turn_28_cards_discarded: string
#> oppo_turn_28_lands_played: string
#> oppo_turn_28_creatures_cast: string
#> oppo_turn_28_non_creatures_cast: string
#> oppo_turn_28_user_instants_sorceries_cast: string
#> oppo_turn_28_oppo_instants_sorceries_cast: string
#> oppo_turn_28_user_abilities: string
#> oppo_turn_28_oppo_abilities: string
#> oppo_turn_28_creatures_attacked: string
#> oppo_turn_28_creatures_blocked: string
#> oppo_turn_28_creatures_unblocked: string
#> oppo_turn_28_creatures_blocking: string
#> oppo_turn_28_oppo_combat_damage_taken: string
#> oppo_turn_28_user_combat_damage_taken: string
#> oppo_turn_28_user_creatures_killed_combat: string
#> oppo_turn_28_oppo_creatures_killed_combat: string
#> oppo_turn_28_user_creatures_killed_non_combat: string
#> oppo_turn_28_oppo_creatures_killed_non_combat: string
#> oppo_turn_28_user_mana_spent: float
#> oppo_turn_28_oppo_mana_spent: float
#> oppo_turn_28_eot_user_cards_in_hand: string
#> oppo_turn_28_eot_oppo_cards_in_hand: float
#> oppo_turn_28_eot_user_lands_in_play: string
#> oppo_turn_28_eot_oppo_lands_in_play: string
#> oppo_turn_28_eot_user_creatures_in_play: string
#> oppo_turn_28_eot_oppo_creatures_in_play: string
#> oppo_turn_28_eot_user_non_creatures_in_play: string
#> oppo_turn_28_eot_oppo_non_creatures_in_play: string
#> oppo_turn_28_eot_user_life: float
#> oppo_turn_28_eot_oppo_life: float
#> user_turn_29_cards_drawn: string
#> user_turn_29_cards_tutored: string
#> user_turn_29_cards_discarded: string
#> user_turn_29_lands_played: string
#> user_turn_29_creatures_cast: string
#> user_turn_29_non_creatures_cast: string
#> user_turn_29_user_instants_sorceries_cast: string
#> user_turn_29_oppo_instants_sorceries_cast: string
#> user_turn_29_user_abilities: string
#> user_turn_29_oppo_abilities: string
#> user_turn_29_creatures_attacked: string
#> user_turn_29_creatures_blocked: string
#> user_turn_29_creatures_unblocked: string
#> user_turn_29_creatures_blocking: string
#> user_turn_29_oppo_combat_damage_taken: string
#> user_turn_29_user_combat_damage_taken: string
#> user_turn_29_user_creatures_killed_combat: string
#> user_turn_29_oppo_creatures_killed_combat: string
#> user_turn_29_user_creatures_killed_non_combat: string
#> user_turn_29_oppo_creatures_killed_non_combat: string
#> user_turn_29_user_mana_spent: float
#> user_turn_29_oppo_mana_spent: float
#> user_turn_29_eot_user_cards_in_hand: string
#> user_turn_29_eot_oppo_cards_in_hand: float
#> user_turn_29_eot_user_lands_in_play: string
#> user_turn_29_eot_oppo_lands_in_play: string
#> user_turn_29_eot_user_creatures_in_play: string
#> user_turn_29_eot_oppo_creatures_in_play: string
#> user_turn_29_eot_user_non_creatures_in_play: string
#> user_turn_29_eot_oppo_non_creatures_in_play: string
#> user_turn_29_eot_user_life: float
#> user_turn_29_eot_oppo_life: float
#> oppo_turn_29_cards_drawn: int8
#> oppo_turn_29_cards_tutored: int8
#> oppo_turn_29_cards_discarded: string
#> oppo_turn_29_lands_played: string
#> oppo_turn_29_creatures_cast: string
#> oppo_turn_29_non_creatures_cast: string
#> oppo_turn_29_user_instants_sorceries_cast: string
#> oppo_turn_29_oppo_instants_sorceries_cast: string
#> oppo_turn_29_user_abilities: string
#> oppo_turn_29_oppo_abilities: string
#> oppo_turn_29_creatures_attacked: string
#> oppo_turn_29_creatures_blocked: string
#> oppo_turn_29_creatures_unblocked: string
#> oppo_turn_29_creatures_blocking: string
#> oppo_turn_29_oppo_combat_damage_taken: string
#> oppo_turn_29_user_combat_damage_taken: string
#> oppo_turn_29_user_creatures_killed_combat: string
#> oppo_turn_29_oppo_creatures_killed_combat: string
#> oppo_turn_29_user_creatures_killed_non_combat: string
#> oppo_turn_29_oppo_creatures_killed_non_combat: string
#> oppo_turn_29_user_mana_spent: float
#> oppo_turn_29_oppo_mana_spent: float
#> oppo_turn_29_eot_user_cards_in_hand: string
#> oppo_turn_29_eot_oppo_cards_in_hand: float
#> oppo_turn_29_eot_user_lands_in_play: string
#> oppo_turn_29_eot_oppo_lands_in_play: string
#> oppo_turn_29_eot_user_creatures_in_play: string
#> oppo_turn_29_eot_oppo_creatures_in_play: string
#> oppo_turn_29_eot_user_non_creatures_in_play: string
#> oppo_turn_29_eot_oppo_non_creatures_in_play: string
#> oppo_turn_29_eot_user_life: float
#> oppo_turn_29_eot_oppo_life: float
#> user_turn_30_cards_drawn: string
#> user_turn_30_cards_tutored: string
#> user_turn_30_cards_discarded: string
#> user_turn_30_lands_played: string
#> user_turn_30_creatures_cast: string
#> user_turn_30_non_creatures_cast: string
#> user_turn_30_user_instants_sorceries_cast: string
#> user_turn_30_oppo_instants_sorceries_cast: string
#> user_turn_30_user_abilities: string
#> user_turn_30_oppo_abilities: string
#> user_turn_30_creatures_attacked: string
#> user_turn_30_creatures_blocked: string
#> user_turn_30_creatures_unblocked: string
#> user_turn_30_creatures_blocking: string
#> user_turn_30_oppo_combat_damage_taken: string
#> user_turn_30_user_combat_damage_taken: string
#> user_turn_30_user_creatures_killed_combat: string
#> user_turn_30_oppo_creatures_killed_combat: string
#> user_turn_30_user_creatures_killed_non_combat: string
#> user_turn_30_oppo_creatures_killed_non_combat: string
#> user_turn_30_user_mana_spent: float
#> user_turn_30_oppo_mana_spent: float
#> user_turn_30_eot_user_cards_in_hand: string
#> user_turn_30_eot_oppo_cards_in_hand: float
#> user_turn_30_eot_user_lands_in_play: string
#> user_turn_30_eot_oppo_lands_in_play: string
#> user_turn_30_eot_user_creatures_in_play: string
#> user_turn_30_eot_oppo_creatures_in_play: string
#> user_turn_30_eot_user_non_creatures_in_play: string
#> user_turn_30_eot_oppo_non_creatures_in_play: string
#> user_turn_30_eot_user_life: float
#> user_turn_30_eot_oppo_life: float
#> oppo_turn_30_cards_drawn: int8
#> oppo_turn_30_cards_tutored: int8
#> oppo_turn_30_cards_discarded: string
#> oppo_turn_30_lands_played: string
#> oppo_turn_30_creatures_cast: string
#> oppo_turn_30_non_creatures_cast: string
#> oppo_turn_30_user_instants_sorceries_cast: string
#> oppo_turn_30_oppo_instants_sorceries_cast: string
#> oppo_turn_30_user_abilities: string
#> oppo_turn_30_oppo_abilities: string
#> oppo_turn_30_creatures_attacked: string
#> oppo_turn_30_creatures_blocked: string
#> oppo_turn_30_creatures_unblocked: string
#> oppo_turn_30_creatures_blocking: string
#> oppo_turn_30_oppo_combat_damage_taken: string
#> oppo_turn_30_user_combat_damage_taken: string
#> oppo_turn_30_user_creatures_killed_combat: string
#> oppo_turn_30_oppo_creatures_killed_combat: string
#> oppo_turn_30_user_creatures_killed_non_combat: string
#> oppo_turn_30_oppo_creatures_killed_non_combat: string
#> oppo_turn_30_user_mana_spent: float
#> oppo_turn_30_oppo_mana_spent: float
#> oppo_turn_30_eot_user_cards_in_hand: string
#> oppo_turn_30_eot_oppo_cards_in_hand: float
#> oppo_turn_30_eot_user_lands_in_play: string
#> oppo_turn_30_eot_oppo_lands_in_play: string
#> oppo_turn_30_eot_user_creatures_in_play: string
#> oppo_turn_30_eot_oppo_creatures_in_play: string
#> oppo_turn_30_eot_user_non_creatures_in_play: string
#> oppo_turn_30_eot_oppo_non_creatures_in_play: string
#> oppo_turn_30_eot_user_life: float
#> oppo_turn_30_eot_oppo_life: float
#> user_total_cards_drawn: int8
#> user_total_cards_discarded: int8
#> user_total_lands_played: int8
#> user_total_cards_foretold: int8
#> user_total_creatures_cast: int8
#> user_total_non_creatures_cast: int8
#> user_total_instants_sorceries_cast: int8
#> user_total_cards_learned: int8
#> user_total_mana_spent: int32
#> oppo_total_cards_drawn: int8
#> oppo_total_cards_discarded: int8
#> oppo_total_lands_played: int8
#> oppo_total_cards_foretold: int8
#> oppo_total_creatures_cast: int8
#> oppo_total_non_creatures_cast: int8
#> oppo_total_instants_sorceries_cast: int8
#> oppo_total_cards_learned: int8
#> oppo_total_mana_spent: int32
#> deck_Abomination of Gudul: int8
#> deck_Abzan Ascendancy: int8
#> deck_Abzan Banner: int8
#> deck_Abzan Battle Priest: int8
#> deck_Abzan Charm: int8
#> deck_Abzan Falconer: int8
#> deck_Abzan Guide: int8
#> deck_Act of Treason: int8
#> deck_Ainok Bond-Kin: int8
#> deck_Ainok Tracker: int8
#> deck_Alabaster Kirin: int8
#> deck_Alpine Grizzly: int8
#> deck_Altar of the Brood: int8
#> deck_Anafenza, the Foremost: int8
#> deck_Ankle Shanker: int8
#> deck_Arc Lightning: int8
#> deck_Archers' Parapet: int8
#> deck_Armament Corps: int8
#> deck_Arrow Storm: int8
#> deck_Ashcloud Phoenix: int8
#> deck_Avalanche Tusker: int8
#> deck_Awaken the Bear: int8
#> deck_Barrage of Boulders: int8
#> deck_Bear's Companion: int8
#> deck_Become Immense: int8
#> deck_Bellowing Saddlebrute: int8
#> deck_Bitter Revelation: int8
#> deck_Blinding Spray: int8
#> deck_Bloodfell Caves: int8
#> deck_Bloodfire Expert: int8
#> deck_Bloodfire Mentor: int8
#> deck_Bloodsoaked Champion: int8
#> deck_Bloodstained Mire: int8
#> deck_Blossoming Sands: int8
#> deck_Brave the Sands: int8
#> deck_Briber's Purse: int8
#> deck_Bring Low: int8
#> deck_Burn Away: int8
#> deck_Butcher of the Horde: int8
#> deck_Cancel: int8
#> deck_Canyon Lurkers: int8
#> deck_Chief of the Edge: int8
#> deck_Chief of the Scale: int8
#> deck_Clever Impersonator: int8
#> deck_Crackling Doom: int8
#> deck_Cranial Archive: int8
#> deck_Crater's Claws: int8
#> deck_Crippling Chill: int8
#> deck_Dazzling Ramparts: int8
#> deck_Dead Drop: int8
#> deck_Death Frenzy: int8
#> deck_Debilitating Injury: int8
#> deck_Defiant Strike: int8
#> deck_Deflecting Palm: int8
#> deck_Despise: int8
#> deck_Dig Through Time: int8
#> deck_Disdainful Stroke: int8
#> deck_Dismal Backwater: int8
#> deck_Disowned Ancestor: int8
#> deck_Dragon Grip: int8
#> deck_Dragon Throne of Tarkir: int8
#> deck_Dragon's Eye Savants: int8
#> deck_Dragon-Style Twins: int8
#> deck_Dragonscale Boon: int8
#> deck_Duneblast: int8
#> deck_Dutiful Return: int8
#> deck_Efreet Weaponmaster: int8
#> deck_Embodiment of Spring: int8
#> deck_Empty the Pits: int8
#> deck_End Hostilities: int8
#> deck_Erase: int8
#> deck_Feat of Resistance: int8
#> deck_Feed the Clan: int8
#> deck_Firehoof Cavalry: int8
#> deck_Flooded Strand: int8
#> deck_Flying Crane Technique: int8
#> deck_Force Away: int8
#> deck_Forest: int8
#> deck_Frontier Bivouac: int8
#> deck_Ghostfire Blade: int8
#> deck_Glacial Stalker: int8
#> deck_Goblinslide: int8
#> deck_Grim Haruspex: int8
#> deck_Gurmag Swiftwing: int8
#> deck_Hardened Scales: int8
#> deck_Heart-Piercer Bow: int8
#> deck_Heir of the Wilds: int8
#> deck_Herald of Anafenza: int8
#> deck_High Sentinels of Arashin: int8
#> deck_Highland Game: int8
#> deck_Highspire Mantis: int8
#> deck_Hooded Hydra: int8
#> deck_Hooting Mandrills: int8
#> deck_Horde Ambusher: int8
#> deck_Hordeling Outburst: int8
#> deck_Howl of the Horde: int8
#> deck_Icefeather Aven: int8
#> deck_Icy Blast: int8
#> deck_Incremental Growth: int8
#> deck_Island: int8
#> deck_Ivorytusk Fortress: int8
#> deck_Jeering Instigator: int8
#> deck_Jeskai Ascendancy: int8
#> deck_Jeskai Banner: int8
#> deck_Jeskai Charm: int8
#> deck_Jeskai Elder: int8
#> deck_Jeskai Student: int8
#> deck_Jeskai Windscout: int8
#> deck_Jungle Hollow: int8
#> deck_Kheru Bloodsucker: int8
#> deck_Kheru Dreadmaw: int8
#> deck_Kheru Lich Lord: int8
#> deck_Kheru Spellsnatcher: int8
#> deck_Kill Shot: int8
#> deck_Kin-Tree Invocation: int8
#> deck_Kin-Tree Warden: int8
#> deck_Krumar Bond-Kin: int8
#> deck_Leaping Master: int8
#> deck_Lens of Clarity: int8
#> deck_Longshot Squad: int8
#> deck_Mantis Rider: int8
#> deck_Mardu Ascendancy: int8
#> deck_Mardu Banner: int8
#> deck_Mardu Blazebringer: int8
#> deck_Mardu Charm: int8
#> deck_Mardu Hateblade: int8
#> deck_Mardu Heart-Piercer: int8
#> deck_Mardu Hordechief: int8
#> deck_Mardu Roughrider: int8
#> deck_Mardu Skullhunter: int8
#> deck_Mardu Warshrieker: int8
#> deck_Master of Pearls: int8
#> deck_Master the Way: int8
#> deck_Meandering Towershell: int8
#> deck_Mer-Ek Nightblade: int8
#> deck_Mindswipe: int8
#> deck_Mistfire Weaver: int8
#> deck_Molting Snakeskin: int8
#> deck_Monastery Flock: int8
#> deck_Monastery Swiftspear: int8
#> deck_Mountain: int8
#> deck_Murderous Cut: int8
#> deck_Mystic Monastery: int8
#> deck_Mystic of the Hidden Way: int8
#> deck_Narset, Enlightened Master: int8
#> deck_Naturalize: int8
#> deck_Necropolis Fiend: int8
#> deck_Nomad Outpost: int8
#> deck_Opulent Palace: int8
#> deck_Pearl Lake Ancient: int8
#> deck_Pine Walker: int8
#> deck_Plains: int8
#> deck_Polluted Delta: int8
#> deck_Ponyback Brigade: int8
#> deck_Quiet Contemplation: int8
#> deck_Raiders' Spoils: int8
#> deck_Rakshasa Deathdealer: int8
#> deck_Rakshasa Vizier: int8
#> deck_Rakshasa's Secret: int8
#> deck_Rattleclaw Mystic: int8
#> deck_Retribution of the Ancients: int8
#> deck_Ride Down: int8
#> deck_Rite of the Serpent: int8
#> deck_Riverwheel Aerialists: int8
#> deck_Roar of Challenge: int8
#> deck_Rotting Mastodon: int8
#> deck_Rugged Highlands: int8
#> deck_Rush of Battle: int8
#> deck_Ruthless Ripper: int8
#> deck_Sage of the Inward Eye: int8
#> deck_Sage-Eye Harrier: int8
#> deck_Sagu Archer: int8
#> deck_Sagu Mauler: int8
#> deck_Salt Road Patrol: int8
#> deck_Sandsteppe Citadel: int8
#> deck_Sarkhan, the Dragonspeaker: int8
#> deck_Savage Knuckleblade: int8
#> deck_Savage Punch: int8
#> deck_Scaldkin: int8
#> deck_Scion of Glaciers: int8
#> deck_Scoured Barrens: int8
#> deck_Scout the Borders: int8
#> deck_Secret Plans: int8
#> deck_See the Unwritten: int8
#> deck_Seek the Horizon: int8
#> deck_Seeker of the Way: int8
#> deck_Set Adrift: int8
#> deck_Shambling Attendants: int8
#> deck_Shatter: int8
#> deck_Sidisi's Pet: int8
#> deck_Sidisi, Brood Tyrant: int8
#> deck_Siege Rhino: int8
#> deck_Siegecraft: int8
#> deck_Singing Bell Strike: int8
#> deck_Smite the Monstrous: int8
#> deck_Smoke Teller: int8
#> deck_Snowhorn Rider: int8
#> deck_Sorin, Solemn Visitor: int8
#> deck_Stubborn Denial: int8
#> deck_Sultai Ascendancy: int8
#> deck_Sultai Banner: int8
#> deck_Sultai Charm: int8
#> deck_Sultai Flayer: int8
#> deck_Sultai Scavenger: int8
#> deck_Sultai Soothsayer: int8
#> deck_Summit Prowler: int8
#> deck_Surrak Dragonclaw: int8
#> deck_Suspension Field: int8
#> deck_Swamp: int8
#> deck_Swarm of Bloodflies: int8
#> deck_Swift Kick: int8
#> deck_Swiftwater Cliffs: int8
#> deck_Taigam's Scheming: int8
#> deck_Take Up Arms: int8
#> deck_Temur Ascendancy: int8
#> deck_Temur Banner: int8
#> deck_Temur Charger: int8
#> deck_Temur Charm: int8
#> deck_Thornwood Falls: int8
#> deck_Thousand Winds: int8
#> deck_Throttle: int8
#> deck_Timely Hordemate: int8
#> deck_Tomb of the Spirit Dragon: int8
#> deck_Tormenting Voice: int8
#> deck_Trail of Mystery: int8
#> deck_Tranquil Cove: int8
#> deck_Trap Essence: int8
#> deck_Treasure Cruise: int8
#> deck_Trumpet Blast: int8
#> deck_Tusked Colossodon: int8
#> deck_Tuskguard Captain: int8
#> deck_Ugin's Nexus: int8
#> deck_Unyielding Krumar: int8
#> deck_Utter End: int8
#> deck_Valley Dasher: int8
#> deck_Venerable Lammasu: int8
#> deck_Villainous Wealth: int8
#> deck_War Behemoth: int8
#> deck_War-Name Aspirant: int8
#> deck_Warden of the Eye: int8
#> deck_Watcher of the Roost: int8
#> deck_Waterwhirl: int8
#> deck_Weave Fate: int8
#> deck_Wetland Sambar: int8
#> deck_Whirlwind Adept: int8
#> deck_Wind-Scarred Crag: int8
#> deck_Windstorm: int8
#> deck_Windswept Heath: int8
#> deck_Wingmate Roc: int8
#> deck_Winterflame: int8
#> deck_Witness of the Ages: int8
#> deck_Wooded Foothills: int8
#> deck_Woolly Loxodon: int8
#> deck_Zurgo Helmsmasher: int8
#> sideboard_Abomination of Gudul: int8
#> sideboard_Abzan Ascendancy: int8
#> sideboard_Abzan Banner: int8
#> sideboard_Abzan Battle Priest: int8
#> sideboard_Abzan Charm: int8
#> sideboard_Abzan Falconer: int8
#> sideboard_Abzan Guide: int8
#> sideboard_Act of Treason: int8
#> sideboard_Ainok Bond-Kin: int8
#> sideboard_Ainok Tracker: int8
#> sideboard_Alabaster Kirin: int8
#> sideboard_Alpine Grizzly: int8
#> sideboard_Altar of the Brood: int8
#> sideboard_Anafenza, the Foremost: int8
#> sideboard_Ankle Shanker: int8
#> sideboard_Arc Lightning: int8
#> sideboard_Archers' Parapet: int8
#> sideboard_Armament Corps: int8
#> sideboard_Arrow Storm: int8
#> sideboard_Ashcloud Phoenix: int8
#> sideboard_Avalanche Tusker: int8
#> sideboard_Awaken the Bear: int8
#> sideboard_Barrage of Boulders: int8
#> sideboard_Bear's Companion: int8
#> sideboard_Become Immense: int8
#> sideboard_Bellowing Saddlebrute: int8
#> sideboard_Bitter Revelation: int8
#> sideboard_Blinding Spray: int8
#> sideboard_Bloodfell Caves: int8
#> sideboard_Bloodfire Expert: int8
#> sideboard_Bloodfire Mentor: int8
#> sideboard_Bloodsoaked Champion: int8
#> sideboard_Bloodstained Mire: int8
#> sideboard_Blossoming Sands: int8
#> sideboard_Brave the Sands: int8
#> sideboard_Briber's Purse: int8
#> sideboard_Bring Low: int8
#> sideboard_Burn Away: int8
#> sideboard_Butcher of the Horde: int8
#> sideboard_Cancel: int8
#> sideboard_Canyon Lurkers: int8
#> sideboard_Chief of the Edge: int8
#> sideboard_Chief of the Scale: int8
#> sideboard_Clever Impersonator: int8
#> sideboard_Crackling Doom: int8
#> sideboard_Cranial Archive: int8
#> sideboard_Crater's Claws: int8
#> sideboard_Crippling Chill: int8
#> sideboard_Dazzling Ramparts: int8
#> sideboard_Dead Drop: int8
#> sideboard_Death Frenzy: int8
#> sideboard_Debilitating Injury: int8
#> sideboard_Defiant Strike: int8
#> sideboard_Deflecting Palm: int8
#> sideboard_Despise: int8
#> sideboard_Dig Through Time: int8
#> sideboard_Disdainful Stroke: int8
#> sideboard_Dismal Backwater: int8
#> sideboard_Disowned Ancestor: int8
#> sideboard_Dragon Grip: int8
#> sideboard_Dragon Throne of Tarkir: int8
#> sideboard_Dragon's Eye Savants: int8
#> sideboard_Dragon-Style Twins: int8
#> sideboard_Dragonscale Boon: int8
#> sideboard_Duneblast: int8
#> sideboard_Dutiful Return: int8
#> sideboard_Efreet Weaponmaster: int8
#> sideboard_Embodiment of Spring: int8
#> sideboard_Empty the Pits: int8
#> sideboard_End Hostilities: int8
#> sideboard_Erase: int8
#> sideboard_Feat of Resistance: int8
#> sideboard_Feed the Clan: int8
#> sideboard_Firehoof Cavalry: int8
#> sideboard_Flooded Strand: int8
#> sideboard_Flying Crane Technique: int8
#> sideboard_Force Away: int8
#> sideboard_Forest: int8
#> sideboard_Frontier Bivouac: int8
#> sideboard_Ghostfire Blade: int8
#> sideboard_Glacial Stalker: int8
#> sideboard_Goblinslide: int8
#> sideboard_Grim Haruspex: int8
#> sideboard_Gurmag Swiftwing: int8
#> sideboard_Hardened Scales: int8
#> sideboard_Heart-Piercer Bow: int8
#> sideboard_Heir of the Wilds: int8
#> sideboard_Herald of Anafenza: int8
#> sideboard_High Sentinels of Arashin: int8
#> sideboard_Highland Game: int8
#> sideboard_Highspire Mantis: int8
#> sideboard_Hooded Hydra: int8
#> sideboard_Hooting Mandrills: int8
#> sideboard_Horde Ambusher: int8
#> sideboard_Hordeling Outburst: int8
#> sideboard_Howl of the Horde: int8
#> sideboard_Icefeather Aven: int8
#> sideboard_Icy Blast: int8
#> sideboard_Incremental Growth: int8
#> sideboard_Island: int8
#> sideboard_Ivorytusk Fortress: int8
#> sideboard_Jeering Instigator: int8
#> sideboard_Jeskai Ascendancy: int8
#> sideboard_Jeskai Banner: int8
#> sideboard_Jeskai Charm: int8
#> sideboard_Jeskai Elder: int8
#> sideboard_Jeskai Student: int8
#> sideboard_Jeskai Windscout: int8
#> sideboard_Jungle Hollow: int8
#> sideboard_Kheru Bloodsucker: int8
#> sideboard_Kheru Dreadmaw: int8
#> sideboard_Kheru Lich Lord: int8
#> sideboard_Kheru Spellsnatcher: int8
#> sideboard_Kill Shot: int8
#> sideboard_Kin-Tree Invocation: int8
#> sideboard_Kin-Tree Warden: int8
#> sideboard_Krumar Bond-Kin: int8
#> sideboard_Leaping Master: int8
#> sideboard_Lens of Clarity: int8
#> sideboard_Longshot Squad: int8
#> sideboard_Mantis Rider: int8
#> sideboard_Mardu Ascendancy: int8
#> sideboard_Mardu Banner: int8
#> sideboard_Mardu Blazebringer: int8
#> sideboard_Mardu Charm: int8
#> sideboard_Mardu Hateblade: int8
#> sideboard_Mardu Heart-Piercer: int8
#> sideboard_Mardu Hordechief: int8
#> sideboard_Mardu Roughrider: int8
#> sideboard_Mardu Skullhunter: int8
#> sideboard_Mardu Warshrieker: int8
#> sideboard_Master of Pearls: int8
#> sideboard_Master the Way: int8
#> sideboard_Meandering Towershell: int8
#> sideboard_Mer-Ek Nightblade: int8
#> sideboard_Mindswipe: int8
#> sideboard_Mistfire Weaver: int8
#> sideboard_Molting Snakeskin: int8
#> sideboard_Monastery Flock: int8
#> sideboard_Monastery Swiftspear: int8
#> sideboard_Mountain: int8
#> sideboard_Murderous Cut: int8
#> sideboard_Mystic Monastery: int8
#> sideboard_Mystic of the Hidden Way: int8
#> sideboard_Narset, Enlightened Master: int8
#> sideboard_Naturalize: int8
#> sideboard_Necropolis Fiend: int8
#> sideboard_Nomad Outpost: int8
#> sideboard_Opulent Palace: int8
#> sideboard_Pearl Lake Ancient: int8
#> sideboard_Pine Walker: int8
#> sideboard_Plains: int8
#> sideboard_Polluted Delta: int8
#> sideboard_Ponyback Brigade: int8
#> sideboard_Quiet Contemplation: int8
#> sideboard_Raiders' Spoils: int8
#> sideboard_Rakshasa Deathdealer: int8
#> sideboard_Rakshasa Vizier: int8
#> sideboard_Rakshasa's Secret: int8
#> sideboard_Rattleclaw Mystic: int8
#> sideboard_Retribution of the Ancients: int8
#> sideboard_Ride Down: int8
#> sideboard_Rite of the Serpent: int8
#> sideboard_Riverwheel Aerialists: int8
#> sideboard_Roar of Challenge: int8
#> sideboard_Rotting Mastodon: int8
#> sideboard_Rugged Highlands: int8
#> sideboard_Rush of Battle: int8
#> sideboard_Ruthless Ripper: int8
#> sideboard_Sage of the Inward Eye: int8
#> sideboard_Sage-Eye Harrier: int8
#> sideboard_Sagu Archer: int8
#> sideboard_Sagu Mauler: int8
#> sideboard_Salt Road Patrol: int8
#> sideboard_Sandsteppe Citadel: int8
#> sideboard_Sarkhan, the Dragonspeaker: int8
#> sideboard_Savage Knuckleblade: int8
#> sideboard_Savage Punch: int8
#> sideboard_Scaldkin: int8
#> sideboard_Scion of Glaciers: int8
#> sideboard_Scoured Barrens: int8
#> sideboard_Scout the Borders: int8
#> sideboard_Secret Plans: int8
#> sideboard_See the Unwritten: int8
#> sideboard_Seek the Horizon: int8
#> sideboard_Seeker of the Way: int8
#> sideboard_Set Adrift: int8
#> sideboard_Shambling Attendants: int8
#> sideboard_Shatter: int8
#> sideboard_Sidisi's Pet: int8
#> sideboard_Sidisi, Brood Tyrant: int8
#> sideboard_Siege Rhino: int8
#> sideboard_Siegecraft: int8
#> sideboard_Singing Bell Strike: int8
#> sideboard_Smite the Monstrous: int8
#> sideboard_Smoke Teller: int8
#> sideboard_Snowhorn Rider: int8
#> sideboard_Sorin, Solemn Visitor: int8
#> sideboard_Stubborn Denial: int8
#> sideboard_Sultai Ascendancy: int8
#> sideboard_Sultai Banner: int8
#> sideboard_Sultai Charm: int8
#> sideboard_Sultai Flayer: int8
#> sideboard_Sultai Scavenger: int8
#> sideboard_Sultai Soothsayer: int8
#> sideboard_Summit Prowler: int8
#> sideboard_Surrak Dragonclaw: int8
#> sideboard_Suspension Field: int8
#> sideboard_Swamp: int8
#> sideboard_Swarm of Bloodflies: int8
#> sideboard_Swift Kick: int8
#> sideboard_Swiftwater Cliffs: int8
#> sideboard_Taigam's Scheming: int8
#> sideboard_Take Up Arms: int8
#> sideboard_Temur Ascendancy: int8
#> sideboard_Temur Banner: int8
#> sideboard_Temur Charger: int8
#> sideboard_Temur Charm: int8
#> sideboard_Thornwood Falls: int8
#> sideboard_Thousand Winds: int8
#> sideboard_Throttle: int8
#> sideboard_Timely Hordemate: int8
#> sideboard_Tomb of the Spirit Dragon: int8
#> sideboard_Tormenting Voice: int8
#> sideboard_Trail of Mystery: int8
#> sideboard_Tranquil Cove: int8
#> sideboard_Trap Essence: int8
#> sideboard_Treasure Cruise: int8
#> sideboard_Trumpet Blast: int8
#> sideboard_Tusked Colossodon: int8
#> sideboard_Tuskguard Captain: int8
#> sideboard_Ugin's Nexus: int8
#> sideboard_Unyielding Krumar: int8
#> sideboard_Utter End: int8
#> sideboard_Valley Dasher: int8
#> sideboard_Venerable Lammasu: int8
#> sideboard_Villainous Wealth: int8
#> sideboard_War Behemoth: int8
#> sideboard_War-Name Aspirant: int8
#> sideboard_Warden of the Eye: int8
#> sideboard_Watcher of the Roost: int8
#> sideboard_Waterwhirl: int8
#> sideboard_Weave Fate: int8
#> sideboard_Wetland Sambar: int8
#> sideboard_Whirlwind Adept: int8
#> sideboard_Wind-Scarred Crag: int8
#> sideboard_Windstorm: int8
#> sideboard_Windswept Heath: int8
#> sideboard_Wingmate Roc: int8
#> sideboard_Winterflame: int8
#> sideboard_Witness of the Ages: int8
#> sideboard_Wooded Foothills: int8
#> sideboard_Woolly Loxodon: int8
#> sideboard_Zurgo Helmsmasher: int8
#> user_n_games_bucket: int32
#> user_game_win_rate_bucket: float
#> oppo_turn_1_cards_drawn_or_tutored: int8
#> oppo_turn_2_cards_drawn_or_tutored: int8
#> oppo_turn_3_cards_drawn_or_tutored: int8
#> oppo_turn_4_cards_drawn_or_tutored: int8
#> oppo_turn_5_cards_drawn_or_tutored: int8
#> oppo_turn_6_cards_drawn_or_tutored: int8
#> oppo_turn_7_cards_drawn_or_tutored: int8
#> oppo_turn_8_cards_drawn_or_tutored: int8
#> oppo_turn_9_cards_drawn_or_tutored: int8
#> oppo_turn_10_cards_drawn_or_tutored: int8
#> oppo_turn_11_cards_drawn_or_tutored: int8
#> oppo_turn_12_cards_drawn_or_tutored: int8
#> oppo_turn_13_cards_drawn_or_tutored: int8
#> oppo_turn_14_cards_drawn_or_tutored: int8
#> oppo_turn_15_cards_drawn_or_tutored: int8
#> oppo_turn_16_cards_drawn_or_tutored: int8
#> oppo_turn_17_cards_drawn_or_tutored: int8
#> oppo_turn_18_cards_drawn_or_tutored: int8
#> oppo_turn_19_cards_drawn_or_tutored: int8
#> oppo_turn_20_cards_drawn_or_tutored: int8
#> oppo_turn_21_cards_drawn_or_tutored: int8
#> oppo_turn_22_cards_drawn_or_tutored: int8
#> oppo_turn_23_cards_drawn_or_tutored: int8
#> oppo_turn_24_cards_drawn_or_tutored: int8
#> oppo_turn_25_cards_drawn_or_tutored: int8
#> oppo_turn_26_cards_drawn_or_tutored: int8
#> oppo_turn_27_cards_drawn_or_tutored: int8
#> oppo_turn_28_cards_drawn_or_tutored: int8
#> oppo_turn_29_cards_drawn_or_tutored: int8
#> oppo_turn_30_cards_drawn_or_tutored: int8
#> oppo_total_cards_drawn_or_tutored: int8
```
