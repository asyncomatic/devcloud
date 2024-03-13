CREATE TABLE jobs (
                       id BIGSERIAL PRIMARY KEY,
                       delay INT,
                       queue TEXT,
                       class TEXT,
                       method TEXT,
                       retry_count INT,
                       state TEXT
);
