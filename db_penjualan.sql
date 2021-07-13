# Host: localhost  (Version 5.5.5-10.4.14-MariaDB)
# Date: 2021-06-16 20:22:24
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "cupang"
#

DROP TABLE IF EXISTS `cupang`;
CREATE TABLE `cupang` (
  `id_cupang` int(11) NOT NULL AUTO_INCREMENT,
  `nama_cupang` text NOT NULL,
  `harga_cupang` text NOT NULL,
  `gambar_cupang` text NOT NULL,
  PRIMARY KEY (`id_cupang`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

#
# Data for table "cupang"
#

INSERT INTO `cupang` VALUES (1,'Cupang HalfMoon','20000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-halfmoon-1-696x459.jpg'),(2,'Cupang Serit','30000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-crown-tail.jpg'),(3,'Cupang Double Tail','40000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-double-tail.jpg'),(4,'Cupang HMPK','50000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-hmpk.jpg'),(5,'Cupang Sawah','60000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-sawah.jpg'),(6,'Cupang Paradise','70000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-paradise-675x420.jpg'),(7,'Cupang Sarawak','80000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-sarawak.jpg'),(8,'Cupang Ikang Fancy','90000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-fancy-696x463.jpg'),(9,'Cupang Surga/ albino','100000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-surga.jpg'),(10,'Cupang Emas / Golden','110000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-emas.jpg'),(11,'Cupang Veil Tail / Ekor Mewah','120000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-veiltail-653x420.jpg'),(12,'Cupang Coccina / Cupang Belgi Bangkok','130000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-coccina.jpg'),(13,'Cupang Slayer','140000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-slayer-768x488.jpg'),(14,'Cupang Plakat / Cupang Koi','150000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-plakat.jpg'),(15,'Cupang Spade Tail / Ekor Lancip','160000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-spade-tail.jpg'),(16,'Cupang Halfsun','170000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-halfsun.jpg'),(17,'Cupang Over HalfMoon','180000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-over-halfmoon.jpg'),(18,'Cupang Dumbo / Big Ear','190000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-dumbo.jpg'),(19,'Cupang Snakehead (Betta channoides)','200000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-snakehead.jpg'),(20,'Cupang Giant','210000','https://www.ruparupa.com/blog/wp-content/uploads/2020/08/jenis-ikan-cupang-giant.jpg');

#
# Structure for table "nota"
#

DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis_ikan` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

#
# Data for table "nota"
#

INSERT INTO `nota` VALUES (1,'bharata','halfmoon',50000,'Berhasil','2021-05-29'),(7,'intan','hellboy',100000,'Berhasil','2021-05-31');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','user','','') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (35,'wendy halim','wewen','547ba58dbfd1a1cdbc0c391baff4160b91f741b4','user'),(36,'wendy halim','akusukaacc','0585bc97738b7ffa2e53fead4cd080be59ed9f32','user');

#
# Structure for table "penjualan"
#

DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_cupang` int(11) NOT NULL,
  `nama_pembeli` varchar(100) NOT NULL,
  `notelp_pembeli` varchar(100) NOT NULL,
  `alamat_pembeli` varchar(100) NOT NULL,
  `harga_penjualan` varchar(100) NOT NULL,
  `approve` varchar(100) NOT NULL,
  PRIMARY KEY (`id_penjualan`) USING BTREE,
  KEY `id_cupang` (`id_cupang`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_cupang`) REFERENCES `cupang` (`id_cupang`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

#
# Data for table "penjualan"
#

INSERT INTO `penjualan` VALUES (1,35,20,'wendy','0895391224471','jl.ceger raya','2.000.000','true'),(2,36,20,'wewen','098958458','jl.ada','350.000','false'),(3,35,16,'havys','089523481','jl.tajur','500.000','true'),(4,35,11,'udin','085421612348','jl.ciledug raya','600.000','false'),(5,36,4,'bharata','0857468396','j. kokoko dadada','700.000','false'),(6,35,17,'alip','08648932','jl. kodok','800.000','false'),(7,36,7,'zndy','089545741125','jl.kokokokoko','500000','true');
