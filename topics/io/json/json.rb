require 'json'

fd = File.read 'test.json'
pp JSON.load fd