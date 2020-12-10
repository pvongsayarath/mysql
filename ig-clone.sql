drop database instagram;
create database instagram;
use instagram;

Create Table users(
	id INT auto_increment primary key,
	username VARCHAR(255) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT NOW()
);

Create Table photos(
	id INT auto_increment primary key,
	image_url VARCHAR(255) NOT NULL,
	user_id INT NOT NULL,
	created_at timestamp default NOW(),
	foreign key(user_id) REFERENCES users(id)
);

Create Table comments(
	id INT auto_increment primary key,
	comment_text VARCHAR(255) NOT NULL,
	user_id INT NOT NULL,
	photo_id INT NOT NULL,
	created_at timestamp default NOW(),
	foreign key(user_id) references users(id),
	foreign key(photo_id) references photos(id)	
);

Create Table likes(
	user_id INT NOT NULL,
	photo_id INT NOT NULL,
	created_at timestamp DEFAULT NOW(),
	foreign key(user_id) references users(id),
	foreign key(photo_id) references photos(id),
	primary key(user_id, photo_id)
);

Create Table follows(
	follower_id INT NOT NULL,
	following_id INT NOT NULL,
	created_at timestamp DEFAULT NOW(),
	foreign key(follower_id) references users(id),
	foreign key(following_id) references users(id),
	primary key(follower_id, following_id)
);

Create Table tags(
	id INT AUTO_INCREMENT primary key,
	tag_name VARCHAR(255) Unique,
	created_at timestamp DEFAULT NOW()
);

Create Table photo_tags(
	photo_id INT NOT NULL,
	tag_id INT NOT NULL,
	foreign key(photo_id) references photos(id),
	foreign key(tag_id) references tags(id),
	primary key(photo_id, tag_id)
);










