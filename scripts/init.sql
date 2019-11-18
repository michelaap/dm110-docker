create database dm110;

\c dm110

create table estado (
    ibge int not null,
    sigla varchar(2) not null,
    nome varchar(30) not null,
    area float not null,
    primary key (ibge)
);

\l