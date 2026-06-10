if [1,2,3] in [1,2, *]
  p 'hello'
end

test = [0,1,2,3,4] => [*,1,2,Integer,*]
p test

config = {db: {user: 'admin', password: 'Password123'}, connection: {url: 'db_engine://username:password@host:port/database_name'}}
config => db: {user:}, connection: {url:}
puts "Connecting to #{ url } with user #{ user }"

users = [
         {name: 'Cole Howard', age: 22, permissions: '*', title: 'Owner'},
         {name: 'Liam Prescott', age: 22, permissions: 'perms.admin.*', title: 'Administrator'},
         {name: 'Bronson Sammut', age: 21, permissions: 'perms.mod.*', title: 'Moderator'},
         {name: 'Cole Coward', age: 19, permissions: 'perms.vip.*', title: 'VIP'},
         {name: 'Cole Jeward', age: 15, permissions: 'perms.basic.*', title: 'Basic'},
         {name: 'Cole Coleward', age: 25, permissions: 'perms.user.*', title: 'User'}

        ]
puts users.select { |user| user in {name: /Cole/, age: 19.., title: /[^User]/} }

case {a: 1, b: 2}
  in {a: Integer, **nil}
    p "first one is an integer, rest doesn't matter"
  in {a: Integer, b: Integer, **nil}
    p "first two are integers, and there is no other elements in hash"
end


[1,2] => a,b
p a, b

[1,2] in a,b
p 'yep', a,b

{a: 1, b: 2, c: 3} => a
p a

{a: 1, b: 2, c: 3} in a
p 'yop', a

case {a: 1, b: 2}
in {a: _, b: _foo} | Array
  p "matched: #{ _foo }"
in Hash => a
  p "matched: #{a}"
else
  p "not matched"
end