require 'yaml'

fd = File.read 'test.yaml'
yaml = YAML.load fd

pp yaml