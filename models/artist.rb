require('pg')


class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "INSERT INTO artist(name) VALUES ('#{name}') returning *;"
    result = db.exec(sql)
    @id = result.first['id'].to_i
    db.close
  end

  def self.all()
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "SELECT * FROM artist"
    singer = db.exec(sql)
    db.close
    return singer.map{|singer| Artist.new(singer)}
  end

  def self.delete_all()
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "DELETE FROM artist"
    db.exec(sql)
    db.close
  end

  def self.delete()
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "DELETE FROM artist WHERE id = #{@id}"
    db.exec(sql)
    db.close
  end
end