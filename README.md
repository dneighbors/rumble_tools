# RumbleTools

A lightweight Ruby toolkit for parsing and managing Warcraft Rumble loadouts.

This gem is a Ruby port of [WarcraftRumbleLoadoutTools](https://github.com/Joobalee/WarcraftRumbleLoadoutTools), a C# library for decoding and encoding Warcraft Rumble deck strings.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rumble_tools'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install rumble_tools
```

## Usage

### Importing a loadout from a code

```ruby
require 'rumble_tools'

# Parse a loadout code
loadout = RumbleTools::Loadout.from_code("rumblo:CEMQABoECCYQAhoECBUQABoECF0QARoECAkQABoECB4QABoECFYQAQ==")

# Access leader information
puts "Leader: #{loadout.leader.mini_name}"
puts "Leader talent: #{loadout.leader.talent_name}"

# List troops
puts "Troops:"
loadout.troops.each do |troop|
  puts "- #{troop.mini_name} with talent #{troop.talent_name}"
end

# Convert to JSON
require 'json'
puts JSON.pretty_generate(loadout.to_h)
```

### Creating a loadout from scratch

```ruby
require 'rumble_tools'
include RumbleTools

# Create a loadout with Sylvanas as leader and the "WAIL_OF_THE_BANSHEE" talent
leader = Leader.new(Mini::SYLVANAS, 2)
loadout = Loadout.new(leader)

# Add troops to the loadout
loadout.troops = [
  Troop.new(Mini::DIRE_BATLINGS, 0),        # Using talent index 0
  Troop.new(Mini::ANGRY_CHICKENS, 1),       # Using talent index 1
  Troop.new(Mini::GHOUL, 0),                # Using talent index 0
  Troop.new(Mini::DEEP_BREATH, 1),          # Using talent index 1
  Troop.new(Mini::CHAIN_LIGHTNING, 2),      # Using talent index 2
  Troop.new(Mini::NECROMANCER, 0)           # Using talent index 0
]

# Generate a loadout code
loadout_code = loadout.to_code
puts "Loadout code: #{loadout_code}"
```

## Available Minis and Talents

The gem includes constants for all minis and talents available in Warcraft Rumble. You can access them through the `Mini` and `MiniTalent` modules.

Examples:
```ruby
RumbleTools::Mini::SYLVANAS       # => 0x52
RumbleTools::Mini::DIRE_BATLINGS  # => 0x1E
RumbleTools::Mini::ANGRY_CHICKENS # => 0x01
```

Talents can be referenced by their index (0, 1, or 2) or by their full talent ID:
```ruby
# Get talent ID for Dire Batlings' first talent (GUANO_HAPPENS)
talent_id = RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::DIRE_BATLINGS, 0)
```

## Examples

Check the examples directory for more usage patterns:

```bash
ruby -I lib examples/basic_usage.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/dneighbors/rumble_tools](https://github.com/dneighbors/rumble_tools).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
