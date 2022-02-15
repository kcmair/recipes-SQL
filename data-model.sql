CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  user_email VARCHAR(50) NOT NULL,
  time_of_creation TIMESTAMP,
  passwd VARCHAR(500)
);

CREATE TABLE ingredients(
  ingredient_id SERIAL PRIMARY KEY,
  name VARCHAR(75)
);

CREATE TABLE recipe(
  recipe_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  instructions VARCHAR(500),
  created TIMESTAMP NOT NULL,
  is_public BOOLEAN NOT NULL
);

CREATE TABLE grocery_list(
  grocery_list_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  created TIMESTAMP NOT NULL,
  status enum ('to get', 'purchased') default 'to get'
);

CREATE TABLE occasions(
  occasion_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(user_id),
  occasion VARCHAR(200)
);

CREATE TABLE recipe_ingredients(
  id SERIAL PRIMARY KEY,
  recipe_id INT NOT NULL REFERENCES recipe(recipe_id),
  ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
  amount FLOAT
);

CREATE TABLE grocery_list_ingredients(
  id SERIAL PRIMARY KEY,
  grocery_list_id INT NOT NULL REFERENCES grocery_list(grocery_list_id),
  ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
  amount FLOAT
);

CREATE TABLE occasions_recipes(
  id SERIAL PRIMARY KEY,
  occasion_id INT NOT NULL REFERENCES occasions(occasion_id),
  recipe_id INT NOT NULL REFERENCES recipe(recipe_id)
);