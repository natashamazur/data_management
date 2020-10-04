create table films (title text, 
                    id bigint primary key, 
                    country text,
                    box_office numeric(15,2), 
                    release_date date);
create table persons (id bigint primary key,
                      fio text);
create table persons2content (person_id bigint,
                              film_id bigint,
                              person_type text,
                              CONSTRAINT fk_person_id
							FOREIGN KEY(person_id) 
							REFERENCES persons(id),
                              CONSTRAINT fk_film_id
							FOREIGN KEY(film_id) 
							REFERENCES films(id));
insert into films values ('Побег из Шоушенка',1,'США',28418687,'10-09-1994');
insert into films values ('Зеленая миля',2,'США',136801374,'06-12-1999');
insert into films values ('Король лев',3,'США',763455561,'12-06-1994');
insert into films values ('Титаник',4,'США',1843221532,'01-11-1997');
insert into films values ('Ходячий замок',5,'Япония',235347345,'05-09-2004');
insert into persons values (1,'Фрэнк Дарабонт');
insert into persons values (2,'Тим Роббинс');
insert into persons values (3,'Морган Фриман');
insert into persons values (4,'Стивен Кинг');
insert into persons values (5,'Том Хэнкс');
insert into persons values (6,'Роджер Аллерс');
insert into persons values (7,'Леонардо ДиКаприо');
insert into persons values (8,'Джеймс Кэмерон');
insert into persons values (9,'Кейт Уинслет');
insert into persons values (10,'Хаяо Миядзаки');
insert into persons2content values (1,1,'Режиссер');
insert into persons2content values (2,1,'Актер');
insert into persons2content values (3,1,'Актер');
insert into persons2content values (4,1,'Сценарист');
insert into persons2content values (1,2,'Режиссер');
insert into persons2content values (4,2,'Сценарист');
insert into persons2content values (5,2,'Актер');
insert into persons2content values (6,3,'Режиссер');
insert into persons2content values (7,4,'Актер');
insert into persons2content values (8,4,'Режиссер');
insert into persons2content values (9,4,'Актриса');
insert into persons2content values (10,5,'Режиссер');
