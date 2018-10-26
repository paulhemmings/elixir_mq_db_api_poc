CREATE TABLE `MessageStore` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`payload` varchar(255) DEFAULT '',
	`createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `CryptoStore` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coinName` varchar(255) DEFAULT '',
  `coinId` varchar(255) DEFAULT '',
  `imageUrl` varchar(255) DEFAULT '',
  `isTrading` varchar(255) DEFAULT '',
  `symbol` varchar(255) DEFAULT '',
  `total_coin_supply` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8;
