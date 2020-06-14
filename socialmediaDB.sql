create database if not exists users;

use customers;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

CREATE TABLE users(
	userid int(20) not null auto_increment,
	username varchar(20) not null,
	user_email varchar(100) not null,
	user_password varchar(20),
	primary key (userid)
);

CREATE TABLE posts(
	postid int(11) not null auto_increment,
    userid int(20) not null,
	post_content TEXT(300) not null,
    post_time datetime default current_timestamp,
	primary key (postid),
    foreign key (userid) references users(userid)
);

CREATE TABLE comments(
	commentid int(11) not null auto_increment,
    userid int(20) not null,
	postid int(11) not null,
    comment_conent TEXT(300) not null,
	comment_time datetime default current_timestamp,
	primary key (commentid),
    foreign key (userid) references users(userid),
    foreign key (postid) references posts(postid)
);