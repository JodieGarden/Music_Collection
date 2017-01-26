require('pg')


class Album

  attr_accessor :title, :genre, :artist_id

  def initialize(options)

    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i

  end

  def save()
    db = PG.connect({ dbname: 'music_collection', host: 'localhost'})
    sql = "INSERT INTO album (title, genre, artist_id) VALUES ('#{title}', '#{genre}', '#{artist_id}') returning *;"
    result = db.exec(sql)
    @id = result.first['id'].to_i
    db.close
  end
end




