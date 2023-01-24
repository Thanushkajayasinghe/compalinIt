--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.2

-- Started on 2023-01-24 15:34:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 24871)
-- Name: audittrail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audittrail (
    auditid integer NOT NULL,
    event character varying(200),
    page character varying(200),
    cby integer,
    cdate integer
);


ALTER TABLE public.audittrail OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24874)
-- Name: audittrail_auditid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audittrail_auditid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audittrail_auditid_seq OWNER TO postgres;

--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 210
-- Name: audittrail_auditid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audittrail_auditid_seq OWNED BY public.audittrail.auditid;


--
-- TOC entry 211 (class 1259 OID 24875)
-- Name: mainbanner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainbanner (
    bannerid integer NOT NULL,
    imageurl character varying(500),
    textheading1 character varying(100),
    textheading2 character varying(100),
    textheading3 character varying(100),
    textheading4 character varying(100),
    status character varying(20)
);


ALTER TABLE public.mainbanner OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24880)
-- Name: banners_bannerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banners_bannerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banners_bannerid_seq OWNER TO postgres;

--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 212
-- Name: banners_bannerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banners_bannerid_seq OWNED BY public.mainbanner.bannerid;


--
-- TOC entry 213 (class 1259 OID 24881)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    catid integer NOT NULL,
    catname character varying(150),
    catlevel integer,
    parentid integer,
    status character varying(20)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24884)
-- Name: categories_catid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_catid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_catid_seq OWNER TO postgres;

--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 214
-- Name: categories_catid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_catid_seq OWNED BY public.categories.catid;


--
-- TOC entry 215 (class 1259 OID 24885)
-- Name: cp_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cp_user (
    user_serial integer NOT NULL,
    user_id character varying(500) NOT NULL,
    full_name character varying(1000) NOT NULL,
    email character varying(500),
    tele_no character varying(100),
    address character varying(1000),
    status character varying(100) NOT NULL,
    cby integer NOT NULL,
    cdate timestamp without time zone NOT NULL
);


ALTER TABLE public.cp_user OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24890)
-- Name: cp_user_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cp_user_group (
    user_group_serial integer NOT NULL,
    user_group_name character varying(1000) NOT NULL,
    group_status character varying(100) NOT NULL,
    cby integer NOT NULL,
    cdate timestamp without time zone NOT NULL
);


ALTER TABLE public.cp_user_group OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24895)
-- Name: cp_user_group_user_group_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cp_user_group ALTER COLUMN user_group_serial ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cp_user_group_user_group_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 24896)
-- Name: cp_user_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cp_user_login (
    user_login_serial integer NOT NULL,
    user_serial integer NOT NULL,
    user_group_serial integer NOT NULL,
    user_name character varying(500) NOT NULL,
    password character varying(100000) NOT NULL,
    status character varying(100) NOT NULL,
    cby integer NOT NULL,
    cdate timestamp without time zone NOT NULL
);


ALTER TABLE public.cp_user_login OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24901)
-- Name: cp_user_login_user_login_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cp_user_login ALTER COLUMN user_login_serial ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cp_user_login_user_login_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 24902)
-- Name: cp_user_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cp_user_permission (
    user_permission_serial integer NOT NULL,
    user_group_serial integer NOT NULL,
    permission_master_serial integer NOT NULL,
    read_only character varying(50),
    read_and_write_only character varying(50)
);


ALTER TABLE public.cp_user_permission OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24905)
-- Name: cp_user_permission_user_permission_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cp_user_permission ALTER COLUMN user_permission_serial ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cp_user_permission_user_permission_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 24906)
-- Name: cp_user_user_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cp_user ALTER COLUMN user_serial ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cp_user_user_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 24907)
-- Name: customerlogihistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customerlogihistory (
    id integer NOT NULL,
    cusid integer,
    datetime timestamp(0) without time zone,
    ip character varying(50),
    timezone character varying(100),
    isp character varying(100),
    country character varying(100),
    lat character varying(100),
    lon character varying(100),
    status character varying(50)
);


ALTER TABLE public.customerlogihistory OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24912)
-- Name: customerlogihistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customerlogihistory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customerlogihistory_id_seq OWNER TO postgres;

--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 224
-- Name: customerlogihistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customerlogihistory_id_seq OWNED BY public.customerlogihistory.id;


--
-- TOC entry 225 (class 1259 OID 24913)
-- Name: customermessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customermessages (
    id integer NOT NULL,
    customername character varying(100),
    subject character varying(100),
    description character varying(1000),
    email character varying(100),
    senderid integer,
    receiverid integer,
    type character varying(20),
    datetime timestamp(0) without time zone,
    contactno character varying(20)
);


ALTER TABLE public.customermessages OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24918)
-- Name: customermessages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customermessages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customermessages_id_seq OWNER TO postgres;

--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 226
-- Name: customermessages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customermessages_id_seq OWNED BY public.customermessages.id;


--
-- TOC entry 227 (class 1259 OID 24919)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customerid integer NOT NULL,
    customername character varying(150),
    username character varying(100),
    password character varying(100),
    email character varying(100),
    contactno character varying(20),
    cby integer,
    cdate timestamp(0) without time zone,
    addressline1 character varying(250),
    addressline2 character varying(250),
    city character varying(150),
    rdmstring character varying(50),
    status character varying(20),
    setdate timestamp(0) without time zone
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24924)
-- Name: customers_customerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customerid_seq OWNER TO postgres;

--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 228
-- Name: customers_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;


--
-- TOC entry 229 (class 1259 OID 24925)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    orderdetailid integer NOT NULL,
    orderid integer,
    productid integer,
    productqty integer,
    productamount real,
    cby integer,
    cdate timestamp(0) without time zone,
    vendor integer,
    variationid integer,
    productcolorid integer,
    statusvendor character varying(20),
    remark character varying(1000),
    paymentstatus character varying(20),
    remarkbyadmin character varying(1000)
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24930)
-- Name: order_details_orderdetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_details_orderdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_orderdetailid_seq OWNER TO postgres;

--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 230
-- Name: order_details_orderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_details_orderdetailid_seq OWNED BY public.order_details.orderdetailid;


--
-- TOC entry 231 (class 1259 OID 24931)
-- Name: order_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_master (
    orderid integer NOT NULL,
    customerid integer,
    totalamount double precision,
    cdate timestamp(0) without time zone,
    status character varying(50),
    refno character varying(100),
    paymentvendorstat character varying(30)
);


ALTER TABLE public.order_master OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24934)
-- Name: order_master_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_master_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_master_orderid_seq OWNER TO postgres;

--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 232
-- Name: order_master_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_master_orderid_seq OWNED BY public.order_master.orderid;


--
-- TOC entry 233 (class 1259 OID 24935)
-- Name: permission_master; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission_master (
    permission_master_serial integer NOT NULL,
    action_name character varying(1000) NOT NULL,
    permission_name character varying(1000) NOT NULL,
    permission_order real NOT NULL,
    url_path character varying(500) NOT NULL
);


ALTER TABLE public.permission_master OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24940)
-- Name: permission_master_permission_master_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.permission_master ALTER COLUMN permission_master_serial ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.permission_master_permission_master_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 24941)
-- Name: product_assign_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_assign_features (
    assignfeatureid integer NOT NULL,
    productid integer,
    featurevariationid integer,
    featureimage character varying(200),
    featureprice real,
    assignedvendor integer,
    weightmodifier real,
    status character varying(20),
    featureqty integer,
    "default" character varying(20)
);


ALTER TABLE public.product_assign_features OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 24944)
-- Name: product_assign_features_assignfeatureid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_assign_features_assignfeatureid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_assign_features_assignfeatureid_seq OWNER TO postgres;

--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 236
-- Name: product_assign_features_assignfeatureid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_assign_features_assignfeatureid_seq OWNED BY public.product_assign_features.assignfeatureid;


--
-- TOC entry 237 (class 1259 OID 24945)
-- Name: product_feature_variations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_feature_variations (
    featurevariationid integer NOT NULL,
    featureid integer,
    variationname character varying,
    vendor integer,
    cdate timestamp(0) without time zone,
    productcolorid integer,
    productid integer,
    price double precision
);


ALTER TABLE public.product_feature_variations OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 24950)
-- Name: product_feature_variations_featurevariationid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_feature_variations_featurevariationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_feature_variations_featurevariationid_seq OWNER TO postgres;

--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 238
-- Name: product_feature_variations_featurevariationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_feature_variations_featurevariationid_seq OWNED BY public.product_feature_variations.featurevariationid;


--
-- TOC entry 239 (class 1259 OID 24951)
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    productimageid integer NOT NULL,
    productid integer,
    productimage1 character varying(300),
    productimage2 character varying(300),
    productimage3 character varying(300),
    productimage4 character varying(300),
    productimage5 character varying(300),
    productimage6 character varying(300)
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 24956)
-- Name: product_images_productimageid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_productimageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_images_productimageid_seq OWNER TO postgres;

--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 240
-- Name: product_images_productimageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_productimageid_seq OWNED BY public.product_images.productimageid;


--
-- TOC entry 241 (class 1259 OID 24957)
-- Name: productcolors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productcolors (
    productcolorid integer NOT NULL,
    productcolor character varying(200),
    status character varying(100),
    productid integer,
    productcolorname character varying(200),
    cby integer,
    cdate timestamp(0) without time zone
);


ALTER TABLE public.productcolors OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 24962)
-- Name: productcolors_productcolorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productcolors_productcolorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productcolors_productcolorid_seq OWNER TO postgres;

--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 242
-- Name: productcolors_productcolorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productcolors_productcolorid_seq OWNED BY public.productcolors.productcolorid;


--
-- TOC entry 243 (class 1259 OID 24963)
-- Name: productreviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productreviews (
    reviewid integer NOT NULL,
    review character varying(500),
    rating character varying(20),
    cby integer,
    cdate timestamp(0) without time zone,
    productid integer
);


ALTER TABLE public.productreviews OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 24968)
-- Name: productreviews_reviewid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productreviews_reviewid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productreviews_reviewid_seq OWNER TO postgres;

--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 244
-- Name: productreviews_reviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productreviews_reviewid_seq OWNED BY public.productreviews.reviewid;


--
-- TOC entry 245 (class 1259 OID 24969)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productcode character varying(255),
    product character varying(255),
    catserial integer,
    description character varying,
    quantity integer,
    price double precision,
    listprice double precision,
    createddate timestamp(0) without time zone,
    last_updated timestamp(0) without time zone,
    tags character varying(300),
    approvedby integer,
    approveddate timestamp(0) without time zone,
    status character varying(100),
    createdby integer,
    usergroup character varying(20),
    rating real,
    productmainimage character varying(500),
    fulldescription character varying,
    quickadd boolean
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 24974)
-- Name: products_features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_features (
    id integer NOT NULL,
    featurename character varying(255),
    feature_categories character varying(500),
    feature_status character varying(20)
);


ALTER TABLE public.products_features OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 24979)
-- Name: products_features_featureid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_features_featureid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_features_featureid_seq OWNER TO postgres;

--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 247
-- Name: products_features_featureid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_features_featureid_seq OWNED BY public.products_features.id;


--
-- TOC entry 248 (class 1259 OID 24980)
-- Name: products_packs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_packs (
    packid integer NOT NULL,
    productid integer,
    packsize integer,
    packprice double precision,
    packpricetype character varying(100),
    packusergroup character varying(100)
);


ALTER TABLE public.products_packs OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 24983)
-- Name: products_packs_packid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_packs_packid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_packs_packid_seq OWNER TO postgres;

--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 249
-- Name: products_packs_packid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_packs_packid_seq OWNED BY public.products_packs.packid;


--
-- TOC entry 250 (class 1259 OID 24984)
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productid_seq OWNER TO postgres;

--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 250
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- TOC entry 251 (class 1259 OID 24985)
-- Name: salepanel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salepanel (
    id integer NOT NULL,
    saleprecentage integer,
    text character varying(300),
    link character varying(300),
    status character varying(20)
);


ALTER TABLE public.salepanel OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 24990)
-- Name: salepanel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salepanel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salepanel_id_seq OWNER TO postgres;

--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 252
-- Name: salepanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.salepanel_id_seq OWNED BY public.salepanel.id;


--
-- TOC entry 253 (class 1259 OID 24991)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id integer,
    ip_address character varying(45),
    user_agent text,
    payload text,
    last_activity integer
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 24996)
-- Name: shopping_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shopping_cart (
    cart_id integer NOT NULL,
    itemid integer,
    variationid integer,
    userid integer,
    cdate timestamp(0) without time zone,
    qty integer,
    productcolorid integer
);


ALTER TABLE public.shopping_cart OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 24999)
-- Name: shopping_cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shopping_cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shopping_cart_cart_id_seq OWNER TO postgres;

--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 255
-- Name: shopping_cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shopping_cart_cart_id_seq OWNED BY public.shopping_cart.cart_id;


--
-- TOC entry 256 (class 1259 OID 25000)
-- Name: sidebanners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sidebanners (
    id integer NOT NULL,
    imageurl character varying(300),
    textheading1 character varying(200),
    textheading2 character varying(150),
    textdirection character varying(20),
    status character varying(20),
    type character varying(20)
);


ALTER TABLE public.sidebanners OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 25005)
-- Name: sidebanners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sidebanners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sidebanners_id_seq OWNER TO postgres;

--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 257
-- Name: sidebanners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sidebanners_id_seq OWNED BY public.sidebanners.id;


--
-- TOC entry 258 (class 1259 OID 25006)
-- Name: subscribelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscribelist (
    id integer NOT NULL,
    email character varying(150),
    status character varying(20)
);


ALTER TABLE public.subscribelist OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 25009)
-- Name: subscribelist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscribelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribelist_id_seq OWNER TO postgres;

--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 259
-- Name: subscribelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscribelist_id_seq OWNED BY public.subscribelist.id;


--
-- TOC entry 260 (class 1259 OID 25010)
-- Name: sysuser_login_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sysuser_login_history (
    id integer NOT NULL,
    userid integer,
    datetime timestamp(0) without time zone,
    ip character varying(150),
    status character varying(150),
    username character varying(50)
);


ALTER TABLE public.sysuser_login_history OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 25013)
-- Name: sysuser_login_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sysuser_login_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sysuser_login_history_id_seq OWNER TO postgres;

--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 261
-- Name: sysuser_login_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sysuser_login_history_id_seq OWNED BY public.sysuser_login_history.id;


--
-- TOC entry 262 (class 1259 OID 25014)
-- Name: user_login_audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_login_audit (
    id integer NOT NULL,
    user_id integer,
    ipaddress character varying(100),
    logindatetime timestamp(0) without time zone,
    cby integer,
    cdate timestamp(0) without time zone
);


ALTER TABLE public.user_login_audit OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 25017)
-- Name: user_login_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_login_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_login_audit_id_seq OWNER TO postgres;

--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 263
-- Name: user_login_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_login_audit_id_seq OWNED BY public.user_login_audit.id;


--
-- TOC entry 264 (class 1259 OID 25018)
-- Name: vendor_login_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_login_history (
    id integer NOT NULL,
    vendorid integer,
    datetime timestamp(0) without time zone,
    ip character varying(100),
    status character varying(200),
    username character varying(100)
);


ALTER TABLE public.vendor_login_history OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 25021)
-- Name: vendor_login_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_login_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_login_history_id_seq OWNER TO postgres;

--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 265
-- Name: vendor_login_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_login_history_id_seq OWNED BY public.vendor_login_history.id;


--
-- TOC entry 266 (class 1259 OID 25022)
-- Name: vendormessages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendormessages (
    id integer NOT NULL,
    senderid integer,
    meassage character varying(1000),
    receivedby integer,
    datetime timestamp(0) without time zone,
    status character varying(20),
    sendertype character varying(50),
    receivedtype character varying(50)
);


ALTER TABLE public.vendormessages OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 25027)
-- Name: vendormessages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendormessages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendormessages_id_seq OWNER TO postgres;

--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 267
-- Name: vendormessages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendormessages_id_seq OWNED BY public.vendormessages.id;


--
-- TOC entry 268 (class 1259 OID 25028)
-- Name: vendors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendors (
    vendorid integer NOT NULL,
    vendorname character varying(150),
    username character varying(100),
    password character varying(500),
    email character varying(100),
    contactno character varying(20),
    status character varying(20),
    cby integer,
    cdate timestamp(0) without time zone,
    appdate timestamp(0) without time zone,
    address character varying(500),
    appby integer,
    bankaccount character varying(20),
    nic character varying(20)
);


ALTER TABLE public.vendors OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 25033)
-- Name: vendors_vendorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendors_vendorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendors_vendorid_seq OWNER TO postgres;

--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 269
-- Name: vendors_vendorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendors_vendorid_seq OWNED BY public.vendors.vendorid;


--
-- TOC entry 270 (class 1259 OID 25034)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    wishlistid integer NOT NULL,
    productid integer,
    userid integer
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 25037)
-- Name: wishlist_wishlistid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishlist_wishlistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishlist_wishlistid_seq OWNER TO postgres;

--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 271
-- Name: wishlist_wishlistid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlist_wishlistid_seq OWNED BY public.wishlist.wishlistid;


--
-- TOC entry 3318 (class 2604 OID 25038)
-- Name: audittrail auditid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audittrail ALTER COLUMN auditid SET DEFAULT nextval('public.audittrail_auditid_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 25039)
-- Name: categories catid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN catid SET DEFAULT nextval('public.categories_catid_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 25040)
-- Name: customerlogihistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customerlogihistory ALTER COLUMN id SET DEFAULT nextval('public.customerlogihistory_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 25041)
-- Name: customermessages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customermessages ALTER COLUMN id SET DEFAULT nextval('public.customermessages_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 25042)
-- Name: customers customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 25043)
-- Name: mainbanner bannerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainbanner ALTER COLUMN bannerid SET DEFAULT nextval('public.banners_bannerid_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 25044)
-- Name: order_details orderdetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details ALTER COLUMN orderdetailid SET DEFAULT nextval('public.order_details_orderdetailid_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 25045)
-- Name: order_master orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_master ALTER COLUMN orderid SET DEFAULT nextval('public.order_master_orderid_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 25046)
-- Name: product_assign_features assignfeatureid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_assign_features ALTER COLUMN assignfeatureid SET DEFAULT nextval('public.product_assign_features_assignfeatureid_seq'::regclass);


--
-- TOC entry 3327 (class 2604 OID 25047)
-- Name: product_feature_variations featurevariationid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_feature_variations ALTER COLUMN featurevariationid SET DEFAULT nextval('public.product_feature_variations_featurevariationid_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 25048)
-- Name: product_images productimageid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN productimageid SET DEFAULT nextval('public.product_images_productimageid_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 25049)
-- Name: productcolors productcolorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcolors ALTER COLUMN productcolorid SET DEFAULT nextval('public.productcolors_productcolorid_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 25050)
-- Name: productreviews reviewid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productreviews ALTER COLUMN reviewid SET DEFAULT nextval('public.productreviews_reviewid_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 25051)
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 25052)
-- Name: products_features id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_features ALTER COLUMN id SET DEFAULT nextval('public.products_features_featureid_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 25053)
-- Name: products_packs packid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_packs ALTER COLUMN packid SET DEFAULT nextval('public.products_packs_packid_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 25054)
-- Name: salepanel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salepanel ALTER COLUMN id SET DEFAULT nextval('public.salepanel_id_seq'::regclass);


--
-- TOC entry 3335 (class 2604 OID 25055)
-- Name: shopping_cart cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shopping_cart ALTER COLUMN cart_id SET DEFAULT nextval('public.shopping_cart_cart_id_seq'::regclass);


--
-- TOC entry 3336 (class 2604 OID 25056)
-- Name: sidebanners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sidebanners ALTER COLUMN id SET DEFAULT nextval('public.sidebanners_id_seq'::regclass);


--
-- TOC entry 3337 (class 2604 OID 25057)
-- Name: subscribelist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscribelist ALTER COLUMN id SET DEFAULT nextval('public.subscribelist_id_seq'::regclass);


--
-- TOC entry 3338 (class 2604 OID 25058)
-- Name: sysuser_login_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sysuser_login_history ALTER COLUMN id SET DEFAULT nextval('public.sysuser_login_history_id_seq'::regclass);


--
-- TOC entry 3339 (class 2604 OID 25059)
-- Name: user_login_audit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_login_audit ALTER COLUMN id SET DEFAULT nextval('public.user_login_audit_id_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 25060)
-- Name: vendor_login_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_login_history ALTER COLUMN id SET DEFAULT nextval('public.vendor_login_history_id_seq'::regclass);


--
-- TOC entry 3341 (class 2604 OID 25061)
-- Name: vendormessages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendormessages ALTER COLUMN id SET DEFAULT nextval('public.vendormessages_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 25062)
-- Name: vendors vendorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors ALTER COLUMN vendorid SET DEFAULT nextval('public.vendors_vendorid_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 25063)
-- Name: wishlist wishlistid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN wishlistid SET DEFAULT nextval('public.wishlist_wishlistid_seq'::regclass);


--
-- TOC entry 3501 (class 0 OID 24871)
-- Dependencies: 209
-- Data for Name: audittrail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audittrail (auditid, event, page, cby, cdate) FROM stdin;
\.


--
-- TOC entry 3505 (class 0 OID 24881)
-- Dependencies: 213
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (catid, catname, catlevel, parentid, status) FROM stdin;
1	Home	1	0	Active
2	Sports	1	0	Active
3	Fashion	1	0	Active
4	Mens	2	3	Active
5	Women	2	3	Active
6	Kitchenware	2	1	Active
7	Plants	1	0	Active
8	Food and Beverage	1	0	Active
10	Test Sub Level	2	9	Active
11	Test 3level	3	10	Active
12	Bags	1	0	Active
13	Shoes	1	0	Active
14	Ladies	2	13	Active
15	Gents	2	13	Active
16	Kids Shoes	2	13	Active
18	Level 2 Category	2	17	Active
19	Level 3 Category	3	18	Active
20	Lace Products	1	0	Active
21	Desserts	1	0	Active
23	Cleaning Products	2	1	Active
24	Ornaments	1	0	Active
25	Home & Lifestyle	1	0	Active
26	Home & Lifestyle	2	25	Active
27	Stationery & Craft	2	25	Active
28	Paper Products	3	27	Active
29	Handicraft	1	0	Active
30	Sweets	2	8	Active
31	Health & Beauty	1	0	Active
33	Babies & Toys	1	0	Active
\.


--
-- TOC entry 3507 (class 0 OID 24885)
-- Dependencies: 215
-- Data for Name: cp_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cp_user (user_serial, user_id, full_name, email, tele_no, address, status, cby, cdate) FROM stdin;
1	1	Admin User	abc@gmail.com	123456789	Address 11	Active	1	2021-02-03 11:40:55
2	testuser	test user				Active	1	2021-07-12 11:33:07
3	testuser1	Test User 1				Active	1	2022-03-04 10:44:11
\.


--
-- TOC entry 3508 (class 0 OID 24890)
-- Dependencies: 216
-- Data for Name: cp_user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cp_user_group (user_group_serial, user_group_name, group_status, cby, cdate) FROM stdin;
1	Admin	Active	1	2021-06-07 08:33:18
2	Test User Group	Active	1	2021-07-12 11:32:32
3	test user group	Active	1	2022-03-04 10:43:36
\.


--
-- TOC entry 3510 (class 0 OID 24896)
-- Dependencies: 218
-- Data for Name: cp_user_login; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cp_user_login (user_login_serial, user_serial, user_group_serial, user_name, password, status, cby, cdate) FROM stdin;
1	1	1	admin	$2y$10$gOugSpPBWqDSTaZG7jqy5eu2CUMlHDi1y8YZNwSbvuGsBINRVhDxi	Active	1	2021-02-03 12:04:36
2	2	2	testuser	$2y$10$4QYlfJJpD9wC53REYGFFruqv4zgi8x6BjenDqEQvl1l43.fX05Tfi	Active	1	2021-07-12 11:35:09
3	3	3	test0001	$2y$10$3mrEvLTxKZTIK9HWR41pRe.95eAuvMuxv85l5MKMkI64ACWlCH9Ge	Active	1	2022-03-04 10:45:14
\.


--
-- TOC entry 3512 (class 0 OID 24902)
-- Dependencies: 220
-- Data for Name: cp_user_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cp_user_permission (user_permission_serial, user_group_serial, permission_master_serial, read_only, read_and_write_only) FROM stdin;
1	1	3		true
2	1	1		true
3	1	13		true
4	1	12		true
5	1	11		true
6	1	10		true
7	1	9		true
8	1	8		true
9	1	7		true
10	1	6		true
11	1	5		true
12	1	4		true
13	1	2		true
14	1	15		true
15	1	16		true
16	1	14		true
17	2	2		true
18	3	1		true
19	3	2		true
20	3	8		true
\.


--
-- TOC entry 3515 (class 0 OID 24907)
-- Dependencies: 223
-- Data for Name: customerlogihistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customerlogihistory (id, cusid, datetime, ip, timezone, isp, country, lat, lon, status) FROM stdin;
1	0	2021-07-07 10:31:51	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
2	0	2021-07-07 10:32:27	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
3	0	2021-07-07 10:37:12	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
4	0	2021-07-07 10:38:11	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
5	0	2021-07-07 10:40:00	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
6	5	2021-07-07 12:57:40	"2407:c00:4005:9a23:d8ae:6651:6263:89ac"	"Asia/Colombo"	"Mobitel Pvt Ltd"	"Sri Lanka"	6.9147300000000005	79.8571	Login Success
7	5	2021-07-07 13:33:31	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login Success
8	0	2021-07-07 13:36:43	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
9	0	2021-07-07 13:38:02	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
10	5	2021-07-07 13:45:04	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login Success
11	0	2021-07-07 13:45:42	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
12	0	2021-07-07 13:46:39	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
13	0	2021-07-07 13:47:12	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
14	0	2021-07-07 13:47:52	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login failed. User doesn't exists!
15	5	2021-07-07 13:58:45	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login Success
16	5	2021-07-11 16:22:02	"112.134.219.241"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
17	6	2021-07-11 16:29:49	"112.134.219.241"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
18	0	2021-07-11 16:43:53	"112.134.219.241"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login failed. User doesn't exists!
19	6	2021-07-11 16:58:12	"112.134.219.241"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
20	7	2021-07-12 11:44:13	"2407:c00:d006:6e29:756e:1ab0:7318:e0fe"	"Asia/Colombo"	"Mobitel Pvt Ltd"	"Sri Lanka"	6.9147300000000005	79.8571	Login failed. Password not matching!
21	7	2021-07-12 11:44:27	"2407:c00:d006:6e29:756e:1ab0:7318:e0fe"	"Asia/Colombo"	"Mobitel Pvt Ltd"	"Sri Lanka"	6.9147300000000005	79.8571	Login failed. Password not matching!
22	7	2021-07-12 11:44:44	"2407:c00:d006:6e29:756e:1ab0:7318:e0fe"	"Asia/Colombo"	"Mobitel Pvt Ltd"	"Sri Lanka"	6.9147300000000005	79.8571	Login Success
23	0	2021-07-15 00:01:01	"112.134.1.155"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
24	0	2021-07-15 00:01:12	"112.134.1.155"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
25	0	2021-07-15 00:01:41	"112.134.1.155"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
26	0	2021-07-15 00:02:12	"112.134.1.155"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
27	0	2021-07-15 00:07:35	"112.134.1.155"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
28	0	2021-07-15 00:07:58	"112.134.1.155"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
29	0	2021-07-15 00:08:27	"112.134.1.155"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
30	0	2021-07-15 10:06:25	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. User doesn't exists!
31	0	2021-07-15 10:06:58	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. User doesn't exists!
32	0	2021-07-15 10:08:00	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. User doesn't exists!
33	0	2021-07-15 10:12:19	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. User doesn't exists!
34	0	2021-07-15 10:21:16	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. User doesn't exists!
35	0	2021-07-15 10:21:22	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. User doesn't exists!
36	0	2021-07-15 10:46:48	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. User doesn't exists!
37	9	2021-07-15 10:47:31	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login Success
38	9	2021-07-15 18:23:28	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login failed. Password not matching!
39	9	2021-07-15 18:23:37	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login Success
40	0	2021-07-15 18:23:38	"112.134.7.31"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login failed. User doesn't exists!
41	9	2021-07-15 18:23:45	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login Success
42	9	2021-07-15 18:23:56	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login Success
43	8	2021-07-15 18:42:21	"112.134.7.31"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login Success
44	8	2021-07-15 19:30:38	"112.134.7.31"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login Success
45	8	2021-07-15 22:19:14	"112.134.7.31"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login Success
46	8	2021-07-15 22:37:10	"112.134.7.31"	"Asia/Colombo"	"SLTNETL-SLT"	"Sri Lanka"	6.93387	79.8447	Login Success
47	9	2021-07-16 10:10:12	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login Success
48	5	2021-07-19 08:54:12	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.89434	79.8805	Login Success
49	0	2021-08-19 15:44:06	"2402:4000:2380:e7a7:248d:cf55:ef06:47b9"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4839	80.3683	Login failed. User doesn't exists!
50	0	2021-08-19 15:44:17	"2402:4000:2380:e7a7:248d:cf55:ef06:47b9"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4839	80.3683	Login failed. User doesn't exists!
51	0	2021-08-19 15:44:30	"2402:4000:2380:e7a7:248d:cf55:ef06:47b9"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4839	80.3683	Login failed. User doesn't exists!
52	0	2021-08-19 15:44:34	"2402:4000:2380:e7a7:248d:cf55:ef06:47b9"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4839	80.3683	Login failed. User doesn't exists!
53	0	2021-08-19 15:44:41	"2402:4000:2380:e7a7:248d:cf55:ef06:47b9"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4839	80.3683	Login failed. User doesn't exists!
54	0	2021-08-19 15:44:47	"2402:4000:2380:e7a7:248d:cf55:ef06:47b9"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4839	80.3683	Login failed. User doesn't exists!
55	0	2021-08-19 15:48:42	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
56	0	2021-08-19 15:49:15	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
57	0	2021-08-19 15:49:52	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
58	0	2021-08-19 15:52:22	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
59	0	2021-08-19 15:52:31	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
60	0	2021-08-19 16:08:24	"2402:4000:2380:e7a7:248d:cf55:ef06:47b9"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4839	80.3683	Login failed. User doesn't exists!
61	0	2021-08-19 16:17:44	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
62	0	2021-08-19 16:17:53	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
63	0	2021-08-19 16:18:04	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
64	0	2021-08-19 16:18:17	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
65	0	2021-08-19 16:18:26	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
66	0	2021-08-19 16:18:57	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
67	0	2021-08-19 16:29:27	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
68	0	2021-08-19 16:29:32	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
69	0	2021-08-19 16:31:27	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login failed. User doesn't exists!
70	5	2021-08-19 17:07:50	"123.231.127.220"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	7.4688	80.0401	Login Success
71	6	2022-02-08 12:16:12	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
72	0	2022-03-02 09:25:38	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
73	0	2022-03-02 09:35:31	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
74	0	2022-03-02 09:38:42	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
75	0	2022-03-02 09:39:04	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
76	0	2022-03-02 09:39:06	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
77	6	2022-03-02 09:39:21	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
78	0	2022-03-04 08:53:11	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
79	0	2022-03-04 08:53:32	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
80	0	2022-03-04 08:54:59	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
81	5	2022-03-04 09:00:13	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
82	0	2022-03-04 09:02:02	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
83	0	2022-03-04 09:02:25	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
84	0	2022-03-04 09:02:50	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
85	12	2022-03-04 11:40:03	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
86	0	2022-03-04 13:13:40	"123.231.106.28"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.7158999999999995	80.0626	Login failed. User doesn't exists!
87	12	2022-03-04 13:14:08	"123.231.106.28"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.7158999999999995	80.0626	Login Success
88	12	2022-03-04 13:14:24	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
89	12	2022-03-04 13:46:48	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
90	12	2022-03-04 13:50:22	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
91	12	2022-03-04 14:46:13	"123.231.106.28"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.7158999999999995	80.0626	Login Success
92	12	2022-03-07 08:56:39	"112.134.144.223"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.7132000000000005	79.9026	Login Success
93	12	2022-03-07 08:56:49	"112.134.144.223"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.7132000000000005	79.9026	Login Success
94	0	2022-03-07 08:57:04	"112.134.144.223"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.7132000000000005	79.9026	Login failed. User doesn't exists!
95	12	2022-03-07 08:57:09	"112.134.144.223"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.7132000000000005	79.9026	Login Success
96	0	2022-03-07 12:49:39	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
97	0	2022-03-07 12:49:59	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
98	0	2022-03-07 12:50:48	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
99	0	2022-03-07 12:55:51	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
100	0	2022-03-07 12:56:44	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
101	0	2022-03-07 12:58:07	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
102	0	2022-03-07 13:00:21	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
103	0	2022-03-07 13:02:51	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
104	0	2022-03-07 13:14:45	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
105	12	2022-03-07 13:21:06	"112.134.145.94"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
106	12	2022-03-07 14:59:03	"112.134.145.94"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
107	12	2022-03-07 16:19:00	"112.134.145.94"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
108	0	2022-03-24 09:56:56	"112.134.151.174"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login failed. User doesn't exists!
109	17	2022-03-25 11:16:34	"112.134.151.138"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
110	17	2022-03-25 11:26:23	"112.134.151.138"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
111	17	2022-03-25 11:42:09	"112.134.151.138"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
112	17	2022-03-25 13:10:25	"112.134.151.138"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
113	17	2022-03-25 13:10:25	"112.134.151.138"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
114	17	2022-03-25 13:11:35	"112.134.151.138"	"Asia/Colombo"	"SLTADSL-SLT"	"Sri Lanka"	6.93435	79.8461	Login Success
115	0	2022-03-25 15:40:38	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
116	0	2022-03-25 15:40:58	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
117	0	2022-03-25 15:41:20	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
118	0	2022-03-25 15:42:16	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
119	0	2022-03-25 15:42:33	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
120	0	2022-03-25 15:44:54	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
121	0	2022-03-25 15:46:30	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
122	0	2022-03-25 15:53:01	"2402:4000:b187:8b89:1:0:ef0d:6639"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
123	0	2022-03-25 15:56:54	"2402:4000:b187:8b89:18a0:4a31:b3ce:6753"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
124	0	2022-03-25 15:57:45	"2402:4000:b187:8b89:18a0:4a31:b3ce:6753"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
125	0	2022-03-25 15:58:40	"2402:4000:b187:8b89:18a0:4a31:b3ce:6753"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
126	0	2022-03-26 21:12:58	"2402:4000:b19b:a796:1aa:b432:85a6:b233"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
127	0	2022-03-26 21:13:19	"2402:4000:b19b:a796:1aa:b432:85a6:b233"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
128	0	2022-03-26 21:13:49	"2402:4000:b19b:a796:1aa:b432:85a6:b233"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
129	0	2022-03-26 21:14:16	"2402:4000:b19b:a796:1aa:b432:85a6:b233"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
130	0	2022-03-26 21:14:29	"2402:4000:b19b:a796:1aa:b432:85a6:b233"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
131	0	2022-03-26 21:15:22	"2402:4000:b19b:a796:1aa:b432:85a6:b233"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
132	0	2022-03-27 11:56:27	"2402:4000:1240:cc0b:1:0:b44c:865c"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
133	0	2022-03-27 12:09:46	"2402:4000:2281:665b:c18:c02a:5284:4ba7"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.84019	79.8712	Login failed. User doesn't exists!
134	0	2022-03-28 14:15:22	"2402:4000:b196:145b:8979:5d56:d76:5b57"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
135	0	2022-03-28 14:16:03	"2402:4000:b196:145b:8979:5d56:d76:5b57"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
136	0	2022-03-31 16:15:39	"175.157.122.174"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
137	0	2022-03-31 16:16:14	"175.157.122.174"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
138	0	2022-03-31 16:16:15	"175.157.122.174"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
139	0	2022-03-31 16:17:09	"175.157.122.174"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
140	0	2022-03-31 16:17:09	"175.157.122.174"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
141	0	2022-03-31 16:17:09	"175.157.122.174"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
142	0	2022-03-31 16:19:45	"175.157.122.174"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
143	0	2022-04-07 11:28:45	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
144	0	2022-04-07 11:29:05	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
145	0	2022-04-07 11:29:39	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
146	0	2022-04-07 11:29:49	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
147	0	2022-04-07 11:30:12	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
148	0	2022-04-07 11:34:38	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
149	0	2022-04-07 11:34:55	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
150	0	2022-04-07 13:12:46	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
151	0	2022-04-07 13:12:57	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
152	0	2022-04-07 15:41:00	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
153	0	2022-04-07 15:41:36	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
154	0	2022-04-07 15:43:47	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
155	0	2022-04-07 15:44:43	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
156	0	2022-04-07 15:44:56	"175.157.40.95"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
157	0	2022-04-14 20:12:32	"175.157.236.181"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	7.1663	79.9533	Login failed. User doesn't exists!
158	0	2022-04-14 20:13:02	"175.157.236.181"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	7.1663	79.9533	Login failed. User doesn't exists!
159	0	2022-04-14 20:13:30	"175.157.236.181"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	7.1663	79.9533	Login failed. User doesn't exists!
160	0	2022-04-29 16:15:40	"175.157.41.195"	"Asia/Colombo"	"Dialog Axiata PLC."	"Sri Lanka"	6.91841	79.8628	Login failed. User doesn't exists!
161	0	2022-05-19 13:05:38	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
162	0	2022-05-19 13:06:41	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
163	6	2022-05-19 13:11:27	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login Success
164	0	2022-05-19 14:01:05	"103.11.33.243"	"Asia/Colombo"	"Information and Communication Technology Agency of Sri Lanka"	"Sri Lanka"	6.9153	80.1302	Login failed. User doesn't exists!
165	20	2022-05-23 10:46:19	"123.231.114.160"	"Asia/Colombo"	"Dialog Axiata Plc"	"Sri Lanka"	6.91291	79.8534	Login Success
166	0	2022-07-09 09:31:17	"105.101.80.49"	"Africa/Algiers"	"Algerie Telecom"	"Algeria"	36.7598	3.01383	Login failed. User doesn't exists!
167	17	2022-12-28 17:16:51	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login failed. Password not matching!
168	16	2022-12-28 17:17:07	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login failed. Password not matching!
169	16	2022-12-28 17:17:12	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login failed. Password not matching!
170	16	2022-12-28 17:18:27	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login Success
171	16	2022-12-28 17:19:18	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login Success
172	0	2022-12-28 23:01:51	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login failed. User doesn't exists!
173	16	2022-12-28 23:02:08	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login Success
174	16	2022-12-28 23:11:38	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login Success
175	16	2022-12-28 23:12:26	123.234.345.567	asia	slt	lk	6.34566	4.5678	Login Success
\.


--
-- TOC entry 3517 (class 0 OID 24913)
-- Dependencies: 225
-- Data for Name: customermessages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customermessages (id, customername, subject, description, email, senderid, receiverid, type, datetime, contactno) FROM stdin;
1	Amal	Message from Customer	test	kixedo4759@xindax.com	\N	1	read	2022-03-04 10:58:58	0713256158
\.


--
-- TOC entry 3519 (class 0 OID 24919)
-- Dependencies: 227
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customerid, customername, username, password, email, contactno, cby, cdate, addressline1, addressline2, city, rdmstring, status, setdate) FROM stdin;
6	Ama Rathnasiri	Amar	$2y$10$5Q1Gaa.X8/P4QZJ1N8jVqOTSkYiZEGn0PLhFuw9zGnYWMnkslA2wa	amarathnasiri@gmail.com	0779127308	0	2021-07-11 16:28:35	820	Gemunu Mawatha	Homagama	kjene9ubxwn91aOBqoVq5Rugz	Active	\N
17	Gayan	gayan91	$2y$10$net/Ef87JRZJ8.GLQevoUeE2pur.Wk4O.Q6RC/HvEh8pLpfwh1knW	fakow52697@moonran.com	0719270153	0	2022-03-25 11:15:53	Line1	Line 2	City	Kvf1XaHRzG3Dva2HFotDyLlxh	Active	\N
18	Kamal Perera	Kamal	$2y$10$bps960heo8t8H7.JGaY9behFgyLBdAvLhJcf9z68IDe6mXqXj6gay	cdwa.itunit@gmail.com	0707127308	0	2022-05-19 13:04:40	12	Baththaramulla	Colombo	SpMMypELEZbFwQZKDCFTBBwul	PendingVerification	\N
19	Pramushka Hiruni Withanage	Pramushka	$2y$10$UDt/xbB.Tj5MN19gUlB9BuBIKYCBqSgqQ10SUpNKeOzKTNoFU0yIW	pramushka.withanage82@gmail.com	0718725067	0	2022-05-23 09:47:36	246/9/B, Iddamal Mawatha, New Kandy Road, Malambe		Colombo	72pmEfra7pJHaKbG5VcbDyJ4B	Active	\N
20	Ajantha Perera	pereraak	$2y$10$SKqaMBJdnTU60sbAF3rLL.VyVQ19u6yBgOCZUrmqsvSrfrWimyLKq	pereraak@hotmail.com	0714488598	0	2022-05-23 10:45:33	38/34	Rukmanidevi Mawatha	Negombo	1f0ZRiTUw00apWLozFyYRGnsL	Active	\N
21	H.A.Dilrukshi	Dilrukshi	$2y$10$2IwMUE5H/8GtmVy0TGHGj.TH5jsUY1vur0kbp6v0VNQQvTtfdDCWO	auditvotb@gmail.com	0112187296	0	2022-06-29 11:30:42	Sethsiripaya	Battaramulla	Colombo	BO1SZ4jxH42XCzLpTnY92l5EQ	PendingVerification	\N
16	Thanushka Jayasinghe	testcustomer	$2y$10$gOugSpPBWqDSTaZG7jqy5eu2CUMlHDi1y8YZNwSbvuGsBINRVhDxi	thanushkajayasinghe@gmail.com	0719270152	0	2022-03-08 13:03:17				NESMsAoemWjPfsyuRP8D8GoBA	Active	2022-03-08 13:16:05
\.


--
-- TOC entry 3503 (class 0 OID 24875)
-- Dependencies: 211
-- Data for Name: mainbanner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mainbanner (bannerid, imageurl, textheading1, textheading2, textheading3, textheading4, status) FROM stdin;
9	1646386284-handcraft.jpg					Active
10	1646387046-qwe.png					Active
15	1646472103-IMG_1288.jpg					Active
\.


--
-- TOC entry 3521 (class 0 OID 24925)
-- Dependencies: 229
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_details (orderdetailid, orderid, productid, productqty, productamount, cby, cdate, vendor, variationid, productcolorid, statusvendor, remark, paymentstatus, remarkbyadmin) FROM stdin;
1	1	4	3	2500	7	2021-07-12 11:49:15	3	4	6	\N	\N	\N	\N
2	2	4	2	0.5	7	2021-07-12 11:59:37	3	3	6	\N	\N	\N	\N
3	3	4	2	0.5	7	2021-07-12 12:07:08	3	3	6	\N	\N	\N	\N
4	4	4	2	0.5	7	2021-07-12 12:07:09	3	3	6	\N	\N	\N	\N
5	5	4	2	0.5	7	2021-07-12 12:09:59	3	3	6	Shipped	test	\N	\N
6	6	4	1	0.5	8	2021-07-15 22:29:36	3	5	6	\N	\N	\N	\N
7	6	4	1	0.5	8	2021-07-15 22:29:36	3	5	6	\N	\N	\N	\N
8	7	4	1	0.5	9	2021-07-16 10:26:52	3	5	6	\N	\N	\N	\N
9	8	4	1	0.5	12	2022-03-04 11:52:40	3	7	7	\N	\N	\N	\N
10	9	4	1	0.5	12	2022-03-04 11:56:18	3	7	7	\N	\N	\N	\N
11	10	4	1	0.5	12	2022-03-04 11:59:24	3	7	7	\N	\N	\N	\N
12	11	4	1	0.5	12	2022-03-04 12:03:11	3	7	7	\N	\N	\N	\N
13	12	4	1	0.5	12	2022-03-04 12:12:32	3	7	7	\N	\N	\N	\N
14	13	4	1	0.5	12	2022-03-04 12:26:02	3	7	7	\N	\N	\N	\N
15	14	4	1	0.5	12	2022-03-04 13:15:04	3	7	7	\N	\N	\N	\N
16	15	4	1	0.5	12	2022-03-04 13:50:40	3	7	7	\N	\N	\N	\N
17	16	4	1	0.5	12	2022-03-04 14:39:45	3	7	7	\N	\N	\N	\N
18	17	4	1	0.5	12	2022-03-04 14:42:24	3	7	7	\N	\N	\N	\N
19	18	4	1	0.5	12	2022-03-04 14:46:30	3	7	7	\N	\N	\N	\N
20	19	4	2	0.5	12	2022-03-04 14:47:31	3	7	7	\N	\N	\N	\N
21	20	4	2	0.5	12	2022-03-04 14:49:34	3	7	7	\N	\N	\N	\N
22	21	4	2	0.5	12	2022-03-04 15:10:55	3	5	6	\N	\N	\N	\N
23	22	32	1	375	12	2022-03-07 08:57:50	19	61	50	\N	\N	\N	\N
24	23	32	1	375	12	2022-03-07 13:21:14	19	61	50	\N	\N	\N	\N
25	24	39	1	900	17	2022-03-25 11:18:06	23	72	61	\N	\N	\N	\N
26	25	39	1	1	17	2022-03-25 11:22:54	23	69	60	\N	\N	\N	\N
27	26	39	1	1	17	2022-03-25 11:26:42	23	69	60	\N	\N	\N	\N
28	27	39	1	1	17	2022-03-25 11:28:39	23	69	60	Shipped		\N	\N
29	28	42	1	1	17	2022-03-25 13:23:07	23	0	69	\N	\N	\N	\N
30	29	42	1	1	17	2022-03-25 13:24:06	23	0	69	\N	\N	\N	\N
\.


--
-- TOC entry 3523 (class 0 OID 24931)
-- Dependencies: 231
-- Data for Name: order_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_master (orderid, customerid, totalamount, cdate, status, refno, paymentvendorstat) FROM stdin;
1	7	7500	2021-07-12 11:49:15	PendingPayment	\N	\N
2	7	1	2021-07-12 11:59:37	PendingPayment	\N	\N
3	7	1	2021-07-12 12:07:08	PendingPayment	\N	\N
4	7	1	2021-07-12 12:07:09	PendingPayment	\N	\N
5	7	1	2021-07-12 12:09:59	PaymentSucess	119331144009	\N
6	8	1	2021-07-15 22:29:36	PendingPayment	\N	\N
7	9	0.5	2021-07-16 10:26:52	PendingPayment	\N	\N
8	12	0.5	2022-03-04 11:52:40	PendingPayment	\N	\N
9	12	0.5	2022-03-04 11:56:18	PendingPayment	\N	\N
10	12	0.5	2022-03-04 11:59:24	PendingPayment	\N	\N
11	12	0.5	2022-03-04 12:03:11	PendingPayment	\N	\N
12	12	0.5	2022-03-04 12:12:32	PendingPayment	\N	\N
13	12	0.5	2022-03-04 12:26:02	PendingPayment	\N	\N
14	12	0.5	2022-03-04 13:15:04	PendingPayment	\N	\N
15	12	0.5	2022-03-04 13:50:40	PendingPayment	\N	\N
16	12	0.5	2022-03-04 14:39:45	PendingPayment	\N	\N
17	12	0.5	2022-03-04 14:42:24	PendingPayment	\N	\N
18	12	0.5	2022-03-04 14:46:30	PendingPayment	\N	\N
19	12	1	2022-03-04 14:47:31	PendingPayment	\N	\N
20	12	1	2022-03-04 14:49:34	PaymentSucess	206391365605	\N
21	12	1	2022-03-04 15:10:55	PaymentSucess	206351200735	\N
22	12	375	2022-03-07 08:57:50	PendingPayment	\N	\N
23	12	375	2022-03-07 13:21:14	PendingPayment	\N	\N
24	17	900	2022-03-25 11:18:06	PendingPayment	\N	\N
25	17	1	2022-03-25 11:22:54	PendingPayment	\N	\N
26	17	1	2022-03-25 11:26:42	PendingPayment	\N	\N
27	17	1	2022-03-25 11:28:39	PaymentSucess	208457259343	\N
28	17	1	2022-03-25 13:23:07	PendingPayment	\N	\N
29	17	1	2022-03-25 13:24:06	PendingPayment	\N	\N
\.


--
-- TOC entry 3525 (class 0 OID 24935)
-- Dependencies: 233
-- Data for Name: permission_master; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission_master (permission_master_serial, action_name, permission_name, permission_order, url_path) FROM stdin;
1	Home	Home.blade.php	1	Home
2	Vendors Approve	VendorView.blade.php	2	ViewVendors
3	Control Panel	ControlPanel.blade.php	4	ControlPanel
4	Vendors Edit	VendorEdit.blade.php	3	EditVendors
5	View Orders	vieworders.blade.php	5	vieworders
6	Sales reports	Orders_Sales_Reports.blade.php	6	Orders_Sales_Reports
7	Categories	ProductCategories.blade.php	7	ProductCategories
8	Products	Products.blade.php	8	Products
9	Features	Features.blade.php	9	Features
10	Administrators	Customers_Administrators.blade.php	10	Customers_Administrators
11	Customers	Customers_Customers.blade.php	11	Customers_Customers
12	Message Center	MessageCenter.blade.php	12	MessageCenter
13	Newsletters	Newsletters.blade.php	13	Newsletters
14	Products Approve	VendorProductApprove.blade.php	14	VendorProductApprove
15	LoginHistory	LoginHistory.blade.php	16	LoginHistory
16	BannersUpload	BannersUpload.blade.php	15	BannersUpload
\.


--
-- TOC entry 3527 (class 0 OID 24941)
-- Dependencies: 235
-- Data for Name: product_assign_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_assign_features (assignfeatureid, productid, featurevariationid, featureimage, featureprice, assignedvendor, weightmodifier, status, featureqty, "default") FROM stdin;
\.


--
-- TOC entry 3529 (class 0 OID 24945)
-- Dependencies: 237
-- Data for Name: product_feature_variations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_feature_variations (featurevariationid, featureid, variationname, vendor, cdate, productcolorid, productid, price) FROM stdin;
3	1	S	3	2021-07-12 11:26:06	6	4	0.5
4	1	M	3	2021-07-12 11:26:06	6	4	0.5
5	1	L	3	2021-07-12 11:26:06	6	4	0.5
6	1	S	3	2021-07-12 11:26:06	7	4	0.5
7	1	M	3	2021-07-12 11:26:06	7	4	0.5
8	1	L	3	2021-07-12 11:26:06	7	4	0.5
9	1	36/37/38/39	6	2021-08-06 12:21:25	17	7	1000
10	1	36/37/38/40	6	2021-08-06 12:21:25	18	7	500
11	1	40	6	2021-08-06 12:21:25	19	7	1000
12	1	S	1	2021-08-16 10:24:42	20	8	2500
13	1	M	1	2021-08-16 10:24:42	20	8	2500
14	1	L	1	2021-08-16 10:24:42	20	8	2500
15	1	S	1	2021-08-16 10:24:42	21	8	2300
16	1	M	1	2021-08-16 10:24:42	21	8	2300
17	1	L	1	2021-08-16 10:24:42	21	8	2300
18	1	S	2	2021-08-16 10:58:48	22	9	1500
19	1	M	2	2021-08-16 10:58:48	22	9	1500
20	1	L	2	2021-08-16 10:58:48	22	9	1500
21	1	S	2	2021-08-16 10:58:48	23	9	1500
22	1	M	2	2021-08-16 10:58:48	23	9	1500
23	1	L	2	2021-08-16 10:58:48	23	9	1500
24	1	S	2	2021-08-16 10:58:48	24	9	1500
25	1	M	2	2021-08-16 10:58:48	24	9	1500
26	1	L	2	2021-08-16 10:58:48	24	9	1500
27	1	S	2	2021-08-16 10:58:48	25	9	1500
28	1	M	2	2021-08-16 10:58:48	25	9	1500
29	1	L	2	2021-08-16 10:58:48	25	9	1500
30	1	S	2	2021-08-16 10:58:48	26	9	1500
31	1	M	2	2021-08-16 10:58:48	26	9	1500
32	1	L	2	2021-08-16 10:58:48	26	9	1500
34	1	90x80CM	7	2022-03-03 17:00:23	27	10	300
35	1	90x80CM	7	2022-03-03 17:00:23	28	10	300
36	1	90x80CM	7	2022-03-03 17:00:23	29	10	300
37	1	90x80CM	7	2022-03-03 17:00:23	30	10	300
38	1	90x80CM	7	2022-03-03 17:00:23	31	10	300
39	1	S	9	2022-03-04 10:34:56	32	11	350
40	1	M	9	2022-03-04 10:34:56	32	11	350
41	1	L	9	2022-03-04 10:34:56	32	11	350
42	1	S	9	2022-03-04 10:34:56	33	11	350
43	1	M	9	2022-03-04 10:34:56	33	11	350
44	1	L	9	2022-03-04 10:34:56	33	11	350
45	1	50ml	11	2022-03-05 17:17:24	36	12	70
46	1	100ml	11	2022-03-05 17:17:24	36	12	125
47	1	500ml	11	2022-03-05 17:17:24	36	12	490
48	1	1l	11	2022-03-05 17:17:24	36	12	650
49	1	4l	11	2022-03-05 17:17:24	36	12	2400
55	3	400g	15	2022-03-05 19:16:40	44	25	500
56	3	250g	15	2022-03-05 19:16:40	44	25	400
57	1	Normal	16	2022-03-05 22:11:10	45	26	230
58	1	Normal	16	2022-03-05 22:11:10	46	26	275
59	1	Normal	16	2022-03-05 22:11:10	47	26	350
60	1	Normal	17	2022-03-05 22:49:42	48	30	500
61	1	Normal	19	2022-03-05 23:31:51	50	32	375
62	3	10g	20	2022-03-05 23:50:00	51	33	100
74	1	S	23	2022-03-25 10:40:17	62	39	1
65	1	Normal	21	2022-03-06 00:25:33	53	35	4000
66	1	Normal	21	2022-03-06 00:28:30	53	35	4000
50	1	1l	14	2022-03-05 18:44:30	37	20	790
51	1	500ml	14	2022-03-05 18:44:30	38	20	595
52	1	500ml	14	2022-03-05 18:44:30	41	20	590
53	1	500ml	14	2022-03-05 18:44:30	42	20	590
54	1	1l	14	2022-03-05 18:44:30	43	20	850
67	1	72x45	10	2022-03-07 10:58:02	56	36	18000
80	1	S	23	2022-03-25 11:09:52	64	40	600
81	1	M	23	2022-03-25 11:09:52	64	40	600
82	1	L	23	2022-03-25 11:09:52	64	40	600
83	1	S	23	2022-03-25 11:09:52	65	40	600
84	1	M	23	2022-03-25 11:09:52	65	40	600
85	1	L	23	2022-03-25 11:09:52	65	40	600
68	1	S	23	2022-03-25 10:40:17	60	39	1
69	1	M	23	2022-03-25 10:40:17	60	39	1
70	1	L	23	2022-03-25 10:40:17	60	39	1
71	1	S	23	2022-03-25 10:40:17	61	39	1
72	1	M	23	2022-03-25 10:40:17	61	39	1
73	1	L	23	2022-03-25 10:40:17	61	39	1
75	1	M	23	2022-03-25 10:40:17	62	39	1
76	1	L	23	2022-03-25 10:40:17	62	39	1
77	1	S	23	2022-03-25 10:40:17	63	39	1
78	1	M	23	2022-03-25 10:40:17	63	39	1
79	1	L	23	2022-03-25 10:40:17	63	39	1
86	3	300g	23	2022-03-25 11:40:15	66	41	300
87	3	100g	23	2022-03-25 11:40:15	67	41	100
88	3	200g	23	2022-03-25 11:40:15	68	41	200
89	3	400g	15	2022-04-02 23:14:32	70	43	400
90	3	250g	15	2022-04-02 23:14:32	71	43	280
91	3	Ambarella cutney	15	2022-04-02 23:31:10	74	44	400
\.


--
-- TOC entry 3531 (class 0 OID 24951)
-- Dependencies: 239
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (productimageid, productid, productimage1, productimage2, productimage3, productimage4, productimage5, productimage6) FROM stdin;
3	4	img_1626069038-de1.png	img_1626069038-de2.png	img_1626069038-de3.png	img_1626069038-de4.png	img_1626069038-de5.png	img_1626069038-de6.png
1	1	img_1626004262-download.jpg	img_1626004262-s-l300.jpg	img_1626004262-1.jpg	img_1626004262-2.jpg	img_1626870925-images.jpg	img_1626870925-BSM220.jpg
4	7	img_1628228761-IMG-20210315-WA0002.jpg	img_1628228761-IMG-20210315-WA0005.jpg	img_1628228761-IMG-20210315-WA0007.jpg	img_1628228761-IMG-20210315-WA0014.jpg	img_1628228761-IMG-20210315-WA0045.jpg	img_1628228761-IMG-20210315-WA0066.jpg
5	8	img_1629089569-1609930289-product-1.jpg	img_1629089569-1.jpg	img_1629089569-1609930289-product-1.jpg	img_1629089569-1.jpg	img_1629089569-1.jpg	img_1629089569-1609930289-product-1.jpg
6	9	img_1629091318-w1.png	img_1629091318-w2.png	img_1629091318-w3.png	img_1629091318-w4.png	img_1629091318-w5.png	
7	10	img_1646306856-1.jpg	img_1646306856-2.jpg	img_1646306856-3.jpg	img_1646306856-4.jpg	img_1646306856-5.jpg	
8	11	img_1646369491-34.jpg	img_1646369491-35.jpg	img_1646369491-36.jpg	img_1646369491-37.jpg		
9	12	img_1646480687-2.jpg	img_1646480687-1.jpg	img_1646480687-3.jpg			
10	20	img_1646485534-1.jpg	img_1646485534-2.jpg	img_1646485534-3.jpg	img_1646485534-4.jpg	img_1646485534-5.jpg	img_1646485534-4.jpg
11	25	img_1646487912-IMG-20220302-WA0000.jpg					
12	26	img_1646498227-12.jpeg	img_1646498227-13.jpeg	img_1646498227-14.jpeg			
13	30	img_1646500747-2.jpg					
14	29	img_1646500880-1.jpg					
15	32	img_1646503168-1.jpg					
16	33	img_1646504270-1.jpeg	img_1646504270-2.jpeg	img_1646504270-3.jpeg	img_1646504270-4.jpeg		
17	34	img_1646504539-1.jpeg	img_1646504539-2.jpeg	img_1646504539-3.jpeg	img_1646504539-4.jpeg		
18	35	img_1646506673-1.jpeg	img_1646506673-2.jpg	img_1646506673-3.jpg			
19	36	img_1646630832-1.jpeg					
20	37	img_1646645726-IMG-20220228-WA0027.jpg					
21	38	img_1646647545-2 (2).jpeg					
22	39	img_1648184697-1.jpg	img_1648184697-2.jpg	img_1648184697-3.jpg	img_1648184697-4.jpg		
23	40	img_1648186598-1.jpg	img_1648186598-2.jpg	img_1648186598-3.jpg	img_1648186598-4.jpg	img_1648186598-5.jpg	img_1648186598-6.jpg
24	41	img_1648188485-Easy-mango-chutney.jpg	img_1648188485-Easy-mango-chutney.jpg	img_1648188485-Easy-mango-chutney.jpg	img_1648188485-Easy-mango-chutney.jpg		
25	42	img_1648194627-dfg.jpg	img_1648194627-dfg.jpg	img_1648194627-dfg.jpg	img_1648194627-dfg.jpg		
26	42	img_1648194659-dfg.jpg	img_1648194659-dfg.jpg	img_1648194659-dfg.jpg	img_1648194659-dfg.jpg		
27	43	img_1648921077-Ambarella.jpeg					
28	50	img_1650959005-Rulan large-1.jpg					
29	51	img_1650962993-white 350g.jpg					
30	53	img_1650963659-thala bola.jpg					
\.


--
-- TOC entry 3533 (class 0 OID 24957)
-- Dependencies: 241
-- Data for Name: productcolors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productcolors (productcolorid, productcolor, status, productid, productcolorname, cby, cdate) FROM stdin;
6	Color_1626069197-color2.png	Active	4	BlackShirt	3	2021-07-12 11:23:17
7	Color_1626069198-color1.png	Active	4	YellowShirt	3	2021-07-12 11:23:18
8	Color_1626069198-color4.png	Active	4	GreenShirt	3	2021-07-12 11:23:18
9	Color_1626069199-color5.png	Active	4	RedShirt	3	2021-07-12 11:23:19
10	Color_1626871071-images.jpg	Active	1	Blue	2	2021-07-21 18:07:51
1	Color_1626871071-download.jpg	Active	1	Green	1	2021-07-11 17:18:19
11	Color_1626871072-BSM220.jpg	Active	1	Purple	2	2021-07-21 18:07:52
12	Color_1627271920-IMG-20210309-WA0013.jpg	Active	5	multi colors	5	2021-07-26 09:28:40
13	Color_1627271920-IMG-20210309-WA0022.jpg	Active	5	Blue	5	2021-07-26 09:28:40
14	Color_1627271923-IMG-20210310-WA0003.jpg	Active	5	Pink	5	2021-07-26 09:28:43
15	Color_1627271921-IMG-20210309-WA0024.jpg	Active	5	Black	5	2021-07-26 09:28:41
16	Color_1627271924-IMG-20210310-WA0006.jpg	Active	5	Yellow	5	2021-07-26 09:28:44
17	Color_1628232372-IMG-20210315-WA0005.jpg	Active	7	Blue	6	2021-08-06 12:16:12
18	Color_1628232373-IMG-20210315-WA0006.jpg	Active	7	Red	6	2021-08-06 12:16:13
19	Color_1628232373-IMG-20210315-WA0014.jpg	Active	7	multi	6	2021-08-06 12:16:13
20	Color_1629089610-1.jpg	Active	8	Shirt with Hood	1	2021-08-16 10:23:30
21	Color_1629089611-1609930289-product-1.jpg	Active	8	Shirt	1	2021-08-16 10:23:31
22	Color_1629091459-w3.png	Active	9	White	2	2021-08-16 10:54:19
23	Color_1629091463-w1.png	Active	9	Pink	2	2021-08-16 10:54:23
24	Color_1629091464-w5.png	Active	9	Red	2	2021-08-16 10:54:24
25	Color_1629091465-w2.png	Active	9	Brown	2	2021-08-16 10:54:25
26	Color_1629091469-w4.png	Active	9	Blue	2	2021-08-16 10:54:29
27	Color_1646306961-1.jpg	Active	10	Pink Red flower	7	2022-03-03 16:59:21
28	Color_1646306962-2.jpg	Active	10	Pink blue roundplate	7	2022-03-03 16:59:22
29	Color_1646306962-11.jpg	Active	10	Pink green cashew	7	2022-03-03 16:59:22
30	Color_1646306963-3.jpg	Active	10	Black white flowers	7	2022-03-03 16:59:23
31	Color_1646306963-4.jpg	Active	10	Big fivepointed star	7	2022-03-03 16:59:23
32	Color_1646369911-36.jpg	Active	11	MG1388CSGreen	9	2022-03-04 10:28:31
33	Color_1646369911-34.jpg	Active	11	MG1388CSBeige	9	2022-03-04 10:28:31
34	Color_1646369912-35.jpg	Active	11	MG1388CSNavy	9	2022-03-04 10:28:32
35	Color_1646369912-37.jpg	Active	11	MG1388CSKhaki	9	2022-03-04 10:28:32
36	Color_1646480720-2.jpg	Active	12	Blue	11	2022-03-05 17:15:20
41	Color_1646485757-4.jpg	Active	20	Brownies	14	2022-03-05 18:39:17
42	Color_1646485757-3.jpg	Active	20	Maars	14	2022-03-05 18:39:17
43	Color_1646485758-5.jpg	Active	20	Annona	14	2022-03-05 18:39:18
44	Color_1646487941-IMG-20220302-WA0000.jpg	Active	25	Brown	15	2022-03-05 19:15:41
45	Color_1646498345-12.jpeg	Active	26	Black and Yellow	16	2022-03-05 22:09:05
46	Color_1646498345-13.jpeg	Active	26	Balack and Yellow	16	2022-03-05 22:09:05
47	Color_1646498345-14.jpeg	Active	26	Blue	16	2022-03-05 22:09:05
48	Color_1646500767-2.jpg	Active	30	Brown	17	2022-03-05 22:49:27
49	Color_1646500897-1.jpg	Active	29	Brown	17	2022-03-05 22:51:37
50	Color_1646503271-1.jpg	Active	32	mix	19	2022-03-05 23:31:11
52	Color_1646504543-1.jpeg	Active	34	white	20	2022-03-05 23:52:23
53	Color_1646506505-3.jpg	Active	35	white	21	2022-03-06 00:25:05
54	Color_1646506505-1.jpeg	Active	35	white	21	2022-03-06 00:25:05
55	Color_1646506506-2.jpg	Active	35	white	21	2022-03-06 00:25:06
37	Color_1646485679-1.jpg	Active	20	Coconut	14	2022-03-05 18:37:59
39	Color_1646485757-1.jpg	Active	20	Coconut	14	2022-03-05 18:39:17
38	Color_1646485679-2.jpg	Active	20	Oreeo	14	2022-03-05 18:37:59
56	Color_1646630847-1.jpeg	Active	36	White	10	2022-03-07 10:57:27
57	Color_1646645732-IMG-20220228-WA0027.jpg	Active	37	Red	20	2022-03-07 15:05:32
58	Color_1646647596-2 (2).jpeg	Active	38	Black	20	2022-03-07 15:36:36
59	Color_1646647708-2 (2).jpeg	Active	38	Black	20	2022-03-07 15:38:28
60	Color_1648184827-2.jpg	Active	39	Black Shirt	23	2022-03-25 10:37:07
61	Color_1648184827-4.jpg	Active	39	Red Shirt	23	2022-03-25 10:37:07
62	Color_1648184827-6.jpg	Active	39	Dark Blue Shirt	23	2022-03-25 10:37:07
63	Color_1648184827-1.jpg	Active	39	White Shirt	23	2022-03-25 10:37:07
64	Color_1648186682-4.jpg	Active	40	Red Shirt	23	2022-03-25 11:08:02
65	Color_1648186682-3.jpg	Active	40	Blue Shirt	23	2022-03-25 11:08:02
66	Color_1648188549-Easy-mango-chutney.jpg	Active	41	300g	23	2022-03-25 11:39:09
67	Color_1648188549-Easy-mango-chutney.jpg	Active	41	100g	23	2022-03-25 11:39:09
68	Color_1648188549-Easy-mango-chutney.jpg	Active	41	200g	23	2022-03-25 11:39:09
69	Color_1648194681-dfg.jpg	Active	42	shirt	23	2022-03-25 13:21:21
70	Color_1648921323-Ambarella.jpeg	Active	43	400g	15	2022-04-02 23:12:03
71	Color_1648921323-Ambarella.jpeg	Active	43	250g	15	2022-04-02 23:12:03
72	Color_1648921323-mango chutney.jpeg	Active	43	400g	15	2022-04-02 23:12:03
73	Color_1648921324-mango chutney.jpeg	Active	43	250g	15	2022-04-02 23:12:04
74	Color_1648922385-Ambarella.jpeg	Active	44	400g	15	2022-04-02 23:29:45
75	Color_1650959012-Rulan large-1.jpg	Active	50	Rulan Kerali	20	2022-04-26 13:13:32
51	Color_1646504298-1.jpeg	Active	33	Small	20	2022-03-05 23:48:18
78	Color_1650963021-white 350g.jpg	Active	51	White Sesame Bottle	20	2022-04-26 14:20:21
\.


--
-- TOC entry 3535 (class 0 OID 24963)
-- Dependencies: 243
-- Data for Name: productreviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productreviews (reviewid, review, rating, cby, cdate, productid) FROM stdin;
\.


--
-- TOC entry 3537 (class 0 OID 24969)
-- Dependencies: 245
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productcode, product, catserial, description, quantity, price, listprice, createddate, last_updated, tags, approvedby, approveddate, status, createdby, usergroup, rating, productmainimage, fulldescription, quickadd) FROM stdin;
44	001	Ambarella chutney	8	Ambarella chutney	5	400	400	2022-04-02 23:28:40	2022-04-03 23:23:41	chutney,Ambarella Chutney	1	2022-04-18 12:28:52	Active	15	All	\N	1648922321-Ambarella.jpeg	Motha Products&nbsp;&nbsp;Contact Us -&nbsp;0765366280Courier Charges - Islandwide 1st Kilo Rs.400/-Every additional kilo at Rs.150/-	\N
51	Item 04	White Sesame Bottle (Hulled)	8	Sakura Products \n Contact Us - 0760350432	50	500	500	2022-04-26 14:18:48	\N	Sesame,Sesame Bottle,Sakura Thala,Sesame Products,තල නිෂ්පාදන ,gingelly roll,Gingelly Products,White sesame,සුදු තල	1	2022-05-04 14:48:24	Active	20	All	\N	1650962928-white 350g.jpg	White Sesame Bottle (Hulled)Net Weight - 350gDelivery within four days\n(Delivery&nbsp;fees will be charged)&nbsp;\n\n\n\n\n\nSakura Products - Contact\nUs -&nbsp;0760350432	\N
53	Item 06	Thala Bola	30	Sakura Products - Contact Us - 0760350432	200	120	120	2022-04-26 14:30:48	\N	Sakura Products,Sesame Ball,Sesame Products,sesame related sweets,තල බෝල ,Gingelly Ball	1	2022-05-04 14:48:31	Active	20	All	\N	1650963649-thala bola.jpg	Ingredients : Gingelly, SugarNo artificial&nbsp;flavorsDelivery within four days\n(Delivery&nbsp;fees will be charged)&nbsp;\n\n\n\n\n\nSakura Products - Contact\nUs -&nbsp;0760350432	\N
52	Item 05	Black Sesame Bottle (De-hulled)	8	Sakura Products - Contact Us - 0760350432	50	350	350	2022-04-26 14:24:03	2022-05-12 12:48:32	Black Sesame,Sesame Products,Sakura Products,Gingelly Products,කළු තල	1	2022-05-04 14:48:28	Active	20	All	\N	1650963244-black 350g.jpg	Delivery within four days\n(Delivery&nbsp;fees will be charged)&nbsp;\n\nSakura Products - Contact\nUs -&nbsp;0760350432	\N
26	B01	Batik Frock	5	Batik Frocks	15	230	230	2022-03-05 22:05:43	2022-03-05 22:13:23	Batik,Frock,Ladies,women	1	2022-03-05 22:07:25	Active	16	All	\N	1646498144-12.jpeg	Kumari Mini Garments contact us -&nbsp;0112603883	\N
13	KT001	Key Tags	24	Key Tags	100	200	200	2022-03-05 18:12:25	\N	\N	1	2022-03-05 18:16:47	Active	13	All	\N	1646484145-KT001.jpg	Delivery Period -&nbsp; Within 2 Weeks	\N
43	001	Mango Chutney	8	Mango Chutney	4	400	400	2022-04-02 23:07:14	2022-04-03 23:22:47	Chuteny,mango chutney,ambarella cutney	1	2022-04-18 12:28:57	Active	15	All	\N	1648921993-mango chutney.jpeg	Motha Products&nbsp;&nbsp;Contact Us -&nbsp;0765366280Courier Charges - Islandwide 1st Kilo Rs.400/-Every additional kilo at Rs.150/-	\N
12	63	Hand Sanitizer	23	Cool & Care Hand Sanitizer with moisturizers	50	70	190	2022-03-05 16:54:35	2022-03-05 17:09:02	Cleaning Products ,Hand Sanitizer	1	2022-03-05 16:55:03	Active	11	All	\N	1646479870-2.jpg	Cool &amp; Care Hand Sanitizer -&nbsp;50ml (spry) Rs.70, 100ml (spry) Rs.125,&nbsp; 500ml (Pump) Rs.490,&nbsp; &nbsp;1l&nbsp; Rs.650,&nbsp; &nbsp;4l Rs.2400&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Contact Us&nbsp; -&nbsp;0712289955	\N
15	KT003	Key Tags	24	Key Tags	200	70	70	2022-03-05 18:19:44	\N	\N	1	2022-03-05 18:20:42	Active	1	All	\N	1646484584-KT003.jpg	Delivery Period -&nbsp; Within 2 Weeks	\N
20	01	Dessert	21	Super Creamy Coconut Ice Cream	10	790	790	2022-03-05 18:30:47	2022-03-06 00:38:12	Ice Cream,Desserts,Yoghurts	1	2022-03-05 18:47:13	Active	14	All	\N	1646507292-1.jpg	Super Creamy Desserts - Coconut Ice Cream,&nbsp; Snickers Ice Cream,&nbsp; Oreo Ice Cream,&nbsp; Maars Ice Cream,&nbsp; Brownies Ice Cream,&nbsp; Annona Ice Cream,&nbsp; Kurakkan Yoghurt,&nbsp; Oats Yoghurt,&nbsp; Chocolate Biscuit Pudding,&nbsp; White Chocolate Biscuit Pudding,&nbsp; Caramel Pudding,&nbsp; Watalappam&nbsp; &nbsp;Contact Us -0774672487	\N
16	KT004	Key Tags	24	Key Tags	200	70	70	2022-03-05 18:20:00	\N	\N	1	2022-03-05 18:20:46	Active	1	All	\N	1646484600-KT004.jpg	Delivery Period -&nbsp; Within 2 Weeks	\N
17	KT005	Key Tags	24	Key Tags	200	70	70	2022-03-05 18:20:15	\N	\N	1	2022-03-05 18:20:50	Active	1	All	\N	1646484615-KT005.jpg	Delivery Period -&nbsp; Within 2 Weeks	\N
31	P 01	Ladies Fashion	5	Gunasinghe Trade Center -Ladies Fashion	5	900	900	2022-03-05 23:13:18	2022-03-05 23:16:52	\N	1	2022-03-05 23:13:30	Active	18	All	\N	1646502372-1.jpg	&nbsp;Gunasinghe Trade Center - Contact Us -&nbsp;0718834798	\N
33	Item 01	Thala Products	30	Sakura Thala	100	120	120	2022-03-05 23:45:37	2022-04-26 14:11:12	Sakura Thala,Thala Products,Sesame Products,Sesame Sweets,Thala Kerali,Gingelly Rolls,තල කැරලි	0	2022-03-05 23:52:59	Active	20	All	\N	1646504138-1.jpeg	Sakura Products - Contact Us -&nbsp;0760350432	\N
23	2	Yoghurt	21	Super Creamy Oats Yoghurt	100	70	70	2022-03-05 18:57:59	\N	\N	1	2022-03-05 19:00:55	Active	14	All	\N	1646486880-4.jpg	Super Creamy Oats Yoghurt - Contact Us -&nbsp;&nbsp;0774672487&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	\N
14	KT002	Key Tags	24	Key Tags	200	70	70	2022-03-05 18:13:09	2022-03-05 18:15:19	\N	1	2022-03-05 18:16:51	Inactive	13	All	\N	1646484190-KT002.jpg	Delivery Period -&nbsp; Within 2 Weeks	\N
36	L 01	Lace Products	29	72x45  Lace Product	2	18000	18000	2022-03-07 10:55:31	\N	Handicraft,Lace Products	1	2022-03-07 10:58:49	Active	10	All	\N	1646630732-1.jpeg	Lace Products contact Us -&nbsp;0776157410	\N
30	P02	Pan Spoon Holder	29	CraftSerene - Pan Spoon Holder	2	500	800	2022-03-05 22:45:07	2022-03-05 22:47:19	Handicraft,Spoon Holder,Pan Products	1	2022-03-05 22:45:15	Active	17	All	\N	1646500639-2.jpg	CraftSerene - Contact Us -&nbsp;0788181272	\N
29	01	Pan Flower Vase	29	Craftserene - Flower Vase	2	750	1000	2022-03-05 22:37:34	\N	Handicraft,Flower Vase,Pan Products	1	2022-03-05 22:38:34	Active	17	All	\N	1646500055-1.jpg	Craftserene - Contact Us-&nbsp;0788181272	\N
35	S01	Sea Shells Cross	29	Sea Shells Cross	5	4000	4000	2022-03-06 00:22:19	2022-03-06 00:27:18	Handicraft,Sea Shells Products,Cross	1	2022-03-06 00:26:15	Active	21	All	\N	1646506638-1.jpeg	Ceylon Sea Beauties - Contact Us -&nbsp;0766259541	\N
32	H01	Dumbara Rata Products	29	Dumbara Rata Wall Hanger	2	375	375	2022-03-05 23:29:11	2022-03-05 23:34:03	Dumbara Rata Products,wall Hanger	1	2022-03-05 23:29:42	Active	19	All	\N	1646503444-1.jpg	Dumbara Rata Products - Contact Us - 0777959608	\N
50	Item 02	Rulan Kerali	30	Rulan Kerali\n\nNet Weight 225g	250	180	180	2022-04-26 13:13:15	2022-05-12 12:46:21	Rulan Kerali,Rulan Rolls,රුලන් කැරලි ,රුලන්,Sakura product	1	2022-05-04 14:48:19	Active	20	All	\N	1650962733-Rulan large-1.jpg	Ingredients : Rulan, Coconut, SugarNo artificial&nbsp;flavors [Delivery within four days (Delivery&nbsp;fees will be charged)&nbsp;]	\N
25	001	Garlic Pickle	8	Motha Products - Garlic Pickle	6	500	500	2022-03-05 19:13:46	2022-04-03 23:20:26	Food,Garlic Pickle,Vegetable	1	2022-03-05 19:13:59	Active	15	All	\N	1646487828-IMG-20220302-WA0000.jpg	Motha Products&nbsp;&nbsp;Contact Us -&nbsp;0765366280Courier Charges - Islandwide 1st Kilo Rs.400/-Every additional kilo at Rs.150/-	\N
38	Item 03	Kalu Dodol	30	Sakura Kalu Dodol \n800g - Rs.600	10	600	600	2022-03-07 15:35:31	2022-04-26 14:10:39	Sweet,Kalu Dodol	1	2022-03-07 15:39:30	Inactive	20	All	\N	1646647532-2 (2).jpeg	Sakura Products Contact us-&nbsp;0760350432	\N
46	001	Maldive Fish Sambol	8	Maldive Fish Sambol	0	990	990	2022-04-07 21:40:50	2022-04-07 21:57:09	Maldive Fish Sambol ,Umbalakada Sambal	1	2022-04-18 12:28:41	Active	15	All	\N	1649347851-Maldive Fish Sambol.jpeg	Maldive Fish Sambol Large - Rs.990Maldive Fish Sambol Small - Rs.700	\N
45	001	Lime Pickle	8	Lime Pickle	6	350	350	2022-04-07 21:30:20	\N	Lime Pickle,Pickle,Lunu Dhehi	1	2022-04-18 12:28:46	Active	15	All	\N	1649347222-Lime pickle.jpeg	Lime Pickle Large - Rs.350Lime Pickle Small - Rs.260	\N
47	001	Chilli Paste	8	Chilli Paste	3	650	650	2022-04-07 21:50:59	\N	Chilli Paste	1	2022-04-18 12:28:35	Active	15	All	\N	1649348461-Chilli Paste.jpeg	Chilli Paste Large - Rs.650Chilli Paste Small -Rs.500	\N
48	001	Passion fruit Jam	8	Passion Fruit Jam	6	400	400	2022-04-07 22:03:01	\N	Jam,Passion Fruit Jam	1	2022-04-18 12:28:29	Active	15	All	\N	1649349183-passion fruit jam.jpeg	Passion Fruit Jam Large -Rs.400Passion Fruit Jam Small - Rs.300	\N
49	001	Strawberry Flavored Melon Jam	8	Strawberry Flavored Melon Jam	6	380	380	2022-04-07 22:16:44	\N	Strawberry Jam,Jam	1	2022-04-18 12:28:24	Active	15	All	\N	1649350006-stawberry jam.jpeg	Strawberry Flavored Melon Jam Large - Rs.380Strawberry Flavored Melon Jam Small - Rs.280	\N
\.


--
-- TOC entry 3538 (class 0 OID 24974)
-- Dependencies: 246
-- Data for Name: products_features; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_features (id, featurename, feature_categories, feature_status) FROM stdin;
1	Size	All Categories	Active
2	Length	All Categories	Active
3	Weight	All Categories	Active
\.


--
-- TOC entry 3540 (class 0 OID 24980)
-- Dependencies: 248
-- Data for Name: products_packs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_packs (packid, productid, packsize, packprice, packpricetype, packusergroup) FROM stdin;
\.


--
-- TOC entry 3543 (class 0 OID 24985)
-- Dependencies: 251
-- Data for Name: salepanel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salepanel (id, saleprecentage, text, link, status) FROM stdin;
\.


--
-- TOC entry 3545 (class 0 OID 24991)
-- Dependencies: 253
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
D81blrKQ53cBNfe4zyMmgGhuEqgSp55SyZjNbPhO	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoib1BtV2RxNmVIdnVBSlNzQ2o0OEFXTVBjMkdoV0dxejY3eDZnZVlaNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283276
leffqzJdKPzGR2SOwuPCqidHfrGa6PnND6rYXE2G	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWRCV3VCU1R6TmtOdkwxNEQ0NGRYRGRiZjFQdDZNRVRoemV6RXRmWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283293
mCM1S6SWHLmF8k3SVXOeTElT0GDz8hLaYu4vT0zB	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoib1lsN3psbEJ2cWswSDM1aHEzUGJyWnRZSzRjbDN4UzZ6dzBkTkpWNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282786
xcNqXZ0TsrhqlI6wZzMIJhDauqtMdeBYCvXuef9Z	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1JqWFBySWJqcUVwMmJmUFhXd2pGTk5yRGtET2hhcnp3UzFqeHpxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282797
ODGKhW9cyQSlxRxX5b5pLLzdKadl1WLRfBxRcHZL	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0NHTjROVzUwaHg4VEUydUtvWjFETGJ0OGRCdEhIRmtlRGtxZVMxUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282892
mjAKvY6rZyPTcUoOUPekdyBsCFDGzjm0YUDaXXOl	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWlTaDhubDNRUkVaT2xJM1ExaUdvSFJzWVdEQmlSOXlxYjFrWWZQTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283098
H9HWjlMnzuiYbUNm5ONoxkbcKkcggZeMytCbG9pS	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidFVmajNYcXN2bnBZclh5NkNsZmhPT3lObGRubk1KQ1NjQ0QyTTV2RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283276
FzmS0gUPPrnZznT8HB7c3FFem4MLzqs6FJVAlpUt	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVBKelg4dmlxRmEzd1libkgwcHkyNWlHTllJcElqUU9oTmZuY1JrcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283293
6jIa5z3QFvThcZId645fKYYFSdHJkulfSu7nWl7l	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicXg1RUdncDJ3aHpzNEJaM2NwS1V6VWxEUzEweXU4U01YSWc3UXdVWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282787
VSbA7bEvNDLETzjGqlIXjkpTk83TwOsm26ameyOF	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzNKQVRuaFdiVUwzQ25uQ2ZkTmVFR21yUDZIaGsyZEFadEFGcW1ocSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282797
pvLxSrgVWoakOXkBXFQqqbXR4ma7bV9pOWlpDrfz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM21WcUhiczBqaWJMYnlwblhQR0pQazBoeW1QeENKT3cyczhxc01BdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282892
IeLvvEzryoTbK9WQPimkacMASTaVUvJcZds8MCuV	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicFNMWDAwbzROV3EyQXR0TGl1dHkyN204cHFpN2E4Tkh3OXRTejhFbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283098
fqxAgGS7XBEFP55CJGUZHtjLZTcrA3lXC0Grmp69	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjlQZnpwMDd5T29YaW1ZUDdDRGNmNUdiU01OZG5VRlFQS2FSVEJmTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283276
lOXeSyPqYBfmdVBm5UUHq4qNsHoKK0sV5CGlAySf	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnhONlF3OVY5aXJMSkNkbjRWeTJkVU5JRllwUW5ta0R4MHhHN055QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283293
VwT9zx3PyixcUNMOcmGZlip9oRHyn2F8n1R6DDaP	\N	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YToxMjp7czo2OiJfdG9rZW4iO3M6NDA6InRYTHZ2VVdsMzhCT0h3b0xHcm5qa2x0bEt1MzA5Y2lJTFlPRGhrbnIiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM5OiJodHRwOi8vbG9jYWxob3N0OjkzL0Vwb2xhQmFja2VuZC9wdWJsaWMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjE1OiJVc2VyTG9naW5TZXJpYWwiO2k6MTtzOjg6IlVzZXJOYW1lIjtzOjU6ImFkbWluIjtzOjEwOiJVc2VyU2VyaWFsIjtpOjE7czo2OiJVc2VySWQiO3M6MToiMSI7czo3OiJFbXBOYW1lIjtzOjEwOiJBZG1pbiBVc2VyIjtzOjE1OiJVc2VyR3JvdXBTZXJpYWwiO2k6MTtzOjEzOiJVc2VyR3JvdXBOYW1lIjtzOjU6IkFkbWluIjtzOjg6IlVzZXJUeXBlIjtzOjU6IlN0YWZmIjtzOjk6IlBhZ2VBcnJheSI7YToxNjp7aTowO3M6MjM6IkJhbm5lcnNVcGxvYWQuYmxhZGUucGhwIjtpOjE7czoyMjoiQ29udHJvbFBhbmVsLmJsYWRlLnBocCI7aToyO3M6MzQ6IkN1c3RvbWVyc19BZG1pbmlzdHJhdG9ycy5ibGFkZS5waHAiO2k6MztzOjI5OiJDdXN0b21lcnNfQ3VzdG9tZXJzLmJsYWRlLnBocCI7aTo0O3M6MTg6IkZlYXR1cmVzLmJsYWRlLnBocCI7aTo1O3M6MTQ6IkhvbWUuYmxhZGUucGhwIjtpOjY7czoyMjoiTG9naW5IaXN0b3J5LmJsYWRlLnBocCI7aTo3O3M6MjM6Ik1lc3NhZ2VDZW50ZXIuYmxhZGUucGhwIjtpOjg7czoyMToiTmV3c2xldHRlcnMuYmxhZGUucGhwIjtpOjk7czozMDoiT3JkZXJzX1NhbGVzX1JlcG9ydHMuYmxhZGUucGhwIjtpOjEwO3M6Mjc6IlByb2R1Y3RDYXRlZ29yaWVzLmJsYWRlLnBocCI7aToxMTtzOjE4OiJQcm9kdWN0cy5ibGFkZS5waHAiO2k6MTI7czoyMDoiVmVuZG9yRWRpdC5ibGFkZS5waHAiO2k6MTM7czozMDoiVmVuZG9yUHJvZHVjdEFwcHJvdmUuYmxhZGUucGhwIjtpOjE0O3M6MjA6IlZlbmRvclZpZXcuYmxhZGUucGhwIjtpOjE1O3M6MjA6InZpZXdvcmRlcnMuYmxhZGUucGhwIjt9fQ==	1672287911
kCPII30AvMfIzwCLoLZoksnJhmIb5R7RcbaKIyET	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUdRVHlHa1F1QWo0ZHJxTzJLbThidVJqbnJUTlB6UHVxYkRYOWJ1NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282787
1kMCfovKsHxadOPdMuav7AGSQs1balL3j44a4X1S	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoieFg2UE5qNWxZZlllclNYM1V6Y2pENmFmSGVUNnAzakFBakw5UjgwcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283098
Kiu0kvoBSFneOZJOoTaVwL0xxRclcsgQpbYQleaL	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1ZobEdVTEUxUEFOcHZjSUlseTY2Y1p0V1VGUnBHeW1PQTJHU0JEQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282892
HUomBK08h9nFZewRDc0pRo3lLHF8dpXmmRpgo1Dc	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmRiY1V0NHFKNmpvdVl1eVU3enk4QkRuWlNvQXp5c2dkVVhGSVQ2UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283277
P41wSu0TcGCaZAplJQe1Kim2ToQTJMHjurhjZoKS	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOE9LMHYzaU1VQndLRlNCUzJhT0VmbGhRRjNRQVBIY1ZKckI4ZUVHSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283293
tupLlALgkk1CCLiRe6XMRVqBfR2cBgsDcPwMMOTU	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEs4SzBwdXN1Y2JOWTRkdWRZUkNxWXRKcWtRaktoSjJTYVQ2dzZTbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282787
v6tNSf6sdpaNS14cQ98Ou776fUMZywRyjwDfMj8q	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVJmY21EM296S1VGTVNxRExtTDNWemJpcXJZdk95bUtwc09DSUdaayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282827
e9ECTJoKmNuEvf6MDiwtNpDvMo7o7wpM06I3cXxp	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkw0azg1bG84QkR0MGk1M3hQNmVNWlRpZ0tqbGhGZzA1RWhWZHFYdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282892
9rI4mNzUuFxDcrz85YMVYOmRsnGa94gzQAbiYy2b	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHY2VE5heXpoSjluR0hFU204V2I4SE1jSmdWTzFXNEU3d2hsNHJ3NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283100
AjzKyJvqoHl5byMWdSWodPCdzqCGsaTgtPaQaYf1	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjcxa0FZaWNQVHFKZnU2bzlucW91M3RlS0RsU1R3V3ZLUmpaOVJUdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283277
7EnGgucDDIHCBYwwBQwlPC9p7qOQNZ2JfUTa7KMt	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicXk3Sk9LcEptTGtEc0dSVkZQdDZkZHFvcnQ1TzNWMkFHR0xnUDJNMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283294
Nyk4lwqtsCSyQS2bl6s1zEYDYmxnHJos25JXaMRQ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0tSOUtwSkJRcEIwc0VXaExvYmpQVTZQdkxwaWxrVGEyZVJFeE5tZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282787
cXdqH2J5HODL4CkBSyUN6jANYewJRW4B8YRbJCkn	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY056QjZXV3lwMmc3QWU4a1dpc2VvQWZhZWpNWWpCV2g5RWpoMDIwQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282827
RjckYJFVv8pBYinD7YEgR83GkZRHjkkHoXM3fewn	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjZuMU5Ya3JuY21Ud2ZSYW1QdFNyaUFDNFdESEI4SUJUdUZUYUk4ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282893
RG2CeOJXuwnDU4uXQRMMrgjPnct62k3neOfKElmu	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidW5nMzVnWWw1Y3RZcmJJRkRuQW5BTWNzOUQ4YTJiUlcwbHYxTVVtdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283100
H9mk2iuIeSsxLI5MoLQzSic6Qo6I7ZK9G2ROLfY2	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6ImIyZEpzaWNtZm8xWkFuQlNVdnhOcHRSY0FXRm1ZR1kyMjg5bTdFUFQiO3M6MTU6IlVzZXJMb2dpblNlcmlhbCI7aToxO3M6ODoiVXNlck5hbWUiO3M6NToiYWRtaW4iO3M6MTA6IlVzZXJTZXJpYWwiO2k6MTtzOjY6IlVzZXJJZCI7czoxOiIxIjtzOjc6IkVtcE5hbWUiO3M6MTA6IkFkbWluIFVzZXIiO3M6MTU6IlVzZXJHcm91cFNlcmlhbCI7aToxO3M6MTM6IlVzZXJHcm91cE5hbWUiO3M6NToiQWRtaW4iO3M6ODoiVXNlclR5cGUiO3M6NToiU3RhZmYiO3M6OToiUGFnZUFycmF5IjthOjE2OntpOjA7czoyMzoiQmFubmVyc1VwbG9hZC5ibGFkZS5waHAiO2k6MTtzOjIyOiJDb250cm9sUGFuZWwuYmxhZGUucGhwIjtpOjI7czozNDoiQ3VzdG9tZXJzX0FkbWluaXN0cmF0b3JzLmJsYWRlLnBocCI7aTozO3M6Mjk6IkN1c3RvbWVyc19DdXN0b21lcnMuYmxhZGUucGhwIjtpOjQ7czoxODoiRmVhdHVyZXMuYmxhZGUucGhwIjtpOjU7czoxNDoiSG9tZS5ibGFkZS5waHAiO2k6NjtzOjIyOiJMb2dpbkhpc3RvcnkuYmxhZGUucGhwIjtpOjc7czoyMzoiTWVzc2FnZUNlbnRlci5ibGFkZS5waHAiO2k6ODtzOjIxOiJOZXdzbGV0dGVycy5ibGFkZS5waHAiO2k6OTtzOjMwOiJPcmRlcnNfU2FsZXNfUmVwb3J0cy5ibGFkZS5waHAiO2k6MTA7czoyNzoiUHJvZHVjdENhdGVnb3JpZXMuYmxhZGUucGhwIjtpOjExO3M6MTg6IlByb2R1Y3RzLmJsYWRlLnBocCI7aToxMjtzOjIwOiJWZW5kb3JFZGl0LmJsYWRlLnBocCI7aToxMztzOjMwOiJWZW5kb3JQcm9kdWN0QXBwcm92ZS5ibGFkZS5waHAiO2k6MTQ7czoyMDoiVmVuZG9yVmlldy5ibGFkZS5waHAiO2k6MTU7czoyMDoidmlld29yZGVycy5ibGFkZS5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283287
kNjimYWbSOfOlHVemtVoDkhhFqe6UrJTdJeVDxE4	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicndyVXYyOVRmcDBYTXZsNVoybDduME9iM1doU29VT3ZDenR3V0JHUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283294
0dWbSkjypt2rjm3RSAvwJI9Sp4xgvEXw0eOBF8m8	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTN0dHFuaUFJODMxTXlsMThZYVVZZDlBcmRqUXlRVG5Ra0lTV1Q1MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282787
hrDHqr4mJHObDlwv1I6wDLWBIgaXrEqwEZEbv0Eg	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjFoWFlxeWxjdUpYUXkzc1BjS2ZRM252NzljQ3YzaUV0cTJMbXdrVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282827
g3gaCA7HM7AYy6WDBhxBiL20cXhykGitE4A4ZzZB	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2ZJenNzNUZVb0pSNHU1UHpBdW5nWE1QV0ppMk5FT3J4NnEyNk1SNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282893
TerdPxIpNw7IOuXkRGSx7SLWcD6NS4HZSXNCxy8j	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY05OeUp5aFo2cUMzOVg5MEdqV1pYQ1plZVhaRE1kM2pqVEsza1V2RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283100
O9bO8nKHZj2pdGo175QHSbgg17sQiwoLJv69XU1l	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidGZoNmhPTVJkQkM2Tno0MVU5eTBhZTRMYVFOS0taQTI1UTZ1aVBBZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283287
UQr6VhqPU9MTSjiTaiRsax4nuzmr6aebGAUiqrUt	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3llclBVMldqeldZeW1JcHE5cXE3TDN3aldrSVdCUGN1cWZ4TXpSZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283294
zuwHoDNgyCIw3FUX4id95gJm1UO1r6Rvs0PitXSK	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXFIanNZWHliZE9aSnAycGdiMmFsblFPcWJFajlGQkxJNHhVVk16QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672282770
Yd2G5k5J1gY8obdqJ1qArbWvNPeFJk7cNhIf8SJB	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2ZoQ2ZTNzFXbG5EbU55T2RPZE1EYWt4NHBveDFQcEU4UlBSVHBFQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282787
rTaTZ4pBGG1sim6Fv4j4y64UdJ9l3g8ZzDXTo8il	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2pjY01WcXJrVkMxaDM3bE9qN3kxVDhKR2kwN1Npelk2RUFheENtciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282827
TpodDOq07ROsqFUE7hdHoZZzpCTDLm81p5yfznUL	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDR3RUs3eDdWVEdZb0Z0NlRhblUyVUY0QjV6eEVJNmU1cEZoQ1Z4USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282893
TT7FeEcBkaH3FHEjiFbjKPI3YjUf6a0TEPLC76bk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDkzS1M2SExIbE5oUHZZM1hpZWVIcE1OTVNkVmo3bXlUdHJDakJudCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283100
Z4Wx4OxIYcNdfSfOUvDaZpW7ZnNe13yoUvSYkYed	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUFrcXVlRzNtR2lVTG9zeG50RXBtc2FwbUNlb1NwUEVaNlpRdDB2ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283287
ITPKYx2k5HJMst2Mv2zwTz3ykqUO618xcza7kOZQ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmdWakdFUWpuVUdHU3NzQ2VDNGlZaHpESUxQMzhuWXBESFNmUFI3MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283294
ZIJ1RY6vC5ff2wGj9iLs8CBINn3ClrTxNogkKpqG	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6IkdSRGs1ZXd1T0VWWXAyMThZVXpiU05QaExtd3BLbjBaZ20yTEZaRHkiO3M6MTU6IlVzZXJMb2dpblNlcmlhbCI7aToxO3M6ODoiVXNlck5hbWUiO3M6NToiYWRtaW4iO3M6MTA6IlVzZXJTZXJpYWwiO2k6MTtzOjY6IlVzZXJJZCI7czoxOiIxIjtzOjc6IkVtcE5hbWUiO3M6MTA6IkFkbWluIFVzZXIiO3M6MTU6IlVzZXJHcm91cFNlcmlhbCI7aToxO3M6MTM6IlVzZXJHcm91cE5hbWUiO3M6NToiQWRtaW4iO3M6ODoiVXNlclR5cGUiO3M6NToiU3RhZmYiO3M6OToiUGFnZUFycmF5IjthOjE2OntpOjA7czoyMzoiQmFubmVyc1VwbG9hZC5ibGFkZS5waHAiO2k6MTtzOjIyOiJDb250cm9sUGFuZWwuYmxhZGUucGhwIjtpOjI7czozNDoiQ3VzdG9tZXJzX0FkbWluaXN0cmF0b3JzLmJsYWRlLnBocCI7aTozO3M6Mjk6IkN1c3RvbWVyc19DdXN0b21lcnMuYmxhZGUucGhwIjtpOjQ7czoxODoiRmVhdHVyZXMuYmxhZGUucGhwIjtpOjU7czoxNDoiSG9tZS5ibGFkZS5waHAiO2k6NjtzOjIyOiJMb2dpbkhpc3RvcnkuYmxhZGUucGhwIjtpOjc7czoyMzoiTWVzc2FnZUNlbnRlci5ibGFkZS5waHAiO2k6ODtzOjIxOiJOZXdzbGV0dGVycy5ibGFkZS5waHAiO2k6OTtzOjMwOiJPcmRlcnNfU2FsZXNfUmVwb3J0cy5ibGFkZS5waHAiO2k6MTA7czoyNzoiUHJvZHVjdENhdGVnb3JpZXMuYmxhZGUucGhwIjtpOjExO3M6MTg6IlByb2R1Y3RzLmJsYWRlLnBocCI7aToxMjtzOjIwOiJWZW5kb3JFZGl0LmJsYWRlLnBocCI7aToxMztzOjMwOiJWZW5kb3JQcm9kdWN0QXBwcm92ZS5ibGFkZS5waHAiO2k6MTQ7czoyMDoiVmVuZG9yVmlldy5ibGFkZS5waHAiO2k6MTU7czoyMDoidmlld29yZGVycy5ibGFkZS5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672282782
MezYLL9ckmXiUV8rqqVlt5MKpbndhqhaAJIyx8Lh	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnNCNHZLQVpCN1p1bGFPeHVYbTZ6RnBQVUNVM1JaM3lub2FRQm9GdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282787
xYALe6rVxDOkKd5gmZykehkIp7ZZAA0EEOq6C7TV	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidmJVWWNFejA1a3phZGt4d3BKdEU1N1VYQjRiQzZLWGl2TndyRGNjdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282828
13667eO7WNI7e4GzBUxNizduvHFD42dXCvnBfeJk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3ZzSGhVbjlCZ1RQazN2QTRLdHRBTmYybGxJTld5MjIxcXFueUdaSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282893
P5tZ81Wo5FR0U97ChX2Bb3YtA8535o4SCO9sGNMC	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXRRQ2R0U1BCcnBjVTdUMHVSMEowZVlaV3UxRG9FVFRoa3lkUHR0QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283100
hwDUpVIhq8AAX5BuoMpOsckcWIUivJUsXA0vvfgx	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVZSSG9HQ3djSlBFcTFZbGE2NU9OQmFjR2JtU0pURFJFeEVnRE5sciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283287
n7GWTzGt7La2nOy8Ei8rBrT0eKgsqfnUFtTTBIC4	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidGpoblFBMFBKTkZIUUpYcmZoZWJERER6NHdBV1puT2VVZWxQY2l2dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283294
pW2gYTOnyccdq776Koevd9DsCCwMsdwPsm8Y6GIp	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWRuYTJxR2xScVRYNzZQbEhxakRRUms2U0gzNVFCTHNldFRsMG5HRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282782
zAhLatKXYvvjmkTGu2NDDOxRAx5ddhNUdwkJvTYz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicEdKUWt3YnZrVDRDc2dkYmEyYklxZGx5cW5MRjlseDZQWGRjOGxzbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282788
RLFFkCBsT8JvNZ3J3CBeNu2MLN31nkbrTUTH5suT	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoieEpOeWNSWFlVak1YQlRmaTMyM1Jsanh2bWRETFdVUWtyS0sweEhxQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282828
FwcdDEQ1zQhE8VQNxftBl4eUJ2JsvbrP3eE1fmBV	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiclE3YUsyTm9penA5T3dubDh3ZEJHRzQyUDlkdzkxU2c5NXhVOTV2QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282893
fFl9gGwwLC5hOgq8qPR70vw6mlzBd9XncBSa7hXo	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWthSGsybkUzNnNrN1Nxd0VMTlVZcGxwUW5SUXJoc3V0YXZLcWoxUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283100
5XN3aN79hywRhP2i6CEq1yz0RuUkKY1G8HFd9Zcz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoic2EzVHA4VHJsbjlwYmoyNjFzOE5MRmlyTlBIVHYxYllOUE5uVHRjRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283287
LjSn5Y4TJGPbLQNC5hIfIg8UJdZ8IJNadIH1frV3	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicWtjeWtOS1dvR1h1d25pUGZCUWlsakhPbldkMWx3QkVrdVl2U3VrNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283294
LwiWNIO0KcBMZzA3i3lXsOSLQJKZk9Re7fJjo69N	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVhnbnVBbGtNcnFYM3RxdVBOZFdFanJPaWRsWjZVVWRrVXhFRGJsVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282782
QwYk6quJZFoF2MHm4meJ4rAiC5h7b5PI1llqsKgD	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXFrSERITFdnMkRkblVTeFBiWmN2d0ZMTkI0MXJ3SlhmTzVOVWI5SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282788
qDHo0WPi5GMvgP0QFEJoznvfbMceJe2CVeKVVtuu	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjY5QUZzaXlTYTJtaVlUUUZudnhlMTRxZXNJU01wc2haNjdJdHZuayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282828
71NYwJ23yB5n9akZouT0mXkSpA9vAymZhTatckGc	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1hydU1lV2tSOXZGdjNIWnRFZ1R0UGRuRGNzQUZGZjBaenpudjYwQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282893
DQWxZ0h6sAbdZZ0wDZojKAzr6q42JyDzdDClUHWj	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXo5MVJndlZ2ZW5wVkRvM0JQV1N1Z1NFYmhLVVJROGF4ZVhTcjduViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283100
5iH0o09b2Ocv81rGoavp8eG2x2RIR1bfrL962rYf	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0xxTk5tMmpHNThTS0Y0Njlld3ltWTRXTldaY3lSZWpYY3l2Tkt0WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283288
wrGXqDpTstnd938P9muXqWBmOB8bxkiJyKtNz6C2	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoialVWQ3Zvanc4UEEzS1dhTTBWTnRINE51VHNwRkNoWEJ3RXBMVmxlUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283295
gzB8g9UfgygU4kev9t5f0ttFqTwUxGslDWfncnod	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFFEUFk1Z0NFVHI1T1dQZm13RGRpU1RhME1SRFJVZGR0bDVYbnZhVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282782
psZTolgi9I5p4SUmFzqvW2EiIx8gjHFWc6Ta3gcz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicVBJbDlNWExkeEhHUDhOSm8ybHJEOE5hYXY2d3FNRUVXQW4xRGs5MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282788
kxWwYlJ6njkW0T4TVAhTDKNZDJE8sYdnUHLSdAR4	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmIwQUpWdWtlTDljdmxFOWVoc3JoRFdWRWdCVnBNVWg1TkMzblk3MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282828
MFvNILTtOE4UbNMdj7hXCJ7CLvElNXeL3XDNetqR	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2hvb2cyeWxNM0hEZDlBbVBqTXpBMnBpUHdUMGxsMm1NOXJsRmJxcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283073
Ma5b7GG7KzBcrVg6XWLk6VBGI2cnaQyd4EZA3UMd	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDhnR0J1WlNGdHh4SUdoWFpoTjVROEtzRWF4U1lLeXBYS2dpQ1o5ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283101
EPi26cut01VKEpaXJ7CVHJbD2saS7NG5HLmsB7n6	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicXpvbnNRSFkyS29zWXltbTNmcFozUlVSbzJ2NG9nbzN2VmtaNEFNcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283288
7eSDNEHFXMMlEj6sRgH8IiPwnGzUsJrLx1BYv6Cm	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicTNITlFmUE5DVjdlbkJIREdFaFFXb05ISWtVZG9KSU9qUDFjUjBScCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283295
FtHx4rL1aKOEI4zlwpkjCID3fI5RIevxF7vZ21Bo	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkhKbjlhUHhIaHZFRXZPanJOSzBaUGNDZXpSOEx1Nkh6OUdzV3pvVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282782
50LGsnQxaYy7KlvmtO8oA1npXusdN8JjLwz16SEU	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidENWVkNXWDFSaTBjdmJUM1pva01TbEhvY0IwMkE4WG9JSVZNeG1QQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282788
VoUtTj4ZKltnKQPBiMFEwZJjnH1BlOzS6ca0ByJx	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjlldWdlR2ZPRWEwUGJvVTRLOENlTzhzQ3BoWXNwWkJvYTVyMGlnUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282828
RRa2yfoMdaEekqJ9ZmQoyfUxLhcIA78yCZcjDsCk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFlRUmViZnUxdGJjM3JTeHVkeVVxTjMyMENYeW5Mb3JCRGUzU0g4YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283073
sUP10zg7Fl4menLo6vpdzLs1NuOGCP67LLnTeoty	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0Z5cjNXeFlTWFl3a3c0MFVDazNjcm94UVpzRldPb0UzZGk4RkM1eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283101
OXDxxOKQVGZJG52KScLsN4X8ELOreWVxWt6gJrTb	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWdzWjJrOTdYWGdZV3RUQUEzTDBnNDdYcDJtSUlxUHhmRURWRlk0cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283288
w2R8azfG80nCTT4ogHqCw1wS5sUG2SM93VoB3aVu	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW9hSGlrTjVLWWNsT3RRZUNXZWl5SGVyM2tFZVh1R3Jtc2kyRXBRUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283295
lvo2ngy48ChPEri07Z44J8ztoUmehtFc4yXNJ9Sl	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibURiVzh1V21kaEN6YTVxS0lyMWlaNkRmQ3NXNlVhTnBZWFJuQ0pXZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282782
bm9FbxdyewQwzDMUxsjyV1CIUciROZpOoJK8YrUp	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXZnYUE5bGFoZFl3OWlIYVRBUmhIZkpYN28ySDI3QVJVeWN2djZiaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282788
1SBjcA5sr7IrkEsgnD26UHmp9fLl2ZCkeB8MZcXp	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnZYVW54N1M1dDJLZWtTUGJ0aHhmSktERjM0V3ZhT2doUUdtNEE0aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282828
RoceHGvbV0oOTzt1iNSPADellDaLNmv7wH8dQug4	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibE5jRVRzRFFzaHFqRkRLc0w5a3VjMnBFSEQ0T09MMWplbGhxOVU5QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283073
RX1wpv6pSNy1ukvtlByr2x5I9AZ4fwBSloFh0L7y	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDFRTmRoZ3U1ekNmdVdGb0xkTUtvZEJYdWM2aTRiS0lLck5DazNqSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283101
ph1a2dFXVz8yHhHbNyObO5V1tE3P5nlLVJO4M1em	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXNZWlIxcGs3TjB2dmFqYTBzM1hNWGVLVlhIS25vQkFMYVNZZjg5QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283288
V9HAUCXs1sLsI1Bbdzkylf3giizQilUufG2O7KoY	\N	112.135.130.81	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YToxMjp7czo2OiJfdG9rZW4iO3M6NDA6IndJdGx1WFZzTTlqTW1Xcm9FVHkyc2dGRzRhQk8yTjJ4a2U2dG1PMmkiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU4OiJodHRwOi8vMTIzLjIzMS4xMTQuMTYwOjkzL0Vwb2xhQmFja2VuZC9wdWJsaWMvQ29udHJvbFBhbmVsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxNToiVXNlckxvZ2luU2VyaWFsIjtpOjE7czo4OiJVc2VyTmFtZSI7czo1OiJhZG1pbiI7czoxMDoiVXNlclNlcmlhbCI7aToxO3M6NjoiVXNlcklkIjtzOjE6IjEiO3M6NzoiRW1wTmFtZSI7czoxMDoiQWRtaW4gVXNlciI7czoxNToiVXNlckdyb3VwU2VyaWFsIjtpOjE7czoxMzoiVXNlckdyb3VwTmFtZSI7czo1OiJBZG1pbiI7czo4OiJVc2VyVHlwZSI7czo1OiJTdGFmZiI7czo5OiJQYWdlQXJyYXkiO2E6MTY6e2k6MDtzOjIzOiJCYW5uZXJzVXBsb2FkLmJsYWRlLnBocCI7aToxO3M6MjI6IkNvbnRyb2xQYW5lbC5ibGFkZS5waHAiO2k6MjtzOjM0OiJDdXN0b21lcnNfQWRtaW5pc3RyYXRvcnMuYmxhZGUucGhwIjtpOjM7czoyOToiQ3VzdG9tZXJzX0N1c3RvbWVycy5ibGFkZS5waHAiO2k6NDtzOjE4OiJGZWF0dXJlcy5ibGFkZS5waHAiO2k6NTtzOjE0OiJIb21lLmJsYWRlLnBocCI7aTo2O3M6MjI6IkxvZ2luSGlzdG9yeS5ibGFkZS5waHAiO2k6NztzOjIzOiJNZXNzYWdlQ2VudGVyLmJsYWRlLnBocCI7aTo4O3M6MjE6Ik5ld3NsZXR0ZXJzLmJsYWRlLnBocCI7aTo5O3M6MzA6Ik9yZGVyc19TYWxlc19SZXBvcnRzLmJsYWRlLnBocCI7aToxMDtzOjI3OiJQcm9kdWN0Q2F0ZWdvcmllcy5ibGFkZS5waHAiO2k6MTE7czoxODoiUHJvZHVjdHMuYmxhZGUucGhwIjtpOjEyO3M6MjA6IlZlbmRvckVkaXQuYmxhZGUucGhwIjtpOjEzO3M6MzA6IlZlbmRvclByb2R1Y3RBcHByb3ZlLmJsYWRlLnBocCI7aToxNDtzOjIwOiJWZW5kb3JWaWV3LmJsYWRlLnBocCI7aToxNTtzOjIwOiJ2aWV3b3JkZXJzLmJsYWRlLnBocCI7fX0=	1672288057
hxA0m7oqxcTlfrBO7bnuq6Tl2gHtxaPYVED7Dkp8	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGh0UFVnaFZFeEFWYjRJSVpDZjlpaVJYVW5kczBOck9Qa0NrQTN0WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282782
yoUGW4d3xYIntRjZiHuwPqx6kXhTt7LJSpQjJCr2	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidHpaOWU2aGJOQjk3ZWdhU3VNWlhZS2JXaTV0aVBDSkxIMGQ0VW91dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282788
4w6l0ewjUxXyckGgTYqDum8RtLcjNncSI7eHNUgN	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDhaN3BoMHdCbFFSZW9CNnFaazBOOGtQOVFGblFhTm1tTVBTaEh6ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282829
dqd3whRCPyrSXTGbOzxBmw5noexSaZ9mBaSesALO	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibGRJb2RWWHlLY1ZCS1BoaVhWZEd5V0szRzZqQVcxdXVtMU5vdEhYTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283073
sfVI4qzO3HnxGt4qDWPjRcGTZNbeEFwfVXlqUPYc	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnl4NFJRRTRkUTNCRnQ0SzV1OVFBOVBvNzVXbmlSSjJOQ0FsbHY4SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283101
203GIXrASjrR3oQcDzBCR4E5off6jI3fGr8rUhIM	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR05EaFNxSUJkbDhIam52UVdiMWl6NFhZVE5IY3JSWVV2TE5iTlVjTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283289
izoOWwTFmgkWrv0dcBGxBSgLvVQo8MM3qA531wVQ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWtHZzlVOGFtREplS1VhbnBaNE5ob2pEVW4yQ3QyOWU4NTNFaVN0NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282783
yBStM7Q5rGJFrvhwslTiPsy9dF5EE1QwbGBnUOS8	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmpBYnRBZHI4NmRBOFczVk1keEM0VThWZVpSR3VjZ1pPNGxWejRGTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282788
PuPJ9ZzgdfCNe1laA9RlyD3ZLkGCSQfRJuSPGHt5	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWREdElFOVBZN09TSDJjeTUwNFpSQWFzWGpiUkRsOGh0Q1VZZ2JjeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282829
S6OdFKHBGMjskGtpr77sxjyXmy8fkKgXmJql5Lo8	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6InhvUmlFakFPM2FReWRLbXU0ODkydjdGUzFNU2pkcHBtVWMwNk9aN1AiO3M6MTU6IlVzZXJMb2dpblNlcmlhbCI7aToxO3M6ODoiVXNlck5hbWUiO3M6NToiYWRtaW4iO3M6MTA6IlVzZXJTZXJpYWwiO2k6MTtzOjY6IlVzZXJJZCI7czoxOiIxIjtzOjc6IkVtcE5hbWUiO3M6MTA6IkFkbWluIFVzZXIiO3M6MTU6IlVzZXJHcm91cFNlcmlhbCI7aToxO3M6MTM6IlVzZXJHcm91cE5hbWUiO3M6NToiQWRtaW4iO3M6ODoiVXNlclR5cGUiO3M6NToiU3RhZmYiO3M6OToiUGFnZUFycmF5IjthOjE2OntpOjA7czoyMzoiQmFubmVyc1VwbG9hZC5ibGFkZS5waHAiO2k6MTtzOjIyOiJDb250cm9sUGFuZWwuYmxhZGUucGhwIjtpOjI7czozNDoiQ3VzdG9tZXJzX0FkbWluaXN0cmF0b3JzLmJsYWRlLnBocCI7aTozO3M6Mjk6IkN1c3RvbWVyc19DdXN0b21lcnMuYmxhZGUucGhwIjtpOjQ7czoxODoiRmVhdHVyZXMuYmxhZGUucGhwIjtpOjU7czoxNDoiSG9tZS5ibGFkZS5waHAiO2k6NjtzOjIyOiJMb2dpbkhpc3RvcnkuYmxhZGUucGhwIjtpOjc7czoyMzoiTWVzc2FnZUNlbnRlci5ibGFkZS5waHAiO2k6ODtzOjIxOiJOZXdzbGV0dGVycy5ibGFkZS5waHAiO2k6OTtzOjMwOiJPcmRlcnNfU2FsZXNfUmVwb3J0cy5ibGFkZS5waHAiO2k6MTA7czoyNzoiUHJvZHVjdENhdGVnb3JpZXMuYmxhZGUucGhwIjtpOjExO3M6MTg6IlByb2R1Y3RzLmJsYWRlLnBocCI7aToxMjtzOjIwOiJWZW5kb3JFZGl0LmJsYWRlLnBocCI7aToxMztzOjMwOiJWZW5kb3JQcm9kdWN0QXBwcm92ZS5ibGFkZS5waHAiO2k6MTQ7czoyMDoiVmVuZG9yVmlldy5ibGFkZS5waHAiO2k6MTU7czoyMDoidmlld29yZGVycy5ibGFkZS5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283089
uNIXYRZQ5LhOb6VvIipSFQmf0DRaoTSN44F5eKrQ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXZLZXJrWTBxMWRxMWE0ejhsRnRta0FKdllUbHdlenMxWFlyUExieSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283101
ofVv9BsvwdyDJdbbFu1PU6NiuYBeSGSVW9i4hnDK	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidWtaVWYxWWxON0NKRmdLSkNncElUNmdVa2xBY0VrZlAyRjNqdU40ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283289
pLEy61JvgWOSgblSBkKStvqU5RDzobdxR9iRA7Yz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidmV4eEpqdEc5V050YXk2TjNUTkFLbUtnV01mOHF0WHJDMVRBZDRwZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282783
3Zb7nViaklbHQUxIQea7NAvvGmweiLNIHeZbDzkJ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibG1qUXZPTG9SbDdlWGU2c2VkTEtkbEY0MDFiWHp0SE1iamNrczdFaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282794
VWGmVakU0bXaTVoZQ7qFyvwsKyFKL7qBfajxmW8N	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSk9DbE5EWmVLZnFuZDVRS3dQYTZMQjJTUmFOMDJHNlNjeGVjTUhESiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282829
A1wYoty9O7UOvBfhs0OwMxGO0helcIh4zJCxaKgG	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6IkRpdXVpUXpoREdaUlFrTUEzZno2VFltSlRoNzJXQmg0dDN6N2tlWUMiO3M6MTU6IlVzZXJMb2dpblNlcmlhbCI7aToxO3M6ODoiVXNlck5hbWUiO3M6NToiYWRtaW4iO3M6MTA6IlVzZXJTZXJpYWwiO2k6MTtzOjY6IlVzZXJJZCI7czoxOiIxIjtzOjc6IkVtcE5hbWUiO3M6MTA6IkFkbWluIFVzZXIiO3M6MTU6IlVzZXJHcm91cFNlcmlhbCI7aToxO3M6MTM6IlVzZXJHcm91cE5hbWUiO3M6NToiQWRtaW4iO3M6ODoiVXNlclR5cGUiO3M6NToiU3RhZmYiO3M6OToiUGFnZUFycmF5IjthOjE2OntpOjA7czoyMzoiQmFubmVyc1VwbG9hZC5ibGFkZS5waHAiO2k6MTtzOjIyOiJDb250cm9sUGFuZWwuYmxhZGUucGhwIjtpOjI7czozNDoiQ3VzdG9tZXJzX0FkbWluaXN0cmF0b3JzLmJsYWRlLnBocCI7aTozO3M6Mjk6IkN1c3RvbWVyc19DdXN0b21lcnMuYmxhZGUucGhwIjtpOjQ7czoxODoiRmVhdHVyZXMuYmxhZGUucGhwIjtpOjU7czoxNDoiSG9tZS5ibGFkZS5waHAiO2k6NjtzOjIyOiJMb2dpbkhpc3RvcnkuYmxhZGUucGhwIjtpOjc7czoyMzoiTWVzc2FnZUNlbnRlci5ibGFkZS5waHAiO2k6ODtzOjIxOiJOZXdzbGV0dGVycy5ibGFkZS5waHAiO2k6OTtzOjMwOiJPcmRlcnNfU2FsZXNfUmVwb3J0cy5ibGFkZS5waHAiO2k6MTA7czoyNzoiUHJvZHVjdENhdGVnb3JpZXMuYmxhZGUucGhwIjtpOjExO3M6MTg6IlByb2R1Y3RzLmJsYWRlLnBocCI7aToxMjtzOjIwOiJWZW5kb3JFZGl0LmJsYWRlLnBocCI7aToxMztzOjMwOiJWZW5kb3JQcm9kdWN0QXBwcm92ZS5ibGFkZS5waHAiO2k6MTQ7czoyMDoiVmVuZG9yVmlldy5ibGFkZS5waHAiO2k6MTU7czoyMDoidmlld29yZGVycy5ibGFkZS5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1672283090
ujAe9tZPYEMaNDTXvyYu3n8Cqt70vR2Va0HTbWXB	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoid1Z6ZmFnMVVmTzRjb1V6emFJdFpNdHVjWFRiN2E0N3N1bEhQQ1NiWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
KAafDjqHpJvArQ7sNdLIAhd3psHg7eV6zCyebxtg	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkZocUtrOWpUdExnYktpMHZkUXpwZDNyRzduN25QcklFMURTSU1jNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283289
6qicpdS5eQVtJ6j2uilBQfPEb9uiFoeVKQWaRdjo	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHpsN0dnY3lIMXRKZGxKOW5mYTVBbEdYOHM1c1pEcDFaNlQ2RjF3YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282783
xo25E3ChdMYU6Z73dycoHYV4HL1abyrfkY124Uqk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3pGeVJjemdXQ0Y2aHZEdjQ2N2hKN3JCOW8wbHFLeVFPbGpPR3pabSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282794
6UB2QvvdLwF6VqyxT9MVVmJdIH7GTcqyt8immoCz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoid3FRbGlSbjRPSHB6NjVyQWNmSXdQQXpvSWdsa2I1dzg4TFVjbzdmNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282829
w2SDkVM63FJyrc1zwsiGxF1iLiA2scuek3OVjV12	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGJra1dVZXR6YUVhU21BM0N5RXV1bjdham0zOHcxd05DTGhvYjVDTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283095
xY0RG860vNQnJhhTVjREe17EDHCBTLpbXWQocnSO	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkJ0dXBiaUdvOU4yTnpkY0ZNTDBDQjh3YnlZWlNKbXdBRUIyQzhQUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
ptZ0LKUejyxOlhkhvdaEjbV2LiCMdxfmwUDbJEen	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUlDZjBFZTlRdmtkZG1GalJ2bWRDbVlUeGlQZmRWTExDNTU5QlNDVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283289
MmdSuzD0luFwpC5SbW1vk2HWkbRxIZeJmZ6dCdWJ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoieVVBMmdlZ3VnSjFybTBXY2w1QjhHNTdSZzNYQ296bWdLcGRmcmJiSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282783
7zhHjweFU8JtH42xJ8TAC0TtONKSW83ocfKVsWsJ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiajM5UHNNOENLd09uR2pETGNlWGl2QXlIVXc5Z2xQdW9ZYlJ1NW9hVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282794
EeHeuaLa7ehUJg88EsqRIb9Ch1oMMv8zJXiROq4r	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidUQwOXVCZDVFeHQ3cTk4ZnM4RGtLQ3BpNmdvcWRZbVRWTjZZS21EZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282829
kKCK8sEzu17OvwEUZF4B0rNRZ5Y1eIoiazWRWPy4	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicnBtRjU0ektjU3FUWTQ5TDZoaDhCSE45QzNLU1V4UGtmdk00UHpndSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283095
Fq45MLtT6MwW5fAAvDA9Ctwc3DrUFTE3qabkU75Q	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVI5RFZSV3JCdHhvb2xHV3VSOURuWmNrOGt2Y0doeVBvYm1KVjZCUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
Sov1cKt7dIQZXaZFKRhGsHjPUMl0nHKuNwOKASM4	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidVdwbm90aHJYcjUxSW5RMnAyOEd6dlAxd0lkS2dBSURlMzhJSW9DeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283289
TR4WPYLdN2IVe9o3Y18LmZIFNSJVcxPLhfjk2zpL	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2pmdjdKVDhZWTJpMlY2TjN0WjRnTk0xeFdpNmN5VHRKODBmRXpQVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282783
5cWHoVMshCOwO2uSQB43aO2l354Bu2XY0CQ6ASEp	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlVETmhSbFlsOEUxSEZJeGk3ZTBNd0NsUEhCTndac1JTb1RkRWliSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282794
M2YSdnuUMiooUKc1K4altVdoasH3m0FWp9iYd4kl	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia3JXemFhT3BCTTVGRDJqU01TekY1TDdwOUxEaGpzQ3JNbHF2Mm1OTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282829
1oNZVXMZMZd6QrBC0v7PfCoWHxx6ozrZ9OJTtVBz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiekVzR1J2Z0dwNDJOb01TdUdmRURLMnduNGJDYlBtYTU1UmpYdjh1WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283095
rK4yLQz2PpcBAsqGHsUXP666xqd9rAej9dgNXVgx	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTm5FV25oYUJ0a0VIUjQ1MVhOZlByaXUwNW9tYXk0bHlHTXhGa2pPdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
hbWbiOdWVrUkkKtVaSrwTCajUIqklWlqjMmZYHzU	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia3ZDTHBicm9ENHVpMHlIbmw0Y0ttV1hqeGo3QldXOGlaMUFuSVRrYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283289
ftz4PMuJnO7375ju2TiPgXHGTc1vwN0kQjguzZ0k	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2UybjFtOVVhUWZUaUdON2JLckxCb0U0cDgzUTZGRkdBT3IwNVZ3aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282783
mXmEwI5dq306fKQfke7ZmlSxYWWPophWsBSaYqNB	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiejVlUk9RWmFOWlBXSThaaWVLUmhhZXo2TlhncXJ3ZnMxVVJsOWdUNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282794
S4F4rtgoRKKsw1m9LI9gndxK7jzknOWNtogZWxDH	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHBweDJvb0pQMjZ2S2l2Vk9BYnBWRXYwN0t3RXBkQnhhc0RSVkQxbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282830
sajYxJ0DNyip3SZvco9EUWHPaTSnyf657N4C3ChN	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFk3bDJnQUVreVJUUjRFRWlWdXV6ZmVUbmRCa3h6R0tQZ1RHVU52ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283095
DBif0lLOjGk6tm1gFZ9qDuyyT3RxwGsNpERFCvQF	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkxWbWdXblA1Y3lpbjk2cXAyNUNxdk92MWxWNmlqWk1aNzJObklFZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
vYKdDiZ08fZbb8ErfgcXasYlxT9AjghIjIeHJ1SH	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOE9xdjE2ZGdPV245eG5qaWREbnFLWlFKQVZNcGhMWHBDM25OalhsZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283289
xwcE2sahaREiTApBj2SRWGKZkjBJ2cRKOTIzMuhX	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkRnTU5PWlZId3g1WUgxNkt3Y0hrNlZSY2R0cnRlZ1BrSjlIeWVNTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282784
hO0WdDPHvrqrt9sRCfGOZcrfp5PQl6ZpdAtKnC2P	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoickg0Tzg0QVN5Q0hjcWJzeDhUakxzN0ZROTBFMnpubEg2OEtjUVRZSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282794
Thjnwo9Sn51sliZFJyIHTU4knN3PK4Qpi6bUlwJZ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibENxZ2lqQ21GZng5S1RzdEJia2xScUdNc2FxZ2NzbUtHRmZqQ1c1RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282830
6xQhhxuEmszncXjH6APabgtvcYwDjK5NcepN35uL	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnVDTFdiUURvMko0NWhQNWJ5R0t6RDRrVEduMm9Qa1h2eTlrVllSRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283096
JDYqt864Kcxnge8pTt2SJC7XLbvPgygcDStzgczZ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidVVQQ0xsbE5hakR3NGFlTjQ4UTdnM0xsdjhFdGJ2eTh1Q2tKNzVjWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
vmPb164ftLQXAQDpzNyWt6jZyQmqOC2Yy1aVjLKL	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicWpRMlJTbmpPZTd6SklnWEZhTXdJVU9qN0piZ0xVdjUzeG0zc3R2YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283290
arUAwRQ7kIkVfWade4i9FJ811NZm50HPOFw5q9kk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXJnaXpxeUVOQWU2UktUYU5tdjVpQ1dvbm5YME9udUJiRWNxaVliSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282784
T1Xb70p7qjXax6iBI6GEn9e3ebUYOSzgXLkOuG3b	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiek93ZEh0eFZoUU1OZHJMNmJHSmM1RUI0OTVGallRYm1mdmpHdXlDNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282795
C4EpI5UHcDwdVMi69FMfsYqCa5UxKTGK86kBB417	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFl0NlpTNnNZckVsOWlvSGZvWnJKRTRxZVo1Vkg2MnJkUjV4T3l5SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282830
ztDNd1X2vtZB5K5r9H6rydd5uOuwj01pNTZsrnpq	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGNWVnFkblRHbWhKUGdSR0djZTJnNExWRjJTMGMxZjI5UDBTWEhSaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283096
PksiHxth8AXdl6L4Rl2qz3SZqjOEl4F6hC90nUkU	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2F2b0FLQ0FRSFYwSGxjb3FaSmhkclVSRXpwNURDT25QSERVR29OcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
rgtkx5Bi7B2Ctcy9snbHP6QG4FgnateeFDGZUnWk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSllsWTVDT0pMaW9XeG85Q3FHMGo1TTFPaDQxMktid3l0S29DSjd3aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283290
nqGF9GdWI0J3ueFTPyacjkI9JsZAOEIJ9hoZdkJz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHpaY1FETmNJWEx0YWg1Mjl0Y2lCNTA1SXBsdlhwMzlHTU5xS2YxcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282784
WxUsC3idrfD5VwvfO45uQQ79dfLNiITkm0zOF9Jw	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFNTempSNVBxU1pqNlZSd2FSSmlQd2cwVE5mRkczaVAwU2RiN2xLOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282795
SXCwmF9MQ6sLuSvu34QmJ5eolNJUlV8WVpDeO1tH	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnlzb3BmT0NzRUNHaW1Kb2p5cDJzanYzTWRwUjN3SjBDQmI5Nk0xZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282830
5QhiO6zPc3cCTrDKv0IojkLXLgXpFh0Tqjud9p0D	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDloeFF2UlRsSEJFMFcwV2hCVXFzQjd2Mlc0SEdzRXM3aVh6ZDJhdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283096
A3im5KiGpxHhZKaRWSr2kzP1AmRacdplCN6iwelF	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWp3bVJoWWNNUndOQzVFNFdaZnBHQklxZFJBaHRNV3FTUkhHdUkxQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283102
TTBD7rMu0PlMT1aaAfHi3l0eBNrx1qa1SFeMefr6	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWpaWGNyTTYzVDVIVnRyaldqblZvMzhUc2dkSUNPMDNXVGNTRGtiayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283290
sHeHElwAxasE6WxjjywSwSYzNNDtYisxnhaoeY4j	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTRCblNwTWZLbGZueGVBNVNpMDZ2NTRNRklFSjBnU0VLUHJqZnZDZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282784
We8fUZTRqarnNo9yi3MImmmf2O0W0WFn0RrCMd4Z	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVRNUkVCQWNlVEh5b2w3WkFKWGozZW12TzlPU0d5dzBCM255NWs3VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282795
oMJJl8ALexASwqW9GDnR1aysh2XCWco6lkAIgKd6	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3p4TkxWdUllUkE1ZmhlQUVuazRrZjBUUWtsSHlZYjFyb0VTQklSUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282890
YbdPSD2STkyTvGtnhrEJyhwN7LHHzghOMg2iW01T	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicEY1WDJOZDZ1cVdVQlZCdTVHMXZ1SnlaaVlZZnVVN1BJd1hRTEQxUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283096
8umXPu66B4isRWcUHt9cj8wGyMsGat7jcWyb8Jk9	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoienF1S2doMU9jYldyb0hHVEttWmpaNkZ4Qjk5MmhxZ1RYNDRDUDlGWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283290
QY6dWATO8gHVpBk4iyEDuQtqlYD9sJQFd4KQf1qW	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV29lZUdzendhbGU2dDkxMTlMcXg2OXg1SVpOeWhuOW41TVM5SmNmYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282784
GvC8QMsVigqUbn5u33b4rKK4mjaei0Ef194DXTUu	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia20zejVQRVp2UVdDczJYVUpDRmdtZ0k3dnVKakgxWTN5Y1haMGhQaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282795
m0IUkOswkJAlifXAOTrH2I21W0XA0PhwMF5hIERi	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia0k1NHMxbGp1MGExcUVybGVuNlBOWmJlbkRRRE9lYUd6bXdZSGROTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
qQkTeoBzDudHjkbG4IvTwDrTiy8wzacCLnTkXsa7	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFFoVjVMZzlDOXJxSzhBSzkySlNrMlgzQTRwU0xFaDQzN01PQWZvMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283096
RjAmZ1lShNzzoQBSTTzWQ9lBdLn1CUjX436aVu0N	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlRjSXlZeGZmMDBqM3AxcW1oV0ZCQ1BNM3Fwb0t4SHd0aWdKWDYwUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283290
KLgO1WcNoIClJQycHUsVsse0brRVYPOVItxwUeRm	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTZFS3RCdXBQMWJOOVpUdVRpc3ZUb2pqMUthUmpYSHBvSlFSTFplbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282784
dyqGjrYMEwdBepHHG7QLj34zcczri1bZAAN5jezv	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia1c5RzVoWDRsWnJOenFMR2NrQ2pET0lUakJOaExBNExSdVBvS1AyeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282795
OMyfCOrCiyh0KELULKiiKULjfoPnc5LasNqKVtV0	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXozaUQ0TFZ1djUyVlRoQ1pqNmdzREdCQVlWbGVLUzRWdUxhbDh4NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
6TrlMI42a6x2rq5DsYL9VkAlUl4GdG2kKGTQN9YB	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaW9zYkZTOGZub0dUb0JNZ0RqZmtRYlFOd0lZVFIyNHNtZGdhbnFIZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283096
JWnGAbEJpeJqxEIYQj2zrB4EZ78QBt8EAkbcziZe	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoieDVVZEhVUXZVcXJPZm5iMDZXR0tVVXUzVUljSENhRGhsSUNCZXB6SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283291
fwiGxiZClefatdzozvXL1A5kphAY4NZWzpM3wrh7	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidk1oTldRZnQycFpkSVA1a0tyMVh0TDJXOHJKS2FTNHNZNlA2WEpMdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282784
WThDKV751kEBlSSnHLJGoDBCVpy8qQuREEe4fMP6	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWFYMG5sWVNERXlkbWNHQXZsM1hXZWVEdmRKU29wRHNNcTZSSUZleiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282795
MhCvMlsHhPGKIuTsPiv0wEsbKqX7aCIDyvpiFge5	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjY1eFFZcWt3WlpLN2ZwaXJkb1ZVNFZ0anhHOUQ3SHhsMUxIMER2RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
aGWow50R8tBZoK7GeqequZUmWgwcMhUgpyD8RVog	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2p4UnZ6QlZ4YjN6VThPdFQyRjRBN3BJbXV3bUdnZGI5Q0liMklsbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283097
9waAXvWLJD3YXi2vwAKpEb6aeVNxdrGGBoh681EZ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibm9YT05BeWtGVFJQVlgwNzBMc2lEQkdVZDFzQ1RlNmtyYmVoWDBwYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283292
dJA6qZrtqn3riRBlker0L7kOuLSX0hOJx8FyvQg9	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicElFNnlJVW5LWFVPV0N4a2pXMXhIZHJyRUgyNTVkOE1BSnNvV25nQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282785
qLkAagv20j5budhoAEA12v384SaiYbJk5cA6MwRR	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2RncFlCNzFMUjBXT2lTODhqOFZLaE9kV1g5VExEc3hyZmRHZFBRayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282795
fNfCqpr40EqWDcETjUMnizQoGH1UBtHK6ItQFFnC	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiejQ4M2QydmV4U0x1WFFKSHA1VVc3RTRITGd3aFlSOWZoV1BEZ2ZuSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
pZgA8XMljwf8QeECYycou6lDxG5mbW7hAP4TeHCi	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGxjbkM3WUppNXFydUVyc2dzY3hpY3I5ZWp4Rzk1ck5Jb2FqMWU1dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283097
YD4tXa9TK6Z1IQfQJYIOm4R2zwGiTLLkZiJIPi1s	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTgyMzJ6WjV4QnB4MURwR1V2dVZCSDNEVjc1N2hFZ2N4eVg1QnFEciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283292
pC61BCYeX66zrMdkv7NgAVG6aaCwUlSu4b7KqiBt	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidElmZzZEN3hON1oxQW1CTDNuY0R4M0E0dVc2bFRjcmJCbU52TmFJciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282786
SEsZlufHqNu1aP5lYr188DrrggQEMyn1aAr7jDXd	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm9aYTFwMk00WFlpZzRBRjFVUndIS3RIdHh6a1ZGN1oxSk5ZY0ZHZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282796
qDyrCj5c7dzdjGYYTBlBk8dwBcQveEdnacj5grRL	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVlKQnd3SE14SWo2RmZKSDJ2cVNSQzNiSmVEbnd3dlN2T0ZIZkxwViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
cWWjoA1s0sSgNAOoDEhos4ejWTiLDwOSbIDtzV0F	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiam01V3BOblQzS2pnaFNGTzhtU1pEb0s0Q2daVU12dXVRbGRNMm5NRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283097
pbNuuSwm0rzGzNSwl7SIf8uxq3n6q9TKnaPKAIyE	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU5GR2FoNFp2Mzl2THVGVTlvV2syZkdiSGFZYmRjR1hlRGlOT2E0TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283292
tkG9QqcWdhUFcgQjXEGj5TfvRPup2yUGh8qqnGZR	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2JCSmpIdkh6UUh4cHBzd3NuUG03d0g4NWVCZ1ZxU0MxTDBqa3FoQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282786
FMhcWn6tSiWq0XVQ5URoFrphPRtNtvaVID54MfVz	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoidjFNYTNoTkt4UXlIZk8zWklhcjd0NmRVcFVqVUVnMVN2Q0dOTkpxQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282796
gysQ3iZ8WdDBuoxydzxxicPAKvNzBqOyWcO5ah05	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFJ3WGpOTjM4YVQ2ZnFpRERaeWgxOW1jSzRPYXlOU0ZUeERsZEl4aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
LPQabPiIJQVtqpdDkTH0chw0TtfpMgi34DVnjsOk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoid2Y3cUI3YnNMZWlmQUgyMWZlRjNzNVZya1BGbzNXZ2ZGSlZhQUdadiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283097
ml3l7EasNxpBGQlum0RecXmpE9qdLXyh7nD8IOL0	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkp5alZsVGNoc0FhYXFNampaQTdKZUp2MVNWV3RMbEI5b0RBVmZnUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283292
atCcOFcYWF5mJz5QOzhRXUDL29QLyRwq3tgpStp6	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHFpcjZJUk04TVl1d0hjaTJSd0hGM3VpMFZvcXNDQXdCd3VJQ3FsZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282786
XBoMzGFCISj6WOnj2XzFRAj3VBIfzARcUufEUrY0	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVpURG5Jcm93SGJGZ01xbEQxdlpEbUxxaURldGxIYndDTTZoRFlSNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282796
Hi1r3fB2Ozyw6SDwSOuST8hs7UqZrCAXkWo0opqX	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFFMV0paRVU1NUdyZjV2OFJMMlpIZW9Pb2xHeGMxZXNmbTlxazg5OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
QF1PoBPr7vAvf2jD23lnD2AU22yDeSHqTVwZfOTk	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicnF1dmtiZXJMSE11aVZSb1V1cmRORnV4eUFDUXRVSzBMU1QyMTNiVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283097
JpMNKBx1rvGlJh0JXDM59DfMmEW3L6Qh0RvZ85UJ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXlRcXg0VTNIMVJ4N1d2ZEx1YVhJcmlKTGw4NzVZN3IxaU5uejN4QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283293
dbwnYnpHf8Z6PXRx3b2zBcIDhe3AGgglYlb3KRyi	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoicnUxQXhyS2FJeHE2UkZucUFMRjFYNjU0NWJJMUxXR0FhZVhnM0RZeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282786
2TaGL1NvhfX7GY8ZSLW6NlcKbHKFomIA8OJ1dKgc	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUm1jVW1zZzROaTVGQzVnZmduRElmVzJ3SEtKY254UVF3cDJjOU9BYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282796
T7pq7t2LFlOcqtxV9vFt5WD70OI10IQkm4jX3ZZb	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWYwWk5jdGJ3VG1ZWVAzSlhUcTA0WXBMaXdUM0FuSzMwN09iNmx2USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282891
tY7cnEu180hxZt7x36H4qFQRibsFyPYgtzFjOGvd	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWFFQk5naFN0dFRvbmlTTXNxb2tqZ0dFRlZRRDVEbDBQYnhRSU9SNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283098
l8v6IpMJw299JqT74QOapsVjmzDJJJ1BjfTc5Jyw	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGY2QnBiZGo2WVpYclpzOERYcVJxMGVxUEp2ZHoyb2lScTBvWktWRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283293
idSWHv6M9rUxEXDWRVuAhsKwLUO7qEvag0hswVdd	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoibzFFOUYyOHJJWEN4NVZZdlFCUHVpZ1JCYTUzbkZwRE55YTlzZlZWRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282786
Jl6pAw3wxJzcEmWNDIUqNvTFlHvRLKUpwQx2uocY	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmVlSkJ5WERRNDM4STFNSkVsUWV4Z0lmamFLOGl1ZWhabTVtREJoTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282796
Qr180aBFtJISlBljOd6JpNptuocL1vhx02LFcQMZ	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2xKQ2t4aXdONktaSVA5b21XRXZSbTc5dmpGeUpEcEVUVzBTMGxkMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672282892
ecRpfMHAuJfJ19Leh9wX6zpVoZqCmCU7Ganhe2kx	\N	112.135.130.80	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHlFSXB0M1RDanlnWlFsZnhWRkxJMll4aTRQU055WThxNmxVcG1XcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjMuMjMxLjExNC4xNjA6OTMvZWNvbWIvSG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1672283098
\.


--
-- TOC entry 3546 (class 0 OID 24996)
-- Dependencies: 254
-- Data for Name: shopping_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shopping_cart (cart_id, itemid, variationid, userid, cdate, qty, productcolorid) FROM stdin;
5	4	5	8	2021-07-15 22:26:04	1	6
6	4	5	8	2021-07-15 22:28:20	1	6
7	4	3	8	2021-07-15 22:42:25	1	6
8	4	5	8	2021-07-15 22:42:50	2	6
9	4	5	9	2021-07-16 10:10:30	1	6
10	4	5	5	2021-08-19 17:08:14	1	6
11	4	5	5	2021-08-19 17:09:56	1	6
20	42	0	17	2022-03-25 13:23:00	1	69
\.


--
-- TOC entry 3548 (class 0 OID 25000)
-- Dependencies: 256
-- Data for Name: sidebanners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sidebanners (id, imageurl, textheading1, textheading2, textdirection, status, type) FROM stdin;
4	1646213303-IMG_20220225_110857.jpg			null	Active	null
5	1646215310-1.jpg			left	Active	sidetop
\.


--
-- TOC entry 3550 (class 0 OID 25006)
-- Dependencies: 258
-- Data for Name: subscribelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscribelist (id, email, status) FROM stdin;
1	yatib60444@zneep.com	Active
\.


--
-- TOC entry 3552 (class 0 OID 25010)
-- Dependencies: 260
-- Data for Name: sysuser_login_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sysuser_login_history (id, userid, datetime, ip, status, username) FROM stdin;
1	1	2021-06-07 10:56:12	124.43.177.156	Login failed. Password not matching!	admin
2	1	2021-06-07 10:56:19	124.43.177.156	Login Success	admin
3	1	2021-06-07 11:09:42	124.43.177.156	Login Success	admin
4	1	2021-06-07 11:45:41	124.43.177.156	Login Success	admin
5	1	2021-07-07 13:22:03	2407:c00:4005:9a23:d8ae:6651:6263:89ac	Login failed. Password not matching!	admin
6	1	2021-07-07 13:22:11	2407:c00:4005:9a23:d8ae:6651:6263:89ac	Login Success	admin
7	1	2021-07-07 13:36:46	2407:c00:4005:9a23:d8ae:6651:6263:89ac	Login Success	admin
8	1	2021-07-07 13:37:15	123.231.104.101	Login Success	admin
9	1	2021-07-07 13:42:41	103.11.33.243	Login Success	admin
10	1	2021-07-07 13:46:09	103.11.33.243	Login Success	admin
11	1	2021-07-11 14:37:42	112.134.220.47	Login Success	admin
12	1	2021-07-11 16:21:36	112.134.219.241	Login Success	admin
13	1	2021-07-11 17:13:48	112.134.219.241	Login Success	admin
14	1	2021-07-12 09:40:48	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
15	1	2021-07-12 10:07:44	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
16	1	2021-07-12 10:13:06	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
17	1	2021-07-12 10:48:21	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
18	1	2021-07-12 10:49:02	103.11.33.243	Login Success	admin
19	1	2021-07-12 11:10:26	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
20	1	2021-07-12 11:14:03	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
21	1	2021-07-12 11:16:23	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
22	1	2021-07-12 11:28:06	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
23	1	2021-07-12 11:54:34	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
24	1	2021-07-12 11:56:40	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	admin
25	1	2021-07-12 12:17:14	2407:c00:d006:6e29:853c:dfdd:a797:c817	Login Success	admin
26	1	2021-07-15 10:14:24	2407:c00:d005:ff5d:444:448:87c8:cdc0	Login Success	admin
27	1	2021-07-15 10:15:17	2407:c00:d005:ff5d:444:448:87c8:cdc0	Login Success	admin
28	1	2021-07-15 10:16:10	123.231.127.220	Login Success	admin
29	1	2021-07-15 10:16:13	2407:c00:d005:ff5d:444:448:87c8:cdc0	Login Success	admin
30	1	2021-07-15 10:49:27	112.134.0.4	Login failed. Password not matching!	admin
31	1	2021-07-15 10:49:33	112.134.0.4	Login Success	admin
32	1	2021-07-15 16:52:25	112.134.7.31	Login Success	admin
33	1	2021-07-15 17:16:01	123.231.127.220	Login Success	admin
34	1	2021-07-15 17:35:09	112.134.7.31	Login Success	admin
35	1	2021-07-15 18:25:04	123.231.127.220	Login Success	admin
36	1	2021-07-15 18:25:05	123.231.127.220	Login Success	admin
37	1	2021-07-15 18:25:25	112.134.7.31	Login Success	admin
38	1	2021-07-15 18:25:26	112.134.7.31	Login Success	admin
39	1	2021-07-16 10:47:27	123.231.127.220	Login Success	admin
40	1	2021-07-16 10:47:28	123.231.127.220	Login Success	admin
41	1	2021-07-19 08:25:02	103.11.33.243	Login Success	admin
42	1	2021-07-21 17:47:48	112.134.223.66	Login Success	admin
43	1	2021-07-21 18:08:54	112.134.221.46	Login Success	admin
44	1	2021-07-21 18:08:57	112.134.221.46	Login Success	admin
45	1	2021-07-23 19:24:09	112.134.217.16	Login Success	admin
46	1	2021-07-23 19:50:46	112.134.217.16	Login Success	admin
47	1	2021-07-26 08:52:48	103.11.33.243	Login Success	admin
48	1	2021-07-26 09:36:11	103.11.33.243	Login Success	admin
49	1	2021-07-26 09:53:44	103.11.33.243	Login Success	admin
50	1	2021-07-26 10:59:50	103.11.33.243	Login Success	admin
51	1	2021-07-26 10:59:52	103.11.33.243	Login Success	admin
52	1	2021-08-02 08:59:16	103.11.33.243	Login Success	admin
53	1	2021-08-02 09:04:53	103.11.33.243	Login Success	admin
54	1	2021-08-06 10:46:32	103.11.33.243	Login Success	admin
55	1	2021-08-06 10:57:09	103.11.33.243	Login Success	admin
56	1	2021-08-06 11:01:14	103.11.33.243	Login Success	admin
57	1	2021-08-06 12:21:57	103.11.33.243	Login Success	admin
58	1	2021-08-16 09:49:10	103.11.33.243	Login Success	admin
59	1	2021-08-16 10:27:06	212.104.237.24	Login Success	admin
60	1	2021-08-16 11:00:46	103.11.33.243	Login Success	admin
61	1	2021-08-16 11:20:13	103.11.33.243	Login Success	admin
62	1	2021-08-19 16:09:36	2402:4000:2380:e7a7:248d:cf55:ef06:47b9	Login Success	admin
63	1	2021-08-19 16:31:52	123.231.127.220	Login Success	admin
64	1	2022-03-02 09:40:56	124.43.177.156	Login Success	admin
65	1	2022-03-02 12:01:17	123.231.106.28	Login Success	admin
66	1	2022-03-02 14:19:52	103.11.33.243	Login Success	admin
67	1	2022-03-02 15:50:53	\N	Login Success	admin
68	1	2022-03-02 16:41:37	123.231.106.28	Login Success	admin
69	1	2022-03-02 16:42:57	2402:4000:2380:3863:8cc:8964:c934:e984	Login Success	admin
70	1	2022-03-03 13:44:28	2402:4000:2382:f1f:3c80:906:bcdf:e7cb	Login Success	admin
71	1	2022-03-03 14:47:44	2402:4000:2382:f1f:3c80:906:bcdf:e7cb	Login Success	admin
72	1	2022-03-03 15:47:22	2402:4000:2382:f1f:3c80:906:bcdf:e7cb	Login Success	admin
73	1	2022-03-03 17:18:13	2402:4000:2382:f1f:3c80:906:bcdf:e7cb	Login Success	admin
74	1	2022-03-04 09:03:30	103.11.33.243	Login Success	admin
75	1	2022-03-04 09:38:36	103.11.33.243	Login Success	admin
76	1	2022-03-04 10:06:19	103.11.33.243	Login Success	admin
77	1	2022-03-04 10:36:48	103.11.33.243	Login Success	admin
78	1	2022-03-04 13:03:19	103.11.33.243	Login Success	admin
79	1	2022-03-04 13:03:39	123.231.106.28	Login Success	admin
80	1	2022-03-04 13:12:49	103.11.33.243	Login Success	admin
81	1	2022-03-04 13:17:44	103.11.33.243	Login Success	admin
82	1	2022-03-04 13:53:25	103.11.33.243	Login Success	admin
83	1	2022-03-04 15:00:48	103.11.33.243	Login failed. Password not matching!	admin
84	1	2022-03-04 15:00:57	103.11.33.243	Login Success	admin
85	1	2022-03-04 15:47:45	103.11.33.243	Login Success	admin
86	1	2022-03-04 20:37:50	2407:c00:4006:2761:c5c2:9320:9b92:a1d1	Login Success	admin
87	1	2022-03-05 14:43:44	2407:c00:6003:97c8:4dce:5dc1:625b:4653	Login Success	admin
88	1	2022-03-05 17:18:06	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login failed. Password not matching!	admin
89	1	2022-03-05 17:18:14	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login failed. Password not matching!	admin
90	1	2022-03-05 17:18:22	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login failed. Password not matching!	admin
91	1	2022-03-05 17:32:11	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login failed. Password not matching!	admin
92	1	2022-03-05 17:32:20	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login failed. Password not matching!	admin
93	1	2022-03-05 17:37:33	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login Success	admin
94	1	2022-03-05 18:01:47	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login Success	admin
95	1	2022-03-05 18:16:04	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login Success	admin
96	1	2022-03-05 21:49:33	2407:c00:6003:97c8:4dce:5dc1:625b:4653	Login Success	admin
97	1	2022-03-06 00:37:15	112.134.223.75	Login Success	admin
98	1	2022-03-07 10:30:39	103.11.33.243	Login Success	admin
99	1	2022-03-07 12:57:30	103.11.33.243	Login Success	admin
100	1	2022-03-07 15:08:18	103.11.33.243	Login Success	admin
101	1	2022-03-07 16:11:18	112.134.145.94	Login Success	admin
102	1	2022-03-09 08:31:55	103.11.33.243	Login Success	admin
103	1	2022-03-23 12:56:41	103.11.33.243	Login Success	admin
104	1	2022-03-24 11:16:15	103.11.33.243	Login Success	admin
105	1	2022-03-25 09:57:12	112.134.151.138	Login Success	admin
106	1	2022-03-25 10:26:24	112.134.151.138	Login Success	admin
107	1	2022-03-25 10:41:54	112.134.151.138	Login Success	admin
108	1	2022-03-25 13:21:55	112.134.151.138	Login Success	admin
109	1	2022-03-29 11:59:59	103.11.33.243	Login Success	admin
110	1	2022-03-31 13:13:14	103.11.33.243	Login Success	admin
111	1	2022-04-07 11:46:20	103.11.33.243	Login Success	admin
112	1	2022-04-18 12:25:23	103.11.33.243	Login Success	admin
113	1	2022-05-04 14:42:16	103.11.33.243	Login Success	admin
114	1	2022-05-05 10:13:09	112.134.144.182	Login Success	admin
115	1	2022-05-18 09:40:40	103.11.33.243	Login Success	admin
116	1	2022-05-18 09:40:40	103.11.33.243	Login Success	admin
117	1	2022-05-19 11:26:00	103.11.33.243	Login failed. Password not matching!	admin
118	1	2022-05-19 11:26:14	103.11.33.243	Login Success	admin
119	1	2022-05-19 13:08:56	103.11.33.243	Login Success	admin
120	1	2022-05-23 09:04:49	103.11.33.243	Login Success	admin
121	1	2022-05-23 09:04:52	103.11.33.243	Login Success	admin
122	1	2022-05-23 09:05:03	103.11.33.243	Login Success	admin
123	1	2022-05-23 09:16:55	103.11.33.243	Login failed. Password not matching!	admin
124	1	2022-05-23 09:17:01	103.11.33.243	Login failed. Password not matching!	admin
125	1	2022-05-23 09:17:02	103.11.33.243	Login failed. Password not matching!	admin
126	1	2022-05-30 10:54:56	103.11.33.243	Login Success	admin
127	1	2022-12-13 11:12:14	192.168.1.1	Login Success	admin
128	1	2022-12-13 12:04:26	192.168.1.1	Login Success	admin
129	1	2022-12-14 14:00:51	192.168.1.1	Login Success	admin
130	1	2022-12-14 14:00:54	192.168.1.1	Login Success	admin
131	1	2022-12-20 08:49:56	192.168.1.1	Login Success	admin
132	1	2022-12-20 08:49:58	192.168.1.1	Login Success	admin
133	1	2022-12-28 17:14:25	192.168.1.1	Login Success	admin
134	1	2022-12-28 23:02:32	192.168.1.1	Login Success	admin
135	1	2022-12-28 23:03:05	192.168.1.1	Login Success	admin
136	1	2022-12-28 23:04:10	192.168.1.1	Login Success	admin
137	1	2022-12-29 08:29:42	192.168.1.1	Login Success	admin
138	1	2022-12-29 08:30:45	192.168.1.1	Login Success	admin
139	1	2022-12-29 08:34:49	192.168.1.1	Login Success	admin
140	1	2022-12-29 08:34:50	192.168.1.1	Login Success	admin
141	1	2022-12-29 08:38:07	192.168.1.1	Login Success	admin
142	1	2022-12-29 08:39:28	192.168.1.1	Login failed. Password not matching!	admin
143	1	2022-12-29 08:39:37	192.168.1.1	Login Success	admin
144	1	2022-12-29 08:40:58	192.168.1.1	Login Success	admin
145	1	2022-12-29 08:45:15	192.168.1.1	Login Success	admin
146	1	2022-12-29 08:47:28	192.168.1.1	Login Success	admin
147	1	2022-12-29 08:50:58	192.168.1.1	Login Success	admin
148	1	2022-12-29 09:01:49	192.168.1.1	Login Success	admin
149	1	2022-12-29 09:55:35	192.168.1.1	Login Success	admin
\.


--
-- TOC entry 3554 (class 0 OID 25014)
-- Dependencies: 262
-- Data for Name: user_login_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_login_audit (id, user_id, ipaddress, logindatetime, cby, cdate) FROM stdin;
\.


--
-- TOC entry 3556 (class 0 OID 25018)
-- Dependencies: 264
-- Data for Name: vendor_login_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_login_history (id, vendorid, datetime, ip, status, username) FROM stdin;
1	2	2021-07-11 16:51:51	112.134.219.241	Login Success	Abc
2	2	2021-07-11 17:32:12	112.134.219.241	Login Success	Abc
3	1	2021-07-12 10:01:33	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	testvendor
4	3	2021-07-12 11:16:55	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	kasun
5	3	2021-07-12 11:53:13	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	kasun
6	3	2021-07-12 11:55:43	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	kasun
7	3	2021-07-12 11:58:00	2407:c00:d006:6e29:756e:1ab0:7318:e0fe	Login Success	kasun
8	4	2021-07-19 09:18:51	103.11.33.243	Login Success	TestA
9	2	2021-07-21 17:50:24	112.134.223.66	Login Success	Abc
10	2	2021-07-21 18:12:19	112.134.221.46	Login Success	Abc
11	2	2021-07-23 19:39:08	112.134.217.16	Login Success	Abc
12	5	2021-07-26 08:59:09	103.11.33.243	Login Success	Def
13	5	2021-07-26 09:37:32	103.11.33.243	Login Success	Def
14	2	2021-07-26 09:54:45	103.11.33.243	Login Success	Abc
15	1	2021-08-02 09:02:19	103.11.33.243	Login Success	testvendor
16	1	2021-08-02 09:07:22	103.11.33.243	Login Success	testvendor
17	6	2021-08-06 10:58:06	103.11.33.243	Login Success	Ghi
18	6	2021-08-06 11:07:34	103.11.33.243	Login Success	Ghi
19	6	2021-08-06 12:13:53	103.11.33.243	Login Success	Ghi
20	1	2021-08-16 10:20:27	212.104.237.24	Login Success	testvendor
21	2	2021-08-16 10:26:29	103.11.33.243	Login Success	Abc
22	5	2021-08-16 10:28:33	103.11.33.243	Login Success	Def
23	6	2021-08-16 10:30:52	103.11.33.243	Login Success	Ghi
24	2	2021-08-16 10:38:58	103.11.33.243	Login failed. Password not matching!	Abc
25	2	2021-08-16 10:39:15	103.11.33.243	Login Success	Abc
26	5	2021-08-16 11:05:02	103.11.33.243	Login Success	Def
27	7	2022-03-03 16:01:28	2402:4000:2382:f1f:3c80:906:bcdf:e7cb	Login Success	thanushka
28	7	2022-03-03 17:01:43	2402:4000:2382:f1f:3c80:906:bcdf:e7cb	Login Success	thanushka
29	8	2022-03-04 09:40:28	103.11.33.243	Login Success	anura
30	9	2022-03-04 10:07:22	103.11.33.243	Login Success	kamal
31	9	2022-03-04 10:48:13	103.11.33.243	Login Success	kamal
32	9	2022-03-04 13:04:12	103.11.33.243	Login Success	kamal
33	9	2022-03-04 13:08:47	123.231.106.28	Login Success	kamal
34	9	2022-03-04 13:15:36	123.231.106.28	Login Success	kamal
35	9	2022-03-04 13:15:37	123.231.106.28	Login Success	kamal
36	9	2022-03-04 15:21:03	103.11.33.243	Login Success	kamal
37	3	2022-03-04 15:23:04	103.11.33.243	Login Success	kasun
38	10	2022-03-04 21:29:15	2407:c00:4006:2761:c5c2:9320:9b92:a1d1	Login Success	nalanibalasingha
39	10	2022-03-04 21:29:22	2407:c00:4006:2761:c5c2:9320:9b92:a1d1	Login Success	nalanibalasingha
40	11	2022-03-05 16:09:41	2407:c00:6003:97c8:4dce:5dc1:625b:4653	Login Success	nadeekasubha
41	13	2022-03-05 18:03:50	2402:4000:2180:17b3:6c76:b8b8:ea60:c8ad	Login Success	samanthi
42	14	2022-03-05 18:08:45	2407:c00:6003:97c8:4dce:5dc1:625b:4653	Login Success	ruviniperera
43	15	2022-03-05 19:06:55	2407:c00:6003:97c8:4dce:5dc1:625b:4653	Login Success	yvonnemmotha
44	16	2022-03-05 22:02:07	2407:c00:6003:97c8:4dce:5dc1:625b:4653	Login Success	wasanthikumari
45	17	2022-03-05 22:20:06	2407:c00:6003:97c8:4dce:5dc1:625b:4653	Login Success	craftserene
46	18	2022-03-05 23:03:27	112.134.223.75	Login Success	yamunadilhani
47	19	2022-03-05 23:22:32	112.134.223.75	Login Success	dilrukshi
48	20	2022-03-05 23:41:29	112.134.223.75	Login Success	sakura
49	21	2022-03-06 00:06:13	112.134.223.75	Login Success	rusini
50	14	2022-03-06 00:35:15	112.134.223.75	Login Success	ruviniperera
51	10	2022-03-07 10:44:23	103.11.33.243	Login Success	nalanibalasingha
52	20	2022-03-07 14:38:09	103.11.33.243	Login Success	sakura
53	20	2022-03-07 15:14:45	103.11.33.243	Login Success	sakura
54	15	2022-03-07 15:17:01	103.11.33.243	Login Success	yvonnemmotha
55	20	2022-03-07 15:31:00	103.11.33.243	Login Success	sakura
56	\N	2022-03-23 13:47:49	103.11.33.243	Login failed. User doesn't exists!	mekala
57	\N	2022-03-23 14:06:42	103.11.33.243	Login failed. User doesn't exists!	mekala
58	22	2022-03-23 14:08:21	103.11.33.243	Login Success	cdwa
59	22	2022-03-23 14:44:13	103.11.33.243	Login Success	cdwa
60	22	2022-03-24 09:35:58	103.11.33.243	Login Success	cdwa
61	20	2022-03-24 13:45:48	103.11.33.243	Login Success	sakura
62	\N	2022-03-25 09:57:40	112.134.151.138	Login failed. User doesn't exists!	lasantha
63	23	2022-03-25 10:28:06	112.134.151.138	Login Success	thanushk
64	23	2022-03-25 10:54:09	112.134.151.138	Login Success	thanushk
65	23	2022-03-25 12:41:51	112.134.151.138	Login Success	thanushk
66	23	2022-03-25 13:15:20	112.134.151.138	Login Success	thanushk
67	20	2022-03-26 15:53:35	175.157.46.14	Login Success	sakura
68	\N	2022-03-27 12:11:27	2402:4000:2281:665b:c18:c02a:5284:4ba7	Login failed. User doesn't exists!	yvonnemmotha@gmail.com
69	15	2022-03-27 12:14:05	2402:4000:2281:665b:c18:c02a:5284:4ba7	Login failed. Password not matching!	yvonnemmotha
70	\N	2022-03-27 12:14:34	2402:4000:2281:665b:c18:c02a:5284:4ba7	Login failed. User doesn't exists!	yvonnemotha
71	15	2022-03-28 14:14:11	103.11.33.243	Login Success	yvonnemmotha
72	15	2022-03-28 14:18:21	2402:4000:b196:145b:8979:5d56:d76:5b57	Login Success	yvonnemmotha
73	\N	2022-03-28 16:46:52	212.104.236.44	Login failed. User doesn't exists!	ArvinSoftmate
74	\N	2022-03-28 16:47:16	212.104.236.44	Login failed. User doesn't exists!	ArvinSoftmate
75	\N	2022-03-28 16:48:10	212.104.236.44	Login failed. User doesn't exists!	ArvinSoftmate
76	15	2022-03-28 21:50:55	2402:4000:12ce:7c3c:b402:be41:38ff:ba42	Login Success	yvonnemmotha
77	15	2022-03-28 21:50:56	2402:4000:12ce:7c3c:b402:be41:38ff:ba42	Login Success	yvonnemmotha
78	15	2022-03-28 21:53:58	2402:4000:12ce:7c3c:b40e:8300:de7e:f594	Login Success	yvonnemmotha
79	\N	2022-03-29 11:30:18	212.104.236.44	Login failed. User doesn't exists!	ArvinSoftmate
80	15	2022-03-31 16:27:22	175.157.122.174	Login Success	yvonnemmotha
81	15	2022-04-01 15:27:37	175.157.108.81	Login failed. Password not matching!	yvonnemmotha
82	15	2022-04-01 15:28:12	175.157.108.81	Login Success	yvonnemmotha
83	15	2022-04-02 22:16:54	2402:4000:b1a7:59d9:b0d0:4f20:6892:65ff	Login failed. Password not matching!	yvonnemmotha
84	15	2022-04-02 22:17:08	2402:4000:b1a7:59d9:b0d0:4f20:6892:65ff	Login failed. Password not matching!	yvonnemmotha
85	\N	2022-04-02 22:17:32	2402:4000:b1a7:59d9:b0d0:4f20:6892:65ff	Login failed. User doesn't exists!	Yvonnemmotha
86	15	2022-04-02 22:18:27	2402:4000:b1a7:59d9:b0d0:4f20:6892:65ff	Login Success	yvonnemmotha
87	15	2022-04-02 23:20:47	2402:4000:b1a7:59d9:2dbb:386a:bb5e:bab9	Login Success	yvonnemmotha
88	15	2022-04-02 23:37:06	2402:4000:b1a7:59d9:2dbb:386a:bb5e:bab9	Login Success	yvonnemmotha
89	15	2022-04-02 23:41:26	2402:4000:b1a7:59d9:2dbb:386a:bb5e:bab9	Login Success	yvonnemmotha
90	15	2022-04-03 12:39:08	2402:4000:2382:9001:d1a7:675a:edaf:5fe8	Login Success	yvonnemmotha
91	15	2022-04-03 23:11:09	2402:4000:1242:ded5:2d0c:7f9:3932:f7d3	Login Success	yvonnemmotha
92	15	2022-04-03 23:11:09	2402:4000:1242:ded5:2d0c:7f9:3932:f7d3	Login Success	yvonnemmotha
93	15	2022-04-05 06:46:36	2402:4000:1242:ded5:4077:f092:9e88:ba27	Login Success	yvonnemmotha
94	15	2022-04-05 06:46:36	2402:4000:1242:ded5:4077:f092:9e88:ba27	Login Success	yvonnemmotha
95	20	2022-04-07 15:45:18	175.157.40.95	Login Success	sakura
96	15	2022-04-07 20:53:16	2402:4000:b1a2:1903:806:d76:afb8:c0db	Login Success	yvonnemmotha
97	15	2022-04-07 20:53:18	2402:4000:b1a2:1903:806:d76:afb8:c0db	Login Success	yvonnemmotha
98	15	2022-04-07 21:16:44	2402:4000:b1a2:1903:806:d76:afb8:c0db	Login Success	yvonnemmotha
99	15	2022-04-07 21:16:44	2402:4000:b1a2:1903:806:d76:afb8:c0db	Login Success	yvonnemmotha
100	15	2022-04-07 22:23:06	2402:4000:b1a2:1903:806:d76:afb8:c0db	Login Success	yvonnemmotha
101	20	2022-04-11 09:32:27	2402:4000:12c9:ec91:8061:aded:dee6:94e8	Login Success	sakura
102	20	2022-04-11 09:45:41	2402:4000:12c9:ec91:8061:aded:dee6:94e8	Login Success	sakura
103	20	2022-04-11 09:45:44	2402:4000:12c9:ec91:8061:aded:dee6:94e8	Login Success	sakura
104	15	2022-04-12 06:41:23	2402:4000:b18d:e28a:b079:c0e3:3476:bee4	Login Success	yvonnemmotha
105	20	2022-04-16 05:38:06	2402:4000:b18d:78d6:4980:4800:2d59:8daa	Login Success	sakura
106	15	2022-04-18 12:22:30	2402:4000:b194:7212:64bc:5186:e8b8:4f87	Login Success	yvonnemmotha
107	15	2022-04-18 12:22:30	2402:4000:b194:7212:64bc:5186:e8b8:4f87	Login Success	yvonnemmotha
108	15	2022-04-18 12:22:31	2402:4000:b194:7212:64bc:5186:e8b8:4f87	Login Success	yvonnemmotha
109	15	2022-04-18 14:26:31	2402:4000:b194:7212:64bc:5186:e8b8:4f87	Login Success	yvonnemmotha
110	20	2022-04-22 13:59:54	175.157.42.211	Login Success	sakura
111	20	2022-04-22 14:02:08	175.157.42.211	Login Success	sakura
112	20	2022-04-25 16:05:12	116.206.247.158	Login Success	sakura
113	20	2022-04-26 12:40:11	175.157.41.224	Login Success	sakura
114	20	2022-04-26 12:40:12	175.157.41.224	Login Success	sakura
115	20	2022-04-27 09:44:13	116.206.245.202	Login failed. Password not matching!	sakura
116	20	2022-04-27 11:01:55	116.206.245.202	Login failed. Password not matching!	sakura
117	20	2022-04-27 11:01:55	116.206.245.202	Login failed. Password not matching!	sakura
118	20	2022-04-27 11:02:08	116.206.245.202	Login failed. Password not matching!	sakura
119	20	2022-04-27 14:13:44	116.206.245.202	Login Success	sakura
120	20	2022-04-29 11:33:23	175.157.44.82	Login Success	sakura
121	20	2022-04-29 11:37:25	175.157.44.82	Login Success	sakura
122	20	2022-04-29 12:01:00	175.157.44.82	Login Success	sakura
123	20	2022-04-29 13:52:57	175.157.44.82	Login Success	sakura
124	20	2022-04-30 12:10:17	175.157.47.72	Login Success	sakura
125	20	2022-05-07 13:30:29	2402:4000:124b:56f4:b05f:9668:4eef:60ce	Login Success	sakura
126	20	2022-05-07 13:30:30	2402:4000:124b:56f4:b05f:9668:4eef:60ce	Login Success	sakura
127	20	2022-05-12 12:39:31	2402:4000:2380:c1d0:882d:647:ba36:e1e4	Login Success	sakura
128	20	2022-05-12 12:43:23	2402:4000:2380:c1d0:882d:647:ba36:e1e4	Login Success	sakura
129	20	2022-05-12 12:53:10	2402:4000:2080:11b9:d8a9:3b9b:dba9:e36d	Login Success	sakura
130	20	2022-05-26 15:52:35	2402:4000:11c0:890a:5091:cf2f:7c94:1f6b	Login Success	sakura
\.


--
-- TOC entry 3558 (class 0 OID 25022)
-- Dependencies: 266
-- Data for Name: vendormessages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendormessages (id, senderid, meassage, receivedby, datetime, status, sendertype, receivedtype) FROM stdin;
3	1		2	2022-03-03 13:45:16	unread	admin	vendor
1	2	Hello	1	2021-07-11 16:56:55	read	vendor	admin
2	2		1	2021-07-11 16:57:13	read	vendor	admin
4	1		2	2022-03-03 13:48:27	unread	admin	vendor
5	9	test message abc	1	2022-03-04 10:48:54	read	vendor	admin
6	1	reply msg	9	2022-03-04 10:49:49	read	admin	vendor
7	20	Dear Sir / Madam. I have uploaded our new product details. Please approve our products. Thank you very much	\N	2022-04-29 11:39:29	unread	vendor	admin
8	20	Dear Sir / Madam. I have uploaded our new product details. Please approve our products. Thank you very much	\N	2022-04-29 11:39:38	unread	vendor	admin
\.


--
-- TOC entry 3560 (class 0 OID 25028)
-- Dependencies: 268
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendors (vendorid, vendorname, username, password, email, contactno, status, cby, cdate, appdate, address, appby, bankaccount, nic) FROM stdin;
2	Abc	Abc	$2y$10$ps/6veceZ79w/SBZbTKq0Oo3OaeUTAT7W8wpfIKElAvIL.rF8345W	amarathnasiri@gmail.com	0779127308	Active	1	2021-07-11 16:37:26	\N	45, Abc	\N	\N	\N
1	testvendor	testvendor	$2y$10$jRoRNScDwOHvUtnffKAwZeEGzgJe.9ofzVeMTH1yYMuqJ5fltHnIa	vofyuniydu@biyac.com	0719250123	Active	1	2021-07-07 13:04:55	\N		\N	\N	\N
4	Test A	TestA	$2y$10$1i7E0aJD.k6xy6oR4fDtcuSSZM3QCANwPw/LBmJMJ/JE93rRz8gsC	amarathnasiri@gmail.com	0779127308	Active	1	2021-07-19 09:16:46	\N		\N	\N	\N
5	Def	Def	$2y$10$IrDBmCBV2QcxULxkdhJtOuV57U0WesUs/zSMMM3mS91adfLEuL8x2	cdwa.itunit@gmail.com	0779127308	Active	1	2021-07-26 08:57:49	\N	820/B,\nGemunu Mawatha	\N	\N	\N
6	Ghi	Ghi	$2y$10$b.9kdUAN72FBW7BeHiNva.1oabA3iX19P/ZNCnuaJnjYdym0C3sjC	mwce@gmail.com	0779127308	Active	1	2021-08-06 10:56:07	\N	colombo	\N	457896321	\N
18	K.A.Yamuna Dilhani	yamunadilhani	$2y$10$95KcC6EPZXN0vIjdSZiQzON4au5QjS.VFJLn6ZQ5TadNiefQL2MTq	yamunadilhani262@gmail.com	0718834798	Active	1	2022-03-05 23:02:33	\N	Sri Sasanathilaka Mawatha, Haththaka, Manampita, Pitigala	\N	073200110063161	\N
7	thanushka	thanushka	$2y$10$htfBL7JZqcijM/lrY50Nr.NAS8CjHEnptpzfUqR5lfT9jkuaI5vD6	kixedo4759@xindax.com	0719270153	Active	1	2022-03-03 15:47:05	\N	Aluthgama	\N	123456789	\N
8	Anura Liyanage	anura	$2y$10$tsu0NJUOU2RC7.F7ghz2EONL19XFPkSTqXXIBqu8neCOtkrjMecJ2	yatib60444@zneep.com	0719270163	Active	1	2022-03-04 09:37:35	\N	Kaluthara	\N	123456789	\N
19	N.W.B.R.Dilrukshi	dilrukshi	$2y$10$9cYbeMHpf3//XJBfDLHwnuAnVYWHJa4BM0MPEKBMDsjE0qUIvilie	savidumasathsarani@gmail.com	0777959608	Active	1	2022-03-05 23:21:38	\N	12/A, Kalasirigama, Manikhinna	\N	157200110013137	\N
3	Kasun Gunatilaka	kasun	$2y$10$LqszqNM0jeCOOxOCfFq9b.8ZKvyzJx8DgKSOWVyA8ZDRuClJISMH2	toderar572@godpeed.com	0719230563	Active	1	2021-07-12 11:13:33	\N		\N	\N	\N
10	Nalani Balasingha	nalanibalasingha	$2y$10$cdyFRpUXCb6iInuCbv4D6OYSUSnfwKaqcPa8uKfqF6Lhmspn6JANW	nalanibalasingha@gmail.com	0776157410	Active	1	2022-03-04 21:21:33	\N	No.91/3, Old Galle Road, Walliwala, Weligama	\N	077200196716140	\N
9	Kamal	kamal	$2y$10$LqszqNM0jeCOOxOCfFq9b.8ZKvyzJx8DgKSOWVyA8ZDRuClJISMH2	kixedo4759@xindax.com	0719270153	Disabled	1	2022-03-04 10:06:02	\N	Kalutara	\N	123456789123455	\N
12	Samanthi	Sakura	$2y$10$XcQQkbpVinuQDma3cMTjauEHr8nOyY/zP5BQCT7scYJq7NWTUMvHa	sakurathala@gmail.com	0760350432	Active	1	2022-03-05 17:50:09	\N	Sakura Product, Pitakanda, Bulutota	\N	045200240012426	\N
24	Arvin Softmate	ArvinSoftmate	$2y$10$mySUKH71D7NYpcZVY1Lze.8TzxbO6T4k9AJbMV3NO4W/FDcT79/De	arvinsoftmate@gmail.com	0775104294	Active	1	2022-03-28 16:46:14	\N	385 2/7, Galle Road, Colombo 6	\N	086200170022716	198177800520
11	J.P. Nadeeka Subhashini	nadeekasubha	$2y$10$9n1BGYqG9wkZgmTN.KI0W.yoSPUhTwoecbkSQb/kfwshaxC5CvRRK	subashiproducts700@gmail.com	0712289955	Active	1	2022-03-05 16:08:29	\N	43/2, Kumar Doratuwa, Colombo	\N	236200133487115	\N
14	Ruwini Apsara Perera	ruviniperera	$2y$10$QpLqmzG8G3zntEXQ382JyuG6PdOdmzLLamw5/vlrYRTktKLrffIiW	ruviniperera409@gmail.com	0774672487	Active	1	2022-03-05 18:07:50	\N	38/4, Rathnam Road, Colombo 13	\N	217200203526529	\N
15	Y. H. Motha	yvonnemmotha	$2y$10$FVFt2yTR97PL89eaRiBezOX3mT2Bm4Akybb/U5OSTC4FEETmDMNmq	yvonnemmotha@gmail.com	0765366280	Active	1	2022-03-05 19:06:04	\N	151/3, Bambukuliya, Kochchikade	\N	142200150038936	\N
16	T.A.Wasanthi Kumari	wasanthikumari	$2y$10$BiI6Y30nKKATgrCq2aXGp.GEdKYsA2qD3Uk8DYmX05cOmmnWnvaFC	kumari.minigarment@gmail.com	0112603883	Active	1	2022-03-05 22:01:12	\N	18A, Singhagama, Polgasowita	\N	327200161997179	\N
17	K.H.Indrani Premalatha	craftserene	$2y$10$w6mrApaEAbW2nXRwAURITOJYn6VvKeDSd.TOGrlbh8blp5bYHMHRK	craftserene2@gmail.com	0788181272	Active	1	2022-03-05 22:19:06	\N	Lidagawa Waththa, Kithalagama East, Thihagoda	\N	032200160062649	\N
20	Manjula Janaki Opanayaka Ranawakage	sakura	$2y$10$ZeH6TEeVw7a0Y20WwCed6OcbydbUGhOHxLw9JEtIe44uo7hLOCJ8a	sakurathala@gmail.com	0760350432	Active	1	2022-03-05 23:40:30	\N	Lolugahahaena, Pitakanda, Bulutota	\N	045200240012426	\N
21	Rusiri Saumya	rusini	$2y$10$owO5ty7oBZkPePfoACA6PudSuu5LpkZJW3zttQtX28SKSb4qABU7e	rusini.rajasooriya@gmail.com	0766259541	Active	1	2022-03-06 00:04:12	\N	70/13, St Rita Road, Mount Lavinia	\N	336200233751779	\N
13	M.g.s.priyadarshani.	samanthi	$2y$10$tqiZkddt8rjFKDPLufPeQ.yVyYlNjycMKUYKEHkNBU0XXpYLTkXLW	Samanthiarts@gmail.com	0712781883	Active	1	2022-03-05 18:01:33	\N		\N	171200450070352	\N
25	Science Land IT	sciencelandit	$2y$10$TMbCfMgAAuEhDkRlnNizN.RyiANHcLjGOfSBlZJR8i1Hf4ItEWGI.	thanushkajayasinghe@gmail.com	0719270152	Pending	1	2022-04-07 16:07:55	\N		\N	123456789012345	912172586V
22	W.M. Jayathilaka	cdwa	$2y$10$PrFBxzaleNDqBb6euhTR/.A991dGTH39.sG.a7Y/7Aish1P.ZCHbG	cdwa.itunit@gmail.com	0779127308	Active	1	2022-03-23 12:22:18	\N	39, Eawathawatta, Moratuwa	\N	123456789123456	198079601337
23	Thanushka	thanushk	$2y$10$gj1ODg5EC12UNZwARS2SL.bHvLbEcwWDcgxSD/A38vxrhoGGf9mta	fakow52697@moonran.com	0719270152	Active	1	2022-03-25 10:25:38	\N	Alwathugoda, Bentota	\N	123456789012345	912172572V
\.


--
-- TOC entry 3562 (class 0 OID 25034)
-- Dependencies: 270
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (wishlistid, productid, userid) FROM stdin;
2	10	12
3	4	12
4	39	17
\.


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 210
-- Name: audittrail_auditid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audittrail_auditid_seq', 1, false);


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 212
-- Name: banners_bannerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banners_bannerid_seq', 15, true);


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 214
-- Name: categories_catid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_catid_seq', 33, true);


--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 217
-- Name: cp_user_group_user_group_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cp_user_group_user_group_serial_seq', 3, true);


--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 219
-- Name: cp_user_login_user_login_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cp_user_login_user_login_serial_seq', 3, true);


--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 221
-- Name: cp_user_permission_user_permission_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cp_user_permission_user_permission_serial_seq', 20, true);


--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 222
-- Name: cp_user_user_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cp_user_user_serial_seq', 3, true);


--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 224
-- Name: customerlogihistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customerlogihistory_id_seq', 175, true);


--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 226
-- Name: customermessages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customermessages_id_seq', 1, true);


--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 228
-- Name: customers_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customerid_seq', 21, true);


--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 230
-- Name: order_details_orderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_orderdetailid_seq', 30, true);


--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 232
-- Name: order_master_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_master_orderid_seq', 29, true);


--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 234
-- Name: permission_master_permission_master_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_master_permission_master_serial_seq', 16, true);


--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 236
-- Name: product_assign_features_assignfeatureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_assign_features_assignfeatureid_seq', 1, false);


--
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 238
-- Name: product_feature_variations_featurevariationid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_feature_variations_featurevariationid_seq', 91, true);


--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 240
-- Name: product_images_productimageid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_productimageid_seq', 30, true);


--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 242
-- Name: productcolors_productcolorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productcolors_productcolorid_seq', 78, true);


--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 244
-- Name: productreviews_reviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productreviews_reviewid_seq', 1, false);


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 247
-- Name: products_features_featureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_features_featureid_seq', 4, true);


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 249
-- Name: products_packs_packid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_packs_packid_seq', 1, false);


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 250
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 53, true);


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 252
-- Name: salepanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salepanel_id_seq', 1, false);


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 255
-- Name: shopping_cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shopping_cart_cart_id_seq', 20, true);


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 257
-- Name: sidebanners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sidebanners_id_seq', 11, true);


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 259
-- Name: subscribelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscribelist_id_seq', 1, true);


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 261
-- Name: sysuser_login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sysuser_login_history_id_seq', 149, true);


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 263
-- Name: user_login_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_login_audit_id_seq', 1, false);


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 265
-- Name: vendor_login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_login_history_id_seq', 130, true);


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 267
-- Name: vendormessages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendormessages_id_seq', 8, true);


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 269
-- Name: vendors_vendorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendors_vendorid_seq', 25, true);


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 271
-- Name: wishlist_wishlistid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_wishlistid_seq', 4, true);


--
-- TOC entry 3347 (class 2606 OID 25065)
-- Name: cp_user_group cp_user_group_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cp_user_group
    ADD CONSTRAINT cp_user_group_pk PRIMARY KEY (user_group_serial);


--
-- TOC entry 3349 (class 2606 OID 25067)
-- Name: cp_user_login cp_user_login_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cp_user_login
    ADD CONSTRAINT cp_user_login_pk PRIMARY KEY (user_login_serial);


--
-- TOC entry 3351 (class 2606 OID 25069)
-- Name: customers customers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pk PRIMARY KEY (customerid);


--
-- TOC entry 3345 (class 2606 OID 25071)
-- Name: mainbanner mainbanner_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainbanner
    ADD CONSTRAINT mainbanner_pk PRIMARY KEY (bannerid);


--
-- TOC entry 3353 (class 2606 OID 25073)
-- Name: product_feature_variations product_feature_variations_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_feature_variations
    ADD CONSTRAINT product_feature_variations_pk PRIMARY KEY (featurevariationid);


--
-- TOC entry 3355 (class 2606 OID 25075)
-- Name: product_images product_images_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pk PRIMARY KEY (productimageid);


--
-- TOC entry 3357 (class 2606 OID 25077)
-- Name: productcolors productcolors_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productcolors
    ADD CONSTRAINT productcolors_pk PRIMARY KEY (productcolorid);


--
-- TOC entry 3359 (class 2606 OID 25079)
-- Name: products products_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pk PRIMARY KEY (productid);


--
-- TOC entry 3361 (class 2606 OID 25081)
-- Name: vendors vendors_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pk PRIMARY KEY (vendorid);


-- Completed on 2023-01-24 15:34:17

--
-- PostgreSQL database dump complete
--

