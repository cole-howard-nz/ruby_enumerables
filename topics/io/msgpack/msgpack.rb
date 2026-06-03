require 'msgpack'

m = {:height => 32, :width => 32, :depth => 32}.to_msgpack
p m

obj = MessagePack.unpack(m)
p obj
p obj['height']