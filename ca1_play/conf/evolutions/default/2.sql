# --- Sample dataset
 
# --- !Ups
 
delete from ProjectType;
 
insert into Project (name) values ( 'Role Playing Game' );
insert into Project (name) values ( 'Massively Multiplayer Online' );
insert into Project (name) values ( 'First Person Shooter' );
insert into Project (name) values ( 'Real-time Strategy' );
insert into Project (name) values ( 'Adventure Game' );
insert into Project (name) values ( 'Action Game' );
insert into Project (name) values ( 'Action Adventure Game' );

 
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Counter-Strike',' A competitive shooter where players can play against each other online ',89, 20.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Skyrim','A amazing role playing game where you traverse an open map to find loot and upgrade your equipment as you fight through endless quests',65,15.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Elder Scrolls Online','Using the same game mechanics as another game called skyrim but this time you play online to fight other players',100,40.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Ruse','A WW2 strategy game where you are the general of a nations army. Take control of resources to build up an amry to defeat your foes',15,8.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'No man sky','Take flight into space into a world that will never stop generting more planets and lifeform for you to discover',75,33.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Rainbow six seige','Play within a squad in which your goal is to elimanate the oposing team',34,50.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Batman Arkham city','Take action as gothams dark knight to find crime and solve puzzles',28,22.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Battlefield 1','Take part in large scale warfare in WW1',266,75.00 );
insert into PROJECT_TYPE (name,description,stock,price) values ( 'Broforce','Take part in a 8-bit game with legends from movies',99,5.00 );


insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (3,1);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (1,2);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (2,3);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (4,4);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (5,5);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (6,6);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (7,7);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (3,8);
insert into PROJECT_PROJECT_TYPE(project_id,project_type_id) values (6,9);