--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE americanhospital_db;




--
-- Drop roles
--

DROP ROLE americanhospital;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE americanhospital;
ALTER ROLE americanhospital WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5e2de1c7504d24906efd4b907beee06bc';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

CREATE DATABASE americanhospital_db WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect americanhospital_db

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: americanhospital_app_about; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_about (
    id integer NOT NULL,
    text_en text NOT NULL,
    text_gr text NOT NULL,
    text_ru text NOT NULL,
    text_tr text NOT NULL,
    page_type character varying(20) NOT NULL
);


ALTER TABLE americanhospital_app_about OWNER TO americanhospital;

--
-- Name: americanhospital_app_about_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_about_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_about_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_about_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_about_id_seq OWNED BY americanhospital_app_about.id;


--
-- Name: americanhospital_app_admin; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_admin (
    id integer NOT NULL,
    username character varying(15) NOT NULL,
    password character varying(100) NOT NULL,
    status character varying(1) NOT NULL
);


ALTER TABLE americanhospital_app_admin OWNER TO americanhospital;

--
-- Name: americanhospital_app_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_admin_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_admin_id_seq OWNED BY americanhospital_app_admin.id;


--
-- Name: americanhospital_app_appointment; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_appointment (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    doctor_id integer NOT NULL,
    date character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_appointment OWNER TO americanhospital;

--
-- Name: americanhospital_app_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_appointment_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_appointment_id_seq OWNED BY americanhospital_app_appointment.id;


--
-- Name: americanhospital_app_blog; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_blog (
    id integer NOT NULL,
    image character varying(255) NOT NULL,
    title_en character varying(100) NOT NULL,
    title_gr character varying(100) NOT NULL,
    title_ru character varying(100) NOT NULL,
    title_tr character varying(100) NOT NULL,
    description_en text NOT NULL,
    description_gr text NOT NULL,
    description_ru text NOT NULL,
    description_tr text NOT NULL,
    status character varying(1) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_blog OWNER TO americanhospital;

--
-- Name: americanhospital_app_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_blog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_blog_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_blog_id_seq OWNED BY americanhospital_app_blog.id;


--
-- Name: americanhospital_app_contact; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_contact (
    id integer NOT NULL,
    address_en character varying(100) NOT NULL,
    address_gr character varying(100) NOT NULL,
    address_ru character varying(100) NOT NULL,
    address_tr character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL
);


ALTER TABLE americanhospital_app_contact OWNER TO americanhospital;

--
-- Name: americanhospital_app_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_contact_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_contact_id_seq OWNED BY americanhospital_app_contact.id;


--
-- Name: americanhospital_app_department; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_department (
    id integer NOT NULL,
    name_en character varying(100) NOT NULL,
    name_gr character varying(100) NOT NULL,
    name_ru character varying(100) NOT NULL,
    name_tr character varying(100) NOT NULL,
    description_en text NOT NULL,
    description_gr text NOT NULL,
    description_ru text NOT NULL,
    description_tr text NOT NULL,
    status character varying(1) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_department OWNER TO americanhospital;

--
-- Name: americanhospital_app_department_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_department_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_department_id_seq OWNED BY americanhospital_app_department.id;


--
-- Name: americanhospital_app_doctor; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_doctor (
    id integer NOT NULL,
    image character varying(255) NOT NULL,
    full_name_en character varying(100) NOT NULL,
    full_name_gr character varying(100) NOT NULL,
    full_name_ru character varying(100) NOT NULL,
    full_name_tr character varying(100) NOT NULL,
    profession_en character varying(100) NOT NULL,
    profession_gr character varying(100) NOT NULL,
    profession_ru character varying(100) NOT NULL,
    profession_tr character varying(100) NOT NULL,
    description_en text NOT NULL,
    description_gr text NOT NULL,
    description_ru text NOT NULL,
    description_tr text NOT NULL,
    status character varying(1) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_doctor OWNER TO americanhospital;

--
-- Name: americanhospital_app_doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_doctor_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_doctor_id_seq OWNED BY americanhospital_app_doctor.id;


--
-- Name: americanhospital_app_doctorquestion; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_doctorquestion (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    doctor_id integer NOT NULL
);


ALTER TABLE americanhospital_app_doctorquestion OWNER TO americanhospital;

--
-- Name: americanhospital_app_doctorquestion_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_doctorquestion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_doctorquestion_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_doctorquestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_doctorquestion_id_seq OWNED BY americanhospital_app_doctorquestion.id;


--
-- Name: americanhospital_app_getwell; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_getwell (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    to_whom character varying(100) NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_getwell OWNER TO americanhospital;

--
-- Name: americanhospital_app_getwell_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_getwell_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_getwell_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_getwell_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_getwell_id_seq OWNED BY americanhospital_app_getwell.id;


--
-- Name: americanhospital_app_menu; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_menu (
    id integer NOT NULL,
    title_en character varying(100) NOT NULL,
    title_gr character varying(100) NOT NULL,
    title_ru character varying(100) NOT NULL,
    title_tr character varying(100) NOT NULL,
    menu_type character varying(20) NOT NULL,
    status character varying(1) NOT NULL,
    has_submenu character varying(1) NOT NULL,
    link character varying(30) NOT NULL
);


ALTER TABLE americanhospital_app_menu OWNER TO americanhospital;

--
-- Name: americanhospital_app_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_menu_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_menu_id_seq OWNED BY americanhospital_app_menu.id;


--
-- Name: americanhospital_app_message; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_message (
    id integer NOT NULL,
    text text NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    subject character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_message OWNER TO americanhospital;

--
-- Name: americanhospital_app_message_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_message_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_message_id_seq OWNED BY americanhospital_app_message.id;


--
-- Name: americanhospital_app_result; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_result (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_result OWNER TO americanhospital;

--
-- Name: americanhospital_app_result_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_result_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_result_id_seq OWNED BY americanhospital_app_result.id;


--
-- Name: americanhospital_app_resume; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_resume (
    id integer NOT NULL,
    resume character varying(255) NOT NULL,
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_resume OWNER TO americanhospital;

--
-- Name: americanhospital_app_resume_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_resume_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_resume_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_resume_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_resume_id_seq OWNED BY americanhospital_app_resume.id;


--
-- Name: americanhospital_app_slider; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_slider (
    id integer NOT NULL,
    image character varying(255) NOT NULL,
    title_en character varying(100) NOT NULL,
    title_gr character varying(100) NOT NULL,
    title_ru character varying(100) NOT NULL,
    title_tr character varying(100) NOT NULL,
    text_en character varying(100) NOT NULL,
    text_gr character varying(100) NOT NULL,
    text_ru character varying(100) NOT NULL,
    text_tr character varying(100) NOT NULL,
    status character varying(1) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE americanhospital_app_slider OWNER TO americanhospital;

--
-- Name: americanhospital_app_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_slider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_slider_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_slider_id_seq OWNED BY americanhospital_app_slider.id;


--
-- Name: americanhospital_app_socialmedia; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_socialmedia (
    id integer NOT NULL,
    icon character varying(100) NOT NULL,
    link character varying(100) NOT NULL,
    status character varying(1) NOT NULL
);


ALTER TABLE americanhospital_app_socialmedia OWNER TO americanhospital;

--
-- Name: americanhospital_app_socialmedia_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_socialmedia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_socialmedia_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_socialmedia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_socialmedia_id_seq OWNED BY americanhospital_app_socialmedia.id;


--
-- Name: americanhospital_app_submenu; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_submenu (
    id integer NOT NULL,
    title_en character varying(100) NOT NULL,
    title_gr character varying(100) NOT NULL,
    title_ru character varying(100) NOT NULL,
    title_tr character varying(100) NOT NULL,
    link character varying(20) NOT NULL,
    status character varying(1) NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE americanhospital_app_submenu OWNER TO americanhospital;

--
-- Name: americanhospital_app_submenu_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_submenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_submenu_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_submenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_submenu_id_seq OWNED BY americanhospital_app_submenu.id;


--
-- Name: americanhospital_app_team; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_team (
    id integer NOT NULL,
    image character varying(255) NOT NULL,
    full_name_en character varying(100) NOT NULL,
    full_name_gr character varying(100) NOT NULL,
    full_name_ru character varying(100) NOT NULL,
    full_name_tr character varying(100) NOT NULL,
    profession_en character varying(100) NOT NULL,
    profession_gr character varying(100) NOT NULL,
    profession_ru character varying(100) NOT NULL,
    profession_tr character varying(100) NOT NULL,
    description_en text NOT NULL,
    description_gr text NOT NULL,
    description_ru text NOT NULL,
    description_tr text NOT NULL,
    status character varying(1) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_team OWNER TO americanhospital;

--
-- Name: americanhospital_app_team_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_team_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_team_id_seq OWNED BY americanhospital_app_team.id;


--
-- Name: americanhospital_app_thank; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE americanhospital_app_thank (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    to_whom character varying(100) NOT NULL,
    text text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE americanhospital_app_thank OWNER TO americanhospital;

--
-- Name: americanhospital_app_thank_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE americanhospital_app_thank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE americanhospital_app_thank_id_seq OWNER TO americanhospital;

--
-- Name: americanhospital_app_thank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE americanhospital_app_thank_id_seq OWNED BY americanhospital_app_thank.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO americanhospital;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO americanhospital;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO americanhospital;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO americanhospital;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO americanhospital;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO americanhospital;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: base_user_myuser; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE base_user_myuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(100) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    profile_picture character varying(100),
    gender integer,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE base_user_myuser OWNER TO americanhospital;

--
-- Name: base_user_myuser_groups; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE base_user_myuser_groups (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE base_user_myuser_groups OWNER TO americanhospital;

--
-- Name: base_user_myuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE base_user_myuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_user_myuser_groups_id_seq OWNER TO americanhospital;

--
-- Name: base_user_myuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE base_user_myuser_groups_id_seq OWNED BY base_user_myuser_groups.id;


--
-- Name: base_user_myuser_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE base_user_myuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_user_myuser_id_seq OWNER TO americanhospital;

--
-- Name: base_user_myuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE base_user_myuser_id_seq OWNED BY base_user_myuser.id;


--
-- Name: base_user_myuser_user_permissions; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE base_user_myuser_user_permissions (
    id integer NOT NULL,
    myuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE base_user_myuser_user_permissions OWNER TO americanhospital;

--
-- Name: base_user_myuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE base_user_myuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE base_user_myuser_user_permissions_id_seq OWNER TO americanhospital;

--
-- Name: base_user_myuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE base_user_myuser_user_permissions_id_seq OWNED BY base_user_myuser_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO americanhospital;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO americanhospital;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL
);


ALTER TABLE django_celery_beat_crontabschedule OWNER TO americanhospital;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_celery_beat_crontabschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_beat_crontabschedule_id_seq OWNER TO americanhospital;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_celery_beat_crontabschedule_id_seq OWNED BY django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE django_celery_beat_intervalschedule OWNER TO americanhospital;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_celery_beat_intervalschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_beat_intervalschedule_id_seq OWNER TO americanhospital;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_celery_beat_intervalschedule_id_seq OWNED BY django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE django_celery_beat_periodictask OWNER TO americanhospital;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_celery_beat_periodictask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_beat_periodictask_id_seq OWNER TO americanhospital;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_celery_beat_periodictask_id_seq OWNED BY django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE django_celery_beat_periodictasks OWNER TO americanhospital;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE django_celery_beat_solarschedule OWNER TO americanhospital;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_celery_beat_solarschedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_beat_solarschedule_id_seq OWNER TO americanhospital;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_celery_beat_solarschedule_id_seq OWNED BY django_celery_beat_solarschedule.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE django_celery_results_taskresult OWNER TO americanhospital;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_celery_results_taskresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_celery_results_taskresult_id_seq OWNER TO americanhospital;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_celery_results_taskresult_id_seq OWNED BY django_celery_results_taskresult.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO americanhospital;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO americanhospital;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE django_flatpage OWNER TO americanhospital;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_flatpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_flatpage_id_seq OWNER TO americanhospital;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_flatpage_id_seq OWNED BY django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE django_flatpage_sites OWNER TO americanhospital;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_flatpage_sites_id_seq OWNER TO americanhospital;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_flatpage_sites_id_seq OWNED BY django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO americanhospital;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO americanhospital;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO americanhospital;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: americanhospital
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO americanhospital;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: americanhospital
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO americanhospital;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: americanhospital
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: americanhospital_app_about id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_about ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_about_id_seq'::regclass);


--
-- Name: americanhospital_app_admin id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_admin ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_admin_id_seq'::regclass);


--
-- Name: americanhospital_app_appointment id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_appointment ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_appointment_id_seq'::regclass);


--
-- Name: americanhospital_app_blog id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_blog ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_blog_id_seq'::regclass);


--
-- Name: americanhospital_app_contact id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_contact ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_contact_id_seq'::regclass);


--
-- Name: americanhospital_app_department id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_department ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_department_id_seq'::regclass);


--
-- Name: americanhospital_app_doctor id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_doctor ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_doctor_id_seq'::regclass);


--
-- Name: americanhospital_app_doctorquestion id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_doctorquestion ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_doctorquestion_id_seq'::regclass);


--
-- Name: americanhospital_app_getwell id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_getwell ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_getwell_id_seq'::regclass);


--
-- Name: americanhospital_app_menu id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_menu ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_menu_id_seq'::regclass);


--
-- Name: americanhospital_app_message id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_message ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_message_id_seq'::regclass);


--
-- Name: americanhospital_app_result id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_result ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_result_id_seq'::regclass);


--
-- Name: americanhospital_app_resume id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_resume ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_resume_id_seq'::regclass);


--
-- Name: americanhospital_app_slider id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_slider ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_slider_id_seq'::regclass);


--
-- Name: americanhospital_app_socialmedia id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_socialmedia ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_socialmedia_id_seq'::regclass);


--
-- Name: americanhospital_app_submenu id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_submenu ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_submenu_id_seq'::regclass);


--
-- Name: americanhospital_app_team id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_team ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_team_id_seq'::regclass);


--
-- Name: americanhospital_app_thank id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_thank ALTER COLUMN id SET DEFAULT nextval('americanhospital_app_thank_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: base_user_myuser id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser ALTER COLUMN id SET DEFAULT nextval('base_user_myuser_id_seq'::regclass);


--
-- Name: base_user_myuser_groups id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_groups ALTER COLUMN id SET DEFAULT nextval('base_user_myuser_groups_id_seq'::regclass);


--
-- Name: base_user_myuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('base_user_myuser_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('django_celery_results_taskresult_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_flatpage id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_flatpage ALTER COLUMN id SET DEFAULT nextval('django_flatpage_id_seq'::regclass);


--
-- Name: django_flatpage_sites id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('django_flatpage_sites_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Data for Name: americanhospital_app_about; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_about (id, text_en, text_gr, text_ru, text_tr, page_type) FROM stdin;
3	hissdvbjkdsvbk	dfhishsihfsif	dsfbgdbjhuuhuhu	hihihihihihiturkey	history
4	telen	telkgrgr	dsjkhdsjte;l	dsvdskjbketete	television
5	missionfghsf	missionfhd	missionsshrrus	missiondshdh	mission
6	visiondhdf	visiondhdf	visionfshdf	visionvisionturk	vision
7	quality_policysghs	quality_policysdhsfgrgrgrg	quality_policysss	quality_policytrtrt	quality_policy
8	facilitysgdenen	facilitydgsd	facilitydshf	facilitytrrrr	facility
9	policydzbds	policydgsfhsf	policydshdsfhrussia	policydsrrttt	policy
2	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span></p>	introduction
1	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>	about
\.


--
-- Name: americanhospital_app_about_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_about_id_seq', 1, false);


--
-- Data for Name: americanhospital_app_admin; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_admin (id, username, password, status) FROM stdin;
34	qosqar	348572ecd1bc5212b19c5f8c8b1e2daa63f5e6b78f444986b389eef00d6da2c0	1
1	zaur	b691331e790991192c749e6a438dacacf68dcf1bc25c135e8339e63d619b5a1e	1
\.


--
-- Name: americanhospital_app_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_admin_id_seq', 34, true);


--
-- Data for Name: americanhospital_app_appointment; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_appointment (id, full_name, email, phone, doctor_id, date, created_at) FROM stdin;
1	Zaur Ibrahimov	zibrahimov95@gmail.com	0556333265	4	12/07/2019	2019-12-16 08:21:42.531875+00
34	Zaur Ibrahimov	zibrahimov95@gmail.com	0556333265	3	12/06/2019	2019-12-17 06:37:38.296089+00
\.


--
-- Name: americanhospital_app_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_appointment_id_seq', 34, true);


--
-- Data for Name: americanhospital_app_blog; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_blog (id, image, title_en, title_gr, title_ru, title_tr, description_en, description_gr, description_ru, description_tr, status, created_at) FROM stdin;
1	image/upload/v1575660189/ffeoxg1uobvu64qentui.png	title_en	bvdfk	dsjkv	dkbjvksd	<p><span style="font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;="" text-align:="" justify;"="">dshdf</span><br></p>	<p>lbsldfb</p>	<p>flbndflbd</p>	<p>djsbvldsbv</p>	1	2019-12-06 19:23:05.646559+00
34	image/upload/v1576756426/zn9yognqu6kcjczimkim.png	aghdfhd	shsdfh	sdfhsfd	dfhfdhd	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span></p>	1	2019-12-19 11:53:44.306516+00
35	image/upload/v1576760873/ga1n1vtm5oaqwpteguot.png	gkj	vdb	vbfkjbqjbvrj	bjdflb	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	1	2019-12-19 13:07:51.663741+00
36	image/upload/v1576760888/ppfvvzrhy49jadobbggk.png	dsbndf	fndf	dndg	dfndf	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	1	2019-12-19 13:08:06.004+00
37	image/upload/v1576760911/td1xi2orbnakn8ss71us.png	dbsdf	dsbdf	hnh	dsd	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	1	2019-12-19 13:08:30.545001+00
38	image/upload/v1576760937/lczmeex9tg9rg5ymutwv.png	dsgsfdg	gjfgm	trhjrt	rtjtr	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	1	2019-12-19 13:08:56.648516+00
39	image/upload/v1576760956/lwcjib6ujfdhbnfqw8ma.png	dbdf	ddg	gjfg	gjfg	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span><br></p>	1	2019-12-19 13:09:12.701688+00
\.


--
-- Name: americanhospital_app_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_blog_id_seq', 67, true);


--
-- Data for Name: americanhospital_app_contact; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_contact (id, address_en, address_gr, address_ru, address_tr, email, phone) FROM stdin;
1	Tbilisi	gyfj	bvs	trtrt	info@aht.com	8746237
\.


--
-- Name: americanhospital_app_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_contact_id_seq', 66, true);


--
-- Data for Name: americanhospital_app_department; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_department (id, name_en, name_gr, name_ru, name_tr, description_en, description_gr, description_ru, description_tr, status, created_at) FROM stdin;
1	Lorem ipsum dolor sit amet	depfdjvsjcb	cdjvkbevedep	jbfejkfejkdeptr	<div style="margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;"=""><p style="text-align: left; margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;"><span style="font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px;">vcncvnmcv</span><br></p></div>	<p>vcncvnmcv</p>	<p>cmbvmbv</p>	<p>cncvm</p>	1	2019-12-16 13:45:50.92647+00
\.


--
-- Name: americanhospital_app_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_department_id_seq', 33, true);


--
-- Data for Name: americanhospital_app_doctor; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_doctor (id, image, full_name_en, full_name_gr, full_name_ru, full_name_tr, profession_en, profession_gr, profession_ru, profession_tr, description_en, description_gr, description_ru, description_tr, status, created_at) FROM stdin;
5	image/upload/v1576755976/xssvg7lhctdyyt5ggi5k.png	fhdfh	vdskjl	jlfbkj	ljbjl	dvljqlkbvlfj	dlbfdlqknbldf	vfklbqbknfdl	fddklbn	<p>fdhjgj</p>	<p>fdfdhdf</p>	<p>gffhkgh</p>	<p>ghkgh</p>	1	2019-12-19 11:46:15.190956+00
4	image/upload/v1575657858/utzxlywbyasdlf3n4p0y.png	Jessica Alba	რატომ ვიყენებთ	Что такое	Ali Ali	Surgent	რა არის	взять	Cerrah	<p><span style="font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;="" text-align:="" justify;"="">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p><p><span style="font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;="" text-align:="" justify;"="">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p><p><span style="font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;="" text-align:="" justify;"="">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p><p><span style="font-family: " open="" sans",="" arial,="" sans-serif;="" font-size:="" 14px;="" text-align:="" justify;"="">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<br></span><br></p>	<p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	<p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	<p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: "Open Sans", Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	1	2019-12-06 18:44:15.616301+00
6	image/upload/v1576755997/co2qyvbo4il7mslgs1pm.png	dfn	dndf	fgmmh	gjfgj	fgjfgj	fgjfgj	gfjgf	fgjgf	<p>fgjfgj</p>	<p>fgkfh</p>	<p>vhm,gh</p>	<p>iliylyuu</p>	1	2019-12-19 11:46:37.025047+00
3	image/upload/v1575654181/blj25wqvoaawov450hei.png	Jack John	რატომ	Rusisac	John	Surgent	რატომ	взять	Cerrah	<p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><div><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><div><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><div><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><div><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><div><br></div>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">ცნობილი ფაქტია, რომ გვერდის წაკითხვად შიგთავსს შეუძლია მკითხველის ყურადღება მიიზიდოს და დიზაინის აღქმაში ხელი შეუშალოს. Lorem Ipsum-ის გამოყენებით ვღებულობთ იმაზე მეტ-ნაკლებად სწორი გადანაწილების ტექსტს, ვიდრე ერთიდაიგივე გამეორებადი სიტყვებია ხოლმე. შედეგად, ტექსტი ჩვეულებრივ ინგლისურს გავს, მისი წაითხვა კი შეუძლებელია. დღეს უამრავი პერსონალური საგამომცემლო პროგრამა და ვებგვერდი იყენებს Lorem Ipsum-ს, როგორც დროებით ტექსტს წყობის შესავსებად; Lorem Ipsum-ის მოძებნისას კი საძიებო სისტემები ბევრ დაუსრულებელ გვერდს გვიჩვენებენ. წლების მანძილზე ამ ტექსტის უამრავი ვერსია გამოჩნდა, ზოგი შემთხვევით დაშვებული შეცდომის გამო, ზოგი კი — განზრახ, ხუმრობით.</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><hr><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır. Şu anda birçok masaüstü yayıncılık paketi ve web sayfa düzenleyicisi, varsayılan mıgır metinler olarak Lorem Ipsum kullanmaktadır. Ayrıca arama motorlarında 'lorem ipsum' anahtar sözcükleri ile arama yapıldığında henüz tasarım aşamasında olan çok sayıda site listelenir. Yıllar içinde, bazen kazara, bazen bilinçli olarak (örneğin mizah katılarak), çeşitli sürümleri geliştirilmiştir.</span></p><p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;"><br></span><br></p>	1	2019-12-06 17:42:59.427485+00
7	image/upload/v1576756018/b7vrwlzljtbgzytzoyqd.png	gfgfgf	gfngfngf	jh,jh,jh,	dffddf	hj,jh,	ggffh	hj,hj,	hmh	<p>gghhg</p>	<p>ggdg</p>	<p>hj.hj,.h.j</p>	<p>gjj</p>	1	2019-12-19 11:46:57.33799+00
8	image/upload/v1576756041/tp2nac4mf6epwxn3tumx.png	fddfnd	dgndgd	dfndfndf	dfndfnd	dndfn	dgndf	dgndg	gndgn	<p>gfmfhmf</p>	<p>fgmgfm</p>	<p>fgmgfmfg</p>	<p>fgmgfmfgm</p>	1	2019-12-19 11:47:21.264054+00
\.


--
-- Name: americanhospital_app_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_doctor_id_seq', 8, true);


--
-- Data for Name: americanhospital_app_doctorquestion; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_doctorquestion (id, full_name, email, phone, text, created_at, doctor_id) FROM stdin;
1	Zaur Ibrahimov	zibrahimov95@gmail.com	0556333265	fngncvn	2019-12-17 07:12:21.677075+00	3
\.


--
-- Name: americanhospital_app_doctorquestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_doctorquestion_id_seq', 33, true);


--
-- Data for Name: americanhospital_app_getwell; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_getwell (id, full_name, to_whom, text, created_at) FROM stdin;
1	Zaur Ibrahimov	JAck	dxfbxxfbxbbx	2019-12-18 07:30:06.782998+00
\.


--
-- Name: americanhospital_app_getwell_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_getwell_id_seq', 1, true);


--
-- Data for Name: americanhospital_app_menu; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_menu (id, title_en, title_gr, title_ru, title_tr, menu_type, status, has_submenu, link) FROM stdin;
3	E-Services	E-Servicesgr	E-Servicesru	E-Servicestr	header	1	1	history
4	Corporate	Corporategr	Corporateru	Corporatetr	header	1	1	history
14	History	Historygr	Historyru	Historytr	footer_about	1	1	history
13	Introduction	Introductiongr	Introductionru	Introductiontr	footer_about	1	1	introduction
16	Mission	Missiongr	Missionru	Missiontr	footer_about	1	1	mission
17	Vision	Visiongr	Visionru	Visiontr	footer_about	1	1	vision
15	TV	TVgr	TVru	TVtr	footer_about	1	1	television
20	Facilities and Services	Facilities and Servicesgr	Facilities and Servicesru	Facilities and Servicestr	footer_about	1	1	facility
18	Quality Policy	Quality Policygr	Quality Policyru	Quality Policytr	footer_about	1	1	policy
22	Blog	Bloggr	Blogru	Blogtr	footer_about	1	0	blogs
1	Doctors	Doctorsgeor	Doctorsrus	Doctorstr	header	1	0	doctors
5	Contact	Contactgr	Contactru	Contacttr	header	1	1	contact
21	Policies and Rights	Policies and Rightsgr	Policies and Rightsru	Policies and Rightstr	footer_about	1	1	policy
19	Management team	Management teamgr	Management teamru	Management teamtr	footer_about	1	1	members
7	E – Result	E – Resultgr	E – Resultru	E – Resulttr	footer_online	1	1	e-result
12	Ask to us	Ask to usgr	Ask to usru	Ask to ustr	footer_online	1	1	ask_to_us
8	E – Thanks	E – Thanksgr	E – Thanksru	E – Thankstr	footer_online	1	1	e-thanks
9	E – Get well soon	E – Get well soongr	E – Get well soonru	E – Get well soontr	footer_online	1	1	e-getwell
11	E – Suggestion	E – Suggestiongr	E – Suggestionru	E – Suggestiontr	footer_online	1	1	e-suggestion
10	E – Complaint	E – Complaintgr	E – Complaintru	E – Complainttr	footer_online	1	1	e-complaint
23	Write to managment	Write to managmentgr	Write to managmentru	Write to managmenttr	footer_online	1	0	write_to_managment
2	Departments	Departmentsgr	Departmentsru	Departmentstr	header	1	0	departments
\.


--
-- Name: americanhospital_app_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_menu_id_seq', 1, false);


--
-- Data for Name: americanhospital_app_message; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_message (id, text, full_name, email, subject, created_at) FROM stdin;
3	dhdfhdfhdfhfdhd	Zaur Ibrahimov	zibrahimov95@gmail.com	complaint	2019-12-18 08:17:16.966108+00
1	salam	Zaur Ibrahimov	zibrahimov95@gmail.com	complaint	2019-12-06 17:42:59.427485+00
2	gngm	Zaur Ibrahimov	zibrahimov95@gmail.com	complaint	2019-12-11 16:18:46.194319+00
4	vmhmv	Zaur Ibrahimov	zibrahimov95@gmail.com	suggestion	2019-12-18 08:19:17.330558+00
5	bgvbbv	Zaur Ibrahimov	zibrahimov95@gmail.com	contact	2019-12-18 08:48:12.613471+00
38	xvbcbf	Zaur Ibrahimov	zibrahimov95@gmail.com	contact	2019-12-19 05:40:42.428315+00
\.


--
-- Name: americanhospital_app_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_message_id_seq', 38, true);


--
-- Data for Name: americanhospital_app_result; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_result (id, full_name, email, created_at) FROM stdin;
1	Zaur Ibrahimov	zibrahimov95@gmail.com	2019-12-18 16:10:02.715505+00
\.


--
-- Name: americanhospital_app_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_result_id_seq', 33, true);


--
-- Data for Name: americanhospital_app_resume; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_resume (id, resume, full_name, email, created_at) FROM stdin;
1	image/upload/v1576515715/nn4wo6vxsaqtt4ncavgy.png	Zaur Ibrahimov	zibrahimov95@gmail.com	2019-12-16 17:01:55.527415+00
2	image/upload/v1576559875/zso7ng5zzssm3ljqfix2.pdf	Zaur Ibrahimov	zaursheki@gmail.com	2019-12-17 05:17:45.262447+00
\.


--
-- Name: americanhospital_app_resume_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_resume_id_seq', 2, true);


--
-- Data for Name: americanhospital_app_slider; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_slider (id, image, title_en, title_gr, title_ru, title_tr, text_en, text_gr, text_ru, text_tr, status, created_at, menu_id) FROM stdin;
1	image/upload/v1575728737/rqzwpija720rrfevogbu.png	fgfken	jkbvkdjjvbsdl	bfsjkd	bfsdjk	fbsjkb	bfgkjb	jkgbkj	jbgerk	1	2019-12-07 14:25:29.153356+00	1
2	image/upload/v1576048492/xodxwqcjtyi2yfrs1zlg.png	dsgjh	jhdvgkhh	jvdkj	jbvkdj	jjbfkvjdbqlknfegjlbq	jbdljdsb	bje	bgerj	1	2019-12-11 07:14:48.642031+00	20
\.


--
-- Name: americanhospital_app_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_slider_id_seq', 2, true);


--
-- Data for Name: americanhospital_app_socialmedia; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_socialmedia (id, icon, link, status) FROM stdin;
3	fab fa-linkedin	https://linkedin.com/	1
4	fab fa-youtube	https://youtube.com/	1
2	fab fa-twitter	https://twitter.com/	1
1	fab fa-facebook	https://facebook.com/	1
\.


--
-- Name: americanhospital_app_socialmedia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_socialmedia_id_seq', 33, true);


--
-- Data for Name: americanhospital_app_submenu; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_submenu (id, title_en, title_gr, title_ru, title_tr, link, status, menu_id) FROM stdin;
9	Send CV	Send CVgr	Send CV	Send CV	send_cv	1	4
11	Contact info	Contact info	Contact info	Contact info	contact	1	5
8	About us	About us	About us	About us	about/introduction	1	4
12	Ask to doctor	Ask to doctor	Ask to doctor	Ask to doctor	ask_to_doctor	1	5
2	E – Result	E – Result	E – Result	E – Result	e-result	1	3
7	Ask to us	Ask to us	Ask to us	Ask to us	contact	1	3
3	E – Thanks	E – Thanks	E – Thanks	E – Thanks	e-thanks	1	3
4	E – Get well soon	E – Get well soon	E – Get well soon	E – Get well soon	e-getwell	1	3
6	E – Suggestion	E – Suggestion	E – Suggestion	E – Suggestion	e-suggestion	1	3
5	E – Complaint	E – Complaint	E – Complaint	E – Complaint	e-complaint	1	3
\.


--
-- Name: americanhospital_app_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_submenu_id_seq', 1, false);


--
-- Data for Name: americanhospital_app_team; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_team (id, image, full_name_en, full_name_gr, full_name_ru, full_name_tr, profession_en, profession_gr, profession_ru, profession_tr, description_en, description_gr, description_ru, description_tr, status, created_at) FROM stdin;
1	image/upload/v1575965361/a9lflebrcs3fbjkfom48.png	eeee	jkfbk	jbkvfj	jgbjqbjdfqb1	dsflknv	dflj	glj	dsgdf	<p>dhdfdf</p>	<p>fdndfndf</p>	<p>dsbxcbcnmf</p>	<p>gfhjlukthsr</p>	1	2019-12-10 08:09:19.85561+00
\.


--
-- Name: americanhospital_app_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_team_id_seq', 1, true);


--
-- Data for Name: americanhospital_app_thank; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY americanhospital_app_thank (id, full_name, to_whom, text, created_at) FROM stdin;
1	Zaur Ibrahimov	JAck	dhggdhghddhfdhfhdfdhfdfhhfdfhdfhdhfdhfhfddhf	2019-12-18 07:12:43.711482+00
\.


--
-- Name: americanhospital_app_thank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('americanhospital_app_thank_id_seq', 33, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add flat page	7	add_flatpage
20	Can change flat page	7	change_flatpage
21	Can delete flat page	7	delete_flatpage
22	Can add task result	8	add_taskresult
23	Can change task result	8	change_taskresult
24	Can delete task result	8	delete_taskresult
25	Can add periodic tasks	9	add_periodictasks
26	Can change periodic tasks	9	change_periodictasks
27	Can delete periodic tasks	9	delete_periodictasks
28	Can add crontab	10	add_crontabschedule
29	Can change crontab	10	change_crontabschedule
30	Can delete crontab	10	delete_crontabschedule
31	Can add solar event	11	add_solarschedule
32	Can change solar event	11	change_solarschedule
33	Can delete solar event	11	delete_solarschedule
34	Can add interval	12	add_intervalschedule
35	Can change interval	12	change_intervalschedule
36	Can delete interval	12	delete_intervalschedule
37	Can add periodic task	13	add_periodictask
38	Can change periodic task	13	change_periodictask
39	Can delete periodic task	13	delete_periodictask
40	Can add İstifadəçi	14	add_myuser
41	Can change İstifadəçi	14	change_myuser
42	Can delete İstifadəçi	14	delete_myuser
43	Can add admin	15	add_admin
44	Can change admin	15	change_admin
45	Can delete admin	15	delete_admin
76	Can add doctor	48	add_doctor
77	Can change doctor	48	change_doctor
78	Can delete doctor	48	delete_doctor
79	Can add blog	49	add_blog
80	Can change blog	49	change_blog
81	Can delete blog	49	delete_blog
82	Can add slider	50	add_slider
83	Can change slider	50	change_slider
84	Can delete slider	50	delete_slider
115	Can add contact	83	add_contact
116	Can change contact	83	change_contact
117	Can delete contact	83	delete_contact
148	Can add message	116	add_message
149	Can change message	116	change_message
150	Can delete message	116	delete_message
151	Can add sub menu	117	add_submenu
152	Can change sub menu	117	change_submenu
153	Can delete sub menu	117	delete_submenu
154	Can add menu	118	add_menu
155	Can change menu	118	change_menu
156	Can delete menu	118	delete_menu
157	Can add social media	119	add_socialmedia
158	Can change social media	119	change_socialmedia
159	Can delete social media	119	delete_socialmedia
160	Can add about	120	add_about
161	Can change about	120	change_about
162	Can delete about	120	delete_about
163	Can add introduction	121	add_introduction
164	Can change introduction	121	change_introduction
165	Can delete introduction	121	delete_introduction
196	Can add history	154	add_history
197	Can change history	154	change_history
198	Can delete history	154	delete_history
229	Can add television	187	add_television
230	Can change television	187	change_television
231	Can delete television	187	delete_television
232	Can add mission	188	add_mission
233	Can change mission	188	change_mission
234	Can delete mission	188	delete_mission
235	Can add vision	189	add_vision
236	Can change vision	189	change_vision
237	Can delete vision	189	delete_vision
238	Can add quality policy	190	add_qualitypolicy
239	Can change quality policy	190	change_qualitypolicy
240	Can delete quality policy	190	delete_qualitypolicy
271	Can add facility	223	add_facility
272	Can change facility	223	change_facility
273	Can delete facility	223	delete_facility
274	Can add policy	224	add_policy
275	Can change policy	224	change_policy
276	Can delete policy	224	delete_policy
307	Can add team	257	add_team
308	Can change team	257	change_team
309	Can delete team	257	delete_team
340	Can add appointment	290	add_appointment
341	Can change appointment	290	change_appointment
342	Can delete appointment	290	delete_appointment
343	Can add department	291	add_department
344	Can change department	291	change_department
345	Can delete department	291	delete_department
346	Can add resume	292	add_resume
347	Can change resume	292	change_resume
348	Can delete resume	292	delete_resume
349	Can add doctor question	293	add_doctorquestion
350	Can change doctor question	293	change_doctorquestion
351	Can delete doctor question	293	delete_doctorquestion
382	Can add thank	326	add_thank
383	Can change thank	326	change_thank
384	Can delete thank	326	delete_thank
415	Can add get well	359	add_getwell
416	Can change get well	359	change_getwell
417	Can delete get well	359	delete_getwell
418	Can add result	360	add_result
419	Can change result	360	change_result
420	Can delete result	360	delete_result
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('auth_permission_id_seq', 450, true);


--
-- Data for Name: base_user_myuser; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY base_user_myuser (id, password, last_login, is_superuser, username, first_name, last_name, email, profile_picture, gender, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: base_user_myuser_groups; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY base_user_myuser_groups (id, myuser_id, group_id) FROM stdin;
\.


--
-- Name: base_user_myuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('base_user_myuser_groups_id_seq', 1, false);


--
-- Name: base_user_myuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('base_user_myuser_id_seq', 1, false);


--
-- Data for Name: base_user_myuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY base_user_myuser_user_permissions (id, myuser_id, permission_id) FROM stdin;
\.


--
-- Name: base_user_myuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('base_user_myuser_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year) FROM stdin;
1	0	4	*	*	*
\.


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_celery_beat_crontabschedule_id_seq', 1, true);


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id) FROM stdin;
1	celery.backend_cleanup	celery.backend_cleanup	[]	{}	\N	\N	\N	\N	t	\N	0	2019-12-27 14:47:32.875707+00		1	\N	\N
\.


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_celery_beat_periodictask_id_seq', 1, true);


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_celery_beat_periodictasks (ident, last_update) FROM stdin;
1	2019-12-27 14:47:32.868466+00
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_celery_results_taskresult_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	flatpages	flatpage
8	django_celery_results	taskresult
9	django_celery_beat	periodictasks
10	django_celery_beat	crontabschedule
11	django_celery_beat	solarschedule
12	django_celery_beat	intervalschedule
13	django_celery_beat	periodictask
14	base_user	myuser
15	americanhospital_app	admin
48	americanhospital_app	doctor
49	americanhospital_app	blog
50	americanhospital_app	slider
83	americanhospital_app	contact
116	americanhospital_app	message
117	americanhospital_app	submenu
118	americanhospital_app	menu
119	americanhospital_app	socialmedia
120	americanhospital_app	about
121	americanhospital_app	introduction
154	americanhospital_app	history
187	americanhospital_app	television
188	americanhospital_app	mission
189	americanhospital_app	vision
190	americanhospital_app	qualitypolicy
223	americanhospital_app	facility
224	americanhospital_app	policy
257	americanhospital_app	team
290	americanhospital_app	appointment
291	americanhospital_app	department
292	americanhospital_app	resume
293	americanhospital_app	doctorquestion
326	americanhospital_app	thank
359	americanhospital_app	getwell
360	americanhospital_app	result
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_content_type_id_seq', 392, true);


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
\.


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_flatpage_id_seq', 1, false);


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
\.


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 1, false);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-11-01 15:46:15.153705+00
2	contenttypes	0002_remove_content_type_name	2019-11-01 15:46:15.196137+00
3	auth	0001_initial	2019-11-01 15:46:15.350358+00
4	auth	0002_alter_permission_name_max_length	2019-11-01 15:46:15.383263+00
5	auth	0003_alter_user_email_max_length	2019-11-01 15:46:15.397152+00
6	auth	0004_alter_user_username_opts	2019-11-01 15:46:15.409881+00
7	auth	0005_alter_user_last_login_null	2019-11-01 15:46:15.422947+00
8	auth	0006_require_contenttypes_0002	2019-11-01 15:46:15.428086+00
9	auth	0007_alter_validators_add_error_messages	2019-11-01 15:46:15.440224+00
10	auth	0008_alter_user_username_max_length	2019-11-01 15:46:15.453369+00
11	auth	0009_alter_user_last_name_max_length	2019-11-01 15:46:15.467944+00
12	base_user	0001_initial	2019-11-01 15:46:15.649937+00
13	admin	0001_initial	2019-11-01 15:46:15.758713+00
14	admin	0002_logentry_remove_auto_add	2019-11-01 15:46:15.785511+00
15	django_celery_beat	0001_initial	2019-11-01 15:46:15.987803+00
16	django_celery_beat	0002_auto_20161118_0346	2019-11-01 15:46:16.081489+00
17	django_celery_beat	0003_auto_20161209_0049	2019-11-01 15:46:16.135281+00
18	django_celery_beat	0004_auto_20170221_0000	2019-11-01 15:46:16.172651+00
19	django_celery_beat	0005_add_solarschedule_events_choices	2019-11-01 15:46:16.195625+00
20	django_celery_beat	0006_auto_20180210_1226	2019-11-01 15:46:16.260033+00
21	django_celery_results	0001_initial	2019-11-01 15:46:16.346898+00
22	sites	0001_initial	2019-11-01 15:46:16.387443+00
23	flatpages	0001_initial	2019-11-01 15:46:16.547646+00
24	sessions	0001_initial	2019-11-01 15:46:16.62045+00
25	sites	0002_alter_domain_unique	2019-11-01 15:46:16.685953+00
197	americanhospital_app	0001_initial	2019-12-09 06:39:39.485254+00
230	americanhospital_app	0002_auto_20191209_1301	2019-12-09 09:01:19.702446+00
263	americanhospital_app	0003_socialmedia	2019-12-09 09:04:45.034965+00
264	americanhospital_app	0004_auto_20191209_1711	2019-12-09 13:11:57.630612+00
265	americanhospital_app	0005_menu	2019-12-09 13:39:50.714423+00
266	americanhospital_app	0006_about	2019-12-09 17:18:02.475063+00
267	americanhospital_app	0007_introduction	2019-12-09 17:37:07.100332+00
300	americanhospital_app	0008_history	2019-12-09 17:49:08.790318+00
333	americanhospital_app	0009_television	2019-12-10 05:15:39.012521+00
334	americanhospital_app	0010_mission	2019-12-10 05:39:41.314244+00
335	americanhospital_app	0011_vision	2019-12-10 06:29:13.548631+00
336	americanhospital_app	0012_qualitypolicy	2019-12-10 07:10:00.114137+00
369	americanhospital_app	0013_facility	2019-12-10 07:32:38.415085+00
370	americanhospital_app	0014_policy	2019-12-10 07:55:33.303145+00
403	americanhospital_app	0015_team	2019-12-10 08:01:49.142766+00
436	americanhospital_app	0016_delete_menu	2019-12-11 08:22:18.378033+00
437	americanhospital_app	0017_menu	2019-12-12 08:37:04.149353+00
438	americanhospital_app	0018_menu_has_submenu	2019-12-13 06:12:45.36188+00
439	americanhospital_app	0019_about_page_type	2019-12-13 11:28:31.23536+00
440	americanhospital_app	0020_delete_introduction	2019-12-13 11:42:51.099743+00
473	americanhospital_app	0021_delete_history	2019-12-13 12:03:45.834249+00
506	americanhospital_app	0022_delete_television	2019-12-13 12:09:40.868804+00
507	americanhospital_app	0023_delete_mission	2019-12-13 12:20:37.036401+00
540	americanhospital_app	0024_delete_vision	2019-12-13 12:29:01.054796+00
573	americanhospital_app	0025_delete_qualitypolicy	2019-12-13 12:32:40.128834+00
606	americanhospital_app	0026_auto_20191213_1647	2019-12-13 12:47:57.46058+00
639	americanhospital_app	0027_auto_20191213_1652	2019-12-13 12:52:55.628594+00
672	americanhospital_app	0028_menu_sub_menu	2019-12-13 12:56:31.489941+00
673	americanhospital_app	0029_auto_20191213_1711	2019-12-13 13:11:31.551411+00
674	americanhospital_app	0030_appointment	2019-12-16 07:49:12.633014+00
675	americanhospital_app	0031_auto_20191216_1220	2019-12-16 08:20:22.938692+00
708	americanhospital_app	0032_auto_20191216_1611	2019-12-16 12:11:17.0099+00
709	americanhospital_app	0033_department	2019-12-16 13:38:49.437412+00
710	americanhospital_app	0034_auto_20191216_1759	2019-12-16 14:00:00.70187+00
743	americanhospital_app	0035_resume	2019-12-16 16:54:37.650794+00
744	americanhospital_app	0036_doctorquestion	2019-12-17 07:11:56.444911+00
777	americanhospital_app	0037_thank	2019-12-18 07:11:02.963104+00
810	americanhospital_app	0038_getwell	2019-12-18 07:16:29.948639+00
811	americanhospital_app	0039_result	2019-12-18 16:02:48.57434+00
844	americanhospital_app	0040_auto_20191219_1735	2019-12-19 13:35:10.228945+00
877	americanhospital_app	0041_auto_20191219_1736	2019-12-19 13:36:13.749735+00
910	americanhospital_app	0042_slider_menu	2019-12-21 09:15:01.694781+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_migrations_id_seq', 942, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
0d5jnc4n4pnsdpkhjhgfwtd6vu34a9bv	YWQxN2FhYWVhZGRkZmI2YzJjMWY0NTgwMzgyNWRhNGY5ZDk4ODdjNjp7ImFkbWluX2lkIjoxfQ==	2019-12-21 16:33:15.900987+00
oqfss7m6oeom9c4p4lgflkzwkdf6oed8	ZjM1ZmEyZWE2YThkZmM0YzQwNWE4OTNhNmE3MzA5ZmUxYjdhMjEwNjp7fQ==	2019-12-24 08:41:38.221438+00
jmv288arsco8ai7jcak7crg5nrnzrvj1	ZGE0MDU2Yjg5YjU1YWJmYWZiNDJkZDM1ZTIxZGVkMGIzMzhlYmNjNjp7ImFkbWluX2lkIjoxLCJsYW5nIjoiZW4ifQ==	2020-01-04 09:20:19.114067+00
mlam9pzmxf1zndpb5tsxcok6e1f1p4lm	NTIxODIyYTA5YzQ4NmNmNDU5ZDRkYjk3ZDc1YzhkYjAxNzczNDcyYjp7ImxhbmciOiJlbiJ9	2020-01-05 09:00:59.486326+00
skgcq6x8vtosm0ow3p71w0l0htl37yzn	ZjM1ZmEyZWE2YThkZmM0YzQwNWE4OTNhNmE3MzA5ZmUxYjdhMjEwNjp7fQ==	2020-01-09 20:16:12.792358+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: americanhospital
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: americanhospital
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: americanhospital_app_about americanhospital_app_about_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_about
    ADD CONSTRAINT americanhospital_app_about_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_admin americanhospital_app_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_admin
    ADD CONSTRAINT americanhospital_app_admin_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_appointment americanhospital_app_appointment_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_appointment
    ADD CONSTRAINT americanhospital_app_appointment_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_blog americanhospital_app_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_blog
    ADD CONSTRAINT americanhospital_app_blog_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_contact americanhospital_app_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_contact
    ADD CONSTRAINT americanhospital_app_contact_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_department americanhospital_app_department_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_department
    ADD CONSTRAINT americanhospital_app_department_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_doctor americanhospital_app_doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_doctor
    ADD CONSTRAINT americanhospital_app_doctor_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_doctorquestion americanhospital_app_doctorquestion_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_doctorquestion
    ADD CONSTRAINT americanhospital_app_doctorquestion_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_getwell americanhospital_app_getwell_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_getwell
    ADD CONSTRAINT americanhospital_app_getwell_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_menu americanhospital_app_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_menu
    ADD CONSTRAINT americanhospital_app_menu_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_message americanhospital_app_message_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_message
    ADD CONSTRAINT americanhospital_app_message_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_result americanhospital_app_result_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_result
    ADD CONSTRAINT americanhospital_app_result_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_resume americanhospital_app_resume_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_resume
    ADD CONSTRAINT americanhospital_app_resume_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_slider americanhospital_app_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_slider
    ADD CONSTRAINT americanhospital_app_slider_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_socialmedia americanhospital_app_socialmedia_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_socialmedia
    ADD CONSTRAINT americanhospital_app_socialmedia_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_submenu americanhospital_app_submenu_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_submenu
    ADD CONSTRAINT americanhospital_app_submenu_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_team americanhospital_app_team_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_team
    ADD CONSTRAINT americanhospital_app_team_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_thank americanhospital_app_thank_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_thank
    ADD CONSTRAINT americanhospital_app_thank_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: base_user_myuser_groups base_user_myuser_groups_myuser_id_group_id_83a07e94_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_groups
    ADD CONSTRAINT base_user_myuser_groups_myuser_id_group_id_83a07e94_uniq UNIQUE (myuser_id, group_id);


--
-- Name: base_user_myuser_groups base_user_myuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_groups
    ADD CONSTRAINT base_user_myuser_groups_pkey PRIMARY KEY (id);


--
-- Name: base_user_myuser base_user_myuser_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser
    ADD CONSTRAINT base_user_myuser_pkey PRIMARY KEY (id);


--
-- Name: base_user_myuser_user_permissions base_user_myuser_user_pe_myuser_id_permission_id_85ee0956_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_user_permissions
    ADD CONSTRAINT base_user_myuser_user_pe_myuser_id_permission_id_85ee0956_uniq UNIQUE (myuser_id, permission_id);


--
-- Name: base_user_myuser_user_permissions base_user_myuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_user_permissions
    ADD CONSTRAINT base_user_myuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: base_user_myuser base_user_myuser_username_key; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser
    ADD CONSTRAINT base_user_myuser_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: americanhospital_app_appointment_doctor_id_cb434c2e; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX americanhospital_app_appointment_doctor_id_cb434c2e ON americanhospital_app_appointment USING btree (doctor_id);


--
-- Name: americanhospital_app_doctorquestion_doctor_id_d7d0f4b6; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX americanhospital_app_doctorquestion_doctor_id_d7d0f4b6 ON americanhospital_app_doctorquestion USING btree (doctor_id);


--
-- Name: americanhospital_app_slider_menu_id_ccf07e55; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX americanhospital_app_slider_menu_id_ccf07e55 ON americanhospital_app_slider USING btree (menu_id);


--
-- Name: americanhospital_app_submenu_menu_id_9233af0e; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX americanhospital_app_submenu_menu_id_9233af0e ON americanhospital_app_submenu USING btree (menu_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: base_user_myuser_groups_group_id_ac6efcd5; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX base_user_myuser_groups_group_id_ac6efcd5 ON base_user_myuser_groups USING btree (group_id);


--
-- Name: base_user_myuser_groups_myuser_id_28b31ef4; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX base_user_myuser_groups_myuser_id_28b31ef4 ON base_user_myuser_groups USING btree (myuser_id);


--
-- Name: base_user_myuser_user_permissions_myuser_id_8e8dba13; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX base_user_myuser_user_permissions_myuser_id_8e8dba13 ON base_user_myuser_user_permissions USING btree (myuser_id);


--
-- Name: base_user_myuser_user_permissions_permission_id_43fe495d; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX base_user_myuser_user_permissions_permission_id_43fe495d ON base_user_myuser_user_permissions USING btree (permission_id);


--
-- Name: base_user_myuser_username_81b4405d_like; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX base_user_myuser_username_81b4405d_like ON base_user_myuser USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_celery_results_taskresult_hidden_cd77412f; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_celery_results_taskresult_hidden_cd77412f ON django_celery_results_taskresult USING btree (hidden);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


--
-- Name: django_flatpage_sites_flatpage_id_078bbc8b; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_flatpage_sites_flatpage_id_078bbc8b ON django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id_bfd8ea84; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_flatpage_sites_site_id_bfd8ea84 ON django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url_41612362; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_flatpage_url_41612362 ON django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_flatpage_url_41612362_like ON django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: americanhospital
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: americanhospital_app_appointment americanhospital_app_doctor_id_cb434c2e_fk_americanh; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_appointment
    ADD CONSTRAINT americanhospital_app_doctor_id_cb434c2e_fk_americanh FOREIGN KEY (doctor_id) REFERENCES americanhospital_app_doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: americanhospital_app_doctorquestion americanhospital_app_doctor_id_d7d0f4b6_fk_americanh; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_doctorquestion
    ADD CONSTRAINT americanhospital_app_doctor_id_d7d0f4b6_fk_americanh FOREIGN KEY (doctor_id) REFERENCES americanhospital_app_doctor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: americanhospital_app_submenu americanhospital_app_menu_id_9233af0e_fk_americanh; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_submenu
    ADD CONSTRAINT americanhospital_app_menu_id_9233af0e_fk_americanh FOREIGN KEY (menu_id) REFERENCES americanhospital_app_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: americanhospital_app_slider americanhospital_app_menu_id_ccf07e55_fk_americanh; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY americanhospital_app_slider
    ADD CONSTRAINT americanhospital_app_menu_id_ccf07e55_fk_americanh FOREIGN KEY (menu_id) REFERENCES americanhospital_app_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_user_myuser_groups base_user_myuser_gro_myuser_id_28b31ef4_fk_base_user; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_groups
    ADD CONSTRAINT base_user_myuser_gro_myuser_id_28b31ef4_fk_base_user FOREIGN KEY (myuser_id) REFERENCES base_user_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_user_myuser_groups base_user_myuser_groups_group_id_ac6efcd5_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_groups
    ADD CONSTRAINT base_user_myuser_groups_group_id_ac6efcd5_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_user_myuser_user_permissions base_user_myuser_use_myuser_id_8e8dba13_fk_base_user; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_user_permissions
    ADD CONSTRAINT base_user_myuser_use_myuser_id_8e8dba13_fk_base_user FOREIGN KEY (myuser_id) REFERENCES base_user_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_user_myuser_user_permissions base_user_myuser_use_permission_id_43fe495d_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY base_user_myuser_user_permissions
    ADD CONSTRAINT base_user_myuser_use_permission_id_43fe495d_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_base_user_myuser_id; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_base_user_myuser_id FOREIGN KEY (user_id) REFERENCES base_user_myuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: americanhospital
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

