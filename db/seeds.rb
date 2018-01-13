require 'csv'

def escape_query(value)
  if value
    '"' + value.gsub('"', '') + '"'
  else
    'NULL'
  end
end

%w(media genres media_rankings).each do |klass|
  ActiveRecord::Base.connection.execute("DELETE FROM #{klass}")
  puts "Import #{klass}"

  file = Rails.root.join('db/fixtures').join(klass + '.csv')
  sql = "INSERT INTO #{klass} VALUES"
  list = CSV.readlines(file, headers: true).map do |row|
    line = row.to_hash.values.map { |r| escape_query(r) }.join(',')
    "(#{line})"
  end
  sql += list.join(',')
  ActiveRecord::Base.connection.execute(sql)
end

puts "Complete: media => #{Medium.count}, genre => #{Genre.count}, media_rankings => #{MediaRanking.count}"
