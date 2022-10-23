-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2022 a las 03:15:53
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `idcschools`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `likes` (IN `id_post` INT, IN `id_user` INT)   BEGIN
DECLARE LIKES INT;
SELECT COUNT(*) INTO LIKES FROM posts_likes WHERE post_like = id_post AND user_like = id_user;
IF (LIKES >= 1) THEN
	DELETE FROM posts_likes WHERE post_like=id_post AND user_like=id_user;
 ELSE
   INSERT INTO posts_likes VALUES(id_post, id_user);
 END IF;
 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `set_posts_views` (IN `id_post` INT)   BEGIN
DECLARE VIEWCNT INT;
SELECT SUM(counter_view) INTO VIEWCNT FROM posts_views WHERE post_view=id_post;

IF (VIEWCNT >= 0)THEN
UPDATE posts_views SET counter_view=(VIEWCNT + 1) WHERE post_view=id_post;
ELSE
INSERT INTO posts_views VALUES(id_post, 1);
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `switch_favorite_comment` (IN `id_comment` INT, IN `id_user` INT)   BEGIN
DECLARE FAVORITE INT;
SELECT COUNT(*) INTO FAVORITE FROM comments_likes WHERE comment_favorite = id_comment AND user_favorite = id_user;
IF (FAVORITE >= 1) THEN
	DELETE FROM comments_likes WHERE comment_favorite=id_comment AND user_favorite=id_user;
 ELSE
   INSERT INTO comments_likes VALUES(id_comment, id_user);
 END IF;
 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id_comment` int(11) NOT NULL,
  `post_comment` int(11) NOT NULL,
  `user_comment` int(11) NOT NULL,
  `content_comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_reply` int(11) NOT NULL,
  `content_reply` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_comment` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id_comment`, `post_comment`, `user_comment`, `content_comment`, `id_reply`, `content_reply`, `date_comment`) VALUES
(34, 26, 10, '<p>hofaslj fasdjlkfasso fajskdfj aosd fasdofjao sdf asjdfo asdjf odsaj foas dfo a</p>', 0, '', '2022-09-07 01:01:38'),
(35, 26, 10, '<p>pata que?</p>', 34, '#hofaslj fasdjlkfasso fajskdfj aosd fasdofjao sdf asjdfo asdjf odsaj foas dfo a', '2022-09-07 01:05:51'),
(37, 26, 10, '<p>&#128526;</p>', 0, '', '2022-09-07 01:06:29'),
(38, 26, 10, '<p>oh my god</p>', 37, '#&#128526;', '2022-09-07 16:25:11'),
(40, 28, 10, '<p>fasdf</p>', 0, '', '2022-09-13 01:42:37'),
(41, 28, 10, '<p>fasdg</p>', 0, '', '2022-09-13 01:42:41'),
(42, 29, 10, '<p>fasssss</p>', 0, '', '2022-09-13 01:42:56'),
(43, 28, 10, '<p>fasdfa</p>', 0, '', '2022-09-13 01:54:04'),
(44, 28, 10, '<p>fasdfas</p>', 0, '', '2022-09-13 01:54:06'),
(45, 28, 10, '<p>fasdfas</p>', 0, '', '2022-09-13 01:54:09'),
(46, 30, 13, '<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>', 0, '', '2022-09-17 18:29:15'),
(47, 30, 13, '<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>\n<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>\n<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>\n<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>\n<p>ewrkq;wlekrqw;lerlqwerj;klqwerq</p>\n<p>qwerqkwerlqwe;fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>', 0, '', '2022-09-17 18:29:46'),
(48, 29, 11, '<p>fakjhfasdlkjh</p>', 42, '#fasssss', '2022-09-17 23:13:44'),
(49, 29, 11, '<p>fakjhfasdlkjh</p>', 42, '#fasssss', '2022-09-17 23:13:44'),
(50, 38, 11, '<p>como va a ser eso</p>\n<p>&nbsp;</p>', 0, '', '2022-09-27 01:27:02'),
(51, 34, 11, '<p>casl;sd</p>', 0, '', '2022-10-04 09:34:53'),
(52, 35, 11, '<p>asdfa</p>', 0, '', '2022-10-04 09:35:09'),
(53, 40, 11, '<p>fasdfa</p>', 0, '', '2022-10-04 09:35:29');

--
-- Disparadores `comments`
--
DELIMITER $$
CREATE TRIGGER `comments_after_insert` AFTER INSERT ON `comments` FOR EACH ROW BEGIN 
    DECLARE NAME VARCHAR(50);
    DECLARE TITLE TEXT;
    SELECT name_user INTO NAME FROM users WHERE id_user=new.user_comment;
    SELECT title_post INTO TITLE FROM posts WHERE id_post=new.post_comment;
    
    INSERT INTO notifications(post_info, user_info,target_info, content_info, scope_info, table_info)
    	VALUES(new.post_comment, new.user_comment, new.id_comment, CONCAT(NAME, " has commented your post, titled: ", TITLE), "private", "comments");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments_likes`
--

CREATE TABLE `comments_likes` (
  `comment_favorite` int(11) NOT NULL,
  `user_favorite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comments_likes`
--

INSERT INTO `comments_likes` (`comment_favorite`, `user_favorite`) VALUES
(35, 10),
(37, 10),
(50, 11);

--
-- Disparadores `comments_likes`
--
DELIMITER $$
CREATE TRIGGER `comments_likes_after_insert` AFTER INSERT ON `comments_likes` FOR EACH ROW BEGIN 
    DECLARE NAME VARCHAR(50);
    DECLARE TITLE TEXT;
    DECLARE IDPOST INT;
    
    SELECT name_user INTO NAME FROM users WHERE id_user=new.user_favorite;    
    SELECT id_post INTO IDPOST FROM posts INNER JOIN comments 
    ON posts.id_post=comments.post_comment INNER JOIN comments_likes 
    ON comments.id_comment=comments_likes.comment_favorite 
    WHERE comment_favorite=new.comment_favorite;
    
    SELECT title_post INTO TITLE FROM posts INNER JOIN comments 
    ON posts.id_post=comments.post_comment INNER JOIN comments_likes 
    ON comments.id_comment=comments_likes.comment_favorite 
    WHERE comment_favorite=new.comment_favorite;
    
    INSERT INTO notifications(post_info, user_info, target_info, content_info, scope_info, table_info)
    	VALUES(IDPOST, new.user_favorite, new.comment_favorite, CONCAT(NAME, " liked your post's comment, titled: ", TITLE), "private", "comments_likes");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `followers`
--

CREATE TABLE `followers` (
  `followed` int(11) NOT NULL,
  `follower` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `followers`
--

INSERT INTO `followers` (`followed`, `follower`) VALUES
(10, 12),
(11, 12),
(10, 13),
(11, 13),
(10, 16),
(13, 16),
(14, 16),
(10, 17),
(14, 17),
(15, 17),
(13, 11),
(14, 11),
(17, 16),
(16, 11),
(11, 18),
(14, 18),
(17, 18),
(17, 11),
(18, 19);

--
-- Disparadores `followers`
--
DELIMITER $$
CREATE TRIGGER `followers_after_insert` AFTER INSERT ON `followers` FOR EACH ROW BEGIN 
    DECLARE FOLLOWER VARCHAR(50);    
    SELECT name_user INTO FOLLOWER FROM users WHERE id_user=new.follower;
    
    INSERT INTO notifications(user_info,target_info, content_info, scope_info, table_info)
    	VALUES(new.followed, new.follower, CONCAT(FOLLOWER, " started to follow you. follow back..."), "private", "followers");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id_info` int(11) NOT NULL,
  `post_info` int(11) NOT NULL,
  `user_info` int(11) NOT NULL,
  `target_info` int(11) NOT NULL,
  `content_info` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope_info` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_info` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_info` varchar(5) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'true',
  `date_info` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id_info`, `post_info`, `user_info`, `target_info`, `content_info`, `scope_info`, `table_info`, `status_info`, `date_info`) VALUES
(89, 0, 10, 0, 'Welcome jonh smith scar\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-06 10:47:36'),
(90, 0, 11, 0, 'Welcome maria\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-06 10:48:08'),
(91, 26, 11, 0, 'Have a look to maria\'s post, titled: un tema de aves', 'public', 'posts', 'false', '2022-09-06 10:48:57'),
(92, 27, 10, 0, 'Have a look to jonh smith scar\'s post, titled: un vacan &#128522;', 'public', 'posts', 'false', '2022-09-06 10:49:47'),
(93, 26, 10, 34, 'jonh smith scar has commented your post, titled: un tema de aves', 'private', 'comments', 'true', '2022-09-07 01:01:38'),
(94, 26, 10, 34, 'jonh smith scar liked your post\'s comment, titled: un tema de aves', 'private', 'comments_likes', 'true', '2022-09-07 01:04:00'),
(95, 26, 10, 35, 'jonh smith scar has commented your post, titled: un tema de aves', 'private', 'comments', 'true', '2022-09-07 01:05:51'),
(96, 26, 10, 36, 'jonh smith scar has commented your post, titled: un tema de aves', 'private', 'comments', 'true', '2022-09-07 01:06:08'),
(97, 26, 10, 37, 'jonh smith scar has commented your post, titled: un tema de aves', 'private', 'comments', 'true', '2022-09-07 01:06:29'),
(98, 26, 10, 37, 'jonh smith scar liked your post\'s comment, titled: un tema de aves', 'private', 'comments_likes', 'true', '2022-09-07 02:17:47'),
(99, 26, 10, 37, 'jonh smith scar liked your post\'s comment, titled: un tema de aves', 'private', 'comments_likes', 'true', '2022-09-07 02:17:50'),
(100, 26, 10, 37, 'jonh smith scar liked your post\'s comment, titled: un tema de aves', 'private', 'comments_likes', 'true', '2022-09-07 02:17:52'),
(101, 26, 10, 38, 'jonh smith scar has commented your post, titled: un tema de aves', 'private', 'comments', 'true', '2022-09-07 16:25:11'),
(102, 26, 10, 35, 'jonh smith scar liked your post\'s comment, titled: un tema de aves', 'private', 'comments_likes', 'true', '2022-09-07 20:55:50'),
(103, 26, 10, 0, 'jonh smith scar liked your post, titled: un tema de aves', 'private', 'posts_likes', 'true', '2022-09-07 21:12:31'),
(104, 27, 10, 39, 'jonh smith scar has commented your post, titled: un vacan &#128522;', 'private', 'comments', 'true', '2022-09-11 20:10:18'),
(105, 28, 10, 0, 'Have a look to jonh smith scar\'s post, titled: todo el mundo mea', 'public', 'posts', 'true', '2022-09-11 20:16:42'),
(106, 28, 10, 0, 'jonh smith scar liked your post, titled: todo el mundo mea', 'private', 'posts_likes', 'true', '2022-09-11 20:37:30'),
(107, 29, 10, 0, 'Have a look to jonh smith scar\'s post, titled: el hotpital mas grande', 'public', 'posts', 'true', '2022-09-11 22:51:26'),
(108, 29, 10, 0, 'jonh smith scar liked your post, titled: el hotpital mas grande', 'private', 'posts_likes', 'true', '2022-09-12 02:26:03'),
(109, 29, 10, 0, 'jonh smith scar liked your post, titled: el hotpital mas grande', 'private', 'posts_likes', 'true', '2022-09-12 02:26:10'),
(110, 28, 10, 40, 'jonh smith scar has commented your post, titled: todo el mundo mea', 'private', 'comments', 'true', '2022-09-13 01:42:37'),
(111, 28, 10, 41, 'jonh smith scar has commented your post, titled: todo el mundo mea', 'private', 'comments', 'true', '2022-09-13 01:42:41'),
(112, 29, 10, 42, 'jonh smith scar has commented your post, titled: el hotpital mas grande', 'private', 'comments', 'true', '2022-09-13 01:42:56'),
(113, 28, 10, 43, 'jonh smith scar has commented your post, titled: todo el mundo mea', 'private', 'comments', 'true', '2022-09-13 01:54:04'),
(114, 28, 10, 44, 'jonh smith scar has commented your post, titled: todo el mundo mea', 'private', 'comments', 'true', '2022-09-13 01:54:06'),
(115, 28, 10, 45, 'jonh smith scar has commented your post, titled: todo el mundo mea', 'private', 'comments', 'true', '2022-09-13 01:54:09'),
(116, 28, 10, 40, 'jonh smith scar liked your post\'s comment, titled: todo el mundo mea', 'private', 'comments_likes', 'true', '2022-09-13 02:16:40'),
(117, 26, 10, 37, 'jonh smith scar liked your post\'s comment, titled: un tema de aves', 'private', 'comments_likes', 'true', '2022-09-13 18:43:31'),
(118, 30, 10, 0, 'Have a look to jonh smith scar\'s post, titled: The example above does not use the index and array parameters. It can be rewritten to:', 'public', 'posts', 'true', '2022-09-13 19:58:49'),
(119, 28, 10, 0, 'jonh smith scar liked your post, titled: todo el mundo mea', 'private', 'posts_likes', 'true', '2022-09-14 09:57:42'),
(120, 0, 12, 0, 'Welcome luisa\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-16 10:41:36'),
(121, 30, 12, 0, 'luisa liked your post, titled: The example above does not use the index and array parameters. It can be rewritten to:', 'private', 'posts_likes', 'true', '2022-09-16 10:53:38'),
(122, 0, 10, 12, 'luisa started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-17 09:53:57'),
(123, 0, 11, 12, 'luisa started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-17 09:54:21'),
(124, 0, 13, 0, 'Welcome manuel\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-17 10:17:08'),
(125, 0, 10, 13, 'manuel started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-17 10:17:33'),
(126, 0, 11, 13, 'manuel started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-17 10:17:58'),
(127, 30, 13, 46, 'manuel has commented your post, titled: The example above does not use the index and array parameters. It can be rewritten to:', 'private', 'comments', 'true', '2022-09-17 18:29:15'),
(128, 30, 13, 47, 'manuel has commented your post, titled: The example above does not use the index and array parameters. It can be rewritten to:', 'private', 'comments', 'true', '2022-09-17 18:29:46'),
(129, 0, 14, 0, 'Welcome jose\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-17 18:31:31'),
(130, 31, 14, 0, 'Have a look to jose\'s post, titled: fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs  sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi', 'public', 'posts', 'true', '2022-09-17 18:32:20'),
(131, 0, 15, 0, 'Welcome peter\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-17 18:34:22'),
(132, 0, 16, 0, 'Welcome luis\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-17 20:03:42'),
(133, 29, 11, 48, 'Maria teresa de cacuta has commented your post, titled: el hotpital mas grande', 'private', 'comments', 'true', '2022-09-17 23:13:44'),
(134, 29, 11, 49, 'Maria teresa de cacuta has commented your post, titled: el hotpital mas grande', 'private', 'comments', 'true', '2022-09-17 23:13:44'),
(135, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:25:28'),
(136, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:25:33'),
(137, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:25:37'),
(138, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:25:42'),
(139, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:35:20'),
(140, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:56:32'),
(141, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:56:37'),
(142, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:56:40'),
(143, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:56:43'),
(144, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:58:06'),
(145, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:58:09'),
(146, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:58:12'),
(147, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:59:10'),
(148, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:59:15'),
(149, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:59:18'),
(150, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:59:20'),
(151, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 12:59:23'),
(152, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:03:38'),
(153, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:03:42'),
(154, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:03:45'),
(155, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:03:48'),
(156, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:03:51'),
(157, 0, 12, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:31'),
(158, 0, 12, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:34'),
(159, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:37'),
(160, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:40'),
(161, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:40'),
(162, 0, 15, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:43'),
(163, 0, 15, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:46'),
(164, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:48'),
(165, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:49'),
(166, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:49'),
(167, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:52'),
(168, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:56'),
(169, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:11:57'),
(170, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:12:00'),
(171, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:12:01'),
(172, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:12:01'),
(173, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:12:07'),
(174, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:13:55'),
(175, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:13:57'),
(176, 0, 10, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:13:59'),
(177, 0, 14, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:14:01'),
(178, 0, 14, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:14:02'),
(179, 0, 12, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:14:04'),
(180, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:14:09'),
(181, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:14:12'),
(182, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:14:22'),
(183, 0, 12, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:15:37'),
(184, 0, 15, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:15:41'),
(185, 0, 15, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:15:46'),
(186, 0, 14, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:18:24'),
(187, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:18:28'),
(188, 0, 14, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:23:13'),
(189, 0, 14, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:23:17'),
(190, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:24:49'),
(191, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:24:53'),
(192, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:24:56'),
(193, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:24:59'),
(194, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 13:25:01'),
(195, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:27:48'),
(196, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:27:59'),
(197, 0, 15, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:40:22'),
(198, 0, 15, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:40:34'),
(199, 0, 12, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:40:36'),
(200, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:41:31'),
(201, 0, 14, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:41:45'),
(202, 0, 13, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:41:52'),
(203, 0, 14, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 16:42:00'),
(204, 0, 17, 0, 'Welcome rafael rubios\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-09-18 16:50:40'),
(205, 0, 10, 17, 'rafael rubios started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 17:19:26'),
(206, 0, 14, 17, 'rafael rubios started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 17:19:30'),
(207, 0, 15, 17, 'rafael rubios started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-18 17:19:32'),
(208, 31, 17, 0, 'rafael rubios liked your post, titled: fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs  sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi', 'private', 'posts_likes', 'true', '2022-09-18 21:17:18'),
(209, 0, 13, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 00:35:12'),
(210, 0, 10, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 00:35:34'),
(211, 0, 14, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 00:36:31'),
(212, 0, 17, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 12:52:23'),
(213, 0, 11, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 12:52:33'),
(214, 0, 17, 16, 'luis started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 12:52:36'),
(215, 26, 11, 0, 'Maria teresa de cacuta liked your post, titled: un tema de aves', 'private', 'posts_likes', 'true', '2022-09-25 13:49:07'),
(216, 29, 11, 0, 'Maria teresa de cacuta liked your post, titled: el hotpital mas grande', 'private', 'posts_likes', 'true', '2022-09-25 14:07:48'),
(217, 0, 15, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 18:21:27'),
(218, 0, 16, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:29:18'),
(219, 0, 16, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:29:22'),
(220, 0, 12, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:29:47'),
(221, 0, 12, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:29:51'),
(222, 0, 16, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:32:56'),
(223, 0, 16, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:33:02'),
(224, 0, 17, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:34:10'),
(225, 0, 17, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:34:16'),
(226, 0, 17, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:39:38'),
(227, 0, 17, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-09-25 19:58:36'),
(228, 32, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: Puedes obtener flask para validar los par&#225;metros y lanzar un error autom&#225;ticamente si est&#225; dispuesto a cambiar de Par&#225;metros de URL (es decir, cualquier cosa despu&#233;s del s&#237;mbolo \"?\"', 'public', 'posts', 'true', '2022-09-26 10:49:37'),
(229, 33, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: un error autom&#225;ticamente si est&#225; dispuesto a cambiar de Par&#225;metros de URL (es decir, cualquier cosa despu&#233;s del s&#237;mbolo \"?\"', 'public', 'posts', 'true', '2022-09-26 10:49:53'),
(230, 34, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: un errualquier cosa despu&#233;s del s&#237;mbo', 'public', 'posts', 'true', '2022-09-26 10:50:09'),
(231, 35, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: ualquier cosa despu&#233;s del s&#237;mbo', 'public', 'posts', 'true', '2022-09-26 10:50:28'),
(232, 36, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: ualquier cosa despu&#233;s del s&#237;mbo', 'public', 'posts', 'true', '2022-09-26 10:50:33'),
(233, 37, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: ualquier cosa despu&#233;s del s&#237;mbo', 'public', 'posts', 'false', '2022-09-26 10:50:38'),
(234, 38, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: ualquier cosa despu&#233;s del s&#237;mboPuedes obtener flask para validar los par&#225;metros y lanzar un error autom&#225;ticamente si est&#225; dispuesto a cambiar de Par&#225;metros de URL (es decir, cualquier cosa despu&#233;s del s&#237;mbolo \"?\"', 'public', 'posts', 'true', '2022-09-26 10:51:07'),
(235, 39, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: maricti', 'public', 'posts', 'true', '2022-09-26 10:51:16'),
(236, 40, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: como trantan alos nipos', 'public', 'posts', 'false', '2022-09-26 10:51:29'),
(237, 37, 11, 0, 'Maria teresa de cacuta liked your post, titled: ualquier cosa despu&#233;s del s&#237;mbo', 'private', 'posts_likes', 'true', '2022-09-27 01:22:07'),
(238, 38, 11, 50, 'Maria teresa de cacuta has commented your post, titled: ualquier cosa despu&#233;s del s&#237;mboPuedes obtener flask para validar los par&#225;metros y lanzar un error autom&#225;ticamente si est&#225; dispuesto a cambiar de Par&#225;metros de URL (es decir, cualquier cosa despu&#233;s del s&#237;mbolo \"?\"', 'private', 'comments', 'true', '2022-09-27 01:27:02'),
(239, 0, 18, 0, 'Welcome juanpaniagua\n Thank you for start joining our community!', 'private', 'users', 'false', '2022-09-27 01:47:22'),
(240, 41, 18, 0, 'Have a look to juanpaniagua\'s post, titled: new en the community ', 'public', 'posts', 'false', '2022-09-27 01:48:51'),
(241, 41, 18, 0, 'juanpaniagua liked your post, titled: new en the community manager', 'private', 'posts_likes', 'false', '2022-09-27 10:19:19'),
(242, 33, 18, 0, 'Juan paniagua liked your post, titled: un error autom&#225;ticamente si est&#225; dispuesto a cambiar de Par&#225;metros de URL (es decir, cualquier cosa despu&#233;s del s&#237;mbolo \"?\"', 'private', 'posts_likes', 'false', '2022-09-29 01:57:14'),
(243, 0, 10, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-01 02:31:20'),
(244, 37, 18, 0, 'Juan paniagua liked your post, titled: ualquier cosa despu&#233;s del s&#237;mbo', 'private', 'posts_likes', 'true', '2022-10-01 02:32:47'),
(245, 42, 18, 0, 'Have a look to Juan paniagua\'s post, titled: exaple', 'public', 'posts', 'false', '2022-10-02 14:25:26'),
(246, 0, 11, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 02:18:57'),
(247, 0, 11, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'false', '2022-10-03 02:19:00'),
(248, 0, 13, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:11:27'),
(249, 0, 13, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:11:31'),
(250, 0, 16, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:13:57'),
(251, 0, 16, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:14:00'),
(252, 0, 12, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:15:56'),
(253, 0, 14, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:17:12'),
(254, 0, 14, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:17:14'),
(255, 0, 14, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:17:17'),
(256, 0, 14, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:17:56'),
(257, 0, 14, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:17:59'),
(258, 0, 14, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:18:02'),
(259, 0, 13, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:18:04'),
(260, 0, 13, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:18:06'),
(261, 0, 17, 18, 'Juan paniagua started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-03 03:43:52'),
(262, 34, 11, 51, 'Maria teresa de cacuta has commented your post, titled: un errualquier cosa despu&#233;s del s&#237;mbo', 'private', 'comments', 'true', '2022-10-04 09:34:53'),
(263, 35, 11, 52, 'Maria teresa de cacuta has commented your post, titled: ualquier cosa despu&#233;s del s&#237;mbo', 'private', 'comments', 'true', '2022-10-04 09:35:09'),
(264, 40, 11, 53, 'Maria teresa de cacuta has commented your post, titled: como trantan alos nipos', 'private', 'comments', 'false', '2022-10-04 09:35:29'),
(265, 43, 11, 0, 'Have a look to Maria teresa de cacuta\'s post, titled: 4g!`f~fdfs !@#$%^&*()_-++\\/?sgdl', 'public', 'posts', 'true', '2022-10-04 10:37:40'),
(266, 0, 17, 11, 'Maria teresa de cacuta started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-06 02:37:59'),
(267, 38, 11, 50, 'Maria teresa de cacuta liked your post\'s comment, titled: lo malo?&///fafal/fs&dsfl!fdal-fas..!@#$%*()--_=+\\|\\?/><fa', 'private', 'comments_likes', 'true', '2022-10-06 23:09:56'),
(268, 0, 19, 0, 'Welcome jonh smith scar\n Thank you for start joining our community!', 'private', 'users', 'true', '2022-10-18 10:12:39'),
(269, 44, 19, 0, 'Have a look to jonh smith scar\'s post, titled: hola mundo cruel', 'public', 'posts', 'true', '2022-10-18 10:35:03'),
(270, 0, 18, 19, 'jonh smith scar started to follow you. follow back...', 'private', 'followers', 'true', '2022-10-18 11:07:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id_post` int(11) NOT NULL,
  `title_post` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_post` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_post` int(11) NOT NULL,
  `categories_post` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id_post`, `title_post`, `content_post`, `author_post`, `categories_post`, `date_post`) VALUES
(26, 'un tema de aves', '<p>totas la aves vuelan &#129392;</p>', 11, 'aves vuelo', '2022-09-06 10:48:57'),
(28, 'todo el mundo mea', '<p>la vida es una</p>\r\n<p>&nbsp;</p>\r\n<p>una&nbsp; fal fasll; fasdfasdl kjfasj fa sdf asdlkf askd f</p>\r\n<p>&nbsp;</p>\r\n<p>fasdlfasjl fsdl oorel lorem*50</p>\r\n<p>fasl;kjfas f asdfklas</p>', 10, 'intorod jquery find child', '2022-09-11 20:16:42'),
(29, 'el hotpital mas grande', '<p>dfa skf a;sdkj fasdfkasd ffasl dfjk asdj fak jsdfjk adskj fjk asdjf asdkjdfjlkaskdjf ;af jksdj fk; asdfk a;sldf kas dfkajs;ldkfj kasjd;flkjasdkjfioqpjeknkzhioafelf k;iadsjfa fdij asdifjoa jsjdip issadjf iasdkfh asdoi f as dhffaksd fliu</p>', 10, 'fajskjlfa fajls dfja d fasjdl fasj dfaj sdfj asd fasd fj asd fasj dkfakj sdfj asddkj fasjk dfjk asdf jasj dfakj sdfk askj dlfaklsj d', '2022-09-11 22:51:26'),
(30, 'The example above does not use the index and array parameters. It can be rewritten to:', '<p>Note that the function takes 4 arguments:</p>\r\n<ul>\r\n<li>The total (the initial value / previously returned value)</li>\r\n<li>The item value</li>\r\n<li>The item index</li>\r\n<li>The array itself</li>\r\n</ul>\r\n<p>The example above does not use the index and array parameters. It can be rewritten to:</p>', 10, 'bivi', '2022-09-13 19:58:49'),
(31, 'fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs  sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi', '<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>\r\n<p>&nbsp;</p>\r\n<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>\r\n<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>\r\n<p>fas fa lfasdflkasdfasda faksldfla;sdf asdf asdjkflasd;faks fasdfjasdkjkzd sfasd fj jiadf dfjasd iosddnfsd fas df asdf asdf ksdfhjkfasd fas dfjash dfasjdh facaxz csahdfahs&nbsp; sadjv asd jvasd jvasdh vasdv vsahadfkadsas fdafasdhfajh dfasd fasdh f jv,jasdk fasdf sdfa jfh asdf adfhiod csja akjeqr qoiutuou ow io isuer c upqoeixqpieyxe oxq ue xouf ad uhfoxauhao xuhgqhuqiohohfuhf xq oiq hif ouqiofqof ohfoqu fhoqi fuoi fhxqizo iheufh qiu ofxhof qzhovuh vosx hxoi</p>', 14, 'dfal;dakfa df adsf asd fa sdf as df asd fa sdf as df asd f a sdf a sdf a sd fasd f asd f asd f asd f asd fasdfasdfasd fasdfasdfasdfasd fasdfsadf asdfas fasdfafdfqwfdsafsd ffasd fasdf ads fasdfasdfasd f sdfasdfa sfa fdsa i', '2022-09-17 18:32:20'),
(32, 'Puedes obtener flask para validar los par&#225;metros y lanzar un error autom&#225;ticamente si est&#225; dispuesto a cambiar de Par&#225;metros de URL (es decir, cualquier cosa despu&#233;s del s&#237;mbolo \"?\"', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd ', '2022-09-26 10:49:37'),
(33, 'un error autom&#225;ticamente si est&#225; dispuesto a cambiar de Par&#225;metros de URL (es decir, cualquier cosa despu&#233;s del s&#237;mbolo \"?\"', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:49:53'),
(34, 'un errualquier cosa despu&#233;s del s&#237;mbo', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:50:09'),
(35, 'ualquier cosa despu&#233;s del s&#237;mbo', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:50:28'),
(36, 'ualquier cosa despu&#233;s del s&#237;mbo', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:50:33'),
(37, 'ualquier cosa despu&#233;s del s&#237;mbo', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:50:38'),
(38, 'lo malo?&///fafal/fs&dsfl!fdal-fas..!@#$%*()--_=+\\|\\?/><fa', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:51:07'),
(39, 'maricti', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:51:16'),
(40, 'como trantan alos nipos', '<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>\r\n<p>Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"Puedes obtener&nbsp;<strong>flask</strong>&nbsp;para validar los&nbsp;<strong>par&aacute;metros</strong>&nbsp;y lanzar un error autom&aacute;ticamente si est&aacute; dispuesto a cambiar de&nbsp;<strong>Par&aacute;metros</strong>&nbsp;de&nbsp;<strong>URL</strong>&nbsp;(es decir, cualquier cosa despu&eacute;s del s&iacute;mbolo \"?\"</p>', 11, 'fal fas fas fas dfasd fasdfa', '2022-09-26 10:51:29'),
(41, 'new en the community manager', '<p>examples text yes</p>', 18, 'intorod jquery find child losees ', '2022-09-27 01:48:51'),
(42, 'exaple', '<p>&#129392;&lt;span class=\"fa-stack fa-lg\"&gt;<iframe src=\"https://www.youtube.com/embed/CK5ZcKZsMRs\" width=\"100%\" height=\"auto\" allowfullscreen=\"allowfullscreen\"></iframe><br>&nbsp; &lt;i class=\"fas fa-circle fa-stack-2x\"&gt;&lt;/i&gt;<br>&nbsp; &lt;i class=\"fab fa-twitter fa-stack-1x fa-inverse\"&gt;&lt;/i&gt;</p>\r\n<p>fakldffaklsdfkalsdfjkasdkfajsdlkfjaksdjffkasdjfkasdkfjlasdkff klafksd</p>\r\n<pre class=\"language-markup\"><code>&lt;span class=\"fa-stack fa-lg\"&gt;\r\n  &lt;i class=\"fas fa-circle fa-stack-2x\"&gt;&lt;/i&gt;\r\n  &lt;i class=\"fab fa-twitter fa-stack-1x fa-inverse\"&gt;&lt;/i&gt;\r\n&lt;/span&gt;\r\nfa-twitter (inverse) on fa-circle (solid)&lt;br&gt;\r\n\r\n&lt;span class=\"fa-stack fa-lg\"&gt;\r\n  &lt;i class=\"far fa-circle fa-stack-2x\"&gt;&lt;/i&gt;\r\n  &lt;i class=\"fab fa-twitter fa-stack-1x\"&gt;&lt;/i&gt;\r\n&lt;/span&gt;\r\nfa-twitter on fa-circle (regular)&lt;br&gt;\r\n\r\n&lt;span class=\"fa-stack fa-lg\"&gt;\r\n  &lt;i class=\"fas fa-camera fa-stack-1x\"&gt;&lt;/i&gt;\r\n  &lt;i class=\"fas fa-ban fa-stack-2x text-danger\" style=\"color:red;\"&gt;&lt;/i&gt;\r\n&lt;/span&gt;\r\nfa-ban on fa-camera</code></pre>\r\n<table style=\"border-collapse: collapse; width: 99.9429%;\" border=\"1\"><colgroup><col style=\"width: 16.6381%;\"><col style=\"width: 16.6381%;\"><col style=\"width: 16.6381%;\"><col style=\"width: 16.6381%;\"><col style=\"width: 16.6381%;\"><col style=\"width: 16.6381%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br>&lt;/span&gt;<br>fa-twitter (inverse) on fa-circle (solid)&lt;br&gt;</p>\r\n<p>&lt;span class=\"fa-stack fa-lg\"&gt;<br>&nbsp; &lt;i class=\"far fa-circle fa-stack-2x\"&gt;&lt;/i&gt;<br>&nbsp; &lt;i class=\"fab fa-twitter fa-stack-1x\"&gt;&lt;/i&gt;<br>&lt;/span&gt;<br>fa-twitter on fa-circle (regular)&lt;br&gt;</p>\r\n<p>&lt;span class=\"fa-stack fa-lg\"&gt;<br>&nbsp; &lt;i class=\"fas fa-camera fa-stack-1x\"&gt;&lt;/i&gt;<br>&nbsp; &lt;i class=\"fas fa-ban fa-stack-2x text-danger\" style=\"color:red;\"&gt;&lt;/i&gt;<br>&lt;/span&gt;<br>fa-ban on fa-camera</p>', 18, 'web code', '2022-10-02 14:25:26'),
(43, '4g!`f~fdfs !@#$%^&*()_-++\\/?sgdl', '<p>la vida</p>', 11, 'gsfds gsdf #$%^&*()?/', '2022-10-04 10:37:40'),
(44, 'hola mundo cruel', '<p>soy un post sobre programacion orientada a objetos</p>', 19, 'flask python java php js css html ruby', '2022-10-18 10:35:03');

--
-- Disparadores `posts`
--
DELIMITER $$
CREATE TRIGGER `posts_after_insert` AFTER INSERT ON `posts` FOR EACH ROW BEGIN
DECLARE NAME VARCHAR(50);
SELECT name_user INTO NAME FROM users WHERE id_user=new.author_post;

INSERT INTO notifications(post_info, user_info, content_info, scope_info, table_info)
VALUES(new.id_post, new.author_post, CONCAT("Have a look to ", NAME, "'s post, titled: ", new.title_post), "public", "posts");

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_likes`
--

CREATE TABLE `posts_likes` (
  `post_like` int(11) NOT NULL,
  `user_like` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts_likes`
--

INSERT INTO `posts_likes` (`post_like`, `user_like`) VALUES
(26, 10),
(28, 10),
(30, 12),
(31, 17),
(29, 11),
(37, 11),
(41, 18),
(33, 18),
(37, 18);

--
-- Disparadores `posts_likes`
--
DELIMITER $$
CREATE TRIGGER `post_likes_after_insert` AFTER INSERT ON `posts_likes` FOR EACH ROW BEGIN 
    DECLARE NAME VARCHAR(50);
    DECLARE TITLE TEXT;
    SELECT name_user INTO NAME FROM users WHERE id_user=new.user_like;
    SELECT title_post INTO TITLE FROM posts WHERE id_post=new.post_like;
    
    INSERT INTO notifications(post_info, user_info, content_info, scope_info, table_info)
    	VALUES(new.post_like, new.user_like, CONCAT(NAME, " liked your post, titled: ", TITLE), "private", "posts_likes");
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_views`
--

CREATE TABLE `posts_views` (
  `post_view` int(11) NOT NULL,
  `counter_view` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts_views`
--

INSERT INTO `posts_views` (`post_view`, `counter_view`) VALUES
(26, 252),
(28, 120),
(29, 152),
(30, 5098088),
(31, 47),
(34, 2),
(37, 17),
(38, 16),
(41, 22),
(40, 12),
(39, 6),
(35, 7),
(33, 5),
(42, 31),
(36, 3),
(43, 7),
(32, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reports`
--

CREATE TABLE `reports` (
  `id_report` int(11) NOT NULL,
  `user_report` int(11) NOT NULL,
  `origen_report` int(11) NOT NULL,
  `action_report` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_report` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_report` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_report` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass_user` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_user` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about_user` text CHARACTER SET utf8 NOT NULL DEFAULT 'Hi, welcome to my profile',
  `foto_user` longtext CHARACTER SET utf8 NOT NULL,
  `wallpaper_user` longtext CHARACTER SET utf8 NOT NULL,
  `date_user` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `name_user`, `mail_user`, `pass_user`, `phone_user`, `country_user`, `about_user`, `foto_user`, `wallpaper_user`, `date_user`) VALUES
(10, 'jonh smith scar', 'jonh@gmail.com', 'pbkdf2:sha256:260000$HOfmUtvVBRRSVkM2$9f172cf39018fd1ea93fae7d7c8a6b02a28a9dd519d04c3aaa615e73a1a80e87', '', '', 'Hi, welcome to my profile', '../static/uploads/20200611_055242.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIhdi1VeIiPbfqAIU6HOWCcMZqMLPbtcAslQ&usqp=CAU', '2022-09-06 10:47:36'),
(11, 'Maria teresa de cacuta', 'maria@gmail.com', 'pbkdf2:sha256:260000$XSKazNwZ3Q9T4eVu$c6110a2ac7ca25e4a8b27885a66b5cff9bdc296e2d74329b7542ede0b68080dd', '', 'Congo - Brazzaville', 'me gusta viajar por el mundo y conocer personas', 'https://www.lavoz.com.ar/resizer/4bY9ygIGrYmuDb-Ww8KjytF66ks=/1023x682/smart/cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/5DRPYXKUG5FXZMRWJ3C5FWU5KM.jpg', 'https://img1.picmix.com/output/stamp/normal/3/0/9/8/1128903_16a80.gif', '2022-09-06 10:48:08'),
(12, 'luisa', 'luisa@gmail.com', 'pbkdf2:sha256:260000$T2RXBHc1sPPAy6km$fe22cfd4adae7c8a6018d86e7a1ce4e04343114964d271d40aaded018d2f2e34', '', '', 'Hi, welcome to my profile', '', '', '2022-09-16 10:41:36'),
(13, 'manuel', 'idcschool@gmail.com', 'pbkdf2:sha256:260000$gc30SoV4buG5U1Bw$c6f9c4f8020ca9f9f88e609e7fe4172c6261ef56c4d581ff3fa342997ee1231f', '', '', 'Hi, welcome to my profile', '', '', '2022-09-17 10:17:08'),
(14, 'jose', 'jose@gmail.com', 'pbkdf2:sha256:260000$jSVbbSEKEINVLxuB$e596ae961557542bfcf5c783576f804345280ecb5404e4dd19a6be8108b51cf8', '', '', 'Hi, welcome to my profile', '', '', '2022-09-17 18:31:31'),
(15, 'peter', 'peter@gmail.com', 'pbkdf2:sha256:260000$5ikfER2X1GWv0uoN$8b67421943a4af24f25527e7436e312618b8f8ab48fe7d5060802b625877cb3e', '', '', 'Hi, welcome to my profile', '', '', '2022-09-17 18:34:22'),
(16, 'luis', 'luis@gmail.com', 'pbkdf2:sha256:260000$10GdV6aZwNzd4NaF$c84aed9a337781a0c25a98fe1abf14e4823c8becee506622353dc807f5d09494', '', '', 'Hi, welcome to my profile', 'https://i.pinimg.com/736x/8c/90/d8/8c90d8880e44c1132e7f744fb6a86b18.jpg', '', '2022-09-17 20:03:42'),
(17, 'rafael rubios', 'ralph@gmail.com', 'pbkdf2:sha256:260000$LaTfq56dYkJ8bs7V$49cf7b568493029d627f713c04cb87da60864e37229d8c45748b48f90fd9cca1', '', '', 'Hi, welcome to my profile', 'https://pbs.twimg.com/media/DVNvD9LW0AAkTU8?format=jpg&name=large', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Computer-screen-code-glitch-animation-gif-background-free.gif/1024px-Computer-screen-code-glitch-animation-gif-background-free.gif', '2022-09-18 16:50:40'),
(18, 'Juan paniagua', 'jonhs@gmail.com', 'pbkdf2:sha256:260000$YDTSwjDHbE9oZpe9$005a2fdff1f596d089a02bc7b67de609bbc23dfe70a56a2a37e31173ff1dbccb', '', 'Antigua and Barbuda', 'la para de tu para', '../static/uploads/me7.png', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Computer-screen-code-glitch-animation-gif-background-free.gif/1024px-Computer-screen-code-glitch-animation-gif-background-free.gif', '2022-09-27 01:47:22'),
(19, 'jonh smith scar', 'ralphs@gmail.scom', 'pbkdf2:sha256:260000$UHekoTNljZb1GDqD$aeb4be4b934a46d94ffba923d6f4d31971117f833d23306c4808c74478271b86', '', '', 'Hi, welcome to my profile', '../static/uploads/me.png', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Computer-screen-code-glitch-animation-gif-background-free.gif/1024px-Computer-screen-code-glitch-animation-gif-background-free.gif', '2022-10-18 10:12:39');

--
-- Disparadores `users`
--
DELIMITER $$
CREATE TRIGGER `users_after_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	INSERT INTO notifications(user_info, content_info, scope_info, table_info) 
    VALUES(new.id_user,CONCAT('Welcome ', new.name_user, '\n Thank you for start joining our community!'), "private", "users");

END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `user_comment` (`user_comment`),
  ADD KEY `post_comment` (`post_comment`);

--
-- Indices de la tabla `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD KEY `comment_favorite` (`comment_favorite`),
  ADD KEY `user_favorite` (`user_favorite`);

--
-- Indices de la tabla `followers`
--
ALTER TABLE `followers`
  ADD KEY `followed` (`followed`),
  ADD KEY `follower` (`follower`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id_info`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `author_post` (`author_post`);

--
-- Indices de la tabla `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD KEY `post_like` (`post_like`),
  ADD KEY `user_like` (`user_like`);

--
-- Indices de la tabla `posts_views`
--
ALTER TABLE `posts_views`
  ADD KEY `post_view` (`post_view`);

--
-- Indices de la tabla `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id_report`),
  ADD KEY `user_report` (`user_report`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `reports`
--
ALTER TABLE `reports`
  MODIFY `id_report` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_comment`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_comment`) REFERENCES `posts` (`id_post`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comments_likes`
--
ALTER TABLE `comments_likes`
  ADD CONSTRAINT `comments_likes_ibfk_1` FOREIGN KEY (`comment_favorite`) REFERENCES `comments` (`id_comment`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comments_likes_ibfk_2` FOREIGN KEY (`user_favorite`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_post`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `posts_likes`
--
ALTER TABLE `posts_likes`
  ADD CONSTRAINT `posts_likes_ibfk_1` FOREIGN KEY (`post_like`) REFERENCES `posts` (`id_post`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `posts_likes_ibfk_2` FOREIGN KEY (`user_like`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `posts_views`
--
ALTER TABLE `posts_views`
  ADD CONSTRAINT `posts_views_ibfk_1` FOREIGN KEY (`post_view`) REFERENCES `posts` (`id_post`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_report`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
