#!/usr/bin/env ruby

require_relative 'lib/parse_config'
require_relative 'lib/parse_bridge_table'

require 'awesome_print'
require 'hash_deep_merge'

config_parser = SwitchConfigParser.new(IO.readlines("../data/switch.config"))
config_parser.parse_config
#ap config_parser.get_interfaces

bridge_table_parser = SwitchBridgeTableParser.new(IO.readlines("../data/bridge_table.config"))
bridge_table_parser.parse_config
#ap bridge_table_parser.get_interfaces

ap config_parser.get_interfaces.deep_merge(bridge_table_parser.get_interfaces)