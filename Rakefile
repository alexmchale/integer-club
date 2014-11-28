require "rubygems"
require "sequel"

$db = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/integer-club')

namespace :db do
  task :setup do
    $db[<<-SQL].to_a
      CREATE TABLE integers (
        key CHAR(64),
        value BIGINT NOT NULL DEFAULT 0
      );
      CREATE UNIQUE INDEX integers_idx ON integers (key);
    SQL
  end
end
