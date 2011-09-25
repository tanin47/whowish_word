# encoding: utf-8
module MongoidHelper
  def commit_database(fsync=true)
    Mongoid.database.command({:getlasterror => 1,:fsync=>true})
  end
end