/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : db_chatbot

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 20/07/2023 10:27:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (2, '2022_03_07_140853_tbl_user', 1);
INSERT INTO `migrations` VALUES (3, '2022_03_19_111809_tbl_produk', 1);
INSERT INTO `migrations` VALUES (4, '2022_03_19_112140_tbl_kategori', 1);
INSERT INTO `migrations` VALUES (5, '2022_03_27_025652_tbl_penjualan', 1);
INSERT INTO `migrations` VALUES (6, '2022_03_27_123212_tbl_support', 1);
INSERT INTO `migrations` VALUES (7, '2022_03_27_123226_tbl_nilai_kombinasi', 1);
INSERT INTO `migrations` VALUES (8, '2022_03_27_123240_tbl_confidence', 1);
INSERT INTO `migrations` VALUES (9, '2022_03_27_123807_tbl_pengujian', 1);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`(191), `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_bot
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bot`;
CREATE TABLE `tbl_bot`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_bot` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pertanyaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `jawaban` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban_salah` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_bot
-- ----------------------------
INSERT INTO `tbl_bot` VALUES (43, 'Stok', 'Halo, kak tas A ready ?\nSelamat pagi, tas A ready ?\nTas A ready ?\nTas A masih ada stok nya ?\nmin tas A ready stock ?\nkah ?', 'Ready ya kak silahkan order dishopee atau tiktok shop', 'Maaf kak untuk produk A stok nya sedang kosong, tapi kami sedang proses produksi, mohon ditunggu sekitar1 –2 Minggu ya ka', '1', '2023-05-28 15:43:29', '2023-06-02 03:07:19');
INSERT INTO `tbl_bot` VALUES (44, 'Location', 'Kak ada offline store nya?\nOffline store nya dimana ka?\nMin, bisa datang langsung ke offline store ga?', 'Mohon maaf untuk saat ini kami hanya melayani pemesanan via online ya kak.', NULL, '1', '2023-06-02 02:56:05', '2023-06-02 10:38:51');
INSERT INTO `tbl_bot` VALUES (45, 'Packaging', 'Pengemasan nya berapa lama ya kak?\nKak orderan saya di tiktok shop langsung dikemas kan?\nDikirimnya berapa lama ya kak?\nDikirim kapan ya kak?\nMin orderan saya dikirimkapan?', 'Halo, masa pengemasan kami sekitar 1-2 hari ya, kami akan kirim pesanan dihari yang sama apabila kakak payment sebelum jam 08.00 WIB, apabila kakak payment diatas 08.00 WIB maka akan dikirim dihari berikutnya. Dan untuk hari minggu kami Off tidak ada pengiriman', NULL, '1', '2023-06-02 02:57:50', '2023-06-02 10:40:31');
INSERT INTO `tbl_bot` VALUES (46, 'Return', 'Min, saya mau pengajuan return karena barang yang saya terimatidak sesuai, Min saya mau return tas nya', 'Halo kak, sebelumnya kami mohon maaf karena kakak tidak puas dengan produk kami,untuk pengajuan return, kaka bisa klik tombol Ajukan Pengembalian yang ada di pesanan kaka pada aplikasi Shopee atau Tiktokshop ya kak', NULL, '1', '2023-06-02 02:58:57', '2023-06-02 10:40:59');
INSERT INTO `tbl_bot` VALUES (47, 'Say Hello', 'Hy.\nHello\nHai\nHallo Min.', 'Hallo ...', NULL, '1', '2023-06-02 03:09:43', '2023-06-02 10:40:42');

-- ----------------------------
-- Table structure for tbl_kategori
-- ----------------------------
DROP TABLE IF EXISTS `tbl_kategori`;
CREATE TABLE `tbl_kategori`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_kategori` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kategori` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_kategori
-- ----------------------------
INSERT INTO `tbl_kategori` VALUES (1, '4ad59fd8-2324-4fce-8b7c-c2fc130328dd', 'SAYURAN', '1');
INSERT INTO `tbl_kategori` VALUES (2, '75bcbfa8-96dc-4b21-a902-b3ba8559e226', 'MINYAK', '1');
INSERT INTO `tbl_kategori` VALUES (3, '801bbfc4-fefa-4513-910a-7b2857d36c30', 'TELUR', '1');
INSERT INTO `tbl_kategori` VALUES (4, '79c917f2-6f26-4c78-897b-8be384592af4', 'TEPUNG', '1');
INSERT INTO `tbl_kategori` VALUES (5, 'bebcb5c2-2f44-479f-8719-51915b422647', 'SIRUP', '1');
INSERT INTO `tbl_kategori` VALUES (6, 'b89498cd-0ea4-405b-88fe-a93b41d30779', 'MAKANANRINGAN', '1');
INSERT INTO `tbl_kategori` VALUES (7, 'd5a448dc-3192-4853-b327-3d23869fa66d', 'BUMBU', '1');
INSERT INTO `tbl_kategori` VALUES (8, 'f3551d63-a772-4b7d-9717-e9022128ccee', 'DAGING', '1');
INSERT INTO `tbl_kategori` VALUES (9, 'ec3f699e-7a60-4704-9463-36475bb81a82', 'DETERJEN', '1');
INSERT INTO `tbl_kategori` VALUES (10, '8a712446-4f10-463f-8367-8da439226304', 'PEWANGI', '1');
INSERT INTO `tbl_kategori` VALUES (11, '43af78b1-6acb-40b8-ad67-a2fe296b687c', 'SABUN', '1');
INSERT INTO `tbl_kategori` VALUES (12, '3fb125aa-a82c-49a2-bb42-8176388b24ff', 'OBAT', '1');
INSERT INTO `tbl_kategori` VALUES (13, '56678756-7de1-4bbe-97fe-e2ba931f9b38', 'MINUMAN', '1');
INSERT INTO `tbl_kategori` VALUES (14, '29f47cc0-cc62-4500-9976-aef2b62ce534', 'SAYURAN', '1');
INSERT INTO `tbl_kategori` VALUES (15, 'b5bb7994-fd26-48e5-be67-47f8713b8ed6', 'MINYAK', '1');
INSERT INTO `tbl_kategori` VALUES (16, '1db26f71-d0c9-433a-88eb-52867c0ae3f7', 'TELUR', '1');
INSERT INTO `tbl_kategori` VALUES (17, '53923b98-6256-48bc-875a-7d9d86a11181', 'TEPUNG', '1');
INSERT INTO `tbl_kategori` VALUES (18, '04c68b83-7ede-4879-b614-e68c6f6e1455', 'SIRUP', '1');
INSERT INTO `tbl_kategori` VALUES (19, '9e80a36d-60fe-4668-a9d7-e6fe303bb856', 'MAKANANRINGAN', '1');
INSERT INTO `tbl_kategori` VALUES (20, '4ac22ea4-5056-47ba-b168-3eec90d94cb6', 'BUMBU', '1');
INSERT INTO `tbl_kategori` VALUES (21, '12b61d33-bfc1-4bad-8bdf-76ffb9f66def', 'DAGING', '1');
INSERT INTO `tbl_kategori` VALUES (22, '00a9679a-bd99-4d55-b129-5c387481cc56', 'DETERJEN', '1');
INSERT INTO `tbl_kategori` VALUES (23, 'c2131df0-f05a-4eec-9cc1-d72e66e51b31', 'PEWANGI', '1');
INSERT INTO `tbl_kategori` VALUES (24, '2ec2e766-1ee5-458f-80a8-1f061639d7a4', 'SABUN', '1');
INSERT INTO `tbl_kategori` VALUES (25, 'c1cafc43-1922-4d73-b1c7-86b2422254f4', 'OBAT', '1');
INSERT INTO `tbl_kategori` VALUES (26, '58b1ab4a-63e1-47bd-85db-c8b093622891', 'MINUMAN', '1');

-- ----------------------------
-- Table structure for tbl_nilai_kombinasi
-- ----------------------------
DROP TABLE IF EXISTS `tbl_nilai_kombinasi`;
CREATE TABLE `tbl_nilai_kombinasi`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_pengujian` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_kombinasi` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_barang_a` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_barang_b` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah_transaksi` int NOT NULL,
  `support` double(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_nilai_kombinasi
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_parameters
-- ----------------------------
DROP TABLE IF EXISTS `tbl_parameters`;
CREATE TABLE `tbl_parameters`  (
  `no_rangka` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type_mobil` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pkb_type` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kilometer` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `total_revenue` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tahun_kontruksi` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `service_kategori` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`no_rangka`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_parameters
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_pengujian
-- ----------------------------
DROP TABLE IF EXISTS `tbl_pengujian`;
CREATE TABLE `tbl_pengujian`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_pengujian` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_penguji` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_supp` int NOT NULL,
  `min_confidence` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_pengujian
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_penjualan`;
CREATE TABLE `tbl_penjualan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_penjualan` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_faktur` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_barang` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_penjualan
-- ----------------------------
INSERT INTO `tbl_penjualan` VALUES (1, '80c950e0-1315-4762-9aa9-5195f7ba6faa', 'e03c3073-4b3b-4a13-8812-37b031a5cf7b', '0740edd9-8a67-452e-8f6c-57ff4c2eca35', '2', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (2, 'f7b3b318-523f-49a8-bf8d-8e445469cd55', 'e03c3073-4b3b-4a13-8812-37b031a5cf7b', 'ec7aec10-1868-417b-a0a7-0f51a8cf35d4', '3', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (3, 'd99fa03c-94f2-4c46-8a59-da48622659f6', 'e03c3073-4b3b-4a13-8812-37b031a5cf7b', '46ccb6ad-4f73-404a-9256-1b6aeafa98db', '6', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (4, '80a6ad09-33c0-44b3-bc23-a56608e679e3', '59c69b53-3ff9-4e19-9bab-3754471ea436', 'adb645bf-44f1-4170-9021-ee8a7c77d017', '1', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (5, '8c5d2d35-b133-4e87-891c-8da930d8a46e', '59c69b53-3ff9-4e19-9bab-3754471ea436', 'a3898aad-a594-451d-9954-2330830784a6', '6', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (6, '57df868c-6d00-4945-ad16-ce2df61514bb', '59c69b53-3ff9-4e19-9bab-3754471ea436', 'd0121c7a-1129-4813-8895-b6ba555f0c43', '8', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (7, '312ad323-fc4f-4848-8285-4a0ea454b377', '59c69b53-3ff9-4e19-9bab-3754471ea436', 'ed467103-af3a-4f01-97e4-c71e5c3078f9', '8', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (8, '4cc14f25-18a4-4f01-af8f-b6b4da631e64', '59c69b53-3ff9-4e19-9bab-3754471ea436', 'b6c5b549-3134-4cc1-9532-c2e54386fbcf', '5', '2023-04-07 14:02:27', '2023-04-07 14:02:27');
INSERT INTO `tbl_penjualan` VALUES (9, '105306f4-db91-4ded-89f1-e980cdaff4b3', '59c69b53-3ff9-4e19-9bab-3754471ea436', 'e3888946-7a40-4111-9d6e-c7708e326958', '8', '2023-04-07 14:02:27', '2023-04-07 14:02:27');

-- ----------------------------
-- Table structure for tbl_produk
-- ----------------------------
DROP TABLE IF EXISTS `tbl_produk`;
CREATE TABLE `tbl_produk`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int NOT NULL,
  `link_shopee` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_tiktokshop` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gambar_produk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stok` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_produk
-- ----------------------------
INSERT INTO `tbl_produk` VALUES (4, 'Produk Baru', 123456, 'https://www.larashout.com/laravel-e-commerce-application-development-catalog-listing', 'https://www.larashout.com/laravel-e-commerce-application-development-catalog-listing', NULL, 'asdasd', '1', '1', '2023-06-10 15:03:00', '2023-06-10 15:07:42', '3d76d4a2-f882-4e40-8479-38aefef010be');
INSERT INTO `tbl_produk` VALUES (5, 'Product hari ini', 200000, 'https://web.telegram.org/a/#6151687233', 'https://web.telegram.org/a/#6151687233', NULL, 'Deskripsi', '1', '1', '2023-07-18 12:35:29', '2023-07-18 12:35:29', 'a3610ef3-46e0-412b-8ac5-e068104a818c');

-- ----------------------------
-- Table structure for tbl_produk_image
-- ----------------------------
DROP TABLE IF EXISTS `tbl_produk_image`;
CREATE TABLE `tbl_produk_image`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_produk_image
-- ----------------------------
INSERT INTO `tbl_produk_image` VALUES (43, '3d76d4a2-f882-4e40-8479-38aefef010be', '1686410427.png', 'unsplash_78A265wPiO4 (2).png', 'images_produk/3d76d4a2-f882-4e40-8479-38aefef010be/1686410427.png', NULL, '2023-06-10 15:20:27', '2023-06-10 15:20:27', NULL);
INSERT INTO `tbl_produk_image` VALUES (44, '3d76d4a2-f882-4e40-8479-38aefef010be', '1686410433.png', 'unsplash_78A265wPiO4 (2).png', 'images_produk/3d76d4a2-f882-4e40-8479-38aefef010be/1686410433.png', NULL, '2023-06-10 15:20:33', '2023-06-10 15:20:33', NULL);
INSERT INTO `tbl_produk_image` VALUES (45, '3d76d4a2-f882-4e40-8479-38aefef010be', '1686410440.png', 'unsplash_78A265wPiO4 (2).png', 'images_produk/3d76d4a2-f882-4e40-8479-38aefef010be/1686410440.png', NULL, '2023-06-10 15:20:40', '2023-06-10 15:20:40', NULL);
INSERT INTO `tbl_produk_image` VALUES (46, 'a3610ef3-46e0-412b-8ac5-e068104a818c', '1689683743.jpg', '0dfae9634f80e2bb36b81417a8f6e454.jpg', 'images_produk/a3610ef3-46e0-412b-8ac5-e068104a818c/1689683743.jpg', NULL, '2023-07-18 12:35:43', '2023-07-18 12:35:43', NULL);
INSERT INTO `tbl_produk_image` VALUES (47, 'a3610ef3-46e0-412b-8ac5-e068104a818c', '1689683743.png', '4.png', 'images_produk/a3610ef3-46e0-412b-8ac5-e068104a818c/1689683743.png', NULL, '2023-07-18 12:35:43', '2023-07-18 12:35:43', NULL);
INSERT INTO `tbl_produk_image` VALUES (48, 'a3610ef3-46e0-412b-8ac5-e068104a818c', '1689683744.jpg', '1024px-10x10_gear.jpg', 'images_produk/a3610ef3-46e0-412b-8ac5-e068104a818c/1689683744.jpg', NULL, '2023-07-18 12:35:44', '2023-07-18 12:35:44', NULL);

-- ----------------------------
-- Table structure for tbl_support
-- ----------------------------
DROP TABLE IF EXISTS `tbl_support`;
CREATE TABLE `tbl_support`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_pengujian` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kd_produk` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `support` double(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 894 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_support
-- ----------------------------
INSERT INTO `tbl_support` VALUES (1, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.01, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (2, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (3, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (4, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (5, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (6, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (7, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (8, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (9, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (10, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (11, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (12, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (13, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (14, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (15, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (16, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.01, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (17, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (18, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (19, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.01, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (20, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (21, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (22, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (23, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (24, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (25, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (26, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (27, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (28, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (29, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (30, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (31, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (32, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (33, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (34, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (35, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (36, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (37, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (38, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (39, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (40, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (41, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (42, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (43, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (44, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (45, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (46, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (47, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.01, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (48, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (49, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (50, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2022-08-06 07:13:56', '2022-08-06 07:13:56');
INSERT INTO `tbl_support` VALUES (51, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (52, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (53, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (54, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (55, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (56, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (57, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (58, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (59, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (60, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (61, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (62, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (63, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (64, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (65, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (66, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (67, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (68, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (69, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (70, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (71, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (72, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (73, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (74, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (75, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (76, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (77, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (78, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (79, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.01, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (80, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (81, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (82, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (83, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (84, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (85, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (86, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (87, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (88, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (89, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (90, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (91, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (92, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (93, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (94, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (95, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (96, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (97, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.01, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (98, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (99, '092deb2b-0856-4670-bbc5-52c3bacf2a6c', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.01, '2022-08-06 07:13:57', '2022-08-06 07:13:57');
INSERT INTO `tbl_support` VALUES (100, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.01, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (101, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (102, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (103, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (104, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (105, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (106, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (107, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (108, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (109, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (110, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (111, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (112, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (113, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (114, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (115, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.01, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (116, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (117, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (118, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.01, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (119, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (120, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (121, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (122, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (123, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (124, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (125, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (126, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (127, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (128, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (129, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (130, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (131, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (132, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (133, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (134, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (135, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (136, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (137, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (138, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (139, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (140, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (141, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (142, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (143, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (144, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (145, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (146, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.01, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (147, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (148, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (149, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (150, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (151, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (152, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (153, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (154, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (155, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (156, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (157, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (158, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (159, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (160, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (161, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (162, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (163, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (164, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (165, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (166, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (167, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (168, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (169, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (170, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (171, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (172, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (173, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (174, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (175, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (176, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (177, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (178, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.01, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (179, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (180, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (181, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (182, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (183, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (184, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (185, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (186, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (187, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (188, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (189, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (190, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (191, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (192, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (193, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (194, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2022-08-06 07:18:28', '2022-08-06 07:18:28');
INSERT INTO `tbl_support` VALUES (195, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2022-08-06 07:18:29', '2022-08-06 07:18:29');
INSERT INTO `tbl_support` VALUES (196, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.01, '2022-08-06 07:18:29', '2022-08-06 07:18:29');
INSERT INTO `tbl_support` VALUES (197, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2022-08-06 07:18:29', '2022-08-06 07:18:29');
INSERT INTO `tbl_support` VALUES (198, 'dd5dd5a4-e14c-4d75-8d3d-407cf3acb901', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.01, '2022-08-06 07:18:29', '2022-08-06 07:18:29');
INSERT INTO `tbl_support` VALUES (199, 'c4d318e0-604f-46f2-8832-b145100ad674', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.01, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (200, 'c4d318e0-604f-46f2-8832-b145100ad674', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (201, 'c4d318e0-604f-46f2-8832-b145100ad674', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (202, 'c4d318e0-604f-46f2-8832-b145100ad674', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (203, 'c4d318e0-604f-46f2-8832-b145100ad674', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (204, 'c4d318e0-604f-46f2-8832-b145100ad674', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (205, 'c4d318e0-604f-46f2-8832-b145100ad674', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (206, 'c4d318e0-604f-46f2-8832-b145100ad674', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2022-08-06 07:19:59', '2022-08-06 07:19:59');
INSERT INTO `tbl_support` VALUES (207, 'c4d318e0-604f-46f2-8832-b145100ad674', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (208, 'c4d318e0-604f-46f2-8832-b145100ad674', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (209, 'c4d318e0-604f-46f2-8832-b145100ad674', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (210, 'c4d318e0-604f-46f2-8832-b145100ad674', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (211, 'c4d318e0-604f-46f2-8832-b145100ad674', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (212, 'c4d318e0-604f-46f2-8832-b145100ad674', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (213, 'c4d318e0-604f-46f2-8832-b145100ad674', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (214, 'c4d318e0-604f-46f2-8832-b145100ad674', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.01, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (215, 'c4d318e0-604f-46f2-8832-b145100ad674', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (216, 'c4d318e0-604f-46f2-8832-b145100ad674', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (217, 'c4d318e0-604f-46f2-8832-b145100ad674', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.01, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (218, 'c4d318e0-604f-46f2-8832-b145100ad674', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (219, 'c4d318e0-604f-46f2-8832-b145100ad674', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (220, 'c4d318e0-604f-46f2-8832-b145100ad674', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (221, 'c4d318e0-604f-46f2-8832-b145100ad674', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (222, 'c4d318e0-604f-46f2-8832-b145100ad674', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (223, 'c4d318e0-604f-46f2-8832-b145100ad674', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (224, 'c4d318e0-604f-46f2-8832-b145100ad674', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (225, 'c4d318e0-604f-46f2-8832-b145100ad674', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (226, 'c4d318e0-604f-46f2-8832-b145100ad674', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (227, 'c4d318e0-604f-46f2-8832-b145100ad674', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (228, 'c4d318e0-604f-46f2-8832-b145100ad674', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (229, 'c4d318e0-604f-46f2-8832-b145100ad674', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (230, 'c4d318e0-604f-46f2-8832-b145100ad674', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (231, 'c4d318e0-604f-46f2-8832-b145100ad674', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (232, 'c4d318e0-604f-46f2-8832-b145100ad674', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (233, 'c4d318e0-604f-46f2-8832-b145100ad674', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (234, 'c4d318e0-604f-46f2-8832-b145100ad674', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (235, 'c4d318e0-604f-46f2-8832-b145100ad674', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (236, 'c4d318e0-604f-46f2-8832-b145100ad674', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (237, 'c4d318e0-604f-46f2-8832-b145100ad674', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (238, 'c4d318e0-604f-46f2-8832-b145100ad674', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (239, 'c4d318e0-604f-46f2-8832-b145100ad674', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (240, 'c4d318e0-604f-46f2-8832-b145100ad674', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (241, 'c4d318e0-604f-46f2-8832-b145100ad674', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (242, 'c4d318e0-604f-46f2-8832-b145100ad674', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (243, 'c4d318e0-604f-46f2-8832-b145100ad674', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (244, 'c4d318e0-604f-46f2-8832-b145100ad674', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (245, 'c4d318e0-604f-46f2-8832-b145100ad674', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.01, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (246, 'c4d318e0-604f-46f2-8832-b145100ad674', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (247, 'c4d318e0-604f-46f2-8832-b145100ad674', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (248, 'c4d318e0-604f-46f2-8832-b145100ad674', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (249, 'c4d318e0-604f-46f2-8832-b145100ad674', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (250, 'c4d318e0-604f-46f2-8832-b145100ad674', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (251, 'c4d318e0-604f-46f2-8832-b145100ad674', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (252, 'c4d318e0-604f-46f2-8832-b145100ad674', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (253, 'c4d318e0-604f-46f2-8832-b145100ad674', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (254, 'c4d318e0-604f-46f2-8832-b145100ad674', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (255, 'c4d318e0-604f-46f2-8832-b145100ad674', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (256, 'c4d318e0-604f-46f2-8832-b145100ad674', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (257, 'c4d318e0-604f-46f2-8832-b145100ad674', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (258, 'c4d318e0-604f-46f2-8832-b145100ad674', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (259, 'c4d318e0-604f-46f2-8832-b145100ad674', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (260, 'c4d318e0-604f-46f2-8832-b145100ad674', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (261, 'c4d318e0-604f-46f2-8832-b145100ad674', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (262, 'c4d318e0-604f-46f2-8832-b145100ad674', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (263, 'c4d318e0-604f-46f2-8832-b145100ad674', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (264, 'c4d318e0-604f-46f2-8832-b145100ad674', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (265, 'c4d318e0-604f-46f2-8832-b145100ad674', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (266, 'c4d318e0-604f-46f2-8832-b145100ad674', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (267, 'c4d318e0-604f-46f2-8832-b145100ad674', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (268, 'c4d318e0-604f-46f2-8832-b145100ad674', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (269, 'c4d318e0-604f-46f2-8832-b145100ad674', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (270, 'c4d318e0-604f-46f2-8832-b145100ad674', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (271, 'c4d318e0-604f-46f2-8832-b145100ad674', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (272, 'c4d318e0-604f-46f2-8832-b145100ad674', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (273, 'c4d318e0-604f-46f2-8832-b145100ad674', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (274, 'c4d318e0-604f-46f2-8832-b145100ad674', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (275, 'c4d318e0-604f-46f2-8832-b145100ad674', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (276, 'c4d318e0-604f-46f2-8832-b145100ad674', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (277, 'c4d318e0-604f-46f2-8832-b145100ad674', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.01, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (278, 'c4d318e0-604f-46f2-8832-b145100ad674', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (279, 'c4d318e0-604f-46f2-8832-b145100ad674', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (280, 'c4d318e0-604f-46f2-8832-b145100ad674', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (281, 'c4d318e0-604f-46f2-8832-b145100ad674', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (282, 'c4d318e0-604f-46f2-8832-b145100ad674', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (283, 'c4d318e0-604f-46f2-8832-b145100ad674', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (284, 'c4d318e0-604f-46f2-8832-b145100ad674', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (285, 'c4d318e0-604f-46f2-8832-b145100ad674', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (286, 'c4d318e0-604f-46f2-8832-b145100ad674', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (287, 'c4d318e0-604f-46f2-8832-b145100ad674', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (288, 'c4d318e0-604f-46f2-8832-b145100ad674', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (289, 'c4d318e0-604f-46f2-8832-b145100ad674', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (290, 'c4d318e0-604f-46f2-8832-b145100ad674', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (291, 'c4d318e0-604f-46f2-8832-b145100ad674', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (292, 'c4d318e0-604f-46f2-8832-b145100ad674', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (293, 'c4d318e0-604f-46f2-8832-b145100ad674', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (294, 'c4d318e0-604f-46f2-8832-b145100ad674', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (295, 'c4d318e0-604f-46f2-8832-b145100ad674', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.01, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (296, 'c4d318e0-604f-46f2-8832-b145100ad674', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (297, 'c4d318e0-604f-46f2-8832-b145100ad674', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.01, '2022-08-06 07:20:00', '2022-08-06 07:20:00');
INSERT INTO `tbl_support` VALUES (298, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.01, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (299, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (300, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (301, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (302, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (303, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (304, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (305, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (306, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (307, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (308, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (309, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (310, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (311, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (312, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (313, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.01, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (314, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (315, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (316, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.01, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (317, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (318, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (319, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (320, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (321, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (322, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (323, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (324, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (325, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (326, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (327, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (328, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (329, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (330, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (331, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (332, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (333, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (334, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (335, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (336, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (337, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (338, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (339, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (340, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (341, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (342, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (343, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (344, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.01, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (345, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (346, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (347, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (348, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (349, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (350, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (351, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (352, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (353, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (354, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (355, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (356, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (357, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (358, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (359, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (360, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (361, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (362, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (363, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (364, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (365, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (366, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (367, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (368, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (369, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (370, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (371, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (372, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (373, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (374, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (375, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (376, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.01, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (377, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (378, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (379, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (380, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (381, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (382, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (383, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (384, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (385, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (386, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (387, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (388, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (389, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (390, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (391, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (392, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (393, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (394, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.01, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (395, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (396, 'ee94b553-c6f8-46f7-abe1-06962ac7327b', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.01, '2022-08-06 07:56:46', '2022-08-06 07:56:46');
INSERT INTO `tbl_support` VALUES (397, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.01, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (398, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (399, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (400, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (401, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (402, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (403, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (404, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (405, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (406, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (407, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (408, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (409, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2022-11-16 00:15:43', '2022-11-16 00:15:43');
INSERT INTO `tbl_support` VALUES (410, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (411, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (412, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.01, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (413, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (414, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (415, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.01, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (416, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (417, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (418, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (419, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (420, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (421, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (422, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (423, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (424, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (425, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (426, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (427, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (428, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (429, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (430, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (431, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (432, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (433, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (434, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (435, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (436, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (437, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (438, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (439, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (440, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (441, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (442, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (443, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.01, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (444, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (445, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (446, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (447, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (448, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (449, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (450, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (451, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (452, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (453, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (454, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (455, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (456, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (457, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (458, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (459, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (460, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (461, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (462, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (463, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (464, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (465, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (466, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (467, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (468, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (469, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (470, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (471, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (472, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (473, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (474, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (475, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.01, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (476, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (477, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (478, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (479, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (480, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (481, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (482, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (483, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (484, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (485, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (486, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (487, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (488, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (489, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (490, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (491, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (492, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (493, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.01, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (494, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (495, 'a522abaf-9f6b-413f-897d-5d9aeac63dcb', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.01, '2022-11-16 00:15:44', '2022-11-16 00:15:44');
INSERT INTO `tbl_support` VALUES (496, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.01, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (497, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (498, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (499, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (500, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (501, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (502, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (503, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (504, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (505, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (506, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (507, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (508, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (509, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (510, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (511, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.01, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (512, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (513, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (514, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.01, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (515, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (516, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (517, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (518, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (519, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (520, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (521, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (522, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (523, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (524, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (525, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (526, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (527, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (528, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (529, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (530, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (531, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (532, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (533, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (534, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (535, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (536, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (537, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (538, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (539, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (540, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (541, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (542, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.01, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (543, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (544, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (545, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (546, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (547, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (548, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (549, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (550, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (551, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (552, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (553, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (554, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (555, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (556, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (557, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (558, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (559, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (560, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (561, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (562, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (563, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (564, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (565, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (566, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (567, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (568, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (569, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (570, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (571, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (572, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (573, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (574, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.01, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (575, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (576, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (577, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (578, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (579, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (580, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (581, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (582, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (583, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (584, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (585, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (586, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (587, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (588, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (589, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (590, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (591, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (592, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.01, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (593, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (594, '8b7c309c-83a4-4b18-acc2-b737cc0f4964', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.01, '2022-11-16 00:17:03', '2022-11-16 00:17:03');
INSERT INTO `tbl_support` VALUES (595, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.01, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (596, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (597, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (598, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (599, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (600, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (601, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (602, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (603, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (604, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (605, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (606, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (607, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (608, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (609, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (610, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.01, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (611, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (612, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (613, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.01, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (614, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (615, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (616, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (617, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (618, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (619, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (620, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (621, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (622, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (623, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (624, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (625, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (626, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (627, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (628, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (629, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (630, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (631, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (632, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (633, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (634, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (635, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (636, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (637, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (638, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (639, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (640, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (641, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.01, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (642, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (643, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (644, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (645, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (646, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (647, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (648, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (649, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (650, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (651, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (652, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (653, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (654, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (655, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (656, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (657, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (658, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (659, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (660, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (661, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (662, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (663, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (664, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (665, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (666, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (667, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (668, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (669, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (670, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (671, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (672, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (673, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.01, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (674, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (675, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (676, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (677, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (678, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (679, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (680, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (681, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (682, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (683, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (684, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (685, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (686, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (687, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (688, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (689, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (690, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (691, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.01, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (692, '1d3a2762-bc81-4c4e-9e89-36770b94685e', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (693, '1d3a2762-bc81-4c4e-9e89-36770b94685e', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.01, '2023-01-17 13:40:04', '2023-01-17 13:40:04');
INSERT INTO `tbl_support` VALUES (694, '928be044-27e1-4692-954d-65920b30c94b', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (695, '928be044-27e1-4692-954d-65920b30c94b', 'a1c2ff70-a82c-448b-a77f-c15089b891db', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (696, '928be044-27e1-4692-954d-65920b30c94b', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (697, '928be044-27e1-4692-954d-65920b30c94b', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (698, '928be044-27e1-4692-954d-65920b30c94b', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (699, '928be044-27e1-4692-954d-65920b30c94b', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (700, '928be044-27e1-4692-954d-65920b30c94b', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (701, '928be044-27e1-4692-954d-65920b30c94b', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (702, '928be044-27e1-4692-954d-65920b30c94b', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (703, '928be044-27e1-4692-954d-65920b30c94b', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (704, '928be044-27e1-4692-954d-65920b30c94b', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (705, '928be044-27e1-4692-954d-65920b30c94b', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (706, '928be044-27e1-4692-954d-65920b30c94b', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (707, '928be044-27e1-4692-954d-65920b30c94b', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (708, '928be044-27e1-4692-954d-65920b30c94b', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (709, '928be044-27e1-4692-954d-65920b30c94b', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (710, '928be044-27e1-4692-954d-65920b30c94b', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (711, '928be044-27e1-4692-954d-65920b30c94b', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (712, '928be044-27e1-4692-954d-65920b30c94b', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (713, '928be044-27e1-4692-954d-65920b30c94b', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (714, '928be044-27e1-4692-954d-65920b30c94b', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (715, '928be044-27e1-4692-954d-65920b30c94b', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (716, '928be044-27e1-4692-954d-65920b30c94b', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (717, '928be044-27e1-4692-954d-65920b30c94b', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (718, '928be044-27e1-4692-954d-65920b30c94b', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (719, '928be044-27e1-4692-954d-65920b30c94b', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (720, '928be044-27e1-4692-954d-65920b30c94b', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (721, '928be044-27e1-4692-954d-65920b30c94b', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (722, '928be044-27e1-4692-954d-65920b30c94b', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (723, '928be044-27e1-4692-954d-65920b30c94b', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (724, '928be044-27e1-4692-954d-65920b30c94b', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (725, '928be044-27e1-4692-954d-65920b30c94b', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (726, '928be044-27e1-4692-954d-65920b30c94b', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (727, '928be044-27e1-4692-954d-65920b30c94b', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (728, '928be044-27e1-4692-954d-65920b30c94b', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (729, '928be044-27e1-4692-954d-65920b30c94b', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (730, '928be044-27e1-4692-954d-65920b30c94b', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (731, '928be044-27e1-4692-954d-65920b30c94b', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (732, '928be044-27e1-4692-954d-65920b30c94b', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (733, '928be044-27e1-4692-954d-65920b30c94b', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (734, '928be044-27e1-4692-954d-65920b30c94b', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (735, '928be044-27e1-4692-954d-65920b30c94b', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (736, '928be044-27e1-4692-954d-65920b30c94b', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (737, '928be044-27e1-4692-954d-65920b30c94b', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (738, '928be044-27e1-4692-954d-65920b30c94b', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (739, '928be044-27e1-4692-954d-65920b30c94b', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (740, '928be044-27e1-4692-954d-65920b30c94b', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (741, '928be044-27e1-4692-954d-65920b30c94b', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (742, '928be044-27e1-4692-954d-65920b30c94b', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (743, '928be044-27e1-4692-954d-65920b30c94b', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (744, '928be044-27e1-4692-954d-65920b30c94b', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (745, '928be044-27e1-4692-954d-65920b30c94b', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (746, '928be044-27e1-4692-954d-65920b30c94b', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (747, '928be044-27e1-4692-954d-65920b30c94b', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (748, '928be044-27e1-4692-954d-65920b30c94b', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (749, '928be044-27e1-4692-954d-65920b30c94b', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (750, '928be044-27e1-4692-954d-65920b30c94b', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (751, '928be044-27e1-4692-954d-65920b30c94b', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (752, '928be044-27e1-4692-954d-65920b30c94b', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (753, '928be044-27e1-4692-954d-65920b30c94b', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (754, '928be044-27e1-4692-954d-65920b30c94b', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (755, '928be044-27e1-4692-954d-65920b30c94b', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (756, '928be044-27e1-4692-954d-65920b30c94b', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (757, '928be044-27e1-4692-954d-65920b30c94b', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (758, '928be044-27e1-4692-954d-65920b30c94b', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2023-01-27 11:43:44', '2023-01-27 11:43:44');
INSERT INTO `tbl_support` VALUES (759, '928be044-27e1-4692-954d-65920b30c94b', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (760, '928be044-27e1-4692-954d-65920b30c94b', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (761, '928be044-27e1-4692-954d-65920b30c94b', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (762, '928be044-27e1-4692-954d-65920b30c94b', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (763, '928be044-27e1-4692-954d-65920b30c94b', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (764, '928be044-27e1-4692-954d-65920b30c94b', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (765, '928be044-27e1-4692-954d-65920b30c94b', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (766, '928be044-27e1-4692-954d-65920b30c94b', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (767, '928be044-27e1-4692-954d-65920b30c94b', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (768, '928be044-27e1-4692-954d-65920b30c94b', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (769, '928be044-27e1-4692-954d-65920b30c94b', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (770, '928be044-27e1-4692-954d-65920b30c94b', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (771, '928be044-27e1-4692-954d-65920b30c94b', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (772, '928be044-27e1-4692-954d-65920b30c94b', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (773, '928be044-27e1-4692-954d-65920b30c94b', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (774, '928be044-27e1-4692-954d-65920b30c94b', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (775, '928be044-27e1-4692-954d-65920b30c94b', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (776, '928be044-27e1-4692-954d-65920b30c94b', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (777, '928be044-27e1-4692-954d-65920b30c94b', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (778, '928be044-27e1-4692-954d-65920b30c94b', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (779, '928be044-27e1-4692-954d-65920b30c94b', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (780, '928be044-27e1-4692-954d-65920b30c94b', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (781, '928be044-27e1-4692-954d-65920b30c94b', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (782, '928be044-27e1-4692-954d-65920b30c94b', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (783, '928be044-27e1-4692-954d-65920b30c94b', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (784, '928be044-27e1-4692-954d-65920b30c94b', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (785, '928be044-27e1-4692-954d-65920b30c94b', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (786, '928be044-27e1-4692-954d-65920b30c94b', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (787, '928be044-27e1-4692-954d-65920b30c94b', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (788, '928be044-27e1-4692-954d-65920b30c94b', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (789, '928be044-27e1-4692-954d-65920b30c94b', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (790, '928be044-27e1-4692-954d-65920b30c94b', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (791, '928be044-27e1-4692-954d-65920b30c94b', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (792, '928be044-27e1-4692-954d-65920b30c94b', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (793, '928be044-27e1-4692-954d-65920b30c94b', '95fd23af-0385-48a3-9739-361f2c77a1f9', 0.00, '2023-01-27 11:43:45', '2023-01-27 11:43:45');
INSERT INTO `tbl_support` VALUES (794, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'ea3f72cc-209a-4e3c-8d7b-25f8e3e04de5', 1.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (795, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '82d76e25-aefd-4f88-b92f-f4b244476b9a', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (796, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '98062467-c0b8-4234-ad7c-1b7381d8bbfb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (797, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'e80a360c-609f-4930-9252-0a507e3828c0', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (798, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'b77edd81-a498-42a9-bd0c-b9bb65b64268', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (799, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '10ae514b-1b6d-46e4-afd7-2f75f0e5ecac', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (800, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '4b2a9320-c1dd-43fb-9392-8cc3fd33425c', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (801, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'cc41a48c-8ac1-4aa2-b9c2-8c4a734a60a9', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (802, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '450022b9-b6b4-429f-bcd3-e921a5aa4ed7', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (803, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '1dcaf25c-848e-43d9-9104-40fd8bf65b4b', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (804, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '36fad843-9ef1-4887-9d70-4c3a07e36cba', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (805, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '8a1f0fa4-0e27-4d22-b648-69112af67650', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (806, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'c99ecf2d-b083-427e-8bc9-9eb780de7d5c', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (807, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'd090675a-4cdd-4a35-af75-a902d546fd97', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (808, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'bf9fdfb4-cea3-420c-8714-ce1830f962a7', 1.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (809, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '87263cee-60a7-494a-86d7-075e49e4790c', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (810, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '97482d78-e298-43b3-b19e-10262a82d4c0', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (811, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '590b356b-9cf8-4ebb-82c5-d2779181d8a9', 1.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (812, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'b511ecbe-8e17-47bc-ad83-94c735b658b1', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (813, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'd6449644-7425-4863-b509-bce2a52067c9', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (814, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'e0e34a8f-8fe5-46d5-9e02-4ea01c88071d', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (815, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'f74e7dc7-c04c-47fc-b068-b71d3575de5b', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (816, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'bbc79d0f-f1c7-436e-a3b2-7e7c19376f00', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (817, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '32c17f02-aa7c-4a32-bc7b-b20f55014cec', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (818, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'd847878b-36f0-43f6-bc01-bb24493469e0', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (819, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'ac49f950-fae9-4bb4-bf9c-a092ef993ebb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (820, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '6cec0f9d-0162-492b-bc5e-2551b730ada5', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (821, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'cae36695-3ccd-4828-b2a4-2bd47b1f2c89', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (822, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '59d25dd0-740f-43bd-a976-6215585aaa3e', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (823, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'bed0e0a3-5c25-4dcd-b252-72a16081aaf9', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (824, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '04b6ea08-407b-4a6b-8685-8ee03af4aea7', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (825, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'cc87a3de-1a04-4f09-8c86-9b3272128a84', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (826, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'cae8acfd-d1e8-47f6-a68f-d7dca1a0f60a', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (827, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'e9a6ed5b-5a3f-41ab-ac69-095460c87cb8', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (828, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'ef8c4568-b9c7-4194-975f-f940250452cc', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (829, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '3e1bcadb-f939-46f2-9630-4a1dc269b623', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (830, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '6b57df05-bebf-43b1-9314-1fc0aba094cc', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (831, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '9157506b-19f0-4230-9601-a3608597f7fb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (832, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '8f08f60b-1bda-40ef-a59a-f27074939507', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (833, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '215462c6-ec85-4d64-a53a-661e9974dbb9', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (834, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '793fe9bc-e28b-4602-87ca-e5105fe083d1', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (835, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '3ca5e8d6-a0b7-4185-ae66-bdfdac0c1631', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (836, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '9475320a-bc0c-48da-9269-3e23fc6dcf07', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (837, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'feef14e3-eb88-4fc8-8324-7b5e8e7a6fec', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (838, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '5c5a1022-f173-4d08-b204-a6d06ab412a7', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (839, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'eb946832-ee54-4475-9975-94b03f9fdc6f', 1.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (840, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '89b7f544-a6cc-44e3-a4e7-481a8fb1c45e', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (841, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'df5580c1-746d-49cd-84cd-ad21071157e7', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (842, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'd9550e5e-bf67-4530-9639-0b13caef2bcc', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (843, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '5ab5f26a-6e74-442b-a168-6de70e8af222', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (844, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '1479fee5-7e5f-4f82-8986-caec99f21b3b', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (845, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'd8ed734d-a87b-4a92-9a27-c586553ec99d', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (846, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '946b7b67-c0c7-41d9-8eef-07d0521928ef', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (847, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'da43d596-ad16-436c-8bc0-a9d4c455574a', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (848, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'c5ddbfe9-8e75-4f39-9d2f-7da0ef89faa5', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (849, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '56228c84-f8ab-440d-8cdd-92cd797973eb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (850, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '9feba773-326e-4c0d-a088-0b1ab596812b', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (851, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'a15c45b6-1779-4cc4-aff1-625a46313329', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (852, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '2dc856b5-8843-4f90-8f09-6b6e6bbd5978', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (853, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'a73c46c8-e031-4582-8720-96ede798b41c', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (854, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'ef9f2c8d-564a-461a-b18d-351b9b7dfe1a', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (855, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '5785d293-8f50-431d-9b22-b983b4337953', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (856, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '9d41bbf1-24cf-4b88-8cc3-cf91c5c3b59b', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (857, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'f3b60880-43e5-467c-8367-77a4d842d97c', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (858, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '492fbf40-8120-474e-ad14-98f41dcd71b5', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (859, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'b385e6cf-3bcf-4496-8116-a2305b741e4f', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (860, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'c5efc930-0fd8-46df-b87b-9c30b0232534', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (861, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '65101241-09a7-4c98-8d26-9d50d6e10ddd', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (862, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '30841768-8c0e-4bd3-b89c-fd08eae6454d', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (863, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '7dc77ed2-1fde-494b-a746-25be7e668b17', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (864, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '8186d4c9-fa9d-4399-a89f-bec786cbd60e', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (865, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '58aa3714-a465-4049-b265-cd9e1f59d2a8', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (866, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '8d905446-b7a9-402c-a120-b5529b81df04', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (867, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '7d5c030a-c2c5-4366-b1d8-3834e2ce44cd', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (868, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'fff800ef-9d20-4078-9a6d-5f0482b5c373', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (869, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'f9b76e68-1902-44a8-a5e2-baaa31e49c54', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (870, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '9ad02ae0-0384-48b2-9812-98c9e52d46d3', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (871, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'f40e01e2-d74c-477d-89a7-c42a95681583', 1.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (872, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '76d6a936-3fe7-4c67-9253-48d73404c887', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (873, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'c47534d2-484e-4e7e-b44a-181a0d010613', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (874, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'c5685368-5947-4c88-bcfe-914d5fcd65eb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (875, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'b4af0908-3900-4880-9845-d9fe021468ae', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (876, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '1b1d4804-527e-4aa0-b4d9-c60bbfb87d15', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (877, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'cb23d619-4e07-4e6e-a3ec-39a0d0139d7a', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (878, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '02c80c16-9f04-4ccb-8706-068c0469b890', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (879, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '6c06ff19-a670-4ceb-b72a-d4f2151afea3', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (880, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '49cf8b73-ca22-4569-8620-afb5d2bc9efb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (881, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'ae0446aa-6fca-43e3-becc-1384bd7800cb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (882, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '454f03b2-27bb-4b32-aa4c-63fe93226e9d', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (883, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '57783117-8fdc-44cb-91c5-2906812e3791', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (884, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '7a909b63-2257-4f52-934a-36640054176e', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (885, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '6aeae7d2-d70c-4294-a8ae-e0d69c89cc40', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (886, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '757fba97-630f-45da-b62b-d739b81602ca', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (887, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '4d30ded1-c004-4792-bcf7-222f83cf2bc6', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (888, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'b2091a45-eab8-4823-9b27-60eb025db0eb', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (889, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'c5e3c8c4-61fd-4b39-889f-68524cc12af7', 1.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (890, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', 'c4eedcf3-d7a1-4ca5-a64b-2cff84a095e2', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (891, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '62318ec3-33db-49e4-996e-f26cf0bac990', 1.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (892, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '0d75fcf4-1ef9-427c-84f2-9c2d630663ae', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');
INSERT INTO `tbl_support` VALUES (893, 'b65b3ea9-bfba-48c3-a68c-17677d33bce0', '8ed833cb-ad8b-4e72-9c77-1e2c93d23a25', 0.00, '2023-01-27 11:53:19', '2023-01-27 11:53:19');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES (1, 'admin', 'ADMIN', '$2y$10$2.p/1SWtx.nK9Kwp0O/Q5.xLTnh.i4Ge2B7TVtcbFYNkumYaGzzvO', NULL, '2022-08-06 07:10:34', '2022-08-06 07:10:34', '1');
INSERT INTO `tbl_user` VALUES (2, 'user', 'USER', '$2y$10$M5HeFcVlEaE4kD0TlqAN8u.oHQMM8TXwboSsVZbLE94soiCODbzw2', NULL, '2022-08-06 07:10:34', '2022-08-06 07:10:34', '1');
INSERT INTO `tbl_user` VALUES (3, 'ica', 'ADMIN', '$2y$10$SNHRkq4lzJLtIxouyJ9rrOU0n5q7wXr1xx7zERTnctLEqwXmnv3R.', NULL, '2023-06-10 13:34:24', '2023-06-10 13:34:24', '1');

SET FOREIGN_KEY_CHECKS = 1;
