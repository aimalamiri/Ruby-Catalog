CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  color VARCHAR,
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
  CONSTRAINT fk_label_id FORIEGN KEY (label_id) REFERENCES labels(id),
);
