-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 06 2015 г., 16:35
-- Версия сервера: 5.6.26
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kinomonster`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Фильмы'),
(2, 'Сериалы');

-- --------------------------------------------------------

--
-- Структура таблицы `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descriptions` text NOT NULL,
  `year` int(4) NOT NULL,
  `rating` float NOT NULL,
  `poster` varchar(255) NOT NULL,
  `add_date` datetime NOT NULL,
  `category_id` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `movie`
--

INSERT INTO `movie` (`id`, `name`, `descriptions`, `year`, `rating`, `poster`, `add_date`, `category_id`) VALUES
(605, 'Джой', 'Joy', 2015, 0, 'http://c.cinemate.cc/media/m/4/5/154054/0.big.jpg', '2015-12-05 17:50:27', 1),
(606, 'Лазурный берег', 'By the Sea', 2015, 0, 'http://c.cinemate.cc/media/m/3/1/159513/0.big.jpg', '2015-12-05 17:50:27', 1),
(607, 'Сотрясение', 'Concussion', 2015, 0, 'http://c.cinemate.cc/media/m/9/4/157449/0.big.jpg', '2015-12-05 17:50:27', 1),
(608, 'Кукла', 'The Boy', 2015, 5.7, 'http://c.cinemate.cc/media/m/7/6/159067/0.big.jpg', '2015-12-05 17:50:27', 1),
(609, 'И грянул шторм', 'The Finest Hours', 2015, 0, 'http://c.cinemate.cc/media/m/8/9/159198/0_1.big.jpg', '2015-12-05 17:50:27', 1),
(610, 'Дочь Бога', 'Daughter of God', 2015, 0, 'http://c.cinemate.cc/media/m/2/7/159272/0.big.jpg', '2015-12-05 17:50:27', 1),
(611, 'Девушка из Дании', 'The Danish Girl', 2015, 5.4, 'http://c.cinemate.cc/media/m/8/8/159788/0.big.jpg', '2015-12-05 17:50:27', 1),
(612, 'Выживший', 'The Revenant', 2015, 0, 'http://c.cinemate.cc/media/m/0/9/155290/0.big.jpg', '2015-12-03 17:50:27', 1),
(613, 'Сестры', 'Sisters', 2015, 0, 'http://c.cinemate.cc/media/m/0/1/153610/0_1.big.jpg', '2015-12-05 17:50:27', 1),
(614, 'Крид', 'Creed', 2015, 0, 'http://c.cinemate.cc/media/m/5/7/157775/0_qHqshz3.big.jpg', '2015-12-05 17:50:27', 1),
(615, 'Элвин и бурундуки 4', 'Alvin and the Chipmunks: The Road Chip', 2015, 0, 'http://c.cinemate.cc/media/m/5/7/137475/0.big.jpg', '2015-12-05 17:50:27', 1),
(616, 'Стив Джобс', 'Steve Jobs', 2015, 6.4, 'http://c.cinemate.cc/media/m/1/7/157771/0_RfDTyDZ.big.jpg', '2015-12-05 17:50:27', 1),
(617, 'Крампус', 'Krampus', 2015, 0, 'http://c.cinemate.cc/media/m/3/7/157773/0.big.jpg', '2015-12-05 17:50:27', 1),
(618, 'На гребне волны', 'Point Break', 2015, 0, 'http://c.cinemate.cc/media/m/6/0/155006/0.big.jpg', '2015-12-05 17:50:27', 1),
(619, 'Декиру: Магические камни', 'Dekiru: The Three Stones', 2015, 0, 'http://c.cinemate.cc/media/m/5/8/159885/0.big.jpg', '2015-12-05 17:50:27', 1),
(620, 'Зачинщики', 'Masterminds', 2015, 0, 'http://c.cinemate.cc/media/m/5/3/153535/0.big.jpg', '2015-12-05 17:50:27', 1),
(621, 'Любите Куперов', 'Love the Coopers', 2015, 0, 'http://c.cinemate.cc/media/m/2/6/159062/0.big.jpg', '2015-12-05 17:50:27', 1),
(622, 'Звёздные войны: Пробуждение силы', 'Star Wars: Episode VII - The Force Awakens', 2015, 0, 'http://c.cinemate.cc/media/m/6/8/120786/0.big.jpg', '2015-12-05 17:50:27', 1),
(623, 'Рождество', 'X-Mas', 2015, 0, 'http://c.cinemate.cc/media/m/7/3/156737/0.big.jpg', '2015-12-05 17:50:27', 1),
(624, 'Утешение', 'Solace', 2015, 6.4, 'http://c.cinemate.cc/media/m/2/6/157762/0.big.jpg', '2015-12-05 17:50:27', 1),
(625, 'В сердце моря', 'In the Heart of the Sea', 2015, 0, 'http://c.cinemate.cc/media/m/6/9/154996/0.big.jpg', '2015-12-05 17:50:27', 1),
(626, 'Шпионский мост', 'Bridge of Spies', 2015, 8.3, 'http://c.cinemate.cc/media/m/0/1/155010/0.big.jpg', '2015-12-05 17:50:27', 1),
(627, 'Ужастики', 'Goosebumps', 2015, 7.3, 'http://c.cinemate.cc/media/m/4/8/155284/0_VvqPtmT.big.jpg', '2015-12-05 17:50:27', 1),
(628, 'Хороший динозавр', 'The Good Dinosaur', 2015, 0, 'http://c.cinemate.cc/media/m/4/7/137474/0.big.jpg', '2015-12-05 17:50:27', 1),
(629, 'Наёмница', 'Sicario', 2015, 8.1, 'http://c.cinemate.cc/media/m/1/2/158621/0.big.jpg', '2015-12-05 17:50:27', 1),
(655, 'База Куантико', 'Quantico', 2015, 7.6, 'http://c.cinemate.cc/media/m/9/6/159969/0.big.jpg', '2015-12-05 17:50:41', 2),
(656, 'Тайны и ложь', 'Secrets and Lies', 2015, 7.7, 'http://c.cinemate.cc/media/m/3/6/157863/0.big.jpg', '2015-12-05 17:50:41', 2),
(657, 'Майлз с другой планеты', 'Miles from Tomorrowland', 2015, 7.9, 'http://c.cinemate.cc/media/m/5/7/158275/0.big.jpg', '2015-12-05 17:50:41', 2),
(658, 'Бойтесь ходячих мертвецов', 'Fear the Walking Dead', 2015, 7.7, 'http://c.cinemate.cc/media/m/2/5/159652/0.big.jpg', '2015-12-05 17:50:41', 2),
(659, 'Покажите мне героя', 'Show Me a Hero', 2015, 8.3, 'http://c.cinemate.cc/media/m/9/9/159599/0.big.jpg', '2015-12-05 17:50:41', 2),
(660, 'Кей Си. Под прикрытием', 'K.C. Undercover', 2015, 6.1, 'http://c.cinemate.cc/media/m/0/4/159640/0.big.jpg', '2015-12-05 17:50:41', 2),
(661, 'Гигантские мечи', 'Big Giant Swords', 2015, 8.1, 'http://c.cinemate.cc/media/m/7/9/159297/0.big.jpg', '2015-12-05 17:50:41', 2),
(662, 'Футболисты', 'Ballers', 2015, 7.5, 'http://c.cinemate.cc/media/m/7/1/159017/0.big.jpg', '2015-12-05 17:50:41', 2),
(663, 'На грани', 'The Brink', 2015, 7.9, 'http://c.cinemate.cc/media/m/8/1/159018/0.big.jpg', '2015-12-05 17:50:41', 2),
(664, 'Шёпот', 'The Whispers', 2015, 7.4, 'http://c.cinemate.cc/media/m/4/1/158814/0.big.jpg', '2015-12-05 17:50:41', 2),
(665, 'Харви Бикс', 'Harvey Beaks', 2015, 6.9, 'http://c.cinemate.cc/media/m/9/3/158939/0_1.big.jpg', '2015-12-05 17:50:41', 2),
(666, 'Водолей', 'Aquarius', 2015, 7, 'http://c.cinemate.cc/media/m/1/5/158751/0.big.jpg', '2015-12-05 17:50:41', 2),
(667, 'Сосны', 'Wayward Pines', 2015, 7.8, 'http://c.cinemate.cc/media/m/0/0/157700/0_1.big.jpg', '2015-12-05 17:50:41', 2),
(668, 'Типа счастье', 'Happyish', 2015, 7.2, 'http://c.cinemate.cc/media/m/4/2/158424/0.big.jpg', '2015-12-05 17:50:41', 2),
(669, 'Белла и Бульдоги', 'Bella and the Bulldogs', 2015, 5, 'http://c.cinemate.cc/media/m/7/0/160007/0.big.jpg', '2015-12-05 17:50:41', 2),
(670, 'Батл Крик', 'Battle Creek', 2015, 7.4, 'http://c.cinemate.cc/media/m/0/3/157830/0.big.jpg', '2015-12-05 17:50:41', 2),
(671, 'Лучше звоните Солу', 'Better Call Saul', 2015, 8.9, 'http://c.cinemate.cc/media/m/0/2/157520/0.big.jpg', '2015-12-05 17:50:41', 2),
(672, 'Вместе', 'Togetherness', 2015, 7.5, 'http://c.cinemate.cc/media/m/1/6/156961/0.big.jpg', '2015-12-05 17:50:41', 2),
(673, 'Империя', 'Empire', 2015, 8, 'http://c.cinemate.cc/media/m/5/8/156885/0.big.jpg', '2015-12-05 17:50:41', 2),
(674, 'Клуб жён астронавтов', 'The Astronaut Wives Club', 2015, 7.1, 'http://c.cinemate.cc/media/m/1/8/158981/0.big.jpg', '2015-12-05 17:50:41', 2),
(675, 'Нереально', 'UnREAL', 2015, 7.8, 'http://c.cinemate.cc/media/m/2/8/158982/0.big.jpg', '2015-12-05 17:50:41', 2),
(676, 'Странная парочка', 'The Odd Couple', 2015, 6.4, 'http://c.cinemate.cc/media/m/5/1/157715/0.big.jpg', '2015-12-05 17:50:41', 2),
(677, 'Ты, я и конец света', 'You, Me and the Apocalypse', 2015, 7.9, 'http://c.cinemate.cc/media/m/0/2/160020/0.big.jpg', '2015-12-05 17:50:41', 2),
(678, 'Крупный улов', 'Catching Monsters', 2015, 0, 'http://c.cinemate.cc/media/m/4/2/160024/0.big.jpg', '2015-12-05 17:50:41', 2),
(679, 'Американская одиссея', 'American Odyssey', 2015, 7.2, 'http://c.cinemate.cc/media/m/3/3/158233/0.big.jpg', '2015-12-05 17:50:41', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` tinyint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `slug`) VALUES
(1, 'Новость 1', 'Это текст новости 1', 'news-1'),
(11, 'Новость 2', 'Текст новости 2', 'news-2'),
(14, 'Новость 3', 'Текст новости 3', 'news-3');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=705;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` tinyint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
