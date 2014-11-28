require "rubygems"
require "bundler"
require "digest/sha2"

Bundler.require

$db = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/integer-club')

get %r{ .* }ixm do
  key = Digest::SHA2.hexdigest(request.url)

  result =
    begin
      $db["INSERT INTO integers (key, value) VALUES (?, ?) RETURNING value", key, 1].to_a
    rescue Sequel::UniqueConstraintViolation
      $db["UPDATE integers SET value = value + 1 WHERE key = ? RETURNING value", key].to_a
    end

  content_type "application/json"

  result[0][:value].to_s
end
