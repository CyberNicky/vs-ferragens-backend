-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: vsferragens
-- ------------------------------------------------------
-- Server version	5.7.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Budget`
--

DROP TABLE IF EXISTS `Budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Budget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Budget_productId_fkey` (`productId`),
  CONSTRAINT `Budget_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Budget`
--

LOCK TABLES `Budget` WRITE;
/*!40000 ALTER TABLE `Budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `Budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BudgetField`
--

DROP TABLE IF EXISTS `BudgetField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BudgetField` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inputId` int(11) NOT NULL,
  `budgetId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `BudgetField_id_key` (`id`),
  KEY `BudgetField_inputId_fkey` (`inputId`),
  KEY `BudgetField_budgetId_fkey` (`budgetId`),
  CONSTRAINT `BudgetField_budgetId_fkey` FOREIGN KEY (`budgetId`) REFERENCES `Budget` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `BudgetField_inputId_fkey` FOREIGN KEY (`inputId`) REFERENCES `Input` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BudgetField`
--

LOCK TABLES `BudgetField` WRITE;
/*!40000 ALTER TABLE `BudgetField` DISABLE KEYS */;
/*!40000 ALTER TABLE `BudgetField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Input`
--

DROP TABLE IF EXISTS `Input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Input` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('TEXT','NUMBER','SELECT') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Input_id_key` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Input`
--

LOCK TABLES `Input` WRITE;
/*!40000 ALTER TABLE `Input` DISABLE KEYS */;
INSERT INTO `Input` VALUES (1,'Nome do Cliente','TEXT'),(2,'Largura','NUMBER'),(3,'Altura','NUMBER'),(4,'Cor do Alumínio','SELECT'),(5,'Tipo de portão','SELECT'),(6,'Modelo de portão','SELECT'),(7,'Modelo de lambri','SELECT'),(8,'Cor do vidro','SELECT'),(9,'Modelo de motor','SELECT'),(10,'Tipo de janela','SELECT'),(11,'Modelo de janela','SELECT'),(12,'Telefone/Whatsapp','TEXT');
/*!40000 ALTER TABLE `Input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InputOption`
--

DROP TABLE IF EXISTS `InputOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InputOption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `InputOption_id_key` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InputOption`
--

LOCK TABLES `InputOption` WRITE;
/*!40000 ALTER TABLE `InputOption` DISABLE KEYS */;
INSERT INTO `InputOption` VALUES (1,'Branco'),(2,'Cinza'),(3,'Preto'),(4,'Bronze'),(5,'Deslizante'),(6,'Deslizante c/ porta social'),(7,'Pivotante'),(8,'Fechado'),(9,'Gradeado'),(10,'Fechado/Gradeado'),(11,'Mini grade Inferior'),(12,'Mini grade Superior'),(13,'Mini grade Superior/Inferior'),(14,'Mini grade Esquerda'),(15,'Mini grade Direita'),(16,'Mini grade Laterais'),(17,'Vidro Esquerdo'),(18,'Vidro Direito'),(19,'Vidro Laterais'),(20,'Vidro Inferior'),(21,'Vidro Superior'),(22,'Vidro Superior/Inferior'),(23,'Liso'),(24,'Frisado'),(25,'Quadrado'),(26,'Incolor'),(27,'Fumê'),(28,'Verde'),(29,'Bronze'),(30,'DZ Condominium Jetflex'),(31,'DZ Rio 350 Jetflex'),(32,'DZ Rio 300 Mono'),(33,'Gradeada'),(34,'Maxim ar'),(35,'Vidro temperado'),(36,'Vidro Comum');
/*!40000 ALTER TABLE `InputOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imageUrl` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Product_id_key` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Portão','Esse modelo se trata de um portão deslizante com detalhes em vidro na lateral que chamamos de bandeira, perfeitos para adicionar um toque moderno e sofisticado à sua entrada, mantendo a transparência e a luminosidade com um vidro incolor, ou ainda mantendo a privacidade com um vidro fumê e entre outras cores.','https://aaxesquadrias.com.br/wp-content/uploads/2021/07/WhatsApp-Image-2022-04-26-at-16.12.10-1.jpeg'),(2,'Motor de portão','Este é o Dz Condominium Jetflex, o automatizador para portões deslizantes residenciais e condomínios, realizando até 80 ciclos (abertura e fechamento) por hora. Com engrenagem externa Z12 ou Z17 (ambas em alumínio), o automatizador suporta portões de até 1000 Kg','https://mediah.ppa.com.br/images/full/PPA_DZ_1500Ind_2022_03_1679938848876.webp'),(3,'Janela','Esta janela de alumínio com vidro comum, oferece uma solução prática e funcional para iluminação e visibilidade. O vidro comum é uma escolha clássica, proporcionando claridade e permitindo a entrada de luz natural nos ambientes.','https://images.tcdn.com.br/img/img_prod/1195269/janela_para_sala_cozinha_vitro_4_folhas_aluminio_branco_linha_modular_205_1_f6b3452a55ec7b4659f12a0d465ee18b.jpg'),(4,'Box','Este modelo se trata de um box com alumínio branco complementa perfeitamente o vidro incolor que proporciona uma sensação de amplitude e luminosidade ao seu banheiro, criando uma aparência limpa e moderna.','https://cdn.awsli.com.br/600x700/1224/1224098/produto/73381229/5f743d2aa3.jpg');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_InputToInputOption`
--

DROP TABLE IF EXISTS `_InputToInputOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_InputToInputOption` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_InputToInputOption_AB_unique` (`A`,`B`),
  KEY `_InputToInputOption_B_index` (`B`),
  CONSTRAINT `_InputToInputOption_A_fkey` FOREIGN KEY (`A`) REFERENCES `Input` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_InputToInputOption_B_fkey` FOREIGN KEY (`B`) REFERENCES `InputOption` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_InputToInputOption`
--

LOCK TABLES `_InputToInputOption` WRITE;
/*!40000 ALTER TABLE `_InputToInputOption` DISABLE KEYS */;
INSERT INTO `_InputToInputOption` VALUES (4,1),(4,2),(4,3),(4,4),(5,5),(10,5),(5,6),(5,7),(10,7),(6,8),(6,9),(6,10),(6,11),(6,12),(6,13),(6,14),(6,15),(6,16),(6,17),(6,18),(6,19),(6,20),(6,21),(6,22),(7,23),(7,24),(7,25),(8,26),(8,27),(8,28),(8,29),(9,30),(9,31),(9,32),(11,33),(11,34),(11,35),(11,36);
/*!40000 ALTER TABLE `_InputToInputOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_InputToProduct`
--

DROP TABLE IF EXISTS `_InputToProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_InputToProduct` (
  `A` int(11) NOT NULL,
  `B` int(11) NOT NULL,
  UNIQUE KEY `_InputToProduct_AB_unique` (`A`,`B`),
  KEY `_InputToProduct_B_index` (`B`),
  CONSTRAINT `_InputToProduct_A_fkey` FOREIGN KEY (`A`) REFERENCES `Input` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `_InputToProduct_B_fkey` FOREIGN KEY (`B`) REFERENCES `Product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_InputToProduct`
--

LOCK TABLES `_InputToProduct` WRITE;
/*!40000 ALTER TABLE `_InputToProduct` DISABLE KEYS */;
INSERT INTO `_InputToProduct` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(12,1),(1,2),(2,2),(9,2),(12,2),(1,3),(2,3),(3,3),(4,3),(8,3),(10,3),(11,3),(12,3),(1,4),(2,4),(4,4),(8,4),(12,4);
/*!40000 ALTER TABLE `_InputToProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('00e1ce03-ef87-403f-a6a1-ac9963c23f2d','9a930b6ea8bc90aa0a81cb981130350883bcf6a75949ca60107a1dae24c08c27','2023-11-09 02:22:08.513','20231106014342_init',NULL,NULL,'2023-11-09 02:22:08.483',1),('5cbcd770-8fcf-438d-a186-4baaf9e03763','b10b4d3bc3f8d8884e9c46ebe6c75da84542244cf7e9b52906105f6939f5cae7','2023-11-09 02:22:08.592','20231109003505_',NULL,NULL,'2023-11-09 02:22:08.580',1),('65dfc8af-c083-4529-b00f-8d62f5c58a50','f4469e3f41fc3293706132b42e348c87cc5f626661132412a4855a3193e0e9b4','2023-11-09 02:22:08.121','20231103151645_init',NULL,NULL,'2023-11-09 02:22:08.065',1),('6c252580-7fd7-4fa7-9f41-ac2946971ae1','6b9f458273e2ba753122ed979c4dc4c4b567413113acb6f5fad50edcb34b3dcf','2023-11-09 02:22:08.743','20231109013734_',NULL,NULL,'2023-11-09 02:22:08.604',1),('76c9774c-f2c3-4489-b1eb-d78ba02b17ce','9a5a174d49891765418a3906cf4c77857380e90eb23fba7c85ca3792cdea3232','2023-11-09 02:22:08.533','20231107022126_',NULL,NULL,'2023-11-09 02:22:08.514',1),('a961fcaf-3b84-4427-8dd1-404e5d47a682','6cb490abd1261e8e5fd83821034468d42d54a3b4dd2e40705dc6243e87c64891','2023-11-09 02:22:08.556','20231107022433_',NULL,NULL,'2023-11-09 02:22:08.534',1),('b9ad8b4f-a536-4f45-8365-34a44db3f77a','0578f6e288aa73a3deaf90b68a55818dff4c74c5e37e149fa7a4fc2c589863e6','2023-11-09 02:22:08.603','20231109003738_',NULL,NULL,'2023-11-09 02:22:08.593',1),('cb21bcaa-b4b3-4e7b-a099-8af0a5152b05','25ed4f816f72666b43b96ea909ffc7de06f787fd92721c4a873dd98afcabb0bc','2023-11-09 02:22:08.577','20231109001039_',NULL,NULL,'2023-11-09 02:22:08.568',1),('f4f27e9f-b8f1-4f4c-887f-55d09c8b3609','fcb5682c6cc4fef64329052f720ceb0c6436fecbac98b7db0ecf605004a816d8','2023-11-09 02:22:08.566','20231108235801_',NULL,NULL,'2023-11-09 02:22:08.557',1),('fc72b81a-3d34-44e6-9f6d-289d43d83539','ada39902ea7af8e9870fb19825b21c102efca6c3b7502f5285597f59a8597dcb','2023-11-09 02:22:08.481','20231104193941_init',NULL,NULL,'2023-11-09 02:22:08.123',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-09  2:29:05
