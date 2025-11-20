/*
 Navicat Premium Dump SQL

 Source Server         : pgsql_case
 Source Server Type    : PostgreSQL
 Source Server Version : 180001 (180001)
 Source Host           : localhost:5432
 Source Catalog        : laravel
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 180001 (180001)
 File Encoding         : 65001

 Date: 21/11/2025 01:07:04
*/


-- ----------------------------
-- Sequence structure for cart_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cart_items_id_seq";
CREATE SEQUENCE "public"."cart_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for carts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."carts_id_seq";
CREATE SEQUENCE "public"."carts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for categories_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."categories_id_seq";
CREATE SEQUENCE "public"."categories_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for failed_jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."failed_jobs_id_seq";
CREATE SEQUENCE "public"."failed_jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for jobs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jobs_id_seq";
CREATE SEQUENCE "public"."jobs_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."migrations_id_seq";
CREATE SEQUENCE "public"."migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for order_items_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."order_items_id_seq";
CREATE SEQUENCE "public"."order_items_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for orders_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."orders_id_seq";
CREATE SEQUENCE "public"."orders_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for products_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."products_id_seq";
CREATE SEQUENCE "public"."products_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS "public"."cache";
CREATE TABLE "public"."cache" (
  "key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "value" text COLLATE "pg_catalog"."default" NOT NULL,
  "expiration" int4 NOT NULL
)
;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS "public"."cache_locks";
CREATE TABLE "public"."cache_locks" (
  "key" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "owner" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "expiration" int4 NOT NULL
)
;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."cart_items";
CREATE TABLE "public"."cart_items" (
  "id" int8 NOT NULL DEFAULT nextval('cart_items_id_seq'::regclass),
  "cart_id" int8 NOT NULL,
  "product_id" int8 NOT NULL,
  "quantity" int4 NOT NULL DEFAULT 1,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of cart_items
-- ----------------------------

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS "public"."carts";
CREATE TABLE "public"."carts" (
  "id" int8 NOT NULL DEFAULT nextval('carts_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS "public"."categories";
CREATE TABLE "public"."categories" (
  "id" int8 NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO "public"."categories" VALUES (1, 'Sağlık Ürünleri', 'Nisi commodi quia deleniti veritatis.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (2, 'Bebek Ürünleri', 'Est molestias nihil est sint.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (3, 'Telefon', 'Sequi qui voluptatem hic.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (4, 'Fotoğraf Ekipmanları', 'Illo enim voluptatem ratione corporis vero.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (5, 'Oyuncak', 'Fugiat nulla voluptas exercitationem sed ducimus.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (6, 'Bahçe Malzemeleri', 'Laudantium delectus ducimus ut nihil ex.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (7, 'Mobilya', 'Aut distinctio sit quas eos.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (8, 'Elektronik', 'Sapiente nisi magnam aperiam earum.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (9, 'Bebek Ürünleri', 'Reiciendis officia eligendi quisquam repudiandae fuga vel.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (10, 'Ev Eşyası', 'Dolore dolores minima repellendus aperiam eaque.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (11, 'Otomobil Aksesuarları', 'Perspiciatis facilis suscipit minus qui unde dicta aut.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (12, 'Ev Eşyası', 'Fugiat id reprehenderit maxime eum.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (13, 'Telefon', 'Non et odit vel quis nulla.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (14, 'Otomobil Aksesuarları', 'Ipsam rem exercitationem odio.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (15, 'Fotoğraf Ekipmanları', 'Expedita libero molestias sit eum.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (16, 'Giyim', 'Qui dolorum qui occaecati rerum.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (17, 'Bebek Ürünleri', 'Quas quo aliquam eius cum illo tenetur.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (18, 'Fotoğraf Ekipmanları', 'Officiis fugit corrupti aut.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (19, 'Kırtasiye', 'Pariatur ipsum fugit est ut.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."categories" VALUES (20, 'Saat', 'Mollitia fuga consequatur et nisi iste.', '2025-11-20 22:05:42', '2025-11-20 22:05:42');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."failed_jobs";
CREATE TABLE "public"."failed_jobs" (
  "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
  "uuid" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "connection" text COLLATE "pg_catalog"."default" NOT NULL,
  "queue" text COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "exception" text COLLATE "pg_catalog"."default" NOT NULL,
  "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS "public"."job_batches";
CREATE TABLE "public"."job_batches" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "total_jobs" int4 NOT NULL,
  "pending_jobs" int4 NOT NULL,
  "failed_jobs" int4 NOT NULL,
  "failed_job_ids" text COLLATE "pg_catalog"."default" NOT NULL,
  "options" text COLLATE "pg_catalog"."default",
  "cancelled_at" int4,
  "created_at" int4 NOT NULL,
  "finished_at" int4
)
;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS "public"."jobs";
CREATE TABLE "public"."jobs" (
  "id" int8 NOT NULL DEFAULT nextval('jobs_id_seq'::regclass),
  "queue" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "attempts" int2 NOT NULL,
  "reserved_at" int4,
  "available_at" int4 NOT NULL,
  "created_at" int4 NOT NULL
)
;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."migrations";
CREATE TABLE "public"."migrations" (
  "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
  "migration" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "batch" int4 NOT NULL
)
;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO "public"."migrations" VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO "public"."migrations" VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO "public"."migrations" VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO "public"."migrations" VALUES (4, '2025_11_18_104658_add_columns_to_users_table', 1);
INSERT INTO "public"."migrations" VALUES (5, '2025_11_18_104800_create_categories_table', 1);
INSERT INTO "public"."migrations" VALUES (6, '2025_11_18_104905_create_products_table', 1);
INSERT INTO "public"."migrations" VALUES (7, '2025_11_18_105006_create_carts_table', 1);
INSERT INTO "public"."migrations" VALUES (8, '2025_11_18_105147_create_cart_items_table', 1);
INSERT INTO "public"."migrations" VALUES (9, '2025_11_18_105442_create_orders_table', 1);
INSERT INTO "public"."migrations" VALUES (10, '2025_11_18_105535_create_order_items_table', 1);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS "public"."order_items";
CREATE TABLE "public"."order_items" (
  "id" int8 NOT NULL DEFAULT nextval('order_items_id_seq'::regclass),
  "order_id" int8 NOT NULL,
  "product_id" int8 NOT NULL,
  "quantity" int4 NOT NULL DEFAULT 1,
  "price" numeric(8,2) NOT NULL DEFAULT '0'::numeric,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of order_items
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS "public"."orders";
CREATE TABLE "public"."orders" (
  "id" int8 NOT NULL DEFAULT nextval('orders_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "total_amount" numeric(10,2) NOT NULL,
  "status" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'pending'::character varying,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."password_reset_tokens";
CREATE TABLE "public"."password_reset_tokens" (
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(0)
)
;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS "public"."products";
CREATE TABLE "public"."products" (
  "id" int8 NOT NULL DEFAULT nextval('products_id_seq'::regclass),
  "category_id" int8 NOT NULL,
  "name" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default",
  "price" numeric(10,2) NOT NULL,
  "stock_quantity" int4 NOT NULL DEFAULT 0,
  "created_at" timestamp(0),
  "updated_at" timestamp(0)
)
;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO "public"."products" VALUES (1, 1, 'Dolor vero nisi architecto eius voluptas.', 'Ab molestiae dolorem sed provident eum ut alias maxime in autem.', 771.98, 49, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (2, 1, 'Alias neque aut delectus id.', 'Quo numquam aspernatur quibusdam id ut labore doloremque nulla quaerat sequi distinctio ab.', 960.35, 36, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (3, 1, 'Hic qui incidunt perferendis rerum iure dolorem sit.', 'Doloribus provident adipisci rem voluptatem velit quia non est est.', 39.64, 95, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (4, 1, 'Culpa quae fugit ipsum quo.', 'Est itaque dolorem qui sit maiores voluptatem doloribus eaque consequuntur ut.', 707.62, 43, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (5, 1, 'Rerum nihil nisi debitis et expedita corporis omnis.', 'Adipisci voluptatem et voluptatibus reiciendis adipisci ut sed voluptatem quos non.', 719.07, 81, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (6, 2, 'Voluptate nesciunt qui sequi sit impedit sequi architecto.', 'Consequuntur est non voluptates atque voluptas sint suscipit est et iste laudantium est ut.', 508.41, 19, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (7, 2, 'Reprehenderit consequatur accusantium facilis qui non est excepturi delectus.', 'Repellat quod modi laudantium sed optio ipsam nihil accusantium.', 371.63, 97, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (8, 2, 'Omnis commodi qui laborum dolores est ullam cum.', 'Laboriosam rerum sit sint consequatur et atque.', 894.73, 49, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (9, 2, 'Maiores voluptatem ratione animi illo.', 'Nam dolorem tenetur totam fugiat ex dolorem voluptatem commodi qui voluptas minima.', 215.58, 41, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (10, 2, 'Inventore sint qui nisi mollitia et eveniet distinctio.', 'Accusantium dolorem quasi cupiditate ut enim dolorum omnis qui ipsum dolorem praesentium.', 390.42, 49, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (11, 3, 'Totam asperiores fuga minus totam repellat omnis et ut.', 'Dolore iusto voluptatem veniam corrupti dignissimos ipsam qui aut ratione iusto.', 423.25, 61, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (12, 3, 'Qui quia cum praesentium minus fugiat.', 'Velit autem corrupti iste aut nemo ea.', 580.53, 37, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (13, 3, 'Molestiae culpa impedit saepe est voluptatem dolorem.', 'Corporis dolor sit quis quo asperiores quis magnam reprehenderit.', 853.20, 46, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (14, 3, 'Delectus illo incidunt consequatur dignissimos placeat.', 'Officia eius illum dolorem dolore eligendi repellat id optio expedita alias consequatur incidunt.', 281.58, 55, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (15, 3, 'Dolor accusantium aliquam quia nemo tempora id et ullam.', 'Neque aliquid quod fugiat quo nesciunt maxime.', 526.64, 77, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (16, 4, 'Cum doloremque suscipit id earum est aliquam ratione.', 'Voluptas explicabo nostrum itaque impedit blanditiis voluptas quidem alias facere dicta nesciunt ut.', 788.44, 23, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (17, 4, 'Fuga sed perspiciatis fugiat voluptas accusamus sequi.', 'Perspiciatis aliquam laudantium est deleniti magnam nisi magnam quos.', 884.27, 41, '2025-11-20 22:05:42', '2025-11-20 22:05:42');
INSERT INTO "public"."products" VALUES (18, 4, 'Rerum a natus cum quia est earum perspiciatis.', 'Quod ut odit aut debitis sed quod sunt.', 552.35, 47, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (19, 4, 'Aut error sunt illum ex quas assumenda.', 'Est ipsa accusamus quia occaecati est voluptatum accusantium tempora aperiam eaque odio autem.', 463.96, 37, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (20, 4, 'Sit sit aut ipsa maxime et ut perferendis.', 'Nulla minus est praesentium maiores voluptatem sunt inventore.', 799.59, 100, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (21, 5, 'Voluptas consequatur in aspernatur.', 'Earum officiis excepturi dicta itaque dolorem est consequatur aliquam ipsa quasi assumenda qui.', 287.15, 61, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (22, 5, 'Temporibus aliquam illum in voluptatibus nesciunt libero sint.', 'Cupiditate voluptatem autem voluptas delectus ipsam assumenda aut porro odit iusto itaque vel saepe.', 925.08, 31, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (23, 5, 'Aut officiis eligendi et sit qui cumque ut.', 'Tempore rerum nam occaecati tenetur voluptatem quia fugit eos dolores quos dolorem pariatur.', 848.81, 0, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (24, 5, 'Animi quisquam repellat est.', 'Id vero voluptatem blanditiis ratione nobis rerum fuga.', 771.33, 64, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (25, 5, 'Id impedit tempore numquam rem libero.', 'Odit sed possimus hic et quia nihil expedita et necessitatibus voluptatem odio tempore.', 789.98, 32, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (26, 6, 'Assumenda molestias omnis sint soluta.', 'Quos et nesciunt nam non itaque quis sint.', 381.33, 21, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (27, 6, 'Quidem ad optio tenetur alias.', 'Maxime quos expedita deleniti deserunt sit eligendi ipsum ea.', 522.70, 63, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (28, 6, 'Enim dolores autem dolor ut debitis nemo.', 'Fugiat nesciunt distinctio accusamus dolor et repudiandae eum omnis illo cum et.', 839.35, 4, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (29, 6, 'Facilis quaerat in dolorem.', 'Laborum tempora eos id enim consectetur reprehenderit sit non suscipit molestiae.', 453.48, 16, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (30, 6, 'Nesciunt blanditiis voluptas voluptas harum et consequuntur.', 'Et neque corporis omnis non est animi minima delectus.', 734.13, 43, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (31, 7, 'Distinctio quia enim ut natus occaecati.', 'Non nihil repudiandae ipsum ullam est esse temporibus aliquid porro quisquam et.', 862.46, 15, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (32, 7, 'Aliquam rerum earum aut enim.', 'Ratione et accusantium blanditiis repellendus autem corrupti illo consequatur laudantium nulla.', 30.39, 82, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (33, 7, 'Praesentium voluptatem perferendis iure quis.', 'Repudiandae quos dolor impedit sint repudiandae sunt sint asperiores ipsam.', 838.56, 63, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (34, 7, 'Repellat veritatis saepe tenetur et.', 'Recusandae corporis voluptatem sit excepturi dolorem enim quaerat impedit in.', 290.21, 21, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (35, 7, 'Eos dolorem impedit inventore autem atque assumenda fuga.', 'Ea in ex sequi ut doloremque recusandae doloribus molestiae esse est vel reprehenderit non.', 392.65, 98, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (36, 8, 'Repudiandae maxime laudantium illum unde placeat.', 'Molestiae delectus placeat explicabo culpa ipsam dolor aut laborum.', 9.52, 29, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (37, 8, 'Aut ut facere exercitationem in rerum omnis sunt est.', 'Porro dolor eos possimus omnis qui ad at non non nam atque architecto vel.', 872.82, 72, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (38, 8, 'Voluptatem voluptas reprehenderit vitae debitis ut repellat ut.', 'Ratione sit placeat numquam omnis voluptate est nihil ut voluptas praesentium accusantium sit.', 138.18, 66, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (39, 8, 'Quasi eveniet recusandae sint ut qui dolore.', 'Iusto placeat voluptatem rerum id hic quasi quae.', 479.88, 35, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (40, 8, 'Optio velit totam saepe reprehenderit.', 'Sunt iusto enim ipsam nesciunt quod non delectus.', 195.63, 55, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (41, 9, 'Commodi qui reprehenderit aut aspernatur sunt sit temporibus corporis.', 'Libero illo voluptatem incidunt ipsum repellat fuga nesciunt.', 46.79, 39, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (42, 9, 'Rerum illum minima maxime omnis aut quia saepe.', 'Nesciunt rerum quia illum quasi est molestias rerum qui et.', 572.91, 86, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (43, 9, 'Debitis et laborum dolor et qui nihil quas rerum.', 'Rem qui sed sunt dolor rem expedita quisquam sequi iure.', 953.03, 95, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (44, 9, 'Qui expedita ducimus consequuntur dolorum et ex dolorem.', 'Eligendi adipisci modi beatae perspiciatis amet aut eligendi expedita.', 226.13, 85, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (45, 9, 'Occaecati quo ut praesentium dolores consectetur quos dolores.', 'Quo voluptas maiores aut beatae aliquid ut ipsam error eius ut beatae.', 322.83, 38, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (46, 10, 'Ipsum aliquam quo corporis inventore laborum quia.', 'Dignissimos animi possimus ipsum ut nam non.', 114.91, 64, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (47, 10, 'Dolorum quas odio magni laudantium tenetur laboriosam magni.', 'Et amet aut quasi vitae aut odio consequatur cum magnam sed minus dolor quo.', 282.48, 85, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (48, 10, 'Aut ratione officiis asperiores culpa.', 'Reprehenderit illo minus sed eaque pariatur sapiente ab numquam vitae est.', 4.24, 85, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (49, 10, 'Delectus deserunt aut repudiandae officia.', 'Delectus aut cum fugiat iure quas perspiciatis nisi ut voluptas est in culpa vitae.', 287.26, 94, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (50, 10, 'Voluptates accusamus porro qui ut quam quos atque.', 'Doloribus aut quia et et quo voluptates reprehenderit ipsa minima doloribus.', 702.55, 36, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (51, 11, 'Quam maiores ducimus aperiam molestias quo eum provident.', 'Similique provident ipsum eos incidunt voluptatibus beatae quis natus adipisci eligendi dolor.', 876.07, 40, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (52, 11, 'Qui autem et ad odio ut laboriosam non facere.', 'Eum aut ut nihil ut voluptatem occaecati sit enim soluta et sapiente eveniet est.', 456.40, 50, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (53, 11, 'Ipsum corporis et suscipit.', 'Odio est suscipit laboriosam pariatur ut ipsa.', 666.47, 94, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (54, 11, 'Eligendi debitis aut sunt est.', 'Ea rerum animi quos quis voluptates eum tempora animi nobis porro cupiditate deleniti.', 712.66, 12, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (55, 11, 'Maiores autem ut itaque tempora deleniti ex.', 'Sint quas a quo enim qui eos sed.', 386.24, 28, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (56, 12, 'Laboriosam quaerat ab eos qui.', 'Quod et voluptatum unde fugiat quis natus.', 947.04, 65, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (57, 12, 'Impedit accusamus qui cupiditate voluptas veritatis.', 'Quia nihil necessitatibus esse et incidunt voluptate incidunt vitae autem aliquid dolore.', 475.12, 40, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (58, 12, 'Voluptatem totam quia minima molestiae cum sint.', 'Molestiae rerum vel quisquam ut odit qui aspernatur.', 123.10, 65, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (59, 12, 'Dolores ipsa accusamus eveniet cupiditate facere natus repudiandae.', 'Deleniti enim et a iste mollitia voluptatibus et rerum.', 460.05, 98, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (60, 12, 'Aliquam officia ut perferendis est consectetur tempora doloribus.', 'Minima quod voluptas voluptas et doloribus at ducimus similique numquam cupiditate temporibus asperiores.', 862.04, 21, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (61, 13, 'Excepturi illo placeat iusto nostrum tempora.', 'Quibusdam odio inventore doloribus qui quo ut optio et voluptas mollitia ut.', 43.31, 56, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (62, 13, 'Dolor est omnis est cumque et.', 'Quo sed quibusdam omnis et ex similique.', 685.38, 41, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (63, 13, 'Occaecati occaecati amet eligendi cupiditate numquam.', 'Dignissimos cupiditate eaque officia praesentium at autem incidunt accusamus est.', 986.00, 18, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (64, 13, 'Esse aut unde est ducimus laudantium porro corporis.', 'Aut odio molestiae optio laboriosam eum voluptate.', 698.53, 83, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (65, 13, 'Dolore sed adipisci est voluptate porro.', 'Minima assumenda officiis sapiente fugit iure vitae rerum.', 441.57, 26, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (66, 14, 'Voluptatem aut harum sit molestiae optio quaerat.', 'Rerum ut ut sunt nihil voluptatem expedita et voluptate laborum explicabo possimus dolores.', 668.98, 39, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (67, 14, 'Ut aut officiis possimus accusamus vitae.', 'Voluptatem laudantium recusandae officia rerum quis sit.', 266.63, 18, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (68, 14, 'Ipsam ullam eos saepe quia qui perspiciatis.', 'Similique et sed id magni beatae corporis quaerat incidunt tempora porro eligendi.', 760.16, 30, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (69, 14, 'Et quia ducimus dicta aut at eos aliquid doloremque.', 'Fuga omnis provident nesciunt voluptatem consequuntur odio dolores modi dolores sed.', 579.48, 46, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (70, 14, 'Quia expedita illo reprehenderit quae.', 'Amet non sed sed ex sit totam ea at.', 277.79, 1, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (71, 15, 'Earum adipisci qui ipsum.', 'Veritatis iure minus odit aperiam non non eligendi rerum sit et.', 815.32, 93, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (72, 15, 'Dolor veniam vel alias quis.', 'Ex illum vel dolore quia unde dolore dolor at aut voluptas itaque.', 50.87, 85, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (73, 15, 'Qui aliquam eius ratione ipsam ut hic.', 'Quos et rerum et temporibus libero et omnis omnis eligendi at vero commodi.', 185.39, 75, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (74, 15, 'Deleniti atque unde odio ipsa.', 'Molestias optio molestias vel eius laborum qui qui et pariatur.', 62.73, 19, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (75, 15, 'Occaecati officiis dolores ut quod ducimus.', 'Eos quia voluptas corporis velit eligendi amet a.', 425.66, 11, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (76, 16, 'Quia qui alias accusamus aperiam ipsum.', 'Perferendis vel dolor error quia commodi esse animi doloremque quibusdam modi ut explicabo.', 317.12, 90, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (77, 16, 'Qui esse voluptate qui ut molestiae molestiae.', 'Quia est culpa ipsum explicabo veniam a quibusdam inventore facere quas illo.', 877.03, 71, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (78, 16, 'Ad sed et quasi soluta quis.', 'Corrupti aut ut praesentium quos non natus pariatur.', 682.24, 13, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (79, 16, 'Similique laborum qui quaerat sit fugit tempora.', 'Itaque est sint velit voluptatem fuga unde ut voluptates.', 986.02, 28, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (80, 16, 'Optio ut velit reiciendis omnis.', 'Facere rerum et quia et perspiciatis qui officiis maiores velit magnam illo.', 599.32, 32, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (81, 17, 'Officiis illum sunt molestiae nam cupiditate quibusdam eligendi.', 'Ipsam deserunt quis ipsa numquam odio et.', 183.11, 46, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (82, 17, 'Quia molestiae consectetur odio sequi numquam.', 'Dolores aperiam magnam praesentium impedit eius nulla.', 990.77, 12, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (83, 17, 'Voluptatem ipsam nesciunt odio eum.', 'Veniam dolore occaecati debitis ex in sit voluptas.', 851.93, 9, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (84, 17, 'Est soluta perferendis delectus reiciendis esse repellat.', 'Voluptatibus a placeat magnam sequi non illum aut delectus quia ad similique.', 323.71, 49, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (85, 17, 'Recusandae ipsa est distinctio natus occaecati.', 'Enim et iste perferendis id fuga veritatis sunt similique cupiditate tempore saepe.', 926.03, 95, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (86, 18, 'Qui molestiae in veniam deserunt tempore alias.', 'Et laboriosam amet optio et aut illo doloribus sunt eius sed qui.', 454.61, 47, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (87, 18, 'Dolor dolorem id molestiae ut.', 'Facilis libero voluptatem qui nihil culpa omnis voluptas vel sed qui.', 352.40, 30, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (88, 18, 'Rerum soluta quo odio fugit amet.', 'Sed aliquid et molestiae magni sed sed molestiae ut officia tempora.', 400.66, 52, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (89, 18, 'Est sed hic inventore in ut consequatur voluptate.', 'Necessitatibus et aut qui et similique est quia qui rerum dolores quisquam sequi ipsam.', 340.29, 95, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (90, 18, 'Quam eum nemo provident cupiditate odit cupiditate.', 'Dolor vel voluptate eius atque molestiae quam.', 551.43, 70, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (91, 19, 'Explicabo quia quibusdam est sit vitae sed temporibus.', 'Repudiandae dolores distinctio enim non officia nulla et ut accusamus nemo voluptatem voluptate doloribus.', 303.63, 91, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (92, 19, 'Et laudantium neque autem aliquam inventore sit possimus sint.', 'Quia amet culpa quas quo ipsum blanditiis sunt laboriosam reiciendis tenetur et at.', 177.60, 41, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (93, 19, 'Corrupti voluptas et consequatur et.', 'Mollitia laudantium saepe qui quod quod ratione fugit voluptas repudiandae.', 743.62, 18, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (94, 19, 'Voluptatem omnis nihil qui quibusdam veniam.', 'Quibusdam facilis velit perferendis excepturi natus beatae.', 442.86, 53, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (95, 19, 'Aliquam fugit et quis placeat porro ullam.', 'Harum quia quia esse earum omnis placeat dolores enim nisi dicta qui.', 458.17, 94, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (96, 20, 'Alias magni et quaerat qui laudantium.', 'Sint reprehenderit aliquid rem dolorum et dicta quos libero nostrum incidunt quia sapiente.', 911.01, 7, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (97, 20, 'Sint qui molestias consequuntur voluptatum vel facilis exercitationem possimus.', 'Nostrum mollitia dolorum dolorem sunt similique porro.', 318.80, 79, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (98, 20, 'Dolore facilis tempora fugit.', 'Non animi nisi eveniet aperiam quia reprehenderit porro dolorem est omnis quia.', 899.47, 12, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (99, 20, 'Ratione sed iure exercitationem.', 'Voluptatem et cumque ut vitae voluptatem aspernatur assumenda voluptatem maiores veniam odit officiis ut.', 629.82, 30, '2025-11-20 22:05:43', '2025-11-20 22:05:43');
INSERT INTO "public"."products" VALUES (100, 20, 'Ad perspiciatis expedita incidunt modi omnis.', 'Tenetur voluptate eum eos dolores veniam iste.', 523.43, 73, '2025-11-20 22:05:43', '2025-11-20 22:05:43');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS "public"."sessions";
CREATE TABLE "public"."sessions" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8,
  "ip_address" varchar(45) COLLATE "pg_catalog"."default",
  "user_agent" text COLLATE "pg_catalog"."default",
  "payload" text COLLATE "pg_catalog"."default" NOT NULL,
  "last_activity" int4 NOT NULL
)
;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO "public"."sessions" VALUES ('xlRU8MuTlfP8TpVi5GI4QZOCszFqTr5fxo5vqOQh', NULL, '172.18.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2RaMkNTUGVabEU5Rmpuak13Q0ZseDFINVBJSW8yZ2VKU1FOQVhOciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763676313);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email_verified_at" timestamp(0),
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "role" varchar(255) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'user'::character varying
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'Salih Gencer', 'admin@test.com', NULL, '$2y$12$Y.oqGAnf2qGzAuoM5cCbfuEgI3okIZ7rg5fjt4DUfvoNkdK44xdYC', NULL, NULL, NULL, 'admin');
INSERT INTO "public"."users" VALUES (2, 'Ali Veli', 'user@test.com', NULL, '$2y$12$NJqYGDwk1pY/a3s7xkTfZut7Ch.xjEy.OGVgd5fwTXsMh/yAjCrze', NULL, NULL, NULL, 'user');
INSERT INTO "public"."users" VALUES (3, 'Ayşe Yılmaz', 'ayse@mail.com', NULL, '$2y$12$r8.p0e/mUl3dAGEMN0zgXeTfFaC0WGgVO9TZ8SW29dGlk5lK6bGmO', NULL, NULL, NULL, 'user');
INSERT INTO "public"."users" VALUES (4, 'Mehmet Demir', 'mehmetdemir@mail.com', NULL, '$2y$12$MZNRpCMToTkx3Cv2TOf5N.UK5lRjlXTV6ClKP1G0YIwWQwWUIX17C', NULL, NULL, NULL, 'user');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cart_items_id_seq"
OWNED BY "public"."cart_items"."id";
SELECT setval('"public"."cart_items_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."carts_id_seq"
OWNED BY "public"."carts"."id";
SELECT setval('"public"."carts_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."categories_id_seq"
OWNED BY "public"."categories"."id";
SELECT setval('"public"."categories_id_seq"', 20, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."failed_jobs_id_seq"
OWNED BY "public"."failed_jobs"."id";
SELECT setval('"public"."failed_jobs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."jobs_id_seq"
OWNED BY "public"."jobs"."id";
SELECT setval('"public"."jobs_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."migrations_id_seq"
OWNED BY "public"."migrations"."id";
SELECT setval('"public"."migrations_id_seq"', 10, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."order_items_id_seq"
OWNED BY "public"."order_items"."id";
SELECT setval('"public"."order_items_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."orders_id_seq"
OWNED BY "public"."orders"."id";
SELECT setval('"public"."orders_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."products_id_seq"
OWNED BY "public"."products"."id";
SELECT setval('"public"."products_id_seq"', 100, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 4, true);

-- ----------------------------
-- Primary Key structure for table cache
-- ----------------------------
ALTER TABLE "public"."cache" ADD CONSTRAINT "cache_pkey" PRIMARY KEY ("key");

-- ----------------------------
-- Primary Key structure for table cache_locks
-- ----------------------------
ALTER TABLE "public"."cache_locks" ADD CONSTRAINT "cache_locks_pkey" PRIMARY KEY ("key");

-- ----------------------------
-- Primary Key structure for table cart_items
-- ----------------------------
ALTER TABLE "public"."cart_items" ADD CONSTRAINT "cart_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table carts
-- ----------------------------
ALTER TABLE "public"."carts" ADD CONSTRAINT "carts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table categories
-- ----------------------------
ALTER TABLE "public"."categories" ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_uuid_unique" UNIQUE ("uuid");

-- ----------------------------
-- Primary Key structure for table failed_jobs
-- ----------------------------
ALTER TABLE "public"."failed_jobs" ADD CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table job_batches
-- ----------------------------
ALTER TABLE "public"."job_batches" ADD CONSTRAINT "job_batches_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table jobs
-- ----------------------------
CREATE INDEX "jobs_queue_index" ON "public"."jobs" USING btree (
  "queue" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table jobs
-- ----------------------------
ALTER TABLE "public"."jobs" ADD CONSTRAINT "jobs_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table migrations
-- ----------------------------
ALTER TABLE "public"."migrations" ADD CONSTRAINT "migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table order_items
-- ----------------------------
ALTER TABLE "public"."order_items" ADD CONSTRAINT "order_items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Checks structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_status_check" CHECK (status::text = ANY (ARRAY['pending'::character varying, 'processing'::character varying, 'completed'::character varying, 'cancelled'::character varying]::text[]));

-- ----------------------------
-- Primary Key structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table password_reset_tokens
-- ----------------------------
ALTER TABLE "public"."password_reset_tokens" ADD CONSTRAINT "password_reset_tokens_pkey" PRIMARY KEY ("email");

-- ----------------------------
-- Primary Key structure for table products
-- ----------------------------
ALTER TABLE "public"."products" ADD CONSTRAINT "products_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sessions
-- ----------------------------
CREATE INDEX "sessions_last_activity_index" ON "public"."sessions" USING btree (
  "last_activity" "pg_catalog"."int4_ops" ASC NULLS LAST
);
CREATE INDEX "sessions_user_id_index" ON "public"."sessions" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sessions
-- ----------------------------
ALTER TABLE "public"."sessions" ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_email_unique" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table cart_items
-- ----------------------------
ALTER TABLE "public"."cart_items" ADD CONSTRAINT "cart_items_cart_id_foreign" FOREIGN KEY ("cart_id") REFERENCES "public"."carts" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."cart_items" ADD CONSTRAINT "cart_items_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table carts
-- ----------------------------
ALTER TABLE "public"."carts" ADD CONSTRAINT "carts_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table order_items
-- ----------------------------
ALTER TABLE "public"."order_items" ADD CONSTRAINT "order_items_order_id_foreign" FOREIGN KEY ("order_id") REFERENCES "public"."orders" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."order_items" ADD CONSTRAINT "order_items_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "public"."products" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table orders
-- ----------------------------
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table products
-- ----------------------------
ALTER TABLE "public"."products" ADD CONSTRAINT "products_category_id_foreign" FOREIGN KEY ("category_id") REFERENCES "public"."categories" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
