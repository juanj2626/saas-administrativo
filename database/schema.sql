create database if not exists `SaaS` default character set utf8mb4 collate utf8mb4_general_ci;
use `SaaS`;

create table `users` (
  `id` int unsigned not null auto_increment,
  `username` varchar(255) UNIQUE not null,
  `email` varchar(255) UNIQUE not null,
  `password` varchar(255) not null,
  `rol` enum('admin', 'user') not null default 'user',
  primary key (`id`)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;

create table `distribuidor` (
    `id` int unsigned not null auto_increment,
    `name` varchar(255) not null,
    `contact_info` text,
    primary key (`id`)
    ) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;

create table `products` (
  `id` int unsigned not null auto_increment,
  `name` varchar(255) not null,
  `description` text,
  `stock` int unsigned not null default 0,
  `price` decimal(10,2) not null,
  `distribuidor_id` int unsigned,
    foreign key (`distribuidor_id`) references `distribuidor` (`id`),
  primary key (`id`)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;

-- Tabla para registrar las ventas realizadas por los usuarios
-- revisar manana 2/06/2026
create table `sale` (

    `id` int unsigned not null auto_increment,
    `user_id` int unsigned not null,
    `quantity` int not null,
    `total` decimal(10,2) not null,
    `date` datetime not null default current_timestamp,
    primary key (`id`),
    foreign key (`user_id`) references `users` (`id`)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;

create table `sale_product` (
    `sale_id` int unsigned not null,
    `product_id` int unsigned not null,
    `quantity` int not null,
    `subtotal` decimal(10,2) not null,
    primary key (`sale_id`, `product_id`),
    foreign key (`sale_id`) references `sale` (`id`),
    foreign key (`product_id`) references `products` (`id`)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_general_ci;


