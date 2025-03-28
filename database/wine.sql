-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2025 at 01:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wine`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Rosé Wine', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Made from red grapes but with limited skin contact, giving it a pink hue.&lt;/p&gt;', 1, '2021-07-16 09:08:44'),
(2, 'White Wine', '&lt;p&gt; Made from green or yellowish grapes, often lighter and crisper.&lt;/p&gt;', 1, '2021-07-16 09:09:25'),
(3, 'Red Wine', '&lt;p&gt;Made from dark-colored grape varieties, typically bold and rich in flavor.&lt;/p&gt;', 1, '2021-07-16 09:09:46'),
(5, 'Sparkling Wine', '&lt;p&gt;Contains bubbles due to fermentation, commonly used for celebrations.&lt;/p&gt;', 1, '2025-03-28 07:18:08'),
(6, 'Dessert/Fortified Wine', '&lt;p&gt;Sweet wines often paired with desserts, or wines fortified with spirits for higher alcohol content.&lt;/p&gt;', 1, '2025-03-28 07:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '091023456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-07-16 10:34:48'),
(2, 'Christine Joy', 'Sapra', 'Female', '59568', 'sapra.christinejoybsis2021@gmail.com', '5e279b16115ad426a269e8a11bb48675', 'Miramonte Park Subdivision', '2025-03-28 07:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 2500, '2021-07-16 10:02:39', NULL),
(2, 2, 20, 3500, '2021-07-16 10:09:08', NULL),
(3, 3, 10, 2500, '2021-07-16 12:05:54', NULL),
(4, 4, 50, 1999.99, '2021-07-16 13:12:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(7, 2, 'Miramonte Park Subdivision', 'Online Payment', 2, 1999.99, 1, 1, '2025-03-28 08:08:15', '2025-03-28 08:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(7, 7, 4, 1, 1999.99, 1999.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `author`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'Sangiovese Rosé', 'Italy', '&lt;p&gt;&lt;a target=\\&quot;_blank\\&quot; href=\\&quot;https://www.bing.com/ck/a?!&amp;amp;&amp;amp;p=332e704c2023ba57076cc44162a8c4ea87969eee518ec4bafb48a5852a2061f8JmltdHM9MTc0MzAzMzYwMA&amp;amp;ptn=3&amp;amp;ver=2&amp;amp;hsh=4&amp;amp;fclid=1d622e49-f58d-6cfa-377c-3b5bf44d6df5&amp;amp;psq=Sangiovese+Ros%c3%a9+description&amp;amp;u=a1aHR0cHM6Ly93aW5lZm9sbHkuY29tL2RlZXAtZGl2ZS9ndWlkZS10by1zYW5naW92ZXNlLXdpbmUv&amp;amp;ntb=1\\&quot; h=\\&quot;ID=SERP,5664.1\\&quot; style=\\&quot;touch-action: manipulation; font-size: 14px; line-height: 20px; display: -webkit-box; -webkit-line-clamp: 4; overflow: hidden; text-overflow: ellipsis; font-family: Roboto, Helvetica, sans-serif;\\&quot;&gt;&lt;font color=\\&quot;#efefef\\&quot;&gt;From the delicate floral strawberry aromas of Montefalco Rosso to the intensely dark and tannic wines of Brunello di Montalcino, Sangiovese wine has something for everyone.&lt;/font&gt;&lt;/a&gt;&lt;/p&gt;', 1, '2021-07-16 09:43:11'),
(2, 2, 4, 'Sauvignon Blanc', 'Robert Mondavi Winery', '&lt;p&gt;&lt;a class=\\&quot;gs_mdlink\\&quot; tabindex=\\&quot;0\\&quot; aria-label=\\&quot;View source at winetraveler.com\\&quot; target=\\&quot;_blank\\&quot; href=\\&quot;https://www.bing.com/ck/a?!&amp;amp;&amp;amp;p=c49cdf971d95f5e175484a950050edbc8edfbceeb1706ca7876900584eef0aeeJmltdHM9MTc0MzAzMzYwMA&amp;amp;ptn=3&amp;amp;ver=2&amp;amp;hsh=4&amp;amp;fclid=1d622e49-f58d-6cfa-377c-3b5bf44d6df5&amp;amp;psq=sauvignon+blanc+description&amp;amp;u=a1aHR0cHM6Ly93d3cud2luZXRyYXZlbGVyLmNvbS9ncmFwZS9zYXV2aWdub24tYmxhbmMtd2luZS1ncmFwZS1jaGFyYWN0ZXJpc3RpY3Mv&amp;amp;ntb=1\\&quot; h=\\&quot;ID=SERP,5834.1\\&quot; style=\\&quot;touch-action: manipulation; font-family: Roboto, Helvetica, sans-serif; font-size: 18px;\\&quot;&gt;&lt;span class=\\&quot;gs_cit_txt b_gs_hover\\&quot; data-sups=\\&quot;1,2,3\\&quot; style=\\&quot;touch-action: manipulation; cursor: pointer; text-underline-offset: 1px;\\&quot;&gt;&lt;font color=\\&quot;#000000\\&quot;&gt;Sauvignon Blanc is a&amp;nbsp;&lt;span style=\\&quot;font-weight: 700; touch-action: manipulation;\\&quot;&gt;green-skinned white grape variety that produces a light-colored aromatic dry white wine with a refreshing acidity level&lt;/span&gt;. It is most often used to produce dry white wines.&lt;/font&gt;&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;', 1, '2021-07-16 10:08:53'),
(3, 3, 5, 'Carménère', 'Concha y Toro', '&lt;p&gt;A smooth, medium-bodied red wine originally from France but now primarily grown in Chile. It has flavors of red berries, spice, and earthy notes.&lt;/p&gt;', 1, '2021-07-16 12:03:08'),
(4, 3, 6, 'Cabernet Sauvignon', 'Robert Mondavi', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;&lt;font color=\\&quot;#000000\\&quot;&gt;Rich, bold, high in tannins&lt;/font&gt;&lt;/p&gt;', 1, '2021-07-16 13:11:17');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 3, 8500, '2021-07-16 11:18:12'),
(5, 7, 1999.99, '2025-03-28 08:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Semi-Sweet Rosé', '&lt;p&gt;A balance between dry and sweet&lt;/p&gt;', 1, '2021-07-16 09:10:44'),
(2, 1, 'Dry Rosé', '&lt;p&gt;Crisp, with a light and refreshing finish&lt;/p&gt;', 1, '2021-07-16 09:11:05'),
(3, 2, 'Off-Dry (Semi-Sweet) White Wine', '&lt;p&gt;Slightly sweet with balanced acidity&lt;/p&gt;', 1, '2021-07-16 09:11:36'),
(4, 2, 'Dry White Wine', '&lt;p&gt;Crisp and refreshing, with little to no sweetness&lt;/p&gt;', 1, '2021-07-16 09:12:51'),
(5, 3, 'Medium-Bodied Red Wine', '&lt;p&gt; Balanced tannins with a smoother texture&lt;/p&gt;', 1, '2021-07-16 09:13:28'),
(6, 3, 'Full-Bodied Red Wine', '&lt;p&gt;High in tannins and deep in flavor&lt;/p&gt;', 1, '2021-07-16 09:13:49'),
(7, 4, 'Sub Cat 101', '&lt;p&gt;Sample Sub 107&lt;/p&gt;', 1, '2021-07-16 11:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Wine Shop'),
(6, 'short_name', 'Grapes of Luxury'),
(11, 'logo', 'uploads/1743115680_logo.ico'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1743115860_443997.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'uploads/1743117780_admin.png', NULL, 1, '2021-01-20 14:02:37', '2025-03-28 07:23:47'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
