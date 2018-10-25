CREATE TABLE `MessageStore` (
	`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`payload` varchar(255) DEFAULT '',
	`createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
