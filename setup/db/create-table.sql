CREATE TABLE `MessageStore` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`payload` varchar(255) DEFAULT '',
	`createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- mysql

CREATE TABLE `CryptoStore` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coin_name` varchar(255) DEFAULT '',
  `coin_id` varchar(255) DEFAULT '',
  `image_url` varchar(255) DEFAULT '',
  `is_trading` varchar(255) DEFAULT '',
  `symbol` varchar(255) DEFAULT '',
  `total_coin_supply` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8;

-- postgreSQL

CREATE TABLE CryptoStore (
  id SERIAL PRIMARY KEY,
  coin_name varchar(255) DEFAULT '',
  coin_id varchar(255) DEFAULT '',
  image_url varchar(255) DEFAULT '',
  is_trading varchar(255) DEFAULT '',
  symbol varchar(255) DEFAULT '',
  total_coin_supply varchar(255) DEFAULT '',
  url varchar(255) DEFAULT '',
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
