del C:\mongodb\data\mongod.lock
del C:\mongodb\data\db\mongod.lock
C:\mongodb\bin\mongod --repair
C:\mongodb\bin\mongod -v --dbpath "C:\mongodb\data\db"
pause