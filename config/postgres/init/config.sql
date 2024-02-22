CREATE TABLE tests (
                       id BIGSERIAL PRIMARY KEY,
                       delay INT,
                       queue TEXT,
                       team_id BIGINT,
                       user_id BIGINT,
                       description TEXT,
                       payload TEXT
);
