CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  color VARCHAR
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  title VARCHAR,
  publisher VARCHAR,
  cover_state VARCHAR,
  CONSTRAINT fk_genre_id FORIEGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_author_id FORIEGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_source_id FORIEGN KEY (source_id) REFERENCES sources(id),
  CONSTRAINT fk_label_id FORIEGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE geners(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  CONSTRAINT fk_genre_id FORIEGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_author_id FORIEGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_source_id FORIEGN KEY (source_id) REFERENCES sources(id),
  CONSTRAINT fk_label_id FORIEGN KEY (label_id) REFERENCES labels(id)
);



CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR
);


CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATETIME,
  CONSTRAINT fk_genre_id FORIEGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_author_id FORIEGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_source_id FORIEGN KEY (source_id) REFERENCES sources(id),
  CONSTRAINT fk_label_id FORIEGN KEY (label_id) REFERENCES labels(id)
);