CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  -- first_name varchar,
  -- last_name varchar,
  username varchar,
  password_hash varchar,
  registration_date date
);

-- CREATE TABLE roles (
--   id SERIAL PRIMARY KEY,
--   name varchar
-- );

-- CREATE TABLE users_to_roles (
--   "user_id int,
--   "role_id" int
-- );

-- CREATE TABLE "permissions" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar
-- );

-- CREATE TABLE "roles_to_permissions" (
--   "role_id" int,
--   "permission_id" int
-- );

CREATE TABLE stories (
  id SERIAL PRIMARY KEY,
  title varchar,
  description varchar,
  -- "creation_date" date,
  author_id int,
  start_scene_id int,
);

CREATE TABLE scenes (
  id SERIAL PRIMARY KEY,
  title varchar,
  text varchar,
  story_id int
);

CREATE TABLE user_progress (
  user_id int not null,
  story_id int not null,
  scene_id int not null,
  PRIMARY KEY(user_id, story_id)
);

CREATE TABLE choices (
  id SERIAL PRIMARY KEY,
  title varchar,
  text varchar,
  scene_id int,
  next_scene_id int
);

-- ALTER TABLE "users_to_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- ALTER TABLE "users_to_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

-- ALTER TABLE "roles_to_permissions" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

-- ALTER TABLE "roles_to_permissions" ADD FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id");

ALTER TABLE stories ADD FOREIGN KEY (author_id) REFERENCES users (id);

ALTER TABLE stories ADD FOREIGN KEY (start_scene_id) REFERENCES scenes (id);

ALTER TABLE scenes ADD FOREIGN KEY (story_id) REFERENCES stories (id);

ALTER TABLE user_progress ADD FOREIGN KEY (user_id) REFERENCES users (id);

ALTER TABLE user_progress ADD FOREIGN KEY (story_id) REFERENCES stories (id);

ALTER TABLE user_progress ADD FOREIGN KEY (scene_id) REFERENCES scenes (id);

ALTER TABLE choices ADD FOREIGN KEY (scene_id) REFERENCES scenes (id);

ALTER TABLE choices ADD FOREIGN KEY (next_scene_id) REFERENCES scenes (id);

