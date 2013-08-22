DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/sinatra-test")

#class Person
#  include DataMapper::Resource
#  property :id, Serial
#  property :firstname, String
#end

DataMapper.finalize
#DataMapper.auto_upgrade!