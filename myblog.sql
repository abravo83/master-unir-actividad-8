CREATE DATABASE  IF NOT EXISTS `myblog` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myblog`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `imagen` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Aitor','ait.or@email.com','2480068229.jpg'),(2,'Camacho','cam.a@email.com','3a9dsa28ds7a3981.jpg'),(3,'Laura_pi','lau.pi@email.com','3asaa2ssadsasda3981.jpg');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(256) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `texto` text NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `categoria` enum('noticias','eventos','avisos') NOT NULL,
  `autor_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_autores_idx` (`autor_id`),
  CONSTRAINT `fk_posts_autores` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Primer post','El post de inicio del blog','Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis eos deleniti facilis, consequatur fugiat commodi. Vitae necessitatibus ipsum quis animi quos minima, natus in, ab dolores voluptatum consectetur amet quae. \n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos necessitatibus laudantium ratione sint ullam autem unde architecto ad placeat eius vel iure, neque quae esse saepe repudiandae, quod eligendi deleniti? \n Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id excepturi dolores officia aliquid quaerat consequatur rem unde, doloribus vel obcaecati iure esse? Mollitia commodi et cumque nesciunt facilis obcaecati eos. \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nostrum architecto accusantium maiores ullam nobis molestiae quam, voluptatem assumenda saepe voluptates adipisci ut blanditiis corporis quibusdam exercitationem culpa eum recusandae! \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero eum repellendus illo necessitatibus dolore amet aliquam quis distinctio totam maxime reprehenderit fugiat numquam possimus, tenetur consequuntur laborum similique nobis. Omnis.','2024-11-16 07:05:36','noticias',1),(2,'Segundo post','Mas posts de inicio','Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis eos deleniti facilis, consequatur fugiat commodi. Vitae necessitatibus ipsum quis animi quos minima, natus in, ab dolores voluptatum consectetur amet quae. \n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos necessitatibus laudantium ratione sint ullam autem unde architecto ad placeat eius vel iure, neque quae esse saepe repudiandae, quod eligendi deleniti? \n Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id excepturi dolores officia aliquid quaerat consequatur rem unde, doloribus vel obcaecati iure esse? Mollitia commodi et cumque nesciunt facilis obcaecati eos. \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nostrum architecto accusantium maiores ullam nobis molestiae quam, voluptatem assumenda saepe voluptates adipisci ut blanditiis corporis quibusdam exercitationem culpa eum recusandae! \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero eum repellendus illo necessitatibus dolore amet aliquam quis distinctio totam maxime reprehenderit fugiat numquam possimus, tenetur consequuntur laborum similique nobis. Omnis.','2024-11-16 07:07:39','noticias',1),(3,'Hola Mundo','Mas posts de inicio','Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis eos deleniti facilis, consequatur fugiat commodi. Vitae necessitatibus ipsum quis animi quos minima, natus in, ab dolores voluptatum consectetur amet quae. \n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos necessitatibus laudantium ratione sint ullam autem unde architecto ad placeat eius vel iure, neque quae esse saepe repudiandae, quod eligendi deleniti? \n Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id excepturi dolores officia aliquid quaerat consequatur rem unde, doloribus vel obcaecati iure esse? Mollitia commodi et cumque nesciunt facilis obcaecati eos. \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nostrum architecto accusantium maiores ullam nobis molestiae quam, voluptatem assumenda saepe voluptates adipisci ut blanditiis corporis quibusdam exercitationem culpa eum recusandae! \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero eum repellendus illo necessitatibus dolore amet aliquam quis distinctio totam maxime reprehenderit fugiat numquam possimus, tenetur consequuntur laborum similique nobis. Omnis.','2024-11-16 07:16:04','noticias',3),(4,'Hola Mundo 2','Mas posts de inicio 2','Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis eos deleniti facilis, consequatur fugiat commodi. Vitae necessitatibus ipsum quis animi quos minima, natus in, ab dolores voluptatum consectetur amet quae. \n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos necessitatibus laudantium ratione sint ullam autem unde architecto ad placeat eius vel iure, neque quae esse saepe repudiandae, quod eligendi deleniti? \n Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id excepturi dolores officia aliquid quaerat consequatur rem unde, doloribus vel obcaecati iure esse? Mollitia commodi et cumque nesciunt facilis obcaecati eos. \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nostrum architecto accusantium maiores ullam nobis molestiae quam, voluptatem assumenda saepe voluptates adipisci ut blanditiis corporis quibusdam exercitationem culpa eum recusandae! \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero eum repellendus illo necessitatibus dolore amet aliquam quis distinctio totam maxime reprehenderit fugiat numquam possimus, tenetur consequuntur laborum similique nobis. Omnis.','2024-11-16 07:16:50','noticias',3),(5,'Hola Mundo 3','Mas posts de inicio 3','Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis eos deleniti facilis, consequatur fugiat commodi. Vitae necessitatibus ipsum quis animi quos minima, natus in, ab dolores voluptatum consectetur amet quae. \n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos necessitatibus laudantium ratione sint ullam autem unde architecto ad placeat eius vel iure, neque quae esse saepe repudiandae, quod eligendi deleniti? \n Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id excepturi dolores officia aliquid quaerat consequatur rem unde, doloribus vel obcaecati iure esse? Mollitia commodi et cumque nesciunt facilis obcaecati eos. \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nostrum architecto accusantium maiores ullam nobis molestiae quam, voluptatem assumenda saepe voluptates adipisci ut blanditiis corporis quibusdam exercitationem culpa eum recusandae! \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero eum repellendus illo necessitatibus dolore amet aliquam quis distinctio totam maxime reprehenderit fugiat numquam possimus, tenetur consequuntur laborum similique nobis. Omnis.','2024-11-16 07:19:30','noticias',3),(6,'Inauguración: Bienvenidos a este, vuestro blog','Evento de inicio','Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis eos deleniti facilis, consequatur fugiat commodi. Vitae necessitatibus ipsum quis animi quos minima, natus in, ab dolores voluptatum consectetur amet quae. \n Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dignissimos necessitatibus laudantium ratione sint ullam autem unde architecto ad placeat eius vel iure, neque quae esse saepe repudiandae, quod eligendi deleniti? \n Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id excepturi dolores officia aliquid quaerat consequatur rem unde, doloribus vel obcaecati iure esse? Mollitia commodi et cumque nesciunt facilis obcaecati eos. \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid nostrum architecto accusantium maiores ullam nobis molestiae quam, voluptatem assumenda saepe voluptates adipisci ut blanditiis corporis quibusdam exercitationem culpa eum recusandae! \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero eum repellendus illo necessitatibus dolore amet aliquam quis distinctio totam maxime reprehenderit fugiat numquam possimus, tenetur consequuntur laborum similique nobis. Omnis.','2024-11-16 07:22:34','eventos',2);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-16 10:45:38
