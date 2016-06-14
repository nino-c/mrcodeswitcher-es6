--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ninopq;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ninopq;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ninopq;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ninopq;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ninopq;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ninopq;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtools_user; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE authtools_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(255) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authtools_user OWNER TO ninopq;

--
-- Name: authtools_user_groups; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE authtools_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.authtools_user_groups OWNER TO ninopq;

--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE authtools_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_groups_id_seq OWNER TO ninopq;

--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE authtools_user_groups_id_seq OWNED BY authtools_user_groups.id;


--
-- Name: authtools_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE authtools_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_id_seq OWNER TO ninopq;

--
-- Name: authtools_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE authtools_user_id_seq OWNED BY authtools_user.id;


--
-- Name: authtools_user_user_permissions; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE authtools_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authtools_user_user_permissions OWNER TO ninopq;

--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE authtools_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authtools_user_user_permissions_id_seq OWNER TO ninopq;

--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE authtools_user_user_permissions_id_seq OWNED BY authtools_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
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


ALTER TABLE public.django_admin_log OWNER TO ninopq;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ninopq;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ninopq;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ninopq;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ninopq;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ninopq;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ninopq;

--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO ninopq;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO ninopq;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO ninopq;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: game_category; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_category (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    description text,
    image character varying(100),
    enabled boolean NOT NULL,
    popularity integer NOT NULL,
    parent_id integer
);


ALTER TABLE public.game_category OWNER TO ninopq;

--
-- Name: game_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_category_id_seq OWNER TO ninopq;

--
-- Name: game_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_category_id_seq OWNED BY game_category.id;


--
-- Name: game_codemodule; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_codemodule (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(255),
    language character varying(20) NOT NULL,
    source text NOT NULL
);


ALTER TABLE public.game_codemodule OWNER TO ninopq;

--
-- Name: game_codemodule_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_codemodule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_codemodule_id_seq OWNER TO ninopq;

--
-- Name: game_codemodule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_codemodule_id_seq OWNED BY game_codemodule.id;


--
-- Name: game_codeswitchingphrase; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_codeswitchingphrase (
    id integer NOT NULL,
    phrase text NOT NULL,
    popularity integer NOT NULL
);


ALTER TABLE public.game_codeswitchingphrase OWNER TO ninopq;

--
-- Name: game_codeswitchingphrase_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_codeswitchingphrase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_codeswitchingphrase_id_seq OWNER TO ninopq;

--
-- Name: game_codeswitchingphrase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_codeswitchingphrase_id_seq OWNED BY game_codeswitchingphrase.id;


--
-- Name: game_gameinstance; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_gameinstance (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    seed text NOT NULL,
    popularity integer NOT NULL,
    vector character varying(5000),
    game_id integer NOT NULL,
    instantiator_id integer NOT NULL
);


ALTER TABLE public.game_gameinstance OWNER TO ninopq;

--
-- Name: game_gameinstance_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_gameinstance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_gameinstance_id_seq OWNER TO ninopq;

--
-- Name: game_gameinstance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_gameinstance_id_seq OWNED BY game_gameinstance.id;


--
-- Name: game_gameinstance_seedParams; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE "game_gameinstance_seedParams" (
    id integer NOT NULL,
    gameinstance_id integer NOT NULL,
    seedkeyval_id integer NOT NULL
);


ALTER TABLE public."game_gameinstance_seedParams" OWNER TO ninopq;

--
-- Name: game_gameinstance_seedParams_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE "game_gameinstance_seedParams_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."game_gameinstance_seedParams_id_seq" OWNER TO ninopq;

--
-- Name: game_gameinstance_seedParams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE "game_gameinstance_seedParams_id_seq" OWNED BY "game_gameinstance_seedParams".id;


--
-- Name: game_gameinstancesnapshot; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_gameinstancesnapshot (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    image character varying(100) NOT NULL,
    "time" double precision NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE public.game_gameinstancesnapshot OWNER TO ninopq;

--
-- Name: game_gameinstancesnapshot_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_gameinstancesnapshot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_gameinstancesnapshot_id_seq OWNER TO ninopq;

--
-- Name: game_gameinstancesnapshot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_gameinstancesnapshot_id_seq OWNED BY game_gameinstancesnapshot.id;


--
-- Name: game_jslibrary; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_jslibrary (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    "scriptPath" character varying(200) NOT NULL
);


ALTER TABLE public.game_jslibrary OWNER TO ninopq;

--
-- Name: game_jslibrary_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_jslibrary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_jslibrary_id_seq OWNER TO ninopq;

--
-- Name: game_jslibrary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_jslibrary_id_seq OWNED BY game_jslibrary.id;


--
-- Name: game_zeroplayergame; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_zeroplayergame (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(500) NOT NULL,
    description text NOT NULL,
    "scriptType" character varying(100),
    source text NOT NULL,
    "seedStructure" text NOT NULL,
    "mainImage" character varying(255),
    popularity integer NOT NULL,
    category_id integer NOT NULL,
    owner_id integer NOT NULL,
    parent_id integer,
    subtitle character varying(500)
);


ALTER TABLE public.game_zeroplayergame OWNER TO ninopq;

--
-- Name: game_plerpingapp_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_plerpingapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_plerpingapp_id_seq OWNER TO ninopq;

--
-- Name: game_plerpingapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_plerpingapp_id_seq OWNED BY game_zeroplayergame.id;


--
-- Name: game_savedfunction; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_savedfunction (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    title character varying(255),
    language character varying(20) NOT NULL,
    source text NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.game_savedfunction OWNER TO ninopq;

--
-- Name: game_savedfunction_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_savedfunction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_savedfunction_id_seq OWNER TO ninopq;

--
-- Name: game_savedfunction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_savedfunction_id_seq OWNED BY game_savedfunction.id;


--
-- Name: game_seedvectorparam; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_seedvectorparam (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    val character varying(5000),
    int_val integer,
    valtype character varying(25) NOT NULL,
    jsonval text NOT NULL,
    ordering integer NOT NULL,
    instance_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.game_seedvectorparam OWNER TO ninopq;

--
-- Name: game_seedvectorparam_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_seedvectorparam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_seedvectorparam_id_seq OWNER TO ninopq;

--
-- Name: game_seedvectorparam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_seedvectorparam_id_seq OWNED BY game_seedvectorparam.id;


--
-- Name: game_zeroplayergame_extraIncludes; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE "game_zeroplayergame_extraIncludes" (
    id integer NOT NULL,
    zeroplayergame_id integer NOT NULL,
    jslibrary_id integer NOT NULL
);


ALTER TABLE public."game_zeroplayergame_extraIncludes" OWNER TO ninopq;

--
-- Name: game_zeroplayergame_extraIncludes_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE "game_zeroplayergame_extraIncludes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."game_zeroplayergame_extraIncludes_id_seq" OWNER TO ninopq;

--
-- Name: game_zeroplayergame_extraIncludes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE "game_zeroplayergame_extraIncludes_id_seq" OWNED BY "game_zeroplayergame_extraIncludes".id;


--
-- Name: game_zeroplayergame_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_zeroplayergame_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_zeroplayergame_id_seq OWNER TO ninopq;

--
-- Name: game_zeroplayergame_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_zeroplayergame_id_seq OWNED BY game_zeroplayergame.id;


--
-- Name: game_zeroplayergame_required_modules; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE game_zeroplayergame_required_modules (
    id integer NOT NULL,
    zeroplayergame_id integer NOT NULL,
    codemodule_id integer NOT NULL
);


ALTER TABLE public.game_zeroplayergame_required_modules OWNER TO ninopq;

--
-- Name: game_zeroplayergame_required_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE game_zeroplayergame_required_modules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_zeroplayergame_required_modules_id_seq OWNER TO ninopq;

--
-- Name: game_zeroplayergame_required_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE game_zeroplayergame_required_modules_id_seq OWNED BY game_zeroplayergame_required_modules.id;


--
-- Name: portfolio_imagegallery; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_imagegallery (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.portfolio_imagegallery OWNER TO ninopq;

--
-- Name: portfolio_imagegallery_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_imagegallery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_imagegallery_id_seq OWNER TO ninopq;

--
-- Name: portfolio_imagegallery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_imagegallery_id_seq OWNED BY portfolio_imagegallery.id;


--
-- Name: portfolio_imagemodel; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_imagemodel (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    gallery_id integer
);


ALTER TABLE public.portfolio_imagemodel OWNER TO ninopq;

--
-- Name: portfolio_imagemodel_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_imagemodel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_imagemodel_id_seq OWNER TO ninopq;

--
-- Name: portfolio_imagemodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_imagemodel_id_seq OWNED BY portfolio_imagemodel.id;


--
-- Name: portfolio_portfoliocategory; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_portfoliocategory (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    image character varying(100)
);


ALTER TABLE public.portfolio_portfoliocategory OWNER TO ninopq;

--
-- Name: portfolio_portfoliocategory_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_portfoliocategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_portfoliocategory_id_seq OWNER TO ninopq;

--
-- Name: portfolio_portfoliocategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_portfoliocategory_id_seq OWNED BY portfolio_portfoliocategory.id;


--
-- Name: portfolio_portfolioitem; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_portfolioitem (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    subtitle character varying(500) NOT NULL,
    url character varying(150),
    description text NOT NULL,
    sourcecode character varying(200),
    image character varying(100),
    creationdate date NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.portfolio_portfolioitem OWNER TO ninopq;

--
-- Name: portfolio_portfolioitem_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE portfolio_portfolioitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.portfolio_portfolioitem_id_seq OWNER TO ninopq;

--
-- Name: portfolio_portfolioitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE portfolio_portfolioitem_id_seq OWNED BY portfolio_portfolioitem.id;


--
-- Name: portfolio_proprietaryportfolioitem; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE portfolio_proprietaryportfolioitem (
    portfolioitem_ptr_id integer NOT NULL,
    company character varying(100) NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE public.portfolio_proprietaryportfolioitem OWNER TO ninopq;

--
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE profiles_profile (
    user_id integer NOT NULL,
    slug uuid NOT NULL,
    picture character varying(100),
    bio character varying(200),
    email_verified boolean NOT NULL
);


ALTER TABLE public.profiles_profile OWNER TO ninopq;

--
-- Name: profiles_profile_followers; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE profiles_profile_followers (
    id integer NOT NULL,
    from_profile_id integer NOT NULL,
    to_profile_id integer NOT NULL
);


ALTER TABLE public.profiles_profile_followers OWNER TO ninopq;

--
-- Name: profiles_profile_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE profiles_profile_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_profile_followers_id_seq OWNER TO ninopq;

--
-- Name: profiles_profile_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE profiles_profile_followers_id_seq OWNED BY profiles_profile_followers.id;


--
-- Name: static_precompiler_dependency; Type: TABLE; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE TABLE static_precompiler_dependency (
    id integer NOT NULL,
    source character varying(255) NOT NULL,
    depends_on character varying(255) NOT NULL
);


ALTER TABLE public.static_precompiler_dependency OWNER TO ninopq;

--
-- Name: static_precompiler_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: ninopq
--

CREATE SEQUENCE static_precompiler_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.static_precompiler_dependency_id_seq OWNER TO ninopq;

--
-- Name: static_precompiler_dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ninopq
--

ALTER SEQUENCE static_precompiler_dependency_id_seq OWNED BY static_precompiler_dependency.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user ALTER COLUMN id SET DEFAULT nextval('authtools_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_groups ALTER COLUMN id SET DEFAULT nextval('authtools_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('authtools_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_category ALTER COLUMN id SET DEFAULT nextval('game_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_codemodule ALTER COLUMN id SET DEFAULT nextval('game_codemodule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_codeswitchingphrase ALTER COLUMN id SET DEFAULT nextval('game_codeswitchingphrase_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstance ALTER COLUMN id SET DEFAULT nextval('game_gameinstance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_gameinstance_seedParams" ALTER COLUMN id SET DEFAULT nextval('"game_gameinstance_seedParams_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstancesnapshot ALTER COLUMN id SET DEFAULT nextval('game_gameinstancesnapshot_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_jslibrary ALTER COLUMN id SET DEFAULT nextval('game_jslibrary_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_savedfunction ALTER COLUMN id SET DEFAULT nextval('game_savedfunction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_seedvectorparam ALTER COLUMN id SET DEFAULT nextval('game_seedvectorparam_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame ALTER COLUMN id SET DEFAULT nextval('game_plerpingapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes" ALTER COLUMN id SET DEFAULT nextval('"game_zeroplayergame_extraIncludes_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame_required_modules ALTER COLUMN id SET DEFAULT nextval('game_zeroplayergame_required_modules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_imagegallery ALTER COLUMN id SET DEFAULT nextval('portfolio_imagegallery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_imagemodel ALTER COLUMN id SET DEFAULT nextval('portfolio_imagemodel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_portfoliocategory ALTER COLUMN id SET DEFAULT nextval('portfolio_portfoliocategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_portfolioitem ALTER COLUMN id SET DEFAULT nextval('portfolio_portfolioitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile_followers ALTER COLUMN id SET DEFAULT nextval('profiles_profile_followers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY static_precompiler_dependency ALTER COLUMN id SET DEFAULT nextval('static_precompiler_dependency_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY auth_group (id, name) FROM stdin;
1	Level 1 user
2	Level 2 user
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	52
2	2	46
3	2	49
4	2	50
5	2	52
6	2	53
7	2	55
8	2	57
9	2	67
10	2	68
11	2	69
12	2	47
13	2	48
14	2	51
15	2	54
16	2	56
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 16, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add log entry	3	add_logentry
8	Can change log entry	3	change_logentry
9	Can delete log entry	3	delete_logentry
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add source	7	add_source
20	Can change source	7	change_source
21	Can delete source	7	delete_source
22	Can add thumbnail	8	add_thumbnail
23	Can change thumbnail	8	change_thumbnail
24	Can delete thumbnail	8	delete_thumbnail
25	Can add thumbnail dimensions	9	add_thumbnaildimensions
26	Can change thumbnail dimensions	9	change_thumbnaildimensions
27	Can delete thumbnail dimensions	9	delete_thumbnaildimensions
28	Can add profile	10	add_profile
29	Can change profile	10	change_profile
30	Can delete profile	10	delete_profile
31	Can add dependency	11	add_dependency
32	Can change dependency	11	change_dependency
33	Can delete dependency	11	delete_dependency
34	Can add portfolio category	12	add_portfoliocategory
35	Can change portfolio category	12	change_portfoliocategory
36	Can delete portfolio category	12	delete_portfoliocategory
37	Can add portfolio item	13	add_portfolioitem
38	Can change portfolio item	13	change_portfolioitem
39	Can delete portfolio item	13	delete_portfolioitem
40	Can add image gallery	14	add_imagegallery
41	Can change image gallery	14	change_imagegallery
42	Can delete image gallery	14	delete_imagegallery
43	Can add image model	15	add_imagemodel
44	Can change image model	15	change_imagemodel
45	Can delete image model	15	delete_imagemodel
46	Can add proprietary portfolio item	16	add_proprietaryportfolioitem
47	Can change proprietary portfolio item	16	change_proprietaryportfolioitem
48	Can delete proprietary portfolio item	16	delete_proprietaryportfolioitem
49	Can add category	17	add_category
50	Can change category	17	change_category
51	Can delete category	17	delete_category
52	Can add js library	18	add_jslibrary
53	Can change js library	18	change_jslibrary
54	Can delete js library	18	delete_jslibrary
55	Can add saved function	19	add_savedfunction
56	Can change saved function	19	change_savedfunction
57	Can delete saved function	19	delete_savedfunction
58	Can add code module	20	add_codemodule
59	Can change code module	20	change_codemodule
60	Can delete code module	20	delete_codemodule
61	Can add zero player game	21	add_zeroplayergame
62	Can change zero player game	21	change_zeroplayergame
63	Can delete zero player game	21	delete_zeroplayergame
64	Can add game instance	22	add_gameinstance
65	Can change game instance	22	change_gameinstance
66	Can delete game instance	22	delete_gameinstance
67	Can add seed vector param	23	add_seedvectorparam
68	Can change seed vector param	23	change_seedvectorparam
69	Can delete seed vector param	23	delete_seedvectorparam
70	Can add game instance snapshot	24	add_gameinstancesnapshot
71	Can change game instance snapshot	24	change_gameinstancesnapshot
72	Can delete game instance snapshot	24	delete_gameinstancesnapshot
100	Can add code switching phrase	34	add_codeswitchingphrase
101	Can change code switching phrase	34	change_codeswitchingphrase
102	Can delete code switching phrase	34	delete_codeswitchingphrase
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('auth_permission_id_seq', 102, true);


--
-- Data for Name: authtools_user; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY authtools_user (id, password, last_login, is_superuser, email, is_staff, is_active, date_joined, name) FROM stdin;
2	pbkdf2_sha256$24000$cf6EYbM5geV5$2drkBTWNRr5BHVkKugLa05ZbvyBvGSo9aob4gCXkgkk=	2016-05-03 04:01:09.804554+00	f	mrcodeswitcher@gmail.com	f	t	2016-04-18 18:57:19.152012+00	Mr. Code-Switcher
1	pbkdf2_sha256$24000$FjBYgpxyCPgp$QyiNe1HT60XGPtKcAaTDnHiLajVkkHo99/2Tit3PFhc=	2016-05-28 05:08:51.662568+00	t	nino.cocchiarella@gmail.com	t	t	2016-01-28 01:45:34.23439+00	Nino P. Cocchiarella
\.


--
-- Data for Name: authtools_user_groups; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY authtools_user_groups (id, user_id, group_id) FROM stdin;
1	1	2
\.


--
-- Name: authtools_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('authtools_user_groups_id_seq', 1, true);


--
-- Name: authtools_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('authtools_user_id_seq', 2, true);


--
-- Data for Name: authtools_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY authtools_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: authtools_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('authtools_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
119	2016-04-27 21:28:20.833863+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	3		21	1
120	2016-04-27 21:30:50.206637+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	3		21	1
121	2016-04-27 21:34:11.632503+00	4	"Multivariate Polynomial Landscape", by Nino P. Cocchiarella	3		21	1
122	2016-05-05 20:23:56.870858+00	1	"Mr. Code-switcher?  You can totally read him like a book... except, he made the title of the book s	1	Added.	34	1
123	2016-05-05 20:24:58.484827+00	2	Mr. Code-switcher :: he who code-switched up-on the word 'code-switching' iteself	1	Added.	34	1
124	2016-05-06 09:23:09.661405+00	36	"Subgroups of additive groups of integers mod(n)", by Nino P. Cocchiarella	2	Changed subtitle, description, source and seedStructure.	21	1
125	2016-05-06 09:23:36.765234+00	36	"Subgroups of additive groups of integers mod(n)", by Nino P. Cocchiarella	2	Changed subtitle.	21	1
126	2016-05-06 09:25:11.920624+00	28	"Fractal Tree Creatures", by Nino P. Cocchiarella	2	Changed subtitle, source and seedStructure.	21	1
127	2016-05-07 06:02:17.425937+00	36	"Subgroups of additive groups of integers mod(n)", by Nino P. Cocchiarella	2	Changed description, source and seedStructure.	21	1
128	2016-05-07 16:07:21.548399+00	36	"Subgroups of additive groups of integers mod(n)", by Nino P. Cocchiarella	2	Changed description.	21	1
129	2016-05-07 23:33:57.572079+00	1	"Mr. Code-switcher?  You can totally read him like a book... except, he made the title of the book t	2	Changed phrase.	34	1
130	2016-05-11 06:20:32.873022+00	39	"Transformations of grid about moving point", by Nino P. Cocchiarella	2	Changed subtitle, description, source and seedStructure.	21	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 130, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	admin	logentry
4	contenttypes	contenttype
5	sessions	session
6	authtools	user
7	easy_thumbnails	source
8	easy_thumbnails	thumbnail
9	easy_thumbnails	thumbnaildimensions
10	profiles	profile
11	static_precompiler	dependency
12	portfolio	portfoliocategory
13	portfolio	portfolioitem
14	portfolio	imagegallery
15	portfolio	imagemodel
16	portfolio	proprietaryportfolioitem
17	game	category
18	game	jslibrary
19	game	savedfunction
20	game	codemodule
21	game	zeroplayergame
22	game	gameinstance
23	game	seedvectorparam
24	game	gameinstancesnapshot
34	game	codeswitchingphrase
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('django_content_type_id_seq', 34, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-04-27 00:17:29.048761+00
2	auth	0001_initial	2016-04-27 00:17:29.500628+00
3	authtools	0001_initial	2016-04-27 00:17:29.984934+00
4	admin	0001_initial	2016-04-27 00:17:30.334997+00
5	admin	0002_logentry_remove_auto_add	2016-04-27 00:17:30.3682+00
6	contenttypes	0002_remove_content_type_name	2016-04-27 00:17:30.434725+00
7	auth	0002_alter_permission_name_max_length	2016-04-27 00:17:30.468183+00
8	auth	0003_alter_user_email_max_length	2016-04-27 00:17:30.535014+00
9	auth	0004_alter_user_username_opts	2016-04-27 00:17:30.560597+00
10	auth	0005_alter_user_last_login_null	2016-04-27 00:17:30.583548+00
11	auth	0006_require_contenttypes_0002	2016-04-27 00:17:30.592967+00
12	auth	0007_alter_validators_add_error_messages	2016-04-27 00:17:30.616318+00
13	authtools	0002_django18	2016-04-27 00:17:30.651031+00
14	authtools	0003_auto_20160323_1057	2016-04-27 00:17:30.751731+00
15	easy_thumbnails	0001_initial	2016-04-27 00:17:31.27741+00
16	easy_thumbnails	0002_thumbnaildimensions	2016-04-27 00:17:31.393849+00
17	game	0001_initial	2016-04-27 00:17:32.841308+00
18	portfolio	0001_initial	2016-04-27 00:17:33.325232+00
19	profiles	0001_initial	2016-04-27 00:17:33.583765+00
20	sessions	0001_initial	2016-04-27 00:17:33.758865+00
21	static_precompiler	0001_initial	2016-04-27 00:17:34.067096+00
69	game	0002_seedvectorparam_app	2016-04-27 22:51:53.634465+00
70	game	0003_auto_20160427_2248	2016-04-27 22:51:53.809644+00
71	game	0004_remove_seedvectorparam_app	2016-04-27 22:51:53.917815+00
72	game	0005_seedvectorparam_app	2016-04-27 22:51:54.009821+00
73	game	0006_auto_20160427_2252	2016-04-27 22:52:28.222327+00
74	game	0007_codeswitchingphrase	2016-05-05 20:21:26.647517+00
75	game	0008_zeroplayergame_subtitle	2016-05-05 22:13:40.890183+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('django_migrations_id_seq', 75, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
o5euotw6b22qh8jfg9lspow6daibgg46	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-13 02:49:10.471831+00
6dx7q6va4bq8gbfkr5fznk0d3zj2s2xn	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-16 22:41:29.393568+00
iqmsse0hhdq50kgzszfar8fi3sgzq7y0	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-20 00:56:20.951166+00
nknuc7mud0exywtdr1zgkszsnybup3nx	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-03 13:55:13.99241+00
eqiuzs007bc4pyzu5yrrfm7cuidvkdc4	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-19 11:18:49.698756+00
8q58bzkii0d3ciqd2wibih4rgloo9psn	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-04 05:06:23.451787+00
d2pp7ia3jv2lrtek1la8z87wb8mw1mlw	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-04 21:00:35.943579+00
rq3kdyzitzcia1wpo7tf4nil7jl4nw5a	YTZkMGI4MDIyN2IzMWRhNmYyZGQ5OGViOWNmNDMyZTExNmQyNTBkNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImMwMmJmYzMxNDJiODMzNThkZDgyM2JmZTc4ZGMzZTkzM2QxNGUwMzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-23 05:45:18.13726+00
16irfq4de8d6eblz4zf8hqdona3hrklo	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-24 21:50:39.636851+00
5svkwmo12wm1mq2uhlrbpjyz2hw9beu9	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-04-25 08:48:35.900976+00
tcfycnwd85xc8b1m5c257v95kycgi865	NDY5YWUxZThkMjU0MGNjNzczZDUxZjlmNWMxNjg1ZWFlMzkyYjc1MDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkzYTIxNjY1MmY0ZDc2NDU3ZjA2NjhiMmUyNDJlZTJiZmEyMjhmOWIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2016-05-17 04:01:09.8125+00
wvwhgja3qiyi9zwydyzigc9xboj8agnq	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-05-19 22:39:29.260167+00
g3cbjpjwwg4f96m70zpspfuhkucijkyr	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-05-24 04:43:18.252292+00
gqlyt6xm0nap80yaxqt1ei1287ouwy3a	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-05-25 00:44:09.98903+00
ktst1wfqgbvhg3v18bmfyvq7r9ysylqn	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-05-25 09:03:27.234951+00
fe1vr2teii685u2xc87yeqvmtpwtje2z	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-05-25 10:55:14.13305+00
8xigwlli54kdwv0ef5snamh6u5ix5c6x	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-05-29 02:57:27.16502+00
waa5hzo6tf700kvksir1k1oa7nthn54i	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-06-10 03:08:44.362998+00
ch2numkemyun2kiv0fogekldbc3qtw94	N2ZlOGI2NDc3ZDg0NDk5YTg0YjgwMWRlMmMwYTI4MmMxOWZiZmZmNjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg5ZjBjN2YzMmEyMDc0MjA1OGZjNmE4NGQwNmI1MTA1Y2JkYjY5MDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-06-11 05:08:51.665064+00
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
1	f9bde26a1556cd667f742bd34ec7c55e	profile_pics/2016-02-02/97.jpg	2016-02-02 22:42:54.578053+00
2	f9bde26a1556cd667f742bd34ec7c55e	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png	2016-04-18 19:28:47.505215+00
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 2, true);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
1	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-02-02/97.jpg.30x30_q85_crop.png	2016-02-02 22:42:54.401698+00	1
2	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-02-02/97.jpg.140x140_q85_crop.png	2016-02-02 22:42:54.621918+00	1
3	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png.30x30_q85_crop.png	2016-04-18 19:28:47.416587+00	2
4	d26becbf46ac48eda79c7a39a13a02dd	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png.140x140_q85_crop.png	2016-04-18 19:28:47.516384+00	2
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 4, true);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: game_category; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_category (id, name, description, image, enabled, popularity, parent_id) FROM stdin;
7	Tests			f	1	\N
4	Music			f	4	\N
6	Abstract Algebra			t	76	5
5	Pure Mathematics			t	10	\N
3	Fractals			t	20	2
1	Mazes	sdfg		t	22	\N
2	Mathematics ∩ Art			t	87	5
\.


--
-- Name: game_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_category_id_seq', 7, true);


--
-- Data for Name: game_codemodule; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_codemodule (id, created, updated, title, language, source) FROM stdin;
2	2016-03-23 23:18:07.315886+00	2016-03-24 03:00:32.050637+00	Pure Mathematical Function	paperscript	MFunction = function(func, extrema) {\r\n    //console.log(func.length);\r\n    this.func = func;\r\n    if (!extrema) { extrema = [-5,5]; }\r\n\r\n    this.domain = {\r\n        elements: [],\r\n        min: (extrema[0] || -5),\r\n        max: (extrema[1] || 5)\r\n    };\r\n\r\n    this.codomain = {\r\n        elements: [],\r\n        min: null,\r\n        max: null\r\n    };\r\n\r\n    this.mapping = null;\r\n}\r\n\r\nMFunction.prototype = {\r\n    \r\n    compute: function(delta) {\r\n        if (!delta) { delta = 50; }\r\n        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\r\n        this.codomain.elements = _.map(this.domain.elements, this.func);\r\n        this.codomain.min = _.min(this.codomain.elements);\r\n        this.codomain.max = _.max(this.codomain.elements);\r\n        this.mapping = _.zip(this.domain.elements, this.codomain.elements);\r\n\r\n        this._w = Math.abs(this.domain.max - this.domain.min);\r\n        this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\r\n\r\n        this.transformation_matrix = new Matrix(\r\n            (view.size.width / this._w), 0,\r\n            0, (view.size.height / (-1*this._h)), \r\n            view.center.x, view.center.y);\r\n\r\n        this.computed = true;\r\n        console.log("computed.  transform-matrix: ", this.transformation_matrix)\r\n    },\r\n\r\n    // "flattens" mapping\r\n    // i.e. [[1,2],3] -> [1,2,3]\r\n    getPoints: function() {\r\n        if (!this.computed) { this.compute(); }\r\n        this.points = _.map(this.mapping, function(pair) {\r\n            return _.flatten(pair);\r\n        });\r\n        return this.points;\r\n    },\r\n\r\n\r\n    draw: function(path, matrix_premult, map3d, tmatrix) {\r\n\r\n        if (!this.computed) { this.compute(); }\r\n\r\n        if (map3d) {\r\n            this.points = this.points3d;\r\n        } else {\r\n            this.points = this.getPoints();\r\n        }\r\n\r\n        if (matrix_premult) {\r\n            this.points = _.map(this.points, function(p) {\r\n                return numeric.dot(matrix_premult, p);\r\n            })\r\n        }\r\n\r\n        _.each(this.points, function(p) {\r\n            path.add(new Point(p));\r\n        })\r\n\r\n        path.add(new Point(this.domain.max*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\r\n        path.add(new Point(this.domain.min*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\r\n        \r\n        if (tmatrix) {\r\n            path.transform(tmatrix);\r\n        } else {\r\n            path.transform(this.transformation_matrix);\r\n        } \r\n    }\r\n}
1	2016-03-23 23:13:00.084048+00	2016-03-24 00:02:06.711331+00	Cartesian Axes, 2 dimensions	paperscript	function drawAxes(_layer) {\r\n\r\n    DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\r\n    LIGHT_GREY = new Color(0.7, 0.7, 0.7, 0.4);\r\n\r\n    view.viewSize = new Size(Canvas.width, Canvas.height);\r\n\r\n    x_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\n    x_axis.add(new Point(-view.size.width/2, 0));\r\n    x_axis.add(new Point(view.size.width/2, 0));\r\n    x_axis.closed = true;\r\n    project.activeLayer.insertChild(0,x_axis)\r\n\r\n    y_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\n    y_axis.add(new Point(0, -view.size.height/2));\r\n    y_axis.add(new Point(0, view.size.height/2));\r\n\r\n    x_lines = [];\r\n    _.each(_.range(-10,10), function(n) {\r\n        line = new Path({strokeColor: LIGHT_GREY });\r\n        line.add( new Point(n, view.size.height/2) );\r\n        line.add( new Point(n, -view.size.height/2) );\r\n        line.closed = true;\r\n        project.activeLayer.insertChild(0, line);\r\n        x_lines.push( line );\r\n    });\r\n\r\n    y_lines = [];\r\n    _.each(_.range(-10,10), function(n) {\r\n        line = new Path({strokeColor: LIGHT_GREY });\r\n        line.add( new Point(view.size.width/2, n) );\r\n        line.add( new Point(-view.size.width/2, n) );\r\n        line.closed = true;\r\n        project.activeLayer.insertChild(0, line);\r\n        y_lines.push( line );\r\n    });\r\n\r\n\r\n    _layer.transform( new Matrix((view.size.width / 10),0,0,\r\n        (view.size.height / -10), view.center.x, view.center.y) \r\n    );\r\n\r\n}
\.


--
-- Name: game_codemodule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_codemodule_id_seq', 2, true);


--
-- Data for Name: game_codeswitchingphrase; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_codeswitchingphrase (id, phrase, popularity) FROM stdin;
2	Mr. Code-switcher :: he who code-switched up-on the word 'code-switching' iteself	2
1	"Mr. Code-switcher?  You can totally read him like a book... except, he made the title of the book to say 'You are not supposed to read me.'"	1
\.


--
-- Name: game_codeswitchingphrase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_codeswitchingphrase_id_seq', 2, true);


--
-- Data for Name: game_gameinstance; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_gameinstance (id, created, updated, seed, popularity, vector, game_id, instantiator_id) FROM stdin;
807	2016-05-03 09:56:27.749858+00	2016-05-03 09:56:27.749889+00	{"solutionPathColor": {"type": "color", "value": "#16392f"}, "cellSize": {"type": "number", "value": 35}}	1	{"solutionPathColor": {"type": "color", "value": 1456431}, "cellSize": {"type": "number", "value": 35}}	24	1
35	2016-03-22 05:04:51.340616+00	2016-05-02 10:52:55.89507+00	{"color": {"type": "color", "value": "#cccc00"}, "width": {"type": "number", "value": 400}, "height": {"type": "number", "value": 200}}	1	\N	25	1
860	2016-05-10 09:08:06.298621+00	2016-05-10 09:08:06.458908+00	{"integer_group": {"type": "number", "value": 855}}	1	{"integer_group": {"type": "number", "value": 855}}	36	1
93	2016-03-26 20:19:20.860679+00	2016-05-02 10:52:56.671759+00	{}	1	\N	30	1
38	2016-03-22 10:30:57.067414+00	2016-05-02 10:52:57.320801+00	{"solutionPathColor": {"type": "color", "value": "#cc0055"}, "cellSize": {"type": "number", "value": 30}}	1	\N	24	1
376	2016-04-10 03:56:43.002746+00	2016-05-03 02:13:05.278447+00	{"integer_group": {"type": "number", "value": 23, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 23}}	36	1
48	2016-03-23 08:55:23.81744+00	2016-05-03 02:13:05.579931+00	{"solutionPathColor": {"type": "color", "value": "#6727f0", "parsing": false}, "cellSize": {"type": "number", "value": "45", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 6760432}, "cellSize": {"type": "number", "value": 45}}	24	1
17	2016-02-04 07:15:16.00152+00	2016-05-03 02:13:05.604842+00	{}	1	{}	2	1
745	2016-04-10 04:23:32.479235+00	2016-05-03 02:13:05.396151+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 11, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 11}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
371	2016-04-10 03:56:31.674262+00	2016-05-03 02:13:05.403653+00	{"integer_group": {"type": "number", "value": 18, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 18}}	36	1
66	2016-03-24 00:03:27.648282+00	2016-05-03 02:13:05.42146+00	{"x_min": {"type": "number", "value": -5, "parsing": false}, "func1": {"latex": "x \\\\cos{\\\\left (x \\\\right )} + \\\\frac{1}{5} \\\\cos{\\\\left (10 x \\\\right )}", "string": "x cos(x) + (1/5) cos(10x)", "javascript": "x*Math.cos(x) + Math.cos(10*x)/5", "value": "x cos(x) + (1/5) cos(10x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": 5, "parsing": false}}	1	{"x_min": {"type": "number", "value": -5}, "func1": {"latex": "x \\\\cos{\\\\left (x \\\\right )} + \\\\frac{1}{5} \\\\cos{\\\\left (10 x \\\\right )}", "javascript": "x*Math.cos(x) + Math.cos(10*x)/5", "type": "math", "string": "x cos(x) + (1/5) cos(10x)", "value": "x cos(x) + (1/5) cos(10x)"}, "x_max": {"type": "number", "value": 5}}	27	1
494	2016-04-10 04:01:14.616112+00	2016-05-03 02:13:05.42873+00	{"integer_group": {"type": "number", "value": 141, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 141}}	36	1
456	2016-04-10 03:59:49.26529+00	2016-05-03 02:13:05.437086+00	{"integer_group": {"type": "number", "value": 103, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 103}}	36	1
74	2016-03-24 10:36:01.190997+00	2016-05-03 02:13:05.464825+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": 200, "parsing": false}}	1	{"color": {"type": "color", "value": 2108467}, "width": {"type": "number", "value": 400}, "height": {"type": "number", "value": 200}}	25	1
49	2016-03-23 09:01:05.469675+00	2016-05-03 02:13:05.478825+00	{"color": {"type": "color", "value": "#375fc7", "parsing": false}, "width": {"type": "number", "value": "200", "parsing": false}, "height": {"type": "number", "value": "500", "parsing": false}}	1	{"color": {"type": "color", "value": 3628999}, "width": {"type": "number", "value": 200}, "height": {"type": "number", "value": 500}}	25	1
462	2016-04-10 04:00:02.714259+00	2016-05-03 02:13:05.487083+00	{"integer_group": {"type": "number", "value": 109, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 109}}	36	1
381	2016-04-10 03:56:54.206707+00	2016-05-03 02:13:05.49935+00	{"integer_group": {"type": "number", "value": 28, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 28}}	36	1
52	2016-03-23 09:11:19.890382+00	2016-05-03 02:13:05.511934+00	{"color": {"type": "color", "value": "#3fa38b", "parsing": false}, "width": {"type": "number", "value": "600", "parsing": false}, "height": {"type": "number", "value": "300", "parsing": false}}	1	{"color": {"type": "color", "value": 4170635}, "width": {"type": "number", "value": 600}, "height": {"type": "number", "value": 300}}	25	1
390	2016-04-10 03:57:22.347338+00	2016-05-03 02:13:05.537089+00	{"integer_group": {"type": "number", "value": 37, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 37}}	36	1
496	2016-04-10 04:01:19.154934+00	2016-05-03 02:13:05.55445+00	{"integer_group": {"type": "number", "value": 143, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 143}}	36	1
54	2016-03-23 09:18:51.931859+00	2016-05-03 02:13:05.567641+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "breathDelta": {"type": "number", "value": "25", "parsing": false}, "xMax": {"type": "number", "value": 5, "parsing": false}, "funct": {"latex": "\\\\frac{1}{- 3 x^{3} + x^{2}}", "string": "1/(x^2 - 3x^3)", "javascript": "1/(-3*Math.pow(x, 3) + Math.pow(x, 2))", "value": "1/(x^2 - 3x^3)", "parsing": false, "type": "math"}}	1	{"xMin": {"type": "number", "value": -5}, "breathDelta": {"type": "number", "value": 25}, "xMax": {"type": "number", "value": 5}, "funct": {"latex": "\\\\frac{1}{- 3 x^{3} + x^{2}}", "javascript": "1/(-3*Math.pow(x, 3) + Math.pow(x, 2))", "type": "math", "string": "1/(x^2 - 3x^3)", "value": "1/(x^2 - 3x^3)"}}	5	1
51	2016-03-23 09:10:29.352264+00	2016-05-03 02:13:05.587245+00	{"color": {"type": "color", "value": "#41a33f", "parsing": false}, "width": {"type": "number", "value": "600", "parsing": false}, "height": {"type": "number", "value": "400", "parsing": false}}	1	{"color": {"type": "color", "value": 4301631}, "width": {"type": "number", "value": 600}, "height": {"type": "number", "value": 400}}	25	1
365	2016-04-10 03:56:18.456704+00	2016-05-03 02:13:05.596301+00	{"integer_group": {"type": "number", "value": 12, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 12}}	36	1
808	2016-05-03 09:59:00.880324+00	2016-05-03 09:59:01.050419+00	{"solutionPathColor": {"type": "color", "value": "#0d1d18"}, "cellSize": {"type": "number", "value": 35}}	1	{"solutionPathColor": {"type": "color", "value": 859416}, "cellSize": {"type": "number", "value": 35}}	24	1
829	2016-05-04 09:37:44.580141+00	2016-05-04 09:37:44.71863+00	{"integer_group": {"type": "number", "value": 24354}}	1	{"integer_group": {"type": "number", "value": 24354}}	36	1
861	2016-05-10 09:08:53.070059+00	2016-05-10 09:08:53.11021+00	{"integer_group": {"type": "number", "value": 420}}	1	{"integer_group": {"type": "number", "value": 420}}	36	1
176	2016-04-07 10:48:02.789058+00	2016-05-02 10:52:59.830094+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "200", "parsing": false}}	1	\N	25	1
418	2016-04-10 03:58:24.903141+00	2016-05-03 02:13:06.18859+00	{"integer_group": {"type": "number", "value": 65, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 65}}	36	1
256	2016-04-10 00:49:14.86687+00	2016-05-02 10:53:00.405334+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "52", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	\N	28	1
107	2016-04-04 10:10:52.558519+00	2016-05-03 02:13:05.640444+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}, "xMax": {"type": "number", "value": 5, "parsing": false}, "funct": {"latex": "\\\\sin{\\\\left (3 x \\\\right )} \\\\cos{\\\\left (5 x \\\\right )} + 3 \\\\cos{\\\\left (2 x \\\\right )}", "string": "3 cos(2x) + sin(3x) cos(5x)", "javascript": "Math.sin(3*x)*Math.cos(5*x) + 3*Math.cos(2*x)", "value": "3 cos(2x) + sin(3x) cos(5x)", "parsing": false, "type": "math"}}	1	{"xMin": {"type": "number", "value": -5}, "breathDelta": {"type": "number", "value": 17}, "xMax": {"type": "number", "value": 5}, "funct": {"latex": "\\\\sin{\\\\left (3 x \\\\right )} \\\\cos{\\\\left (5 x \\\\right )} + 3 \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "Math.sin(3*x)*Math.cos(5*x) + 3*Math.cos(2*x)", "type": "math", "string": "3 cos(2x) + sin(3x) cos(5x)", "value": "3 cos(2x) + sin(3x) cos(5x)"}}	5	1
99	2016-04-04 07:45:32.788779+00	2016-05-03 02:13:05.654436+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 25}, "DEGREE2_COEFF": {"type": "number", "value": 45}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	28	1
366	2016-04-10 03:56:20.678952+00	2016-05-03 02:13:05.663094+00	{"integer_group": {"type": "number", "value": 13, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 13}}	36	1
675	2016-04-10 04:18:27.334444+00	2016-05-03 02:13:05.680258+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 18, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 18}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
576	2016-04-10 04:05:55.54514+00	2016-05-03 02:13:05.688131+00	{"integer_group": {"type": "number", "value": 223, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 223}}	36	1
113	2016-04-04 19:46:43.127026+00	2016-05-03 02:13:05.696492+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "40", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 40}}	24	1
382	2016-04-10 03:56:56.413851+00	2016-05-03 02:13:05.70453+00	{"integer_group": {"type": "number", "value": 29, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 29}}	36	1
140	2016-04-05 09:41:18.851042+00	2016-05-03 02:13:05.721467+00	{"NUM_ITERATIONS": {"type": "number", "value": "5", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,-5,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "10", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10495180}, "DEGREE1_COEFF": {"type": "number", "value": 25}, "DEGREE2_COEFF": {"type": "number", "value": 45}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,-5,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 10}}	28	1
108	2016-04-04 10:32:12.944725+00	2016-05-03 02:13:05.730128+00	{"solutionPathColor": {"type": "color", "value": "#e6228c", "parsing": false}, "cellSize": {"type": "number", "value": "10", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 15082124}, "cellSize": {"type": "number", "value": 10}}	24	1
406	2016-04-10 03:57:58.295978+00	2016-05-03 02:13:05.738377+00	{"integer_group": {"type": "number", "value": 53, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 53}}	36	1
177	2016-04-07 11:22:21.498062+00	2016-05-03 02:13:05.767207+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "2002", "parsing": false}}	1	{"color": {"type": "color", "value": 2108467}, "width": {"type": "number", "value": 400}, "height": {"type": "number", "value": 2002}}	25	1
151	2016-04-06 18:15:14.925567+00	2016-05-03 02:13:05.776276+00	{"x_min": {"type": "number", "value": -5, "parsing": false}, "func1": {"latex": "x \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) sin(2x)", "javascript": "x*Math.sin(2*x)*Math.cos(x)", "value": "x cos(x) sin(2x)", "parsing": true, "type": "math"}, "x_max": {"type": "number", "value": 5, "parsing": false}}	1	{"x_min": {"type": "number", "value": -5}, "func1": {"latex": "x \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "javascript": "x*Math.sin(2*x)*Math.cos(x)", "type": "math", "string": "x cos(x) sin(2x)", "value": "x cos(x) sin(2x)"}, "x_max": {"type": "number", "value": 5}}	27	1
385	2016-04-10 03:57:03.307567+00	2016-05-03 02:13:05.788534+00	{"integer_group": {"type": "number", "value": 32, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 32}}	36	1
175	2016-04-07 10:47:16.063761+00	2016-05-02 10:53:00.871966+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "2002", "parsing": false}}	1	\N	25	1
174	2016-04-07 10:28:20.844211+00	2016-05-02 10:53:01.155534+00	{"color": {"type": "color", "value": "#202c33", "parsing": false}, "width": {"type": "number", "value": 400, "parsing": false}, "height": {"type": "number", "value": "2002", "parsing": false}}	1	\N	25	1
809	2016-05-03 10:00:44.508846+00	2016-05-03 10:00:44.584099+00	{"solutionPathColor": {"type": "color", "value": "#0d1d18"}, "cellSize": {"type": "number", "value": 36}}	1	{"solutionPathColor": {"type": "color", "value": 859416}, "cellSize": {"type": "number", "value": 36}}	24	1
830	2016-05-04 09:38:08.158471+00	2016-05-04 09:38:08.201806+00	{"integer_group": {"type": "number", "value": 24356}}	1	{"integer_group": {"type": "number", "value": 24356}}	36	1
144	2016-04-05 20:17:29.969007+00	2016-05-03 02:13:05.830384+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "15", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "35", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "35", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 6}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10495180}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 35}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]"}, "DEGREE1_COEFF": {"type": "number", "value": 35}}	28	1
391	2016-04-10 03:57:24.550586+00	2016-05-03 02:13:05.846504+00	{"integer_group": {"type": "number", "value": 38, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 38}}	36	1
417	2016-04-10 03:58:22.695608+00	2016-05-03 02:13:05.855281+00	{"integer_group": {"type": "number", "value": 64, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 64}}	36	1
438	2016-04-10 03:59:09.074118+00	2016-05-03 02:13:05.863152+00	{"integer_group": {"type": "number", "value": 85, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 85}}	36	1
429	2016-04-10 03:58:49.159253+00	2016-05-03 02:13:05.87129+00	{"integer_group": {"type": "number", "value": 76, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 76}}	36	1
378	2016-04-10 03:56:47.506214+00	2016-05-03 02:13:05.880257+00	{"integer_group": {"type": "number", "value": 25, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 25}}	36	1
411	2016-04-10 03:58:09.453379+00	2016-05-03 02:13:05.888317+00	{"integer_group": {"type": "number", "value": 58, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 58}}	36	1
407	2016-04-10 03:58:00.504133+00	2016-05-03 02:13:05.896698+00	{"integer_group": {"type": "number", "value": 54, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 54}}	36	1
410	2016-04-10 03:58:07.23711+00	2016-05-03 02:13:05.904937+00	{"integer_group": {"type": "number", "value": 57, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 57}}	36	1
394	2016-04-10 03:57:31.328562+00	2016-05-03 02:13:05.913831+00	{"integer_group": {"type": "number", "value": 41, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 41}}	36	1
398	2016-04-10 03:57:40.32331+00	2016-05-03 02:13:05.921508+00	{"integer_group": {"type": "number", "value": 45, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 45}}	36	1
402	2016-04-10 03:57:49.332303+00	2016-05-03 02:13:05.930254+00	{"integer_group": {"type": "number", "value": 49, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 49}}	36	1
372	2016-04-10 03:56:33.905507+00	2016-05-03 02:13:05.938327+00	{"integer_group": {"type": "number", "value": 19, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 19}}	36	1
367	2016-04-10 03:56:22.894481+00	2016-05-03 02:13:05.946864+00	{"integer_group": {"type": "number", "value": 14, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 14}}	36	1
377	2016-04-10 03:56:45.26359+00	2016-05-03 02:13:05.954897+00	{"integer_group": {"type": "number", "value": 24, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 24}}	36	1
426	2016-04-10 03:58:42.546931+00	2016-05-03 02:13:05.963989+00	{"integer_group": {"type": "number", "value": 73, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 73}}	36	1
386	2016-04-10 03:57:05.5499+00	2016-05-03 02:13:05.971712+00	{"integer_group": {"type": "number", "value": 33, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 33}}	36	1
435	2016-04-10 03:59:02.450427+00	2016-05-03 02:13:05.979975+00	{"integer_group": {"type": "number", "value": 82, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 82}}	36	1
395	2016-04-10 03:57:33.591493+00	2016-05-03 02:13:05.997252+00	{"integer_group": {"type": "number", "value": 42, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 42}}	36	1
399	2016-04-10 03:57:42.624687+00	2016-05-03 02:13:06.004921+00	{"integer_group": {"type": "number", "value": 46, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 46}}	36	1
408	2016-04-10 03:58:02.753739+00	2016-05-03 02:13:06.013307+00	{"integer_group": {"type": "number", "value": 55, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 55}}	36	1
424	2016-04-10 03:58:38.111031+00	2016-05-03 02:13:06.021583+00	{"integer_group": {"type": "number", "value": 71, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 71}}	36	1
444	2016-04-10 03:59:22.412533+00	2016-05-03 02:13:06.029835+00	{"integer_group": {"type": "number", "value": 91, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 91}}	36	1
458	2016-04-10 03:59:53.750184+00	2016-05-03 02:13:06.038185+00	{"integer_group": {"type": "number", "value": 105, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 105}}	36	1
427	2016-04-10 03:58:44.762376+00	2016-05-03 02:13:06.04673+00	{"integer_group": {"type": "number", "value": 74, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 74}}	36	1
379	2016-04-10 03:56:49.749622+00	2016-05-03 02:13:06.054832+00	{"integer_group": {"type": "number", "value": 26, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 26}}	36	1
384	2016-04-10 03:57:01.008223+00	2016-05-03 02:13:06.063595+00	{"integer_group": {"type": "number", "value": 31, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 31}}	36	1
454	2016-04-10 03:59:44.749263+00	2016-05-03 02:13:06.071704+00	{"integer_group": {"type": "number", "value": 101, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 101}}	36	1
420	2016-04-10 03:58:29.350245+00	2016-05-03 02:13:06.088252+00	{"integer_group": {"type": "number", "value": 67, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 67}}	36	1
430	2016-04-10 03:58:51.386527+00	2016-05-03 02:13:06.097206+00	{"integer_group": {"type": "number", "value": 77, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 77}}	36	1
403	2016-04-10 03:57:51.5316+00	2016-05-03 02:13:06.105034+00	{"integer_group": {"type": "number", "value": 50, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 50}}	36	1
405	2016-04-10 03:57:56.062577+00	2016-05-03 02:13:06.113434+00	{"integer_group": {"type": "number", "value": 52, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 52}}	36	1
389	2016-04-10 03:57:20.119174+00	2016-05-03 02:13:06.121955+00	{"integer_group": {"type": "number", "value": 36, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 36}}	36	1
383	2016-04-10 03:56:58.774504+00	2016-05-03 02:13:06.138592+00	{"integer_group": {"type": "number", "value": 30, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 30}}	36	1
414	2016-04-10 03:58:16.065974+00	2016-05-03 02:13:06.147319+00	{"integer_group": {"type": "number", "value": 61, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 61}}	36	1
423	2016-04-10 03:58:35.911841+00	2016-05-03 02:13:06.155477+00	{"integer_group": {"type": "number", "value": 70, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 70}}	36	1
432	2016-04-10 03:58:55.812022+00	2016-05-03 02:13:06.163704+00	{"integer_group": {"type": "number", "value": 79, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 79}}	36	1
439	2016-04-10 03:59:11.262783+00	2016-05-03 02:13:06.171957+00	{"integer_group": {"type": "number", "value": 86, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 86}}	36	1
387	2016-04-10 03:57:07.753787+00	2016-05-03 02:13:06.180094+00	{"integer_group": {"type": "number", "value": 34, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 34}}	36	1
396	2016-04-10 03:57:35.856662+00	2016-05-03 02:13:06.197162+00	{"integer_group": {"type": "number", "value": 43, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 43}}	36	1
415	2016-04-10 03:58:18.260244+00	2016-05-03 02:13:06.213622+00	{"integer_group": {"type": "number", "value": 62, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 62}}	36	1
448	2016-04-10 03:59:31.389297+00	2016-05-03 02:13:06.222067+00	{"integer_group": {"type": "number", "value": 95, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 95}}	36	1
392	2016-04-10 03:57:26.811476+00	2016-05-03 02:13:06.231006+00	{"integer_group": {"type": "number", "value": 39, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 39}}	36	1
452	2016-04-10 03:59:40.256331+00	2016-05-03 02:13:06.247643+00	{"integer_group": {"type": "number", "value": 99, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 99}}	36	1
460	2016-04-10 03:59:58.275588+00	2016-05-03 02:13:06.256013+00	{"integer_group": {"type": "number", "value": 107, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 107}}	36	1
373	2016-04-10 03:56:36.245683+00	2016-05-03 02:13:06.28049+00	{"integer_group": {"type": "number", "value": 20, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 20}}	36	1
404	2016-04-10 03:57:53.828686+00	2016-05-03 02:13:06.289454+00	{"integer_group": {"type": "number", "value": 51, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 51}}	36	1
369	2016-04-10 03:56:27.322283+00	2016-05-03 02:13:06.297573+00	{"integer_group": {"type": "number", "value": 16, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 16}}	36	1
388	2016-04-10 03:57:10.009102+00	2016-05-03 02:13:06.305271+00	{"integer_group": {"type": "number", "value": 35, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 35}}	36	1
421	2016-04-10 03:58:31.523138+00	2016-05-03 02:13:06.314301+00	{"integer_group": {"type": "number", "value": 68, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 68}}	36	1
461	2016-04-10 04:00:00.459003+00	2016-05-03 02:13:06.322216+00	{"integer_group": {"type": "number", "value": 108, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 108}}	36	1
463	2016-04-10 04:00:04.914636+00	2016-05-03 02:13:06.330762+00	{"integer_group": {"type": "number", "value": 110, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 110}}	36	1
450	2016-04-10 03:59:35.836712+00	2016-05-03 02:13:06.338633+00	{"integer_group": {"type": "number", "value": 97, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 97}}	36	1
469	2016-04-10 04:00:18.316866+00	2016-05-03 02:13:06.347687+00	{"integer_group": {"type": "number", "value": 116, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 116}}	36	1
471	2016-04-10 04:00:22.85069+00	2016-05-03 02:13:06.355281+00	{"integer_group": {"type": "number", "value": 118, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 118}}	36	1
465	2016-04-10 04:00:09.402327+00	2016-05-03 02:13:06.363738+00	{"integer_group": {"type": "number", "value": 112, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 112}}	36	1
477	2016-04-10 04:00:36.299965+00	2016-05-03 02:13:06.372741+00	{"integer_group": {"type": "number", "value": 124, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 124}}	36	1
481	2016-04-10 04:00:45.311782+00	2016-05-03 02:13:06.388918+00	{"integer_group": {"type": "number", "value": 128, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 128}}	36	1
483	2016-04-10 04:00:49.759409+00	2016-05-03 02:13:06.39721+00	{"integer_group": {"type": "number", "value": 130, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 130}}	36	1
490	2016-04-10 04:01:05.556155+00	2016-05-03 02:13:06.414891+00	{"integer_group": {"type": "number", "value": 137, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 137}}	36	1
449	2016-04-10 03:59:33.618233+00	2016-05-03 02:13:06.422895+00	{"integer_group": {"type": "number", "value": 96, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 96}}	36	1
459	2016-04-10 03:59:55.995597+00	2016-05-03 02:13:06.431419+00	{"integer_group": {"type": "number", "value": 106, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 106}}	36	1
464	2016-04-10 04:00:07.162186+00	2016-05-03 02:13:06.447794+00	{"integer_group": {"type": "number", "value": 111, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 111}}	36	1
362	2016-04-10 03:56:11.788589+00	2016-05-03 02:13:06.455945+00	{"integer_group": {"type": "number", "value": 9, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 9}}	36	1
467	2016-04-10 04:00:13.871192+00	2016-05-03 02:13:06.472949+00	{"integer_group": {"type": "number", "value": 114, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 114}}	36	1
473	2016-04-10 04:00:27.278342+00	2016-05-03 02:13:06.481177+00	{"integer_group": {"type": "number", "value": 120, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 120}}	36	1
485	2016-04-10 04:00:54.235681+00	2016-05-03 02:13:06.531298+00	{"integer_group": {"type": "number", "value": 132, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 132}}	36	1
491	2016-04-10 04:01:07.77446+00	2016-05-03 02:13:06.53928+00	{"integer_group": {"type": "number", "value": 138, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 138}}	36	1
479	2016-04-10 04:00:40.778357+00	2016-05-03 02:13:06.547946+00	{"integer_group": {"type": "number", "value": 126, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 126}}	36	1
361	2016-04-10 03:56:09.505473+00	2016-05-03 02:13:06.564818+00	{"integer_group": {"type": "number", "value": 8, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 8}}	36	1
360	2016-04-10 03:56:07.258356+00	2016-05-03 02:13:06.572865+00	{"integer_group": {"type": "number", "value": 7, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 7}}	36	1
380	2016-04-10 03:56:51.974071+00	2016-05-03 02:13:06.589462+00	{"integer_group": {"type": "number", "value": 27, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 27}}	36	1
492	2016-04-10 04:01:10.092128+00	2016-05-03 02:13:06.59791+00	{"integer_group": {"type": "number", "value": 139, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 139}}	36	1
393	2016-04-10 03:57:29.074764+00	2016-05-03 02:13:06.614458+00	{"integer_group": {"type": "number", "value": 40, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 40}}	36	1
401	2016-04-10 03:57:47.062472+00	2016-05-03 02:13:06.639573+00	{"integer_group": {"type": "number", "value": 48, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 48}}	36	1
413	2016-04-10 03:58:13.869239+00	2016-05-03 02:13:06.648108+00	{"integer_group": {"type": "number", "value": 60, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 60}}	36	1
416	2016-04-10 03:58:20.480401+00	2016-05-03 02:13:06.664722+00	{"integer_group": {"type": "number", "value": 63, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 63}}	36	1
422	2016-04-10 03:58:33.745706+00	2016-05-03 02:13:06.672865+00	{"integer_group": {"type": "number", "value": 69, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 69}}	36	1
425	2016-04-10 03:58:40.351673+00	2016-05-03 02:13:06.688949+00	{"integer_group": {"type": "number", "value": 72, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 72}}	36	1
434	2016-04-10 03:59:00.238195+00	2016-05-03 02:13:06.697687+00	{"integer_group": {"type": "number", "value": 81, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 81}}	36	1
354	2016-04-10 03:55:33.744711+00	2016-05-03 02:13:06.705692+00	{"integer_group": {"type": "number", "value": 840}}	1	{"integer_group": {"type": "number", "value": 840}}	36	1
527	2016-04-10 04:02:30.192454+00	2016-05-03 02:13:06.722928+00	{"integer_group": {"type": "number", "value": 174, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 174}}	36	1
528	2016-04-10 04:02:32.52621+00	2016-05-03 02:13:06.730765+00	{"integer_group": {"type": "number", "value": 175, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 175}}	36	1
530	2016-04-10 04:02:37.137682+00	2016-05-03 02:13:06.747871+00	{"integer_group": {"type": "number", "value": 177, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 177}}	36	1
531	2016-04-10 04:02:39.44341+00	2016-05-03 02:13:06.755629+00	{"integer_group": {"type": "number", "value": 178, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 178}}	36	1
533	2016-04-10 04:02:44.129291+00	2016-05-03 02:13:06.773028+00	{"integer_group": {"type": "number", "value": 180, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 180}}	36	1
534	2016-04-10 04:02:46.495267+00	2016-05-03 02:13:06.780722+00	{"integer_group": {"type": "number", "value": 181, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 181}}	36	1
536	2016-04-10 04:02:51.23812+00	2016-05-03 02:13:06.797497+00	{"integer_group": {"type": "number", "value": 183, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 183}}	36	1
537	2016-04-10 04:02:53.511784+00	2016-05-03 02:13:06.805955+00	{"integer_group": {"type": "number", "value": 184, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 184}}	36	1
538	2016-04-10 04:02:55.876717+00	2016-05-03 02:13:06.814276+00	{"integer_group": {"type": "number", "value": 185, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 185}}	36	1
540	2016-04-10 04:03:00.565154+00	2016-05-03 02:13:06.830781+00	{"integer_group": {"type": "number", "value": 187, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 187}}	36	1
541	2016-04-10 04:03:02.84507+00	2016-05-03 02:13:06.839009+00	{"integer_group": {"type": "number", "value": 188, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 188}}	36	1
544	2016-04-10 04:03:09.884364+00	2016-05-03 02:13:06.855733+00	{"integer_group": {"type": "number", "value": 191, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 191}}	36	1
545	2016-04-10 04:03:12.243374+00	2016-05-03 02:13:06.864824+00	{"integer_group": {"type": "number", "value": 192, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 192}}	36	1
547	2016-04-10 04:03:16.843568+00	2016-05-03 02:13:06.88097+00	{"integer_group": {"type": "number", "value": 194, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 194}}	36	1
548	2016-04-10 04:03:19.109172+00	2016-05-03 02:13:06.88909+00	{"integer_group": {"type": "number", "value": 195, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 195}}	36	1
554	2016-04-10 04:05:01.142096+00	2016-05-03 02:13:06.906132+00	{"integer_group": {"type": "number", "value": "201", "parsing": false}}	1	{"integer_group": {"type": "number", "value": 201}}	36	1
556	2016-04-10 04:05:06.235209+00	2016-05-03 02:13:06.914378+00	{"integer_group": {"type": "number", "value": 203, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 203}}	36	1
557	2016-04-10 04:05:08.677706+00	2016-05-03 02:13:06.922377+00	{"integer_group": {"type": "number", "value": 204, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 204}}	36	1
501	2016-04-10 04:01:30.497911+00	2016-05-03 02:13:06.939077+00	{"integer_group": {"type": "number", "value": 148, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 148}}	36	1
502	2016-04-10 04:01:32.731719+00	2016-05-03 02:13:06.947642+00	{"integer_group": {"type": "number", "value": 149, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 149}}	36	1
505	2016-04-10 04:01:39.589761+00	2016-05-03 02:13:06.964978+00	{"integer_group": {"type": "number", "value": 152, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 152}}	36	1
504	2016-04-10 04:01:37.230104+00	2016-05-03 02:13:06.973231+00	{"integer_group": {"type": "number", "value": 151, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 151}}	36	1
506	2016-04-10 04:01:41.865271+00	2016-05-03 02:13:06.989749+00	{"integer_group": {"type": "number", "value": 153, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 153}}	36	1
508	2016-04-10 04:01:46.463163+00	2016-05-03 02:13:06.99762+00	{"integer_group": {"type": "number", "value": 155, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 155}}	36	1
510	2016-04-10 04:01:51.071501+00	2016-05-03 02:13:07.005917+00	{"integer_group": {"type": "number", "value": 157, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 157}}	36	1
512	2016-04-10 04:01:55.730185+00	2016-05-03 02:13:07.022591+00	{"integer_group": {"type": "number", "value": 159, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 159}}	36	1
513	2016-04-10 04:01:57.956713+00	2016-05-03 02:13:07.031081+00	{"integer_group": {"type": "number", "value": 160, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 160}}	36	1
515	2016-04-10 04:02:02.448118+00	2016-05-03 02:13:07.048464+00	{"integer_group": {"type": "number", "value": 162, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 162}}	36	1
516	2016-04-10 04:02:04.748716+00	2016-05-03 02:13:07.056034+00	{"integer_group": {"type": "number", "value": 163, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 163}}	36	1
518	2016-04-10 04:02:09.433353+00	2016-05-03 02:13:07.072551+00	{"integer_group": {"type": "number", "value": 165, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 165}}	36	1
519	2016-04-10 04:02:11.77404+00	2016-05-03 02:13:07.081316+00	{"integer_group": {"type": "number", "value": 166, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 166}}	36	1
521	2016-04-10 04:02:16.420482+00	2016-05-03 02:13:07.09772+00	{"integer_group": {"type": "number", "value": 168, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 168}}	36	1
522	2016-04-10 04:02:18.679592+00	2016-05-03 02:13:07.106012+00	{"integer_group": {"type": "number", "value": 169, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 169}}	36	1
584	2016-04-10 04:06:17.146112+00	2016-05-03 02:13:07.114916+00	{"integer_group": {"type": "number", "value": 231, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 231}}	36	1
451	2016-04-10 03:59:38.074512+00	2016-05-03 02:13:07.131116+00	{"integer_group": {"type": "number", "value": 98, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 98}}	36	1
831	2016-05-04 09:38:10.563016+00	2016-05-04 09:38:10.601571+00	{"integer_group": {"type": "number", "value": 24357}}	1	{"integer_group": {"type": "number", "value": 24357}}	36	1
455	2016-04-10 03:59:47.014904+00	2016-05-03 02:13:07.14893+00	{"integer_group": {"type": "number", "value": 102, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 102}}	36	1
523	2016-04-10 04:02:20.989131+00	2016-05-03 02:13:07.157167+00	{"integer_group": {"type": "number", "value": 170, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 170}}	36	1
525	2016-04-10 04:02:25.66374+00	2016-05-03 02:13:07.173331+00	{"integer_group": {"type": "number", "value": 172, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 172}}	36	1
596	2016-04-10 04:06:56.011442+00	2016-05-03 02:13:07.181916+00	{"integer_group": {"type": "number", "value": 243, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 243}}	36	1
579	2016-04-10 04:06:03.295084+00	2016-05-03 02:13:07.198495+00	{"integer_group": {"type": "number", "value": 226, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 226}}	36	1
580	2016-04-10 04:06:06.029642+00	2016-05-03 02:13:07.206979+00	{"integer_group": {"type": "number", "value": 227, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 227}}	36	1
599	2016-04-10 04:07:09.191965+00	2016-05-03 02:13:07.22336+00	{"integer_group": {"type": "number", "value": 246, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 246}}	36	1
600	2016-04-10 04:07:14.233436+00	2016-05-03 02:13:07.231969+00	{"integer_group": {"type": "number", "value": 247, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 247}}	36	1
602	2016-04-10 04:07:22.981504+00	2016-05-03 02:13:07.248011+00	{"integer_group": {"type": "number", "value": 249, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 249}}	36	1
603	2016-04-10 04:07:27.798346+00	2016-05-03 02:13:07.256797+00	{"integer_group": {"type": "number", "value": 250, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 250}}	36	1
604	2016-04-10 04:07:33.255265+00	2016-05-03 02:13:07.265028+00	{"integer_group": {"type": "number", "value": 251, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 251}}	36	1
606	2016-04-10 04:07:41.903457+00	2016-05-03 02:13:07.281691+00	{"integer_group": {"type": "number", "value": 253, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 253}}	36	1
607	2016-04-10 04:07:46.181663+00	2016-05-03 02:13:07.289502+00	{"integer_group": {"type": "number", "value": 254, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 254}}	36	1
609	2016-04-10 04:07:54.33935+00	2016-05-03 02:13:07.306535+00	{"integer_group": {"type": "number", "value": 256, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 256}}	36	1
610	2016-04-10 04:07:58.216758+00	2016-05-03 02:13:07.315224+00	{"integer_group": {"type": "number", "value": 257, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 257}}	36	1
612	2016-04-10 04:08:06.888362+00	2016-05-03 02:13:07.331496+00	{"integer_group": {"type": "number", "value": 259, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 259}}	36	1
613	2016-04-10 04:08:11.946224+00	2016-05-03 02:13:07.339727+00	{"integer_group": {"type": "number", "value": 260, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 260}}	36	1
614	2016-04-10 04:08:16.557903+00	2016-05-03 02:13:07.34805+00	{"integer_group": {"type": "number", "value": 261, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 261}}	36	1
616	2016-04-10 04:08:25.108886+00	2016-05-03 02:13:07.365283+00	{"integer_group": {"type": "number", "value": 263, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 263}}	36	1
618	2016-04-10 04:08:34.564208+00	2016-05-03 02:13:07.373093+00	{"integer_group": {"type": "number", "value": 265, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 265}}	36	1
561	2016-04-10 04:05:18.138648+00	2016-05-03 02:13:07.39021+00	{"integer_group": {"type": "number", "value": 208, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 208}}	36	1
592	2016-04-10 04:06:41.212876+00	2016-05-03 02:13:07.399494+00	{"integer_group": {"type": "number", "value": 239, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 239}}	36	1
563	2016-04-10 04:05:22.963562+00	2016-05-03 02:13:07.415352+00	{"integer_group": {"type": "number", "value": 210, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 210}}	36	1
564	2016-04-10 04:05:25.403971+00	2016-05-03 02:13:07.423129+00	{"integer_group": {"type": "number", "value": 211, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 211}}	36	1
566	2016-04-10 04:05:30.267736+00	2016-05-03 02:13:07.440247+00	{"integer_group": {"type": "number", "value": 213, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 213}}	36	1
568	2016-04-10 04:05:35.174317+00	2016-05-03 02:13:07.449061+00	{"integer_group": {"type": "number", "value": 215, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 215}}	36	1
567	2016-04-10 04:05:32.803247+00	2016-05-03 02:13:07.457107+00	{"integer_group": {"type": "number", "value": 214, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 214}}	36	1
570	2016-04-10 04:05:40.255169+00	2016-05-03 02:13:07.473439+00	{"integer_group": {"type": "number", "value": 217, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 217}}	36	1
571	2016-04-10 04:05:42.786442+00	2016-05-03 02:13:07.481744+00	{"integer_group": {"type": "number", "value": 218, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 218}}	36	1
573	2016-04-10 04:05:47.834694+00	2016-05-03 02:13:07.49866+00	{"integer_group": {"type": "number", "value": 220, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 220}}	36	1
581	2016-04-10 04:06:08.768989+00	2016-05-03 02:13:07.506665+00	{"integer_group": {"type": "number", "value": 228, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 228}}	36	1
583	2016-04-10 04:06:14.306354+00	2016-05-03 02:13:07.523519+00	{"integer_group": {"type": "number", "value": 230, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 230}}	36	1
638	2016-04-10 04:10:11.326871+00	2016-05-03 02:13:07.531671+00	{"integer_group": {"type": "number", "value": 285, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 285}}	36	1
633	2016-04-10 04:09:44.754137+00	2016-05-03 02:13:07.539854+00	{"integer_group": {"type": "number", "value": 280, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 280}}	36	1
635	2016-04-10 04:09:55.182707+00	2016-05-03 02:13:07.556655+00	{"integer_group": {"type": "number", "value": 282, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 282}}	36	1
595	2016-04-10 04:06:52.207058+00	2016-05-03 02:13:07.564949+00	{"integer_group": {"type": "number", "value": 242, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 242}}	36	1
587	2016-04-10 04:06:25.668113+00	2016-05-03 02:13:07.58164+00	{"integer_group": {"type": "number", "value": 234, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 234}}	36	1
589	2016-04-10 04:06:31.575688+00	2016-05-03 02:13:07.589771+00	{"integer_group": {"type": "number", "value": 236, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 236}}	36	1
591	2016-04-10 04:06:37.958653+00	2016-05-03 02:13:07.606671+00	{"integer_group": {"type": "number", "value": 238, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 238}}	36	1
559	2016-04-10 04:05:13.418067+00	2016-05-03 02:13:07.614887+00	{"integer_group": {"type": "number", "value": 206, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 206}}	36	1
594	2016-04-10 04:06:48.298101+00	2016-05-03 02:13:07.633652+00	{"integer_group": {"type": "number", "value": 241, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 241}}	36	1
663	2016-04-10 04:12:34.248916+00	2016-05-03 02:13:07.641541+00	{"integer_group": {"type": "number", "value": 310, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 310}}	36	1
832	2016-05-04 09:38:12.841203+00	2016-05-04 09:38:12.876309+00	{"integer_group": {"type": "number", "value": 24358}}	1	{"integer_group": {"type": "number", "value": 24358}}	36	1
620	2016-04-10 04:08:43.747152+00	2016-05-03 02:13:07.658231+00	{"integer_group": {"type": "number", "value": 267, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 267}}	36	1
625	2016-04-10 04:09:05.557686+00	2016-05-03 02:13:07.666808+00	{"integer_group": {"type": "number", "value": 272, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 272}}	36	1
622	2016-04-10 04:08:52.829543+00	2016-05-03 02:13:07.674932+00	{"integer_group": {"type": "number", "value": 269, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 269}}	36	1
626	2016-04-10 04:09:09.403405+00	2016-05-03 02:13:07.683302+00	{"integer_group": {"type": "number", "value": 273, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 273}}	36	1
628	2016-04-10 04:09:18.830202+00	2016-05-03 02:13:07.691855+00	{"integer_group": {"type": "number", "value": 275, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 275}}	36	1
624	2016-04-10 04:09:01.253457+00	2016-05-03 02:13:07.700081+00	{"integer_group": {"type": "number", "value": 271, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 271}}	36	1
619	2016-04-10 04:08:39.1593+00	2016-05-03 02:13:07.716656+00	{"integer_group": {"type": "number", "value": 266, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 266}}	36	1
629	2016-04-10 04:09:23.904129+00	2016-05-03 02:13:07.725026+00	{"integer_group": {"type": "number", "value": 276, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 276}}	36	1
636	2016-04-10 04:10:00.572134+00	2016-05-03 02:13:07.749961+00	{"integer_group": {"type": "number", "value": 283, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 283}}	36	1
637	2016-04-10 04:10:05.679245+00	2016-05-03 02:13:07.759758+00	{"integer_group": {"type": "number", "value": 284, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 284}}	36	1
643	2016-04-10 04:10:37.646846+00	2016-05-03 02:13:07.767529+00	{"integer_group": {"type": "number", "value": 290, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 290}}	36	1
651	2016-04-10 04:11:21.77809+00	2016-05-03 02:13:07.775039+00	{"integer_group": {"type": "number", "value": 298, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 298}}	36	1
639	2016-04-10 04:10:16.519938+00	2016-05-03 02:13:07.783533+00	{"integer_group": {"type": "number", "value": 286, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 286}}	36	1
652	2016-04-10 04:11:27.201399+00	2016-05-03 02:13:07.791997+00	{"integer_group": {"type": "number", "value": 299, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 299}}	36	1
644	2016-04-10 04:10:42.903597+00	2016-05-03 02:13:07.800076+00	{"integer_group": {"type": "number", "value": 291, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 291}}	36	1
645	2016-04-10 04:10:48.078744+00	2016-05-03 02:13:07.808449+00	{"integer_group": {"type": "number", "value": 292, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 292}}	36	1
646	2016-04-10 04:10:53.932724+00	2016-05-03 02:13:07.817428+00	{"integer_group": {"type": "number", "value": 293, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 293}}	36	1
640	2016-04-10 04:10:21.263836+00	2016-05-03 02:13:07.825835+00	{"integer_group": {"type": "number", "value": 287, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 287}}	36	1
647	2016-04-10 04:10:59.437855+00	2016-05-03 02:13:07.833599+00	{"integer_group": {"type": "number", "value": 294, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 294}}	36	1
648	2016-04-10 04:11:05.26445+00	2016-05-03 02:13:07.84245+00	{"integer_group": {"type": "number", "value": 295, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 295}}	36	1
649	2016-04-10 04:11:10.60941+00	2016-05-03 02:13:07.850988+00	{"integer_group": {"type": "number", "value": 296, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 296}}	36	1
650	2016-04-10 04:11:16.267494+00	2016-05-03 02:13:07.867052+00	{"integer_group": {"type": "number", "value": 297, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 297}}	36	1
656	2016-04-10 04:11:50.639255+00	2016-05-03 02:13:07.875472+00	{"integer_group": {"type": "number", "value": 303, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 303}}	36	1
641	2016-04-10 04:10:26.935682+00	2016-05-03 02:13:07.884326+00	{"integer_group": {"type": "number", "value": 288, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 288}}	36	1
660	2016-04-10 04:12:16.024198+00	2016-05-03 02:13:07.900173+00	{"integer_group": {"type": "number", "value": 307, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 307}}	36	1
642	2016-04-10 04:10:31.880388+00	2016-05-03 02:13:07.917662+00	{"integer_group": {"type": "number", "value": 289, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 289}}	36	1
623	2016-04-10 04:08:57.412312+00	2016-05-03 02:13:07.933911+00	{"integer_group": {"type": "number", "value": 270, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 270}}	36	1
681	2016-04-10 04:18:43.038226+00	2016-05-03 02:13:07.942812+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 24, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 24}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
634	2016-04-10 04:09:50.020698+00	2016-05-03 02:13:07.950361+00	{"integer_group": {"type": "number", "value": 281, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 281}}	36	1
672	2016-04-10 04:18:19.537599+00	2016-05-03 02:13:07.968652+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 15, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 15}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
833	2016-05-04 09:38:15.162879+00	2016-05-04 09:38:15.209376+00	{"integer_group": {"type": "number", "value": 24359}}	1	{"integer_group": {"type": "number", "value": 24359}}	36	1
674	2016-04-10 04:18:24.732806+00	2016-05-03 02:13:07.992502+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 17, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 17}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
673	2016-04-10 04:18:22.1139+00	2016-05-03 02:13:08.009814+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 16, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 16}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
500	2016-04-10 04:01:28.235691+00	2016-05-03 02:13:06.931223+00	{"integer_group": {"type": "number", "value": 147, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 147}}	36	1
503	2016-04-10 04:01:34.979645+00	2016-05-03 02:13:06.956642+00	{"integer_group": {"type": "number", "value": 150, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 150}}	36	1
695	2016-04-10 04:19:19.897917+00	2016-05-03 02:13:08.01751+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 38, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 38}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
487	2016-04-10 04:00:58.720227+00	2016-05-03 02:13:08.026064+00	{"integer_group": {"type": "number", "value": 134, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 134}}	36	1
509	2016-04-10 04:01:48.762192+00	2016-05-03 02:13:08.042688+00	{"integer_group": {"type": "number", "value": 156, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 156}}	36	1
707	2016-04-10 04:19:51.32069+00	2016-05-03 02:13:08.051392+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 50, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 50}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
690	2016-04-10 04:19:06.800684+00	2016-05-03 02:13:08.068388+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
708	2016-04-10 04:19:53.957806+00	2016-05-03 02:13:08.084455+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 51, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 51}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
260	2016-04-10 00:58:51.365326+00	2016-05-03 02:13:08.092667+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "60", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 60}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
834	2016-05-04 09:38:17.447983+00	2016-05-04 09:38:17.489041+00	{"integer_group": {"type": "number", "value": 24360}}	1	{"integer_group": {"type": "number", "value": 24360}}	36	1
713	2016-04-10 04:20:38.584844+00	2016-05-02 10:53:17.678418+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 13, "parsing": false}}	1	\N	28	1
686	2016-04-10 04:18:56.197399+00	2016-05-03 02:13:08.126236+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 29, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 29}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
724	2016-04-10 04:21:07.790341+00	2016-05-03 02:13:08.143081+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 24, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 24}}	28	1
412	2016-04-10 03:58:11.646575+00	2016-05-03 02:13:08.151671+00	{"integer_group": {"type": "number", "value": 59, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 59}}	36	1
497	2016-04-10 04:01:21.469149+00	2016-05-03 02:13:08.170998+00	{"integer_group": {"type": "number", "value": 144, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 144}}	36	1
725	2016-04-10 04:21:10.413966+00	2016-05-03 02:13:08.175945+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 25, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 25}}	28	1
716	2016-04-10 04:20:46.529919+00	2016-05-03 02:13:08.185109+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 16, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 16}}	28	1
703	2016-04-10 04:19:40.861736+00	2016-05-03 02:13:08.20129+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 46, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 46}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
704	2016-04-10 04:19:43.47819+00	2016-05-03 02:13:08.219082+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 47, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 47}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
720	2016-04-10 04:20:57.092067+00	2016-05-03 02:13:08.260365+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 20, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 20}}	28	1
835	2016-05-04 09:38:19.868634+00	2016-05-04 09:38:19.908898+00	{"integer_group": {"type": "number", "value": 24361}}	1	{"integer_group": {"type": "number", "value": 24361}}	36	1
727	2016-04-10 04:21:15.756944+00	2016-05-03 02:13:08.408874+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 27, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 27}}	28	1
739	2016-04-10 04:21:47.790693+00	2016-05-03 02:13:08.435683+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 39, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 39}}	28	1
729	2016-04-10 04:21:21.098564+00	2016-05-03 02:13:08.451587+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 29, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 29}}	28	1
507	2016-04-10 04:01:44.106287+00	2016-05-03 02:13:06.980963+00	{"integer_group": {"type": "number", "value": 154, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 154}}	36	1
511	2016-04-10 04:01:53.366246+00	2016-05-03 02:13:07.01457+00	{"integer_group": {"type": "number", "value": 158, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 158}}	36	1
514	2016-04-10 04:02:00.183033+00	2016-05-03 02:13:07.039459+00	{"integer_group": {"type": "number", "value": 161, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 161}}	36	1
733	2016-04-10 04:21:31.897986+00	2016-05-03 02:13:08.469015+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 33, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 33}}	28	1
717	2016-04-10 04:20:49.169205+00	2016-05-03 02:13:08.48279+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 17, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 17}}	28	1
736	2016-04-10 04:21:39.816278+00	2016-05-03 02:13:08.502404+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 36, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 36}}	28	1
734	2016-04-10 04:21:34.547691+00	2016-05-03 02:13:08.518552+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 34, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 34}}	28	1
368	2016-04-10 03:56:25.117613+00	2016-05-03 02:13:08.526624+00	{"integer_group": {"type": "number", "value": 15, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 15}}	36	1
746	2016-04-10 04:23:35.07827+00	2016-05-03 02:13:08.535666+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 12, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 12}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
836	2016-05-04 09:38:22.151154+00	2016-05-04 09:38:22.191949+00	{"integer_group": {"type": "number", "value": 24362}}	1	{"integer_group": {"type": "number", "value": 24362}}	36	1
744	2016-04-10 04:23:29.748659+00	2016-05-02 10:53:24.546432+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 14, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	\N	28	1
748	2016-04-10 04:23:40.290207+00	2016-05-03 02:13:08.552019+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 14, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 14}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
753	2016-04-10 04:23:53.612097+00	2016-05-03 02:13:08.560618+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 19, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 19}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
64	2016-03-23 21:08:09.928913+00	2016-05-03 02:13:09.121756+00	{"x_min": {"type": "number", "value": "-10", "parsing": false}, "func1": {"latex": "\\\\frac{1}{x} \\\\cos{\\\\left (x \\\\right )}", "string": "(1/x) cos(x)", "javascript": "Math.cos(x)/x", "value": "(1/x) cos(x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": "10", "parsing": false}}	1	{"x_min": {"type": "number", "value": -10}, "func1": {"latex": "\\\\frac{1}{x} \\\\cos{\\\\left (x \\\\right )}", "javascript": "Math.cos(x)/x", "type": "math", "string": "(1/x) cos(x)", "value": "(1/x) cos(x)"}, "x_max": {"type": "number", "value": 10}}	27	1
756	2016-04-10 04:24:01.593707+00	2016-05-03 02:13:08.568868+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 22, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 22}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
752	2016-04-10 04:23:50.95978+00	2016-05-03 02:13:08.585456+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 18, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 18}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
754	2016-04-10 04:23:56.269746+00	2016-05-03 02:13:08.602135+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 20, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 20}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
741	2016-04-10 04:21:53.055019+00	2016-05-03 02:13:08.610817+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 41, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 41}}	28	1
768	2016-04-10 08:39:08.424711+00	2016-05-03 02:13:08.622587+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "42", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 42}}	24	1
153	2016-04-06 18:16:30.997859+00	2016-05-03 02:13:08.638089+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}, "xMax": {"type": "number", "value": 5, "parsing": false}, "funct": {"latex": "\\\\frac{1}{x^{2} + 1}", "string": "1/(x^2+1)", "javascript": "1/(Math.pow(x, 2) + 1)", "value": "1/(x^2+1)", "parsing": false, "type": "math"}}	1	{"xMin": {"type": "number", "value": -5}, "breathDelta": {"type": "number", "value": 17}, "xMax": {"type": "number", "value": 5}, "funct": {"latex": "\\\\frac{1}{x^{2} + 1}", "javascript": "1/(Math.pow(x, 2) + 1)", "type": "math", "string": "1/(x^2+1)", "value": "1/(x^2+1)"}}	5	1
769	2016-04-10 08:56:46.582816+00	2016-05-03 02:13:08.643972+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "41", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 41}}	24	1
767	2016-04-10 07:57:16.997624+00	2016-05-02 10:53:25.655025+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "42", "parsing": false}}	1	\N	24	1
837	2016-05-04 09:38:24.456879+00	2016-05-04 09:38:24.499988+00	{"integer_group": {"type": "number", "value": 24363}}	1	{"integer_group": {"type": "number", "value": 24363}}	36	1
776	2016-04-10 09:43:33.823936+00	2016-05-02 10:53:25.858476+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "42", "parsing": false}}	1	\N	24	1
778	2016-04-10 09:54:43.435696+00	2016-05-03 02:13:08.661214+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "35", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 35}}	24	1
760	2016-04-10 04:24:12.156987+00	2016-05-03 02:13:08.672263+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 26, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 26}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
661	2016-04-10 04:12:22.484298+00	2016-05-03 02:13:08.681122+00	{"integer_group": {"type": "number", "value": 308, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 308}}	36	1
762	2016-04-10 04:24:17.458529+00	2016-05-03 02:13:08.695203+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 28, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 28}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
759	2016-04-10 04:24:09.533818+00	2016-05-03 02:13:08.710972+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 25, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 25}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
777	2016-04-10 09:50:58.891229+00	2016-05-03 02:13:08.728718+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "43", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 43}}	24	1
677	2016-04-10 04:18:32.552004+00	2016-05-03 02:13:08.736531+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 20, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 20}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
771	2016-04-10 09:01:06.41965+00	2016-05-03 02:13:08.744824+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "45", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 45}}	24	1
774	2016-04-10 09:25:06.845426+00	2016-05-03 02:13:08.752851+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "47", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 47}}	24	1
409	2016-04-10 03:58:05.041758+00	2016-05-03 02:13:08.760777+00	{"integer_group": {"type": "number", "value": 56, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 56}}	36	1
558	2016-04-10 04:05:11.069998+00	2016-05-03 02:13:08.769107+00	{"integer_group": {"type": "number", "value": 205, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 205}}	36	1
670	2016-04-10 04:18:14.265641+00	2016-05-03 02:13:08.786118+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 13, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 13}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
773	2016-04-10 09:22:48.308528+00	2016-05-03 02:13:08.795045+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "46", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 46}}	24	1
810	2016-05-03 10:06:55.893781+00	2016-05-03 10:06:56.311043+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 31}, "CHILDREN": {"type": "javascript", "value": "[4,6,-5,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 31}, "CHILDREN": {"type": "javascript", "value": "[4,6,-5,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
838	2016-05-04 09:38:26.761488+00	2016-05-04 09:38:26.799839+00	{"integer_group": {"type": "number", "value": 24364}}	1	{"integer_group": {"type": "number", "value": 24364}}	36	1
667	2016-04-10 04:18:06.220942+00	2016-05-02 10:53:30.389+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	\N	28	1
772	2016-04-10 09:22:31.074095+00	2016-05-02 10:53:30.680652+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "44", "parsing": false}}	1	\N	24	1
770	2016-04-10 09:00:11.979948+00	2016-05-03 02:13:08.819444+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "44", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 44}}	24	1
258	2016-04-10 00:52:07.766782+00	2016-05-03 02:13:08.836272+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "55", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 55}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
442	2016-04-10 03:59:17.961894+00	2016-05-03 02:13:06.506229+00	{"integer_group": {"type": "number", "value": 89, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 89}}	36	1
359	2016-04-10 03:56:05.017393+00	2016-05-03 02:13:06.555974+00	{"integer_group": {"type": "number", "value": 6, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 6}}	36	1
364	2016-04-10 03:56:16.231315+00	2016-05-03 02:13:06.581528+00	{"integer_group": {"type": "number", "value": 11, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 11}}	36	1
249	2016-04-10 00:46:13.346468+00	2016-05-03 02:13:08.853846+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "46", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 46}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
542	2016-04-10 04:03:05.226696+00	2016-05-03 02:13:08.865285+00	{"integer_group": {"type": "number", "value": 189, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 189}}	36	1
370	2016-04-10 03:56:29.481004+00	2016-05-03 02:13:08.869033+00	{"integer_group": {"type": "number", "value": 17, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 17}}	36	1
775	2016-04-10 09:25:49.300381+00	2016-05-03 02:13:08.87809+00	{"solutionPathColor": {"type": "color", "value": "#386356", "parsing": false}, "cellSize": {"type": "number", "value": "48", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3695446}, "cellSize": {"type": "number", "value": 48}}	24	1
657	2016-04-10 04:11:57.976592+00	2016-05-03 02:13:08.88614+00	{"integer_group": {"type": "number", "value": 304, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 304}}	36	1
588	2016-04-10 04:06:28.521843+00	2016-05-03 02:13:08.898775+00	{"integer_group": {"type": "number", "value": 235, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 235}}	36	1
484	2016-04-10 04:00:52.018461+00	2016-05-03 02:13:08.911354+00	{"integer_group": {"type": "number", "value": 131, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 131}}	36	1
478	2016-04-10 04:00:38.496914+00	2016-05-03 02:13:08.91941+00	{"integer_group": {"type": "number", "value": 125, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 125}}	36	1
431	2016-04-10 03:58:53.584102+00	2016-05-03 02:13:08.92814+00	{"integer_group": {"type": "number", "value": 78, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 78}}	36	1
488	2016-04-10 04:01:01.025537+00	2016-05-03 02:13:08.936316+00	{"integer_group": {"type": "number", "value": 135, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 135}}	36	1
374	2016-04-10 03:56:38.550508+00	2016-05-03 02:13:08.952988+00	{"integer_group": {"type": "number", "value": 21, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 21}}	36	1
482	2016-04-10 04:00:47.516382+00	2016-05-03 02:13:08.96964+00	{"integer_group": {"type": "number", "value": 129, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 129}}	36	1
474	2016-04-10 04:00:29.567101+00	2016-05-03 02:13:08.97823+00	{"integer_group": {"type": "number", "value": 121, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 121}}	36	1
143	2016-04-05 20:16:05.552189+00	2016-05-03 02:13:08.986664+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "15", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 6}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10495180}, "DEGREE1_COEFF": {"type": "number", "value": 25}, "DEGREE2_COEFF": {"type": "number", "value": 45}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	28	1
486	2016-04-10 04:00:56.492277+00	2016-05-03 02:13:08.99532+00	{"integer_group": {"type": "number", "value": 133, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 133}}	36	1
480	2016-04-10 04:00:43.052024+00	2016-05-03 02:13:09.01139+00	{"integer_group": {"type": "number", "value": 127, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 127}}	36	1
811	2016-05-03 10:42:58.247263+00	2016-05-03 10:42:58.382834+00	{"integer_group": {"type": "number", "value": 8353}}	1	{"integer_group": {"type": "number", "value": 8353}}	36	1
40	2016-03-22 10:38:55.463617+00	2016-05-03 02:13:09.032327+00	{"xMin": {"type": "number", "value": -5}, "breathDelta": {"type": "number", "value": 17}, "xMax": {"type": "number", "value": 5}, "funct": {"latex": "x^{5} + \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "Math.pow(x, 5) + Math.cos(2*x)", "type": "math", "string": "cos(2x) + x^5", "value": "cos(2x) + x^5"}}	1	{"xMin": {"type": "number", "value": -5}, "breathDelta": {"type": "number", "value": 17}, "xMax": {"type": "number", "value": 5}, "funct": {"latex": "x^{5} + \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "Math.pow(x, 5) + Math.cos(2*x)", "type": "math", "string": "cos(2x) + x^5", "value": "cos(2x) + x^5"}}	5	1
476	2016-04-10 04:00:34.013228+00	2016-05-03 02:13:09.044897+00	{"integer_group": {"type": "number", "value": 123, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 123}}	36	1
468	2016-04-10 04:00:16.092494+00	2016-05-03 02:13:09.053185+00	{"integer_group": {"type": "number", "value": 115, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 115}}	36	1
470	2016-04-10 04:00:20.581228+00	2016-05-03 02:13:09.061825+00	{"integer_group": {"type": "number", "value": 117, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 117}}	36	1
112	2016-04-04 19:45:38.782356+00	2016-05-03 02:13:09.070058+00	{"NUM_ITERATIONS": {"type": "number", "value": "5", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#499948", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "30", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[5,7,8,9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 4823368}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[5,7,8,9]"}, "DEGREE1_COEFF": {"type": "number", "value": 25}}	28	1
472	2016-04-10 04:00:25.089922+00	2016-05-03 02:13:09.078644+00	{"integer_group": {"type": "number", "value": 119, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 119}}	36	1
621	2016-04-10 04:08:48.434477+00	2016-05-03 02:13:09.086705+00	{"integer_group": {"type": "number", "value": 268, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 268}}	36	1
466	2016-04-10 04:00:11.629037+00	2016-05-03 02:13:09.095276+00	{"integer_group": {"type": "number", "value": 113, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 113}}	36	1
499	2016-04-10 04:01:25.981305+00	2016-05-03 02:13:09.111377+00	{"integer_group": {"type": "number", "value": 146, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 146}}	36	1
495	2016-04-10 04:01:16.921114+00	2016-05-03 02:13:06.605964+00	{"integer_group": {"type": "number", "value": 142, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 142}}	36	1
397	2016-04-10 03:57:38.113732+00	2016-05-03 02:13:06.622952+00	{"integer_group": {"type": "number", "value": 44, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 44}}	36	1
687	2016-04-10 04:18:58.839627+00	2016-05-03 02:13:09.128581+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 30, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
662	2016-04-10 04:12:28.015704+00	2016-05-03 02:13:09.136698+00	{"integer_group": {"type": "number", "value": 309, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 309}}	36	1
47	2016-03-23 08:54:27.883639+00	2016-05-03 02:13:09.154081+00	{"solutionPathColor": {"type": "color", "value": "#3673ab", "parsing": false}, "cellSize": {"type": "number", "value": "15", "parsing": false}}	1	{"solutionPathColor": {"type": "color", "value": 3568555}, "cellSize": {"type": "number", "value": 15}}	24	1
555	2016-04-10 04:05:03.761582+00	2016-05-03 02:13:09.161783+00	{"integer_group": {"type": "number", "value": 202, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 202}}	36	1
498	2016-04-10 04:01:23.736107+00	2016-05-03 02:13:09.170302+00	{"integer_group": {"type": "number", "value": 145, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 145}}	36	1
676	2016-04-10 04:18:29.94884+00	2016-05-03 02:13:09.186719+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 19, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 19}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
375	2016-04-10 03:56:40.765157+00	2016-05-03 02:13:09.195119+00	{"integer_group": {"type": "number", "value": 22, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 22}}	36	1
586	2016-04-10 04:06:22.725832+00	2016-05-03 02:13:09.203983+00	{"integer_group": {"type": "number", "value": 233, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 233}}	36	1
715	2016-04-10 04:20:43.89835+00	2016-05-03 02:13:09.212216+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 15, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 15}}	28	1
812	2016-05-03 10:43:09.343812+00	2016-05-03 10:43:09.381059+00	{"integer_group": {"type": "number", "value": 83532}}	1	{"integer_group": {"type": "number", "value": 83532}}	36	1
253	2016-04-10 00:48:23.624195+00	2016-05-02 10:53:37.70843+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	\N	28	1
757	2016-04-10 04:24:04.214167+00	2016-05-03 02:13:09.228888+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 23, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 23}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
142	2016-04-05 10:05:14.305293+00	2016-05-03 02:13:09.23728+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 50}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
457	2016-04-10 03:59:51.497+00	2016-05-03 02:13:09.245401+00	{"integer_group": {"type": "number", "value": 104, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 104}}	36	1
617	2016-04-10 04:08:29.678467+00	2016-05-03 02:13:09.254136+00	{"integer_group": {"type": "number", "value": 264, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 264}}	36	1
436	2016-04-10 03:59:04.652828+00	2016-05-03 02:13:09.261757+00	{"integer_group": {"type": "number", "value": 83, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 83}}	36	1
419	2016-04-10 03:58:27.083234+00	2016-05-03 02:13:06.631361+00	{"integer_group": {"type": "number", "value": 66, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 66}}	36	1
428	2016-04-10 03:58:46.960544+00	2016-05-03 02:13:06.656151+00	{"integer_group": {"type": "number", "value": 75, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 75}}	36	1
400	2016-04-10 03:57:44.829072+00	2016-05-03 02:13:06.680737+00	{"integer_group": {"type": "number", "value": 47, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 47}}	36	1
526	2016-04-10 04:02:27.932784+00	2016-05-03 02:13:06.714126+00	{"integer_group": {"type": "number", "value": 173, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 173}}	36	1
669	2016-04-10 04:18:11.648292+00	2016-05-03 02:13:09.279423+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 12, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 12}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
550	2016-04-10 04:03:23.741202+00	2016-05-03 02:13:09.298396+00	{"integer_group": {"type": "number", "value": 197, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 197}}	36	1
251	2016-04-10 00:46:56.196318+00	2016-05-03 02:13:09.304542+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "48", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 48}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}}	28	1
682	2016-04-10 04:18:45.652287+00	2016-05-03 02:13:09.312458+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 25, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 25}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
659	2016-04-10 04:12:10.773065+00	2016-05-03 02:13:09.320134+00	{"integer_group": {"type": "number", "value": 306, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 306}}	36	1
447	2016-04-10 03:59:29.149132+00	2016-05-03 02:13:09.328962+00	{"integer_group": {"type": "number", "value": 94, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 94}}	36	1
689	2016-04-10 04:19:04.145755+00	2016-05-03 02:13:09.345499+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 32, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 32}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
440	2016-04-10 03:59:13.475055+00	2016-05-03 02:13:09.353971+00	{"integer_group": {"type": "number", "value": 87, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 87}}	36	1
53	2016-03-23 09:12:59.693881+00	2016-05-03 02:13:05.389047+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "funct": {"latex": "\\\\frac{1}{x} \\\\left(x^{7} - 2 x^{6}\\\\right)", "string": "(x^7 - 2x^6)*(1/x)", "javascript": "(Math.pow(x, 7) - 2*Math.pow(x, 6))/x", "value": "(x^7 - 2x^6)*(1/x)", "parsing": false, "type": "math"}, "xMax": {"type": "number", "value": 5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}}	1	{"xMin": {"type": "number", "value": -5}, "funct": {"latex": "\\\\frac{1}{x} \\\\left(x^{7} - 2 x^{6}\\\\right)", "javascript": "(Math.pow(x, 7) - 2*Math.pow(x, 6))/x", "type": "math", "string": "(x^7 - 2x^6)*(1/x)", "value": "(x^7 - 2x^6)*(1/x)"}, "xMax": {"type": "number", "value": 5}, "breathDelta": {"type": "number", "value": 17}}	5	1
839	2016-05-04 09:38:29.061503+00	2016-05-04 09:38:29.099544+00	{"integer_group": {"type": "number", "value": 24365}}	1	{"integer_group": {"type": "number", "value": 24365}}	36	1
116	2016-04-05 05:46:17.532814+00	2016-05-02 10:53:40.592118+00	{"x": {"type": "number", "value": 1}, "x^4": {"type": "number", "value": 1}, "y": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 5}, "x^2y": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^3y": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 3}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	1	\N	33	1
75	2016-03-24 10:36:41.303234+00	2016-05-03 02:13:05.455868+00	{"x_min": {"type": "number", "value": "-10", "parsing": false}, "func1": {"latex": "\\\\frac{x}{2} + \\\\frac{1}{x^{3}} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x^3) cos(2x) + (1/2x)", "javascript": "x/2 + Math.cos(2*x)/Math.pow(x, 3)", "value": "(1/x^3) cos(2x) + (1/2x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": "10", "parsing": false}}	1	{"x_min": {"type": "number", "value": -10}, "func1": {"latex": "\\\\frac{x}{2} + \\\\frac{1}{x^{3}} \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "x/2 + Math.cos(2*x)/Math.pow(x, 3)", "type": "math", "string": "(1/x^3) cos(2x) + (1/2x)", "value": "(1/x^3) cos(2x) + (1/2x)"}, "x_max": {"type": "number", "value": 10}}	27	1
63	2016-03-23 11:28:03.349652+00	2016-05-03 02:13:05.505159+00	{"x_min": {"type": "number", "value": -5}, "func1": {"latex": "x \\\\cos{\\\\left (x \\\\right )}", "javascript": "x*Math.cos(x)", "type": "math", "string": "x cos(x)", "value": "x cos(x)"}, "x_max": {"type": "number", "value": 5}}	1	{"x_min": {"type": "number", "value": -5}, "func1": {"latex": "x \\\\cos{\\\\left (x \\\\right )}", "javascript": "x*Math.cos(x)", "type": "math", "string": "x cos(x)", "value": "x cos(x)"}, "x_max": {"type": "number", "value": 5}}	27	1
529	2016-04-10 04:02:34.835564+00	2016-05-03 02:13:06.73905+00	{"integer_group": {"type": "number", "value": 176, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 176}}	36	1
532	2016-04-10 04:02:41.754208+00	2016-05-03 02:13:06.764086+00	{"integer_group": {"type": "number", "value": 179, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 179}}	36	1
740	2016-04-10 04:21:50.424858+00	2016-05-03 02:13:09.370586+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 40, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 40}}	28	1
437	2016-04-10 03:59:06.852958+00	2016-05-03 02:13:09.378734+00	{"integer_group": {"type": "number", "value": 84, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 84}}	36	1
655	2016-04-10 04:11:45.320568+00	2016-05-03 02:13:09.387699+00	{"integer_group": {"type": "number", "value": 302, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 302}}	36	1
653	2016-04-10 04:11:32.470579+00	2016-05-03 02:13:09.396058+00	{"integer_group": {"type": "number", "value": 300, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 300}}	36	1
443	2016-04-10 03:59:20.181532+00	2016-05-03 02:13:09.404708+00	{"integer_group": {"type": "number", "value": 90, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 90}}	36	1
445	2016-04-10 03:59:24.66602+00	2016-05-03 02:13:09.431265+00	{"integer_group": {"type": "number", "value": 92, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 92}}	36	1
553	2016-04-10 04:03:30.715531+00	2016-05-03 02:13:09.437731+00	{"integer_group": {"type": "number", "value": 200, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 200}}	36	1
551	2016-04-10 04:03:26.052135+00	2016-05-03 02:13:09.446171+00	{"integer_group": {"type": "number", "value": 198, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 198}}	36	1
692	2016-04-10 04:19:12.030408+00	2016-05-03 02:13:09.454302+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 35, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 35}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
552	2016-04-10 04:03:28.416128+00	2016-05-03 02:13:09.471357+00	{"integer_group": {"type": "number", "value": 199, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 199}}	36	1
574	2016-04-10 04:05:50.358874+00	2016-05-03 02:13:09.492783+00	{"integer_group": {"type": "number", "value": 221, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 221}}	36	1
575	2016-04-10 04:05:52.899107+00	2016-05-03 02:13:09.504004+00	{"integer_group": {"type": "number", "value": 222, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 222}}	36	1
577	2016-04-10 04:05:58.232511+00	2016-05-03 02:13:09.513089+00	{"integer_group": {"type": "number", "value": 224, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 224}}	36	1
578	2016-04-10 04:06:00.750947+00	2016-05-03 02:13:09.521689+00	{"integer_group": {"type": "number", "value": 225, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 225}}	36	1
65	2016-03-23 22:39:01.575238+00	2016-05-03 02:13:05.52995+00	{"x_min": {"type": "number", "value": "-10", "parsing": false}, "func1": {"latex": "\\\\frac{x}{2} \\\\cos{\\\\left (16 x \\\\right )} + \\\\frac{1}{x} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x) cos(2x) + (1/2x) cos(16x)", "javascript": "x*Math.cos(16*x)/2 + Math.cos(2*x)/x", "value": "(1/x) cos(2x) + (1/2x) cos(16x)", "parsing": false, "type": "math"}, "x_max": {"type": "number", "value": "10", "parsing": false}}	1	{"x_min": {"type": "number", "value": -10}, "func1": {"latex": "\\\\frac{x}{2} \\\\cos{\\\\left (16 x \\\\right )} + \\\\frac{1}{x} \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "x*Math.cos(16*x)/2 + Math.cos(2*x)/x", "type": "math", "string": "(1/x) cos(2x) + (1/2x) cos(16x)", "value": "(1/x) cos(2x) + (1/2x) cos(16x)"}, "x_max": {"type": "number", "value": 10}}	27	1
106	2016-04-04 07:55:44.437638+00	2016-05-03 02:13:05.546328+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a024cc", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "10", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 6}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10495180}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 10}, "DEGREE2_COEFF": {"type": "number", "value": 45}, "CHILDREN": {"type": "javascript", "value": "[4,5,6,7,-8,-9]"}, "DEGREE1_COEFF": {"type": "number", "value": 25}}	28	1
815	2016-05-04 08:27:43.313526+00	2016-05-04 08:27:43.584895+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#4124cc"}, "DEGREE1_COEFF": {"type": "number", "value": 14}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 4269260}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 14}}	28	1
115	2016-04-04 19:48:27.285357+00	2016-05-03 02:13:05.615351+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "funct": {"latex": "x^{7} + x \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) + x^7", "javascript": "Math.pow(x, 7) + x*Math.cos(x)", "value": "x cos(x) + x^7", "parsing": false, "type": "math"}, "xMax": {"type": "number", "value": 5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}}	1	{"xMin": {"type": "number", "value": -5}, "funct": {"latex": "x^{7} + x \\\\cos{\\\\left (x \\\\right )}", "javascript": "Math.pow(x, 7) + x*Math.cos(x)", "type": "math", "string": "x cos(x) + x^7", "value": "x cos(x) + x^7"}, "xMax": {"type": "number", "value": 5}, "breathDelta": {"type": "number", "value": 17}}	5	1
535	2016-04-10 04:02:48.879273+00	2016-05-03 02:13:06.789543+00	{"integer_group": {"type": "number", "value": 182, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 182}}	36	1
539	2016-04-10 04:02:58.225092+00	2016-05-03 02:13:06.822357+00	{"integer_group": {"type": "number", "value": 186, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 186}}	36	1
543	2016-04-10 04:03:07.531843+00	2016-05-03 02:13:06.847488+00	{"integer_group": {"type": "number", "value": 190, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 190}}	36	1
105	2016-04-04 07:54:29.494834+00	2016-05-03 02:13:05.62097+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "60", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[5,7,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 6}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 25}, "DEGREE2_COEFF": {"type": "number", "value": 60}, "CHILDREN": {"type": "javascript", "value": "[5,7,-9]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
104	2016-04-04 07:49:38.987263+00	2016-05-03 02:13:05.646483+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,7,17,-8,-9]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 45}, "CHILDREN": {"type": "javascript", "value": "[4,6,7,17,-8,-9]"}, "DEGREE1_COEFF": {"type": "number", "value": 25}}	28	1
688	2016-04-10 04:19:01.501943+00	2016-05-03 02:13:05.671388+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 31, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 31}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
840	2016-05-04 09:38:31.336962+00	2016-05-04 09:38:31.374324+00	{"integer_group": {"type": "number", "value": 24366}}	1	{"integer_group": {"type": "number", "value": 24366}}	36	1
103	2016-04-04 07:47:57.142102+00	2016-05-03 02:13:05.713735+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 6}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 50}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
255	2016-04-10 00:48:52.246514+00	2016-05-03 02:13:05.751369+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "52", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 52}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
816	2016-05-04 09:08:59.07525+00	2016-05-04 09:08:59.382175+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 32}, "CHILDREN": {"type": "javascript", "value": "[4,6,-5,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 32}, "CHILDREN": {"type": "javascript", "value": "[4,6,-5,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
701	2016-04-10 04:19:35.645194+00	2016-05-03 02:13:05.802+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 44, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 44}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
146	2016-04-06 18:11:31.543572+00	2016-05-03 02:13:05.821803+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "45", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 45}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}}	28	1
841	2016-05-04 09:38:33.712568+00	2016-05-04 09:38:33.757336+00	{"integer_group": {"type": "number", "value": 24367}}	1	{"integer_group": {"type": "number", "value": 24367}}	36	1
546	2016-04-10 04:03:14.547248+00	2016-05-03 02:13:06.872518+00	{"integer_group": {"type": "number", "value": 193, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 193}}	36	1
549	2016-04-10 04:03:21.453156+00	2016-05-03 02:13:06.897949+00	{"integer_group": {"type": "number", "value": 196, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 196}}	36	1
123	2016-04-05 06:25:40.164642+00	2016-05-03 02:13:09.564013+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "1", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": "30", "parsing": false}, "xy^3": {"type": "number", "value": "-75", "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}}	1	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 1}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 30}, "xy^3": {"type": "number", "value": -75}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^4": {"type": "number", "value": -3}, "xy^4": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "y^2": {"type": "number", "value": 2}}	33	1
668	2016-04-10 04:18:09.04142+00	2016-05-03 02:13:09.570862+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 11, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 11}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
141	2016-04-05 09:55:33.780039+00	2016-05-03 02:13:05.838209+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 50}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
257	2016-04-10 00:49:27.006606+00	2016-05-03 02:13:05.98913+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "53", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 53}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
261	2016-04-10 00:59:01.922627+00	2016-05-03 02:13:06.080308+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "61", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 61}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
252	2016-04-10 00:47:07.458277+00	2016-05-03 02:13:06.130325+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "49", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 49}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}}	28	1
446	2016-04-10 03:59:26.917455+00	2016-05-03 02:13:06.205226+00	{"integer_group": {"type": "number", "value": 93, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 93}}	36	1
433	2016-04-10 03:58:58.044921+00	2016-05-03 02:13:06.238769+00	{"integer_group": {"type": "number", "value": 80, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 80}}	36	1
441	2016-04-10 03:59:15.716613+00	2016-05-03 02:13:06.264207+00	{"integer_group": {"type": "number", "value": 88, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 88}}	36	1
254	2016-04-10 00:48:35.479621+00	2016-05-03 02:13:06.2722+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "51", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 51}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
475	2016-04-10 04:00:31.794591+00	2016-05-03 02:13:06.380517+00	{"integer_group": {"type": "number", "value": 122, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 122}}	36	1
489	2016-04-10 04:01:03.2681+00	2016-05-03 02:13:06.406821+00	{"integer_group": {"type": "number", "value": 136, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 136}}	36	1
363	2016-04-10 03:56:13.981485+00	2016-05-03 02:13:06.439753+00	{"integer_group": {"type": "number", "value": 10, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 10}}	36	1
493	2016-04-10 04:01:12.325835+00	2016-05-03 02:13:06.464576+00	{"integer_group": {"type": "number", "value": 140, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 140}}	36	1
517	2016-04-10 04:02:07.103467+00	2016-05-03 02:13:07.064867+00	{"integer_group": {"type": "number", "value": 164, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 164}}	36	1
520	2016-04-10 04:02:14.100098+00	2016-05-03 02:13:07.089778+00	{"integer_group": {"type": "number", "value": 167, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 167}}	36	1
585	2016-04-10 04:06:19.884766+00	2016-05-03 02:13:07.122839+00	{"integer_group": {"type": "number", "value": 232, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 232}}	36	1
453	2016-04-10 03:59:42.493386+00	2016-05-03 02:13:07.139597+00	{"integer_group": {"type": "number", "value": 100, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 100}}	36	1
524	2016-04-10 04:02:23.292627+00	2016-05-03 02:13:07.165165+00	{"integer_group": {"type": "number", "value": 171, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 171}}	36	1
597	2016-04-10 04:07:00.371716+00	2016-05-03 02:13:07.189965+00	{"integer_group": {"type": "number", "value": 244, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 244}}	36	1
598	2016-04-10 04:07:04.561794+00	2016-05-03 02:13:07.214581+00	{"integer_group": {"type": "number", "value": 245, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 245}}	36	1
601	2016-04-10 04:07:18.959801+00	2016-05-03 02:13:07.239826+00	{"integer_group": {"type": "number", "value": 248, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 248}}	36	1
605	2016-04-10 04:07:37.689194+00	2016-05-03 02:13:07.272909+00	{"integer_group": {"type": "number", "value": 252, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 252}}	36	1
608	2016-04-10 04:07:50.164554+00	2016-05-03 02:13:07.298138+00	{"integer_group": {"type": "number", "value": 255, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 255}}	36	1
611	2016-04-10 04:08:03.139482+00	2016-05-03 02:13:07.323169+00	{"integer_group": {"type": "number", "value": 258, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 258}}	36	1
615	2016-04-10 04:08:21.194672+00	2016-05-03 02:13:07.356252+00	{"integer_group": {"type": "number", "value": 262, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 262}}	36	1
560	2016-04-10 04:05:15.764652+00	2016-05-03 02:13:07.381366+00	{"integer_group": {"type": "number", "value": 207, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 207}}	36	1
562	2016-04-10 04:05:20.530721+00	2016-05-03 02:13:07.406222+00	{"integer_group": {"type": "number", "value": 209, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 209}}	36	1
565	2016-04-10 04:05:27.819055+00	2016-05-03 02:13:07.431391+00	{"integer_group": {"type": "number", "value": 212, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 212}}	36	1
569	2016-04-10 04:05:37.767365+00	2016-05-03 02:13:07.465302+00	{"integer_group": {"type": "number", "value": 216, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 216}}	36	1
572	2016-04-10 04:05:45.218974+00	2016-05-03 02:13:07.490013+00	{"integer_group": {"type": "number", "value": 219, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 219}}	36	1
582	2016-04-10 04:06:11.445484+00	2016-05-03 02:13:07.515553+00	{"integer_group": {"type": "number", "value": 229, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 229}}	36	1
630	2016-04-10 04:09:29.075029+00	2016-05-03 02:13:07.548419+00	{"integer_group": {"type": "number", "value": 277, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 277}}	36	1
632	2016-04-10 04:09:39.906325+00	2016-05-03 02:13:07.573215+00	{"integer_group": {"type": "number", "value": 279, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 279}}	36	1
590	2016-04-10 04:06:34.78839+00	2016-05-03 02:13:07.598344+00	{"integer_group": {"type": "number", "value": 237, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 237}}	36	1
593	2016-04-10 04:06:44.652254+00	2016-05-03 02:13:07.623595+00	{"integer_group": {"type": "number", "value": 240, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 240}}	36	1
664	2016-04-10 04:12:41.067159+00	2016-05-03 02:13:07.649812+00	{"integer_group": {"type": "number", "value": 311, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 311}}	36	1
627	2016-04-10 04:09:14.175024+00	2016-05-03 02:13:07.708313+00	{"integer_group": {"type": "number", "value": 274, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 274}}	36	1
631	2016-04-10 04:09:34.412863+00	2016-05-03 02:13:07.733732+00	{"integer_group": {"type": "number", "value": 278, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 278}}	36	1
678	2016-04-10 04:18:35.166561+00	2016-05-03 02:13:07.741768+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 21, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 21}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
654	2016-04-10 04:11:38.805291+00	2016-05-03 02:13:07.859088+00	{"integer_group": {"type": "number", "value": 301, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 301}}	36	1
658	2016-04-10 04:12:03.683237+00	2016-05-03 02:13:07.892433+00	{"integer_group": {"type": "number", "value": 305, "parsing": false}}	1	{"integer_group": {"type": "number", "value": 305}}	36	1
842	2016-05-04 09:38:36.006923+00	2016-05-04 09:38:36.048765+00	{"integer_group": {"type": "number", "value": 24368}}	1	{"integer_group": {"type": "number", "value": 24368}}	36	1
680	2016-04-10 04:18:40.405551+00	2016-05-03 02:13:07.909621+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 23, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 23}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
679	2016-04-10 04:18:37.77669+00	2016-05-03 02:13:07.925704+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 22, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 22}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
685	2016-04-10 04:18:53.515426+00	2016-05-03 02:13:07.958847+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 28, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 28}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
696	2016-04-10 04:19:22.521396+00	2016-05-03 02:13:07.975596+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 39, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 39}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
694	2016-04-10 04:19:17.244852+00	2016-05-03 02:13:07.984063+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 37, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 37}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
683	2016-04-10 04:18:48.262291+00	2016-05-03 02:13:08.001515+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 26, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 26}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
691	2016-04-10 04:19:09.399507+00	2016-05-03 02:13:08.034946+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 34, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 34}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
706	2016-04-10 04:19:48.716218+00	2016-05-03 02:13:08.059797+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 49, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 49}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
843	2016-05-04 09:38:38.293919+00	2016-05-04 09:38:38.331922+00	{"integer_group": {"type": "number", "value": 24369}}	1	{"integer_group": {"type": "number", "value": 24369}}	36	1
705	2016-04-10 04:19:46.10135+00	2016-05-03 02:13:08.076246+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 48, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 48}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
711	2016-04-10 04:20:33.334932+00	2016-05-03 02:13:08.101873+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 11, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 11}}	28	1
698	2016-04-10 04:19:27.82335+00	2016-05-03 02:13:08.110077+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 41, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 41}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
700	2016-04-10 04:19:33.022765+00	2016-05-03 02:13:08.118403+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 43, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 43}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
710	2016-04-10 04:20:30.471201+00	2016-05-03 02:13:08.134796+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
723	2016-04-10 04:21:05.084696+00	2016-05-03 02:13:08.159937+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 23, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 23}}	28	1
718	2016-04-10 04:20:51.827277+00	2016-05-03 02:13:08.193352+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 18, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 18}}	28	1
702	2016-04-10 04:19:38.235004+00	2016-05-03 02:13:08.209809+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 45, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 45}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
844	2016-05-04 09:38:40.610957+00	2016-05-04 09:38:40.66496+00	{"integer_group": {"type": "number", "value": 24370}}	1	{"integer_group": {"type": "number", "value": 24370}}	36	1
719	2016-04-10 04:20:54.439086+00	2016-05-03 02:13:08.29412+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 19, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 19}}	28	1
722	2016-04-10 04:21:02.445856+00	2016-05-03 02:13:08.319068+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 22, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 22}}	28	1
737	2016-04-10 04:21:42.479938+00	2016-05-03 02:13:08.443457+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 37, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 37}}	28	1
731	2016-04-10 04:21:26.564571+00	2016-05-03 02:13:08.460304+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 31, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 31}}	28	1
732	2016-04-10 04:21:29.238505+00	2016-05-03 02:13:08.493855+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 32, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 32}}	28	1
735	2016-04-10 04:21:37.192809+00	2016-05-03 02:13:08.510531+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 35, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 35}}	28	1
747	2016-04-10 04:23:37.682668+00	2016-05-03 02:13:08.543472+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 13, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 13}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
750	2016-04-10 04:23:45.707178+00	2016-05-03 02:13:08.577057+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 16, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 16}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
751	2016-04-10 04:23:48.333689+00	2016-05-03 02:13:08.594461+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 17, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 17}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
726	2016-04-10 04:21:13.066914+00	2016-05-03 02:13:08.627277+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 26, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 26}}	28	1
758	2016-04-10 04:24:06.896078+00	2016-05-03 02:13:08.65244+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 24, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 24}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
259	2016-04-10 00:52:48.503112+00	2016-05-03 02:13:08.685974+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "56", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 56}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
712	2016-04-10 04:20:35.97862+00	2016-05-03 02:13:08.702485+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 12, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 12}}	28	1
761	2016-04-10 04:24:14.787528+00	2016-05-03 02:13:08.719416+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 27, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 27}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
98	2016-04-04 07:40:38.858672+00	2016-05-03 02:13:08.778554+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#a653d9", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15, "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 30, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,-5,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "30", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6,-5,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
721	2016-04-10 04:20:59.774197+00	2016-05-03 02:13:08.811824+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 21, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 21}}	28	1
738	2016-04-10 04:21:45.138856+00	2016-05-03 02:13:08.827828+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 38, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 38}}	28	1
684	2016-04-10 04:18:50.86658+00	2016-05-03 02:13:08.844646+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 27, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 27}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
250	2016-04-10 00:46:25.085775+00	2016-05-03 02:13:08.945464+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#7a5229", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "47", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 8016425}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 47}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
714	2016-04-10 04:20:41.241443+00	2016-05-03 02:13:08.961385+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 14, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 14}}	28	1
111	2016-04-04 19:45:13.324274+00	2016-05-03 02:13:09.003291+00	{"NUM_ITERATIONS": {"type": "number", "value": "6", "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#499948", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "30", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[5,7,-9]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 6}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 4823368}, "DEGREE1_COEFF": {"type": "number", "value": 25}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[5,7,-9]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
730	2016-04-10 04:21:23.783042+00	2016-05-03 02:13:09.019687+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 30, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
755	2016-04-10 04:23:58.963455+00	2016-05-03 02:13:09.103466+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 21, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 21}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
742	2016-04-10 04:21:55.693269+00	2016-05-03 02:13:09.14525+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 42, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 42}}	28	1
102	2016-04-04 07:47:34.820864+00	2016-05-03 02:13:09.179181+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 50}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}}	28	1
749	2016-04-10 04:23:42.923925+00	2016-05-03 02:13:09.220164+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#9050b8", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 15, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9457848}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 15}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 13}}	28	1
699	2016-04-10 04:19:30.419461+00	2016-05-03 02:13:09.270365+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 42, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 42}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
697	2016-04-10 04:19:25.149973+00	2016-05-03 02:13:09.286941+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 40, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 40}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
671	2016-04-10 04:18:16.93155+00	2016-05-03 02:13:09.337905+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 14, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 14}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
693	2016-04-10 04:19:14.635923+00	2016-05-03 02:13:09.362406+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 36, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 36}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}}	28	1
728	2016-04-10 04:21:18.452238+00	2016-05-03 02:13:09.421368+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": 33, "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": 28, "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 33}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7]"}, "DEGREE1_COEFF": {"type": "number", "value": 28}}	28	1
148	2016-04-06 18:13:10.907124+00	2016-05-03 02:13:09.479766+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "13", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "50", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7,16,18]", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "25", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "DEGREE1_COEFF": {"type": "number", "value": 13}, "DEGREE2_COEFF": {"type": "number", "value": 50}, "CHILDREN": {"type": "javascript", "value": "[4,6,8,-7,16,18]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 25}}	28	1
124	2016-04-05 06:26:33.637942+00	2016-05-03 02:13:09.535659+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": "-22", "parsing": false}, "y^5": {"type": "number", "value": "-2", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "244", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": "25", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}}	1	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -22}, "y^5": {"type": "number", "value": -2}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 244}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^4": {"type": "number", "value": -3}, "xy^4": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "y^2": {"type": "number", "value": 25}}	33	1
823	2016-05-04 09:18:04.209313+00	2016-05-04 09:18:04.374088+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 16}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 16}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
850	2016-05-04 09:54:25.423159+00	2016-05-04 09:54:25.619717+00	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 2}, "speed_coefficient": {"type": "number", "value": 5}}	1	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 2}, "speed_coefficient": {"type": "number", "value": 5}}	39	1
117	2016-04-05 06:17:50.017894+00	2016-05-03 02:13:09.547292+00	{"x^3y": {"type": "number", "value": 0, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": 5, "parsing": false}, "x^2y": {"type": "number", "value": "0", "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "x^4": {"type": "number", "value": "4", "parsing": false}, "x^5": {"type": "number", "value": 3, "parsing": false}, "xy^4": {"type": "number", "value": 1, "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	1	{"x^4": {"type": "number", "value": 4}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 5}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 3}, "xy^4": {"type": "number", "value": 1}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
120	2016-04-05 06:23:49.753846+00	2016-05-03 02:13:09.55426+00	{"x^4": {"type": "number", "value": "4", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "0", "parsing": false}, "x^2y": {"type": "number", "value": "2", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "xy^4": {"type": "number", "value": 1, "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	1	{"xy": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 0}, "x^2y": {"type": "number", "value": 2}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^4": {"type": "number", "value": 4}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 1}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
121	2016-04-05 06:24:54.910974+00	2016-05-03 02:13:09.596155+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "0", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}}	1	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 0}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	33	1
862	2016-05-10 21:37:07.42399+00	2016-05-10 21:37:07.88998+00	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": 0}, "y^5": {"type": "number", "value": 0}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 0}, "xy^3": {"type": "number", "value": 0}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	1	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": 0}, "y^5": {"type": "number", "value": 0}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 0}, "xy^3": {"type": "number", "value": 0}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "x^4": {"type": "number", "value": -3}, "xy^4": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "y^2": {"type": "number", "value": 0}}	33	1
818	2016-05-04 09:11:06.434139+00	2016-05-04 09:11:06.731218+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
866	2016-05-10 21:38:08.62636+00	2016-05-10 21:38:08.982021+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 2}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 2}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
868	2016-05-10 21:38:16.100923+00	2016-05-10 21:38:16.481157+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 4}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 4}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
819	2016-05-04 09:11:24.302721+00	2016-05-04 09:11:24.453258+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#9162af"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9527983}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
867	2016-05-10 21:38:12.398572+00	2016-05-10 21:38:12.756611+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 3}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 3}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
863	2016-05-10 21:37:30.892513+00	2016-05-10 21:37:31.254192+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": -6}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 0}, "xy^3": {"type": "number", "value": 0}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "x^4": {"type": "number", "value": -3}, "xy^4": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "y^2": {"type": "number", "value": 0}}	1	{"xy": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": -6}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 0}, "xy^3": {"type": "number", "value": 0}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "x^4": {"type": "number", "value": -3}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
869	2016-05-10 21:38:19.879429+00	2016-05-10 21:38:20.239211+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 5}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 5}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
820	2016-05-04 09:11:37.301282+00	2016-05-04 09:11:37.443056+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#9162af"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6,-2]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 9527983}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,6,-2]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
854	2016-05-09 03:10:21.494193+00	2016-05-09 03:10:21.742181+00	{"integer_group": {"type": "number", "value": 1235}}	1	{"integer_group": {"type": "number", "value": 1235}}	36	1
101	2016-04-04 07:47:13.888289+00	2016-05-03 02:13:09.580456+00	{"NUM_ITERATIONS": {"type": "number", "value": 5, "parsing": false}, "COLOR1": {"type": "color", "value": "#785A3C", "parsing": false}, "COLOR2": {"type": "color", "value": "#27cc24", "parsing": false}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": "20", "parsing": false}, "DEGREE2_COEFF": {"type": "number", "value": "17", "parsing": false}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}, "DEGREE1_COEFF": {"type": "number", "value": "25", "parsing": false}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 2608164}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 20}, "DEGREE2_COEFF": {"type": "number", "value": 17}, "CHILDREN": {"type": "javascript", "value": "[8,15,17,-9,-16]"}, "DEGREE1_COEFF": {"type": "number", "value": 25}}	28	1
821	2016-05-04 09:17:36.537654+00	2016-05-04 09:17:36.803134+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,3]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,3]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
855	2016-05-09 08:49:09.426499+00	2016-05-09 08:49:09.480131+00	{"integer_group": {"type": "number", "value": 8932}}	1	{"integer_group": {"type": "number", "value": 8932}}	36	1
864	2016-05-10 21:37:42.588281+00	2016-05-10 21:37:42.985373+00	{"xy": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": -6}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "x^4": {"type": "number", "value": -3}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	1	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": -6}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	33	1
822	2016-05-04 09:17:47.842035+00	2016-05-04 09:17:47.984771+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 30}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
849	2016-05-04 09:54:11.634679+00	2016-05-04 09:54:11.712926+00	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 2}, "speed_coefficient": {"type": "number", "value": 1}}	1	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 2}, "speed_coefficient": {"type": "number", "value": 1}}	39	1
856	2016-05-09 08:52:37.546314+00	2016-05-09 08:52:37.581033+00	{"integer_group": {"type": "number", "value": 823}}	1	{"integer_group": {"type": "number", "value": 823}}	36	1
824	2016-05-04 09:18:06.750124+00	2016-05-04 09:18:06.898641+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 17}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 17}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
851	2016-05-04 09:54:49.562518+00	2016-05-04 09:54:49.632466+00	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 2}, "speed_coefficient": {"type": "number", "value": 15}}	1	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 2}, "speed_coefficient": {"type": "number", "value": 15}}	39	1
865	2016-05-10 21:38:04.493597+00	2016-05-10 21:38:04.926521+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 1}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 1}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
125	2016-04-05 06:26:50.118772+00	2016-05-03 02:13:09.588756+00	{"x^4": {"type": "number", "value": "-3", "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "y^4": {"type": "number", "value": "-22", "parsing": false}, "y^5": {"type": "number", "value": "-2", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "45", "parsing": false}, "y^3": {"type": "number", "value": "-15", "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": "25", "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	1	{"xy": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 25}, "y^4": {"type": "number", "value": -22}, "y^5": {"type": "number", "value": -2}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 45}, "y^3": {"type": "number", "value": -15}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^4": {"type": "number", "value": -3}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
825	2016-05-04 09:18:09.361131+00	2016-05-04 09:18:09.514994+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 18}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 18}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
852	2016-05-04 09:55:42.051547+00	2016-05-04 09:55:42.124221+00	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 6}, "speed_coefficient": {"type": "number", "value": 12}}	1	{"rx": {"type": "number", "value": 2}, "ry": {"type": "number", "value": 6}, "speed_coefficient": {"type": "number", "value": 12}}	39	1
55	2016-03-23 09:19:47.981376+00	2016-05-03 02:13:09.609966+00	{"xMin": {"type": "number", "value": -5, "parsing": false}, "funct": {"latex": "x^{5} + \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x^5 +  cos(x) * sin(2x)", "javascript": "Math.pow(x, 5) + Math.sin(2*x)*Math.cos(x)", "value": "x^5 +  cos(x) * sin(2x)", "parsing": false, "type": "math"}, "xMax": {"type": "number", "value": 5, "parsing": false}, "breathDelta": {"type": "number", "value": 17, "parsing": false}}	1	{"xMin": {"type": "number", "value": -5}, "funct": {"latex": "x^{5} + \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "javascript": "Math.pow(x, 5) + Math.sin(2*x)*Math.cos(x)", "type": "math", "string": "x^5 +  cos(x) * sin(2x)", "value": "x^5 +  cos(x) * sin(2x)"}, "xMax": {"type": "number", "value": 5}, "breathDelta": {"type": "number", "value": 17}}	5	1
853	2016-05-04 09:59:20.649695+00	2016-05-04 09:59:20.84966+00	{"x_min": {"type": "number", "value": -30}, "func1": {"type": "math", "value": "(1/x) cos(2x) + (1/2x) cos(16x)"}, "x_max": {"type": "number", "value": 30}}	1	{"x_min": {"type": "number", "value": -30}, "func1": {"latex": "\\\\frac{x}{2} \\\\cos{\\\\left (16 x \\\\right )} + \\\\frac{1}{x} \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "x*Math.cos(16*x)/2 + Math.cos(2*x)/x", "type": "math", "string": "(1/x) cos(2x) + (1/2x) cos(16x)", "value": "(1/x) cos(2x) + (1/2x) cos(16x)"}, "x_max": {"type": "number", "value": 30}}	27	1
826	2016-05-04 09:18:11.970551+00	2016-05-04 09:18:12.114722+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 19}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 19}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
119	2016-04-05 06:23:18.176285+00	2016-05-03 02:13:09.621811+00	{"x": {"type": "number", "value": "5", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "14", "parsing": false}, "x^2y": {"type": "number", "value": "2", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "xy": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "xy^4": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^5": {"type": "number", "value": 3, "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}, "x^4": {"type": "number", "value": "4", "parsing": false}}	1	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 14}, "x^2y": {"type": "number", "value": 2}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^4": {"type": "number", "value": 4}, "xy^4": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 3}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "y^2": {"type": "number", "value": 2}}	33	1
122	2016-04-05 06:25:11.60841+00	2016-05-03 02:13:09.62983+00	{"xy": {"type": "number", "value": 1, "parsing": false}, "y^2": {"type": "number", "value": 2, "parsing": false}, "y^4": {"type": "number", "value": -2, "parsing": false}, "y^5": {"type": "number", "value": "-2", "parsing": false}, "x^2y": {"type": "number", "value": "20", "parsing": false}, "x^3y": {"type": "number", "value": "2", "parsing": false}, "y^3": {"type": "number", "value": 3, "parsing": false}, "xy^3": {"type": "number", "value": 7, "parsing": false}, "xy^2": {"type": "number", "value": 0, "parsing": false}, "x^3": {"type": "number", "value": 1, "parsing": false}, "x^2": {"type": "number", "value": 1, "parsing": false}, "x^3y^2": {"type": "number", "value": 1, "parsing": false}, "x^4": {"type": "number", "value": "-3", "parsing": false}, "x^5": {"type": "number", "value": "0", "parsing": false}, "xy^4": {"type": "number", "value": "0", "parsing": false}, "y": {"type": "number", "value": "3", "parsing": false}, "x": {"type": "number", "value": "5", "parsing": false}, "x^2y^3": {"type": "number", "value": 1, "parsing": false}, "x^2y^2": {"type": "number", "value": -13, "parsing": false}, "x^4y": {"type": "number", "value": -5, "parsing": false}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -2}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
827	2016-05-04 09:18:14.566506+00	2016-05-04 09:18:14.731079+00	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": "#785A3C"}, "COLOR2": {"type": "color", "value": "#a653d9"}, "DEGREE1_COEFF": {"type": "number", "value": 30}, "DEGREE2_COEFF": {"type": "number", "value": 20}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}}	1	{"NUM_ITERATIONS": {"type": "number", "value": 5}, "COLOR1": {"type": "color", "value": 7887420}, "COLOR2": {"type": "color", "value": 10900441}, "TRAPEZOIDAL_SECTIONS": {"type": "number", "value": 15}, "DEGREE2_COEFF": {"type": "number", "value": 20}, "CHILDREN": {"type": "javascript", "value": "[4,-6]"}, "DEGREE1_COEFF": {"type": "number", "value": 30}}	28	1
870	2016-05-10 21:38:23.55024+00	2016-05-10 21:38:23.907774+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 6}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 6}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
871	2016-05-10 21:38:27.370563+00	2016-05-10 21:38:27.748944+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 7}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 7}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
872	2016-05-10 21:38:31.045668+00	2016-05-10 21:38:31.406543+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 8}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 8}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
873	2016-05-10 21:38:34.960236+00	2016-05-10 21:38:35.322335+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 9}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 9}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
874	2016-05-10 21:38:38.632069+00	2016-05-10 21:38:38.988675+00	{"x": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 10}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 0}, "y^4": {"type": "number", "value": -4}, "y^5": {"type": "number", "value": 10}, "x^2y": {"type": "number", "value": 0}, "x^3y": {"type": "number", "value": 0}, "y^3": {"type": "number", "value": 5}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 0}, "xy": {"type": "number", "value": 0}, "x^3y^2": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 0}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 0}, "x": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 0}, "x^2y^2": {"type": "number", "value": 0}, "x^4y": {"type": "number", "value": -5}}	33	1
875	2016-05-10 21:39:39.015217+00	2016-05-10 21:39:39.371006+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -20}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -20}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
876	2016-05-10 21:39:43.654474+00	2016-05-10 21:39:44.012678+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -19}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -19}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
877	2016-05-10 21:39:48.227742+00	2016-05-10 21:39:48.587409+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -18}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -18}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
878	2016-05-10 21:39:52.905067+00	2016-05-10 21:39:53.261504+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -17}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -17}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
879	2016-05-10 21:39:57.376344+00	2016-05-10 21:39:57.743863+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -16}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -16}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
880	2016-05-10 21:40:02.082692+00	2016-05-10 21:40:02.443991+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -15}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -15}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
881	2016-05-10 21:40:06.722021+00	2016-05-10 21:40:07.076104+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -14}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -14}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
882	2016-05-10 21:40:11.677495+00	2016-05-10 21:40:12.118052+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -13}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -13}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
883	2016-05-10 21:40:16.629231+00	2016-05-10 21:40:16.983867+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -12}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -12}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
884	2016-05-10 21:40:21.383843+00	2016-05-10 21:40:21.741701+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -11}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -11}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
885	2016-05-10 21:40:26.239757+00	2016-05-10 21:40:26.599326+00	{"x": {"type": "number", "value": 5}, "y": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -10}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "xy^4": {"type": "number", "value": 0}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 0}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}, "x^4": {"type": "number", "value": -3}}	1	{"x^4": {"type": "number", "value": -3}, "x^2": {"type": "number", "value": 1}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": -10}, "x^2y": {"type": "number", "value": 20}, "x^3y": {"type": "number", "value": 2}, "y^3": {"type": "number", "value": 3}, "xy^3": {"type": "number", "value": 7}, "xy^2": {"type": "number", "value": 0}, "x^3": {"type": "number", "value": 1}, "xy": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^5": {"type": "number", "value": 0}, "xy^4": {"type": "number", "value": 0}, "y": {"type": "number", "value": 3}, "x": {"type": "number", "value": 5}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "x^4y": {"type": "number", "value": -5}}	33	1
886	2016-05-15 02:57:51.940274+00	2016-05-15 02:57:51.962131+00	{"integer_group": {"type": "number", "value": 410}}	1	{"integer_group": {"type": "number", "value": 410}}	36	1
905	2016-05-15 02:58:26.686481+00	2016-05-15 02:58:26.694524+00	{"integer_group": {"type": "number", "value": 430}}	1	{"integer_group": {"type": "number", "value": 430}}	36	1
887	2016-05-15 02:57:53.717344+00	2016-05-15 02:57:53.726188+00	{"integer_group": {"type": "number", "value": 411}}	1	{"integer_group": {"type": "number", "value": 411}}	36	1
894	2016-05-15 02:58:05.953163+00	2016-05-15 02:58:05.969427+00	{"integer_group": {"type": "number", "value": 418}}	1	{"integer_group": {"type": "number", "value": 418}}	36	1
888	2016-05-15 02:57:55.466111+00	2016-05-15 02:57:55.474847+00	{"integer_group": {"type": "number", "value": 412}}	1	{"integer_group": {"type": "number", "value": 412}}	36	1
889	2016-05-15 02:57:57.206126+00	2016-05-15 02:57:57.214356+00	{"integer_group": {"type": "number", "value": 413}}	1	{"integer_group": {"type": "number", "value": 413}}	36	1
899	2016-05-15 02:58:16.330712+00	2016-05-15 02:58:16.338543+00	{"integer_group": {"type": "number", "value": 424}}	1	{"integer_group": {"type": "number", "value": 424}}	36	1
890	2016-05-15 02:57:58.984243+00	2016-05-15 02:57:58.992665+00	{"integer_group": {"type": "number", "value": 414}}	1	{"integer_group": {"type": "number", "value": 414}}	36	1
895	2016-05-15 02:58:07.685375+00	2016-05-15 02:58:07.69552+00	{"integer_group": {"type": "number", "value": 419}}	1	{"integer_group": {"type": "number", "value": 419}}	36	1
891	2016-05-15 02:58:00.760728+00	2016-05-15 02:58:00.768768+00	{"integer_group": {"type": "number", "value": 415}}	1	{"integer_group": {"type": "number", "value": 415}}	36	1
892	2016-05-15 02:58:02.49064+00	2016-05-15 02:58:02.499086+00	{"integer_group": {"type": "number", "value": 416}}	1	{"integer_group": {"type": "number", "value": 416}}	36	1
893	2016-05-15 02:58:04.224244+00	2016-05-15 02:58:04.23227+00	{"integer_group": {"type": "number", "value": 417}}	1	{"integer_group": {"type": "number", "value": 417}}	36	1
896	2016-05-15 02:58:11.136657+00	2016-05-15 02:58:11.145499+00	{"integer_group": {"type": "number", "value": 421}}	1	{"integer_group": {"type": "number", "value": 421}}	36	1
902	2016-05-15 02:58:21.500962+00	2016-05-15 02:58:21.508824+00	{"integer_group": {"type": "number", "value": 427}}	1	{"integer_group": {"type": "number", "value": 427}}	36	1
897	2016-05-15 02:58:12.862735+00	2016-05-15 02:58:12.881283+00	{"integer_group": {"type": "number", "value": 422}}	1	{"integer_group": {"type": "number", "value": 422}}	36	1
900	2016-05-15 02:58:18.063413+00	2016-05-15 02:58:18.071879+00	{"integer_group": {"type": "number", "value": 425}}	1	{"integer_group": {"type": "number", "value": 425}}	36	1
898	2016-05-15 02:58:14.592872+00	2016-05-15 02:58:14.600965+00	{"integer_group": {"type": "number", "value": 423}}	1	{"integer_group": {"type": "number", "value": 423}}	36	1
901	2016-05-15 02:58:19.772677+00	2016-05-15 02:58:19.780871+00	{"integer_group": {"type": "number", "value": 426}}	1	{"integer_group": {"type": "number", "value": 426}}	36	1
904	2016-05-15 02:58:24.944659+00	2016-05-15 02:58:24.962069+00	{"integer_group": {"type": "number", "value": 429}}	1	{"integer_group": {"type": "number", "value": 429}}	36	1
903	2016-05-15 02:58:23.216326+00	2016-05-15 02:58:23.224841+00	{"integer_group": {"type": "number", "value": 428}}	1	{"integer_group": {"type": "number", "value": 428}}	36	1
906	2016-05-18 07:05:00.752828+00	2016-05-18 07:05:00.866072+00	{"x^1y^1": {"type": "number", "value": 1}, "x^1": {"type": "number", "value": 1}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 3}, "x^4": {"type": "number", "value": 1}, "zEnd": {"type": "number", "value": -7}, "y^3": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 5}, "y^1": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^1y^3": {"type": "number", "value": 7}, "rotationFactor": {"type": "number", "value": 0.15}, "x^2y^1": {"type": "number", "value": 1}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "Z_DEPTH": {"type": "number", "value": 15}, "x^1y^2": {"type": "number", "value": 0}, "rotationChangeOrder": {"type": "number", "value": -2}, "radiusX": {"type": "number", "value": 6}, "zStart": {"type": "number", "value": -0.01}, "x^1y^4": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^3y^1": {"type": "number", "value": 0}, "x^4y^1": {"type": "number", "value": -5}, "projection_f": {"type": "number", "value": 30}, "projection_e": {"type": "number", "value": -10}}	1	{"x^1y^1": {"type": "number", "value": 1}, "x^1": {"type": "number", "value": 1}, "x^3": {"type": "number", "value": 1}, "x^2": {"type": "number", "value": 1}, "x^5": {"type": "number", "value": 3}, "y^2": {"type": "number", "value": 2}, "zEnd": {"type": "number", "value": -7}, "y^3": {"type": "number", "value": 3}, "y^4": {"type": "number", "value": -2}, "y^5": {"type": "number", "value": 5}, "y^1": {"type": "number", "value": 1}, "x^1y^2": {"type": "number", "value": 0}, "x^1y^3": {"type": "number", "value": 7}, "rotationFactor": {"type": "number", "value": 0}, "x^2y^1": {"type": "number", "value": 1}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "Z_DEPTH": {"type": "number", "value": 15}, "rotationChangeOrder": {"type": "number", "value": -2}, "radiusX": {"type": "number", "value": 6}, "zStart": {"type": "number", "value": 0}, "x^1y^4": {"type": "number", "value": 1}, "x^3y^2": {"type": "number", "value": 1}, "x^3y^1": {"type": "number", "value": 0}, "x^4y^1": {"type": "number", "value": -5}, "projection_e": {"type": "number", "value": -10}, "projection_f": {"type": "number", "value": 30}, "x^4": {"type": "number", "value": 1}}	40	1
910	2016-05-18 07:44:45.247231+00	2016-05-18 07:44:45.360295+00	{"x^1y^1": {"type": "number", "value": 13}, "x^1": {"type": "number", "value": -5}, "x^3": {"type": "number", "value": 7}, "x^2": {"type": "number", "value": 9}, "x^5": {"type": "number", "value": 0}, "x^1y^2": {"type": "number", "value": 0}, "zEnd": {"type": "number", "value": -4}, "y^3": {"type": "number", "value": 3}, "x^1y^4": {"type": "number", "value": 1}, "y^5": {"type": "number", "value": 5}, "y^1": {"type": "number", "value": 1}, "y^2": {"type": "number", "value": 2}, "x^1y^3": {"type": "number", "value": 7}, "rotationFactor": {"type": "number", "value": 0}, "x^2y^1": {"type": "number", "value": 1}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "Z_DEPTH": {"type": "number", "value": 15}, "rotationChangeOrder": {"type": "number", "value": -1}, "radiusX": {"type": "number", "value": 5}, "zStart": {"type": "number", "value": -1}, "y^4": {"type": "number", "value": -2}, "x^3y^2": {"type": "number", "value": 1}, "x^3y^1": {"type": "number", "value": 0}, "x^4y^1": {"type": "number", "value": -5}, "projection_e": {"type": "number", "value": -10}, "projection_f": {"type": "number", "value": 30}, "x^4": {"type": "number", "value": 4}}	1	{"x^1y^1": {"type": "number", "value": 13}, "x^1": {"type": "number", "value": -5}, "x^3": {"type": "number", "value": 7}, "x^2": {"type": "number", "value": 9}, "x^5": {"type": "number", "value": 0}, "y^2": {"type": "number", "value": 2}, "zEnd": {"type": "number", "value": -4}, "y^3": {"type": "number", "value": 3}, "x^1y^4": {"type": "number", "value": 1}, "y^5": {"type": "number", "value": 5}, "y^1": {"type": "number", "value": 1}, "x^1y^2": {"type": "number", "value": 0}, "x^1y^3": {"type": "number", "value": 7}, "rotationFactor": {"type": "number", "value": 0}, "x^2y^1": {"type": "number", "value": 1}, "x^2y^3": {"type": "number", "value": 1}, "x^2y^2": {"type": "number", "value": -13}, "Z_DEPTH": {"type": "number", "value": 15}, "rotationChangeOrder": {"type": "number", "value": -1}, "x^4": {"type": "number", "value": 4}, "radiusX": {"type": "number", "value": 5}, "zStart": {"type": "number", "value": -1}, "y^4": {"type": "number", "value": -2}, "x^3y^2": {"type": "number", "value": 1}, "x^3y^1": {"type": "number", "value": 0}, "x^4y^1": {"type": "number", "value": -5}, "projection_f": {"type": "number", "value": 30}, "projection_e": {"type": "number", "value": -10}}	40	1
912	2016-05-28 05:14:44.065331+00	2016-05-28 05:14:44.065358+00	{"A": {"type": "number", "value": "7"}, "B": {"type": "number", "value": "3"}, "SCALE": {"type": "number", "value": "0.25"}, "N": {"type": "number", "value": "5"}}	1	{"A": {"type": "number", "value": 7}, "B": {"type": "number", "value": 3}, "SCALE": {"type": "number", "value": "0.25"}, "N": {"type": "number", "value": 5}}	41	1
913	2016-05-28 05:15:31.079312+00	2016-05-28 05:15:31.099624+00	{"A": {"type": "number", "value": 7}, "B": {"type": "number", "value": 3}, "SCALE": {"type": "number", "value": 1}, "N": {"type": "number", "value": 10}}	1	{"A": {"type": "number", "value": 7}, "B": {"type": "number", "value": 3}, "SCALE": {"type": "number", "value": 1}, "N": {"type": "number", "value": 10}}	41	1
914	2016-05-28 05:48:22.302249+00	2016-05-28 05:48:22.333116+00	{"A": {"type": "number", "value": 10}, "B": {"type": "number", "value": 1}, "SCALE": {"type": "number", "value": 1}, "N": {"type": "number", "value": 15}}	1	{"A": {"type": "number", "value": 10}, "B": {"type": "number", "value": 1}, "SCALE": {"type": "number", "value": 1}, "N": {"type": "number", "value": 15}}	41	1
915	2016-05-28 05:51:39.881898+00	2016-05-28 05:51:39.90137+00	{"A": {"type": "number", "value": 10}, "B": {"type": "number", "value": 1}, "SCALE": {"type": "number", "value": 1}, "N": {"type": "number", "value": 10}}	1	{"A": {"type": "number", "value": 10}, "B": {"type": "number", "value": 1}, "SCALE": {"type": "number", "value": 1}, "N": {"type": "number", "value": 10}}	41	1
\.


--
-- Name: game_gameinstance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_gameinstance_id_seq', 915, true);


--
-- Data for Name: game_gameinstance_seedParams; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY "game_gameinstance_seedParams" (id, gameinstance_id, seedkeyval_id) FROM stdin;
\.


--
-- Name: game_gameinstance_seedParams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('"game_gameinstance_seedParams_id_seq"', 13366, true);


--
-- Data for Name: game_gameinstancesnapshot; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_gameinstancesnapshot (id, created, updated, image, "time", instance_id) FROM stdin;
162	2016-04-04 19:45:17.621612+00	2016-04-04 19:45:17.754549+00	./f507a788241a570e47836bb3bce9b5c492e8b69bc294a46bdcbd8725.png	3.77099999999999991	111
164	2016-04-04 19:46:48.593254+00	2016-04-04 19:46:48.694719+00	./e27e480bd262d4011fec1ce3a64048425ea703169f21a820bfb46481.png	5	113
166	2016-04-05 06:17:13.446364+00	2016-04-05 06:17:13.53508+00	./ac026cc50d9a9f7465ec97b0d434cd2c1604763eefe1ef212cc07a50.png	5.00600000000000023	116
168	2016-04-05 06:18:50.438731+00	2016-04-05 06:18:50.514071+00	./2777fff73275babaa00703f4798c796d561e6b27a87cab380a708413.png	5.01499999999999968	116
46	2016-02-04 08:19:41.305824+00	2016-02-18 14:34:28.447981+00	./a53d2c1a96a63bca715d9a6c76784ce5b0bf1132d00d597767544ade.png	38.7890000000000015	17
47	2016-02-04 08:19:48.91899+00	2016-02-18 14:34:28.447981+00	./adba4107e6649f0071bc628d9ba16aa9ce27647637559b766a71d52b.png	46.588000000000001	17
170	2016-04-05 06:23:57.190894+00	2016-04-05 06:23:57.293617+00	./69355cacd793509d988cb4c1d6c4c1c5cc8fa6185515a8342585a7dc.png	7.08499999999999996	120
48	2016-02-04 08:19:57.170569+00	2016-02-18 14:34:28.447981+00	./38baa787b89c5e212f4086bcf49b7fda946d028f53875080209aa2be.png	54.8689999999999998	17
49	2016-02-04 08:20:06.344033+00	2016-02-18 14:34:28.447981+00	./a382994e2b7d3fbd75ac28307dace144370cfecb9de6069ff0a3787d.png	64.3190000000000026	17
42	2016-02-04 08:19:19.547904+00	2016-02-18 14:34:28.447981+00	./72e16451f6c5fa040e33b3eca0b7af2dec0a6fd3727910c906282a2f.png	17.3640000000000008	17
43	2016-02-04 08:19:23.73775+00	2016-02-18 14:34:28.447981+00	./800e5190edf2567b777b0519e3b889c26df434bb346d7f2ec003896f.png	21.6260000000000012	17
44	2016-02-04 08:19:28.424514+00	2016-02-18 14:34:28.447981+00	./e2e1504d9d21725c49d35d3abbcb67f9e999d45a197460cc18b5adef.png	26.3859999999999992	17
45	2016-02-04 08:19:32.645332+00	2016-02-18 14:34:28.447981+00	./a622ff97f68234b2c0fa453312a32aea7e39b2ea92e40e00c801edf6.png	30.5249999999999986	17
172	2016-04-05 06:25:18.005728+00	2016-04-05 06:25:18.091032+00	./692c0364b01dbb1ddb0ea95b6d5f86517b782f28fb81811b16d3f8aa.png	6.01999999999999957	122
174	2016-04-05 06:26:56.163163+00	2016-04-05 06:26:56.254454+00	./4662b6859ce777bd9a9f6c5d57604a06da5124d4ee5aa9351c753027.png	5.62600000000000033	125
178	2016-04-05 09:55:36.280014+00	2016-04-05 09:55:36.382568+00	./599eac0818e8898768a4f363668e15c03ac8ce19988d0eaad290714f.png	2.01100000000000012	141
71	2016-03-22 10:31:29.652388+00	2016-03-22 10:31:29.842623+00	./f7d9d89cbd1a6e8c8d46caccc8911113095cfad28b861ab5d81eff35.png	32.0009999999999977	38
179	2016-04-05 20:16:26.780957+00	2016-04-05 20:16:27.004633+00	./9baf3907e2c08b182e4fac48a30e8fbdd24202938f15e3e47f40463d.png	17.0010000000000012	143
73	2016-03-22 22:30:07.572615+00	2016-03-22 22:30:07.788304+00	./5c04ec4dd00f11e59326f5ea5cbecbb7b6a8c7c2b60f99b41a6b634a.png	1.00099999999999989	35
91	2016-03-23 09:20:13.402091+00	2016-03-23 09:20:13.50539+00	./356a89f5f45103baa0be04e20b15ec20c95fc54f9d51f1214c650aa1.png	6.01499999999999968	55
75	2016-03-23 08:38:07.763284+00	2016-03-23 08:38:07.954763+00	./38c9ad20897e974df475c80e6619c91d2ca579ac7acb98f8a2922f56.png	7.13699999999999957	38
76	2016-03-23 08:41:05.460867+00	2016-03-23 08:41:05.57837+00	./5bc44c450e438fcb24ccd6dcb660675e6633377357e2f79ba5460ec0.png	13.1920000000000002	38
77	2016-03-23 08:42:37.665025+00	2016-03-23 08:42:37.771009+00	./a32af9bab87dcdeacf1bb4b57c6eeb7cd58b562d7ff3bf82f3a59e35.png	18.0010000000000012	38
78	2016-03-23 08:47:51.667393+00	2016-03-23 08:47:51.788005+00	./170f63c09e37cb421972fdcccf5caac6cdfb16317ed6655c1159fa2e.png	15.0009999999999994	38
79	2016-03-23 08:54:57.165765+00	2016-03-23 08:54:57.266713+00	./013eec234d2f0a30c8f8a73380329000e8fe8d984466a63479eef98d.png	7.00100000000000033	47
80	2016-03-23 08:55:21.931314+00	2016-03-23 08:55:22.027324+00	./2811742fb740af0e33fd4d0bb2e4710ea42e921a0c6de4f84ead7121.png	4.21499999999999986	47
81	2016-03-23 08:55:29.391165+00	2016-03-23 08:55:29.489457+00	./65bc664e6651447115ad6af274d785a34652c6582645a9a47dda0229.png	11.2149999999999999	47
82	2016-03-23 08:56:24.609615+00	2016-03-23 08:56:24.701151+00	./71d293da1091fc6b66fd9b44768f611e66e00ca0b0580594b1bb7e3a.png	3.00099999999999989	48
397	2016-04-10 03:57:18.555947+00	2016-04-10 03:57:18.626784+00	./8143d5456c99468d55fe3189ed7409fb52cb369778a1724760033a6d.png	8.3490000000000002	388
84	2016-03-23 09:01:18.492854+00	2016-03-23 09:01:18.575471+00	./9a1cd9e126c4072bee2e9369f819c43241a7bc0a02d100da01a1f72d.png	1	49
85	2016-03-23 09:03:53.075697+00	2016-03-23 09:03:53.16381+00	./eb1ba9c8afeef6aa422dc65e009865062f46ac77d8d116842968f608.png	1.00099999999999989	35
86	2016-03-23 09:10:34.474798+00	2016-03-23 09:10:34.552577+00	./39a515ee511cf0757e6ba96297c35885d4cd9d4cc44e8e1c91760fbf.png	4.6639999999999997	51
87	2016-03-23 09:11:32.345485+00	2016-03-23 09:11:32.430195+00	./7050c5d47e3c478c98b17919e3b831190b9c893b38d0b235bcf78f6f.png	1.00099999999999989	52
88	2016-03-23 09:13:05.825769+00	2016-03-23 09:13:05.957249+00	./7e7098dd4d23d6c3a7f34b48e19e2c5cf9d8f606c89315e564993876.png	5.92799999999999994	53
89	2016-03-23 09:13:31.511683+00	2016-03-23 09:13:31.621841+00	./15a7dbad6a2c3b8fac57658bd0deaf7b7cf87686e83eee6b382a589f.png	2	40
90	2016-03-23 09:18:58.231168+00	2016-03-23 09:18:58.334448+00	./e0d7060918c86b39b9c0e358331202d226a92a9126c2dafa1c4967cd.png	6.00199999999999978	54
181	2016-04-05 20:18:06.773395+00	2016-04-05 20:18:06.880502+00	./9bd155a365cb701ade538f53348a6eccc244a0bb9edafe12372902d9.png	2.00999999999999979	142
402	2016-04-10 03:57:29.803503+00	2016-04-10 03:57:29.883943+00	./25d70ffe56511fd16c68ba4c776cf450d98253fd7b6f3f91a7973d35.png	0.517000000000000015	393
103	2016-03-23 21:08:04.513598+00	2016-03-23 21:08:04.689856+00	./62f7c1d66306b8250b02f842ff3716c34e18ea2306122062c01a768c.png	3.00099999999999989	63
104	2016-03-23 21:08:14.395363+00	2016-03-23 21:08:14.484944+00	./f7695b1f3140ee28f6b0dadc2a65fefc39abd3090d19663113e317da.png	4.18100000000000005	64
105	2016-03-23 22:39:06.560261+00	2016-03-23 22:39:06.65126+00	./22e38b5b014893d1e350e5c2c2033d87c6ccbb96faae3bdce202971a.png	4.78599999999999959	65
106	2016-03-24 00:03:32.477551+00	2016-03-24 00:03:32.596312+00	./184965694869847cfba7b13ef34a9a100173593fe7f5a3ad5e519081.png	4.59100000000000019	66
110	2016-03-24 10:36:03.798869+00	2016-03-24 10:36:03.893479+00	./21531c084f00b134552472ee86cd6d53d0971278cda0bf8d7b5a44ee.png	2.30399999999999983	74
111	2016-03-24 10:37:05.026527+00	2016-03-24 10:37:05.144262+00	./a98b57d617270f4c2aebcc41030e4bf9ffff7af7e93305e42ac8da0d.png	5	75
163	2016-04-04 19:45:41.067514+00	2016-04-04 19:45:41.180074+00	./d42011678ce84763d8687da6ecd99f42336ff89376e09cb1aabca595.png	1.53400000000000003	112
119	2016-03-25 09:28:54.34815+00	2016-03-25 09:28:54.433839+00	./09b9320436aae199ffc211dec537748f789660b6d95df69e08bd938e.png	6.00100000000000033	75
165	2016-04-04 19:48:33.434862+00	2016-04-04 19:48:33.522845+00	./b6021147850d89ed51b20cd7aa4b882057dfc0191824765a80a2d091.png	5.35899999999999999	115
167	2016-04-05 06:17:56.115593+00	2016-04-05 06:17:56.214469+00	./632ed97d6d0e14474d6421e3a61ca47728b34aedab2f5b22eab93c9a.png	5.29199999999999982	117
169	2016-04-05 06:23:23.795209+00	2016-04-05 06:23:23.887745+00	./5f0950dfa434a3cc9d2a645c09184162bb6be6f62680bdd9c59aaf93.png	5.02200000000000024	119
150	2016-04-04 07:40:41.914774+00	2016-04-04 07:40:42.030726+00	./ee244930b0747f2e399e7d78a848d3b93ed22ee996976a780e14da9a.png	2.00099999999999989	98
171	2016-04-05 06:25:01.381218+00	2016-04-05 06:25:01.467765+00	./00318db2c3fabfe74cbbc6f48598ccc2100bcdfb9dd5cd2943e52f28.png	6.14599999999999991	121
173	2016-04-05 06:25:46.615481+00	2016-04-05 06:25:46.705852+00	./df122f38171d8b6d77f23aa23dd1519b8bdfc72ac428f85f876d9dfd.png	6.02799999999999958	123
129	2016-03-26 21:10:24.790784+00	2016-03-26 21:10:25.012153+00	./93b160eecf8d21d3f385f86b8bda536238a1a39ee3ec0ce8529f4b9d.png	17.0010000000000012	93
130	2016-03-26 21:10:32.717577+00	2016-03-26 21:10:32.828856+00	./5c41b3b213a6c71db87b740f0afe3822bce4dc835d96f7884d900d9d.png	25.0180000000000007	93
131	2016-03-26 21:10:38.741438+00	2016-03-26 21:10:38.859759+00	./cea103df9ca600b64bbeef2c4e4d8949e1235cb0e4a6e3d2a9794fce.png	31.0019999999999989	93
132	2016-03-26 21:10:58.769715+00	2016-03-26 21:10:58.892802+00	./c51d276a43157c53d52db5ce548df9f61baa6a7560a2c0d356a8c49e.png	51.0290000000000035	93
133	2016-03-26 21:12:52.716001+00	2016-03-26 21:12:52.843143+00	./0c0f7745b018bcf7afc6f74b168594dd67acd4dc80e54aedc58291cb.png	165.001000000000005	93
134	2016-03-26 21:13:07.467683+00	2016-03-26 21:13:07.597844+00	./5a26a4d1eee39bfce829ff23e292f09472d61064a92e84fe05caef57.png	180.031000000000006	93
175	2016-04-05 06:27:11.382171+00	2016-04-05 06:27:11.520686+00	./802fe70459e7cbdf849a5fc9e95df09ee80ca31b01c1b34d7930ad18.png	6.04900000000000038	124
177	2016-04-05 09:41:25.343095+00	2016-04-05 09:41:25.469292+00	./5507004af7f696403842b547e6d2e1774e9cdb220489a9173804b495.png	5.12600000000000033	140
180	2016-04-05 20:17:50.770626+00	2016-04-05 20:17:50.900571+00	./5ab0c080bc124838ffc288f575e321f329d8b5f899f2359e3dffaee7.png	17	144
182	2016-04-06 18:11:19.370249+00	2016-04-06 18:11:19.477138+00	./b15c904a22caafea37d17c828968b4075df397394bf1075d8424491c.png	3	142
183	2016-04-06 18:11:38.273609+00	2016-04-06 18:11:38.378568+00	./10351ffdea1e2f77346304db1de32bb8c210138acb01439afb7c5f45.png	6.00100000000000033	146
398	2016-04-10 03:57:20.836743+00	2016-04-10 03:57:20.90985+00	./7e913b48057bd0a2f8662c26c3750f070687bffe05c0155c2bfb5a56.png	0.562000000000000055	389
185	2016-04-06 18:13:20.992698+00	2016-04-06 18:13:21.130362+00	./7cd2ec476a126d105c2e7d13ec16733fee9b0e0f841975232b8da91e.png	8.3960000000000008	148
186	2016-04-06 18:15:22.419669+00	2016-04-06 18:15:22.521261+00	./23fb6dd916d3df71507cb11622cb7e58551bc771d838a44be3d31ff4.png	7.02700000000000014	151
187	2016-04-06 18:15:40.877278+00	2016-04-06 18:15:40.979742+00	./699107b988567801d243233eca80877f8df76d72af117fdfd093c2e1.png	2.00099999999999989	115
188	2016-04-06 18:16:39.876219+00	2016-04-06 18:16:39.990597+00	./ae84b5f63b7bc46a81f08e2f544f2266af1d71f0cbacf3d737dc9f4e.png	8.0389999999999997	153
204	2016-04-08 21:14:46.146676+00	2016-04-08 21:14:46.248885+00	./5cffaab33236c0b982374b696aabf66637eaafa44b91ae04d71df5df.png	1.05699999999999994	124
403	2016-04-10 03:57:32.065614+00	2016-04-10 03:57:32.148461+00	./5b811e54001b27bc43563f8cfe99b80f28c5477c6a0612d000823c9b.png	0.549000000000000044	394
407	2016-04-10 03:57:41.085295+00	2016-04-10 03:57:41.155242+00	./232823613b84d780c9a73dbbbd872b144be8c7942692ad4fb4065f2f.png	0.592999999999999972	398
152	2016-04-04 07:45:38.362764+00	2016-04-04 07:45:38.480904+00	./5bb665f5533b9453a093e96732db5ff2cbfb9beedef4c12dd318cc2e.png	4.00100000000000033	99
205	2016-04-08 21:17:07.153912+00	2016-04-08 21:17:07.28352+00	./10bdf3d64ffaa6187ceea1ed88205ea84c0fbdb7048410b3df73c8a2.png	1.05800000000000005	124
154	2016-04-04 07:47:22.310199+00	2016-04-04 07:47:22.404544+00	./5d05fd39cd87cf30dba9d1da250baadb52809543cccaac7a238e8d88.png	7.51700000000000035	101
155	2016-04-04 07:47:40.416899+00	2016-04-04 07:47:40.527688+00	./9df008abb41268d8856dba32eb7ee22cd0213445eeb5d3e93ff3f34a.png	5	102
156	2016-04-04 07:48:08.576044+00	2016-04-04 07:48:08.67396+00	./e9bc540d7d4990dc1b526ce201a2aa97b084994c6ce52178cb1b09e3.png	9.73399999999999999	103
157	2016-04-04 07:49:46.4444+00	2016-04-04 07:49:46.567532+00	./b32a6aaf36c9ff60fa805b3d6713cb5b4aac92de5a98e302d92cd2c2.png	6	104
158	2016-04-04 07:54:31.989096+00	2016-04-04 07:54:32.113163+00	./ccfe016d337ded759f3265878261322600b3ff161170a1edee6b3c2b.png	2	105
159	2016-04-04 07:56:03.827174+00	2016-04-04 07:56:03.942041+00	./c07f771eda303e06d3074b4c91ccb2c194e1c90fae3a038614dcb5c9.png	17	106
160	2016-04-04 10:10:55.115801+00	2016-04-04 10:10:55.221075+00	./27e1c8a765dbef0ec7b6916a9d18c7889a463818d0382d977e7df791.png	2.08099999999999996	107
161	2016-04-04 10:32:41.767851+00	2016-04-04 10:32:41.894084+00	./814a5f814d089c816bd06c1b2dd0753b615cce05954d379f0d684af3.png	28.0710000000000015	108
411	2016-04-10 03:57:50.023044+00	2016-04-10 03:57:50.092856+00	./edde9c3638470baf4b5f11092f8e4d172ce8ffd9cb38a6851658a66f.png	0.546000000000000041	402
206	2016-04-08 21:17:23.326949+00	2016-04-08 21:17:23.440273+00	./2d5fdf5f786105cb88dd5b16273e1f0702508642360c5739d699d73b.png	2.03500000000000014	124
415	2016-04-10 03:57:58.998758+00	2016-04-10 03:57:59.066192+00	./8047c0127250edbe5a99fbcfac3eaa08bce97a90190982b1f5b1b05c.png	0.542000000000000037	406
419	2016-04-10 03:58:07.933191+00	2016-04-10 03:58:08.026014+00	./cd351f6e7245ac4c952b4d06929768bc6bf59198dc0ca8bfcaead565.png	0.570999999999999952	410
423	2016-04-10 03:58:16.739554+00	2016-04-10 03:58:16.807266+00	./9642277144e107f77c03918cc66a9d77e62026fc07d6ef273c3b4119.png	0.548000000000000043	414
427	2016-04-10 03:58:25.577048+00	2016-04-10 03:58:25.647393+00	./bdfdaa2feae59f7f4510127d2a55c2b8930c174ca69b43ecae3321c6.png	0.494999999999999996	418
202	2016-04-08 21:13:54.332849+00	2016-04-08 21:13:54.559646+00	./ea379dac4df9d03b3acb824f30626db723897d7180e9e94700b7250f.png	4	124
203	2016-04-08 21:14:30.043435+00	2016-04-08 21:14:30.163703+00	./b4d37ed65eb6d8b0500e92f6e2d701c2ac6a141ac74c605d279c6be0.png	2.07299999999999995	124
207	2016-04-08 21:17:26.388574+00	2016-04-08 21:17:26.502203+00	./c78ec76f942c0668ebdc3751854241cf82eb775da609a87d7e3d411a.png	5.01900000000000013	124
208	2016-04-08 21:17:29.123121+00	2016-04-08 21:17:29.212432+00	./60d779e2acda378a55ad0fa4d68f850d8b15b9b9409dcfc6bef108be.png	7.03599999999999959	124
209	2016-04-08 21:17:43.461166+00	2016-04-08 21:17:43.562534+00	./f7078dc8c96d6b4f72a3550667080f1670235124c986dfb118ce6b3e.png	1.02499999999999991	124
431	2016-04-10 03:58:34.41663+00	2016-04-10 03:58:34.489652+00	./246eb32f90d9083bd58f177b149b83c0e0715cc2d80ec9bd03f64693.png	0.562000000000000055	422
435	2016-04-10 03:58:43.263981+00	2016-04-10 03:58:43.369126+00	./03238f1a8df346bebe7b5801605013d598fc8d96bf83bae35838e5d3.png	0.574999999999999956	426
439	2016-04-10 03:58:52.089358+00	2016-04-10 03:58:52.160317+00	./ef80d25b5228789ee0703bbe06543d1c3700899425d65c1f130befef.png	0.560000000000000053	430
443	2016-04-10 03:59:00.934016+00	2016-04-10 03:59:01.001246+00	./49f06ec8f37c998006e464767a7967d229994c873240e35bc3ba4798.png	0.552000000000000046	434
447	2016-04-10 03:59:09.760426+00	2016-04-10 03:59:09.834966+00	./784984344b7180e5632bfa0b1429d0649f5731d7c8d62b7f496b750e.png	0.543000000000000038	438
451	2016-04-10 03:59:18.676318+00	2016-04-10 03:59:18.765107+00	./26c7b201e2ff9c75c17574bd9e90c3838e768832cde68b18ddb5eda8.png	0.567999999999999949	442
455	2016-04-10 03:59:27.637095+00	2016-04-10 03:59:27.709013+00	./515d167e0cb46d2a19af38c4d8c9f10bb854a5b1f344072ed1608b28.png	0.582999999999999963	446
459	2016-04-10 03:59:36.555492+00	2016-04-10 03:59:36.62565+00	./206cdf39245dd2895addaf84affcd60aeca37580ea8bc66b0717e52f.png	0.515000000000000013	450
463	2016-04-10 03:59:45.491861+00	2016-04-10 03:59:45.583397+00	./64863af9043da4e3bcece45b157ecbf4c20c640370348b4de4e884d4.png	0.607999999999999985	454
467	2016-04-10 03:59:54.4795+00	2016-04-10 03:59:54.578906+00	./3aaabba4c57423a44f59fcd9e617b8bc6663eed28cba7f11a5951879.png	0.598999999999999977	458
471	2016-04-10 04:00:03.377474+00	2016-04-10 04:00:03.450168+00	./38f575fe47f7c874adbad758fcef61dddc717109cadfdf5e7190006a.png	0.55600000000000005	462
399	2016-04-10 03:57:23.023733+00	2016-04-10 03:57:23.095561+00	./adb89cea7cd98073f45b65985f38ec05898cc79161b2e7635854c196.png	0.561000000000000054	390
404	2016-04-10 03:57:34.303453+00	2016-04-10 03:57:34.390566+00	./3179411779cfba2361be9066b130b7a9b963518c039ec20212e1d9c8.png	0.539000000000000035	395
408	2016-04-10 03:57:43.306716+00	2016-04-10 03:57:43.377588+00	./9361b16d2960d0df5ca07b33072f3a8000ad2f2f0a91d9a7fc14fff7.png	0.512000000000000011	399
412	2016-04-10 03:57:52.32689+00	2016-04-10 03:57:52.411803+00	./86341b8bd6e3b4f5acfd0299c45d8f1752ed22d7f88f03b8ea93bb51.png	0.507000000000000006	403
416	2016-04-10 03:58:01.212436+00	2016-04-10 03:58:01.287099+00	./87ccbe0b33ecb7be3fbf6b6e2572e9b149f8d90736c01914473632dc.png	0.583999999999999964	407
420	2016-04-10 03:58:10.116409+00	2016-04-10 03:58:10.188257+00	./d9d8267363fe0cdc7fd30a227b159aa08a7e4eec6d620bbeaa6d278e.png	0.552000000000000046	411
424	2016-04-10 03:58:18.977536+00	2016-04-10 03:58:19.078195+00	./dbb72c5dec783098a75c6a1ee773c9f6fa7ad2ba111a98f8a9bbebee.png	0.54500000000000004	415
428	2016-04-10 03:58:27.802937+00	2016-04-10 03:58:27.883786+00	./0079197c4341c71bf5a211e6d2a30b2b34b5216243dfdef37d82d64d.png	0.566999999999999948	419
432	2016-04-10 03:58:36.742761+00	2016-04-10 03:58:36.813141+00	./c40aa2b8f3e6c375bea820496f7e86a4f5adf25f88dc5cf3d88db9e5.png	0.560000000000000053	423
436	2016-04-10 03:58:45.441029+00	2016-04-10 03:58:45.510091+00	./c4d3cbd2ee4f5446bfadeeb0db4126f297ca31ed3119bdf505d7edfd.png	0.529000000000000026	427
440	2016-04-10 03:58:54.310705+00	2016-04-10 03:58:54.387244+00	./85ff7ff9fcbf010620eeb8f0c3c67f9bbb508f5a158dfbe6d53282d5.png	0.548000000000000043	431
444	2016-04-10 03:59:03.14502+00	2016-04-10 03:59:03.224693+00	./ff9a12ef30f79e3efe24f1fdcd6d754f3cd6d000c5048bb5ba880eb1.png	0.565999999999999948	435
448	2016-04-10 03:59:11.972625+00	2016-04-10 03:59:12.04408+00	./21edcd5e16b448809d13618e9b9296d5bd1791f570a9f643dded167e.png	0.558000000000000052	439
452	2016-04-10 03:59:20.904239+00	2016-04-10 03:59:20.979807+00	./85b8ecdb0f7e1581ea20be16a51526e6d19d980a83d3b2ac90ede3d1.png	0.57999999999999996	443
456	2016-04-10 03:59:29.839192+00	2016-04-10 03:59:29.921937+00	./aa3d492e29383f1913fca56198399c72e30ef4a7061b8cdc80d243db.png	0.547000000000000042	447
460	2016-04-10 03:59:38.764091+00	2016-04-10 03:59:38.840619+00	./7f622ed3562b24ef9ca134eacfe539cd6f9716383cdf8e97f54c415e.png	0.540000000000000036	451
464	2016-04-10 03:59:47.718363+00	2016-04-10 03:59:47.801822+00	./3e25fa5b993f76c83170d52a319b2ddfe87070b49e2e481f2b411865.png	0.572999999999999954	455
468	2016-04-10 03:59:56.720446+00	2016-04-10 03:59:56.792764+00	./95acb96ce8e5866bca849327a4e32dd0b2738b21405f35a4225a1f73.png	0.594999999999999973	459
472	2016-04-10 04:00:05.637407+00	2016-04-10 04:00:05.711035+00	./63b8a571f40e1d2dd5e96efbcf3ae3287e1ea93537d5475ef35950ac.png	0.569999999999999951	463
475	2016-04-10 04:00:12.363381+00	2016-04-10 04:00:12.440874+00	./b8019bd1c784ceaa4faf45139ed54dfe16660dbaaf521495d18158bb.png	0.595999999999999974	466
478	2016-04-10 04:00:19.052788+00	2016-04-10 04:00:19.129834+00	./7fd0466a09de18c22fc7d1198f450665f53c66b866926209c1920bf4.png	0.609999999999999987	469
481	2016-04-10 04:00:25.785322+00	2016-04-10 04:00:25.859783+00	./b071384c425a8629f88ede0fa1cfc350030babfa4e5a4dd54d44c81d.png	0.569999999999999951	472
484	2016-04-10 04:00:32.509023+00	2016-04-10 04:00:32.576381+00	./408307e5ec533cbb5d5d450306b77e38cf617431869176ee370cc392.png	0.566999999999999948	475
487	2016-04-10 04:00:39.266183+00	2016-04-10 04:00:39.335804+00	./18f5bf70affb0f7d2f6014e588eebb5eda132f58d7427ee038e04f14.png	0.575999999999999956	478
490	2016-04-10 04:00:46.020324+00	2016-04-10 04:00:46.098005+00	./0df396f6b36238cfa4e3c00107a54b72a6fab4a7b217b30d7fb77ca1.png	0.573999999999999955	481
493	2016-04-10 04:00:52.737918+00	2016-04-10 04:00:52.810714+00	./9fc0100694c93041d1239b0f2dccbef8bec56611ccff22b5b7967081.png	0.588999999999999968	484
496	2016-04-10 04:00:59.487271+00	2016-04-10 04:00:59.559688+00	./cf8fb89530b88a08f07ce669ef052f06962643d6e84cc77cd73fb61d.png	0.572999999999999954	487
499	2016-04-10 04:01:06.265263+00	2016-04-10 04:01:06.353341+00	./ffcf5ee14ab76ab693034c7fe5df5009f6a5c79a808ed7449a0c3629.png	0.580999999999999961	490
502	2016-04-10 04:01:13.100279+00	2016-04-10 04:01:13.178923+00	./ebac9ec3773f8d257559f180134a8b7a22192956a166bf2ea0cdbd7b.png	0.610999999999999988	493
504	2016-04-10 04:01:17.62735+00	2016-04-10 04:01:17.69622+00	./395834e79595e4cfedf4173918ff89dbea41f92393ea009ed6947840.png	0.577999999999999958	495
506	2016-04-10 04:01:22.214+00	2016-04-10 04:01:22.286296+00	./3dbaddd5f782472f25f850db707422f2ca8439b5f20d79cd5d174c82.png	0.604999999999999982	497
260	2016-04-10 00:46:15.663889+00	2016-04-10 00:46:15.775819+00	./74007753a9f6d99bb69ee43e8e948f6190e11923681ec373ddb7d45f.png	1.45999999999999996	249
261	2016-04-10 00:46:27.320135+00	2016-04-10 00:46:27.423625+00	./5f0ccf3bed99b8bd8834ff5deabaa7f63c0df24319788f1a7db2b028.png	1.52699999999999991	250
262	2016-04-10 00:46:58.552596+00	2016-04-10 00:46:58.673057+00	./ecafecbe2ae2e9b22c59ccfdffa2192704954fbcead0d462b65f5fc5.png	1.69900000000000007	251
263	2016-04-10 00:47:09.676562+00	2016-04-10 00:47:09.786894+00	./618c7e68bf66f0482ca57402aeca3bc8893afbc454c48bb9654e27a1.png	1.55000000000000004	252
264	2016-04-10 00:48:25.993741+00	2016-04-10 00:48:26.11758+00	./228e3efb33764bf66323f98ce2c81ff6c70b8f0b47fdecd0c7e057fa.png	1.46799999999999997	253
265	2016-04-10 00:48:37.740558+00	2016-04-10 00:48:37.889379+00	./3f3fb84660619a52b2d0728931eaf9ba6fb8143d3940a12bb0c4c056.png	1.5069999999999999	254
266	2016-04-10 00:48:54.572962+00	2016-04-10 00:48:54.695057+00	./4f2226e47ada0edb867553d6469841ead630c72fa082fbc9793e2c2a.png	1.53899999999999992	255
267	2016-04-10 00:49:17.195295+00	2016-04-10 00:49:17.304479+00	./982b5f0dd1fa5dafe2da23df6d1fda3dbd0d8dab7900c9150c53f71f.png	1.44799999999999995	256
268	2016-04-10 00:49:29.27046+00	2016-04-10 00:49:29.375888+00	./8d6bf92b26dda5bc246d91e21230926d384c3a43b904487b5ebd7faf.png	1.54800000000000004	257
269	2016-04-10 00:52:10.132045+00	2016-04-10 00:52:10.244514+00	./fcbfbb22d19f2dfcf215a41e0f4f3dca9975d40f7f1430f0e41a7e93.png	1.48999999999999999	258
270	2016-04-10 00:52:50.827021+00	2016-04-10 00:52:50.931195+00	./b2ea7896aa8fc77ebe390a781e0fbb2d1251b9cd10b54646dec590aa.png	1.56699999999999995	259
271	2016-04-10 00:58:53.741988+00	2016-04-10 00:58:53.848532+00	./22b04bfce95c23fa98d4f636edf7ce0693be3960bd69214aa31978c4.png	1.47700000000000009	260
272	2016-04-10 00:59:04.217867+00	2016-04-10 00:59:04.318962+00	./d43abfd4c24dc25297b06368e120e3ab09526336004b57a26a2af2d4.png	1.53499999999999992	261
508	2016-04-10 04:01:26.702492+00	2016-04-10 04:01:26.772226+00	./631ea084768570091b810b003c0b164dc12f7abed99db4e18edc362b.png	0.597999999999999976	499
510	2016-04-10 04:01:31.192531+00	2016-04-10 04:01:31.271551+00	./4dbcde43269eea05bdd570e25262687663488d80b2a028cb99f6ce02.png	0.572999999999999954	501
512	2016-04-10 04:01:35.681961+00	2016-04-10 04:01:35.759114+00	./e224af5427a1cc70aa152bafc28a94f8bef1496292e1f33432e3d309.png	0.567999999999999949	503
514	2016-04-10 04:01:40.348689+00	2016-04-10 04:01:40.445454+00	./cb7e36a6f29e0f12ec4d647d5a1b21b83d8052539142d89fbfe60949.png	0.612999999999999989	505
516	2016-04-10 04:01:44.950865+00	2016-04-10 04:01:45.02155+00	./e659f6393d8453773143b30f8fe3e9da071823d86642c8dc4bc9f730.png	0.622999999999999998	507
518	2016-04-10 04:01:49.557874+00	2016-04-10 04:01:49.630733+00	./7224ff83bef55d247653635de5d007f3b68ab17476d08ef04ab39eb3.png	0.634000000000000008	509
520	2016-04-10 04:01:54.185251+00	2016-04-10 04:01:54.259571+00	./c7379107bc35e8aef76748282e2df1324e29fc60cd64a55fe7774bec.png	0.639000000000000012	511
522	2016-04-10 04:01:58.662366+00	2016-04-10 04:01:58.737949+00	./8dff957ffe02abbaac9cc88d107af1d2ba0fdd0094e1640e7744be41.png	0.571999999999999953	513
524	2016-04-10 04:02:03.208587+00	2016-04-10 04:02:03.307505+00	./9c11c3c96535b9eb7cf0c8d1365f7f28a7edf543387da593df5c8513.png	0.594999999999999973	515
526	2016-04-10 04:02:07.861946+00	2016-04-10 04:02:07.947599+00	./410174548e383efcd4a460ddd4725cf55b9bf9ef5bd109f1a48b7f1e.png	0.611999999999999988	517
528	2016-04-10 04:02:12.58618+00	2016-04-10 04:02:12.656862+00	./76ea09875997969ed822181804f6aac1e9e1eb407eed5b045be8d022.png	0.635000000000000009	519
530	2016-04-10 04:02:17.150935+00	2016-04-10 04:02:17.228543+00	./505ed732dfdf4e366b0704f9559eb689df2e01fc4e132bebcab22c8d.png	0.586999999999999966	521
532	2016-04-10 04:02:21.762272+00	2016-04-10 04:02:21.856477+00	./a881719c87059ae65499bd3b9fcdc51a0f5edde0bb22148131c09b2e.png	0.614999999999999991	523
534	2016-04-10 04:02:26.406003+00	2016-04-10 04:02:26.480871+00	./e1292f4a768bd8466ac52bbe9718d336842eff64cd9318f3fb81f79b.png	0.600999999999999979	525
536	2016-04-10 04:02:30.993563+00	2016-04-10 04:02:31.092872+00	./8468efb55241490b98f2ef9d3b17355dcd0cfab4ab08fbdff4f8fc2d.png	0.628000000000000003	527
538	2016-04-10 04:02:35.6187+00	2016-04-10 04:02:35.687961+00	./99f34751ae4805ac8d72bbd73f7884cc6ecab2ff98884dd41b49d956.png	0.577999999999999958	529
540	2016-04-10 04:02:40.233411+00	2016-04-10 04:02:40.322194+00	./700f7a7ad47398d94fd7e89e3b717918b13fb81142bd91656c9bb282.png	0.630000000000000004	531
542	2016-04-10 04:02:44.949949+00	2016-04-10 04:02:45.03303+00	./7406160f05d0cddc9e335673d00a67d41575c449378d8faaf592f2da.png	0.637000000000000011	533
400	2016-04-10 03:57:25.277027+00	2016-04-10 03:57:25.348208+00	./3ddaac9d0782e6357fdea1902d111b629ecb4a43c0f3340d3fc68081.png	0.54500000000000004	391
405	2016-04-10 03:57:36.590628+00	2016-04-10 03:57:36.672452+00	./359335f4b6ab8a6552da99de444de58e8fda6c3fb4d8dc31a7602b3a.png	0.474999999999999978	396
409	2016-04-10 03:57:45.546328+00	2016-04-10 03:57:45.655985+00	./197781147b4e19de664ac223fedfa91ab4324e90a2b72dd91d53166c.png	0.542000000000000037	400
413	2016-04-10 03:57:54.524972+00	2016-04-10 03:57:54.595761+00	./a7d3a161232e8f0d948a215436a5c83c763c1471e40f2f91da43efbd.png	0.548000000000000043	404
417	2016-04-10 03:58:03.470869+00	2016-04-10 03:58:03.550692+00	./4ddf42b003239588a74de87c0e09c9b2786d91785667a3be86b3e933.png	0.60199999999999998	408
421	2016-04-10 03:58:12.345827+00	2016-04-10 03:58:12.415891+00	./4dda06e49313c392e6bd2be475172e813bcff116dd8f31f499fd982a.png	0.482999999999999985	412
425	2016-04-10 03:58:21.194365+00	2016-04-10 03:58:21.266209+00	./6029b9f8a1b5c0786c70d5cf35128aff50b673475779be81541b482f.png	0.551000000000000045	416
429	2016-04-10 03:58:30.013653+00	2016-04-10 03:58:30.107258+00	./94d84fd1bb5715da54f447e008ac8393aed41ed8f13349badbc27be1.png	0.552000000000000046	420
433	2016-04-10 03:58:38.834872+00	2016-04-10 03:58:38.902092+00	./ae2d93ac442bdaadc0887ec01f9c30530e225b7ab4c6b2ab40187833.png	0.587999999999999967	424
437	2016-04-10 03:58:47.647957+00	2016-04-10 03:58:47.726219+00	./8f23136f5bfdb8a7fa6d2e04f10a9d4957b79b92f4dd1dec38f107e2.png	0.548000000000000043	428
441	2016-04-10 03:58:56.521193+00	2016-04-10 03:58:56.591331+00	./d7c7a753bd28a8adb15fb36a866b95f5cfc4e0f23b3c5c7e883b6704.png	0.559000000000000052	432
445	2016-04-10 03:59:05.344851+00	2016-04-10 03:59:05.436706+00	./932947cf1620224ecb40fc4edf53b352703fa0b82feae557681817c4.png	0.509000000000000008	436
449	2016-04-10 03:59:14.183287+00	2016-04-10 03:59:14.280106+00	./88589a419bd8ab4afa283fbf78023fd5a1ead8b007dabb981d17dbc3.png	0.569999999999999951	440
453	2016-04-10 03:59:23.138172+00	2016-04-10 03:59:23.216181+00	./8a8fe54502041fc634e02ad5dffff5d82a3894f18c0085a0f358e5a4.png	0.592999999999999972	444
457	2016-04-10 03:59:32.100787+00	2016-04-10 03:59:32.17184+00	./b70bcf442d4ed14aa0a62a9b9dadbbed92cd0496e7ae60b9499bca03.png	0.55600000000000005	448
461	2016-04-10 03:59:40.959863+00	2016-04-10 03:59:41.05657+00	./5a3de62cb297d1c7c0edf802857da71aa449f2c76d6ae5c52a4ebbc9.png	0.585999999999999965	452
465	2016-04-10 03:59:49.975819+00	2016-04-10 03:59:50.04507+00	./762cff38cfc5ad44a2ddc094b967b2cd02218e0f574d2e5edd3e48a5.png	0.547000000000000042	456
469	2016-04-10 03:59:58.93628+00	2016-04-10 03:59:59.018028+00	./c6e8b08a616ffcee67680cab9ce1ff81cd87c3f78ce7e3503bdbeaf4.png	0.553000000000000047	460
473	2016-04-10 04:00:07.89189+00	2016-04-10 04:00:07.967978+00	./b8d0c2c42a2139aaf2693a12a3a67e9fc552c4fe5d6d73f50c863407.png	0.565999999999999948	464
476	2016-04-10 04:00:14.569945+00	2016-04-10 04:00:14.644105+00	./c8cd5c89244c01276002b26f1b1c9d3f48006318ed782d98204b103a.png	0.572999999999999954	467
479	2016-04-10 04:00:21.331202+00	2016-04-10 04:00:21.403189+00	./a85e245505a238acb171eca6abb342a42252bac22180186bb64df00e.png	0.606999999999999984	470
482	2016-04-10 04:00:28.047261+00	2016-04-10 04:00:28.142865+00	./8e98d463d585c2b03f87e9a22a65df02db0ee5c428e174c8290d4620.png	0.622999999999999998	473
485	2016-04-10 04:00:34.792035+00	2016-04-10 04:00:34.886996+00	./db48b5627f15500f311618c10b53f0b821ff851ca1a10c1de11b39cc.png	0.630000000000000004	476
488	2016-04-10 04:00:41.544116+00	2016-04-10 04:00:41.614971+00	./c998d9244d731596addbef4b7bdb2c790a1c014f471516bde4544e5b.png	0.57999999999999996	479
491	2016-04-10 04:00:48.241721+00	2016-04-10 04:00:48.313267+00	./7ee5ffba9f13819d805957e6cd31a8d6c33c609570e9a7a93c660cde.png	0.593999999999999972	482
494	2016-04-10 04:00:54.972627+00	2016-04-10 04:00:55.077271+00	./3242398790085e1d28aafbd4e11323af2a9644d7a6989e6aa6b78095.png	0.608999999999999986	485
497	2016-04-10 04:01:01.739751+00	2016-04-10 04:01:01.826135+00	./891eb1c95fcd645b60ea97bcc71e9d88cae54dd977ca050b8cef852d.png	0.586999999999999966	488
500	2016-04-10 04:01:08.558241+00	2016-04-10 04:01:08.67578+00	./ebcc87617080a7bc1f115666952b014f6b8cd0622b67318670514874.png	0.617999999999999994	491
503	2016-04-10 04:01:15.388258+00	2016-04-10 04:01:15.45724+00	./3d533dc0d3a8f8eeef86d2ac69ae6b4e5124798690f0fd79c2664670.png	0.608999999999999986	494
505	2016-04-10 04:01:19.923647+00	2016-04-10 04:01:20.000889+00	./63fffee6c8d3adbd16039642b6fce2ff4c81cbe06fdf99263c54803e.png	0.595999999999999974	496
507	2016-04-10 04:01:24.463857+00	2016-04-10 04:01:24.565266+00	./b5f14e3caeae9e7ed247403f35184a615f99df279b6425ce37266aaf.png	0.569999999999999951	498
509	2016-04-10 04:01:28.975001+00	2016-04-10 04:01:29.050654+00	./374bff8146a6e8e1420c29b59eef6818f35a4acd5f5077ebd97e4faa.png	0.611999999999999988	500
511	2016-04-10 04:01:33.460614+00	2016-04-10 04:01:33.538589+00	./ebd2f26758bdd9e70a89b1dd4615fca75374eaaa58b20481411d74a8.png	0.60299999999999998	502
513	2016-04-10 04:01:38.050536+00	2016-04-10 04:01:38.117416+00	./1ec6383210dacb0cecd84c493d8b5e7cff2d35652ed880ec2c26a25d.png	0.643000000000000016	504
515	2016-04-10 04:01:42.578866+00	2016-04-10 04:01:42.654986+00	./867dca11313022d651f82a69d185f8a0052f6447e5e5c20e6dacd904.png	0.577999999999999958	506
517	2016-04-10 04:01:47.224446+00	2016-04-10 04:01:47.317246+00	./2958dc15bb0d012ed6977701b5bff98987374238fbd5bcc7b2393555.png	0.615999999999999992	508
519	2016-04-10 04:01:51.823625+00	2016-04-10 04:01:51.905795+00	./e7168db39b92aa4bdca8b6f8ef5526582f6c050d66df6332c2e9b95b.png	0.591999999999999971	510
521	2016-04-10 04:01:56.445515+00	2016-04-10 04:01:56.516469+00	./584b5cc00d855fb965664bd57db229982bd18df02ff3181bcbcf251c.png	0.580999999999999961	512
523	2016-04-10 04:02:00.93861+00	2016-04-10 04:02:01.008837+00	./6ec1d3e924d83e2b31889d55876183a9d3009579904aa950f1992f14.png	0.60299999999999998	514
525	2016-04-10 04:02:05.547169+00	2016-04-10 04:02:05.64066+00	./5df5ce3dbd1cb9b0d12242743ab7033d4224980b4986f9facdaeb662.png	0.630000000000000004	516
527	2016-04-10 04:02:10.246676+00	2016-04-10 04:02:10.349067+00	./83b3843fea75f633ba750cf630439f8d18ddd0661c1c2876a150924c.png	0.639000000000000012	518
529	2016-04-10 04:02:14.887679+00	2016-04-10 04:02:14.961819+00	./1e9baddf6ad4876eaeb9122fcda58add04d0ca5685c50b91f4600492.png	0.57999999999999996	520
531	2016-04-10 04:02:19.432754+00	2016-04-10 04:02:19.502738+00	./90bb501a10b743d73d8b98b5745823fa87d542dbe0589c7c68fa9100.png	0.598999999999999977	522
533	2016-04-10 04:02:24.110951+00	2016-04-10 04:02:24.183657+00	./9bf0e7e553bc7e7097d527253b673e5462d1a65660c86d9ab7f11e58.png	0.661000000000000032	524
535	2016-04-10 04:02:28.672723+00	2016-04-10 04:02:28.765745+00	./0f4e624bdd243920a6d9de1541345b2fdfb8588315f6ead37aaddb70.png	0.59099999999999997	526
537	2016-04-10 04:02:33.324195+00	2016-04-10 04:02:33.40302+00	./8514a2cb7ed16a8dffeb201f92bdaa7f29c8c6809e58016ba620936a.png	0.655000000000000027	528
539	2016-04-10 04:02:37.908775+00	2016-04-10 04:02:37.992934+00	./6212bbd1c6e6cdf222638f71e6890b0f67ab078e6fb42615c8f3c455.png	0.620999999999999996	530
541	2016-04-10 04:02:42.573569+00	2016-04-10 04:02:42.663911+00	./ccf6b802d1cc6ee19d28d030b69f2673369ddafd24d6b841a091aecd.png	0.649000000000000021	532
543	2016-04-10 04:02:47.347693+00	2016-04-10 04:02:47.419269+00	./9f188af59f6f4e0495d425b1d333eaeed33696152afbe39175663586.png	0.682000000000000051	534
544	2016-04-10 04:02:49.708223+00	2016-04-10 04:02:49.800818+00	./61783670826e1ab253eebf663a8f46fe22846706b6cf153585f71d06.png	0.645000000000000018	535
545	2016-04-10 04:02:52.004059+00	2016-04-10 04:02:52.0953+00	./2094e47508d81a38cab0603df94ca2f79d6a2142deb48cf0ab8324d4.png	0.587999999999999967	536
546	2016-04-10 04:02:54.341783+00	2016-04-10 04:02:54.431059+00	./5d941a3de7c871c0ef00158f75c62712ba084170804840f7816d3891.png	0.661000000000000032	537
547	2016-04-10 04:02:56.700676+00	2016-04-10 04:02:56.773671+00	./cde68aa0f05b4f88323102a293d37d61b65a25f92abe4055d10cf8f5.png	0.656000000000000028	538
548	2016-04-10 04:02:59.052133+00	2016-04-10 04:02:59.134444+00	./4bf40bb945c213c3822c1fc855e47913550485fc622a9c3ee0dd3116.png	0.652000000000000024	539
549	2016-04-10 04:03:01.314924+00	2016-04-10 04:03:01.405143+00	./301e77e10b4fcfdfbfd05eb5b6ac9bf7238214a3deab59a85e451d9e.png	0.59099999999999997	540
550	2016-04-10 04:03:03.701755+00	2016-04-10 04:03:03.791178+00	./63094ea1f0839e49afae57bc6f96c8532eb1f6450be1a056b43796b9.png	0.649000000000000021	541
551	2016-04-10 04:03:06.017762+00	2016-04-10 04:03:06.09187+00	./b888fe70d022791d2085978b198c45a7ef6b12187f2c0a0daff2a252.png	0.646000000000000019	542
552	2016-04-10 04:03:08.363868+00	2016-04-10 04:03:08.433068+00	./187dd3af48c49d6a35fb9ad9b4c9ed5e9d1712840b614aa1f74d1aa7.png	0.632000000000000006	543
553	2016-04-10 04:03:10.707285+00	2016-04-10 04:03:10.778031+00	./e21ec135276cb968391a2b5793fe2bac21f0f6b304f4747220f25439.png	0.631000000000000005	544
554	2016-04-10 04:03:13.029615+00	2016-04-10 04:03:13.103404+00	./00ba616aedbdd5aa27f4ae1fc0b3f660491c42a39015570fafef7225.png	0.626000000000000001	545
555	2016-04-10 04:03:15.322051+00	2016-04-10 04:03:15.413593+00	./4d259ac80429fe28b3abb227e072cacdbb328b22b9322f5dbce8bf96.png	0.611999999999999988	546
556	2016-04-10 04:03:17.594722+00	2016-04-10 04:03:17.661312+00	./7e627b9d14ae02dec2123d85fc55d0785974b31c58d9e39f4c0aba75.png	0.586999999999999966	547
401	2016-04-10 03:57:27.547847+00	2016-04-10 03:57:27.623456+00	./cddc329a335e1f239f7dad087336254e7d1707ba5aded2ad00c1284b.png	0.503000000000000003	392
388	2016-04-10 03:56:50.424009+00	2016-04-10 03:56:50.500272+00	./5f1e5016aa6f86100dba3b21089a5ce4b813d6b297268621cf2e7d52.png	0.535000000000000031	379
406	2016-04-10 03:57:38.816991+00	2016-04-10 03:57:38.889324+00	./3cd125c4198e104785a339c46a917f63a20271c08d6da0b7241136a0.png	0.580999999999999961	397
389	2016-04-10 03:56:52.681462+00	2016-04-10 03:56:52.791262+00	./43d3364cf9e5395b1c26e784ce7d4c24575c8b89671f07c6fc41c0f7.png	0.53400000000000003	380
363	2016-04-10 03:55:38.824906+00	2016-04-10 03:55:38.919051+00	./e623439ba588bc5a0d577901f139d74edf8089e8e674ce483303e0ba.png	4.04800000000000004	354
368	2016-04-10 03:56:05.710929+00	2016-04-10 03:56:05.784439+00	./3aa22827cc30ff6d610aaaee54e7d5f81bcdecb8d52bdb5b14ef3bfc.png	0.359999999999999987	359
369	2016-04-10 03:56:07.987188+00	2016-04-10 03:56:08.1053+00	./000709974c4a3624e626f16282baaa2ae0270fd2abd407c8cab0b170.png	0.496999999999999997	360
370	2016-04-10 03:56:10.240403+00	2016-04-10 03:56:10.310333+00	./1f251d742968c07faad941dfbc5f7f23d6b66277790d8c93a8f71829.png	0.490999999999999992	361
371	2016-04-10 03:56:12.477221+00	2016-04-10 03:56:12.548581+00	./502f703052099da37f23d83145de0cb3f4e2d860aa174878d5667fa2.png	0.503000000000000003	362
372	2016-04-10 03:56:14.673342+00	2016-04-10 03:56:14.739405+00	./e78ba02e158f14404222309d2e459970700d8f209321882017999c2e.png	0.401000000000000023	363
373	2016-04-10 03:56:16.904491+00	2016-04-10 03:56:16.973299+00	./e9372b13b0c1d3dc904912cd4a262bf2f28edf1f323868372a1731d8.png	0.543000000000000038	364
374	2016-04-10 03:56:19.181185+00	2016-04-10 03:56:19.276062+00	./20a8492aeb86da87bc9062e628b11c5aca0faee90a8c4d5234b39d9a.png	0.554000000000000048	365
375	2016-04-10 03:56:21.347853+00	2016-04-10 03:56:21.414513+00	./781f441f2156db0c4ec485076cfbc78c9c715682582233c510fcaf7a.png	0.550000000000000044	366
376	2016-04-10 03:56:23.581709+00	2016-04-10 03:56:23.659964+00	./e9e60b147a798a9e8e639eb8843bc5766d6a4f8e876a532e779ec783.png	0.516000000000000014	367
377	2016-04-10 03:56:25.788502+00	2016-04-10 03:56:25.864653+00	./ab454a3324f2aa1c46e770c04ebcd9370b65691f41f83613837f4608.png	0.463000000000000023	368
378	2016-04-10 03:56:27.980885+00	2016-04-10 03:56:28.070425+00	./8f6df26d06f5e3cdf178aefab8723e1ce3141ebe0495a79fa83537fe.png	0.491999999999999993	369
379	2016-04-10 03:56:30.146618+00	2016-04-10 03:56:30.240166+00	./f06dd3e16db1969d2101efbbeb8f046645e06ead029701caad3d5972.png	0.561000000000000054	370
380	2016-04-10 03:56:32.381332+00	2016-04-10 03:56:32.458346+00	./235aa1d65b7d851b921ec5835dc95ab96ec11c77425c1334ddc5697c.png	0.559000000000000052	371
381	2016-04-10 03:56:34.738563+00	2016-04-10 03:56:34.803877+00	./4a3f163a56c6c8cedd01ac7009de9ab26447cdb56af22a99b4640d1b.png	0.529000000000000026	372
382	2016-04-10 03:56:37.001727+00	2016-04-10 03:56:37.075063+00	./e6217fe964529dd437db67e9181189c35b1ea1d60fab6c23f4b976b9.png	0.469999999999999973	373
383	2016-04-10 03:56:39.27405+00	2016-04-10 03:56:39.349522+00	./68498670e5bffc8bc5918b272507a71ebdfd8b812ec99e04676c09d0.png	0.572999999999999954	374
384	2016-04-10 03:56:41.498105+00	2016-04-10 03:56:41.596075+00	./6a58ac63e50961d657300b908016edbd8184a5d3f987949fb517b371.png	0.587999999999999967	375
385	2016-04-10 03:56:43.734741+00	2016-04-10 03:56:43.802737+00	./a7aa7daa4450c90e0cea420a83691c76b0525392814fad8ff0b1e7a3.png	0.570999999999999952	376
386	2016-04-10 03:56:45.987292+00	2016-04-10 03:56:46.065371+00	./17075cd2d728d4a5b631a8b375ee9d3390cd2b86fad43d6199ddaa88.png	0.559000000000000052	377
387	2016-04-10 03:56:48.231255+00	2016-04-10 03:56:48.314304+00	./4f25eedeb61f8d306e4726456885ff862590d2296cfa8db86094fe67.png	0.563999999999999946	378
390	2016-04-10 03:56:54.912612+00	2016-04-10 03:56:54.99559+00	./dd93d6e66c60278defef10451073213e4b796e9bfb2087578f79434d.png	0.541000000000000036	381
391	2016-04-10 03:56:57.229967+00	2016-04-10 03:56:57.307394+00	./e041141ecef68dda6c758ac901ee08ac873c3025b0cf6857379d0581.png	0.592999999999999972	382
392	2016-04-10 03:56:59.467477+00	2016-04-10 03:56:59.539214+00	./473b810a1e2b6a74ddca7d88600e48896b4e96193d21d98107154920.png	0.573999999999999955	383
393	2016-04-10 03:57:01.753988+00	2016-04-10 03:57:01.849057+00	./3e9a5a96fa635fede8864cfd6aac59d81e090305efc27a717469b2b3.png	0.618999999999999995	384
394	2016-04-10 03:57:04.016752+00	2016-04-10 03:57:04.090301+00	./cd724fe03512fb54405a146c1b3acf44d63b6e665bcbd78330fb27db.png	0.549000000000000044	385
395	2016-04-10 03:57:06.257155+00	2016-04-10 03:57:06.354781+00	./47eb93a5c448ba64e58b9904426256ea9bb13b224fd5f6bbeb96253d.png	0.578999999999999959	386
396	2016-04-10 03:57:08.464683+00	2016-04-10 03:57:08.58206+00	./322396b5ec1467868c3a1c58c12a40cd95204bf6d656777bebc5f83c.png	0.561000000000000054	387
410	2016-04-10 03:57:47.791806+00	2016-04-10 03:57:47.889197+00	./88cf4d480a2c5e2c1221b7444c5a97448304bac55d16e4b524177bbf.png	0.527000000000000024	401
414	2016-04-10 03:57:56.743889+00	2016-04-10 03:57:56.828841+00	./8b6cabb5a7b00cc80826ff1abd0ed1d361750be36b917805cdec5bb5.png	0.540000000000000036	405
418	2016-04-10 03:58:05.734484+00	2016-04-10 03:58:05.81309+00	./23038245399124d379dade2d6959ef46545fd9a7056609dc541f1469.png	0.56899999999999995	409
422	2016-04-10 03:58:14.565299+00	2016-04-10 03:58:14.661526+00	./95dbb473bc3fef99e0f304e334ef05b07f3670de65bfa941a1583de7.png	0.520000000000000018	413
426	2016-04-10 03:58:23.384447+00	2016-04-10 03:58:23.456047+00	./f6aa06a47321fc0482e884b58cde10fadc83d3b5d7cfad77f9101cce.png	0.558000000000000052	417
430	2016-04-10 03:58:32.246404+00	2016-04-10 03:58:32.313379+00	./96fc96e3cdcad94eab8e1645b5af0367c809e502e5ca49a503a7358c.png	0.572999999999999954	421
434	2016-04-10 03:58:41.019088+00	2016-04-10 03:58:41.09509+00	./e3e7817dc8911ff2142d0fa7236e6633d3fbc5812d42e8cb606491b9.png	0.564999999999999947	425
438	2016-04-10 03:58:49.865275+00	2016-04-10 03:58:49.936425+00	./07ae369f7966eef5e145140a5ce5fbfd4bd1bc0ab6368eec7cb376a9.png	0.559000000000000052	429
442	2016-04-10 03:58:58.749603+00	2016-04-10 03:58:58.825172+00	./0c1204868ac604af448587f12f3ad8fcfd113d320cb8ca754b870d5f.png	0.571999999999999953	433
446	2016-04-10 03:59:07.55121+00	2016-04-10 03:59:07.677504+00	./3941258c2660e6858177707830483218346927b718e346a5ff0fe32b.png	0.517000000000000015	437
450	2016-04-10 03:59:16.442142+00	2016-04-10 03:59:16.516029+00	./ce29370af20a9feabe439558036a4ef7785f045ae5f7f400a93368ad.png	0.60299999999999998	441
454	2016-04-10 03:59:25.377618+00	2016-04-10 03:59:25.454433+00	./200c55e40d98565282404966b19090d1ccbf3e08641a724f837ad7b9.png	0.573999999999999955	445
458	2016-04-10 03:59:34.324513+00	2016-04-10 03:59:34.425236+00	./2a50c39a5c85178cb5e60ddec06c0ac508c81a9ed95f33cdaf43e666.png	0.580999999999999961	449
462	2016-04-10 03:59:43.21195+00	2016-04-10 03:59:43.292362+00	./d74478ae594cf02a8e6d050d6480f984c4e4fe28048907705ea3211f.png	0.572999999999999954	453
466	2016-04-10 03:59:52.233178+00	2016-04-10 03:59:52.334051+00	./14c6cd8e522354224392506ecd2cb12f0fb3ddfdc747b24ad7037699.png	0.597999999999999976	457
470	2016-04-10 04:00:01.191396+00	2016-04-10 04:00:01.264857+00	./94b0e5827038e71f2d3e05952ee57988b9d4c85ae5fd8d43efc7b35c.png	0.589999999999999969	461
474	2016-04-10 04:00:10.12282+00	2016-04-10 04:00:10.199726+00	./6033b9c9f12788c921da74081e091f94e2bd319375f490a89269c423.png	0.57999999999999996	465
477	2016-04-10 04:00:16.829235+00	2016-04-10 04:00:16.900788+00	./028f7365c848290c10fd4f9d3346a97175b9243809cab622201f182e.png	0.596999999999999975	468
480	2016-04-10 04:00:23.582121+00	2016-04-10 04:00:23.666942+00	./bef2774a166368e0427c172f7fa5fd1cef6d8a68b6b3065d79441238.png	0.559000000000000052	471
483	2016-04-10 04:00:30.286977+00	2016-04-10 04:00:30.359083+00	./d348b4a2b7b2718c1fe438d939c48fda6499187b5e1745bd9cf262bc.png	0.554000000000000048	474
486	2016-04-10 04:00:36.998612+00	2016-04-10 04:00:37.072754+00	./1af6827eee8750a5d5b38ce12f3b93f7ca2f5be2154b643735db6826.png	0.571999999999999953	477
489	2016-04-10 04:00:43.78605+00	2016-04-10 04:00:43.891306+00	./92f62a0ad5eb5aa41e8e6e2fc790788c27a274fe44d87ca945d9e376.png	0.603999999999999981	480
492	2016-04-10 04:00:50.504033+00	2016-04-10 04:00:50.587799+00	./f8b2ab7fa97f0c05b6ab40b10947d2f685f3b37881e24eedbe32e390.png	0.569999999999999951	483
495	2016-04-10 04:00:57.200555+00	2016-04-10 04:00:57.290214+00	./29dca39f721632ce3665a11229758b05f237f4d53d62fd807c153091.png	0.586999999999999966	486
498	2016-04-10 04:01:04.029306+00	2016-04-10 04:01:04.103127+00	./6b3d57239bdae9e9ef4e76fda51d68d46c7840b4f03cd888dd142dd4.png	0.599999999999999978	489
501	2016-04-10 04:01:10.783196+00	2016-04-10 04:01:10.855622+00	./013428d1fa3f462aa33d4efde2d4e763d7d9308a3f6982bfbff062c9.png	0.561000000000000054	492
557	2016-04-10 04:03:19.93151+00	2016-04-10 04:03:20.03064+00	./55a8596f7ab7e8635d94f2ef7b191c5d4f1e1b469f724e651c2ec644.png	0.666000000000000036	548
558	2016-04-10 04:03:22.199211+00	2016-04-10 04:03:22.276745+00	./f8efbdb95a264fc095f6e3a7b60fef58aa691b9f1e4ce435c6a50a3c.png	0.611999999999999988	549
559	2016-04-10 04:03:24.51928+00	2016-04-10 04:03:24.585348+00	./38b577b273728a3d96d4b0f14331418462b61ca681720d05b58d0d6f.png	0.621999999999999997	550
560	2016-04-10 04:03:26.892665+00	2016-04-10 04:03:26.973779+00	./6fd7a02bd54c71b7be87f557872d0fa7a0e43df3eb1b5c9ed0ea5881.png	0.67000000000000004	551
561	2016-04-10 04:03:29.177381+00	2016-04-10 04:03:29.247734+00	./fa52c24e328ec063a90617a34cd120281a910dcc8dac5467a251110a.png	0.587999999999999967	552
562	2016-04-10 04:03:31.628943+00	2016-04-10 04:03:31.706366+00	./43f439913c5fcaa88909158de38732913c81f20040195fb8cb7928c1.png	0.625	553
563	2016-04-10 04:05:02.199108+00	2016-04-10 04:05:02.278198+00	./4c12166555d09d8acd9e0573ab82e7fc2be7e0d6bfff00b2e2cfac3e.png	0.84099999999999997	554
564	2016-04-10 04:05:04.697318+00	2016-04-10 04:05:04.784781+00	./e249f86bafcd37c842e21eefc7242f16d17ec18ff799636b89476da3.png	0.713999999999999968	555
565	2016-04-10 04:05:07.113557+00	2016-04-10 04:05:07.190496+00	./26fa1e4c67f0abf754d85358d85584872a8394092d410a9667b52196.png	0.686000000000000054	556
566	2016-04-10 04:05:09.539902+00	2016-04-10 04:05:09.631162+00	./b62721640ae14b7ea6afeded3b41c0fef16e6b495dd17ec6a2c9849c.png	0.657000000000000028	557
567	2016-04-10 04:05:11.878298+00	2016-04-10 04:05:11.946213+00	./62c1e8754356cdee8b61c009316f32fb71ec60ced394689b059ac2ec.png	0.63600000000000001	558
568	2016-04-10 04:05:14.231+00	2016-04-10 04:05:14.308808+00	./5aa36e32846eac8c385e4c0023e4ebf0bce0d8f537211e386928ba13.png	0.632000000000000006	559
569	2016-04-10 04:05:16.593402+00	2016-04-10 04:05:16.664962+00	./032bf173151eaf38e384007f43d63955c7197212a702c1dcdd4b4b59.png	0.672000000000000042	560
570	2016-04-10 04:05:19.006547+00	2016-04-10 04:05:19.088485+00	./f8ad1c6cc98e84aa6c25cf8e036b87a09d24c64c906f086132b982c8.png	0.675000000000000044	561
571	2016-04-10 04:05:21.410045+00	2016-04-10 04:05:21.476327+00	./b8345279d9cd308d87b97a734d35467d1fe25951c20097f96ab0f29d.png	0.68100000000000005	562
572	2016-04-10 04:05:23.842289+00	2016-04-10 04:05:23.932121+00	./54c9ada35c0e20d1c3312cc81e01f85de787918d2163ff4d996c6cd0.png	0.688999999999999946	563
573	2016-04-10 04:05:26.242267+00	2016-04-10 04:05:26.30866+00	./255b68c670210ce88bbbaaa149563fed8bd64afb1618021c47bed14b.png	0.633000000000000007	564
574	2016-04-10 04:05:28.710253+00	2016-04-10 04:05:28.785449+00	./bdc630a192ce828bc00c7f87cf325ba4df840f91fbe9a9132c0f74ca.png	0.678000000000000047	565
575	2016-04-10 04:05:31.247199+00	2016-04-10 04:05:31.325475+00	./86cd794653020420b481e4806ca5aae7f68a7c1ed4e8d54678b1e9a7.png	0.756000000000000005	566
576	2016-04-10 04:05:33.642413+00	2016-04-10 04:05:33.713506+00	./7fabd322211fcecd1c1a219dfd1a732b98cffc4b0f3d1463b932e87a.png	0.63600000000000001	567
577	2016-04-10 04:05:36.193747+00	2016-04-10 04:05:36.275669+00	./4e6bdb473ed9c0cc88ee6b943bbcd51d0cfec268d7b523b07091d854.png	0.742999999999999994	568
578	2016-04-10 04:05:38.686723+00	2016-04-10 04:05:38.762881+00	./1634533c6e29cea98b2ac95279eb5dfb1ad0eb53202d6c5a906a841e.png	0.714999999999999969	569
579	2016-04-10 04:05:41.219983+00	2016-04-10 04:05:41.294886+00	./c35bedbecbcbf64573a55f61b645b15a66be02fa6fab58ffb8e1b31b.png	0.743999999999999995	570
580	2016-04-10 04:05:43.675926+00	2016-04-10 04:05:43.753603+00	./9e232abd72db84fd5896f295589dcffc00b2bc4d94b2edb78a392ba9.png	0.702999999999999958	571
581	2016-04-10 04:05:46.285319+00	2016-04-10 04:05:46.384839+00	./6647a3689cb39303e5d929d1c54b71836790ff091736965595bf013b.png	0.819999999999999951	572
582	2016-04-10 04:05:48.808927+00	2016-04-10 04:05:48.892959+00	./9809f03acd0ced567f50b26a617896a1461323a35c8193d827812879.png	0.743999999999999995	573
583	2016-04-10 04:05:51.333987+00	2016-04-10 04:05:51.432481+00	./a24f740414f96f17ceb738fdef981b485e03a0e1f7a8fb84e4df93c6.png	0.736999999999999988	574
584	2016-04-10 04:05:53.906442+00	2016-04-10 04:05:53.992799+00	./996c34ad060c5d3240fe6ee2d8d2957e43c49aa932e3a02c0d95195d.png	0.745999999999999996	575
585	2016-04-10 04:05:56.669228+00	2016-04-10 04:05:56.761122+00	./f7dfed3c58dad601a2232b9d8f0daf2ac9044a1c049a5e7a9aedb65d.png	0.800000000000000044	576
586	2016-04-10 04:05:59.171634+00	2016-04-10 04:05:59.250365+00	./8b63724d7c67ccc4ae1b23416137148f7ac7d8f870757a87bebeaf0e.png	0.745999999999999996	577
587	2016-04-10 04:06:01.690684+00	2016-04-10 04:06:01.789078+00	./a567bb1b84328834fa0c01bd7973993b75de0f13683c88fabd97c07c.png	0.72699999999999998	578
588	2016-04-10 04:06:04.424147+00	2016-04-10 04:06:04.500456+00	./df22f313bb29e40360d2327a80bb9bea6943b50d2a999b0292bf3159.png	0.860999999999999988	579
589	2016-04-10 04:06:07.134304+00	2016-04-10 04:06:07.22612+00	./c32bda79a34f19345da1598a793f485a32a01572143a3b4be2f72390.png	0.825999999999999956	580
590	2016-04-10 04:06:09.839348+00	2016-04-10 04:06:09.916702+00	./9a001a46864dbb59017e0386d22dec5730665f7b844ed3a8fffaccb7.png	0.822999999999999954	581
591	2016-04-10 04:06:12.591226+00	2016-04-10 04:06:12.69017+00	./f802c0cfa2bca940b220c527f0bf22e99c5ed0208c21f272ad50e8b9.png	0.876000000000000001	582
592	2016-04-10 04:06:15.522777+00	2016-04-10 04:06:15.606373+00	./b55f9b9a8e8ee69e94a91ac71ac9868172db2bae199fccc1f6506a27.png	0.867999999999999994	583
593	2016-04-10 04:06:18.249099+00	2016-04-10 04:06:18.327784+00	./8e7b5aca7fd685bd0ff5da976af9d53a1f4b2b61a0c2f60d8a457ea5.png	0.790000000000000036	584
594	2016-04-10 04:06:20.989607+00	2016-04-10 04:06:21.068452+00	./e6d26fcb0814ad503273ab126924eeb5b787c57bf163ebe8371d1a23.png	0.820999999999999952	585
595	2016-04-10 04:06:23.953481+00	2016-04-10 04:06:24.032396+00	./2834c37c668d732426002cc504260653dfa44facc236aa4eb5601cba.png	0.88600000000000001	586
596	2016-04-10 04:06:26.85662+00	2016-04-10 04:06:26.936818+00	./9b9688ef5cb40830a045c753a17b4b382e103f5a62ebe15bce244058.png	0.844999999999999973	587
597	2016-04-10 04:06:29.79626+00	2016-04-10 04:06:29.873979+00	./3b4ca87f622c0d00065e845267fe11c291c99224f773b648f99842a3.png	0.923000000000000043	588
598	2016-04-10 04:06:33.069707+00	2016-04-10 04:06:33.149288+00	./3261acb676b4c2b8c83060bacf45b259af80c1531b9676c0ef65a433.png	1.07099999999999995	589
599	2016-04-10 04:06:36.223182+00	2016-04-10 04:06:36.297991+00	./b07b8763742433132aaa793f11f56eb234317a546d846be3f34d9b4d.png	1.06800000000000006	590
600	2016-04-10 04:06:39.353093+00	2016-04-10 04:06:39.433349+00	./3482592c300935ac998df1705533027c2dde0ddec6b430c48e4b467a.png	1.02000000000000002	591
601	2016-04-10 04:06:42.834726+00	2016-04-10 04:06:42.912231+00	./4acebb24ee52b7c433bab63adbc019d04b2573f006987ae0d5a8a379.png	1.10200000000000009	592
602	2016-04-10 04:06:46.237703+00	2016-04-10 04:06:46.374252+00	./cd1d15334eebc0ab0d8dfe1c1489c196e2ed8b10b185ddbfa19bc760.png	1.06600000000000006	593
603	2016-04-10 04:06:50.319162+00	2016-04-10 04:06:50.394265+00	./dce88c6186c0dcd0fbcde8acb2559c13594799973f045a6d40d62226.png	1.377	594
604	2016-04-10 04:06:53.952217+00	2016-04-10 04:06:54.039156+00	./6fbb8c853efc39d04f0e092e0f5ea039a3d13c86fb060b5fa3306ae5.png	1.21500000000000008	595
605	2016-04-10 04:06:58.298506+00	2016-04-10 04:06:58.37765+00	./db635731194fdd0ac1ab094d4c85b863c571c168f52227c3019ea274.png	1.50800000000000001	596
606	2016-04-10 04:07:02.520972+00	2016-04-10 04:07:02.5946+00	./48ac4e1842bbdeb9596603bb679d227d0837ed865550b05667372a1d.png	1.43599999999999994	597
607	2016-04-10 04:07:06.906934+00	2016-04-10 04:07:06.985388+00	./87c8b1ab74cedbda350225be3dedff29f850e5968104d2a12b9cc482.png	1.58000000000000007	598
608	2016-04-10 04:07:12.004394+00	2016-04-10 04:07:12.086892+00	./478db205dbbf08a87f65ca4795a3a7cc86887e68b2e45615347e9610.png	1.81699999999999995	599
609	2016-04-10 04:07:17.087057+00	2016-04-10 04:07:17.183328+00	./f4cb44f630d469208ec43958b1d590aa490377eff4af4f4961554001.png	1.623	600
610	2016-04-10 04:07:20.87989+00	2016-04-10 04:07:20.959946+00	./6064117e3a43a3539b5909ef9d86937255eebe0e6f5cc2fcb50b2a6e.png	1.32699999999999996	601
611	2016-04-10 04:07:25.417845+00	2016-04-10 04:07:25.491981+00	./910d9d4d0baf4d83ea8e3ee91c2714003643f3a06eaed63ed2959d07.png	1.64999999999999991	602
612	2016-04-10 04:07:30.904645+00	2016-04-10 04:07:30.983462+00	./b343bbe160ad2aa97e15afa90294fa77da9001228f9fa78e1da34464.png	2.1469999999999998	603
613	2016-04-10 04:07:35.8377+00	2016-04-10 04:07:35.917609+00	./00363e449baafd09b9bfdceb9f42c9e679aaf4d21450895c50cda32f.png	1.4930000000000001	604
614	2016-04-10 04:07:39.731046+00	2016-04-10 04:07:39.821261+00	./c18aab1641c60bf4158b9829e5b39ec3d2461f5ddf80f292d350299a.png	1.42799999999999994	605
615	2016-04-10 04:07:44.338184+00	2016-04-10 04:07:44.421702+00	./76aa1f51e0382e5e13640e6f3489c7a67832c2b3faac2918a85db50f.png	1.48199999999999998	606
616	2016-04-10 04:07:48.071278+00	2016-04-10 04:07:48.143122+00	./b66b3016e3d8c656d54b7493d5bca0d676982c5ee9bd5e0e38d8b996.png	1.35200000000000009	607
617	2016-04-10 04:07:52.57016+00	2016-04-10 04:07:52.646583+00	./651e35f3f980360ae8b5bf692ceb5d973916e45c086981ba53ee2742.png	1.56800000000000006	608
618	2016-04-10 04:07:56.084863+00	2016-04-10 04:07:56.162878+00	./c424958106be8699fa1562886906c8dd1628d323186af6202258af9f.png	1.28000000000000003	609
619	2016-04-10 04:08:00.531503+00	2016-04-10 04:08:00.631281+00	./281257fc5f93086fb6816b69ee9a925a4f9492fdf2be7ddd7a85cbdb.png	1.47500000000000009	610
620	2016-04-10 04:08:04.726507+00	2016-04-10 04:08:04.815282+00	./0a554b8a0d3bcb475bd35ce2ad0310270efe276c9656480bc0fd25a5.png	1.21999999999999997	611
621	2016-04-10 04:08:09.680616+00	2016-04-10 04:08:09.759217+00	./9d33dcf18fbce37291add50b4451d5880894385febf938b91a8295fe.png	1.89700000000000002	612
622	2016-04-10 04:08:14.588668+00	2016-04-10 04:08:14.670725+00	./e665b67340d1b344460e9cacebf341098d10bb6aaefbce875aa99685.png	1.52200000000000002	613
623	2016-04-10 04:08:18.941917+00	2016-04-10 04:08:19.016695+00	./81d57a295fcb4b30f0347e4b2bbdc6b46517ccf48420b66aaef0dc18.png	1.64399999999999991	614
624	2016-04-10 04:08:22.810514+00	2016-04-10 04:08:22.887773+00	./60b41bbbc3037f6e2d07101e3291515a3cd877a0144a231dc002ab2f.png	1.252	615
625	2016-04-10 04:08:27.571622+00	2016-04-10 04:08:27.646995+00	./5e4366ff479b00656704c87711bccafe104252a527af94dfee4192fd.png	1.43500000000000005	616
626	2016-04-10 04:08:32.488892+00	2016-04-10 04:08:32.582436+00	./d59f5b4f6af85e1c5dd87868c5ae87eca7bbb5ec67ec3be34285a5ef.png	1.96500000000000008	617
627	2016-04-10 04:08:37.316789+00	2016-04-10 04:08:37.396747+00	./4fb97a5524d3703022781b94c182f42fa656ce2d276d892005c9265f.png	1.96199999999999997	618
628	2016-04-10 04:08:41.902039+00	2016-04-10 04:08:41.981422+00	./9e1c9f3725a6ca6faaaf32a330d0404161af13bcc1c245dd339e7a1d.png	2.08099999999999996	619
629	2016-04-10 04:08:45.866341+00	2016-04-10 04:08:45.945576+00	./786c1eb7bb9eb502751099c80cef0877d40411dac541e68ed023a829.png	1.55099999999999993	620
630	2016-04-10 04:08:50.393146+00	2016-04-10 04:08:50.470635+00	./6675b4c65571699491f2afafdfb5880a833c0c7f52c4a8898d9d18e6.png	1.53499999999999992	621
631	2016-04-10 04:08:54.866007+00	2016-04-10 04:08:54.942011+00	./6666500e1a7a0cd05ee14baa0641ed4dd33fea6a3e7e4c06b8626eeb.png	1.59299999999999997	622
632	2016-04-10 04:08:59.133984+00	2016-04-10 04:08:59.216542+00	./3d606be5fd1e0fcbf7b81f1b910fd8aa0100bf28716691623ca3b7c5.png	1.28499999999999992	623
633	2016-04-10 04:09:03.61204+00	2016-04-10 04:09:03.691194+00	./a3362d67ab1feae7ed497e68585587a845b7a6ba9547c4caa004fb00.png	1.77499999999999991	624
634	2016-04-10 04:09:07.604185+00	2016-04-10 04:09:07.686488+00	./3b32dab2df0142a01af0ad206341598696b11cf21c1d84959f441392.png	1.56000000000000005	625
635	2016-04-10 04:09:12.142789+00	2016-04-10 04:09:12.242171+00	./e9addfd3c6ffcd7daa1d6d6283ed822c262442b17e5e1436c62a0151.png	2.06700000000000017	626
636	2016-04-10 04:09:16.71744+00	2016-04-10 04:09:16.787881+00	./c4d3b0102ce0ee417ab4a61c5ea4bcb4ed55f2facadf5633c561bf56.png	1.70599999999999996	627
637	2016-04-10 04:09:21.40683+00	2016-04-10 04:09:21.482507+00	./3f86693624946cf6578e15a697358ba699d9518181946f5809b95a09.png	1.53000000000000003	628
638	2016-04-10 04:09:26.531404+00	2016-04-10 04:09:26.609818+00	./82fd77fdee798ccab2bfdab6eca3bcd2ef6a0c14ec3a000ad46aa3a6.png	1.30299999999999994	629
639	2016-04-10 04:09:32.047005+00	2016-04-10 04:09:32.119406+00	./a165f317d5bad91f4ea24b0c9a91eda862a58b2061990437c4aea729.png	2.26100000000000012	630
640	2016-04-10 04:09:37.270389+00	2016-04-10 04:09:37.352157+00	./02295596d42ec1ca3d10e343301ee27e51f01218f75a4e612ce5c540.png	1.6180000000000001	631
641	2016-04-10 04:09:42.678667+00	2016-04-10 04:09:42.754076+00	./033e99ad65b66e2ef9d8a726b513979ef6c02012708ae23fd8170a1a.png	2.04800000000000004	632
642	2016-04-10 04:09:47.599492+00	2016-04-10 04:09:47.68393+00	./0af940837ae9d76d076827baec10014c790b2b133d9af10f86be7403.png	1.96599999999999997	633
643	2016-04-10 04:09:53.123935+00	2016-04-10 04:09:53.199621+00	./803bec1421a523ead2838c3d4240298d49a4cdf9190b4a31752ebea3.png	1.52899999999999991	634
644	2016-04-10 04:09:58.133778+00	2016-04-10 04:09:58.210688+00	./306731825b7e2daf04f15dea4ee3a2ac0aec935f32b70685a287e952.png	2.03299999999999992	635
645	2016-04-10 04:10:03.592363+00	2016-04-10 04:10:03.664733+00	./427802fa94743b3e0d568011b2c39a992cce65a356ea646311994904.png	1.54699999999999993	636
646	2016-04-10 04:10:08.507606+00	2016-04-10 04:10:08.592761+00	./575a9d1992603efc2455b059d520bc9444b5d11ef3425d556e138433.png	1.8680000000000001	637
647	2016-04-10 04:10:14.024226+00	2016-04-10 04:10:14.108235+00	./bf90fb1254183e11b9e3963a43cedcfcae3b8e2917d5185b32ed4b42.png	2.0259999999999998	638
648	2016-04-10 04:10:19.253087+00	2016-04-10 04:10:19.356771+00	./b5f5ba174a68badbed189b349489cdbd228e9a6c3ef63fb71611ee07.png	1.46799999999999997	639
649	2016-04-10 04:10:24.180473+00	2016-04-10 04:10:24.287034+00	./a076f9b11027ddbada58a41c229b06adc0a73304bb54ad3e556c34ba.png	2.0089999999999999	640
650	2016-04-10 04:10:29.468545+00	2016-04-10 04:10:29.553535+00	./7da2b23aaab8f9583acf23af57ae625778459c8778fec6cb1f77b821.png	1.82499999999999996	641
651	2016-04-10 04:10:35.225001+00	2016-04-10 04:10:35.323824+00	./14e66a0f5b19929427618b47623f80c9e3f8ebd6d44811400313cc07.png	1.78699999999999992	642
652	2016-04-10 04:10:40.8031+00	2016-04-10 04:10:40.879+00	./9a0a934753a8cf68c3fadb2b6f9853dbf1f182e7ac974a431797b498.png	1.72799999999999998	643
653	2016-04-10 04:10:45.689411+00	2016-04-10 04:10:45.768206+00	./e50c220845723687df048c76296fd7a5fd08ba7f334b72fd690ed152.png	1.72799999999999998	644
654	2016-04-10 04:10:51.066109+00	2016-04-10 04:10:51.143287+00	./b082bdfc467b4b61da4abf8bf7abdd1a9b1bb628ad43cb4c83115892.png	2.03799999999999981	645
655	2016-04-10 04:10:56.858846+00	2016-04-10 04:10:56.931445+00	./d6689fce97e1cb1d977c623a9fa400baf0b82a6bdd095377d7b1d127.png	2.09600000000000009	646
656	2016-04-10 04:11:02.489772+00	2016-04-10 04:11:02.569426+00	./fab72f56c4ab997ec35f82ab0b23ba5e3690d322d22be2819bd61562.png	2.17600000000000016	647
657	2016-04-10 04:11:08.018391+00	2016-04-10 04:11:08.098231+00	./cd2d7909e7cd521107c0b969ca66da745d7947c1c87a9b00f2dfdb2c.png	1.91199999999999992	648
658	2016-04-10 04:11:13.397087+00	2016-04-10 04:11:13.480329+00	./4882ac2073448368e79916d2d7cb2e7086fac9a3a4d0f8b8aec52b82.png	1.95300000000000007	649
659	2016-04-10 04:11:19.257838+00	2016-04-10 04:11:19.332254+00	./a9ef7aa3b123506bb8e858bbb36c1515bf7584b6e7806231dbe4ea38.png	2.19300000000000006	650
660	2016-04-10 04:11:24.910333+00	2016-04-10 04:11:24.991942+00	./f5a950aabe34171035816a30c23aeddeb658702d5b56ca00138f52a3.png	2.14599999999999991	651
661	2016-04-10 04:11:30.164884+00	2016-04-10 04:11:30.23699+00	./a6b08a9b1d18f5439bbb44c9df4971124110cdbdd99b4f25f2dc19cd.png	1.92700000000000005	652
662	2016-04-10 04:11:36.411163+00	2016-04-10 04:11:36.519651+00	./878d253d112b8d54c58ca2d4948e1f9623c9e8952c58722f30e6e9d0.png	2.86799999999999988	653
663	2016-04-10 04:11:42.561274+00	2016-04-10 04:11:42.634421+00	./4fb43aefbc137d0b8da742db6205101e152b35d51851103f5ccae348.png	2.06400000000000006	654
664	2016-04-10 04:11:48.176951+00	2016-04-10 04:11:48.249322+00	./d695d253bdec793792ba7e0c268be76aceb212dae275fec609e8e3f5.png	1.85099999999999998	655
665	2016-04-10 04:11:55.054503+00	2016-04-10 04:11:55.133006+00	./52c65e13a685c3ef9b6ad784ba52ea1d6cdbbc6023d6c8b6b003e9ee.png	3.07500000000000018	656
666	2016-04-10 04:12:00.924149+00	2016-04-10 04:12:01.024882+00	./136f70552f0a45a573a8ae505ebf76a55ba9cf9348af53489b56e282.png	1.97700000000000009	657
667	2016-04-10 04:12:07.581479+00	2016-04-10 04:12:07.658136+00	./23abaa580ad19ad4a5b84f0b0f5fc4fd6a3df70b7f92cb0c00cf80a2.png	2.36299999999999999	658
668	2016-04-10 04:12:13.537882+00	2016-04-10 04:12:13.641451+00	./5c8617c67f6ca315e29bdfd6b955f93244b3f471be3b47ebbc15e5db.png	1.54899999999999993	659
669	2016-04-10 04:12:19.679105+00	2016-04-10 04:12:19.751814+00	./64e338dca9b1485678042b34a8fd93f865c7fea876b0fe2d4e1c4e69.png	2.0259999999999998	660
670	2016-04-10 04:12:25.383981+00	2016-04-10 04:12:25.465729+00	./2f742d02d0392a8fb2028f1f995a27a655adb5cacf6395991bcd40ed.png	1.68599999999999994	661
671	2016-04-10 04:12:31.81264+00	2016-04-10 04:12:31.908928+00	./b31900502b7835c0ece7352d8882875088255f5d4377c0101a409783.png	2.33400000000000007	662
672	2016-04-10 04:12:38.627383+00	2016-04-10 04:12:38.737398+00	./e5b0e585c4ee7ff26b4d269120609ba54b45ba327a9680becfef4331.png	2.90200000000000014	663
673	2016-04-10 04:12:45.524637+00	2016-04-10 04:12:45.597923+00	./ca12274be1511956a3fb0ef3c90727e55f270f2423980e0f83d56dfc.png	3.05399999999999983	664
675	2016-04-10 04:18:07.547421+00	2016-04-10 04:18:07.655052+00	./f9972651197d6dc08e3bbab7b405cb0d8fc0ad9b90766e67e133f111.png	0.474999999999999978	667
676	2016-04-10 04:18:10.155145+00	2016-04-10 04:18:10.265182+00	./86b728a2ab54c33d8215c8d00a6e343b09cb95e4b226ccfb48dd7ce2.png	0.712999999999999967	668
677	2016-04-10 04:18:12.78291+00	2016-04-10 04:18:12.898543+00	./f1d83184f27cfc446b324372414d0e963ac0fa662b02851a15acead9.png	0.682000000000000051	669
678	2016-04-10 04:18:15.416296+00	2016-04-10 04:18:15.516997+00	./8e36527b1e138556299128ef07b4e43cf42b1e5fb2ea3972015f3e70.png	0.548000000000000043	670
679	2016-04-10 04:18:18.03833+00	2016-04-10 04:18:18.168426+00	./ba60c10d5aac542e452344ff74b0a115874e331da819a7c686cd4ab3.png	0.794000000000000039	671
680	2016-04-10 04:18:20.637463+00	2016-04-10 04:18:20.747105+00	./fdf96a8c27101cfea8f27fd4ee4fd8b8ae231e56f263c6693ad14ce1.png	0.744999999999999996	672
681	2016-04-10 04:18:23.245152+00	2016-04-10 04:18:23.372963+00	./371a4b25eeead3309e670ce661cef58df43f1f5075262bd6f67ffcbd.png	0.699999999999999956	673
682	2016-04-10 04:18:25.833178+00	2016-04-10 04:18:25.932369+00	./6efb140fbcd132d3a189bae0f5514fec1dd5faa927933bd2a04aaedc.png	0.646000000000000019	674
683	2016-04-10 04:18:28.449933+00	2016-04-10 04:18:28.585694+00	./f0c65986533897fcd2a28bbdd3c30197dc0c566e96649bc0f45f6c2b.png	0.78400000000000003	675
684	2016-04-10 04:18:31.083833+00	2016-04-10 04:18:31.225599+00	./e4fd235d4a36d1bc0957541f645a456c65182bde3938fa121a7a1bfb.png	0.759000000000000008	676
685	2016-04-10 04:18:33.678416+00	2016-04-10 04:18:33.821076+00	./2fdf3a9197056cfbb3a27723cd93350442e5172b0c2b78441e9b6bb3.png	0.724999999999999978	677
686	2016-04-10 04:18:36.30096+00	2016-04-10 04:18:36.422326+00	./2253884b0bb00ccdd02d5df72cbf6cec6bdd33e61f25528e3866de4f.png	0.782000000000000028	678
687	2016-04-10 04:18:38.91008+00	2016-04-10 04:18:39.014022+00	./d551b55d52549c1311e3638e53e86a0b173845dedc8c8cec08c5c341.png	0.796000000000000041	679
688	2016-04-10 04:18:41.51933+00	2016-04-10 04:18:41.622162+00	./63041fc008bf7b03fecb84bb14d7100a41c8e02dd953afff1fdcf786.png	0.766000000000000014	680
689	2016-04-10 04:18:44.167133+00	2016-04-10 04:18:44.27738+00	./16577c0d6aa785bc2886832cea59290f78b479221922727f8dd0c881.png	0.739999999999999991	681
690	2016-04-10 04:18:46.809304+00	2016-04-10 04:18:46.933903+00	./08a4da0aebb3c3ab76d05a0f2686d007210cfc98f8eaef6e75826562.png	0.783000000000000029	682
691	2016-04-10 04:18:49.388887+00	2016-04-10 04:18:49.511639+00	./243ccb9fd8fdf1273eb4e3870e9ef796a1490894e748c6e6c0b656a6.png	0.717999999999999972	683
692	2016-04-10 04:18:52.019802+00	2016-04-10 04:18:52.151258+00	./283e9bb0789e8164e7b6483701d1fb4160c87f19b4ed1a67ca68549a.png	0.778000000000000025	684
693	2016-04-10 04:18:54.674058+00	2016-04-10 04:18:54.780309+00	./1ba63863351d07d9c90b0aba4ece5be2a015e7dfcfda0d07c2c0c41a.png	0.774000000000000021	685
694	2016-04-10 04:18:57.316355+00	2016-04-10 04:18:57.421095+00	./98973275d4c1b07b0e875e9836938e56ef6e446a8d30434bbd033197.png	0.782000000000000028	686
695	2016-04-10 04:18:59.994059+00	2016-04-10 04:19:00.105476+00	./ee799b3210c96c2f8217c4ce39aabb7ad50f2e3c7fa484d2b6d8d589.png	0.733999999999999986	687
696	2016-04-10 04:19:02.646908+00	2016-04-10 04:19:02.763484+00	./d0d4b178f623c32261e86d868f88a33a7859c3cce986151749264f0f.png	0.766000000000000014	688
697	2016-04-10 04:19:05.281074+00	2016-04-10 04:19:05.387752+00	./c4da7277fd0d1dc950ed78e58e2a9a7283ef34512d52d3f7eaa6a992.png	0.780000000000000027	689
698	2016-04-10 04:19:07.917609+00	2016-04-10 04:19:08.031345+00	./b4232be471ddc68b5bce3e0033b3cfa219b63043ec0b96c9bb651dd3.png	0.771000000000000019	690
699	2016-04-10 04:19:10.556962+00	2016-04-10 04:19:10.660628+00	./db2df85cd444b7dbb6d80a0e05eeb79321726d1a5da81209cc79611f.png	0.782000000000000028	691
700	2016-04-10 04:19:13.162486+00	2016-04-10 04:19:13.273153+00	./95d091b2c0f0bf004f1aa796d7d480c290ca5b3a2ec3b85f8a536bd6.png	0.760000000000000009	692
701	2016-04-10 04:19:15.759316+00	2016-04-10 04:19:15.861431+00	./0c0fe6f152d33e71fb1842b4aea8cda59ba242c2ac589c5cb19e33c6.png	0.792000000000000037	693
702	2016-04-10 04:19:18.413512+00	2016-04-10 04:19:18.522745+00	./8e895e907fa580f35c40d1a1ccad23a18fd3d29f7ac9c07aea99b7e7.png	0.767000000000000015	694
703	2016-04-10 04:19:21.021378+00	2016-04-10 04:19:21.137624+00	./c78fd6eb74d775458d48bd3a175574aee75af787df4645f17736c3c5.png	0.770000000000000018	695
704	2016-04-10 04:19:23.658987+00	2016-04-10 04:19:23.919633+00	./d3b34d71a40512a59c436bce64984603a46cd709e9f5920d4df020c4.png	0.767000000000000015	696
705	2016-04-10 04:19:26.304292+00	2016-04-10 04:19:26.441994+00	./c9aeb6aae97ec7e7d0c91545933cc254835344f0b00a9cb6269f796e.png	0.777000000000000024	697
706	2016-04-10 04:19:28.926967+00	2016-04-10 04:19:29.047035+00	./4bfdfe42b9d0937db5346b8ba3d768c990bd32658b8b7fd7b4952c1e.png	0.747999999999999998	698
707	2016-04-10 04:19:31.541434+00	2016-04-10 04:19:31.647675+00	./a8e41ca94e123181db31f0b836679888f76c067b532fe4fc82130e12.png	0.758000000000000007	699
708	2016-04-10 04:19:34.113255+00	2016-04-10 04:19:34.214562+00	./8a7f2f7846c049aa115391374a8a714035f7020b351ed0609d23d7a1.png	0.770000000000000018	700
709	2016-04-10 04:19:36.759935+00	2016-04-10 04:19:36.874793+00	./f87735a28598d18821f1f35d5292d6a720a4262f4ed387f938aaed70.png	0.771000000000000019	701
710	2016-04-10 04:19:39.379663+00	2016-04-10 04:19:39.483788+00	./14daa1260a3c79b71346573ab38da3a834d6b8316ba85163c416b041.png	0.728999999999999981	702
711	2016-04-10 04:19:41.994824+00	2016-04-10 04:19:42.102923+00	./a27f53403047dc474b80ccf17bcf3b6502070a605e1564eb2f583c1d.png	0.720999999999999974	703
712	2016-04-10 04:19:44.621307+00	2016-04-10 04:19:44.720291+00	./1c6bae098a40a4a58e9825367f3725f52f318b689397936304b1121a.png	0.755000000000000004	704
713	2016-04-10 04:19:47.223205+00	2016-04-10 04:19:47.328786+00	./08050bcb2da44b561fe7af54331324957d091746bfd0c8785e5b4467.png	0.758000000000000007	705
714	2016-04-10 04:19:49.832655+00	2016-04-10 04:19:49.940546+00	./918aad9090d2d7c215316d09543d883463b388fa5d22ff40cbdc53b2.png	0.719999999999999973	706
715	2016-04-10 04:19:52.447903+00	2016-04-10 04:19:52.559627+00	./aa66a2a06d02d85d75135d7f8dfa0b00c63b10130b5d43ba03719d97.png	0.762000000000000011	707
716	2016-04-10 04:19:55.14251+00	2016-04-10 04:19:55.243488+00	./48c73bf0478b1a83803f820e7c27c50a9c6e844b216f2d41957fc24b.png	0.799000000000000044	708
717	2016-04-10 04:20:31.869047+00	2016-04-10 04:20:31.991789+00	./3a1d971af01215a6ea2a372f549e28a9f2503efd3632ee9683dc7e9c.png	0.492999999999999994	710
718	2016-04-10 04:20:34.496956+00	2016-04-10 04:20:34.604485+00	./986e21541666e35c20a28477a22a05f166c7f6a55325c9b6e68d4ef7.png	0.561000000000000054	711
719	2016-04-10 04:20:37.110458+00	2016-04-10 04:20:37.212451+00	./6f1b5a366b1b8bf915af626752f71962c39c24708e723ea19f9fc6b0.png	0.671000000000000041	712
720	2016-04-10 04:20:39.720483+00	2016-04-10 04:20:39.824539+00	./b0aaeac7aa78086c325c80a318d5256248f989b65a4c02c20db9c640.png	0.403000000000000025	713
721	2016-04-10 04:20:42.391992+00	2016-04-10 04:20:42.502018+00	./35f9189a9ee8c65b909ea7dce6e1018c5d84ad8f9872afb5f426398b.png	0.732999999999999985	714
722	2016-04-10 04:20:45.046002+00	2016-04-10 04:20:45.16817+00	./1141d8cb2e55f280e6d3052f1336779190a33991d041821637cee5cb.png	0.744999999999999996	715
723	2016-04-10 04:20:47.679192+00	2016-04-10 04:20:47.790262+00	./cca0e78772a343e74380782277496ab47ac7a7b4990ee968cc998eee.png	0.744999999999999996	716
724	2016-04-10 04:20:50.331743+00	2016-04-10 04:20:50.440749+00	./62a8b82d9a5c057f25eb7ac796c9d03e8aa10f0a3b95624c3f46b46d.png	0.752000000000000002	717
725	2016-04-10 04:20:52.965205+00	2016-04-10 04:20:53.080619+00	./42d42f8cb9a96a309b6c627f3a568a01ef38ed0cee98dc4d5e77fe6e.png	0.763000000000000012	718
726	2016-04-10 04:20:55.6059+00	2016-04-10 04:20:55.714516+00	./fb8a84a24b9def2c574911d5c1b426d30b067c82237a1c2f49db02e8.png	0.740999999999999992	719
727	2016-04-10 04:20:58.287134+00	2016-04-10 04:20:58.400158+00	./ec018f8297383a39539c11551b1778ea01619a88950a139016e8794d.png	0.785000000000000031	720
728	2016-04-10 04:21:00.963721+00	2016-04-10 04:21:01.08068+00	./450ddd7b2fa4f0d0ddbd7ac805e7634526b0a923e5cde0943b5e84f9.png	0.766000000000000014	721
729	2016-04-10 04:21:03.601711+00	2016-04-10 04:21:03.723419+00	./840d2f73d5da94861c31af674eda481998480651f22351deb1d34020.png	0.746999999999999997	722
730	2016-04-10 04:21:06.293143+00	2016-04-10 04:21:06.424777+00	./ece1c48991b1d3e817694fa4fe2b2f62f5f685906e894c90fe26645a.png	0.737999999999999989	723
731	2016-04-10 04:21:08.941165+00	2016-04-10 04:21:09.060114+00	./5d942a4056ded55589ab921553126ba7391fb4cdf17fe8119acefb76.png	0.742999999999999994	724
732	2016-04-10 04:21:11.579532+00	2016-04-10 04:21:12.057981+00	./01acef58ebb19dc0092dd6223c8bc7be55fb1c6b837515dc840d42bd.png	0.774000000000000021	725
733	2016-04-10 04:21:14.285139+00	2016-04-10 04:21:14.396148+00	./53b1807b617e4464d936bf31194a618f106d19266ae6771e3c57b75c.png	0.760000000000000009	726
734	2016-04-10 04:21:16.938081+00	2016-04-10 04:21:17.050683+00	./b25281711a34953bd3fd78f2593aaed31a2cf86d98104ebe6e4a583d.png	0.794000000000000039	727
735	2016-04-10 04:21:19.622717+00	2016-04-10 04:21:19.737495+00	./de2d8fa414c0c34c3294045ae7dacaa4b11d0f1b5811edfdde84a16d.png	0.728999999999999981	728
736	2016-04-10 04:21:22.283989+00	2016-04-10 04:21:22.420455+00	./c0c8ca96d4b39d7b6f43ddfd7bda13d053588f77f473715c67d237ca.png	0.743999999999999995	729
737	2016-04-10 04:21:25.05323+00	2016-04-10 04:21:25.167881+00	./16a99b9b01eadb2891d84fb7a4f0589221cc5b39bd88a0d3ed4286bf.png	0.822999999999999954	730
738	2016-04-10 04:21:27.737603+00	2016-04-10 04:21:27.854205+00	./fbb1ea7ae468d41152f8bd2c53a98ce585e1406527db8fa0a8724739.png	0.683000000000000052	731
739	2016-04-10 04:21:30.406038+00	2016-04-10 04:21:30.51463+00	./2a960cad8a25254faeb728c117299b5b6d79d84f749a9f4a561f6499.png	0.735999999999999988	732
740	2016-04-10 04:21:33.092861+00	2016-04-10 04:21:33.225866+00	./d11c4916482ca0597c4e16fd054e7fe2531f5a81c3ba4edf23b984a5.png	0.747999999999999998	733
741	2016-04-10 04:21:35.721607+00	2016-04-10 04:21:35.828322+00	./b267c939f2cb30607bd2931f0618c9467197000a0e7b1d5a64ee00bd.png	0.716999999999999971	734
742	2016-04-10 04:21:38.330061+00	2016-04-10 04:21:38.467551+00	./315a87ddd52650bf33fb2c32119f0f29074a6e86b1ddcd476d173521.png	0.740999999999999992	735
743	2016-04-10 04:21:41.008058+00	2016-04-10 04:21:41.117718+00	./5d5db8a67eb16570dda36eb30bf066f3c752874564b3ff734cfcebb2.png	0.76100000000000001	736
744	2016-04-10 04:21:43.645301+00	2016-04-10 04:21:43.809385+00	./489bc6d8908c75588ea241e665fb0b9075a292048427aa73dee078b7.png	0.796000000000000041	737
745	2016-04-10 04:21:46.31224+00	2016-04-10 04:21:46.415945+00	./3c4b1f58fd3491cf87fb63ebca7cc74791b15810b6b65085798ab6a2.png	0.793000000000000038	738
746	2016-04-10 04:21:48.947926+00	2016-04-10 04:21:49.057693+00	./6465b92697e54cd1fd9ff3fe6c21794e539917aa461f517083704987.png	0.779000000000000026	739
747	2016-04-10 04:21:51.57907+00	2016-04-10 04:21:51.694839+00	./4713f993af7712c0dd6547a4406b60a11a7026881a455a2624d39513.png	0.780000000000000027	740
748	2016-04-10 04:21:54.224832+00	2016-04-10 04:21:54.389394+00	./80df44eab221871e6b3b3a14eac8e35bb70cf3b04db156dc703adf7e.png	0.783000000000000029	741
749	2016-04-10 04:21:56.870789+00	2016-04-10 04:21:57.022138+00	./8c44d51bfdb6d9c1ca1cc673cf46d5c1f38973656b358548cdf3a854.png	0.782000000000000028	742
750	2016-04-10 04:23:30.983422+00	2016-04-10 04:23:31.101284+00	./2a4ecc06c4e3da077f7f53a6711fd5a6403852e7f2f6d75f60a75a31.png	0.479999999999999982	744
751	2016-04-10 04:23:33.596436+00	2016-04-10 04:23:33.733036+00	./70193aa1cf301709ac625b8b73e953274b09b6dc565b6fdc25af64bf.png	0.68100000000000005	745
752	2016-04-10 04:23:36.203725+00	2016-04-10 04:23:36.303092+00	./38d5679ec78aac9cdabd080d0a4b0478edc7655d2fe3f235067c4819.png	0.786000000000000032	746
753	2016-04-10 04:23:38.788722+00	2016-04-10 04:23:38.895665+00	./91b130812d37eafffd18f329bfef453a5f31f236a7890d035ec1d02e.png	0.440000000000000002	747
754	2016-04-10 04:23:41.425699+00	2016-04-10 04:23:41.565271+00	./6ec496d020bc019d3a08818a7a3d9f2e49049b489cb0173d9a4d503b.png	0.557000000000000051	748
755	2016-04-10 04:23:44.193981+00	2016-04-10 04:23:44.320636+00	./e714b9ceef0f3c18d886603566955d99e04df5f32185750126c1d182.png	0.741999999999999993	749
756	2016-04-10 04:23:46.846059+00	2016-04-10 04:23:46.951795+00	./bbd65369d7b4f6e82c9ed580f1b5d0cd24d9e399e978102d2a55a26e.png	0.810000000000000053	750
757	2016-04-10 04:23:49.459466+00	2016-04-10 04:23:49.583451+00	./faac5721ba0e2f10b9fb999fc1657f126a139960082f87d577494314.png	0.744999999999999996	751
758	2016-04-10 04:23:52.113949+00	2016-04-10 04:23:52.257403+00	./88c0787b39bbf4e6f884c5486b55962c145efa0a1e0f9686982260b5.png	0.753000000000000003	752
759	2016-04-10 04:23:54.753153+00	2016-04-10 04:23:54.876641+00	./b41fb91086005009f92ef2adef70bf63811d559733c74fbffaf30830.png	0.723999999999999977	753
760	2016-04-10 04:23:57.424078+00	2016-04-10 04:23:57.527121+00	./10ff19a1c196ba29ea8dd67bab12950eef529bc03184beda2fb98eac.png	0.723999999999999977	754
761	2016-04-10 04:24:00.123342+00	2016-04-10 04:24:00.265068+00	./8f8b07f06c7395651985c4d53772efdf9dfc0568cf40e1fbb8704364.png	0.76100000000000001	755
762	2016-04-10 04:24:02.731267+00	2016-04-10 04:24:02.841504+00	./150213c30e4554fc7db4cf0b2b602104cd213dd214bc012bf382256f.png	0.748999999999999999	756
763	2016-04-10 04:24:05.36813+00	2016-04-10 04:24:05.492029+00	./364e03f10c63b1ebffbc05a4d6c692815f19597d30507fac973d91b1.png	0.826999999999999957	757
764	2016-04-10 04:24:08.042859+00	2016-04-10 04:24:08.167224+00	./2595d2599c72440911ab9a0454872021242dab8c430515ba01244626.png	0.740999999999999992	758
765	2016-04-10 04:24:10.679059+00	2016-04-10 04:24:10.803267+00	./c9a899e94210e688565275b8c500f01bbd1f2c95dd3febf0d1ac0a38.png	0.755000000000000004	759
766	2016-04-10 04:24:13.289849+00	2016-04-10 04:24:13.397057+00	./747c43f4051ce184301c60a10565bc9522a2b008d63809ae11608092.png	0.741999999999999993	760
767	2016-04-10 04:24:15.950671+00	2016-04-10 04:24:16.07655+00	./22952029594ec91ea80112076932b56b0877fa648df418591f52e6d0.png	0.744999999999999996	761
768	2016-04-10 04:24:18.600177+00	2016-04-10 04:24:19.042367+00	./140a3ec8d3ac223b94b31877fbf1006d021b7fd3050986e14fcb4056.png	0.780000000000000027	762
773	2016-04-10 07:57:17.670633+00	2016-04-10 07:57:17.774386+00	./07ae0ffec50afb3b69cafd31aac423e9346d551a91f74634e15d277f.png	0	767
774	2016-04-10 08:39:09.142858+00	2016-04-10 08:39:09.253468+00	./45f00659f0952cec18755742b059f9fb3ee5b73b51fc0054b620d8d6.png	0.0950000000000000011	768
775	2016-04-10 08:56:47.268198+00	2016-04-10 08:56:47.382641+00	./d8332c07553936dd0060857e8159b51c10580d9f893c3321b6c1b72d.png	0.235999999999999988	769
776	2016-04-10 09:00:12.675664+00	2016-04-10 09:00:12.767846+00	./0bf2b69aea41d004dbc07213b941e0afd18a3d13ecb40bac73d48059.png	0.096000000000000002	770
777	2016-04-10 09:01:07.120204+00	2016-04-10 09:01:07.214276+00	./af3eacffd8c18467decd0d2ff08aed95c584bf5418eb9e6a7086c39c.png	0.482999999999999985	771
778	2016-04-10 09:22:31.759713+00	2016-04-10 09:22:31.853949+00	./538ec9c92742121bca070b43ccdea5712cef271bbc297b4e8fca4cfb.png	0.149999999999999994	772
779	2016-04-10 09:22:49.015476+00	2016-04-10 09:22:49.168116+00	./6d08bb0112a88326b1c78deec4e37e836884539e22ecd2d928f9569d.png	0	773
780	2016-04-10 09:25:07.587668+00	2016-04-10 09:25:07.673528+00	./b3810b78a01ab8919927621c266c63ef45d695c06457ec15fdc171b8.png	0.431999999999999995	774
781	2016-04-10 09:25:50.067505+00	2016-04-10 09:25:50.164063+00	./f455041934f44ecf74d3b4367b2e66ff7b9f2ab66369532a599bb073.png	0.188	775
782	2016-04-10 09:43:34.570075+00	2016-04-10 09:43:34.665212+00	./5b2a450aa4646918e9b02a83c83f7d5fe98b4e9cb2a56c1c61346360.png	0.208999999999999991	776
783	2016-04-10 09:50:59.600693+00	2016-04-10 09:50:59.691756+00	./4509b03d2cb6d425fec5d63acf363e478d7c1d0f7d1e4462669fafce.png	0	777
784	2016-04-10 09:54:44.105501+00	2016-04-10 09:54:44.199922+00	./984e55b938ee0dbf10e43809b0bc82c84d44dddbed2d1e28355b11f2.png	0	778
803	2016-04-21 05:50:37.65588+00	2016-04-21 05:50:37.909084+00	./9c1bba9d9a4c8154b8d3e8ce4f7a2e12caf8b3afe6a12a2d9581da83.png	0.27300000000000002	663
795	2016-04-12 00:38:43.174647+00	2016-04-12 00:38:43.424091+00	./6cb2c68603f3af0880bc50eefe58d2c13d796441a097226d06909776.png	15.0090000000000003	125
804	2016-04-30 05:57:37.073121+00	2016-04-30 05:57:37.271454+00	./0f5c33b52bd30969368d96792ddb4b030f073ef4967e1e7ab4b7ed15.png	2.0299999999999998	360
805	2016-05-03 09:59:01.705326+00	2016-05-03 09:59:01.862874+00	./9b49c40bc27e8f5fc482cbd6c954029b7a6b98a68172721963ba4538.png	0.530000000000000027	808
806	2016-05-03 10:00:45.217345+00	2016-05-03 10:00:45.334314+00	./fd5f7901fde3001399e285fcb8b8408b576e28d8252b60c4415308f4.png	0.467000000000000026	809
807	2016-05-03 10:06:57.81546+00	2016-05-03 10:06:57.969819+00	./95fe963d12e51cc4f85594c9c5695dfc663c2aeb102b201bf3ff89e9.png	0.615999999999999992	810
808	2016-05-03 10:42:59.077222+00	2016-05-03 10:42:59.16224+00	./3d18c129c0738e17419754dc7a1b7aa2dfe4f6e9a0356c0727afe9d4.png	0	811
809	2016-05-03 10:43:10.091661+00	2016-05-03 10:43:10.188188+00	./9458856f1505fdcce5b6d079a64ff34d0634511b081ecc3ccbe81421.png	0.148999999999999994	812
813	2016-05-04 08:27:45.11935+00	2016-05-04 08:27:45.369658+00	./3cea1824dcf436dc8888880dfb5fae1770bfc264ddaa8db06ce466f8.png	0.580999999999999961	815
814	2016-05-04 09:09:01.079881+00	2016-05-04 09:09:01.239278+00	./cf5b827ebacef4b66ed31ee06e6ce6a0ea7ef1719b740310f09a939e.png	0.581999999999999962	816
815	2016-05-04 09:11:07.648107+00	2016-05-04 09:11:07.752883+00	./5471287c3d2dc304d85a2f17d8ee1b6e40fc0d264830b930b6529cf8.png	0.254000000000000004	818
816	2016-05-04 09:11:25.358131+00	2016-05-04 09:11:25.45595+00	./2a6fa4b44bd8db4886f4eaa39c7b4ae9ec8d5e6bb73212975aad2a98.png	0.540000000000000036	819
817	2016-05-04 09:11:38.719381+00	2016-05-04 09:11:38.839539+00	./61bc914c7defa5f7d53c8100202387f00d666e79d2c5e72ec346e833.png	0.501000000000000001	820
818	2016-05-04 09:17:37.733046+00	2016-05-04 09:17:37.844236+00	./ab4fb3435c1f392718c73a0efa32edee25d0769c5cd5d343331d481f.png	0	821
819	2016-05-04 09:17:48.898344+00	2016-05-04 09:17:49.03026+00	./7fb8c1c930dc7f44769981ae90b2028fb55400cea9b337dcc019238a.png	0.481999999999999984	822
820	2016-05-04 09:18:05.210069+00	2016-05-04 09:18:05.295941+00	./c1499435dacfb186674616fdc883db74466d9180743b8e5702d1f6f1.png	0.48899999999999999	823
821	2016-05-04 09:18:07.830855+00	2016-05-04 09:18:07.928235+00	./30003c202d86024b02ab866864f27243fa29bbc7d4b4d84cdff7de6f.png	0.532000000000000028	824
822	2016-05-04 09:18:10.475952+00	2016-05-04 09:18:10.567145+00	./c9b17255f728ecb166c9e4f3aa152322534bf53fabb2c5619d4eeeb2.png	0.492999999999999994	825
823	2016-05-04 09:18:13.03721+00	2016-05-04 09:18:13.154633+00	./c11d24d2cb95b879513bea37a29d62e32bca342acfd4831f98722235.png	0.435999999999999999	826
824	2016-05-04 09:18:15.56461+00	2016-05-04 09:18:15.652392+00	./793e36bafdffffcd799ee45061b6383ee5c341f03ca5973ab91c392b.png	0.401000000000000023	827
825	2016-05-04 09:37:35.081781+00	2016-05-04 09:37:35.210233+00	./e7a92f8a2114da542ec6229a112672b1a5fafeb4f956ecd5e4412a14.png	1.04400000000000004	361
826	2016-05-04 09:37:45.534597+00	2016-05-04 09:37:45.676839+00	./758b34cb0108311bf80da1b98aa8e436cfd47c3a2e4dcb3386f02bb0.png	0.371999999999999997	829
827	2016-05-04 09:38:09.043753+00	2016-05-04 09:38:09.127774+00	./b10a3c41322a514d1ab1c6a356407095cbc82ff7ae8a7e51a6b0f776.png	0.53400000000000003	830
828	2016-05-04 09:38:11.340294+00	2016-05-04 09:38:11.459404+00	./ecf412d3db0f9fd4b4999fc72fcb34da0faf7d8968168f7c751d850e.png	0.47799999999999998	831
829	2016-05-04 09:38:13.626993+00	2016-05-04 09:38:13.737209+00	./5119bef23c0d47d6376571b360cfb03ba6ad416db6bb47a7a04eaadb.png	0.423999999999999988	832
830	2016-05-04 09:38:15.88895+00	2016-05-04 09:38:15.995263+00	./29898aba7484b2d3c4ab37d749ecbfcd40515d7c06d10c5e3ad4dada.png	0.533000000000000029	833
831	2016-05-04 09:38:18.361579+00	2016-05-04 09:38:18.468797+00	./0c1fc45ebc502188ce2ec63fa76db2604e4542d0d22f9f9805701b77.png	0.565999999999999948	834
832	2016-05-04 09:38:20.612706+00	2016-05-04 09:38:20.693855+00	./412eec5c7cae18845c23c896c761683dd0ed9fb82c865901f8df3e5f.png	0.429999999999999993	835
833	2016-05-04 09:38:22.944909+00	2016-05-04 09:38:23.03938+00	./51f8a12b84492f0fde8204713a378a2f8ab26a3da3083245fe1d91c0.png	0.530000000000000027	836
834	2016-05-04 09:38:25.237674+00	2016-05-04 09:38:25.358603+00	./913144d9161c48b71c0a530afbe8a14ab7de513bb741759ea977e307.png	0.552000000000000046	837
835	2016-05-04 09:38:27.520855+00	2016-05-04 09:38:27.62614+00	./fd14b226529b74eaa4b86daec2378d500057ddbfc73a0d526e5a5026.png	0.521000000000000019	838
836	2016-05-04 09:38:29.816697+00	2016-05-04 09:38:29.898594+00	./6be769278b2071200a96a0732f4bf20a0e99d2ae8406b6ab24bde163.png	0.495999999999999996	839
837	2016-05-04 09:38:32.156276+00	2016-05-04 09:38:32.278457+00	./9973f27e17a2f01086899797493e004e7c4dbccf0207c67d62b91e08.png	0.531000000000000028	840
838	2016-05-04 09:38:34.467998+00	2016-05-04 09:38:34.554287+00	./7153c23d976f712c58ebb535b08d8a0145923c738aa1c1c402d2c238.png	0.592999999999999972	841
839	2016-05-04 09:38:36.790617+00	2016-05-04 09:38:36.905113+00	./92500c54766a7d67ceb81b3cc12c8fa39ed902bf856df3e22b9d2420.png	0.59099999999999997	842
840	2016-05-04 09:38:39.053728+00	2016-05-04 09:38:39.141517+00	./1c8b58d06c419e5524e0642805c20ef5fadf82e5f91475fe78933e17.png	0.576999999999999957	843
841	2016-05-04 09:38:41.442063+00	2016-05-04 09:38:41.553809+00	./e293258870bc617f1a34a0d443fa2e8932284ce4ae39cdab74a4c401.png	0.530000000000000027	844
859	2016-05-09 08:48:05.946646+00	2016-05-09 08:48:06.043225+00	./3a51408c6c6747452619ad9d1d7618e4528cd7abbf1c81d7f9c9f081.png	0	361
860	2016-05-09 08:49:10.337318+00	2016-05-09 08:49:10.444272+00	./945a9dfdcf584908e57e0744eee9c9d2ebf5e0930266e2b884b347f4.png	0	855
847	2016-05-04 09:54:15.344648+00	2016-05-04 09:54:15.473156+00	./60d94de1530d5fde9280392e862370148e48adb3f77cc5237ecd518e.png	3.02400000000000002	849
848	2016-05-04 09:54:26.372647+00	2016-05-04 09:54:26.465495+00	./e52fa2b786053489226b822d5add147c7baee4b56a2fb4c83bbc0672.png	0.323000000000000009	850
849	2016-05-04 09:54:50.384453+00	2016-05-04 09:54:50.47609+00	./1a326ff3db613e91565e3b85835d654ad16a01fa9d53f7e6cb21ad0c.png	0.284999999999999976	851
850	2016-05-04 09:54:55.678068+00	2016-05-04 09:54:55.794626+00	./6b7a521a28bfc90e4fd4dfe757ca2bc704ab27685d8be07ad93309e7.png	5.28300000000000036	851
851	2016-05-04 09:55:42.824312+00	2016-05-04 09:55:42.917594+00	./0d40a2349c93b1ab305acbbad2134268b20d087b409343d160689273.png	0	852
852	2016-05-04 09:55:56.166046+00	2016-05-04 09:55:56.295336+00	./2fb6f84f6c1b58a2e3a31363ed87c60a84205db1ee7d212f69496a7e.png	13.7690000000000001	852
853	2016-05-04 09:56:07.39854+00	2016-05-04 09:56:07.54145+00	./934a6d6c2242a166c4b941e4aa2c13f08afaed15e5a6e42afee0b47e.png	4.00499999999999989	851
854	2016-05-04 09:56:22.624046+00	2016-05-04 09:56:22.730235+00	./cf4edadd9de5d689e1a05d0e485701e416a8c33ead3bcf3722d5f7b9.png	9.02999999999999936	850
855	2016-05-04 09:59:21.557804+00	2016-05-04 09:59:21.644515+00	./102df4f54ccb76e5b14683737c2f64a5143eb4347bd8a11022f4c5f6.png	0	853
856	2016-05-09 03:10:22.527485+00	2016-05-09 03:10:22.695721+00	./f07bce3efeea2ca343b65d326147a45d8ee136e26ba88bc46c573cbd.png	0	854
857	2016-05-09 08:43:45.453278+00	2016-05-09 08:43:45.55151+00	./346a5556b71756dc8720b5ba237b19160dca2222dd58b85e6214b237.png	0	361
858	2016-05-09 08:43:51.495696+00	2016-05-09 08:43:51.593081+00	./ecd2ccab7c5695a6a4096bef5a4e535992a2a3f6c14a744ab4ec6d17.png	0	361
861	2016-05-09 08:52:38.340722+00	2016-05-09 08:52:38.432925+00	./a251aad759585019018a88508b4ea8270b1fed261aca6a411b30d897.png	0	856
868	2016-05-10 09:08:53.400606+00	2016-05-10 09:08:53.490882+00	./63c7ba8815fedce8b76467e57f85a5bd0c95fdc27b10f566aa6d5306.png	0	861
869	2016-05-10 21:37:10.590854+00	2016-05-10 21:37:10.699339+00	./954254229b11b50bfc0eddd3175b3379b5bffa1daec1d43c7d94ac35.png	2.00099999999999989	862
865	2016-05-09 13:47:43.146894+00	2016-05-09 13:47:43.359023+00	./af8b9eccd3b9973e8f0b9b4def0cfa8d72aca63b19308538513e7269.png	0	361
866	2016-05-10 04:47:29.317468+00	2016-05-10 04:47:29.557961+00	./a27076008997e07c8c69a9240d36c6ac1332a54957907f4c50a4adf3.png	3.00099999999999989	124
867	2016-05-10 09:08:06.74871+00	2016-05-10 09:08:06.832777+00	./75488100b7d4fcf3751c039e4265a12ea798e4dc2e6b93c9e38591ac.png	0	860
870	2016-05-10 21:37:33.739109+00	2016-05-10 21:37:33.846413+00	./5a59a1bde6a00a52ae8551e77a90f74a09197bc528fd70b1e8290f0e.png	2	863
871	2016-05-10 21:37:45.682494+00	2016-05-10 21:37:45.78303+00	./119040c91468d73baf1f0fccea9362d7aadd02b0c6cf0e0558de6920.png	2.26600000000000001	864
872	2016-05-10 21:38:07.133145+00	2016-05-10 21:38:07.248293+00	./d9bac65438583a1539cee469bdc1e6b8b8f14d62c3ad3ea70bcc61ec.png	2.00099999999999989	865
873	2016-05-10 21:38:10.894228+00	2016-05-10 21:38:11.006634+00	./08bfb925cab5414a9a84e96e65c10625ef19459d98b4eacddcb434d4.png	1.27099999999999991	866
874	2016-05-10 21:38:14.593343+00	2016-05-10 21:38:14.695266+00	./e531ea6d44cad4c21ee948f10ffb26217da5ed931dfaaaff6e377e34.png	1.49500000000000011	867
875	2016-05-10 21:38:18.381454+00	2016-05-10 21:38:18.509066+00	./3be86211b1446819707c6212c23943b14778cfa785b5687ea16dd104.png	1.50499999999999989	868
876	2016-05-10 21:38:22.044642+00	2016-05-10 21:38:22.156366+00	./b1e16e23c3f2e652887e3bd76e471d22644a0f258e09e527cbeab4d6.png	1.65399999999999991	869
877	2016-05-10 21:38:25.863745+00	2016-05-10 21:38:25.996352+00	./dca41cf57b8ce7e1d582799be924eda6678d847f9d10eca7b9ce3aaf.png	1.57499999999999996	870
878	2016-05-10 21:38:29.555373+00	2016-05-10 21:38:29.681907+00	./fe3b874a13cdde0c904d192f78a8a04d82353f16727c719f1c77a6f5.png	1.5	871
879	2016-05-10 21:38:33.456228+00	2016-05-10 21:38:33.571135+00	./1fd8897e7f9cad23d25e64b43c33fdecabfddfdf2e8d1829f770c83d.png	1.84499999999999997	872
880	2016-05-10 21:38:37.132014+00	2016-05-10 21:38:37.296943+00	./d3473d4fca3ac0f7c8eb6d4a5ac7f0f06320670c585db1baa8ccc6f6.png	1.60200000000000009	873
881	2016-05-10 21:38:40.71444+00	2016-05-10 21:38:40.833139+00	./968e78028d66dadb9e29296f5c20381f44548045faa33de143d33863.png	1.4910000000000001	874
882	2016-05-10 21:39:42.142735+00	2016-05-10 21:39:42.274837+00	./d4b1508540c66ddce13b515360db249b16da8e2759c1567eda0e9791.png	2.01900000000000013	875
883	2016-05-10 21:39:46.715876+00	2016-05-10 21:39:46.823364+00	./f7f08af3c8c6cfd2f28f6c4d609be5b9a11e3c3173dcb689a7790e1e.png	2.35700000000000021	876
884	2016-05-10 21:39:51.404558+00	2016-05-10 21:39:51.563992+00	./243e9d6a2ff0867f547fb1b0bfbacb571ab3d09d319a6bf461160fd0.png	2.43599999999999994	877
885	2016-05-10 21:39:55.865569+00	2016-05-10 21:39:55.964696+00	./411d547fb64fdc2d44faa289d7a10c2074e8f604e9e09b9a70d2e160.png	2.32200000000000006	878
886	2016-05-10 21:40:00.579536+00	2016-05-10 21:40:00.733952+00	./0baae02400a364f4ddde3d781de75fb8435cef90fc2d3fba979cef8e.png	2.62699999999999978	879
887	2016-05-10 21:40:05.211949+00	2016-05-10 21:40:05.324226+00	./a69c7bad5dc8688baa6c91c4ce0f1b1b565ad0e324202ccd1d9cd348.png	2.58800000000000008	880
888	2016-05-10 21:40:10.173309+00	2016-05-10 21:40:10.279935+00	./a571c01ba6f416ad562bfd98830a8b421f6c064e810a2a7dc1b9e38c.png	2.63899999999999979	881
889	2016-05-10 21:40:15.123281+00	2016-05-10 21:40:15.257622+00	./05a196d47c155ad8f534dec40058a2a7be34078fe030aafc5c280e46.png	2.64299999999999979	882
890	2016-05-10 21:40:19.870819+00	2016-05-10 21:40:19.971007+00	./87a24b92e3b84d438edf264288cc894bca36526cdd64ed598dfc70be.png	2.59799999999999986	883
891	2016-05-10 21:40:24.743371+00	2016-05-10 21:40:24.868179+00	./20180cadc36265e51140ee2ed0f1cff77b8debf29438bcf8ced2b6b2.png	2.84600000000000009	884
892	2016-05-10 21:40:29.364316+00	2016-05-10 21:40:29.472031+00	./0f97112ea296973fc7f0041ddf105956572a0d318fe65da2096b0bc6.png	2.52300000000000013	885
893	2016-05-15 02:57:52.256228+00	2016-05-15 02:57:52.349717+00	./dd98523356c46951a7f32266f777dd4c9192df1f6a96a0ec8809436f.png	0	886
894	2016-05-15 02:57:54.008847+00	2016-05-15 02:57:54.08035+00	./b9db2636262411675d8627ffa6be2ad4abf2ab8d1687142d2577074b.png	0	887
895	2016-05-15 02:57:55.753464+00	2016-05-15 02:57:55.82575+00	./77808934926af7f6caa52b699b4ea5ddd9731cd76ada54680be859b9.png	0	888
896	2016-05-15 02:57:57.525517+00	2016-05-15 02:57:57.590179+00	./282f15dd65e3e4d8bc6b19bb1c07dff99b756b58410cbc8a50357745.png	0	889
897	2016-05-15 02:57:59.344357+00	2016-05-15 02:57:59.415127+00	./4de57254d7d10f6bad3411a857bbb88ac6272d21792525491859f479.png	0	890
898	2016-05-15 02:58:01.027898+00	2016-05-15 02:58:01.096264+00	./7b422b21a7ec7f478099241c0122cd9208ffcb5586202c9e6ee2e997.png	0	891
899	2016-05-15 02:58:02.797061+00	2016-05-15 02:58:02.867232+00	./abc9533c678b95f45b2b6c6a97ce4a9ac941902d6becaad3c99c6ce8.png	0	892
900	2016-05-15 02:58:04.488992+00	2016-05-15 02:58:04.556424+00	./b729732d11f87b9d66fd43eb7a7fee9a843322569218c8e4fd77593e.png	0	893
901	2016-05-15 02:58:06.234219+00	2016-05-15 02:58:06.30394+00	./7fb637db4021969143db79e137c774a64105958c2284a8d0b97c2bc3.png	0.0280000000000000006	894
902	2016-05-15 02:58:07.936058+00	2016-05-15 02:58:08.004137+00	./48b68454b18e95c99a9a391610c1ab4ffac1f882d3968a43cff2a807.png	0.0779999999999999999	895
903	2016-05-15 02:58:11.381815+00	2016-05-15 02:58:11.447883+00	./e81b37a944d44737ff08f79649b34dc3155f19803881df5e17b1ab52.png	0.0919999999999999984	896
904	2016-05-15 02:58:13.108445+00	2016-05-15 02:58:13.17392+00	./e2e3b3407bf6b419e6967063f5a803b2d8e8cecab795aed80193097b.png	0	897
905	2016-05-15 02:58:14.880086+00	2016-05-15 02:58:14.947292+00	./0fccf82973d462f69e942357961aa9ec372b376236d820d0ff640c9d.png	0	898
906	2016-05-15 02:58:16.603118+00	2016-05-15 02:58:16.6701+00	./b2e3ff471ab2a0286677d081198e0abab5c703e30571cb878655717f.png	0	899
907	2016-05-15 02:58:18.319391+00	2016-05-15 02:58:18.384862+00	./882612d923b326047c052e7031f569453f8c18d10ea2610011661428.png	0	900
908	2016-05-15 02:58:20.049837+00	2016-05-15 02:58:20.115705+00	./3cdca27c5600d00c0845b96dfa81717462e6b5d2b5f279e37d5a403e.png	0.0170000000000000012	901
909	2016-05-15 02:58:21.762083+00	2016-05-15 02:58:21.825537+00	./4201ced1b129ed4bf406397368750e9500b543853e3cdcd19ef40ff4.png	0.0050000000000000001	902
910	2016-05-15 02:58:23.478562+00	2016-05-15 02:58:23.552942+00	./7a83cd037aaf057cf9ee045124eb330e9d74101d30d61032648c4e43.png	0.0179999999999999986	903
911	2016-05-15 02:58:25.227159+00	2016-05-15 02:58:25.294478+00	./5f8ce6fb0681be719aef02a7565c52ea2a7a17036e3d5d4b2a3cfdb5.png	0.0459999999999999992	904
912	2016-05-15 02:58:26.957164+00	2016-05-15 02:58:27.02306+00	./bda09ef9a915332c11c433fb92f0b6fafa9254b4474cc382d2018fa2.png	0.0519999999999999976	905
913	2016-05-18 07:05:07.422183+00	2016-05-18 07:05:07.52269+00	./7ea469fdb3fff86da1e416c33fd93d8f513720ae0f9d47289fdc92c7.png	0	906
917	2016-05-18 07:44:45.812368+00	2016-05-18 07:44:45.869386+00	./a77ed747ec44302203bde7ed4e1cba7c02af466ecb8d8496227195c5.png	0	910
918	2016-05-18 07:44:52.707437+00	2016-05-18 07:44:52.781858+00	./04cc57549de75fc2e4cdc1d0ea5a7a2a6570d2437fe866192b84e2a0.png	6.51799999999999979	910
919	2016-05-28 05:14:58.61932+00	2016-05-28 05:14:58.712029+00	./0c55012f93d352c5481e7dd3edb57370ddf9f34a5e2155ba122a8189.png	0	912
920	2016-05-28 05:15:31.757141+00	2016-05-28 05:15:31.823166+00	./fb5c43990d64787618444d04057943c7ce551745877f0841b84f2d3a.png	0	913
921	2016-05-28 05:16:50.933977+00	2016-05-28 05:16:51.004501+00	./1cd1ffebd9cfb27399f4b0fc299695daf343065632fda06170fddce9.png	5	913
922	2016-05-28 05:48:22.586717+00	2016-05-28 05:48:22.6506+00	./62ce20b5358f23c1018b37912215a2d30384c35744a6705d900c9b70.png	0	914
923	2016-05-28 05:49:38.227981+00	2016-05-28 05:49:38.309516+00	./1d1195eaf0c95504700dba68aa09d561e576aad2e29b4623e31c3271.png	74.0030000000000001	914
924	2016-05-28 05:51:40.211783+00	2016-05-28 05:51:40.270548+00	./8901793a17085a5f7caaffe496cfa00e8f1822cef4f8dccc22d81830.png	0	915
925	2016-05-28 05:52:06.917778+00	2016-05-28 05:52:06.992898+00	./c301541148f759aaa6df68bde7498c6f2290dcbc667da9c7ecea482b.png	26.0010000000000012	915
926	2016-05-28 05:52:13.454901+00	2016-05-28 05:52:13.523891+00	./74875c7fe5daa1ea2ffe4804ee8d220a9d149a1f0fe113c0f2d03af3.png	33.0009999999999977	915
\.


--
-- Name: game_gameinstancesnapshot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_gameinstancesnapshot_id_seq', 926, true);


--
-- Data for Name: game_jslibrary; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_jslibrary (id, name, "scriptPath") FROM stdin;
1	three.js	/static/site/js/lib/three.js
\.


--
-- Name: game_jslibrary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_jslibrary_id_seq', 1, true);


--
-- Name: game_plerpingapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_plerpingapp_id_seq', 41, true);


--
-- Data for Name: game_savedfunction; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_savedfunction (id, created, updated, title, language, source, owner_id) FROM stdin;
5	2016-03-23 11:04:06.523218+00	2016-03-23 11:04:06.523246+00	CartesianProduct	javascript	function CartesianProduct(A,B) {\r\n    prod = [];\r\n    _.each(A, function(a) {\r\n        _.each(B, function(b) {\r\n            prod.push([a,b]);\r\n        });\r\n    });\r\n    return prod;\r\n}	1
6	2016-03-23 11:06:45.642188+00	2016-03-23 11:06:45.642216+00	drawAxes	javascript	function drawAxes() {\r\n\r\nDARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\r\nLIGHT_GREY = new Color(0.9, 0.9, 0.9, 0.2);\r\n\r\nview.viewSize = new Size(Canvas.width, Canvas.height);\r\n\r\nx_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\nx_axis.add(new Point(-view.size.width/2, 0));\r\nx_axis.add(new Point(view.size.width/2, 0));\r\n//x_axis.closed = true;\r\n//project.activeLayer.insertChild(0,x_axis)\r\n\r\ny_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\r\ny_axis.add(new Point(0, -view.size.height/2));\r\ny_axis.add(new Point(0, view.size.height/2));\r\n\r\nx_lines = [];\r\n_.each(_.range(-10,10), function(n) {\r\n    line = new Path({strokeColor: LIGHT_GREY });\r\n    line.add( new Point(n, view.size.height/2) );\r\n    line.add( new Point(n, -view.size.height/2) );\r\n    //line.closed = true;\r\n    //project.activeLayer.insertChild(0, line);\r\n    x_lines.push( line );\r\n});\r\n\r\ny_lines = [];\r\n_.each(_.range(-10,10), function(n) {\r\n    line = new Path({strokeColor: LIGHT_GREY });\r\n    line.add( new Point(view.size.width/2, n) );\r\n    line.add( new Point(-view.size.width/2, n) );\r\n    //line.closed = true;\r\n    //project.activeLayer.insertChild(0, line);\r\n    y_lines.push( line );\r\n});\r\n\r\nfunction transformToCartesian(lay) {\r\n    lay.transform( new Matrix((view.size.width / 10),0,0,(view.size.height / -10), view.center.x, view.center.y) );\r\n}\r\n\r\ntransformToCartesian(project.activeLayer);\r\n\r\n}	1
\.


--
-- Name: game_savedfunction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_savedfunction_id_seq', 6, true);


--
-- Data for Name: game_seedvectorparam; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_seedvectorparam (id, key, val, int_val, valtype, jsonval, ordering, instance_id, app_id) FROM stdin;
36446	DEGREE2_COEFF	18	18	number	{"type": "number", "value": 18, "parsing": false}	4	675	28
36420	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	99	28
36421	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	99	28
36422	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	99	28
36423	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15, "parsing": false}	3	99	28
36424	DEGREE2_COEFF	45	45	number	{"type": "number", "value": "45", "parsing": false}	4	99	28
36425	CHILDREN	[4,5,6,7,-8,-9]	\N	javascript	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	99	28
36426	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	6	99	28
36427	integer_group	13	13	number	{"type": "number", "value": 13, "parsing": false}	0	366	36
36428	NUM_ITERATIONS	5	5	number	{"type": "number", "value": "5", "parsing": false}	0	140	28
36429	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	140	28
36430	COLOR2	#a024cc	10495180	color	{"type": "color", "value": "#a024cc", "parsing": false}	2	140	28
36431	TRAPEZOIDAL_SECTIONS	10	10	number	{"type": "number", "value": "10", "parsing": false}	3	140	28
36432	DEGREE2_COEFF	45	45	number	{"type": "number", "value": "45", "parsing": false}	4	140	28
36433	CHILDREN	[4,5,6,-5,-7]	\N	javascript	{"type": "javascript", "value": "[4,5,6,-5,-7]", "parsing": false}	5	140	28
36434	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	6	140	28
36435	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	688	28
36436	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	688	28
36437	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	688	28
36438	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	688	28
36439	DEGREE2_COEFF	31	31	number	{"type": "number", "value": 31, "parsing": false}	4	688	28
36440	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	688	28
36441	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	688	28
36442	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	675	28
36443	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	675	28
36444	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	675	28
36445	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	675	28
36447	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	675	28
36448	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	675	28
36449	integer_group	223	223	number	{"type": "number", "value": 223, "parsing": false}	0	576	36
36450	solutionPathColor	#e6228c	15082124	color	{"type": "color", "value": "#e6228c", "parsing": false}	0	108	24
36451	cellSize	10	10	number	{"type": "number", "value": "10", "parsing": false}	1	108	24
36452	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	113	24
36453	cellSize	40	40	number	{"type": "number", "value": "40", "parsing": false}	1	113	24
36454	integer_group	53	53	number	{"type": "number", "value": 53, "parsing": false}	0	406	36
36455	integer_group	29	29	number	{"type": "number", "value": 29, "parsing": false}	0	382	36
36456	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	701	28
36457	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	701	28
36458	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	701	28
36459	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	701	28
36460	DEGREE2_COEFF	44	44	number	{"type": "number", "value": 44, "parsing": false}	4	701	28
36461	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	701	28
36462	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	701	28
36463	color	#202c33	2108467	color	{"type": "color", "value": "#202c33", "parsing": false}	0	176	25
36464	width	400	400	number	{"type": "number", "value": 400, "parsing": false}	1	176	25
36465	height	200	200	number	{"type": "number", "value": "200", "parsing": false}	2	176	25
36466	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	146	28
36467	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	146	28
36468	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	146	28
36469	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	3	146	28
36470	DEGREE2_COEFF	45	45	number	{"type": "number", "value": "45", "parsing": false}	4	146	28
36471	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	146	28
36472	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	146	28
36473	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	255	28
36474	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	255	28
36475	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	255	28
36733	integer_group	221	221	number	{"type": "number", "value": 221, "parsing": false}	0	574	36
36734	integer_group	222	222	number	{"type": "number", "value": 222, "parsing": false}	0	575	36
36735	integer_group	224	224	number	{"type": "number", "value": 224, "parsing": false}	0	577	36
36736	integer_group	225	225	number	{"type": "number", "value": 225, "parsing": false}	0	578	36
36737	integer_group	226	226	number	{"type": "number", "value": 226, "parsing": false}	0	579	36
36738	integer_group	227	227	number	{"type": "number", "value": 227, "parsing": false}	0	580	36
36739	integer_group	228	228	number	{"type": "number", "value": 228, "parsing": false}	0	581	36
36740	integer_group	229	229	number	{"type": "number", "value": 229, "parsing": false}	0	582	36
36741	integer_group	230	230	number	{"type": "number", "value": 230, "parsing": false}	0	583	36
36742	integer_group	285	285	number	{"type": "number", "value": 285, "parsing": false}	0	638	36
36743	integer_group	280	280	number	{"type": "number", "value": 280, "parsing": false}	0	633	36
36744	integer_group	277	277	number	{"type": "number", "value": 277, "parsing": false}	0	630	36
36745	integer_group	282	282	number	{"type": "number", "value": 282, "parsing": false}	0	635	36
36746	integer_group	279	279	number	{"type": "number", "value": 279, "parsing": false}	0	632	36
36747	integer_group	234	234	number	{"type": "number", "value": 234, "parsing": false}	0	587	36
36748	integer_group	236	236	number	{"type": "number", "value": 236, "parsing": false}	0	589	36
36749	integer_group	237	237	number	{"type": "number", "value": 237, "parsing": false}	0	590	36
36750	integer_group	238	238	number	{"type": "number", "value": 238, "parsing": false}	0	591	36
36751	integer_group	206	206	number	{"type": "number", "value": 206, "parsing": false}	0	559	36
36752	integer_group	240	240	number	{"type": "number", "value": 240, "parsing": false}	0	593	36
36753	integer_group	241	241	number	{"type": "number", "value": 241, "parsing": false}	0	594	36
36754	integer_group	310	310	number	{"type": "number", "value": 310, "parsing": false}	0	663	36
36755	integer_group	311	311	number	{"type": "number", "value": 311, "parsing": false}	0	664	36
36756	integer_group	267	267	number	{"type": "number", "value": 267, "parsing": false}	0	620	36
36757	integer_group	272	272	number	{"type": "number", "value": 272, "parsing": false}	0	625	36
36758	integer_group	269	269	number	{"type": "number", "value": 269, "parsing": false}	0	622	36
36759	integer_group	273	273	number	{"type": "number", "value": 273, "parsing": false}	0	626	36
36760	integer_group	275	275	number	{"type": "number", "value": 275, "parsing": false}	0	628	36
36761	integer_group	271	271	number	{"type": "number", "value": 271, "parsing": false}	0	624	36
36762	integer_group	274	274	number	{"type": "number", "value": 274, "parsing": false}	0	627	36
36763	integer_group	266	266	number	{"type": "number", "value": 266, "parsing": false}	0	619	36
36764	integer_group	276	276	number	{"type": "number", "value": 276, "parsing": false}	0	629	36
36765	integer_group	278	278	number	{"type": "number", "value": 278, "parsing": false}	0	631	36
36766	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	678	28
36767	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	678	28
36768	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	678	28
36769	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	678	28
36770	DEGREE2_COEFF	21	21	number	{"type": "number", "value": 21, "parsing": false}	4	678	28
36771	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	678	28
36772	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	678	28
36773	integer_group	289	289	number	{"type": "number", "value": 289, "parsing": false}	0	642	36
36774	integer_group	283	283	number	{"type": "number", "value": 283, "parsing": false}	0	636	36
36775	integer_group	284	284	number	{"type": "number", "value": 284, "parsing": false}	0	637	36
36776	integer_group	290	290	number	{"type": "number", "value": 290, "parsing": false}	0	643	36
36777	integer_group	298	298	number	{"type": "number", "value": 298, "parsing": false}	0	651	36
36778	integer_group	286	286	number	{"type": "number", "value": 286, "parsing": false}	0	639	36
36779	integer_group	299	299	number	{"type": "number", "value": 299, "parsing": false}	0	652	36
36780	integer_group	291	291	number	{"type": "number", "value": 291, "parsing": false}	0	644	36
36781	integer_group	292	292	number	{"type": "number", "value": 292, "parsing": false}	0	645	36
36782	integer_group	293	293	number	{"type": "number", "value": 293, "parsing": false}	0	646	36
36783	integer_group	287	287	number	{"type": "number", "value": 287, "parsing": false}	0	640	36
36784	integer_group	294	294	number	{"type": "number", "value": 294, "parsing": false}	0	647	36
36785	integer_group	295	295	number	{"type": "number", "value": 295, "parsing": false}	0	648	36
36786	integer_group	296	296	number	{"type": "number", "value": 296, "parsing": false}	0	649	36
36787	integer_group	301	301	number	{"type": "number", "value": 301, "parsing": false}	0	654	36
36788	integer_group	297	297	number	{"type": "number", "value": 297, "parsing": false}	0	650	36
36789	integer_group	303	303	number	{"type": "number", "value": 303, "parsing": false}	0	656	36
36790	integer_group	288	288	number	{"type": "number", "value": 288, "parsing": false}	0	641	36
36791	integer_group	305	305	number	{"type": "number", "value": 305, "parsing": false}	0	658	36
36792	integer_group	307	307	number	{"type": "number", "value": 307, "parsing": false}	0	660	36
36330	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	668	28
36331	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	668	28
36332	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	668	28
36333	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	668	28
36334	DEGREE2_COEFF	11	11	number	{"type": "number", "value": 11, "parsing": false}	4	668	28
36335	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	668	28
38059	x	0	0	number	{"type": "number", "value": 0}	16	863	33
36336	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	668	28
36337	integer_group	23	23	number	{"type": "number", "value": 23, "parsing": false}	0	376	36
36338	color	#cccc00	13421568	color	{"type": "color", "value": "#cccc00"}	0	35	25
36339	width	400	400	number	{"type": "number", "value": 400}	1	35	25
36340	height	200	200	number	{"type": "number", "value": 200}	2	35	25
36341	xMin	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	54	5
36342	funct	1/(x^2 - 3x^3)	\N	math	{"latex": "\\\\frac{1}{- 3 x^{3} + x^{2}}", "string": "1/(x^2 - 3x^3)", "javascript": "1/(-3*Math.pow(x, 3) + Math.pow(x, 2))", "value": "1/(x^2 - 3x^3)", "parsing": false, "type": "math"}	1	54	5
36343	xMax	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	54	5
36344	breathDelta	25	25	number	{"type": "number", "value": "25", "parsing": false}	3	54	5
36345	solutionPathColor	#6727f0	6760432	color	{"type": "color", "value": "#6727f0", "parsing": false}	0	48	24
36346	cellSize	45	45	number	{"type": "number", "value": "45", "parsing": false}	1	48	24
36347	xMin	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	53	5
36348	breathDelta	17	17	number	{"type": "number", "value": 17, "parsing": false}	1	53	5
36349	xMax	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	53	5
36350	funct	(x^7 - 2x^6)*(1/x)	\N	math	{"latex": "\\\\frac{1}{x} \\\\left(x^{7} - 2 x^{6}\\\\right)", "string": "(x^7 - 2x^6)*(1/x)", "javascript": "(Math.pow(x, 7) - 2*Math.pow(x, 6))/x", "value": "(x^7 - 2x^6)*(1/x)", "parsing": false, "type": "math"}	3	53	5
36351	x_min	-5	-5	number	{"type": "number", "value": -5}	0	63	27
36352	func1	x cos(x)	\N	math	{"latex": "x \\\\cos{\\\\left (x \\\\right )}", "javascript": "x*Math.cos(x)", "type": "math", "string": "x cos(x)", "value": "x cos(x)"}	1	63	27
36353	x_max	5	5	number	{"type": "number", "value": 5}	2	63	27
36354	integer_group	18	18	number	{"type": "number", "value": 18, "parsing": false}	0	371	36
36355	x_min	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	66	27
36356	func1	x cos(x) + (1/5) cos(10x)	\N	math	{"latex": "x \\\\cos{\\\\left (x \\\\right )} + \\\\frac{1}{5} \\\\cos{\\\\left (10 x \\\\right )}", "string": "x cos(x) + (1/5) cos(10x)", "javascript": "x*Math.cos(x) + Math.cos(10*x)/5", "value": "x cos(x) + (1/5) cos(10x)", "parsing": false, "type": "math"}	1	66	27
36357	x_max	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	66	27
36358	integer_group	141	141	number	{"type": "number", "value": 141, "parsing": false}	0	494	36
36359	integer_group	103	103	number	{"type": "number", "value": 103, "parsing": false}	0	456	36
36360	x_min	-10	-10	number	{"type": "number", "value": "-10", "parsing": false}	0	75	27
36361	func1	(1/x^3) cos(2x) + (1/2x)	\N	math	{"latex": "\\\\frac{x}{2} + \\\\frac{1}{x^{3}} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x^3) cos(2x) + (1/2x)", "javascript": "x/2 + Math.cos(2*x)/Math.pow(x, 3)", "value": "(1/x^3) cos(2x) + (1/2x)", "parsing": false, "type": "math"}	1	75	27
36362	x_max	10	10	number	{"type": "number", "value": "10", "parsing": false}	2	75	27
36363	color	#3fa38b	4170635	color	{"type": "color", "value": "#3fa38b", "parsing": false}	0	52	25
36364	width	600	600	number	{"type": "number", "value": "600", "parsing": false}	1	52	25
36365	height	300	300	number	{"type": "number", "value": "300", "parsing": false}	2	52	25
36366	color	#41a33f	4301631	color	{"type": "color", "value": "#41a33f", "parsing": false}	0	51	25
36367	width	600	600	number	{"type": "number", "value": "600", "parsing": false}	1	51	25
36368	height	400	400	number	{"type": "number", "value": "400", "parsing": false}	2	51	25
36369	integer_group	12	12	number	{"type": "number", "value": 12, "parsing": false}	0	365	36
36370	color	#202c33	2108467	color	{"type": "color", "value": "#202c33", "parsing": false}	0	74	25
36371	width	400	400	number	{"type": "number", "value": 400, "parsing": false}	1	74	25
36372	height	200	200	number	{"type": "number", "value": 200, "parsing": false}	2	74	25
36373	color	#375fc7	3628999	color	{"type": "color", "value": "#375fc7", "parsing": false}	0	49	25
36374	width	200	200	number	{"type": "number", "value": "200", "parsing": false}	1	49	25
36375	height	500	500	number	{"type": "number", "value": "500", "parsing": false}	2	49	25
36376	x_min	-10	-10	number	{"type": "number", "value": "-10", "parsing": false}	0	65	27
36377	func1	(1/x) cos(2x) + (1/2x) cos(16x)	\N	math	{"latex": "\\\\frac{x}{2} \\\\cos{\\\\left (16 x \\\\right )} + \\\\frac{1}{x} \\\\cos{\\\\left (2 x \\\\right )}", "string": "(1/x) cos(2x) + (1/2x) cos(16x)", "javascript": "x*Math.cos(16*x)/2 + Math.cos(2*x)/x", "value": "(1/x) cos(2x) + (1/2x) cos(16x)", "parsing": false, "type": "math"}	1	65	27
36378	x_max	10	10	number	{"type": "number", "value": "10", "parsing": false}	2	65	27
36379	integer_group	109	109	number	{"type": "number", "value": 109, "parsing": false}	0	462	36
36380	solutionPathColor	#cc0055	13369429	color	{"type": "color", "value": "#cc0055"}	0	38	24
36793	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	680	28
36794	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	680	28
36795	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	680	28
36796	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	680	28
36797	DEGREE2_COEFF	23	23	number	{"type": "number", "value": 23, "parsing": false}	4	680	28
36798	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	680	28
36799	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	680	28
36800	integer_group	270	270	number	{"type": "number", "value": 270, "parsing": false}	0	623	36
36801	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	679	28
36802	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	679	28
36803	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	679	28
36804	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	679	28
36805	DEGREE2_COEFF	22	22	number	{"type": "number", "value": 22, "parsing": false}	4	679	28
36806	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	679	28
36807	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	679	28
36808	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	681	28
36809	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	681	28
36810	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	681	28
36811	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	681	28
36812	DEGREE2_COEFF	24	24	number	{"type": "number", "value": 24, "parsing": false}	4	681	28
36813	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	681	28
36814	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	681	28
36815	integer_group	281	281	number	{"type": "number", "value": 281, "parsing": false}	0	634	36
36816	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	685	28
36817	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	685	28
36818	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	685	28
36819	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	685	28
36820	DEGREE2_COEFF	28	28	number	{"type": "number", "value": 28, "parsing": false}	4	685	28
36821	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	685	28
36822	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	685	28
36823	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	672	28
36824	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	672	28
36825	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	672	28
36826	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	672	28
36827	DEGREE2_COEFF	15	15	number	{"type": "number", "value": 15, "parsing": false}	4	672	28
36828	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	672	28
36829	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	672	28
36830	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	696	28
36831	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	696	28
36832	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	696	28
36833	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	696	28
36834	DEGREE2_COEFF	39	39	number	{"type": "number", "value": 39, "parsing": false}	4	696	28
36835	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	696	28
36836	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	696	28
36837	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	694	28
36838	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	694	28
36839	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	694	28
36840	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	694	28
36841	DEGREE2_COEFF	37	37	number	{"type": "number", "value": 37, "parsing": false}	4	694	28
36842	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	694	28
36843	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	694	28
36844	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	674	28
36845	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	674	28
36846	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	674	28
36847	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	674	28
36848	DEGREE2_COEFF	17	17	number	{"type": "number", "value": 17, "parsing": false}	4	674	28
36849	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	674	28
36850	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	674	28
36851	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	683	28
36852	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	683	28
36853	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	683	28
36854	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	683	28
36855	DEGREE2_COEFF	26	26	number	{"type": "number", "value": 26, "parsing": false}	4	683	28
36856	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	683	28
36857	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	683	28
36858	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	673	28
36859	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	673	28
36860	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	673	28
36861	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	673	28
36862	DEGREE2_COEFF	16	16	number	{"type": "number", "value": 16, "parsing": false}	4	673	28
36863	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	673	28
36864	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	673	28
36865	integer_group	134	134	number	{"type": "number", "value": 134, "parsing": false}	0	487	36
36866	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	691	28
36867	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	691	28
36868	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	691	28
36869	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	691	28
36870	DEGREE2_COEFF	34	34	number	{"type": "number", "value": 34, "parsing": false}	4	691	28
36871	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	691	28
36872	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	691	28
36873	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	695	28
36874	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	695	28
36875	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	695	28
36876	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	695	28
36877	DEGREE2_COEFF	38	38	number	{"type": "number", "value": 38, "parsing": false}	4	695	28
36878	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	695	28
36879	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	695	28
36880	integer_group	156	156	number	{"type": "number", "value": 156, "parsing": false}	0	509	36
36881	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	706	28
36882	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	706	28
36883	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	706	28
36884	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	706	28
36885	DEGREE2_COEFF	49	49	number	{"type": "number", "value": 49, "parsing": false}	4	706	28
36886	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	706	28
36887	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	706	28
36888	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	707	28
36889	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	707	28
36890	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	707	28
36891	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	707	28
36892	DEGREE2_COEFF	50	50	number	{"type": "number", "value": 50, "parsing": false}	4	707	28
36893	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	707	28
36894	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	707	28
36895	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	690	28
36896	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	690	28
36897	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	690	28
36898	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	690	28
36899	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	690	28
36900	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	690	28
36901	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	690	28
36902	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	705	28
36903	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	705	28
36904	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	705	28
36905	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	705	28
36906	DEGREE2_COEFF	48	48	number	{"type": "number", "value": 48, "parsing": false}	4	705	28
36907	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	705	28
36908	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	705	28
36909	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	708	28
36910	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	708	28
36911	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	708	28
36912	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	708	28
36913	DEGREE2_COEFF	51	51	number	{"type": "number", "value": 51, "parsing": false}	4	708	28
36914	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	708	28
36915	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	708	28
36916	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	260	28
36917	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	260	28
36918	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	260	28
36919	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	260	28
36920	DEGREE2_COEFF	60	60	number	{"type": "number", "value": "60", "parsing": false}	4	260	28
36921	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	260	28
36922	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	260	28
36923	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	710	28
36924	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	710	28
36925	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	710	28
36926	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	710	28
36927	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	710	28
36928	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	710	28
36929	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	710	28
36930	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	711	28
36931	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	711	28
36932	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	711	28
36933	DEGREE1_COEFF	11	11	number	{"type": "number", "value": 11, "parsing": false}	3	711	28
36934	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	711	28
36935	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	711	28
36936	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	711	28
36937	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	698	28
36938	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	698	28
36939	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	698	28
36940	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	698	28
36941	DEGREE2_COEFF	41	41	number	{"type": "number", "value": 41, "parsing": false}	4	698	28
36942	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	698	28
36943	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	698	28
36944	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	700	28
36945	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	700	28
36946	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	700	28
36947	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	700	28
36948	DEGREE2_COEFF	43	43	number	{"type": "number", "value": 43, "parsing": false}	4	700	28
36949	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	700	28
36950	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	700	28
36951	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	686	28
36952	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	686	28
36953	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	686	28
36954	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	686	28
36955	DEGREE2_COEFF	29	29	number	{"type": "number", "value": 29, "parsing": false}	4	686	28
36956	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	686	28
36957	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	686	28
36958	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	724	28
36959	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	724	28
36960	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	724	28
36961	DEGREE1_COEFF	24	24	number	{"type": "number", "value": 24, "parsing": false}	3	724	28
36962	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	724	28
36963	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	724	28
36964	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	724	28
36965	integer_group	59	59	number	{"type": "number", "value": 59, "parsing": false}	0	412	36
36966	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	713	28
36967	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	713	28
36968	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	713	28
36969	DEGREE1_COEFF	13	13	number	{"type": "number", "value": 13, "parsing": false}	3	713	28
36970	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	713	28
36971	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	713	28
36972	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	713	28
36973	integer_group	144	144	number	{"type": "number", "value": 144, "parsing": false}	0	497	36
36974	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	723	28
36975	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	723	28
36976	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	723	28
36977	DEGREE1_COEFF	23	23	number	{"type": "number", "value": 23, "parsing": false}	3	723	28
36978	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	723	28
36979	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	723	28
36980	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	723	28
36981	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	725	28
36982	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	725	28
36983	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	725	28
36984	DEGREE1_COEFF	25	25	number	{"type": "number", "value": 25, "parsing": false}	3	725	28
36985	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	725	28
36986	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	725	28
36987	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	725	28
36988	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	716	28
36989	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	716	28
36990	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	716	28
36991	DEGREE1_COEFF	16	16	number	{"type": "number", "value": 16, "parsing": false}	3	716	28
36992	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	716	28
36993	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	716	28
36994	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	716	28
36995	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	718	28
36996	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	718	28
36997	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	718	28
36998	DEGREE1_COEFF	18	18	number	{"type": "number", "value": 18, "parsing": false}	3	718	28
36999	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	718	28
37000	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	718	28
37001	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	718	28
37002	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	703	28
37003	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	703	28
37004	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	703	28
37005	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	703	28
37006	DEGREE2_COEFF	46	46	number	{"type": "number", "value": 46, "parsing": false}	4	703	28
37007	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	703	28
37008	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	703	28
37009	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	702	28
37010	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	702	28
37011	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	702	28
37012	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	702	28
37013	DEGREE2_COEFF	45	45	number	{"type": "number", "value": 45, "parsing": false}	4	702	28
37014	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	702	28
37015	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	702	28
37016	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	704	28
37017	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	704	28
37018	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	704	28
37019	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	704	28
37020	DEGREE2_COEFF	47	47	number	{"type": "number", "value": 47, "parsing": false}	4	704	28
37021	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	704	28
37022	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	704	28
37023	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	720	28
37024	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	720	28
37025	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	720	28
37026	DEGREE1_COEFF	20	20	number	{"type": "number", "value": 20, "parsing": false}	3	720	28
37027	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	720	28
37028	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	720	28
37029	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	720	28
37030	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	719	28
37031	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	719	28
37032	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	719	28
37033	DEGREE1_COEFF	19	19	number	{"type": "number", "value": 19, "parsing": false}	3	719	28
37034	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	719	28
37035	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	719	28
37036	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	719	28
37037	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	722	28
37038	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	722	28
37039	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	722	28
37040	DEGREE1_COEFF	22	22	number	{"type": "number", "value": 22, "parsing": false}	3	722	28
37041	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	722	28
37042	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	722	28
37043	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	722	28
37044	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	739	28
37045	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	739	28
37046	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	739	28
37047	DEGREE1_COEFF	39	39	number	{"type": "number", "value": 39, "parsing": false}	3	739	28
37048	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	739	28
37049	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	739	28
37050	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	739	28
37051	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	727	28
37052	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	727	28
37053	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	727	28
37054	DEGREE1_COEFF	27	27	number	{"type": "number", "value": 27, "parsing": false}	3	727	28
37055	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	727	28
37056	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	727	28
37057	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	727	28
37058	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	737	28
37059	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	737	28
37060	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	737	28
37061	DEGREE1_COEFF	37	37	number	{"type": "number", "value": 37, "parsing": false}	3	737	28
37062	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	737	28
37063	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	737	28
37064	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	737	28
37065	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	729	28
37066	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	729	28
37067	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	729	28
37068	DEGREE1_COEFF	29	29	number	{"type": "number", "value": 29, "parsing": false}	3	729	28
37069	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	729	28
37070	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	729	28
37071	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	729	28
37072	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	731	28
37073	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	731	28
37074	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	731	28
37075	DEGREE1_COEFF	31	31	number	{"type": "number", "value": 31, "parsing": false}	3	731	28
37076	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	731	28
37077	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	731	28
37078	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	731	28
37079	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	733	28
37080	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	733	28
37081	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	733	28
37082	DEGREE1_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	3	733	28
37083	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	733	28
37084	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	733	28
37085	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	733	28
37086	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	717	28
37087	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	717	28
37088	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	717	28
37089	DEGREE1_COEFF	17	17	number	{"type": "number", "value": 17, "parsing": false}	3	717	28
37090	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	717	28
37091	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	717	28
37092	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	717	28
37093	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	732	28
37094	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	732	28
37095	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	732	28
37096	DEGREE1_COEFF	32	32	number	{"type": "number", "value": 32, "parsing": false}	3	732	28
37097	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	732	28
37098	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	732	28
37099	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	732	28
37100	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	736	28
37101	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	736	28
37102	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	736	28
37103	DEGREE1_COEFF	36	36	number	{"type": "number", "value": 36, "parsing": false}	3	736	28
37104	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	736	28
37105	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	736	28
37106	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	736	28
37107	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	735	28
37108	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	735	28
37109	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	735	28
37110	DEGREE1_COEFF	35	35	number	{"type": "number", "value": 35, "parsing": false}	3	735	28
37111	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	735	28
37112	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	735	28
37113	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	735	28
37114	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	734	28
37115	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	734	28
37116	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	734	28
37117	DEGREE1_COEFF	34	34	number	{"type": "number", "value": 34, "parsing": false}	3	734	28
37118	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	734	28
37119	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	734	28
37121	integer_group	15	15	number	{"type": "number", "value": 15, "parsing": false}	0	368	36
37122	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	745	28
37123	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	745	28
37120	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	734	28
37124	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	745	28
37125	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	745	28
37126	DEGREE2_COEFF	11	11	number	{"type": "number", "value": 11, "parsing": false}	4	745	28
37127	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	745	28
37128	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	745	28
37129	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	101	28
37130	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	101	28
37131	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	101	28
37132	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	3	101	28
37133	DEGREE2_COEFF	17	17	number	{"type": "number", "value": "17", "parsing": false}	4	101	28
37134	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	101	28
37135	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	101	28
37136	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	746	28
37137	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	746	28
37138	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	746	28
37139	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	746	28
37140	DEGREE2_COEFF	12	12	number	{"type": "number", "value": 12, "parsing": false}	4	746	28
37141	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	746	28
37142	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	746	28
37143	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	747	28
37144	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	747	28
37145	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	747	28
37146	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	747	28
37147	DEGREE2_COEFF	13	13	number	{"type": "number", "value": 13, "parsing": false}	4	747	28
37148	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	747	28
37149	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	747	28
37150	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	748	28
37151	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	748	28
37152	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	748	28
37153	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	748	28
37154	DEGREE2_COEFF	14	14	number	{"type": "number", "value": 14, "parsing": false}	4	748	28
37155	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	748	28
37156	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	748	28
37157	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	753	28
37158	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	753	28
37159	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	753	28
37160	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	753	28
37161	DEGREE2_COEFF	19	19	number	{"type": "number", "value": 19, "parsing": false}	4	753	28
37162	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	753	28
37163	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	753	28
37164	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	756	28
37165	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	756	28
37166	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	756	28
37167	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	756	28
37168	DEGREE2_COEFF	22	22	number	{"type": "number", "value": 22, "parsing": false}	4	756	28
37170	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	756	28
37171	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	750	28
37172	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	750	28
37173	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	750	28
37174	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	750	28
37175	DEGREE2_COEFF	16	16	number	{"type": "number", "value": 16, "parsing": false}	4	750	28
37176	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	750	28
37177	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	750	28
37178	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	752	28
37179	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	752	28
37180	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	752	28
37181	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	752	28
37182	DEGREE2_COEFF	18	18	number	{"type": "number", "value": 18, "parsing": false}	4	752	28
37183	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	752	28
37169	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	756	28
37184	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	752	28
37185	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	751	28
37186	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	751	28
37187	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	751	28
37188	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	751	28
37189	DEGREE2_COEFF	17	17	number	{"type": "number", "value": 17, "parsing": false}	4	751	28
37190	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	751	28
37191	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	751	28
37192	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	754	28
37193	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	754	28
37194	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	754	28
37195	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	754	28
37196	DEGREE2_COEFF	20	20	number	{"type": "number", "value": 20, "parsing": false}	4	754	28
37197	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	754	28
37198	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	754	28
37199	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	741	28
37200	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	741	28
37201	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	741	28
37202	DEGREE1_COEFF	41	41	number	{"type": "number", "value": 41, "parsing": false}	3	741	28
37203	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	741	28
37204	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	741	28
37205	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	741	28
37206	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	744	28
37207	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	744	28
37208	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	744	28
37209	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	744	28
37210	DEGREE2_COEFF	14	14	number	{"type": "number", "value": 14, "parsing": false}	4	744	28
37211	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	744	28
37212	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	744	28
37213	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	768	24
37214	cellSize	42	42	number	{"type": "number", "value": "42", "parsing": false}	1	768	24
37215	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	758	28
37216	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	758	28
37217	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	758	28
37218	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	758	28
37219	DEGREE2_COEFF	24	24	number	{"type": "number", "value": 24, "parsing": false}	4	758	28
37220	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	758	28
37221	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	758	28
37222	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	726	28
37223	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	726	28
37224	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	726	28
37225	DEGREE1_COEFF	26	26	number	{"type": "number", "value": 26, "parsing": false}	3	726	28
36381	cellSize	30	30	number	{"type": "number", "value": 30}	1	38	24
37226	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	726	28
37227	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	726	28
36382	integer_group	28	28	number	{"type": "number", "value": 28, "parsing": false}	0	381	36
36383	integer_group	37	37	number	{"type": "number", "value": 37, "parsing": false}	0	390	36
37228	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	726	28
36384	NUM_ITERATIONS	6	6	number	{"type": "number", "value": "6", "parsing": false}	0	103	28
36385	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	103	28
37229	xMin	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	153	5
37230	funct	1/(x^2+1)	\N	math	{"latex": "\\\\frac{1}{x^{2} + 1}", "string": "1/(x^2+1)", "javascript": "1/(Math.pow(x, 2) + 1)", "value": "1/(x^2+1)", "parsing": false, "type": "math"}	1	153	5
37231	xMax	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	153	5
37232	breathDelta	17	17	number	{"type": "number", "value": 17, "parsing": false}	3	153	5
37233	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	769	24
37234	cellSize	41	41	number	{"type": "number", "value": "41", "parsing": false}	1	769	24
37235	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	778	24
37236	cellSize	35	35	number	{"type": "number", "value": "35", "parsing": false}	1	778	24
37237	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	760	28
37238	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	760	28
37239	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	760	28
37240	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	760	28
37241	DEGREE2_COEFF	26	26	number	{"type": "number", "value": 26, "parsing": false}	4	760	28
37242	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	760	28
37243	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	760	28
37244	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	767	24
37245	cellSize	42	42	number	{"type": "number", "value": "42", "parsing": false}	1	767	24
37246	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	776	24
37247	cellSize	42	42	number	{"type": "number", "value": "42", "parsing": false}	1	776	24
37248	integer_group	308	308	number	{"type": "number", "value": 308, "parsing": false}	0	661	36
37249	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	677	28
37250	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	677	28
37251	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	677	28
37252	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	677	28
37253	DEGREE2_COEFF	20	20	number	{"type": "number", "value": 20, "parsing": false}	4	677	28
37254	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	677	28
37255	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	677	28
37256	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	259	28
37257	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	259	28
37258	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	259	28
37259	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	259	28
37260	DEGREE2_COEFF	56	56	number	{"type": "number", "value": "56", "parsing": false}	4	259	28
37261	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	259	28
37262	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	259	28
37263	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	762	28
37264	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	762	28
37265	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	762	28
37266	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	762	28
37267	DEGREE2_COEFF	28	28	number	{"type": "number", "value": 28, "parsing": false}	4	762	28
37268	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	762	28
37269	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	762	28
37271	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	712	28
37272	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	712	28
37273	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	712	28
37274	DEGREE1_COEFF	12	12	number	{"type": "number", "value": 12, "parsing": false}	3	712	28
37275	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	712	28
37276	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	712	28
37277	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	712	28
37278	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	759	28
37279	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	759	28
37280	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	759	28
37281	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	759	28
37282	DEGREE2_COEFF	25	25	number	{"type": "number", "value": 25, "parsing": false}	4	759	28
37283	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	759	28
37284	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	759	28
37285	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	761	28
37286	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	761	28
38060	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	863	33
37287	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	761	28
37288	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	761	28
37289	DEGREE2_COEFF	27	27	number	{"type": "number", "value": 27, "parsing": false}	4	761	28
37290	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	761	28
37291	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	761	28
37292	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	777	24
37293	cellSize	43	43	number	{"type": "number", "value": "43", "parsing": false}	1	777	24
37294	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	771	24
37295	cellSize	45	45	number	{"type": "number", "value": "45", "parsing": false}	1	771	24
37296	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	774	24
37297	cellSize	47	47	number	{"type": "number", "value": "47", "parsing": false}	1	774	24
37298	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	687	28
37299	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	687	28
37300	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	687	28
37301	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	687	28
37302	DEGREE2_COEFF	30	30	number	{"type": "number", "value": 30, "parsing": false}	4	687	28
37303	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	687	28
37304	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	687	28
37305	integer_group	56	56	number	{"type": "number", "value": 56, "parsing": false}	0	409	36
37306	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	98	28
37307	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	98	28
37308	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9", "parsing": false}	2	98	28
37309	DEGREE1_COEFF	30	30	number	{"type": "number", "value": "30", "parsing": false}	3	98	28
37310	DEGREE2_COEFF	30	30	number	{"type": "number", "value": 30, "parsing": false}	4	98	28
37311	CHILDREN	[4,6,-5,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,-5,-7]", "parsing": false}	5	98	28
37312	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15, "parsing": false}	6	98	28
37313	integer_group	205	205	number	{"type": "number", "value": 205, "parsing": false}	0	558	36
37314	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	773	24
37315	cellSize	46	46	number	{"type": "number", "value": "46", "parsing": false}	1	773	24
37316	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	721	28
37317	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	721	28
37318	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	721	28
37319	DEGREE1_COEFF	21	21	number	{"type": "number", "value": 21, "parsing": false}	3	721	28
37320	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	721	28
37321	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	721	28
37322	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	721	28
37323	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	670	28
37324	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	670	28
37325	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	670	28
37326	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	670	28
37327	DEGREE2_COEFF	13	13	number	{"type": "number", "value": 13, "parsing": false}	4	670	28
37328	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	670	28
37329	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	670	28
37330	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	770	24
37331	cellSize	44	44	number	{"type": "number", "value": "44", "parsing": false}	1	770	24
37332	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	738	28
36386	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	103	28
37333	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	738	28
37334	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	738	28
36387	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	103	28
37335	DEGREE1_COEFF	38	38	number	{"type": "number", "value": 38, "parsing": false}	3	738	28
37336	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	738	28
36388	DEGREE2_COEFF	50	50	number	{"type": "number", "value": "50", "parsing": false}	4	103	28
36389	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	103	28
37337	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	738	28
36390	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	103	28
36391	NUM_ITERATIONS	6	6	number	{"type": "number", "value": "6", "parsing": false}	0	106	28
37338	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	738	28
36392	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	106	28
37339	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	258	28
37340	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	258	28
37341	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	258	28
37342	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	258	28
37343	DEGREE2_COEFF	55	55	number	{"type": "number", "value": "55", "parsing": false}	4	258	28
37344	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	258	28
37345	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	258	28
37346	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	684	28
37347	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	684	28
37348	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	684	28
37349	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	684	28
37350	DEGREE2_COEFF	27	27	number	{"type": "number", "value": 27, "parsing": false}	4	684	28
37351	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	684	28
37352	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	684	28
37353	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	249	28
37354	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	249	28
37355	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	249	28
37356	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	249	28
37357	DEGREE2_COEFF	46	46	number	{"type": "number", "value": "46", "parsing": false}	4	249	28
37358	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	249	28
37359	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	249	28
37360	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	667	28
37361	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	667	28
37362	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	667	28
37363	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	667	28
37364	DEGREE2_COEFF	50	50	number	{"type": "number", "value": "50", "parsing": false}	4	667	28
37365	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	667	28
37366	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	667	28
37367	integer_group	189	189	number	{"type": "number", "value": 189, "parsing": false}	0	542	36
37368	integer_group	304	304	number	{"type": "number", "value": 304, "parsing": false}	0	657	36
37369	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	772	24
37370	cellSize	44	44	number	{"type": "number", "value": "44", "parsing": false}	1	772	24
37371	integer_group	17	17	number	{"type": "number", "value": 17, "parsing": false}	0	370	36
37372	solutionPathColor	#386356	3695446	color	{"type": "color", "value": "#386356", "parsing": false}	0	775	24
37373	cellSize	48	48	number	{"type": "number", "value": "48", "parsing": false}	1	775	24
37374	integer_group	235	235	number	{"type": "number", "value": 235, "parsing": false}	0	588	36
37375	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	742	28
37376	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	742	28
37377	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	742	28
37378	DEGREE1_COEFF	42	42	number	{"type": "number", "value": 42, "parsing": false}	3	742	28
37379	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	742	28
37380	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	742	28
37381	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	742	28
37382	integer_group	131	131	number	{"type": "number", "value": 131, "parsing": false}	0	484	36
37383	integer_group	78	78	number	{"type": "number", "value": 78, "parsing": false}	0	431	36
37384	integer_group	21	21	number	{"type": "number", "value": 21, "parsing": false}	0	374	36
37385	integer_group	125	125	number	{"type": "number", "value": 125, "parsing": false}	0	478	36
37386	integer_group	135	135	number	{"type": "number", "value": 135, "parsing": false}	0	488	36
37387	integer_group	129	129	number	{"type": "number", "value": 129, "parsing": false}	0	482	36
37388	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	250	28
37389	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	250	28
37390	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	250	28
37391	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	250	28
37392	DEGREE2_COEFF	47	47	number	{"type": "number", "value": "47", "parsing": false}	4	250	28
37393	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	250	28
37394	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	250	28
37395	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	714	28
37396	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	714	28
37397	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	714	28
37398	DEGREE1_COEFF	14	14	number	{"type": "number", "value": 14, "parsing": false}	3	714	28
37399	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	714	28
37400	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	714	28
37401	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	714	28
37402	integer_group	121	121	number	{"type": "number", "value": 121, "parsing": false}	0	474	36
37403	NUM_ITERATIONS	6	6	number	{"type": "number", "value": "6", "parsing": false}	0	143	28
37404	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	143	28
37405	COLOR2	#a024cc	10495180	color	{"type": "color", "value": "#a024cc", "parsing": false}	2	143	28
37406	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": "15", "parsing": false}	3	143	28
37407	DEGREE2_COEFF	45	45	number	{"type": "number", "value": "45", "parsing": false}	4	143	28
37408	CHILDREN	[4,5,6,7,-8,-9]	\N	javascript	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	143	28
37409	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	6	143	28
37410	integer_group	133	133	number	{"type": "number", "value": 133, "parsing": false}	0	486	36
37411	NUM_ITERATIONS	6	6	number	{"type": "number", "value": "6", "parsing": false}	0	111	28
37412	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	111	28
37413	COLOR2	#499948	4823368	color	{"type": "color", "value": "#499948", "parsing": false}	2	111	28
37414	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	111	28
37415	DEGREE2_COEFF	30	30	number	{"type": "number", "value": "30", "parsing": false}	4	111	28
37416	CHILDREN	[5,7,-9]	\N	javascript	{"type": "javascript", "value": "[5,7,-9]", "parsing": false}	5	111	28
37417	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	6	111	28
37418	integer_group	127	127	number	{"type": "number", "value": 127, "parsing": false}	0	480	36
37419	xMin	-5	-5	number	{"type": "number", "value": -5}	0	40	5
37420	funct	cos(2x) + x^5	\N	math	{"latex": "x^{5} + \\\\cos{\\\\left (2 x \\\\right )}", "javascript": "Math.pow(x, 5) + Math.cos(2*x)", "type": "math", "string": "cos(2x) + x^5", "value": "cos(2x) + x^5"}	1	40	5
37421	xMax	5	5	number	{"type": "number", "value": 5}	2	40	5
37422	breathDelta	17	17	number	{"type": "number", "value": 17}	3	40	5
37423	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	730	28
37424	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	730	28
37425	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	730	28
37426	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30, "parsing": false}	3	730	28
37427	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	730	28
37428	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	730	28
37429	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	730	28
37430	integer_group	123	123	number	{"type": "number", "value": 123, "parsing": false}	0	476	36
37431	integer_group	115	115	number	{"type": "number", "value": 115, "parsing": false}	0	468	36
37432	integer_group	268	268	number	{"type": "number", "value": 268, "parsing": false}	0	621	36
37433	integer_group	117	117	number	{"type": "number", "value": 117, "parsing": false}	0	470	36
37434	NUM_ITERATIONS	5	5	number	{"type": "number", "value": "5", "parsing": false}	0	112	28
37435	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	112	28
37436	COLOR2	#499948	4823368	color	{"type": "color", "value": "#499948", "parsing": false}	2	112	28
37437	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	3	112	28
36393	COLOR2	#a024cc	10495180	color	{"type": "color", "value": "#a024cc", "parsing": false}	2	106	28
37438	DEGREE2_COEFF	30	30	number	{"type": "number", "value": "30", "parsing": false}	4	112	28
36394	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	3	106	28
36395	DEGREE2_COEFF	45	45	number	{"type": "number", "value": "45", "parsing": false}	4	106	28
36396	CHILDREN	[4,5,6,7,-8,-9]	\N	javascript	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	106	28
36397	TRAPEZOIDAL_SECTIONS	10	10	number	{"type": "number", "value": "10", "parsing": false}	6	106	28
36398	xMin	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	115	5
37439	CHILDREN	[5,7,8,9]	\N	javascript	{"type": "javascript", "value": "[5,7,8,9]", "parsing": false}	5	112	28
36399	breathDelta	17	17	number	{"type": "number", "value": 17, "parsing": false}	1	115	5
37440	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	112	28
37441	integer_group	119	119	number	{"type": "number", "value": 119, "parsing": false}	0	472	36
37442	integer_group	113	113	number	{"type": "number", "value": 113, "parsing": false}	0	466	36
37443	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	755	28
37444	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	755	28
37445	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	755	28
37446	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	755	28
37447	DEGREE2_COEFF	21	21	number	{"type": "number", "value": 21, "parsing": false}	4	755	28
37448	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	755	28
37449	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	755	28
37450	solutionPathColor	#3673ab	3568555	color	{"type": "color", "value": "#3673ab", "parsing": false}	0	47	24
37451	cellSize	15	15	number	{"type": "number", "value": "15", "parsing": false}	1	47	24
37452	integer_group	202	202	number	{"type": "number", "value": 202, "parsing": false}	0	555	36
37453	integer_group	145	145	number	{"type": "number", "value": 145, "parsing": false}	0	498	36
37454	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	0	125	33
37455	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	1	125	33
37456	y^4	-22	-22	number	{"type": "number", "value": "-22", "parsing": false}	2	125	33
37457	y^5	-2	-2	number	{"type": "number", "value": "-2", "parsing": false}	3	125	33
37458	x^2y	20	20	number	{"type": "number", "value": "20", "parsing": false}	4	125	33
37459	x^3y	45	45	number	{"type": "number", "value": "45", "parsing": false}	5	125	33
37460	y^3	-15	-15	number	{"type": "number", "value": "-15", "parsing": false}	6	125	33
37461	xy^3	7	7	number	{"type": "number", "value": 7, "parsing": false}	7	125	33
37462	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	125	33
37463	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	125	33
37464	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	125	33
37465	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	125	33
37466	x^4	-3	-3	number	{"type": "number", "value": "-3", "parsing": false}	12	125	33
37467	xy^4	0	0	number	{"type": "number", "value": "0", "parsing": false}	13	125	33
37468	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	14	125	33
37469	x^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	15	125	33
37470	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	16	125	33
37471	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	17	125	33
37472	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	18	125	33
37473	y^2	25	25	number	{"type": "number", "value": "25", "parsing": false}	19	125	33
37474	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	102	28
37475	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	102	28
37476	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	102	28
37477	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	3	102	28
37478	DEGREE2_COEFF	50	50	number	{"type": "number", "value": "50", "parsing": false}	4	102	28
37479	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	102	28
37480	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	102	28
37481	integer_group	146	146	number	{"type": "number", "value": 146, "parsing": false}	0	499	36
37482	x_min	-10	-10	number	{"type": "number", "value": "-10", "parsing": false}	0	64	27
37483	func1	(1/x) cos(x)	\N	math	{"latex": "\\\\frac{1}{x} \\\\cos{\\\\left (x \\\\right )}", "string": "(1/x) cos(x)", "javascript": "Math.cos(x)/x", "value": "(1/x) cos(x)", "parsing": false, "type": "math"}	1	64	27
37484	x_max	10	10	number	{"type": "number", "value": "10", "parsing": false}	2	64	27
37485	integer_group	309	309	number	{"type": "number", "value": 309, "parsing": false}	0	662	36
37486	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	676	28
37487	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	676	28
36400	xMax	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	115	5
37488	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	676	28
37489	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	676	28
37490	DEGREE2_COEFF	19	19	number	{"type": "number", "value": 19, "parsing": false}	4	676	28
37491	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	676	28
37492	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	676	28
37493	integer_group	22	22	number	{"type": "number", "value": 22, "parsing": false}	0	375	36
37494	integer_group	233	233	number	{"type": "number", "value": 233, "parsing": false}	0	586	36
37495	integer_group	264	264	number	{"type": "number", "value": 264, "parsing": false}	0	617	36
37496	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	699	28
37497	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	699	28
37498	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	699	28
37499	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	699	28
37500	DEGREE2_COEFF	42	42	number	{"type": "number", "value": 42, "parsing": false}	4	699	28
37501	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	699	28
37502	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	699	28
37503	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	715	28
37504	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	715	28
37505	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	715	28
37506	DEGREE1_COEFF	15	15	number	{"type": "number", "value": 15, "parsing": false}	3	715	28
37507	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	715	28
37508	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	715	28
37509	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	715	28
37510	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	749	28
37511	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	749	28
37512	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	749	28
37513	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	749	28
37514	DEGREE2_COEFF	15	15	number	{"type": "number", "value": 15, "parsing": false}	4	749	28
37515	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	749	28
37516	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	749	28
38061	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	863	33
37517	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	757	28
37518	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	757	28
37519	COLOR2	#9050b8	9457848	color	{"type": "color", "value": "#9050b8", "parsing": false}	2	757	28
37520	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	757	28
37521	DEGREE2_COEFF	23	23	number	{"type": "number", "value": 23, "parsing": false}	4	757	28
37522	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	757	28
37523	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	757	28
37524	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	142	28
37525	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	142	28
37526	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	142	28
37527	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	142	28
37528	DEGREE2_COEFF	50	50	number	{"type": "number", "value": "50", "parsing": false}	4	142	28
37529	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	142	28
37530	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	142	28
37531	integer_group	104	104	number	{"type": "number", "value": 104, "parsing": false}	0	457	36
37532	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	251	28
37533	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	251	28
37534	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	251	28
37535	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	3	251	28
37536	DEGREE2_COEFF	48	48	number	{"type": "number", "value": "48", "parsing": false}	4	251	28
37537	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	251	28
37538	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	251	28
37539	integer_group	83	83	number	{"type": "number", "value": 83, "parsing": false}	0	436	36
37540	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	682	28
37541	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	682	28
37542	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	682	28
37543	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	682	28
37544	DEGREE2_COEFF	25	25	number	{"type": "number", "value": 25, "parsing": false}	4	682	28
37545	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	682	28
37546	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	682	28
37547	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	669	28
37548	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	669	28
37549	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	669	28
37550	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	669	28
37551	DEGREE2_COEFF	12	12	number	{"type": "number", "value": 12, "parsing": false}	4	669	28
37552	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	669	28
37553	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	669	28
37554	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	697	28
37555	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	697	28
37556	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	697	28
37557	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	697	28
37558	DEGREE2_COEFF	40	40	number	{"type": "number", "value": 40, "parsing": false}	4	697	28
37559	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	697	28
37560	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	697	28
37561	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	253	28
37562	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	253	28
37563	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	253	28
37564	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	253	28
37565	DEGREE2_COEFF	50	50	number	{"type": "number", "value": "50", "parsing": false}	4	253	28
37566	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	253	28
37567	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	253	28
37568	integer_group	197	197	number	{"type": "number", "value": 197, "parsing": false}	0	550	36
37569	integer_group	306	306	number	{"type": "number", "value": 306, "parsing": false}	0	659	36
37570	integer_group	94	94	number	{"type": "number", "value": 94, "parsing": false}	0	447	36
37571	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	689	28
37572	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	689	28
37573	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	689	28
37574	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	689	28
37575	DEGREE2_COEFF	32	32	number	{"type": "number", "value": 32, "parsing": false}	4	689	28
37576	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	689	28
37577	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	689	28
37578	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	740	28
37579	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	740	28
37580	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	740	28
37581	DEGREE1_COEFF	40	40	number	{"type": "number", "value": 40, "parsing": false}	3	740	28
37582	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	740	28
37583	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	740	28
37584	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	740	28
37585	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	671	28
37586	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	671	28
37587	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	671	28
37588	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	671	28
37589	DEGREE2_COEFF	14	14	number	{"type": "number", "value": 14, "parsing": false}	4	671	28
37590	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	671	28
37591	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	671	28
37592	integer_group	302	302	number	{"type": "number", "value": 302, "parsing": false}	0	655	36
37593	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	0	121	33
37594	y^2	2	2	number	{"type": "number", "value": 2, "parsing": false}	1	121	33
37595	y^4	-2	-2	number	{"type": "number", "value": -2, "parsing": false}	2	121	33
37596	y^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	3	121	33
37597	x^2y	20	20	number	{"type": "number", "value": "20", "parsing": false}	4	121	33
37598	x^3y	2	2	number	{"type": "number", "value": "2", "parsing": false}	5	121	33
37599	y^3	3	3	number	{"type": "number", "value": 3, "parsing": false}	6	121	33
37600	xy^3	7	7	number	{"type": "number", "value": 7, "parsing": false}	7	121	33
37601	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	121	33
37602	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	121	33
37603	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	121	33
37604	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	121	33
37605	x^4	-3	-3	number	{"type": "number", "value": "-3", "parsing": false}	12	121	33
37606	x^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	13	121	33
37607	xy^4	0	0	number	{"type": "number", "value": "0", "parsing": false}	14	121	33
37608	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	15	121	33
37609	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	16	121	33
37610	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	17	121	33
37611	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	18	121	33
37612	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	19	121	33
37613	integer_group	87	87	number	{"type": "number", "value": 87, "parsing": false}	0	440	36
37614	integer_group	90	90	number	{"type": "number", "value": 90, "parsing": false}	0	443	36
37615	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	728	28
37616	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	728	28
37617	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	728	28
37618	DEGREE1_COEFF	28	28	number	{"type": "number", "value": 28, "parsing": false}	3	728	28
37619	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33, "parsing": false}	4	728	28
37620	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	728	28
37621	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	728	28
37622	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	693	28
37623	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	693	28
37624	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	693	28
37625	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	693	28
37626	DEGREE2_COEFF	36	36	number	{"type": "number", "value": 36, "parsing": false}	4	693	28
37627	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	693	28
37628	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	693	28
37629	integer_group	84	84	number	{"type": "number", "value": 84, "parsing": false}	0	437	36
37630	integer_group	300	300	number	{"type": "number", "value": 300, "parsing": false}	0	653	36
37631	integer_group	92	92	number	{"type": "number", "value": 92, "parsing": false}	0	445	36
37632	integer_group	198	198	number	{"type": "number", "value": 198, "parsing": false}	0	551	36
37633	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	692	28
37634	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	692	28
37635	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	692	28
37636	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	692	28
37637	DEGREE2_COEFF	35	35	number	{"type": "number", "value": 35, "parsing": false}	4	692	28
37638	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	692	28
37639	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	692	28
37640	integer_group	199	199	number	{"type": "number", "value": 199, "parsing": false}	0	552	36
37641	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	148	28
37642	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	148	28
37643	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	148	28
37644	TRAPEZOIDAL_SECTIONS	25	25	number	{"type": "number", "value": "25", "parsing": false}	3	148	28
37645	DEGREE2_COEFF	50	50	number	{"type": "number", "value": "50", "parsing": false}	4	148	28
37646	CHILDREN	[4,6,8,-7,16,18]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7,16,18]", "parsing": false}	5	148	28
37647	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	148	28
37648	x^3y	0	0	number	{"type": "number", "value": 0}	0	116	33
37649	xy	1	1	number	{"type": "number", "value": 1}	1	116	33
37650	y^4	-2	-2	number	{"type": "number", "value": -2}	2	116	33
37651	y^5	5	5	number	{"type": "number", "value": 5}	3	116	33
37652	x^2y	1	1	number	{"type": "number", "value": 1}	4	116	33
37653	y^2	2	2	number	{"type": "number", "value": 2}	5	116	33
37654	y^3	3	3	number	{"type": "number", "value": 3}	6	116	33
37655	xy^3	7	7	number	{"type": "number", "value": 7}	7	116	33
37656	xy^2	0	0	number	{"type": "number", "value": 0}	8	116	33
37657	x^3	1	1	number	{"type": "number", "value": 1}	9	116	33
37658	x^2	1	1	number	{"type": "number", "value": 1}	10	116	33
37659	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	116	33
37660	x^4	1	1	number	{"type": "number", "value": 1}	12	116	33
36476	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	255	28
36477	DEGREE2_COEFF	52	52	number	{"type": "number", "value": "52", "parsing": false}	4	255	28
36478	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	255	28
36479	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	255	28
36480	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	256	28
36481	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	256	28
36482	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	256	28
36483	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	256	28
36484	DEGREE2_COEFF	52	52	number	{"type": "number", "value": "52", "parsing": false}	4	256	28
36485	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	256	28
36486	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	256	28
36487	color	#202c33	2108467	color	{"type": "color", "value": "#202c33", "parsing": false}	0	177	25
36488	width	400	400	number	{"type": "number", "value": 400, "parsing": false}	1	177	25
36489	height	2002	2002	number	{"type": "number", "value": "2002", "parsing": false}	2	177	25
36490	NUM_ITERATIONS	6	6	number	{"type": "number", "value": "6", "parsing": false}	0	144	28
36491	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	144	28
36492	COLOR2	#a024cc	10495180	color	{"type": "color", "value": "#a024cc", "parsing": false}	2	144	28
36493	DEGREE1_COEFF	35	35	number	{"type": "number", "value": "35", "parsing": false}	3	144	28
36494	DEGREE2_COEFF	35	35	number	{"type": "number", "value": "35", "parsing": false}	4	144	28
36495	CHILDREN	[4,5,6,7,-8,-9]	\N	javascript	{"type": "javascript", "value": "[4,5,6,7,-8,-9]", "parsing": false}	5	144	28
36496	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": "15", "parsing": false}	6	144	28
36497	x_min	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	151	27
36498	func1	x cos(x) sin(2x)	\N	math	{"latex": "x \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) sin(2x)", "javascript": "x*Math.sin(2*x)*Math.cos(x)", "value": "x cos(x) sin(2x)", "parsing": true, "type": "math"}	1	151	27
36499	x_max	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	151	27
36500	color	#202c33	2108467	color	{"type": "color", "value": "#202c33", "parsing": false}	0	175	25
36501	width	400	400	number	{"type": "number", "value": 400, "parsing": false}	1	175	25
36502	height	2002	2002	number	{"type": "number", "value": "2002", "parsing": false}	2	175	25
36503	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	141	28
36504	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	141	28
36505	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	141	28
36506	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	141	28
36507	DEGREE2_COEFF	50	50	number	{"type": "number", "value": "50", "parsing": false}	4	141	28
36508	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]", "parsing": false}	5	141	28
36509	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	141	28
36510	color	#202c33	2108467	color	{"type": "color", "value": "#202c33", "parsing": false}	0	174	25
36511	width	400	400	number	{"type": "number", "value": 400, "parsing": false}	1	174	25
36512	height	2002	2002	number	{"type": "number", "value": "2002", "parsing": false}	2	174	25
36513	integer_group	38	38	number	{"type": "number", "value": 38, "parsing": false}	0	391	36
36514	integer_group	64	64	number	{"type": "number", "value": 64, "parsing": false}	0	417	36
36515	integer_group	85	85	number	{"type": "number", "value": 85, "parsing": false}	0	438	36
36516	integer_group	76	76	number	{"type": "number", "value": 76, "parsing": false}	0	429	36
36517	integer_group	25	25	number	{"type": "number", "value": 25, "parsing": false}	0	378	36
36518	integer_group	58	58	number	{"type": "number", "value": 58, "parsing": false}	0	411	36
36519	integer_group	54	54	number	{"type": "number", "value": 54, "parsing": false}	0	407	36
36520	integer_group	57	57	number	{"type": "number", "value": 57, "parsing": false}	0	410	36
36521	integer_group	41	41	number	{"type": "number", "value": 41, "parsing": false}	0	394	36
36522	integer_group	45	45	number	{"type": "number", "value": 45, "parsing": false}	0	398	36
36523	integer_group	49	49	number	{"type": "number", "value": 49, "parsing": false}	0	402	36
36524	integer_group	19	19	number	{"type": "number", "value": 19, "parsing": false}	0	372	36
36525	integer_group	14	14	number	{"type": "number", "value": 14, "parsing": false}	0	367	36
36526	integer_group	24	24	number	{"type": "number", "value": 24, "parsing": false}	0	377	36
36527	integer_group	73	73	number	{"type": "number", "value": 73, "parsing": false}	0	426	36
36528	integer_group	33	33	number	{"type": "number", "value": 33, "parsing": false}	0	386	36
36529	integer_group	82	82	number	{"type": "number", "value": 82, "parsing": false}	0	435	36
36530	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	252	28
36531	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	252	28
37661	x^5	3	3	number	{"type": "number", "value": 3}	13	116	33
37669	x^4	-3	-3	number	{"type": "number", "value": "-3", "parsing": false}	0	124	33
37662	xy^4	1	1	number	{"type": "number", "value": 1}	14	116	33
37663	y	1	1	number	{"type": "number", "value": 1}	15	116	33
37664	x	1	1	number	{"type": "number", "value": 1}	16	116	33
37665	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	116	33
37666	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	116	33
37667	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	116	33
37668	integer_group	200	200	number	{"type": "number", "value": 200, "parsing": false}	0	553	36
37670	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	1	124	33
37671	y^4	-22	-22	number	{"type": "number", "value": "-22", "parsing": false}	2	124	33
37672	y^5	-2	-2	number	{"type": "number", "value": "-2", "parsing": false}	3	124	33
37673	x^2y	20	20	number	{"type": "number", "value": "20", "parsing": false}	4	124	33
37674	x^3y	244	244	number	{"type": "number", "value": "244", "parsing": false}	5	124	33
37675	y^3	3	3	number	{"type": "number", "value": 3, "parsing": false}	6	124	33
37676	xy^3	7	7	number	{"type": "number", "value": 7, "parsing": false}	7	124	33
37677	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	124	33
37678	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	124	33
37679	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	124	33
37680	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	124	33
37681	y^2	25	25	number	{"type": "number", "value": "25", "parsing": false}	12	124	33
37682	x^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	13	124	33
37683	xy^4	0	0	number	{"type": "number", "value": "0", "parsing": false}	14	124	33
37684	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	15	124	33
37685	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	16	124	33
37686	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	17	124	33
37687	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	18	124	33
37688	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	19	124	33
37689	xMin	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	55	5
37690	breathDelta	17	17	number	{"type": "number", "value": 17, "parsing": false}	1	55	5
37691	xMax	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	55	5
37692	funct	x^5 +  cos(x) * sin(2x)	\N	math	{"latex": "x^{5} + \\\\sin{\\\\left (2 x \\\\right )} \\\\cos{\\\\left (x \\\\right )}", "string": "x^5 +  cos(x) * sin(2x)", "javascript": "Math.pow(x, 5) + Math.sin(2*x)*Math.cos(x)", "value": "x^5 +  cos(x) * sin(2x)", "parsing": false, "type": "math"}	3	55	5
37693	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	0	117	33
37694	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	1	117	33
37695	y^4	-2	-2	number	{"type": "number", "value": -2, "parsing": false}	2	117	33
37696	y^5	5	5	number	{"type": "number", "value": 5, "parsing": false}	3	117	33
37697	x^2y	0	0	number	{"type": "number", "value": "0", "parsing": false}	4	117	33
37698	x^3y	0	0	number	{"type": "number", "value": 0, "parsing": false}	5	117	33
37699	y^3	3	3	number	{"type": "number", "value": 3, "parsing": false}	6	117	33
37700	xy^3	7	7	number	{"type": "number", "value": 7, "parsing": false}	7	117	33
37701	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	117	33
37702	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	117	33
37703	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	117	33
37704	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	117	33
37705	y^2	2	2	number	{"type": "number", "value": 2, "parsing": false}	12	117	33
37706	xy^4	1	1	number	{"type": "number", "value": 1, "parsing": false}	13	117	33
37707	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	14	117	33
37708	x^5	3	3	number	{"type": "number", "value": 3, "parsing": false}	15	117	33
37709	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	16	117	33
37710	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	17	117	33
37711	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	18	117	33
37712	x^4	4	4	number	{"type": "number", "value": "4", "parsing": false}	19	117	33
37713	x^4	4	4	number	{"type": "number", "value": "4", "parsing": false}	0	119	33
37714	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	1	119	33
37715	y^4	-2	-2	number	{"type": "number", "value": -2, "parsing": false}	2	119	33
37716	y^5	14	14	number	{"type": "number", "value": "14", "parsing": false}	3	119	33
37717	x^2y	2	2	number	{"type": "number", "value": "2", "parsing": false}	4	119	33
37718	x^3y	2	2	number	{"type": "number", "value": "2", "parsing": false}	5	119	33
37719	y^3	3	3	number	{"type": "number", "value": 3, "parsing": false}	6	119	33
37720	xy^3	7	7	number	{"type": "number", "value": 7, "parsing": false}	7	119	33
37721	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	119	33
37722	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	119	33
37723	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	119	33
37724	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	119	33
37725	y^2	2	2	number	{"type": "number", "value": 2, "parsing": false}	12	119	33
37726	x^5	3	3	number	{"type": "number", "value": 3, "parsing": false}	13	119	33
37727	xy^4	1	1	number	{"type": "number", "value": 1, "parsing": false}	14	119	33
37728	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	15	119	33
37729	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	16	119	33
37730	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	17	119	33
37731	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	18	119	33
37732	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	19	119	33
37733	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	0	122	33
37734	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	1	122	33
37735	y^4	-2	-2	number	{"type": "number", "value": -2, "parsing": false}	2	122	33
37736	y^5	-2	-2	number	{"type": "number", "value": "-2", "parsing": false}	3	122	33
37737	x^2y	20	20	number	{"type": "number", "value": "20", "parsing": false}	4	122	33
37738	x^3y	2	2	number	{"type": "number", "value": "2", "parsing": false}	5	122	33
37739	y^3	3	3	number	{"type": "number", "value": 3, "parsing": false}	6	122	33
37740	xy^3	7	7	number	{"type": "number", "value": 7, "parsing": false}	7	122	33
37741	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	122	33
37742	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	122	33
37743	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	122	33
37744	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	122	33
37745	y^2	2	2	number	{"type": "number", "value": 2, "parsing": false}	12	122	33
37746	xy^4	0	0	number	{"type": "number", "value": "0", "parsing": false}	13	122	33
37747	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	14	122	33
37748	x^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	15	122	33
37749	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	16	122	33
37750	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	17	122	33
37751	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	18	122	33
37752	x^4	-3	-3	number	{"type": "number", "value": "-3", "parsing": false}	19	122	33
37753	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	0	120	33
37754	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	1	120	33
37755	y^4	-2	-2	number	{"type": "number", "value": -2, "parsing": false}	2	120	33
37756	y^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	3	120	33
37757	x^2y	2	2	number	{"type": "number", "value": "2", "parsing": false}	4	120	33
37758	x^3y	2	2	number	{"type": "number", "value": "2", "parsing": false}	5	120	33
37759	y^3	3	3	number	{"type": "number", "value": 3, "parsing": false}	6	120	33
37760	xy^3	7	7	number	{"type": "number", "value": 7, "parsing": false}	7	120	33
37761	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	120	33
37762	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	120	33
37763	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	120	33
37764	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	120	33
37765	x^4	4	4	number	{"type": "number", "value": "4", "parsing": false}	12	120	33
37766	xy^4	1	1	number	{"type": "number", "value": 1, "parsing": false}	13	120	33
37767	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	14	120	33
37768	x^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	15	120	33
37769	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	16	120	33
37770	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	17	120	33
37771	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	18	120	33
37772	y^2	2	2	number	{"type": "number", "value": 2, "parsing": false}	19	120	33
37773	x^4	-3	-3	number	{"type": "number", "value": "-3", "parsing": false}	0	123	33
37774	x^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	1	123	33
37775	y^4	-2	-2	number	{"type": "number", "value": -2, "parsing": false}	2	123	33
37776	y^5	1	1	number	{"type": "number", "value": "1", "parsing": false}	3	123	33
37777	x^2y	20	20	number	{"type": "number", "value": "20", "parsing": false}	4	123	33
37778	x^3y	2	2	number	{"type": "number", "value": "2", "parsing": false}	5	123	33
37779	y^3	30	30	number	{"type": "number", "value": "30", "parsing": false}	6	123	33
37780	xy^3	-75	-75	number	{"type": "number", "value": "-75", "parsing": false}	7	123	33
37781	xy^2	0	0	number	{"type": "number", "value": 0, "parsing": false}	8	123	33
37782	x^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	9	123	33
37783	xy	1	1	number	{"type": "number", "value": 1, "parsing": false}	10	123	33
37784	x^3y^2	1	1	number	{"type": "number", "value": 1, "parsing": false}	11	123	33
37785	y^2	2	2	number	{"type": "number", "value": 2, "parsing": false}	12	123	33
37786	x^5	0	0	number	{"type": "number", "value": "0", "parsing": false}	13	123	33
37787	xy^4	0	0	number	{"type": "number", "value": "0", "parsing": false}	14	123	33
37788	y	3	3	number	{"type": "number", "value": "3", "parsing": false}	15	123	33
37789	x	5	5	number	{"type": "number", "value": "5", "parsing": false}	16	123	33
37790	x^2y^3	1	1	number	{"type": "number", "value": 1, "parsing": false}	17	123	33
37791	x^2y^2	-13	-13	number	{"type": "number", "value": -13, "parsing": false}	18	123	33
37792	x^4y	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	19	123	33
36401	funct	x cos(x) + x^7	\N	math	{"latex": "x^{7} + x \\\\cos{\\\\left (x \\\\right )}", "string": "x cos(x) + x^7", "javascript": "Math.pow(x, 7) + x*Math.cos(x)", "value": "x cos(x) + x^7", "parsing": false, "type": "math"}	3	115	5
36402	NUM_ITERATIONS	6	6	number	{"type": "number", "value": "6", "parsing": false}	0	105	28
36403	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	105	28
36404	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	105	28
36405	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	105	28
36406	DEGREE2_COEFF	60	60	number	{"type": "number", "value": "60", "parsing": false}	4	105	28
36407	CHILDREN	[5,7,-9]	\N	javascript	{"type": "javascript", "value": "[5,7,-9]", "parsing": false}	5	105	28
36408	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	6	105	28
36409	xMin	-5	-5	number	{"type": "number", "value": -5, "parsing": false}	0	107	5
36410	funct	3 cos(2x) + sin(3x) cos(5x)	\N	math	{"latex": "\\\\sin{\\\\left (3 x \\\\right )} \\\\cos{\\\\left (5 x \\\\right )} + 3 \\\\cos{\\\\left (2 x \\\\right )}", "string": "3 cos(2x) + sin(3x) cos(5x)", "javascript": "Math.sin(3*x)*Math.cos(5*x) + 3*Math.cos(2*x)", "value": "3 cos(2x) + sin(3x) cos(5x)", "parsing": false, "type": "math"}	1	107	5
36411	xMax	5	5	number	{"type": "number", "value": 5, "parsing": false}	2	107	5
36412	breathDelta	17	17	number	{"type": "number", "value": 17, "parsing": false}	3	107	5
36413	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	104	28
36414	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C", "parsing": false}	1	104	28
36415	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	104	28
36416	DEGREE1_COEFF	25	25	number	{"type": "number", "value": "25", "parsing": false}	3	104	28
36417	DEGREE2_COEFF	45	45	number	{"type": "number", "value": "45", "parsing": false}	4	104	28
36418	CHILDREN	[4,6,7,17,-8,-9]	\N	javascript	{"type": "javascript", "value": "[4,6,7,17,-8,-9]", "parsing": false}	5	104	28
36419	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	104	28
36532	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	252	28
36533	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	3	252	28
36534	DEGREE2_COEFF	49	49	number	{"type": "number", "value": "49", "parsing": false}	4	252	28
36535	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	252	28
36536	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	6	252	28
36537	integer_group	50	50	number	{"type": "number", "value": 50, "parsing": false}	0	403	36
36538	integer_group	30	30	number	{"type": "number", "value": 30, "parsing": false}	0	383	36
36539	integer_group	61	61	number	{"type": "number", "value": 61, "parsing": false}	0	414	36
36540	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	257	28
36541	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	257	28
36542	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	257	28
36543	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	257	28
36544	DEGREE2_COEFF	53	53	number	{"type": "number", "value": "53", "parsing": false}	4	257	28
36545	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	257	28
36546	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	257	28
36547	integer_group	42	42	number	{"type": "number", "value": 42, "parsing": false}	0	395	36
36548	integer_group	70	70	number	{"type": "number", "value": 70, "parsing": false}	0	423	36
36549	integer_group	79	79	number	{"type": "number", "value": 79, "parsing": false}	0	432	36
36550	integer_group	46	46	number	{"type": "number", "value": 46, "parsing": false}	0	399	36
36551	integer_group	86	86	number	{"type": "number", "value": 86, "parsing": false}	0	439	36
36552	integer_group	55	55	number	{"type": "number", "value": 55, "parsing": false}	0	408	36
36553	integer_group	34	34	number	{"type": "number", "value": 34, "parsing": false}	0	387	36
36554	integer_group	65	65	number	{"type": "number", "value": 65, "parsing": false}	0	418	36
36555	integer_group	71	71	number	{"type": "number", "value": 71, "parsing": false}	0	424	36
36556	integer_group	43	43	number	{"type": "number", "value": 43, "parsing": false}	0	396	36
36557	integer_group	91	91	number	{"type": "number", "value": 91, "parsing": false}	0	444	36
36558	integer_group	93	93	number	{"type": "number", "value": 93, "parsing": false}	0	446	36
36559	integer_group	62	62	number	{"type": "number", "value": 62, "parsing": false}	0	415	36
36560	integer_group	105	105	number	{"type": "number", "value": 105, "parsing": false}	0	458	36
36561	integer_group	95	95	number	{"type": "number", "value": 95, "parsing": false}	0	448	36
36562	integer_group	74	74	number	{"type": "number", "value": 74, "parsing": false}	0	427	36
36563	integer_group	39	39	number	{"type": "number", "value": 39, "parsing": false}	0	392	36
36564	integer_group	26	26	number	{"type": "number", "value": 26, "parsing": false}	0	379	36
36565	integer_group	80	80	number	{"type": "number", "value": 80, "parsing": false}	0	433	36
36566	integer_group	31	31	number	{"type": "number", "value": 31, "parsing": false}	0	384	36
36567	integer_group	99	99	number	{"type": "number", "value": 99, "parsing": false}	0	452	36
36568	integer_group	101	101	number	{"type": "number", "value": 101, "parsing": false}	0	454	36
36569	integer_group	107	107	number	{"type": "number", "value": 107, "parsing": false}	0	460	36
36570	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	261	28
36571	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	261	28
36572	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	261	28
36573	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	261	28
36574	DEGREE2_COEFF	61	61	number	{"type": "number", "value": "61", "parsing": false}	4	261	28
36575	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	261	28
36576	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	261	28
36577	integer_group	88	88	number	{"type": "number", "value": 88, "parsing": false}	0	441	36
36578	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5, "parsing": false}	0	254	28
36579	COLOR1	#7a5229	8016425	color	{"type": "color", "value": "#7a5229", "parsing": false}	1	254	28
36580	COLOR2	#27cc24	2608164	color	{"type": "color", "value": "#27cc24", "parsing": false}	2	254	28
36581	DEGREE1_COEFF	13	13	number	{"type": "number", "value": "13", "parsing": false}	3	254	28
36582	DEGREE2_COEFF	51	51	number	{"type": "number", "value": "51", "parsing": false}	4	254	28
36583	CHILDREN	[8,15,17,-9,-16]	\N	javascript	{"type": "javascript", "value": "[8,15,17,-9,-16]", "parsing": false}	5	254	28
36584	TRAPEZOIDAL_SECTIONS	20	20	number	{"type": "number", "value": "20", "parsing": false}	6	254	28
36585	integer_group	67	67	number	{"type": "number", "value": 67, "parsing": false}	0	420	36
36586	integer_group	20	20	number	{"type": "number", "value": 20, "parsing": false}	0	373	36
36587	integer_group	77	77	number	{"type": "number", "value": 77, "parsing": false}	0	430	36
36588	integer_group	51	51	number	{"type": "number", "value": 51, "parsing": false}	0	404	36
36589	integer_group	68	68	number	{"type": "number", "value": 68, "parsing": false}	0	421	36
36590	integer_group	35	35	number	{"type": "number", "value": 35, "parsing": false}	0	388	36
36591	integer_group	16	16	number	{"type": "number", "value": 16, "parsing": false}	0	369	36
36592	integer_group	97	97	number	{"type": "number", "value": 97, "parsing": false}	0	450	36
36593	integer_group	108	108	number	{"type": "number", "value": 108, "parsing": false}	0	461	36
36594	integer_group	110	110	number	{"type": "number", "value": 110, "parsing": false}	0	463	36
36595	integer_group	112	112	number	{"type": "number", "value": 112, "parsing": false}	0	465	36
36596	integer_group	116	116	number	{"type": "number", "value": 116, "parsing": false}	0	469	36
36597	integer_group	118	118	number	{"type": "number", "value": 118, "parsing": false}	0	471	36
36598	integer_group	122	122	number	{"type": "number", "value": 122, "parsing": false}	0	475	36
36599	integer_group	124	124	number	{"type": "number", "value": 124, "parsing": false}	0	477	36
36600	integer_group	128	128	number	{"type": "number", "value": 128, "parsing": false}	0	481	36
36601	integer_group	130	130	number	{"type": "number", "value": 130, "parsing": false}	0	483	36
36602	integer_group	136	136	number	{"type": "number", "value": 136, "parsing": false}	0	489	36
36603	integer_group	137	137	number	{"type": "number", "value": 137, "parsing": false}	0	490	36
36604	integer_group	96	96	number	{"type": "number", "value": 96, "parsing": false}	0	449	36
36605	integer_group	106	106	number	{"type": "number", "value": 106, "parsing": false}	0	459	36
36606	integer_group	10	10	number	{"type": "number", "value": 10, "parsing": false}	0	363	36
36607	integer_group	111	111	number	{"type": "number", "value": 111, "parsing": false}	0	464	36
36608	integer_group	9	9	number	{"type": "number", "value": 9, "parsing": false}	0	362	36
36609	integer_group	140	140	number	{"type": "number", "value": 140, "parsing": false}	0	493	36
36610	integer_group	89	89	number	{"type": "number", "value": 89, "parsing": false}	0	442	36
36611	integer_group	114	114	number	{"type": "number", "value": 114, "parsing": false}	0	467	36
36612	integer_group	120	120	number	{"type": "number", "value": 120, "parsing": false}	0	473	36
36613	integer_group	126	126	number	{"type": "number", "value": 126, "parsing": false}	0	479	36
36614	integer_group	132	132	number	{"type": "number", "value": 132, "parsing": false}	0	485	36
36615	integer_group	138	138	number	{"type": "number", "value": 138, "parsing": false}	0	491	36
36616	integer_group	7	7	number	{"type": "number", "value": 7, "parsing": false}	0	360	36
36617	integer_group	6	6	number	{"type": "number", "value": 6, "parsing": false}	0	359	36
36618	integer_group	8	8	number	{"type": "number", "value": 8, "parsing": false}	0	361	36
36619	integer_group	139	139	number	{"type": "number", "value": 139, "parsing": false}	0	492	36
36620	integer_group	11	11	number	{"type": "number", "value": 11, "parsing": false}	0	364	36
36621	integer_group	27	27	number	{"type": "number", "value": 27, "parsing": false}	0	380	36
36622	integer_group	143	143	number	{"type": "number", "value": 143, "parsing": false}	0	496	36
36623	integer_group	142	142	number	{"type": "number", "value": 142, "parsing": false}	0	495	36
36624	integer_group	40	40	number	{"type": "number", "value": 40, "parsing": false}	0	393	36
36625	integer_group	36	36	number	{"type": "number", "value": 36, "parsing": false}	0	389	36
38062	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	863	33
36626	integer_group	32	32	number	{"type": "number", "value": 32, "parsing": false}	0	385	36
36627	integer_group	52	52	number	{"type": "number", "value": 52, "parsing": false}	0	405	36
36628	integer_group	48	48	number	{"type": "number", "value": 48, "parsing": false}	0	401	36
36629	integer_group	44	44	number	{"type": "number", "value": 44, "parsing": false}	0	397	36
36630	integer_group	66	66	number	{"type": "number", "value": 66, "parsing": false}	0	419	36
36631	integer_group	63	63	number	{"type": "number", "value": 63, "parsing": false}	0	416	36
36632	integer_group	60	60	number	{"type": "number", "value": 60, "parsing": false}	0	413	36
36633	integer_group	75	75	number	{"type": "number", "value": 75, "parsing": false}	0	428	36
36634	integer_group	72	72	number	{"type": "number", "value": 72, "parsing": false}	0	425	36
36635	integer_group	69	69	number	{"type": "number", "value": 69, "parsing": false}	0	422	36
36636	integer_group	47	47	number	{"type": "number", "value": 47, "parsing": false}	0	400	36
36637	integer_group	840	840	number	{"type": "number", "value": 840}	0	354	36
36638	integer_group	81	81	number	{"type": "number", "value": 81, "parsing": false}	0	434	36
36639	integer_group	173	173	number	{"type": "number", "value": 173, "parsing": false}	0	526	36
36640	integer_group	174	174	number	{"type": "number", "value": 174, "parsing": false}	0	527	36
36641	integer_group	175	175	number	{"type": "number", "value": 175, "parsing": false}	0	528	36
36642	integer_group	176	176	number	{"type": "number", "value": 176, "parsing": false}	0	529	36
36643	integer_group	177	177	number	{"type": "number", "value": 177, "parsing": false}	0	530	36
36644	integer_group	178	178	number	{"type": "number", "value": 178, "parsing": false}	0	531	36
36645	integer_group	179	179	number	{"type": "number", "value": 179, "parsing": false}	0	532	36
36646	integer_group	180	180	number	{"type": "number", "value": 180, "parsing": false}	0	533	36
36647	integer_group	181	181	number	{"type": "number", "value": 181, "parsing": false}	0	534	36
36648	integer_group	182	182	number	{"type": "number", "value": 182, "parsing": false}	0	535	36
36649	integer_group	183	183	number	{"type": "number", "value": 183, "parsing": false}	0	536	36
36650	integer_group	184	184	number	{"type": "number", "value": 184, "parsing": false}	0	537	36
36651	integer_group	185	185	number	{"type": "number", "value": 185, "parsing": false}	0	538	36
36652	integer_group	186	186	number	{"type": "number", "value": 186, "parsing": false}	0	539	36
36653	integer_group	187	187	number	{"type": "number", "value": 187, "parsing": false}	0	540	36
36654	integer_group	188	188	number	{"type": "number", "value": 188, "parsing": false}	0	541	36
36655	integer_group	190	190	number	{"type": "number", "value": 190, "parsing": false}	0	543	36
36656	integer_group	191	191	number	{"type": "number", "value": 191, "parsing": false}	0	544	36
36657	integer_group	192	192	number	{"type": "number", "value": 192, "parsing": false}	0	545	36
36658	integer_group	193	193	number	{"type": "number", "value": 193, "parsing": false}	0	546	36
36659	integer_group	194	194	number	{"type": "number", "value": 194, "parsing": false}	0	547	36
36660	integer_group	195	195	number	{"type": "number", "value": 195, "parsing": false}	0	548	36
36661	integer_group	196	196	number	{"type": "number", "value": 196, "parsing": false}	0	549	36
36662	integer_group	201	201	number	{"type": "number", "value": "201", "parsing": false}	0	554	36
36663	integer_group	203	203	number	{"type": "number", "value": 203, "parsing": false}	0	556	36
36664	integer_group	204	204	number	{"type": "number", "value": 204, "parsing": false}	0	557	36
36665	integer_group	147	147	number	{"type": "number", "value": 147, "parsing": false}	0	500	36
36666	integer_group	148	148	number	{"type": "number", "value": 148, "parsing": false}	0	501	36
36667	integer_group	149	149	number	{"type": "number", "value": 149, "parsing": false}	0	502	36
36668	integer_group	150	150	number	{"type": "number", "value": 150, "parsing": false}	0	503	36
36669	integer_group	152	152	number	{"type": "number", "value": 152, "parsing": false}	0	505	36
36670	integer_group	151	151	number	{"type": "number", "value": 151, "parsing": false}	0	504	36
36671	integer_group	154	154	number	{"type": "number", "value": 154, "parsing": false}	0	507	36
36672	integer_group	153	153	number	{"type": "number", "value": 153, "parsing": false}	0	506	36
36673	integer_group	155	155	number	{"type": "number", "value": 155, "parsing": false}	0	508	36
36674	integer_group	157	157	number	{"type": "number", "value": 157, "parsing": false}	0	510	36
36675	integer_group	158	158	number	{"type": "number", "value": 158, "parsing": false}	0	511	36
36676	integer_group	159	159	number	{"type": "number", "value": 159, "parsing": false}	0	512	36
36677	integer_group	160	160	number	{"type": "number", "value": 160, "parsing": false}	0	513	36
36678	integer_group	161	161	number	{"type": "number", "value": 161, "parsing": false}	0	514	36
36679	integer_group	162	162	number	{"type": "number", "value": 162, "parsing": false}	0	515	36
36680	integer_group	163	163	number	{"type": "number", "value": 163, "parsing": false}	0	516	36
36681	integer_group	164	164	number	{"type": "number", "value": 164, "parsing": false}	0	517	36
36682	integer_group	165	165	number	{"type": "number", "value": 165, "parsing": false}	0	518	36
36683	integer_group	166	166	number	{"type": "number", "value": 166, "parsing": false}	0	519	36
36684	integer_group	167	167	number	{"type": "number", "value": 167, "parsing": false}	0	520	36
36685	integer_group	168	168	number	{"type": "number", "value": 168, "parsing": false}	0	521	36
36686	integer_group	169	169	number	{"type": "number", "value": 169, "parsing": false}	0	522	36
36687	integer_group	231	231	number	{"type": "number", "value": 231, "parsing": false}	0	584	36
36688	integer_group	232	232	number	{"type": "number", "value": 232, "parsing": false}	0	585	36
36689	integer_group	98	98	number	{"type": "number", "value": 98, "parsing": false}	0	451	36
36690	integer_group	100	100	number	{"type": "number", "value": 100, "parsing": false}	0	453	36
36691	integer_group	102	102	number	{"type": "number", "value": 102, "parsing": false}	0	455	36
36692	integer_group	170	170	number	{"type": "number", "value": 170, "parsing": false}	0	523	36
36693	integer_group	171	171	number	{"type": "number", "value": 171, "parsing": false}	0	524	36
36694	integer_group	172	172	number	{"type": "number", "value": 172, "parsing": false}	0	525	36
36695	integer_group	242	242	number	{"type": "number", "value": 242, "parsing": false}	0	595	36
36696	integer_group	243	243	number	{"type": "number", "value": 243, "parsing": false}	0	596	36
36697	integer_group	244	244	number	{"type": "number", "value": 244, "parsing": false}	0	597	36
36698	integer_group	245	245	number	{"type": "number", "value": 245, "parsing": false}	0	598	36
36699	integer_group	246	246	number	{"type": "number", "value": 246, "parsing": false}	0	599	36
36700	integer_group	247	247	number	{"type": "number", "value": 247, "parsing": false}	0	600	36
36701	integer_group	248	248	number	{"type": "number", "value": 248, "parsing": false}	0	601	36
36702	integer_group	249	249	number	{"type": "number", "value": 249, "parsing": false}	0	602	36
36703	integer_group	250	250	number	{"type": "number", "value": 250, "parsing": false}	0	603	36
36704	integer_group	251	251	number	{"type": "number", "value": 251, "parsing": false}	0	604	36
36705	integer_group	252	252	number	{"type": "number", "value": 252, "parsing": false}	0	605	36
36706	integer_group	253	253	number	{"type": "number", "value": 253, "parsing": false}	0	606	36
36707	integer_group	254	254	number	{"type": "number", "value": 254, "parsing": false}	0	607	36
36708	integer_group	255	255	number	{"type": "number", "value": 255, "parsing": false}	0	608	36
36709	integer_group	256	256	number	{"type": "number", "value": 256, "parsing": false}	0	609	36
36710	integer_group	257	257	number	{"type": "number", "value": 257, "parsing": false}	0	610	36
36711	integer_group	258	258	number	{"type": "number", "value": 258, "parsing": false}	0	611	36
36712	integer_group	259	259	number	{"type": "number", "value": 259, "parsing": false}	0	612	36
36713	integer_group	260	260	number	{"type": "number", "value": 260, "parsing": false}	0	613	36
36714	integer_group	261	261	number	{"type": "number", "value": 261, "parsing": false}	0	614	36
36715	integer_group	262	262	number	{"type": "number", "value": 262, "parsing": false}	0	615	36
36716	integer_group	263	263	number	{"type": "number", "value": 263, "parsing": false}	0	616	36
36717	integer_group	265	265	number	{"type": "number", "value": 265, "parsing": false}	0	618	36
36718	integer_group	207	207	number	{"type": "number", "value": 207, "parsing": false}	0	560	36
36719	integer_group	208	208	number	{"type": "number", "value": 208, "parsing": false}	0	561	36
36720	integer_group	239	239	number	{"type": "number", "value": 239, "parsing": false}	0	592	36
36721	integer_group	209	209	number	{"type": "number", "value": 209, "parsing": false}	0	562	36
36722	integer_group	210	210	number	{"type": "number", "value": 210, "parsing": false}	0	563	36
36723	integer_group	211	211	number	{"type": "number", "value": 211, "parsing": false}	0	564	36
36724	integer_group	212	212	number	{"type": "number", "value": 212, "parsing": false}	0	565	36
36725	integer_group	213	213	number	{"type": "number", "value": 213, "parsing": false}	0	566	36
36726	integer_group	215	215	number	{"type": "number", "value": 215, "parsing": false}	0	568	36
36727	integer_group	214	214	number	{"type": "number", "value": 214, "parsing": false}	0	567	36
36728	integer_group	216	216	number	{"type": "number", "value": 216, "parsing": false}	0	569	36
36729	integer_group	217	217	number	{"type": "number", "value": 217, "parsing": false}	0	570	36
36730	integer_group	218	218	number	{"type": "number", "value": 218, "parsing": false}	0	571	36
36731	integer_group	219	219	number	{"type": "number", "value": 219, "parsing": false}	0	572	36
36732	integer_group	220	220	number	{"type": "number", "value": 220, "parsing": false}	0	573	36
37793	solutionPathColor	#0d1d18	859416	color	{"type": "color", "value": "#0d1d18"}	0	808	24
37794	cellSize	35	35	number	{"type": "number", "value": 35}	1	808	24
37795	solutionPathColor	#0d1d18	859416	color	{"type": "color", "value": "#0d1d18"}	0	809	24
37796	cellSize	36	36	number	{"type": "number", "value": 36}	1	809	24
37797	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	810	28
37798	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	810	28
37799	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	810	28
37800	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	810	28
37801	DEGREE2_COEFF	31	31	number	{"type": "number", "value": 31}	4	810	28
37802	CHILDREN	[4,6,-5,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,-5,-7]"}	5	810	28
37803	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	810	28
37804	integer_group	8353	8353	number	{"type": "number", "value": 8353}	0	811	36
37805	integer_group	83532	83532	number	{"type": "number", "value": 83532}	0	812	36
37835	CHILDREN	[4,6]	\N	javascript	{"type": "javascript", "value": "[4,6]"}	5	818	28
37809	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	815	28
37810	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	815	28
37811	COLOR2	#4124cc	4269260	color	{"type": "color", "value": "#4124cc"}	2	815	28
37812	TRAPEZOIDAL_SECTIONS	13	13	number	{"type": "number", "value": 13}	3	815	28
37813	DEGREE2_COEFF	33	33	number	{"type": "number", "value": 33}	4	815	28
37814	CHILDREN	[4,6,8,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,8,-7]"}	5	815	28
37815	DEGREE1_COEFF	14	14	number	{"type": "number", "value": 14}	6	815	28
37816	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	816	28
37817	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	816	28
37818	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	816	28
37819	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	816	28
37820	DEGREE2_COEFF	32	32	number	{"type": "number", "value": 32}	4	816	28
37821	CHILDREN	[4,6,-5,-7]	\N	javascript	{"type": "javascript", "value": "[4,6,-5,-7]"}	5	816	28
37822	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	816	28
37830	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	818	28
37831	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	818	28
37832	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	818	28
37833	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	818	28
37834	DEGREE2_COEFF	30	30	number	{"type": "number", "value": 30}	4	818	28
37836	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	818	28
37837	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	819	28
37838	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	819	28
37839	COLOR2	#9162af	9527983	color	{"type": "color", "value": "#9162af"}	2	819	28
37840	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	819	28
37841	DEGREE2_COEFF	30	30	number	{"type": "number", "value": 30}	4	819	28
37842	CHILDREN	[4,6]	\N	javascript	{"type": "javascript", "value": "[4,6]"}	5	819	28
37843	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	819	28
37844	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	820	28
37845	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	820	28
37846	COLOR2	#9162af	9527983	color	{"type": "color", "value": "#9162af"}	2	820	28
37847	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	820	28
37848	DEGREE2_COEFF	30	30	number	{"type": "number", "value": 30}	4	820	28
37849	CHILDREN	[4,6,-2]	\N	javascript	{"type": "javascript", "value": "[4,6,-2]"}	5	820	28
37850	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	820	28
37851	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	821	28
37852	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	821	28
37853	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	821	28
37854	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	821	28
37855	DEGREE2_COEFF	30	30	number	{"type": "number", "value": 30}	4	821	28
37856	CHILDREN	[4,3]	\N	javascript	{"type": "javascript", "value": "[4,3]"}	5	821	28
37857	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	821	28
37858	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	822	28
37859	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	822	28
37860	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	822	28
37861	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	822	28
37862	DEGREE2_COEFF	30	30	number	{"type": "number", "value": 30}	4	822	28
37863	CHILDREN	[4,-6]	\N	javascript	{"type": "javascript", "value": "[4,-6]"}	5	822	28
37864	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	822	28
37865	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	823	28
37866	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	823	28
37867	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	823	28
37868	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	823	28
37869	DEGREE2_COEFF	16	16	number	{"type": "number", "value": 16}	4	823	28
37870	CHILDREN	[4,-6]	\N	javascript	{"type": "javascript", "value": "[4,-6]"}	5	823	28
37871	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	823	28
37872	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	824	28
37873	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	824	28
37874	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	824	28
37875	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	824	28
37876	DEGREE2_COEFF	17	17	number	{"type": "number", "value": 17}	4	824	28
37877	CHILDREN	[4,-6]	\N	javascript	{"type": "javascript", "value": "[4,-6]"}	5	824	28
37878	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	824	28
37879	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	825	28
37880	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	825	28
37881	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	825	28
37882	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	825	28
37883	DEGREE2_COEFF	18	18	number	{"type": "number", "value": 18}	4	825	28
37884	CHILDREN	[4,-6]	\N	javascript	{"type": "javascript", "value": "[4,-6]"}	5	825	28
37885	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	825	28
37886	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	826	28
37887	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	826	28
37888	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	826	28
37889	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	826	28
37890	DEGREE2_COEFF	19	19	number	{"type": "number", "value": 19}	4	826	28
37891	CHILDREN	[4,-6]	\N	javascript	{"type": "javascript", "value": "[4,-6]"}	5	826	28
37892	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	826	28
37893	NUM_ITERATIONS	5	5	number	{"type": "number", "value": 5}	0	827	28
37894	COLOR1	#785A3C	7887420	color	{"type": "color", "value": "#785A3C"}	1	827	28
37895	COLOR2	#a653d9	10900441	color	{"type": "color", "value": "#a653d9"}	2	827	28
37896	TRAPEZOIDAL_SECTIONS	15	15	number	{"type": "number", "value": 15}	3	827	28
37897	DEGREE2_COEFF	20	20	number	{"type": "number", "value": 20}	4	827	28
37898	CHILDREN	[4,-6]	\N	javascript	{"type": "javascript", "value": "[4,-6]"}	5	827	28
37899	DEGREE1_COEFF	30	30	number	{"type": "number", "value": 30}	6	827	28
37901	integer_group	24354	24354	number	{"type": "number", "value": 24354}	0	829	36
37902	integer_group	24356	24356	number	{"type": "number", "value": 24356}	0	830	36
37903	integer_group	24357	24357	number	{"type": "number", "value": 24357}	0	831	36
37904	integer_group	24358	24358	number	{"type": "number", "value": 24358}	0	832	36
37905	integer_group	24359	24359	number	{"type": "number", "value": 24359}	0	833	36
37906	integer_group	24360	24360	number	{"type": "number", "value": 24360}	0	834	36
37907	integer_group	24361	24361	number	{"type": "number", "value": 24361}	0	835	36
37908	integer_group	24362	24362	number	{"type": "number", "value": 24362}	0	836	36
37909	integer_group	24363	24363	number	{"type": "number", "value": 24363}	0	837	36
37910	integer_group	24364	24364	number	{"type": "number", "value": 24364}	0	838	36
37911	integer_group	24365	24365	number	{"type": "number", "value": 24365}	0	839	36
37912	integer_group	24366	24366	number	{"type": "number", "value": 24366}	0	840	36
37913	integer_group	24367	24367	number	{"type": "number", "value": 24367}	0	841	36
37914	integer_group	24368	24368	number	{"type": "number", "value": 24368}	0	842	36
37915	integer_group	24369	24369	number	{"type": "number", "value": 24369}	0	843	36
37916	integer_group	24370	24370	number	{"type": "number", "value": 24370}	0	844	36
37947	ry	2	2	number	{"type": "number", "value": 2}	1	850	39
37948	speed_coefficient	5	5	number	{"type": "number", "value": 5}	2	850	39
37949	rx	2	2	number	{"type": "number", "value": 2}	0	851	39
37943	rx	2	2	number	{"type": "number", "value": 2}	0	849	39
37944	ry	2	2	number	{"type": "number", "value": 2}	1	849	39
37945	speed_coefficient	1	1	number	{"type": "number", "value": 1}	2	849	39
37946	rx	2	2	number	{"type": "number", "value": 2}	0	850	39
37950	ry	2	2	number	{"type": "number", "value": 2}	1	851	39
37951	speed_coefficient	15	15	number	{"type": "number", "value": 15}	2	851	39
37952	rx	2	2	number	{"type": "number", "value": 2}	0	852	39
37953	ry	6	6	number	{"type": "number", "value": 6}	1	852	39
37954	speed_coefficient	12	12	number	{"type": "number", "value": 12}	2	852	39
37955	x_min	-30	-30	number	{"type": "number", "value": -30}	0	853	27
37956	func1	(1/x) cos(2x) + (1/2x) cos(16x)	\N	math	{"type": "math", "value": "(1/x) cos(2x) + (1/2x) cos(16x)"}	1	853	27
37957	x_max	30	30	number	{"type": "number", "value": 30}	2	853	27
37958	integer_group	1235	1235	number	{"type": "number", "value": 1235}	0	854	36
37959	integer_group	8932	8932	number	{"type": "number", "value": 8932}	0	855	36
37960	integer_group	823	823	number	{"type": "number", "value": 823}	0	856	36
38025	y^4	0	0	number	{"type": "number", "value": 0}	2	862	33
38026	y^5	0	0	number	{"type": "number", "value": 0}	3	862	33
38027	x^2y	0	0	number	{"type": "number", "value": 0}	4	862	33
38028	x^3y	0	0	number	{"type": "number", "value": 0}	5	862	33
38029	y^3	0	0	number	{"type": "number", "value": 0}	6	862	33
38030	xy^3	0	0	number	{"type": "number", "value": 0}	7	862	33
38031	xy^2	0	0	number	{"type": "number", "value": 0}	8	862	33
38032	x^3	0	0	number	{"type": "number", "value": 0}	9	862	33
38033	x^2	0	0	number	{"type": "number", "value": 0}	10	862	33
38034	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	862	33
38035	x^4	-3	-3	number	{"type": "number", "value": -3}	12	862	33
38036	xy^4	0	0	number	{"type": "number", "value": 0}	13	862	33
38037	xy	0	0	number	{"type": "number", "value": 0}	14	862	33
38038	x^5	0	0	number	{"type": "number", "value": 0}	15	862	33
38039	x^2y^3	0	0	number	{"type": "number", "value": 0}	16	862	33
38040	x^2y^2	0	0	number	{"type": "number", "value": 0}	17	862	33
38041	x^4y	-5	-5	number	{"type": "number", "value": -5}	18	862	33
38042	y^2	0	0	number	{"type": "number", "value": 0}	19	862	33
38043	xy	0	0	number	{"type": "number", "value": 0}	0	863	33
38044	y^2	0	0	number	{"type": "number", "value": 0}	1	863	33
38045	y^4	-4	-4	number	{"type": "number", "value": -4}	2	863	33
38046	y^5	-6	-6	number	{"type": "number", "value": -6}	3	863	33
38047	x^2y	0	0	number	{"type": "number", "value": 0}	4	863	33
38048	x^3y	0	0	number	{"type": "number", "value": 0}	5	863	33
38049	y^3	0	0	number	{"type": "number", "value": 0}	6	863	33
38021	integer_group	855	855	number	{"type": "number", "value": 855}	0	860	36
38022	integer_group	420	420	number	{"type": "number", "value": 420}	0	861	36
38023	x	0	0	number	{"type": "number", "value": 0}	0	862	33
38024	y	0	0	number	{"type": "number", "value": 0}	1	862	33
38050	xy^3	0	0	number	{"type": "number", "value": 0}	7	863	33
38051	xy^2	0	0	number	{"type": "number", "value": 0}	8	863	33
38052	x^3	0	0	number	{"type": "number", "value": 0}	9	863	33
38053	x^2	0	0	number	{"type": "number", "value": 0}	10	863	33
38054	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	863	33
38055	x^4	-3	-3	number	{"type": "number", "value": -3}	12	863	33
38056	x^5	0	0	number	{"type": "number", "value": 0}	13	863	33
38057	xy^4	0	0	number	{"type": "number", "value": 0}	14	863	33
38058	y	0	0	number	{"type": "number", "value": 0}	15	863	33
38063	x	0	0	number	{"type": "number", "value": 0}	0	864	33
38064	y	0	0	number	{"type": "number", "value": 0}	1	864	33
38065	y^4	-4	-4	number	{"type": "number", "value": -4}	2	864	33
38066	y^5	-6	-6	number	{"type": "number", "value": -6}	3	864	33
38067	x^2y	0	0	number	{"type": "number", "value": 0}	4	864	33
38068	x^3y	0	0	number	{"type": "number", "value": 0}	5	864	33
38069	y^3	5	5	number	{"type": "number", "value": 5}	6	864	33
38070	xy^3	7	7	number	{"type": "number", "value": 7}	7	864	33
38071	xy^2	0	0	number	{"type": "number", "value": 0}	8	864	33
38072	x^3	0	0	number	{"type": "number", "value": 0}	9	864	33
38073	xy	0	0	number	{"type": "number", "value": 0}	10	864	33
38074	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	864	33
38075	y^2	0	0	number	{"type": "number", "value": 0}	12	864	33
38076	xy^4	0	0	number	{"type": "number", "value": 0}	13	864	33
38077	x^2	0	0	number	{"type": "number", "value": 0}	14	864	33
38078	x^5	0	0	number	{"type": "number", "value": 0}	15	864	33
38079	x^2y^3	0	0	number	{"type": "number", "value": 0}	16	864	33
38080	x^2y^2	0	0	number	{"type": "number", "value": 0}	17	864	33
38081	x^4y	-5	-5	number	{"type": "number", "value": -5}	18	864	33
38082	x^4	-3	-3	number	{"type": "number", "value": -3}	19	864	33
38083	x^4	-3	-3	number	{"type": "number", "value": -3}	0	865	33
38084	x^2	0	0	number	{"type": "number", "value": 0}	1	865	33
38085	y^4	-4	-4	number	{"type": "number", "value": -4}	2	865	33
38086	y^5	1	1	number	{"type": "number", "value": 1}	3	865	33
38087	x^2y	0	0	number	{"type": "number", "value": 0}	4	865	33
38088	x^3y	0	0	number	{"type": "number", "value": 0}	5	865	33
38089	y^3	5	5	number	{"type": "number", "value": 5}	6	865	33
38090	xy^3	7	7	number	{"type": "number", "value": 7}	7	865	33
38091	xy^2	0	0	number	{"type": "number", "value": 0}	8	865	33
38092	x^3	0	0	number	{"type": "number", "value": 0}	9	865	33
38093	xy	0	0	number	{"type": "number", "value": 0}	10	865	33
38094	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	865	33
38095	y^2	0	0	number	{"type": "number", "value": 0}	12	865	33
38096	x^5	0	0	number	{"type": "number", "value": 0}	13	865	33
38097	xy^4	0	0	number	{"type": "number", "value": 0}	14	865	33
38098	y	0	0	number	{"type": "number", "value": 0}	15	865	33
38099	x	0	0	number	{"type": "number", "value": 0}	16	865	33
38100	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	865	33
38101	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	865	33
38102	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	865	33
38103	x^4	-3	-3	number	{"type": "number", "value": -3}	0	866	33
38104	x^2	0	0	number	{"type": "number", "value": 0}	1	866	33
38105	y^4	-4	-4	number	{"type": "number", "value": -4}	2	866	33
38106	y^5	2	2	number	{"type": "number", "value": 2}	3	866	33
38107	x^2y	0	0	number	{"type": "number", "value": 0}	4	866	33
38108	x^3y	0	0	number	{"type": "number", "value": 0}	5	866	33
38109	y^3	5	5	number	{"type": "number", "value": 5}	6	866	33
38110	xy^3	7	7	number	{"type": "number", "value": 7}	7	866	33
38111	xy^2	0	0	number	{"type": "number", "value": 0}	8	866	33
38112	x^3	0	0	number	{"type": "number", "value": 0}	9	866	33
38113	xy	0	0	number	{"type": "number", "value": 0}	10	866	33
38114	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	866	33
38115	y^2	0	0	number	{"type": "number", "value": 0}	12	866	33
38116	x^5	0	0	number	{"type": "number", "value": 0}	13	866	33
38117	xy^4	0	0	number	{"type": "number", "value": 0}	14	866	33
38118	y	0	0	number	{"type": "number", "value": 0}	15	866	33
38119	x	0	0	number	{"type": "number", "value": 0}	16	866	33
38120	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	866	33
38121	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	866	33
38122	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	866	33
38123	x^4	-3	-3	number	{"type": "number", "value": -3}	0	867	33
38124	x^2	0	0	number	{"type": "number", "value": 0}	1	867	33
38125	y^4	-4	-4	number	{"type": "number", "value": -4}	2	867	33
38126	y^5	3	3	number	{"type": "number", "value": 3}	3	867	33
38127	x^2y	0	0	number	{"type": "number", "value": 0}	4	867	33
38128	x^3y	0	0	number	{"type": "number", "value": 0}	5	867	33
38129	y^3	5	5	number	{"type": "number", "value": 5}	6	867	33
38130	xy^3	7	7	number	{"type": "number", "value": 7}	7	867	33
38131	xy^2	0	0	number	{"type": "number", "value": 0}	8	867	33
38132	x^3	0	0	number	{"type": "number", "value": 0}	9	867	33
38133	xy	0	0	number	{"type": "number", "value": 0}	10	867	33
38134	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	867	33
38135	y^2	0	0	number	{"type": "number", "value": 0}	12	867	33
38136	x^5	0	0	number	{"type": "number", "value": 0}	13	867	33
38137	xy^4	0	0	number	{"type": "number", "value": 0}	14	867	33
38138	y	0	0	number	{"type": "number", "value": 0}	15	867	33
38139	x	0	0	number	{"type": "number", "value": 0}	16	867	33
38140	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	867	33
38141	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	867	33
38142	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	867	33
38143	x^4	-3	-3	number	{"type": "number", "value": -3}	0	868	33
38144	x^2	0	0	number	{"type": "number", "value": 0}	1	868	33
38145	y^4	-4	-4	number	{"type": "number", "value": -4}	2	868	33
38146	y^5	4	4	number	{"type": "number", "value": 4}	3	868	33
38147	x^2y	0	0	number	{"type": "number", "value": 0}	4	868	33
38148	x^3y	0	0	number	{"type": "number", "value": 0}	5	868	33
38149	y^3	5	5	number	{"type": "number", "value": 5}	6	868	33
38150	xy^3	7	7	number	{"type": "number", "value": 7}	7	868	33
38151	xy^2	0	0	number	{"type": "number", "value": 0}	8	868	33
38152	x^3	0	0	number	{"type": "number", "value": 0}	9	868	33
38153	xy	0	0	number	{"type": "number", "value": 0}	10	868	33
38154	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	868	33
38155	y^2	0	0	number	{"type": "number", "value": 0}	12	868	33
38156	x^5	0	0	number	{"type": "number", "value": 0}	13	868	33
38157	xy^4	0	0	number	{"type": "number", "value": 0}	14	868	33
38158	y	0	0	number	{"type": "number", "value": 0}	15	868	33
38159	x	0	0	number	{"type": "number", "value": 0}	16	868	33
38160	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	868	33
38161	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	868	33
38162	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	868	33
38163	x^4	-3	-3	number	{"type": "number", "value": -3}	0	869	33
38164	x^2	0	0	number	{"type": "number", "value": 0}	1	869	33
38165	y^4	-4	-4	number	{"type": "number", "value": -4}	2	869	33
38166	y^5	5	5	number	{"type": "number", "value": 5}	3	869	33
38167	x^2y	0	0	number	{"type": "number", "value": 0}	4	869	33
38168	x^3y	0	0	number	{"type": "number", "value": 0}	5	869	33
38169	y^3	5	5	number	{"type": "number", "value": 5}	6	869	33
38170	xy^3	7	7	number	{"type": "number", "value": 7}	7	869	33
38171	xy^2	0	0	number	{"type": "number", "value": 0}	8	869	33
38172	x^3	0	0	number	{"type": "number", "value": 0}	9	869	33
38173	xy	0	0	number	{"type": "number", "value": 0}	10	869	33
38174	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	869	33
38175	y^2	0	0	number	{"type": "number", "value": 0}	12	869	33
38176	x^5	0	0	number	{"type": "number", "value": 0}	13	869	33
38177	xy^4	0	0	number	{"type": "number", "value": 0}	14	869	33
38178	y	0	0	number	{"type": "number", "value": 0}	15	869	33
38179	x	0	0	number	{"type": "number", "value": 0}	16	869	33
38180	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	869	33
38181	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	869	33
38182	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	869	33
38183	x^4	-3	-3	number	{"type": "number", "value": -3}	0	870	33
38184	x^2	0	0	number	{"type": "number", "value": 0}	1	870	33
38185	y^4	-4	-4	number	{"type": "number", "value": -4}	2	870	33
38186	y^5	6	6	number	{"type": "number", "value": 6}	3	870	33
38187	x^2y	0	0	number	{"type": "number", "value": 0}	4	870	33
38188	x^3y	0	0	number	{"type": "number", "value": 0}	5	870	33
38189	y^3	5	5	number	{"type": "number", "value": 5}	6	870	33
38190	xy^3	7	7	number	{"type": "number", "value": 7}	7	870	33
38191	xy^2	0	0	number	{"type": "number", "value": 0}	8	870	33
38192	x^3	0	0	number	{"type": "number", "value": 0}	9	870	33
38193	xy	0	0	number	{"type": "number", "value": 0}	10	870	33
38194	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	870	33
38195	y^2	0	0	number	{"type": "number", "value": 0}	12	870	33
38196	x^5	0	0	number	{"type": "number", "value": 0}	13	870	33
38197	xy^4	0	0	number	{"type": "number", "value": 0}	14	870	33
38198	y	0	0	number	{"type": "number", "value": 0}	15	870	33
38199	x	0	0	number	{"type": "number", "value": 0}	16	870	33
38200	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	870	33
38201	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	870	33
38202	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	870	33
38203	x^4	-3	-3	number	{"type": "number", "value": -3}	0	871	33
38204	x^2	0	0	number	{"type": "number", "value": 0}	1	871	33
38205	y^4	-4	-4	number	{"type": "number", "value": -4}	2	871	33
38206	y^5	7	7	number	{"type": "number", "value": 7}	3	871	33
38207	x^2y	0	0	number	{"type": "number", "value": 0}	4	871	33
38208	x^3y	0	0	number	{"type": "number", "value": 0}	5	871	33
38209	y^3	5	5	number	{"type": "number", "value": 5}	6	871	33
38210	xy^3	7	7	number	{"type": "number", "value": 7}	7	871	33
38211	xy^2	0	0	number	{"type": "number", "value": 0}	8	871	33
38212	x^3	0	0	number	{"type": "number", "value": 0}	9	871	33
38213	xy	0	0	number	{"type": "number", "value": 0}	10	871	33
38214	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	871	33
38215	y^2	0	0	number	{"type": "number", "value": 0}	12	871	33
38216	x^5	0	0	number	{"type": "number", "value": 0}	13	871	33
38217	xy^4	0	0	number	{"type": "number", "value": 0}	14	871	33
38218	y	0	0	number	{"type": "number", "value": 0}	15	871	33
38219	x	0	0	number	{"type": "number", "value": 0}	16	871	33
38220	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	871	33
38221	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	871	33
38222	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	871	33
38223	x^4	-3	-3	number	{"type": "number", "value": -3}	0	872	33
38224	x^2	0	0	number	{"type": "number", "value": 0}	1	872	33
38225	y^4	-4	-4	number	{"type": "number", "value": -4}	2	872	33
38226	y^5	8	8	number	{"type": "number", "value": 8}	3	872	33
38227	x^2y	0	0	number	{"type": "number", "value": 0}	4	872	33
38228	x^3y	0	0	number	{"type": "number", "value": 0}	5	872	33
38229	y^3	5	5	number	{"type": "number", "value": 5}	6	872	33
38230	xy^3	7	7	number	{"type": "number", "value": 7}	7	872	33
38231	xy^2	0	0	number	{"type": "number", "value": 0}	8	872	33
38232	x^3	0	0	number	{"type": "number", "value": 0}	9	872	33
38233	xy	0	0	number	{"type": "number", "value": 0}	10	872	33
38234	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	872	33
38235	y^2	0	0	number	{"type": "number", "value": 0}	12	872	33
38236	x^5	0	0	number	{"type": "number", "value": 0}	13	872	33
38237	xy^4	0	0	number	{"type": "number", "value": 0}	14	872	33
38238	y	0	0	number	{"type": "number", "value": 0}	15	872	33
38239	x	0	0	number	{"type": "number", "value": 0}	16	872	33
38240	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	872	33
38241	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	872	33
38242	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	872	33
38243	x^4	-3	-3	number	{"type": "number", "value": -3}	0	873	33
38244	x^2	0	0	number	{"type": "number", "value": 0}	1	873	33
38245	y^4	-4	-4	number	{"type": "number", "value": -4}	2	873	33
38246	y^5	9	9	number	{"type": "number", "value": 9}	3	873	33
38247	x^2y	0	0	number	{"type": "number", "value": 0}	4	873	33
38248	x^3y	0	0	number	{"type": "number", "value": 0}	5	873	33
38249	y^3	5	5	number	{"type": "number", "value": 5}	6	873	33
38250	xy^3	7	7	number	{"type": "number", "value": 7}	7	873	33
38251	xy^2	0	0	number	{"type": "number", "value": 0}	8	873	33
38252	x^3	0	0	number	{"type": "number", "value": 0}	9	873	33
38253	xy	0	0	number	{"type": "number", "value": 0}	10	873	33
38254	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	873	33
38255	y^2	0	0	number	{"type": "number", "value": 0}	12	873	33
38256	x^5	0	0	number	{"type": "number", "value": 0}	13	873	33
38257	xy^4	0	0	number	{"type": "number", "value": 0}	14	873	33
38258	y	0	0	number	{"type": "number", "value": 0}	15	873	33
38259	x	0	0	number	{"type": "number", "value": 0}	16	873	33
38260	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	873	33
38261	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	873	33
38262	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	873	33
38263	x^4	-3	-3	number	{"type": "number", "value": -3}	0	874	33
38264	x^2	0	0	number	{"type": "number", "value": 0}	1	874	33
38265	y^4	-4	-4	number	{"type": "number", "value": -4}	2	874	33
38266	y^5	10	10	number	{"type": "number", "value": 10}	3	874	33
38267	x^2y	0	0	number	{"type": "number", "value": 0}	4	874	33
38268	x^3y	0	0	number	{"type": "number", "value": 0}	5	874	33
38269	y^3	5	5	number	{"type": "number", "value": 5}	6	874	33
38270	xy^3	7	7	number	{"type": "number", "value": 7}	7	874	33
38271	xy^2	0	0	number	{"type": "number", "value": 0}	8	874	33
38272	x^3	0	0	number	{"type": "number", "value": 0}	9	874	33
38273	xy	0	0	number	{"type": "number", "value": 0}	10	874	33
38274	x^3y^2	0	0	number	{"type": "number", "value": 0}	11	874	33
38275	y^2	0	0	number	{"type": "number", "value": 0}	12	874	33
38276	x^5	0	0	number	{"type": "number", "value": 0}	13	874	33
38277	xy^4	0	0	number	{"type": "number", "value": 0}	14	874	33
38278	y	0	0	number	{"type": "number", "value": 0}	15	874	33
38279	x	0	0	number	{"type": "number", "value": 0}	16	874	33
38280	x^2y^3	0	0	number	{"type": "number", "value": 0}	17	874	33
38281	x^2y^2	0	0	number	{"type": "number", "value": 0}	18	874	33
38282	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	874	33
38283	x^4	-3	-3	number	{"type": "number", "value": -3}	0	875	33
38284	x^2	1	1	number	{"type": "number", "value": 1}	1	875	33
38285	y^4	-2	-2	number	{"type": "number", "value": -2}	2	875	33
38286	y^5	-20	-20	number	{"type": "number", "value": -20}	3	875	33
38287	x^2y	20	20	number	{"type": "number", "value": 20}	4	875	33
38288	x^3y	2	2	number	{"type": "number", "value": 2}	5	875	33
38289	y^3	3	3	number	{"type": "number", "value": 3}	6	875	33
38290	xy^3	7	7	number	{"type": "number", "value": 7}	7	875	33
38291	xy^2	0	0	number	{"type": "number", "value": 0}	8	875	33
38292	x^3	1	1	number	{"type": "number", "value": 1}	9	875	33
38293	xy	1	1	number	{"type": "number", "value": 1}	10	875	33
38294	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	875	33
38295	y^2	2	2	number	{"type": "number", "value": 2}	12	875	33
38296	x^5	0	0	number	{"type": "number", "value": 0}	13	875	33
38297	xy^4	0	0	number	{"type": "number", "value": 0}	14	875	33
38298	y	3	3	number	{"type": "number", "value": 3}	15	875	33
38299	x	5	5	number	{"type": "number", "value": 5}	16	875	33
38300	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	875	33
38301	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	875	33
38302	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	875	33
38303	x^4	-3	-3	number	{"type": "number", "value": -3}	0	876	33
38304	x^2	1	1	number	{"type": "number", "value": 1}	1	876	33
38305	y^4	-2	-2	number	{"type": "number", "value": -2}	2	876	33
38306	y^5	-19	-19	number	{"type": "number", "value": -19}	3	876	33
38307	x^2y	20	20	number	{"type": "number", "value": 20}	4	876	33
38308	x^3y	2	2	number	{"type": "number", "value": 2}	5	876	33
38309	y^3	3	3	number	{"type": "number", "value": 3}	6	876	33
38310	xy^3	7	7	number	{"type": "number", "value": 7}	7	876	33
38311	xy^2	0	0	number	{"type": "number", "value": 0}	8	876	33
38312	x^3	1	1	number	{"type": "number", "value": 1}	9	876	33
38313	xy	1	1	number	{"type": "number", "value": 1}	10	876	33
38314	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	876	33
38315	y^2	2	2	number	{"type": "number", "value": 2}	12	876	33
38316	x^5	0	0	number	{"type": "number", "value": 0}	13	876	33
38317	xy^4	0	0	number	{"type": "number", "value": 0}	14	876	33
38318	y	3	3	number	{"type": "number", "value": 3}	15	876	33
38319	x	5	5	number	{"type": "number", "value": 5}	16	876	33
38320	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	876	33
38321	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	876	33
38322	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	876	33
38323	x^4	-3	-3	number	{"type": "number", "value": -3}	0	877	33
38324	x^2	1	1	number	{"type": "number", "value": 1}	1	877	33
38325	y^4	-2	-2	number	{"type": "number", "value": -2}	2	877	33
38326	y^5	-18	-18	number	{"type": "number", "value": -18}	3	877	33
38327	x^2y	20	20	number	{"type": "number", "value": 20}	4	877	33
38328	x^3y	2	2	number	{"type": "number", "value": 2}	5	877	33
38329	y^3	3	3	number	{"type": "number", "value": 3}	6	877	33
38330	xy^3	7	7	number	{"type": "number", "value": 7}	7	877	33
38331	xy^2	0	0	number	{"type": "number", "value": 0}	8	877	33
38332	x^3	1	1	number	{"type": "number", "value": 1}	9	877	33
38333	xy	1	1	number	{"type": "number", "value": 1}	10	877	33
38334	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	877	33
38335	y^2	2	2	number	{"type": "number", "value": 2}	12	877	33
38336	x^5	0	0	number	{"type": "number", "value": 0}	13	877	33
38337	xy^4	0	0	number	{"type": "number", "value": 0}	14	877	33
38338	y	3	3	number	{"type": "number", "value": 3}	15	877	33
38339	x	5	5	number	{"type": "number", "value": 5}	16	877	33
38340	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	877	33
38341	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	877	33
38342	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	877	33
38343	x^4	-3	-3	number	{"type": "number", "value": -3}	0	878	33
38344	x^2	1	1	number	{"type": "number", "value": 1}	1	878	33
38345	y^4	-2	-2	number	{"type": "number", "value": -2}	2	878	33
38346	y^5	-17	-17	number	{"type": "number", "value": -17}	3	878	33
38347	x^2y	20	20	number	{"type": "number", "value": 20}	4	878	33
38348	x^3y	2	2	number	{"type": "number", "value": 2}	5	878	33
38349	y^3	3	3	number	{"type": "number", "value": 3}	6	878	33
38350	xy^3	7	7	number	{"type": "number", "value": 7}	7	878	33
38351	xy^2	0	0	number	{"type": "number", "value": 0}	8	878	33
38352	x^3	1	1	number	{"type": "number", "value": 1}	9	878	33
38353	xy	1	1	number	{"type": "number", "value": 1}	10	878	33
38354	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	878	33
38355	y^2	2	2	number	{"type": "number", "value": 2}	12	878	33
38356	x^5	0	0	number	{"type": "number", "value": 0}	13	878	33
38357	xy^4	0	0	number	{"type": "number", "value": 0}	14	878	33
38358	y	3	3	number	{"type": "number", "value": 3}	15	878	33
38359	x	5	5	number	{"type": "number", "value": 5}	16	878	33
38360	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	878	33
38361	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	878	33
38362	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	878	33
38363	x^4	-3	-3	number	{"type": "number", "value": -3}	0	879	33
38364	x^2	1	1	number	{"type": "number", "value": 1}	1	879	33
38365	y^4	-2	-2	number	{"type": "number", "value": -2}	2	879	33
38366	y^5	-16	-16	number	{"type": "number", "value": -16}	3	879	33
38367	x^2y	20	20	number	{"type": "number", "value": 20}	4	879	33
38368	x^3y	2	2	number	{"type": "number", "value": 2}	5	879	33
38369	y^3	3	3	number	{"type": "number", "value": 3}	6	879	33
38370	xy^3	7	7	number	{"type": "number", "value": 7}	7	879	33
38371	xy^2	0	0	number	{"type": "number", "value": 0}	8	879	33
38372	x^3	1	1	number	{"type": "number", "value": 1}	9	879	33
38373	xy	1	1	number	{"type": "number", "value": 1}	10	879	33
38374	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	879	33
38375	y^2	2	2	number	{"type": "number", "value": 2}	12	879	33
38376	x^5	0	0	number	{"type": "number", "value": 0}	13	879	33
38377	xy^4	0	0	number	{"type": "number", "value": 0}	14	879	33
38378	y	3	3	number	{"type": "number", "value": 3}	15	879	33
38379	x	5	5	number	{"type": "number", "value": 5}	16	879	33
38380	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	879	33
38381	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	879	33
38382	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	879	33
38383	x^4	-3	-3	number	{"type": "number", "value": -3}	0	880	33
38384	x^2	1	1	number	{"type": "number", "value": 1}	1	880	33
38385	y^4	-2	-2	number	{"type": "number", "value": -2}	2	880	33
38386	y^5	-15	-15	number	{"type": "number", "value": -15}	3	880	33
38387	x^2y	20	20	number	{"type": "number", "value": 20}	4	880	33
38388	x^3y	2	2	number	{"type": "number", "value": 2}	5	880	33
38389	y^3	3	3	number	{"type": "number", "value": 3}	6	880	33
38390	xy^3	7	7	number	{"type": "number", "value": 7}	7	880	33
38391	xy^2	0	0	number	{"type": "number", "value": 0}	8	880	33
38392	x^3	1	1	number	{"type": "number", "value": 1}	9	880	33
38393	xy	1	1	number	{"type": "number", "value": 1}	10	880	33
38394	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	880	33
38395	y^2	2	2	number	{"type": "number", "value": 2}	12	880	33
38396	x^5	0	0	number	{"type": "number", "value": 0}	13	880	33
38397	xy^4	0	0	number	{"type": "number", "value": 0}	14	880	33
38398	y	3	3	number	{"type": "number", "value": 3}	15	880	33
38399	x	5	5	number	{"type": "number", "value": 5}	16	880	33
38400	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	880	33
38401	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	880	33
38402	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	880	33
38403	x^4	-3	-3	number	{"type": "number", "value": -3}	0	881	33
38404	x^2	1	1	number	{"type": "number", "value": 1}	1	881	33
38405	y^4	-2	-2	number	{"type": "number", "value": -2}	2	881	33
38406	y^5	-14	-14	number	{"type": "number", "value": -14}	3	881	33
38407	x^2y	20	20	number	{"type": "number", "value": 20}	4	881	33
38408	x^3y	2	2	number	{"type": "number", "value": 2}	5	881	33
38409	y^3	3	3	number	{"type": "number", "value": 3}	6	881	33
38410	xy^3	7	7	number	{"type": "number", "value": 7}	7	881	33
38411	xy^2	0	0	number	{"type": "number", "value": 0}	8	881	33
38412	x^3	1	1	number	{"type": "number", "value": 1}	9	881	33
38413	xy	1	1	number	{"type": "number", "value": 1}	10	881	33
38414	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	881	33
38415	y^2	2	2	number	{"type": "number", "value": 2}	12	881	33
38416	x^5	0	0	number	{"type": "number", "value": 0}	13	881	33
38417	xy^4	0	0	number	{"type": "number", "value": 0}	14	881	33
38418	y	3	3	number	{"type": "number", "value": 3}	15	881	33
38419	x	5	5	number	{"type": "number", "value": 5}	16	881	33
38420	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	881	33
38421	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	881	33
38422	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	881	33
38423	x^4	-3	-3	number	{"type": "number", "value": -3}	0	882	33
38424	x^2	1	1	number	{"type": "number", "value": 1}	1	882	33
38425	y^4	-2	-2	number	{"type": "number", "value": -2}	2	882	33
38426	y^5	-13	-13	number	{"type": "number", "value": -13}	3	882	33
38427	x^2y	20	20	number	{"type": "number", "value": 20}	4	882	33
38428	x^3y	2	2	number	{"type": "number", "value": 2}	5	882	33
38429	y^3	3	3	number	{"type": "number", "value": 3}	6	882	33
38430	xy^3	7	7	number	{"type": "number", "value": 7}	7	882	33
38431	xy^2	0	0	number	{"type": "number", "value": 0}	8	882	33
38432	x^3	1	1	number	{"type": "number", "value": 1}	9	882	33
38433	xy	1	1	number	{"type": "number", "value": 1}	10	882	33
38434	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	882	33
38435	y^2	2	2	number	{"type": "number", "value": 2}	12	882	33
38436	x^5	0	0	number	{"type": "number", "value": 0}	13	882	33
38437	xy^4	0	0	number	{"type": "number", "value": 0}	14	882	33
38438	y	3	3	number	{"type": "number", "value": 3}	15	882	33
38439	x	5	5	number	{"type": "number", "value": 5}	16	882	33
38440	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	882	33
38441	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	882	33
38442	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	882	33
38443	x^4	-3	-3	number	{"type": "number", "value": -3}	0	883	33
38444	x^2	1	1	number	{"type": "number", "value": 1}	1	883	33
38445	y^4	-2	-2	number	{"type": "number", "value": -2}	2	883	33
38446	y^5	-12	-12	number	{"type": "number", "value": -12}	3	883	33
38447	x^2y	20	20	number	{"type": "number", "value": 20}	4	883	33
38448	x^3y	2	2	number	{"type": "number", "value": 2}	5	883	33
38449	y^3	3	3	number	{"type": "number", "value": 3}	6	883	33
38450	xy^3	7	7	number	{"type": "number", "value": 7}	7	883	33
38451	xy^2	0	0	number	{"type": "number", "value": 0}	8	883	33
38452	x^3	1	1	number	{"type": "number", "value": 1}	9	883	33
38453	xy	1	1	number	{"type": "number", "value": 1}	10	883	33
38454	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	883	33
38455	y^2	2	2	number	{"type": "number", "value": 2}	12	883	33
38456	x^5	0	0	number	{"type": "number", "value": 0}	13	883	33
38457	xy^4	0	0	number	{"type": "number", "value": 0}	14	883	33
38458	y	3	3	number	{"type": "number", "value": 3}	15	883	33
38459	x	5	5	number	{"type": "number", "value": 5}	16	883	33
38460	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	883	33
38461	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	883	33
38462	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	883	33
38463	x^4	-3	-3	number	{"type": "number", "value": -3}	0	884	33
38464	x^2	1	1	number	{"type": "number", "value": 1}	1	884	33
38465	y^4	-2	-2	number	{"type": "number", "value": -2}	2	884	33
38466	y^5	-11	-11	number	{"type": "number", "value": -11}	3	884	33
38467	x^2y	20	20	number	{"type": "number", "value": 20}	4	884	33
38468	x^3y	2	2	number	{"type": "number", "value": 2}	5	884	33
38469	y^3	3	3	number	{"type": "number", "value": 3}	6	884	33
38470	xy^3	7	7	number	{"type": "number", "value": 7}	7	884	33
38471	xy^2	0	0	number	{"type": "number", "value": 0}	8	884	33
38472	x^3	1	1	number	{"type": "number", "value": 1}	9	884	33
38473	xy	1	1	number	{"type": "number", "value": 1}	10	884	33
38474	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	884	33
38475	y^2	2	2	number	{"type": "number", "value": 2}	12	884	33
38476	x^5	0	0	number	{"type": "number", "value": 0}	13	884	33
38477	xy^4	0	0	number	{"type": "number", "value": 0}	14	884	33
38478	y	3	3	number	{"type": "number", "value": 3}	15	884	33
38479	x	5	5	number	{"type": "number", "value": 5}	16	884	33
38480	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	884	33
38481	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	884	33
38482	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	884	33
38483	x^4	-3	-3	number	{"type": "number", "value": -3}	0	885	33
38484	x^2	1	1	number	{"type": "number", "value": 1}	1	885	33
38485	y^4	-2	-2	number	{"type": "number", "value": -2}	2	885	33
38486	y^5	-10	-10	number	{"type": "number", "value": -10}	3	885	33
38487	x^2y	20	20	number	{"type": "number", "value": 20}	4	885	33
38488	x^3y	2	2	number	{"type": "number", "value": 2}	5	885	33
38489	y^3	3	3	number	{"type": "number", "value": 3}	6	885	33
38490	xy^3	7	7	number	{"type": "number", "value": 7}	7	885	33
38491	xy^2	0	0	number	{"type": "number", "value": 0}	8	885	33
38492	x^3	1	1	number	{"type": "number", "value": 1}	9	885	33
38493	xy	1	1	number	{"type": "number", "value": 1}	10	885	33
38494	x^3y^2	1	1	number	{"type": "number", "value": 1}	11	885	33
38495	y^2	2	2	number	{"type": "number", "value": 2}	12	885	33
38496	x^5	0	0	number	{"type": "number", "value": 0}	13	885	33
38497	xy^4	0	0	number	{"type": "number", "value": 0}	14	885	33
38498	y	3	3	number	{"type": "number", "value": 3}	15	885	33
38499	x	5	5	number	{"type": "number", "value": 5}	16	885	33
38500	x^2y^3	1	1	number	{"type": "number", "value": 1}	17	885	33
38501	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	18	885	33
38502	x^4y	-5	-5	number	{"type": "number", "value": -5}	19	885	33
38503	integer_group	410	410	number	{"type": "number", "value": 410}	0	886	36
38504	integer_group	411	411	number	{"type": "number", "value": 411}	0	887	36
38505	integer_group	412	412	number	{"type": "number", "value": 412}	0	888	36
38506	integer_group	413	413	number	{"type": "number", "value": 413}	0	889	36
38507	integer_group	414	414	number	{"type": "number", "value": 414}	0	890	36
38508	integer_group	415	415	number	{"type": "number", "value": 415}	0	891	36
38509	integer_group	416	416	number	{"type": "number", "value": 416}	0	892	36
38510	integer_group	417	417	number	{"type": "number", "value": 417}	0	893	36
38511	integer_group	418	418	number	{"type": "number", "value": 418}	0	894	36
38512	integer_group	419	419	number	{"type": "number", "value": 419}	0	895	36
38513	integer_group	421	421	number	{"type": "number", "value": 421}	0	896	36
38514	integer_group	422	422	number	{"type": "number", "value": 422}	0	897	36
38515	integer_group	423	423	number	{"type": "number", "value": 423}	0	898	36
38516	integer_group	424	424	number	{"type": "number", "value": 424}	0	899	36
38517	integer_group	425	425	number	{"type": "number", "value": 425}	0	900	36
38518	integer_group	426	426	number	{"type": "number", "value": 426}	0	901	36
38519	integer_group	427	427	number	{"type": "number", "value": 427}	0	902	36
38520	integer_group	428	428	number	{"type": "number", "value": 428}	0	903	36
38521	integer_group	429	429	number	{"type": "number", "value": 429}	0	904	36
38522	integer_group	430	430	number	{"type": "number", "value": 430}	0	905	36
38523	x^1y^1	1	1	number	{"type": "number", "value": 1}	0	906	40
38524	x^1	1	1	number	{"type": "number", "value": 1}	1	906	40
38525	x^3	1	1	number	{"type": "number", "value": 1}	2	906	40
38526	x^2	1	1	number	{"type": "number", "value": 1}	3	906	40
38527	x^5	3	3	number	{"type": "number", "value": 3}	4	906	40
38528	y^2	2	2	number	{"type": "number", "value": 2}	5	906	40
38529	zEnd	-7	-7	number	{"type": "number", "value": -7}	6	906	40
38530	y^3	3	3	number	{"type": "number", "value": 3}	7	906	40
38531	y^4	-2	-2	number	{"type": "number", "value": -2}	8	906	40
38532	y^5	5	5	number	{"type": "number", "value": 5}	9	906	40
38533	y^1	1	1	number	{"type": "number", "value": 1}	10	906	40
38534	x^1y^2	0	0	number	{"type": "number", "value": 0}	11	906	40
38535	x^1y^3	7	7	number	{"type": "number", "value": 7}	12	906	40
38536	rotationFactor	0.15	0	number	{"type": "number", "value": 0.15}	13	906	40
38537	x^2y^1	1	1	number	{"type": "number", "value": 1}	14	906	40
38538	x^2y^3	1	1	number	{"type": "number", "value": 1}	15	906	40
38539	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	16	906	40
38540	Z_DEPTH	15	15	number	{"type": "number", "value": 15}	17	906	40
38541	rotationChangeOrder	-2	-2	number	{"type": "number", "value": -2}	18	906	40
38542	radiusX	6	6	number	{"type": "number", "value": 6}	19	906	40
38543	zStart	-0.01	0	number	{"type": "number", "value": -0.01}	20	906	40
38544	x^1y^4	1	1	number	{"type": "number", "value": 1}	21	906	40
38545	x^3y^2	1	1	number	{"type": "number", "value": 1}	22	906	40
38546	x^3y^1	0	0	number	{"type": "number", "value": 0}	23	906	40
38547	x^4y^1	-5	-5	number	{"type": "number", "value": -5}	24	906	40
38548	projection_e	-10	-10	number	{"type": "number", "value": -10}	25	906	40
38549	projection_f	30	30	number	{"type": "number", "value": 30}	26	906	40
38550	x^4	1	1	number	{"type": "number", "value": 1}	27	906	40
38635	x^1y^1	13	13	number	{"type": "number", "value": 13}	0	910	40
38636	x^1	-5	-5	number	{"type": "number", "value": -5}	1	910	40
38637	x^3	7	7	number	{"type": "number", "value": 7}	2	910	40
38638	x^2	9	9	number	{"type": "number", "value": 9}	3	910	40
38639	x^5	0	0	number	{"type": "number", "value": 0}	4	910	40
38640	y^2	2	2	number	{"type": "number", "value": 2}	5	910	40
38641	zEnd	-4	-4	number	{"type": "number", "value": -4}	6	910	40
38642	y^3	3	3	number	{"type": "number", "value": 3}	7	910	40
38643	x^1y^4	1	1	number	{"type": "number", "value": 1}	8	910	40
38644	y^5	5	5	number	{"type": "number", "value": 5}	9	910	40
38645	y^1	1	1	number	{"type": "number", "value": 1}	10	910	40
38646	x^1y^2	0	0	number	{"type": "number", "value": 0}	11	910	40
38647	x^1y^3	7	7	number	{"type": "number", "value": 7}	12	910	40
38648	rotationFactor	0	0	number	{"type": "number", "value": 0}	13	910	40
38649	x^2y^1	1	1	number	{"type": "number", "value": 1}	14	910	40
38650	x^2y^3	1	1	number	{"type": "number", "value": 1}	15	910	40
38651	x^2y^2	-13	-13	number	{"type": "number", "value": -13}	16	910	40
38652	Z_DEPTH	15	15	number	{"type": "number", "value": 15}	17	910	40
38653	rotationChangeOrder	-1	-1	number	{"type": "number", "value": -1}	18	910	40
38654	x^4	4	4	number	{"type": "number", "value": 4}	19	910	40
38655	radiusX	5	5	number	{"type": "number", "value": 5}	20	910	40
38656	zStart	-1	-1	number	{"type": "number", "value": -1}	21	910	40
38657	y^4	-2	-2	number	{"type": "number", "value": -2}	22	910	40
38658	x^3y^2	1	1	number	{"type": "number", "value": 1}	23	910	40
38659	x^3y^1	0	0	number	{"type": "number", "value": 0}	24	910	40
38660	x^4y^1	-5	-5	number	{"type": "number", "value": -5}	25	910	40
38661	projection_f	30	30	number	{"type": "number", "value": 30}	26	910	40
38662	projection_e	-10	-10	number	{"type": "number", "value": -10}	27	910	40
38665	A	7	7	number	{"type": "number", "value": 7}	0	913	41
38666	B	3	3	number	{"type": "number", "value": 3}	1	913	41
38667	SCALE	1	1	number	{"type": "number", "value": 1}	2	913	41
38668	N	10	10	number	{"type": "number", "value": 10}	3	913	41
38669	A	10	10	number	{"type": "number", "value": 10}	0	914	41
38670	B	1	1	number	{"type": "number", "value": 1}	1	914	41
38671	SCALE	1	1	number	{"type": "number", "value": 1}	2	914	41
38672	N	15	15	number	{"type": "number", "value": 15}	3	914	41
38673	A	10	10	number	{"type": "number", "value": 10}	0	915	41
38674	B	1	1	number	{"type": "number", "value": 1}	1	915	41
38675	SCALE	1	1	number	{"type": "number", "value": 1}	2	915	41
38676	N	10	10	number	{"type": "number", "value": 10}	3	915	41
\.


--
-- Name: game_seedvectorparam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_seedvectorparam_id_seq', 38676, true);


--
-- Data for Name: game_zeroplayergame; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_zeroplayergame (id, created, updated, title, description, "scriptType", source, "seedStructure", "mainImage", popularity, category_id, owner_id, parent_id, subtitle) FROM stdin;
25	2016-03-12 13:09:56.958477+00	2016-04-03 04:01:40.468342+00	Neenbox	Tests seed basics by allowing control over the color and size of the box.	text/javascript	var ctx = Canvas.getContext('2d')\nctx.fillStyle = color;\nctx.fillRect(10, 20, width, height);	{\n  "color":{"type":"color", "default":"#cccc00"},\n  "width":{"type":"number", "default":400},\n  "height":{"type":"number", "default":200}\n}		1	7	1	\N	\N
30	2016-03-25 14:20:09.287348+00	2016-04-03 21:47:37.358722+00	Audioviz Test	First test for audioviz components	text/paperscript	var N = 32; // should at least divide 1024\nvar analyser;\nvar viz;\n\n\n// create circle elements\nview.width = Canvas.width;\nview.height = Canvas.height;\n\nvar r = _.min([view.width, view.height]) / 2;\nvar elem = [];\n\n_.each(_.range(N), function(n) {\n\t\n\tvar rfac = ((N-n)/N); \n\t\n\tvar col = new Color();\n\tcol.hue = (360)*(n/N);\n\tcol.saturation = 0.5;\n\tcol.brightness = 1;\n\t\n\tvar el = new Path.Circle({\n\t\tradius: r*rfac,\n\t\tcenter: view.center,\n\t\tfillColor: col,\n\t\tblendMode: 'multiply',\n\t\topacity: 0.5 + ((n/N)/2)\n\t});\n\t\n\telem.push(el)\t\n})\n\n\nview.onFrame = function() {\n\t\n\tanalyser.getByteFrequencyData(fdata);\n\tconsole.log('onFrame');\n  \n\t_.each(elem, function(el, i){\n\t\t\n\t\tvar sum = 0;\n\t\t_.each(_.range( ((bincount/N)*i), ((bincount/N)*(i+1)) ), \n\t\t\tfunction(i) { sum += fdata[i]; });\n\t\t\n\t\tvar fac = ((sum/(bincount/N))/255);\n\n\t\tel.fillColor.saturation = fac;\n\t\tel.fillColor.hue += 3*fac;\n\n\n\t});\n\n}\n\n\nvar audio;\nvar bincount;\nvar fdata;\n\nwindow.start = function() {\n\t\n\taudio = new Audio();\n\taudio.src = '/static/audio/floyd.mp3';\n\taudio.play();\n\n\tvar ctx = new AudioContext();\n\tvar audioSrc = ctx.createMediaElementSource(audio);\n\tanalyser = ctx.createAnalyser();\n\taudioSrc.connect(analyser);\n\tanalyser.connect(ctx.destination);\n\n\tbincount = analyser.frequencyBinCount;\n\tfdata = new Uint8Array(bincount);\n}\n\nwindow.appdestroy = function() {\n\tconsole.log('app destroy');\n\taudio.pause();\n\taudio.src = '';\n    console.log(audio);\n\tdelete audio;\n\twindow.start = null;\n\tview.onFrame = null;\n}	{}	\N	1	4	1	\N	\N
2	2016-02-04 08:16:14.056506+00	2016-04-10 22:24:07.039821+00	3-dimensional "Wolfenstein" Maze Generator	Generates a unique random 3-dimensional maze each instance. Allows user to navigate through maze with old-fashioned "Wolfenstein"-style interface. Collision detection built in.	text/javascript	/*\r\n\r\nMaze Generator pseudo-code\r\n\r\n1. Make the initial cell the current cell and mark it as visited\r\n2. While there are unvisited cells\r\n    1. If the current cell has any neighbors which have not been visited\r\n        1. Choose randomly one of the unvisited neighbors\r\n        2. Push the chosen cell to the stack\r\n        3. Remove the wall between the current cell and the chosen cell\r\n        4. Make the chosen cell the current cell and mark it as visited\r\n    2. Otherwise\r\n        1. Pop a cell from the stack\r\n        2. Make it the current cell\r\n*/\r\n\r\n// class Maze {\r\n\r\nfunction Maze(dimension, x, y, cellSize) {\r\n    this.x = x;\r\n    this.y = y;\r\n    this.map = [];\r\n    this.visited = [];\r\n    this.stack = [];\r\n    this.cellSize = cellSize;\r\n    this.begin = [];\r\n    this.turnArounds = [];\r\n    this.currentPosition = [0, 0];\r\n    this.ballRadius = this.cellSize * 0.4;\r\n    this.wallsRendered = [];\r\n    this.grass;\r\n    this.sky;\r\n    this.collisionPadding = 20;\r\n    this.playerCurrentCell = [0, 0];\r\n    this.atWall = false;\r\n    this.directionUnlocked = 0;\r\n    this.approachQuadrant = 0;\r\n\r\n    for (var i=0; i<y; i++) {\r\n        this.map.push( [] );\r\n        this.visited.push( [] );\r\n        for (var j=0; j<x; j++) {\r\n            this.map[i].push( [1,1,1,1] );\r\n            this.visited[i].push( false );\r\n        }\r\n    }\r\n\r\n    this.generateMap();\r\n}\r\n\r\nMaze.prototype.unvisitedCellsExist = function() {\r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            if (this.visited[i][j]) return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.chooseNeighbor = function(cx,cy) {\r\n    var neighbors = [];\r\n    var directions = [];\r\n    if (cx > 0 && !this.visited[cy][cx-1]) \r\n        { neighbors.push( [cx-1, cy] ); directions.push('W'); }\r\n    if (cx < this.x-1 && !this.visited[cy][cx+1]) \r\n        { neighbors.push( [cx+1, cy] ); directions.push('E'); }\r\n    if (cy < this.y-1 && !this.visited[cy+1][cx]) \r\n        { neighbors.push( [cx, cy+1] ); directions.push('S'); }\r\n    if (cy > 0 && !this.visited[cy-1][cx]) \r\n        { neighbors.push( [cx, cy-1] ); directions.push('N'); }\r\n    if (neighbors.length) {\r\n        r = Math.floor(Math.random()*neighbors.length);\r\n        return [ neighbors[r], directions[r] ];\r\n    } else return false;\r\n};\r\n\r\nMaze.prototype.removeWall = function(x1, y1, direction) { \r\n    switch (direction) {\r\n        case 'N':\r\n            this.map[y1][x1][0] = 0;\r\n            this.map[y1-1][x1][2] = 0;\r\n        break;\r\n        case 'E':\r\n            this.map[y1][x1][1] = 0;\r\n            this.map[y1][x1+1][3] = 0;\r\n        break;\r\n        case 'S':\r\n            this.map[y1][x1][2] = 0;\r\n            this.map[y1+1][x1][0] = 0;\r\n        break;\r\n        case 'W':\r\n            this.map[y1][x1][3] = 0;\r\n            this.map[y1][x1-1][1] = 0;\r\n        break;\r\n    }\r\n};\r\n\r\nMaze.prototype.generateMap = function() {\r\n    \r\n    // choose initial cell\r\n    var rx = Math.floor(Math.random()*this.x);\r\n    var ry = Math.floor(Math.random()*this.y);\r\n\r\n    this.begin = [rx, ry];\r\n\r\n    var cx = rx;\r\n    var cy = ry;\r\n    var nx;\r\n    var ny;\r\n\r\n    this.visited[cy][cx] = true;\r\n\r\n    var next;\r\n    var nextDirection;\r\n\r\n    // while there are still unvisited cells\r\n    while (this.unvisitedCellsExist()) {\r\n        if (this.chooseNeighbor(cx,cy)) {\r\n            \r\n            next = this.chooseNeighbor(cx,cy);\r\n            \r\n            nx = next[0][0];\r\n            ny = next[0][1];\r\n            \r\n            nextDirection = next[1];\r\n            this.stack.push( [nx, ny] );\r\n            this.removeWall(cx, cy, nextDirection);\r\n            this.visited[ny][nx] = true;\r\n\r\n            cx = nx;\r\n            cy = ny;\r\n        \r\n        } else if (this.stack.length) {\r\n\r\n            next = this.stack.pop();\r\n            cx = next[0];\r\n            cy = next[1];\r\n            this.turnArounds.push([cx, cy]);\r\n          \r\n        } else break;\r\n    }\r\n\r\n    this.end = [cx, cy];\r\n    this.map[0][0][3] = 0;\r\n    this.map[this.y-1][this.x-1][1] = 0;\r\n\r\n};\r\n\r\nMaze.prototype.getClearRect = function(cx, cy) {\r\n    var fx = cx * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    var fy = cy * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    return [fx,fy];\r\n};\r\n\r\nMaze.prototype.getBallCoords = function(nx, ny) {\r\n    var bx = nx * this.cellSize + (this.cellSize/2);\r\n    var by = ny * this.cellSize + (this.cellSize/2);\r\n    return [bx,by];\r\n};\r\n\r\nMaze.prototype.clearBall = function() {\r\n    var cl = this.getClearRect(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.clearRect(cl[0], cl[1], this.ballRadius*2+2, this.ballRadius*2+2);\r\n};\r\n\r\nMaze.prototype.drawBall = function() {\r\n    var ballCoords = this.getBallCoords(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.beginPath();\r\n    ctx.arc(ballCoords[0], ballCoords[1], this.ballRadius, 0, 2*Math.PI, false);\r\n    ctx.fillStyle = 'green';\r\n    ctx.fill();\r\n    ctx.lineWidth = 1;\r\n    ctx.strokeStyle = '#003300';\r\n    ctx.stroke();\r\n};\r\n\r\nMaze.prototype.move = function(d) {\r\n    var dx = d[0];\r\n    var dy = d[1];\r\n    this.clearBall();\r\n    this.currentPosition = [this.currentPosition[0]+dx, this.currentPosition[1]+dy];\r\n    this.drawBall();\r\n};\r\n\r\nMaze.prototype.wallIsRendered = function(mt, lt) {\r\n    for (var i=0; i<this.wallsRendered.length; i++) {\r\n        if (this.wallsRendered[i][0][0] == mt[0] &&\r\n            this.wallsRendered[i][0][1] == mt[1] &&\r\n            this.wallsRendered[i][1][0] == lt[0] &&\r\n            this.wallsRendered[i][1][1] == lt[1]) {\r\n\r\n            return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.getQuadrant = function(theta) {\r\n    if (theta <= (Math.PI/2)) return 1;\r\n    if (theta <= Math.PI) return 2;\r\n    if (theta <= (Math.PI*3)/2) return 3;\r\n    if (theta <= (Math.PI*2)) return 4;\r\n}\r\n\r\nMaze.prototype.getOppositeQuad = function(quad) {\r\n    if (quad == 1) return 3;\r\n    if (quad == 2) return 4;\r\n    if (quad == 3) return 1;\r\n    if (quad == 4) return 2;\r\n}\r\n\r\nMaze.prototype.isDirectionValid = function(direction) {\r\n    \r\n    var currentAngle = (((Math.PI*3)/2) - camera.rotation.y) % (2*Math.PI);\r\n    if (currentAngle < 0) currentAngle += (2*Math.PI);\r\n    var currentQuad = this.getQuadrant(currentAngle);\r\n\r\n    // if at a wall, handle wall vs. direction, then return false\r\n    if (this.atWall) {\r\n\r\n        switch (this.atWall) {\r\n            case 'N':\r\n                if ((currentQuad == 3 || currentQuad == 4) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 1 || currentQuad == 2) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 1)\r\n                    camera.position.x += 10;\r\n                if (currentQuad == 2)\r\n                    camera.position.x -= 10;\r\n                return false;\r\n            break;\r\n            case 'E':\r\n                if ((currentQuad == 2 || currentQuad == 3) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 1 || currentQuad == 4) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 1)\r\n                    camera.position.z -= 10;\r\n                if (currentQuad == 4)\r\n                    camera.position.z += 10;\r\n                return false;\r\n            break;\r\n            case 'S':\r\n                if ((currentQuad == 1 || currentQuad == 2) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 3 || currentQuad == 4) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 3)\r\n                    camera.position.x -= 10;\r\n                if (currentQuad == 4)\r\n                    camera.position.x += 10;\r\n                return false;\r\n            break;\r\n            case 'W':\r\n                if ((currentQuad == 1 || currentQuad == 4) && direction == 1)\r\n                    return true;\r\n                if ((currentQuad == 2 || currentQuad == 3) && direction == -1)\r\n                    return true;\r\n                if (currentQuad == 2)\r\n                    camera.position.z -= 10;\r\n                if (currentQuad == 3)\r\n                    camera.position.z += 10;\r\n                return false;\r\n            break;\r\n        }\r\n\r\n        return false;\r\n\r\n    }\r\n\r\n    return true;\r\n\r\n};\r\n\r\nMaze.prototype.checkWallCollision = function() {\r\n    \r\n    // figure out which cell player is in\r\n    var playerX = Math.floor(camera.position.x / this.cellSize) + (this.x/2);\r\n    var playerZ = Math.floor(camera.position.z / this.cellSize) + (this.y/2);\r\n\r\n    // mark cell as current cell if not already\r\n    if (playerX != this.playerCurrentCell[0] || playerZ != this.playerCurrentCell[1]) {\r\n        this.playerCurrentCell = [playerX, playerZ];\r\n        console.log('entered cell ' + playerX + ', ' + playerZ);\r\n    }\r\n\r\n    // get walls in current cell\r\n    var walls = this.map[this.playerCurrentCell[1]][this.playerCurrentCell[0]];\r\n\r\n    // get global boundary coords\r\n    var bounds = [];\r\n    bounds.push((this.playerCurrentCell[1] * this.cellSize - \r\n        ((this.y*this.cellSize)/2)) + this.collisionPadding);\r\n    bounds.push((this.playerCurrentCell[0] * this.cellSize - \r\n        ((this.x*this.cellSize)/2)) + this.cellSize - this.collisionPadding);\r\n    bounds.push((this.playerCurrentCell[1] * this.cellSize - \r\n        ((this.y*this.cellSize)/2)) + this.cellSize - this.collisionPadding);\r\n    bounds.push((this.playerCurrentCell[0] * this.cellSize - \r\n        ((this.x*this.cellSize)/2)) + this.collisionPadding);\r\n\r\n    \r\n    // test each wall for collision\r\n    var whichWall = false;\r\n\r\n    if (walls[0] && camera.position.z <= bounds[0]) {\r\n        console.log('hit north wall');\r\n        whichWall = 'N';\r\n    }\r\n    if (walls[1] && camera.position.x >= bounds[1]) {\r\n        console.log('hit east wall');\r\n        whichWall = 'E';\r\n    }\r\n    if (walls[2] && camera.position.z >= bounds[2]) {\r\n        console.log('hit south wall');\r\n        whichWall = 'S';\r\n    }\r\n    if (walls[3] && camera.position.x <= bounds[3]) {\r\n        console.log('hit west wall');\r\n        whichWall = 'W';\r\n    }\r\n\r\n    this.atWall = whichWall;\r\n};\r\n\r\nMaze.prototype.render = function(ctx) {\r\n    \r\n    var cell;\r\n    var cx;\r\n    var cy;\r\n\r\n    var geometry, texture, mesh;\r\n\r\n    // draw grass\r\n    geometry = new THREE.BoxGeometry(this.x*this.cellSize, 10, this.y*this.cellSize);\r\n    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/grass.jpg');\r\n    texture.anisotropy = renderer.getMaxAnisotropy();\r\n    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n    this.grass = new THREE.Mesh( geometry, material );\r\n    this.grass.position.set(0, -100, 0); \r\n    scene.add( this.grass );\r\n\r\n    // draw sky\r\n    var skyRadius;\r\n    if (this.y > this.x) {\r\n        skyRadius = (this.y*this.cellSize);\r\n    } else skyRadius = (this.x*this.cellSize); \r\n    \r\n    geometry = new THREE.SphereGeometry(skyRadius, 16, 16, Math.PI/2,  Math.PI*2, 0, Math.PI);\r\n    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/sky.jpg');\r\n    texture.anisotropy = renderer.getMaxAnisotropy();\r\n    material = new THREE.MeshBasicMaterial( {map: texture} );\r\n    material.side = THREE.BackSide\r\n    this.sky = new THREE.Mesh(geometry, material);\r\n    this.sky.position.set(0,0,0);\r\n    scene.add(this.sky);\r\n\r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            \r\n            cell = this.map[i][j];\r\n            cx = this.cellSize * j - ((this.x*this.cellSize)/2);\r\n            cy = this.cellSize * i - ((this.y*this.cellSize)/2);\r\n            var mt;\r\n            var lt;\r\n\r\n            if (cell[0]) {\r\n                mt = [cx, cy];\r\n                lt = [cx+this.cellSize, cy];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  200, 200, 10  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/wood.jpg');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0]+this.cellSize/2, 0, mt[1]); \r\n                    scene.add( mesh );\r\n                }\r\n            } \r\n            if (cell[1]) {\r\n                mt = [cx+this.cellSize, cy];\r\n                lt = [cx+this.cellSize, cy+this.cellSize];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  10, 200, 200  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/wood.jpg');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0], 0, mt[1]+this.cellSize/2); \r\n                    scene.add( mesh );\r\n                }\r\n            } \r\n            if (cell[2]) {\r\n                mt = [cx+this.cellSize, cy+this.cellSize];\r\n                lt = [cx, cy+this.cellSize];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  200, 200, 10  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/crate.gif');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0]-this.cellSize/2, 0, mt[1]); \r\n                    scene.add( mesh );\r\n                }\r\n            }\r\n            if (cell[3]) {\r\n                mt = [cx, cy+this.cellSize];\r\n                lt = [cx, cy];\r\n                if (!this.wallIsRendered(mt, lt)) {\r\n                    geometry = new THREE.BoxGeometry(  10, 200, 200  );\r\n                    texture = THREE.ImageUtils.loadTexture('/static/site/img/textures/crate.gif');\r\n                    texture.anisotropy = renderer.getMaxAnisotropy();\r\n                    material = new THREE.MeshBasicMaterial( { map: texture } );\r\n                    mesh = new THREE.Mesh( geometry, material );\r\n                    mesh.position.set(mt[0], 0, mt[1]-this.cellSize/2); \r\n                    scene.add( mesh );\r\n                }\r\n            }\r\n\r\n        }\r\n    }\r\n};\r\n\r\nMaze.prototype.walkForward = function() {\r\n    this.checkWallCollision();\r\n    if (this.isDirectionValid(1)) {\r\n        camera.position.x -= 10 * Math.sin(camera.rotation.y);\r\n        camera.position.z += 10 * Math.cos(camera.rotation.y);\r\n        console.log('F');\r\n    }\r\n};\r\n\r\nMaze.prototype.walkBackwards = function() {\r\n    this.checkWallCollision();\r\n    if (this.isDirectionValid(-1)) {\r\n        camera.position.x += 10 * Math.sin(camera.rotation.y);\r\n        camera.position.z -= 10 * Math.cos(camera.rotation.y);\r\n        console.log('B');\r\n    }\r\n};\r\n\r\nMaze.prototype.turnLeft = function() {\r\n    camera.rotation.y -= Math.PI / 10;\r\n};\r\n\r\nMaze.prototype.turnRight = function() {\r\n    camera.rotation.y += Math.PI / 10;\r\n};\r\n\r\nMaze.prototype.flyUp = function() {\r\n    camera.position.y += 10;\r\n};\r\n\r\nMaze.prototype.flyDown = function() {\r\n    camera.position.y -= 10;\r\n};\r\n\r\n// } end class Maze\r\n\r\n/*\r\n    MazeSolver pseudo-code\r\n\r\n    1. start at the entrance\r\n    2. while not at the exit\r\n        1. push the current cell to visited\r\n        2. if exists one or more directions that have not been visited\r\n            1. push the current cell to pathStack\r\n            2. choose any direction from those not visited\r\n            3. move in that direction\r\n            4. draw path from previous cell to chosen cell\r\n            5. make the chosen cell the current cell\r\n        3. otherwise backtrack\r\n            1. pop the pathStack\r\n            2. remove line from currentCell to popped cell\r\n            3. do not remove popped cell from visited\r\n*/\r\n\r\n// class MazeSolver {\r\n\r\nfunction MazeSolver(maze) {\r\n    this.Maze = maze;\r\n    this.position = [0, 0];\r\n    this.pathStack = [];\r\n    this.visited = [];\r\n    this.Maze.clearBall();\r\n\r\n    var self = this;\r\n    this.solveStep = function() {\r\n        self.moveForward();\r\n    };\r\n}\r\n\r\nMazeSolver.prototype.getValidDirections = function(x,y) {\r\n    \r\n    var directions = [];\r\n    \r\n    if (!this.Maze.map[y][x][0]) \r\n        directions.push([0,-1]);\r\n    if (!this.Maze.map[y][x][1] && (x!=this.Maze.x-1 || y!=this.Maze.y-1)) \r\n        directions.push([1,0]);\r\n    if (!this.Maze.map[y][x][2]) \r\n        directions.push([0,1]);\r\n    if (!this.Maze.map[y][x][3] && (x||y)) \r\n        directions.push([-1,0]);\r\n\r\n    var validDirections = [];\r\n    for (var i=0; i<directions.length; i++) {\r\n        var tx = x+directions[i][0];\r\n        var ty = y+directions[i][1];\r\n        if (!this.isVisited(tx,ty)) {\r\n            validDirections.push(directions[i]);\r\n        }\r\n    }\r\n\r\n    return validDirections;\r\n};\r\n\r\nMazeSolver.prototype.isVisited = function(x,y) {\r\n    for (var i=0; i<this.visited.length; i++) {\r\n        if (this.visited[i][0] == x && this.visited[i][1] == y) \r\n            return true;\r\n    }\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.isDeadEnd = function(x,y) {\r\n    if (!this.getValidDirections(x,y).length)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.movePath = function(cx,cy,nx,ny) {\r\n    ctx.lineWidth = 4;\r\n    ctx.strokeStyle = '#5555ff';\r\n    ctx.beginPath();\r\n\r\n    ctx.moveTo(cx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        cy*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.lineTo(nx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        ny*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.stroke();\r\n};\r\n\r\nMazeSolver.prototype.clearPath = function(x,y) {\r\n    ctx.clearRect(x*this.Maze.cellSize+2, y*this.Maze.cellSize+2, \r\n        this.Maze.cellSize-4, this.Maze.cellSize-4);\r\n};\r\n\r\nMazeSolver.prototype.isFinished = function() {\r\n    if (this.position[0] == this.Maze.x-1 && this.position[1] == this.Maze.y-1)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.moveForward = function() {\r\n    \r\n    var cx = this.position[0];\r\n    var cy = this.position[1];\r\n    \r\n    this.visited.push([cx,cy]);\r\n    \r\n    if (this.isFinished()) {\r\n        console.log("FINISH");\r\n        clearInterval(this.interval);\r\n        return;\r\n    }\r\n\r\n    if (!this.isDeadEnd(cx,cy)) {\r\n        this.pathStack.push([cx,cy]);\r\n        var directions = this.getValidDirections(cx,cy);\r\n        var randomDirection = Math.floor(Math.random()*directions.length);\r\n        \r\n        var nx = cx + directions[randomDirection][0];\r\n        var ny = cy + directions[randomDirection][1];\r\n\r\n        this.movePath(cx,cy,nx,ny);\r\n        this.position = [nx,ny];\r\n\r\n    } else { \r\n        this.backtrack();\r\n    }\r\n};\r\n\r\nMazeSolver.prototype.backtrack = function() {\r\n    var lastCell = this.pathStack.pop();\r\n    this.clearPath(this.position[0], this.position[1]);\r\n    this.position = [lastCell[0], lastCell[1]];\r\n};\r\n\r\n// } end class MazeSolver\r\n\r\n\r\n$(document).keydown(function(e) {\r\n    \r\n    var tx = Maze.currentPosition[0];\r\n    var ty = Maze.currentPosition[1];\r\n\r\n    switch (e.keyCode) {\r\n\r\n        case 37: // left\r\n            Maze.turnLeft();\r\n        break;\r\n        case 38: // up (forward)\r\n            Maze.walkForward();\r\n        break;\r\n        case 39: // right\r\n            Maze.turnRight();\r\n        break;\r\n        case 40: // down (backwards)\r\n            Maze.walkBackwards();\r\n        break;\r\n        case 65: // 'a' key\r\n            Maze.flyUp();\r\n        break;\r\n        case 90: // 'z' key\r\n            Maze.flyDown();\r\n        break;\r\n\r\n    }\r\n});\r\n\r\nfunction solveMaze() {\r\n    solver = new MazeSolver(Maze);\r\n    solver.interval = setInterval(solver.solveStep, 5);\r\n}\r\n\r\nvar Maze;\r\n\r\n\r\nvar ctx;\r\nvar solver;\r\n\r\nvar camera, scene, renderer;\r\nvar mesh;\r\n\r\nfunction onWindowResize() {\r\n\tcamera.aspect = window.innerWidth / window.innerHeight;\r\n\tcamera.updateProjectionMatrix();\r\n\trenderer.setSize( window.innerWidth, window.innerHeight );\r\n}\r\n\r\nfunction animate() {\r\n\trequestAnimationFrame(animate);\r\n\trenderer.render(scene, camera);\r\n}\r\n\r\n    \r\nvar cellSize = 200;\r\n\r\nrenderer = new THREE.WebGLRenderer({\r\n    preserveDrawingBuffer: true,\r\n});\r\nvar __renderer = $(renderer);\r\n\r\nrenderer.setSize( Canvas.width, Canvas.height );\r\nconsole.log(renderer.domElement); console.log('-----');\r\ndocument.body.appendChild( renderer.domElement );\r\n\r\nwindow._renderer = renderer;\r\n\r\ncamera = new THREE.PerspectiveCamera( 90, \r\n\twindow.innerWidth / window.innerHeight, 1, 10000 );\r\nscene = new THREE.Scene();\r\n\r\nMaze = new Maze(2, 16, 10, cellSize);\r\nMaze.render();\r\n\r\ncamera.position.x = Maze.cellSize * Maze.x * -0.5;\r\ncamera.position.y = 15;\r\ncamera.position.z = Maze.cellSize * Maze.y * -0.5 + Maze.cellSize/2;\r\n\r\ncamera.lookAt(scene.position);\r\nwindow.addEventListener( 'resize', onWindowResize, false );\r\nanimate();\r\n\r\nwindow.appdestroy = function() {\r\n\tconsole.log('domel', $(__renderer[0].domElement));\r\n\t$(__renderer[0].domElement).remove();\r\n\tdelete renderer;\r\n \tdelete __renderer;\r\n\twindow.removeEventListener('resize');\r\n}	{}		46	1	1	\N	\N
27	2016-03-23 11:27:56.498377+00	2016-05-08 03:38:22.218445+00	Plain Function in 1 variable	Creates the graphs of functions in 1 variable.  Allows you to enter your own function and range.	text/paperscript	// require cartesian axes\n// require MFunction\nvar Canvas = view._context.canvas;\n\ndrawAxes(project.activeLayer);\n\nl = new Layer({\n\tblendMode: 'multiply'\n});\n\n// add function wrapper around js expression from math object\nvar mkfunc = "var _func1 = function(x) { return " + func1.javascript + "; }";\nconsole.log(mkfunc);\neval(mkfunc);\nvar F0 = new MFunction(_func1, [x_min, x_max]);\n\npath1 = new Path({\n    strokeColor: new Color(0.7, 0.3, 0.3, 0.8),\n    strokeWidth: 3,\n    closed: false,\n    //fillColor: new Color(Math.random(),1,Math.random(),0.2),\n});\nF0.compute();\n\ntransformation = [\n  [1, 0, 0], //5*Math.cos(Math.PI/-4)],\n  [0, 1, 0] //5*Math.sin(Math.PI/-4)],\n];\n\nF0.draw(path1);\npath1.smooth();	{\n  "func1":{"type": "math", \n\t"default":{\n\t  \t"latex":"x \\\\cos{\\\\left (x \\\\right )}",\n\t\t"javascript":"x*Math.cos(x)",\n\t\t"type":"math",\n\t\t"string":"x cos(x)",\n\t\t  "value":"x cos(x)"}},\n  "x_min":{"type": "number", "default":-5},\n  "x_max":{"type": "number", "default":5}\n}		46	5	1	\N	\N
5	2016-02-03 03:11:30.899129+00	2016-05-11 03:40:54.949224+00	Function in 1 var, time parameter, and contour	Sets of graphs of a function in 1 variable with time as a parameter.  (Technically a function in 2 variables)	text/paperscript	/*\n    *\n    *   @author: nino p cocchiarella\n    *   (c) 2016\n    *\n*/\n\nvar Canvas = view._context.canvas;\nview.viewSize = new Size(Canvas.width, Canvas.height);\n\n// define formal mathematical function in 1 var\nMFunction = function(func, extrema) {\n   \n    this.func = func;\n    if (!extrema) { extrema = [-5,5]; }\n\n    this.domain = {\n        elements: [],\n        min: (extrema[0] || -5),\n        max: (extrema[1] || 5)\n    };\n\n    this.codomain = {\n        elements: [],\n        min: null,\n        max: null\n    };\n\n    this.mapping = null;\n    this.compute();\n}\n\nMFunction.prototype = {\n    \n    compute: function(delta) {\n        if (!delta) { delta = 100; }\n\n        eval("_func = function(x) { return "+this.func+"; };");\n\n        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\n        this.codomain.elements = _.map(this.domain.elements, _func);\n        this.codomain.min = _.min(this.codomain.elements);\n        this.codomain.max = _.max(this.codomain.elements);\n        this.mapping = _.zip(this.domain.elements, this.codomain.elements);\n    },\n\n    draw: function(path, matrix_premult) {\n        if (this.mapping == null) { this.compute(); }\n        \n        _w = Math.abs(this.domain.max - this.domain.min);\n        _h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\n    \n\n        points = this.mapping;\n\n        if (matrix_premult) {\n            points = _.map(points, function(p) {\n                return numeric.dot(matrix_premult, p);\n            })\n        }\n\n        _.each(points, function(p) {\n            path.add(new Point(p));\n        });\n        \n        T = new Matrix(\n            (view.size.width / _w), 0,\n            0, (view.size.height / (-1*_h)), \n            view.center.x, view.center.y);\n\n        project.activeLayer.transform(T); \n    }\n}\n\nvar func = new MFunction(funct.javascript, [xMin,xMax]);\n\n// draw Cartesian axes\ndrawAxes = function(xmax, ymax) {\n\n    if (xmax == undefined) xmax = 10;\n    if (ymax == undefined) ymax = 10;\n\n    DARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\n    LIGHT_GREY = new Color(0.75, 0.75, 0.75, 0.25);\n\n    x_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\n    x_axis.add(new Point(-view.size.width/2, 0));\n    x_axis.add(new Point(view.size.width/2, 0));\n\n    y_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\n    y_axis.add(new Point(0, -view.size.height/2));\n    y_axis.add(new Point(0, view.size.height/2));\n\n    _.each(_.range(-1*xmax,xmax), function(n) {\n        var line = new Path({strokeColor: LIGHT_GREY });\n        line.add( new Point(n, view.size.height/2) );\n        line.add( new Point(n, -view.size.height/2) );\n        line.closed = true;\n    });\n\n\n    _.each(_.range(-1*ymax,ymax), function(n) {\n        var line = new Path({strokeColor: LIGHT_GREY });\n        line.add( new Point(view.size.width/2, n) );\n        line.add( new Point(-view.size.width/2, n) );\n        line.closed = true;\n    });\n\n\n    project.activeLayer.transform( new Matrix((view.size.width / xmax),0,0,(view.size.height / (-1*ymax)), view.center.x, view.center.y) );\n\n}\n//executeRemotePaperscript("/static/site/js/app/graph-util.js");\ndrawAxes();\n\n////////////////////////\n\nINITCOLOR = _.map(_.range(3), Math.random)\nN = 15;\n\n\ngraphs = [];\n\n_.map(_.range(N), function(n) {\n\n    layer = new Layer({\n        backgroundColor: new Color(1,1,1,0)\n    });\n\n    thickness = (n == 0 ? 3 : 1)\n    alpha = 0.5 - (n/(N*2))\n\n    var graph = new Path({\n        strokeColor: new Color(  INITCOLOR.concat([alpha]) ),\n        strokeWidth: thickness\n    });\n\n    matrix = [[1,0],[0,(1-(n/N))]]\n    func.draw(graph, matrix);\n    graph.smooth();\n    graphs.push(graph);\n\n });\n\n\n\n\n////////////\n\n\nfunction onResize(event) {\n\n}\n\nview.onFrame = function(event) {\n    scale = 1 + (Math.sin(event.time)/ breathDelta)\n    _.each(graphs, function(g) {\n        g.scale(1, scale);\n    });\n}\n\nwindow.onDestroy = function() {\n\tproject.layers.forEach(function(lay) {\n\t\tlay.remove();\n\t}); \n}	{\n    "breathDelta": {"type": "number", "default":17, "min":1.1, "max":1000},\n    "funct": {"type": "math", "default": "cos(2x) + x^5"},\n    "xMin": {"type": "number", "default": -5},\n    "xMax": {"type": "number", "default": 5}\n}		66	5	1	\N	\N
28	2016-03-24 02:26:54.501906+00	2016-05-26 00:23:36.49131+00	Fractal Tree Creatures	Fractal trees and random plants and creatures.	text/coffeescript	#####################################\r\n#                                   #\r\n#   @author: Nino P. Cocchiarella   #\r\n#   Copyright (C) 2015              #\r\n#   plerp.org                       #\r\n#                                   #\r\n#####################################\r\n\r\npi = Math.PI\r\nabs = Math.abs\r\nsin = Math.sin\r\ncos = Math.cos\r\narcsin = Math.asin\r\narccos = Math.acos\r\narctan = Math.atan\r\nroot = Math.sqrt\r\n\r\n\r\nmoveTo = ([x,y]) -> gl.moveTo(x, y)\r\nlineTo = ([x,y]) -> gl.lineTo(x, y)\r\n\r\n# COLOR1 = "#785A3C"\r\n# COLOR2 = "#00aa00"\r\n# NUM_ITERATIONS = 6\r\n# TRAPEZOIDAL_SECTIONS = 20\r\n# CHILDREN = [3, -7, 6]\r\n# DEGREE1_COEFF = 17\r\n# DEGREE2_COEFF = 30\r\n\r\n\r\ngenerationChildCounts = _.map _.range(NUM_ITERATIONS+1), () -> 0\r\n\r\ncolorHex2rgb = (color) ->\r\n    col = color.split("#").join("")\r\n    _r = col.substr 0,2\r\n    _g = col.substr 2,2\r\n    _b = col.substr 4,2\r\n    return _.map [_r,_g,_b], (c) -> parseInt(c,16)\r\n\r\nclass TreeStick\r\n\r\n    rad2deg: (x) ->\r\n        return x * (180/pi)\r\n\r\n    constructor: (params) ->\r\n        {\r\n            @start,\r\n            @direction,\r\n            @length,\r\n            @start_alpha,\r\n            @begin_thickness,\r\n            @end_thickness,\r\n            @generation,\r\n            @children\r\n        } = params\r\n\r\n        #console.log 'sa', @start_alpha\r\n\r\n        @delta_thickness = (@begin_thickness - @end_thickness) / TRAPEZOIDAL_SECTIONS\r\n        @delta_length = @length / TRAPEZOIDAL_SECTIONS\r\n\r\n        @current_position = @start\r\n        @current_thickness = @begin_thickness\r\n\r\n        perp = @direction + pi/2\r\n\r\n        @current_edges = [\r\n            [@start[0] + (@begin_thickness/2)*(cos perp), @start[1] + (@begin_thickness/2)*(sin perp)],\r\n            [@start[0] - (@begin_thickness/2)*(cos perp), @start[1] - (@begin_thickness/2)*(sin perp)]\r\n        ]\r\n\r\n        @trapezoids = []\r\n        @left_edges = []\r\n        @right_edges = []\r\n        @directions = []\r\n        @left_directions = []\r\n        @right_directions = []\r\n\r\n\r\n        for i in [0...TRAPEZOIDAL_SECTIONS]\r\n\r\n            points = []\r\n            start_midpoint = @current_position\r\n\r\n            end_midpoint = [\\\r\n                (@current_position[0] + @delta_length * cos @direction), \\\r\n                (@current_position[1] + @delta_length * sin @direction)]\r\n\r\n            perp = @direction + pi/2\r\n            start_perp = [\\\r\n                (@current_position[0] + (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] + (@current_thickness/2) * sin perp)]\r\n            end_perp = [\\\r\n                (@current_position[0] - (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] - (@current_thickness/2) * sin perp)]\r\n\r\n\r\n            @current_position = end_midpoint\r\n            @current_thickness -= @delta_thickness\r\n\r\n\r\n            #####  main curve function\r\n            @direction -= (pi/DEGREE1_COEFF - i*(pi/DEGREE2_COEFF))\r\n            #console.log 'direction', @direction\r\n\r\n            #### sucessor\r\n\r\n            start_perp2 = [\\\r\n                (@current_position[0] + (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] + (@current_thickness/2) * sin perp)]\r\n            end_perp2 = [\\\r\n                (@current_position[0] - (@current_thickness/2) * cos perp),\\\r\n                (@current_position[1] - (@current_thickness/2) * sin perp)]\r\n\r\n            points.push @current_edges[0]\r\n            points.push @current_edges[1]\r\n            points.push end_perp2\r\n            points.push start_perp2\r\n\r\n            @left_edges.push [start_perp, start_perp2]\r\n            @right_edges.push [end_perp2, end_perp]\r\n\r\n            @directions.push @direction\r\n\r\n            dx = start_perp2[0] - start_perp[0]\r\n            dy = start_perp2[1] - start_perp[1]\r\n\r\n\r\n\r\n\r\n\r\n            left_direction = arctan (dy/dx)\r\n            @left_directions.push left_direction\r\n\r\n            dx = end_perp2[0] - end_perp[0]\r\n            dy = end_perp2[1] - end_perp[1]\r\n            right_direction = arctan (dy/dx)\r\n            @right_directions.push right_direction\r\n\r\n\r\n            @trapezoids.push points\r\n            @current_edges = [start_perp2, end_perp2]\r\n\r\n        #@draw()\r\n        ##console.log @left_directions, @right_directions, @directions\r\n\r\n        if @generation < NUM_ITERATIONS\r\n\r\n            for child_index in @children\r\n\r\n                if child_index < 0\r\n\r\n                    dx = @left_edges[abs(child_index)][1][0] - @left_edges[abs(child_index)][0][0]\r\n                    dy = @left_edges[abs(child_index)][1][1] - @left_edges[abs(child_index)][0][1]\r\n                    midpoint = [\\\r\n                        (@left_edges[abs(child_index)][1][0] + @left_edges[abs(child_index)][0][0]) / 2,\r\n                        (@left_edges[abs(child_index)][1][1] + @left_edges[abs(child_index)][0][1]) / 2\r\n                    ]\r\n\r\n                    #if @generation == 0\r\n                    ##console.log start_perp, start_perp2\r\n                        #console.log dx, dy\r\n\r\n                if child_index > 0\r\n\r\n                    dx = @right_edges[abs(child_index)][1][0] - @right_edges[abs(child_index)][0][0]\r\n                    dy = @right_edges[abs(child_index)][1][1] - @right_edges[abs(child_index)][0][1]\r\n                    midpoint = [\\\r\n                        (@right_edges[abs(child_index)][1][0] + @right_edges[abs(child_index)][0][0]) / 2,\r\n                        (@right_edges[abs(child_index)][1][1] + @right_edges[abs(child_index)][0][1]) / 2\r\n                    ]\r\n\r\n\r\n\r\n                # get length of edge\r\n                edge_length = root (dx**2 + dy**2)\r\n\r\n                # get angle\r\n                theta = @left_directions[abs(child_index)] - (pi/2) if child_index < 0\r\n                theta = @right_directions[abs(child_index)] + (pi/2) if child_index > 0\r\n                ##console.log @rad2deg(theta)\r\n\r\n                #console.log @generation\r\n                start_alpha = (1 - 0.1* @generation)\r\n                #console.log 'sa', start_alpha\r\n\r\n                babyTreeStick =\r\n                    start: midpoint\r\n                    direction: theta\r\n                    length: @length * ((TRAPEZOIDAL_SECTIONS-abs(child_index))/TRAPEZOIDAL_SECTIONS)\r\n                    start_alpha: 1 - 0.1* @generation\r\n                    begin_thickness: edge_length\r\n                    end_thickness: edge_length * (@end_thickness/@begin_thickness)\r\n                    generation: @generation + 1\r\n                    children: @children\r\n\r\n                baby = new TreeStick babyTreeStick\r\n                \r\n                \r\n\r\n        #else\r\n        #    for child_index in @children\r\n        #        gl.fillStyle = '#0000cc'\r\n        #        gl.beginPath()\r\n        #        gl.arc(@left_edges[abs(child_index)][1][0], @left_edges[abs(child_index)][1][1], 2, 0, 2*pi, false)\r\n        #        gl.fill()\r\n\r\n        @draw()\r\n\r\n\r\n\r\n    draw: ->\r\n\r\n        generationChildCounts[@generation]++\r\n\r\n        for trap in @trapezoids\r\n            gl.strokeStyle = '#111111'\r\n            gl.lineWidth = 1\r\n            [r,g,b] = colorHex2rgb COLOR1\r\n            gl.fillStyle = "rgba(#{r},#{g},#{b},#{@start_alpha})"\r\n            if @generation == NUM_ITERATIONS\r\n                gl.strokeStyle = COLOR2\r\n            gl.beginPath()\r\n            moveTo trap[0]\r\n            lineTo trap[1]\r\n            lineTo trap[2]\r\n            lineTo trap[3]\r\n            gl.closePath()\r\n            gl.stroke()\r\n            gl.fill()\r\n        \r\n        if @generation == NUM_ITERATIONS and generationChildCounts[NUM_ITERATIONS] == Math.pow @children.length, NUM_ITERATIONS\r\n            try\r\n                window.renderingDone()\r\n            catch e\r\n                console.log e\r\n\r\n\r\n\r\n\r\ngl = null\r\n\r\n$(document).ready ->\r\n\r\n    #Canvas = document.getElementById('big-canvas')\r\n\r\n    gl = Canvas.getContext('2d')\r\n\r\n    Canvas.width = $(window).width()\r\n    Canvas.height = $(window).height()\r\n\r\n    \r\n    gl.scale(1, -1)\r\n    gl.translate(0, -Canvas.height)\r\n    U_width = Canvas.width\r\n    U_height = Canvas.height\r\n\r\n    originalTreeStick =\r\n        start: [U_width/2, 0]\r\n        direction: pi/2\r\n        length: U_height\r\n        start_alpha: 1\r\n        begin_thickness: 130\r\n        end_thickness: 20\r\n        generation: 0\r\n        children: CHILDREN\r\n\r\n    #console.log originalTreeStick\r\n\r\n    @hank = new TreeStick originalTreeStick\r\n    #@hank.draw()\r\n    #@frameInterval = setInterval (=> @hank.grow()), 100	{\r\n\t"COLOR1": {"type": "color", "default": "#785A3C"},\r\n\t"COLOR2": {"type": "color", "default": "#00AA00", "index":true},\r\n  \t"NUM_ITERATIONS":{"type": "number", "default":5, "min": 2, "max": 13},\r\n\t"CHILDREN": {"type": "javascript", "default": "[6,-7,8,12]"},\r\n\t"TRAPEZOIDAL_SECTIONS": {"type": "number", "default":15, "min": 5, "max": 50},\r\n\t"DEGREE1_COEFF": {"type": "number", "default":17, "min": 1, "max": 1000},\r\n\t"DEGREE2_COEFF": {"type": "number", "default":30, "min": 1, "max": 1000}\r\n}		127	3	1	\N	Strange and grand :: trees and flowers
24	2016-03-12 05:34:40.222228+00	2016-06-01 00:52:51.841468+00	2-dimensional Maze Generator and Solver	Uses DFS algorithm to create a unique maze each instance of running. Arrow keys let user navigate through and try to solve the maze. Automatic solving -- solution button presents the one and only one correct path.	text/javascript	/*\r\n\r\nMaze Generator pseudo-code\r\n\r\n1. Make the initial cell the current cell and mark it as visited\r\n2. While there are unvisited cells\r\n    1. If the current cell has any neighbors which have not been visited\r\n        1. Choose randomly one of the unvisited neighbors\r\n        2. Push the chosen cell to the stack\r\n        3. Remove the wall between the current cell and the chosen cell\r\n        4. Make the chosen cell the current cell and mark it as visited\r\n    2. Otherwise\r\n        1. Pop a cell from the stack\r\n        2. Make it the current cell\r\n*/\r\n\r\n// class Maze {\r\n\r\nfunction Maze(dimension, x, y, cellSize) {\r\n    this.x = x;\r\n    this.y = y;\r\n    this.map = [];\r\n    this.visited = [];\r\n    this.stack = [];\r\n    this.cellSize = cellSize;\r\n    this.begin = [];\r\n    this.turnArounds = [];\r\n    this.currentPosition = [0, 0];\r\n    this.ballRadius = this.cellSize * 0.4;\r\n    this.linesDrawn = [];\r\n\r\n    for (var i=0; i<y; i++) {\r\n        this.map.push( [] );\r\n        this.visited.push( [] );\r\n        for (var j=0; j<x; j++) {\r\n            this.map[i].push( [1,1,1,1] );\r\n            this.visited[i].push( false );\r\n        }\r\n    }\r\n\r\n    this.generateMap();\r\n}\r\n\r\nMaze.prototype.unvisitedCellsExist = function() {\r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            if (this.visited[i][j]) return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.chooseNeighbor = function(cx,cy) {\r\n    var neighbors = [];\r\n    var directions = [];\r\n    if (cx > 0 && !this.visited[cy][cx-1]) \r\n        { neighbors.push( [cx-1, cy] ); directions.push('W'); }\r\n    if (cx < this.x-1 && !this.visited[cy][cx+1]) \r\n        { neighbors.push( [cx+1, cy] ); directions.push('E'); }\r\n    if (cy < this.y-1 && !this.visited[cy+1][cx]) \r\n        { neighbors.push( [cx, cy+1] ); directions.push('S'); }\r\n    if (cy > 0 && !this.visited[cy-1][cx]) \r\n        { neighbors.push( [cx, cy-1] ); directions.push('N'); }\r\n    if (neighbors.length) {\r\n        r = Math.floor(Math.random()*neighbors.length);\r\n        return [ neighbors[r], directions[r] ];\r\n    } else return false;\r\n};\r\n\r\nMaze.prototype.removeWall = function(x1, y1, direction) { \r\n    switch (direction) {\r\n        case 'N':\r\n            this.map[y1][x1][0] = 0;\r\n            this.map[y1-1][x1][2] = 0;\r\n        break;\r\n        case 'E':\r\n            this.map[y1][x1][1] = 0;\r\n            this.map[y1][x1+1][3] = 0;\r\n        break;\r\n        case 'S':\r\n            this.map[y1][x1][2] = 0;\r\n            this.map[y1+1][x1][0] = 0;\r\n        break;\r\n        case 'W':\r\n            this.map[y1][x1][3] = 0;\r\n            this.map[y1][x1-1][1] = 0;\r\n        break;\r\n    }\r\n};\r\n\r\nMaze.prototype.generateMap = function() {\r\n    \r\n    // choose initial cell\r\n    var rx = Math.floor(Math.random()*this.x);\r\n    var ry = Math.floor(Math.random()*this.y);\r\n\r\n    this.begin = [rx, ry];\r\n\r\n    var cx = rx;\r\n    var cy = ry;\r\n    var nx;\r\n    var ny;\r\n\r\n    this.visited[cy][cx] = true;\r\n\r\n    var next;\r\n    var nextDirection;\r\n\r\n    // while there are still unvisited cells\r\n    while (this.unvisitedCellsExist()) {\r\n        if (this.chooseNeighbor(cx,cy)) {\r\n            \r\n            next = this.chooseNeighbor(cx,cy);\r\n            \r\n            nx = next[0][0];\r\n            ny = next[0][1];\r\n            \r\n            nextDirection = next[1];\r\n            this.stack.push( [nx, ny] );\r\n            this.removeWall(cx, cy, nextDirection);\r\n            this.visited[ny][nx] = true;\r\n\r\n            cx = nx;\r\n            cy = ny;\r\n        \r\n        } else if (this.stack.length) {\r\n\r\n            next = this.stack.pop();\r\n            cx = next[0];\r\n            cy = next[1];\r\n            this.turnArounds.push([cx, cy]);\r\n          \r\n        } else break;\r\n    }\r\n\r\n    this.end = [cx, cy];\r\n    this.map[0][0][3] = 0;\r\n    this.map[this.y-1][this.x-1][1] = 0;\r\n\r\n};\r\n\r\nMaze.prototype.getClearRect = function(cx, cy) {\r\n    var fx = cx * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    var fy = cy * this.cellSize + (this.cellSize/2) - (this.ballRadius) - 1;\r\n    return [fx,fy];\r\n};\r\n\r\nMaze.prototype.getBallCoords = function(nx, ny) {\r\n    var bx = nx * this.cellSize + (this.cellSize/2);\r\n    var by = ny * this.cellSize + (this.cellSize/2);\r\n    return [bx,by];\r\n};\r\n\r\nMaze.prototype.clearBall = function() {\r\n    var cl = this.getClearRect(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.clearRect(cl[0], cl[1], this.ballRadius*2+2, this.ballRadius*2+2);\r\n};\r\n\r\nMaze.prototype.drawBall = function() {\r\n    var ballCoords = this.getBallCoords(this.currentPosition[0], this.currentPosition[1]);\r\n    ctx.beginPath();\r\n    ctx.arc(ballCoords[0], ballCoords[1], this.ballRadius, 0, 2*Math.PI, false);\r\n    ctx.fillStyle = 'green';\r\n    ctx.fill();\r\n    ctx.lineWidth = 1;\r\n    ctx.strokeStyle = '#003300';\r\n    ctx.stroke();\r\n};\r\n\r\nMaze.prototype.move = function(d) {\r\n    var dx = d[0];\r\n    var dy = d[1];\r\n    this.clearBall();\r\n    this.currentPosition = [this.currentPosition[0]+dx, this.currentPosition[1]+dy];\r\n    this.drawBall();\r\n};\r\n\r\nMaze.prototype.lineIsDrawn = function(mt, lt) {\r\n    for (var i=0; i<this.linesDrawn.length; i++) {\r\n        if (this.linesDrawn[i][0][0] == mt[0] &&\r\n            this.linesDrawn[i][0][1] == mt[1] &&\r\n            this.linesDrawn[i][1][0] == lt[0] &&\r\n            this.linesDrawn[i][1][1] == lt[1]) {\r\n\r\n            return true;\r\n        }\r\n    }\r\n    return false;\r\n};\r\n\r\nMaze.prototype.render = function(ctx) {\r\n    \r\n    var cell;\r\n    var cx;\r\n    var cy;\r\n\r\n    ctx.moveTo(0,0);\r\n    ctx.lineWidth = 1;\r\n    ctx.strokeStyle = '#666666';\r\n    \r\n    for (var i=0; i<this.y; i++) {\r\n        for (var j=0; j<this.x; j++) {\r\n            \r\n            ctx.beginPath();\r\n            cell = this.map[i][j];\r\n            cx = this.cellSize * j;\r\n            cy = this.cellSize * i;\r\n            var mt;\r\n            var lt;\r\n\r\n            if (cell[0]) {\r\n                mt = [cx, cy];\r\n                lt = [cx+this.cellSize, cy];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            } \r\n            if (cell[1]) {\r\n                mt = [cx+this.cellSize, cy];\r\n                lt = [cx+this.cellSize, cy+this.cellSize];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            } \r\n            if (cell[2]) {\r\n                mt = [cx+this.cellSize, cy+this.cellSize];\r\n                lt = [cx, cy+this.cellSize];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            }\r\n            if (cell[3]) {\r\n                mt = [cx, cy+this.cellSize];\r\n                lt = [cx, cy];\r\n                if (!this.lineIsDrawn(mt, lt)) {\r\n                    this.linesDrawn.push([mt, lt]);\r\n                    ctx.moveTo(mt[0], mt[1]);\r\n                    ctx.lineTo(lt[0], lt[1]);\r\n                    ctx.stroke();\r\n                }\r\n            }\r\n\r\n        }\r\n    }\r\n\r\n    this.move([0,0]);\r\n\r\n};\r\n\r\n// } end class Maze\r\n\r\n/*\r\n    MazeSolver pseudo-code\r\n\r\n    1. start at the entrance\r\n    2. while not at the exit\r\n        1. push the current cell to visited\r\n        2. if exists one or more directions that have not been visited\r\n            1. push the current cell to pathStack\r\n            2. choose any direction from those not visited\r\n            3. move in that direction\r\n            4. draw path from previous cell to chosen cell\r\n            5. make the chosen cell the current cell\r\n        3. otherwise backtrack\r\n            1. pop the pathStack\r\n            2. remove line from currentCell to popped cell\r\n            3. do not remove popped cell from visited\r\n*/\r\n\r\n// class MazeSolver {\r\n\r\nfunction MazeSolver(maze) {\r\n    this.Maze = maze;\r\n    this.position = [0, 0];\r\n    this.pathStack = [];\r\n    this.visited = [];\r\n    this.Maze.clearBall();\r\n\r\n    var self = this;\r\n    this.solveStep = function() {\r\n        self.moveForward();\r\n    };\r\n}\r\n\r\nMazeSolver.prototype.getValidDirections = function(x,y) {\r\n    \r\n    var directions = [];\r\n    \r\n    if (!this.Maze.map[y][x][0]) \r\n        directions.push([0,-1]);\r\n    if (!this.Maze.map[y][x][1] && (x!=this.Maze.x-1 || y!=this.Maze.y-1)) \r\n        directions.push([1,0]);\r\n    if (!this.Maze.map[y][x][2]) \r\n        directions.push([0,1]);\r\n    if (!this.Maze.map[y][x][3] && (x||y)) \r\n        directions.push([-1,0]);\r\n\r\n    var validDirections = [];\r\n    for (var i=0; i<directions.length; i++) {\r\n        var tx = x+directions[i][0];\r\n        var ty = y+directions[i][1];\r\n        if (!this.isVisited(tx,ty)) {\r\n            validDirections.push(directions[i]);\r\n        }\r\n    }\r\n\r\n    return validDirections;\r\n};\r\n\r\nMazeSolver.prototype.isVisited = function(x,y) {\r\n    for (var i=0; i<this.visited.length; i++) {\r\n        if (this.visited[i][0] == x && this.visited[i][1] == y) \r\n            return true;\r\n    }\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.isDeadEnd = function(x,y) {\r\n    if (!this.getValidDirections(x,y).length)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.movePath = function(cx,cy,nx,ny) {\r\n    ctx.lineWidth = 4;\r\n    ctx.strokeStyle = solutionPathColor;\r\n    ctx.beginPath();\r\n\r\n    ctx.moveTo(cx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        cy*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.lineTo(nx*this.Maze.cellSize+this.Maze.cellSize/2, \r\n        ny*this.Maze.cellSize+this.Maze.cellSize/2);\r\n    ctx.stroke();\r\n};\r\n\r\nMazeSolver.prototype.clearPath = function(x,y) {\r\n    ctx.clearRect(x*this.Maze.cellSize+2, y*this.Maze.cellSize+2, \r\n        this.Maze.cellSize-4, this.Maze.cellSize-4);\r\n};\r\n\r\nMazeSolver.prototype.isFinished = function() {\r\n    if (this.position[0] == this.Maze.x-1 && this.position[1] == this.Maze.y-1)\r\n        return true;\r\n    return false;\r\n};\r\n\r\nMazeSolver.prototype.moveForward = function() {\r\n    \r\n    var cx = this.position[0];\r\n    var cy = this.position[1];\r\n    \r\n    this.visited.push([cx,cy]);\r\n    \r\n    if (this.isFinished()) {\r\n        console.log("FINISH");\r\n        clearInterval(this.interval);\r\n        return;\r\n    }\r\n\r\n    if (!this.isDeadEnd(cx,cy)) {\r\n        this.pathStack.push([cx,cy]);\r\n        var directions = this.getValidDirections(cx,cy);\r\n        var randomDirection = Math.floor(Math.random()*directions.length);\r\n        \r\n        var nx = cx + directions[randomDirection][0];\r\n        var ny = cy + directions[randomDirection][1];\r\n\r\n        this.movePath(cx,cy,nx,ny);\r\n        this.position = [nx,ny];\r\n\r\n    } else { \r\n        this.backtrack();\r\n    }\r\n};\r\n\r\nMazeSolver.prototype.backtrack = function() {\r\n    var lastCell = this.pathStack.pop();\r\n    this.clearPath(this.position[0], this.position[1]);\r\n    this.position = [lastCell[0], lastCell[1]];\r\n};\r\n\r\n// } end class MazeSolver\r\n\r\n\r\n\r\n\r\nfunction solveMaze() {\r\n    solver = new MazeSolver(Maze);\r\n    solver.interval = setInterval(solver.solveStep, 5);\r\n}\r\n\r\nvar Maze;\r\nvar ctx = Canvas.getContext("2d");\r\nvar solver;\r\n\r\nctx.fillStyle = '#ffffff'\r\nctx.fillRect(0,0,Canvas.width, Canvas.height)\r\n\r\n\r\n\r\nvar mx = Math.floor((Canvas.width) / cellSize);\r\nvar my = Math.floor((Canvas.height) / cellSize);\r\n\r\nconsole.log([Canvas.height, $(window).height(), mx, my]);\r\n\r\nMaze = new Maze(2, mx, my, cellSize);\r\nMaze.render(ctx);\r\n\r\n$(window).keydown(function(e) {\r\n            \r\n    var tx = Maze.currentPosition[0];\r\n    var ty = Maze.currentPosition[1];\r\n\r\n    switch (e.keyCode) {\r\n\r\n        case 37: // left\r\n            if (!Maze.map[ty][tx][3]) Maze.move([-1,0]);\r\n        break;\r\n        case 38: // up\r\n            if (!Maze.map[ty][tx][0]) Maze.move([0,-1]);\r\n        break;\r\n        case 39: // right\r\n            if (!Maze.map[ty][tx][1]) Maze.move([1,0]);\r\n        break;\r\n        case 40: // down\r\n            if (!Maze.map[ty][tx][2]) Maze.move([0,1]);\r\n        break;\r\n        case 83: // 's' key\r\n            solver = new MazeSolver(Maze);\r\n            solver.interval = setInterval(solver.solveStep, 5);\r\n        break;\r\n\r\n    }\r\n});\r\n\r\nwindow.appdestroy = function() {\r\n\t$(window).unbind('keydown');\r\n  \tclearInterval(solver.interval);\r\n  \tdelete Maze;\r\n  \tdelete solver;\r\n}	{\r\n    "cellSize": {"type": "number", "min": 5, "max": 150, "default": 30},\r\n    "solutionPathColor": {"type": "color", "default": "#cc0055"}\r\n}		85	1	1	\N	\N
36	2016-04-10 03:25:56.53024+00	2016-06-10 18:26:04.826242+00	Subgroups of additive groups of integers mod(n)	This app explores some algebraic structures in group theory that have very revealing implications in number theory.  The graphs produced by this app are probably the best way to explain one of my favorite sets of numbers, a set that I call the "highly sliceable numbers".\r\n\r\nObserve how the graph for most integer-values yields a simple diamond, or something that looks like a cube or a lattice.  Even very large numbers often yield simple graphs.  But then, out of nowhere, a "highly sliceable number" produces an enormous subgroup graph that looks like a giant spaceship!\r\n\r\nThis is because these numbers have an enormous number of divisors, compared to other numbers in the same neighborhood. The first elements of the series that generates the set are {1, 2, 6, 12, 60, 60, 420, 840, 2520, 2520, 27720, 27720, 360360, ...}. We see the smaller numbers in this set often in daily life. Specifically 12 and 60. Why do we so often concern ourselves with a "dozen" of something? Why are there 60 minutes in the hour, 60 seconds in the minute? Why do we keep track of time in cycles of 12 hours?\r\n\r\nThe reason is because these numbers have an enormous number of divisors compared to their neighboring numbers. Whereas a number like 10 has only two divisors: {2,5}, 12 has twice as many: {2, 3, 4, 6}. Thus a dozen can be equally divided into 2, 3, 4, or 6 parts. If someone needs to fairly divide 12 eggs among n friends, there are 4 different ways in which to do this, so it is possible for 1, 2, 3, or 4 friends. The situation is even more dramatic by the very next number, 60. While neighbors of 60 have only a few divisors, 60 has 10 divisors: {2,3,5,4,6,10,12,15,20,30}. Why is it that it is so convenient to speak of "in 15 minutes", "in 20 minutes," etc.? Because they all divide 60 evenly.	text/paperscript	//Canvas = view._context.canvas;\n//view.viewSize = new Size(Canvas.width, Canvas.height);\n\nfunction get_divisors(n) {\n\treturn _.filter(_.range(1,n+1), function(i) {\n\t\treturn n%i==0;\n\t})\n}\n\nfunction isPrime(n) {\n\tif (n==1) \n\t\treturn false;\n\tfor (var i=2; i<n; i++) {\n\t\tif (n%i == 0) \n\t\t\treturn false;\n\t}\n\treturn true;\n}\n\nfunction is_member(x, rows) {\n\treturn _.includes(_.flatten(rows), x);\n}\n\nfunction subgroups(n) {\n\n\tvar rows = [[1]].concat([\n\t\t_.filter( _.range(1, Math.floor(n/2)), function(i) {\n\t\t\treturn n%i == 0 && isPrime(i);\n\t\t})\n\t]);\n\n\twhile (1) {\n\n\t\tvar newrow = [];\n\t\t_.each(rows[rows.length-1], function(element) {\n\t\t\t_.each(_.range(1, rows.length), function(prev_index) {\n\n\t\t\t\tvar prevrow = rows[prev_index];\n\t\t\t\t_.each(prevrow, function(e2) {\n\t\t\t\t\tvar m = element * e2;\n\t\t\t\t\tif (newrow.length > 0 && m == n) \n\t\t\t\t\t\treturn;\n\t\t\t\t\tif (n%m==0 && !is_member(m,rows) && !_.includes(newrow, m)) {\n\t\t\t\t\t\t_.each(newrow, function(ne) {\n\t\t\t\t\t\t\tif (ne > m && ne % m == 0) \n\t\t\t\t\t\t\t\treturn;\n\t\t\t\t\t\t})\n\t\t\t\t\t\tnewrow.push(m);\n\t\t\t\t\t}\n\t\t\t\t});\n\t\t\t});\n\t\t});\n\t\t\n\t\tif (newrow.length == 0)\n\t\t\tbreak;\n\n\t\tvar newrow_relprime = newrow.sort(function(a,b) { return a - b; });\n\t\trows.push(newrow_relprime);\n\n\t}\n\n\treturn rows.reverse();\n}\n\n\nvar color1 = new Color({\n\thue: 350,\n\tsaturation: 0.1,\n\tbrightness: 0.9\n});\n\n\nif (isPrime(integer_group)) {\n\n\tvar circ = new Path.Circle({\n\t\tcenter: view.center,\n\t\tradius: 100,\n\t\tfillColor: color1\n\t});\n\n\tvar text = new PointText({\n\t    point: view.center,\n\t    justification: 'center',\n\t    content: integer_group.toString(),\n\t    fillColor: 'black',\n\t    fontFamily: 'Courier New',\n\t    fontWeight: 'bold',\n\t    fontSize: 32\n\t});\n\n\tvar text = new PointText({\n\t    point: new Point(view.center.x, view.center.y + 25),\n\t    justification: 'center',\n\t    content: 'prime',\n\t    fillColor: 'black',\n\t    fontFamily: 'Courier New',\n\t    fontSize: 14\n\t});\n\n} else {\n\n\tS = subgroups(integer_group);\n\tvar positions = {};\n\n\tvar rowheight = view.viewSize._height / S.length;\n\t_.each(S, function(row, i) {\n\n\t\tvar centerY = (rowheight*i) + (rowheight/2);\n\t\tvar colwidth = view.viewSize._width / row.length;\n\n\t\t_.each(row, function(num, j) {\n\n\t\t\tvar centerX = (colwidth*j) + (colwidth/2);\n\t\t\tvar center1 = new Point(centerX, centerY);\n\t\t\tvar center2 = new Point(centerX, (centerY+4));\n\n\t\t\tpositions[num.toString()] = [centerX, centerY];\n\n\t\t\tvar circ = new Path.Circle({\n\t\t\t\tcenter: center1,\n\t\t\t\tradius: 20,\n\t\t\t\tfillColor: color1\n\t\t\t});\n\n\t\t\tvar text = new PointText({\n\t\t\t    point: center2,\n\t\t\t    justification: 'center',\n\t\t\t    content: num.toString(),\n\t\t\t    fillColor: 'black',\n\t\t\t    fontFamily: 'Courier New',\n\t\t\t    fontWeight: 'bold',\n\t\t\t    fontSize: 16\n\t\t\t});\n\t\t})\n\t\t\n\t});\n\n\tvar divisors = get_divisors(integer_group);\n\tvar _S = S.reverse();\n\n\t_.each(divisors, function(div) {\n\t\t_.each(_S, function(row, i) {\n\t\t\t_.each(row, function(num) {\n\t\t\t\tif (div == num) {\n\t\t\t\t\tif (_S.length > i+1) {\n\t\t\t\t\t\tvar nextrow = _S[i+1];\n\t\t\t\t\t\tvar factors = [];\n\t\t\t\t\t\t_.each(nextrow, function(j) {\n\t\t\t\t\t\t\tif (j%div==0) {\n\t\t\t\t\t\t\t\tfactors.push(j);\n\t\t\t\t\t\t\t\tvar line = new Path.Line({\n\t\t\t\t\t\t            strokeColor: new Color(0.4,0.4,0.4,0.75),\n\t\t\t\t\t\t            strokeWidth: 1,\n\t\t\t\t\t\t            from: positions[num.toString()],\n\t\t\t\t\t\t            to: positions[j.toString()]\n\t\t\t\t\t\t        });\n\t\t\t\t\t\t        project.activeLayer.insertChild(0,line);\n\t\t\t\t\t\t\t}\n\t\t\t\t\t\t});\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t});\n\t\t});\n\t});\n\n}\n\nvar renderDone = false;\nview.onFrame = function(e) {\n\tif (!renderDone && view.isVisible() && view.isInserted()) {\n\t  \trenderDone = true;\n\t \twindow.renderingDone(); \n\t}\n}\n\n\ntry {\n    window.featureDisplay("$\\\\{H\\: H \\\\leqslant (\\\\mathbb{Z}/" + \n    \tinteger_group + "\\\\space \\\\mathbb{Z})\\\\}$", {"font-size":"18px"});\n} catch (e) {}	{\n  "integer_group": {"type":"number", "default":840, "min":2, "max":99999999999, "index":true}\n}		582	6	1	\N	Diamonds, lattices, and giant spaceships :: the "highly sliceable numbers"
40	2016-05-18 07:04:55.658449+00	2016-05-28 05:27:18.365766+00	Riding through polynomial landscapes	An exploration of landscapes existing in the space of all polynomial surfaces in 2 vars or order 5.	text/paperscript	var Globals = {\n    coeffObj: {},\n\toriginalCoeffObj: {},\n\tanimationFrame: 0,\n\tadjustY: 0,\n\tcoeffObj: {},\n\tframeInterval: 1\n};\n\nvar Seed = {};\n\nvar regexp1 = /([a-z])\\^([0-9])/g;\nvar regexp2 = /(Math\\.pow\\([^\\)]+\\))(Math\\.pow\\([^\\)]+\\))/g;\n\nfor (var key in seed) {\n  \tif (_.includes(key, '^')) {\n        newkey = key.replace(regexp1, "Math.pow($1, $2)");\n        newkey = newkey.replace(regexp2, "$1 * $2");\n\t  \tGlobals.coeffObj[newkey] = seed[key].value;\n\t\tGlobals.originalCoeffObj[newkey] = seed[key].value;\n    } else {\n        Seed[key] = seed[key].value;\n    }\n}\n\n\nvar horizontalExpansionCoeff = 1.1;\nvar primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113];\n\n\n\n\n\n\nDARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\nLIGHT_GREY = new Color(0.85, 0.85, 0.85, 0.5);\n\nx_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\nx_axis.add(new Point(-view.size.width/2, 0));\nx_axis.add(new Point(view.size.width/2, 0));\nx_axis.closed = true;\n//project.activeLayer.insertChild(0,x_axis)\n\ny_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\ny_axis.add(new Point(0, -view.size.height/2));\ny_axis.add(new Point(0, view.size.height/2));\n\nx_lines = [];\n_.each(_.range(-10,10), function(n) {\n\tline = new Path({strokeColor: LIGHT_GREY });\n\tline.add( new Point(n, view.size.height/2) );\n\tline.add( new Point(n, -view.size.height/2) );\n\tline.closed = true;\n\t//project.activeLayer.insertChild(0, line);\n\tx_lines.push( line );\n});\n\ny_lines = [];\n_.each(_.range(-10,10), function(n) {\n\tline = new Path({strokeColor: LIGHT_GREY });\n\tline.add( new Point(view.size.width/2, n) );\n\tline.add( new Point(-view.size.width/2, n) );\n\tline.closed = true;\n\t//project.activeLayer.insertChild(0, line);\n\ty_lines.push( line );\n});\n\n\nfunction trans(lay, scale) {\n\tif (scale === undefined) scale = 1;\n\tlay.transform( new Matrix((view.size.width * scale),0,0,(view.size.height * -scale),\n\t\tview.center.x, view.center.y) );\n}\n\ntrans(project.activeLayer, 0.1);\n\n\n\nGraphLayer = new Layer();\n\n// define formal mathematical function\nMFunction = function(func, extrema) {\n\t//console.log(func.length);\n\tthis.func = func;\n\tif (!extrema) { extrema = [-5,5]; }\n\n\tthis.domain = {\n\t\telements: [],\n\t\tmin: (extrema[0] || -5),\n\t\tmax: (extrema[1] || 5)\n\t};\n\n\tthis.codomain = {\n\t\telements: [],\n\t\tmin: null,\n\t\tmax: null\n\t};\n\n\tthis.mapping = null;\n}\n\nMFunction.prototype = {\n\n\tcompute: function(delta) {\n\t\tif (!delta) { delta = 30; }\n\t\tthis.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\n\t\tthis.codomain.elements = _.map(this.domain.elements, this.func);\n\t\tthis.codomain.min = _.min(this.codomain.elements);\n\t\tthis.codomain.max = _.max(this.codomain.elements);\n\t\tthis.mapping = _.zip(this.domain.elements, this.codomain.elements);\n\t\tthis.mapObject = _.object(this.domain.elements, this.codomain.elements);\n\n\t\tthis._w = Math.abs(this.domain.max - this.domain.min);\n\t\tthis._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\n\n\t\tthis.transformation_matrix = new Matrix(\n\t\t\t(view.size.width / this._w)*horizontalExpansionCoeff, 0,\n\t\t\t0, (view.size.height / (-1*this._h)),\n\t\t\tview.center.x, view.center.y);\n\n\t\t// adjust to keep x=0 in vertical middle\n\t\t//console.log(this.transformation_matrix);\n\n\t\tif (this.zindex == 0) {\n\t\t\tGlobals.adjustY =  -1 * this.getValueAt(0);\n\t\t\t//console.log('Globals.adjustY', Globals.adjustY);\n\t\t}\n\t\tGlobals.adjustY = 0;\n\n\t\tthis.computed = true;\n\t},\n\n\tgetValueAt: function(x) {\n\t\tif (_.includes(this.domain.elements, x)) {\n\t\t\treturn this.mapObject[x];\n\t\t} else {\n\t\t\tvar elementsBefore = _.filter(this.domain.elements, function(element) {\n\t\t\t\treturn (element <= x);\n\t\t\t})\n\t\t\t//console.log('elementsBefore', elementsBefore);\n\t\t\tvar r = this.mapObject[elementsBefore[elementsBefore.length-1]];\n\t\t\t//console.log(r);\n\t\t\treturn r;\n\t\t}\n\t},\n\n\t// "flattens" mapping\n\t// i.e. [[1,2],3] -> [1,2,3]\n\tgetPoints: function() {\n\t\tif (!this.computed) { this.compute(); }\n\t\tthis.points = _.map(this.mapping, function(pair) {\n\t\t\treturn _.flatten([pair[0], pair[1]+Globals.adjustY]);\n\t\t});\n\t\treturn this.points;\n\t},\n\n\n\tdraw: function(path, tmatrix) {\n\n\t\tif (!this.computed) { this.compute(); }\n\n\t\tthis.path = path;\n\t\tthis.path.removeSegments();\n\t\tthis.tmatrix = tmatrix;\n\n\t\tthis.points.push(new Point(this.domain.max*1.5, Math.abs(this.codomain.min)*-1.7\n\t\t\t+ Math.abs(this.codomain.max)*-1.7));\n\t\tthis.points.push(new Point(this.domain.min*1.5, Math.abs(this.codomain.min)*-1.7\n\t\t\t+ Math.abs(this.codomain.max)*-1.7));\n\n\t\tvar self = this;\n\t\t_.each(this.points, function(p) {\n\t\t\tself.path.add(new Point(p));\n\t\t});\n\n\t\tthis.path.closed = true;\n\n\t\tif (tmatrix) {\n\t\t\tthis.path.transform(tmatrix);\n\t\t} else {\n\t\t\tthis.path.transform(this.transformation_matrix);\n\t\t}\n\t\t//this.path.smooth();\n\n\t},\n\n\tproject: function(z) {\n\t\tvar shrinkage = (this.zindex % Z_DEPTH) / Z_DEPTH;\n\t\tvar shrunk = 1 - shrinkage * 0.3;\n\t\t//console.log('effZ', shrinkage, shrunk);\n\t\t//this.path.scale(shrunk, shrunk, view.center)\n\t\tthis.path.rotate(-Seed.rotationFactor * Math.pow(this.zindex, Seed.rotationChangeOrder), view.center);\n\t\tthis.path.translate( new Point(Seed.projection_e, Seed.projection_f) )\n\n\t\t// check on key points to keep path's bottom edges off page\n\t\t// this.path.segments[0].point = new Point(this.domain.max*1.5, Math.abs(this.codomain.min)*-1.7\n\t\t//\t + Math.abs(this.codomain.max)*-1.7).transform(Globals.global_matrix);\n\t\t//\n\t\t// this.path.segments[this.path.segments.length-3].point = new Point(this.domain.min*1.5, Math.abs(this.codomain.min)*-1.7\n\t\t//\t + Math.abs(this.codomain.max)*-1.7).transform(Globals.global_matrix);\n\n\t\t// console.log('xx', this.path.segments[0].point.x);\n\t\t// this.path.segments[0].point.x = -10;\n\t\t// this.path.segments[this.path.segments.length-1].point.x = -10;\n\t\t//\n\t\t// this.path.segments[this.path.segments.length-2].point.x = view.bounds.right;\n\t\t// this.path.segments[this.path.segments.length-3].point.x = view.bounds.right;\n\t\t//this.path.segments[this.path.segments.length-1].point.y = view.height*1.2*(1/shrinkage);\n\t\t// = new Point(-10,-view.height);\n\n\n\t\t//\n\t\t// this.path.segments[this.path.segments.length-2].point.x = view.width*1.3;\n\t\t// this.path.segments[this.path.segments.length-2].point.y = -view.height*1.3;\n\t\t//\n\t\t// this.path.segments[this.path.segments.length-1].point.x = -10;\n\t\t// this.path.segments[this.path.segments.length-1].point.y = -view.height*1.3;\n\n\t}\n\n}\n\n\n\n\nvar PolynomialSurfaceSlice = function(x, y, cf) {\n\tfn = _.reduce(_.mapObject(cf, function(value, key) {\n\t\treturn value.toString() + '*' + key.toString()\n\t}), function(a,b) {\n\t\treturn a+'+'+b;\n\t});\n\t//console.log(fn);\n\teval("var r = " + fn + ";");\n\treturn r;\n}\n\n\nfunction changeCoeffs() {\n\tGlobals.coeffObj = _.object(_.map(_.pairs(Globals.coeffObj), function(pair, index) {\n\t\tpair[1] = Globals.originalCoeffObj[pair[0]] * 10 * Math.cos(  Globals.animationFrame/(primes[index]) );\n\t\treturn pair;\n\t}))\n}\n\nvar Z_DEPTH = Seed.Z_DEPTH;\n\nxrange = [-Seed.radiusX, Seed.radiusX];\nzrange = [Seed.zStart, Seed.zEnd];\n\nvar slices = [];\nvar sliceFunctions = [];\n\nvar alphaCoeffs = _.map(_.range(Z_DEPTH), function(z) {\n\treturn 0.6-((z/Z_DEPTH)*0.4);\n});\n\nvar sliceColors = _.map(_.range(Z_DEPTH), function(n) {\n\tclr = new Color(0.1,1,0.1,0.4*alphaCoeffs[n]);\n\tclr.hue += 60 * Math.sin(n);\n\tclr.brightness = 1 - (Math.sin(n)/2 + 1/2)/6;\n\treturn clr;\n});\n\nvar zrange_index = 0;\nfunction drawZRange(a,b) {\n\n\tzspace = numeric.linspace(a, b, Z_DEPTH);\n\tzindex = 0;\n\n\t//console.log('zrange_index = '+zrange_index, zspace[0]);\n\n\t_.each(zspace, function(z) {\n\n\t\tvar path, sliceFunction;\n\t\tif (zrange_index == 0) {\n\t\t\tpath = new Path({\n\t\t\t\tstrokeColor: new Color(0.3, 0.3, 0.3, 0.6*alphaCoeffs[zindex]),\n\t\t\t\tstrokeWidth: 1,\n\t\t\t\tfillColor: sliceColors[zindex],\n\t\t\t});\n\t\t\tsliceFunction = new MFunction(function(x) {\n\t\t\t\treturn PolynomialSurfaceSlice(x,z,Globals.coeffObj);\n\t\t\t}, [xrange[0],xrange[1]]);\n\n\t\t\tsliceFunction.zindex = zindex;\n\t\t\tsliceFunction.zrange_index = zrange_index;\n\t\t\tsliceFunction.compute();\n\n\t\t\tGlobals.transformation_matrix = sliceFunction.transformation_matrix;\n\t\t\t//console.log(Globals.transformation_matrix);\n\t\t\t//Globals.transformation_matrix.f += Globals.adjustY;\n\t\t\t//console.log(Globals.transformation_matrix);\n\n\t\t} else {\n\t\t\tpath = slices[zindex];\n\t\t\tsliceFunction = new MFunction(function(x) {\n\t\t\t\treturn PolynomialSurfaceSlice(x,z,Globals.coeffObj);\n\t\t\t}, [xrange[0],xrange[1]]);\n\t\t\tsliceFunction.zindex = zindex;\n\t\t\tsliceFunction.zrange_index = zrange_index;\n\t\t}\n\n\t\tsliceFunction.z = z;\n\t\tsliceFunction.getPoints();\n\t\tsliceFunction.draw(path, Globals.transformation_matrix);\n\t\tsliceFunction.project(z);\n\n\t\tif (zrange_index == 0) {\n\t\t\tslices.push(path);\n\t\t\tsliceFunctions.push(sliceFunction);\n\t\t\tproject.activeLayer.insertChild(0,path);\n\t\t}\n\t\t//path.smooth();\n\n\t\tzindex++;\n\n\t})\n\n\tzrange_index++;\n}\n\ndrawZRange(zrange[0], zrange[1]);\n\nfunction zMove2(n) {\n\n\t//slices = [];\n\t//sliceFunctions = [];\n\t//delta = -0.01\n\t//delta = -0.05;\n\t//delta = (Math.cos(n/100));\n\t//console.log('del', delta);\n\t//theta = n/10;\n\t//zrange2 = [zrange[0]*Math.cos(theta), zrange[1]*Math.cos(theta)];\n\t//zrange = [zrange[0]+delta, zrange[1]+delta];\n\t//console.log(zrange2);\n\t//project.activeLayer.removeChildren();\n\n\n\tchangeCoeffs();\n\n\tdrawZRange(zrange[0], zrange[1]);\n}\n\n\n\nfunction onResize(event) {\n\tproject.activeLayer.position = view.center;\n}\n\nview.onFrame = function(event) {\n\tif (event.count % Globals.frameInterval !== 0) return;\n\tGlobals.animationFrame = event.count/Globals.frameInterval;\n\tzMove2(Globals.animationFrame);\n}	{\n\t"radiusX":\t\t  {"type":"number", "default":6},\n\t"Z_DEPTH":\t\t  {"type":"number", "default":15},\n\t"zStart":\t\t   {"type":"number", "default":-0.01},\n\t"zEnd":\t\t\t {"type":"number", "default":-7},\n\t"projection_e":\t {"type":"number", "default":-10},\n\t"projection_f":\t {"type":"number", "default":30},\n\t"rotationFactor":   {"type":"number", "default":0.15},\n\t"rotationChangeOrder": {"type":"number", "default":-2},\n\t"y^1":\t  {"type":"number", "coefficient":true, "default":1,  "varname":"y"},\n\t"y^2":\t{"type":"number", "coefficient":true, "default":2,  "varname":"y2"},\n\t"y^3":\t{"type":"number", "coefficient":true, "default":3,  "varname":"y3"},\n\t"y^4":\t{"type":"number", "coefficient":true, "default":-2, "varname":"y4"},\n\t"y^5":\t{"type":"number", "coefficient":true, "default":5,  "varname":"y5"},\n\t"x^1":\t  {"type":"number", "coefficient":true, "default":1,  "varname":"x"},\n\t"x^1y^1":\t {"type":"number", "coefficient":true, "default":1,  "varname":"xy"},\n\t"x^1y^2":   {"type":"number", "coefficient":true, "default":0,  "varname":"xy2"},\n\t"x^1y^3":   {"type":"number", "coefficient":true, "default":7,  "varname":"xy3"},\n\t"x^1y^4":   {"type":"number", "coefficient":true, "default":1,  "varname":"xy4"},\n\t"x^2":\t{"type":"number", "coefficient":true, "default":1,  "varname":"x2"},\n\t"x^2y^1":   {"type":"number", "coefficient":true, "default":1,  "varname":"x2y"},\n\t"x^2y^2": {"type":"number", "coefficient":true, "default":-13,"varname":"x2y2"},\n\t"x^2y^3": {"type":"number", "coefficient":true, "default":1,  "varname":"x2y3"},\n\t"x^3":\t{"type":"number", "coefficient":true, "default":1,  "varname":"x3"},\n\t"x^3y^1":   {"type":"number", "coefficient":true, "default":0,  "varname":"x3y"},\n\t"x^3y^2": {"type":"number", "coefficient":true, "default":1,  "varname":"x3y2"},\n\t"x^4":\t{"type":"number", "coefficient":true, "default":1,  "varname":"x4"},\n\t"x^4y^1":   {"type":"number", "coefficient":true, "default":-5, "varname":"x4y"},\n\t"x^5":\t{"type":"number", "coefficient":true, "default":3,  "varname":"x5", "index":true}\n}	\N	20	2	1	\N	An exploration of 5-th degree polynomial surfaces in 2 variables
39	2016-05-03 10:47:16.949777+00	2016-06-01 00:54:05.375018+00	Transformations of grid about moving point	An experiment with iterated transformations on a grid, this app continuously transforms each point in porportion to its distance from a fixed point (the origin at first).   Written procedurally, it is not readily apparent, but the "attraction" toward the fixed point works in a way similar to gravity.  (The points attraction toward the fixed point is inversely porportional to the length of the vector.  That is, the closer the point is to the attracting fixed point, the faster it moves toward it.)\r\n\r\nAs thus described, the transformation would produce a simply oscilating system.  But, every time a point is sent closer toward the attracting fixed point, the vector's is offset by a tiny angle, sending points spiraling around the fixed point instead of directly into it.  On top of that, the fixed point itself moves each iteration!  This way, we get a very interesting chaotic system, which actually ends up drawing what looks eerily like the blossoming pods of Papaver Somniferum!	text/paperscript	DARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);\r\nLIGHT_GREY = new Color(0.7, 0.7, 0.7, 0.7);\r\n\r\nif (!speed_coefficient) speed_coefficient = 1;\r\n\r\nvar cartesian_matrix = new Matrix(5,0,0,-5, view.center.x, view.center.y);\r\n\r\nvar lines = [];\r\n\r\n_.each(_.range(-10,11), function(i) {\r\n\r\n\tvar path1 = new Path({\r\n\t\tstrokeWidth: 1,\r\n\t\tstrokeColor: DARK_GREY\r\n\t});\r\n\tvar points1 = _.map(_.range(-10,11), function(p) {\r\n\t\treturn new Point(p*10,i*10);\r\n\t});\r\n\t_.each(points1, function(p) {\r\n\t\tpath1.add(p);\r\n\t})\r\n\tlines.push(path1);\r\n\r\n})\r\n\r\n_.each(_.range(-10,11), function(i) {\r\n\r\n\tvar path2 = new Path({\r\n\t\tstrokeWidth: 1,\r\n\t\tstrokeColor: DARK_GREY\r\n\t});\r\n\tvar points2 = _.map(_.range(-10,11), function(p) {\r\n\t\treturn new Point(i*10,p*10);\r\n\t});\r\n\t_.each(points2, function(p) {\r\n\t\tpath2.add(p);\r\n\t})\r\n\tlines.push(path2);\r\n\r\n})\r\n\r\n\r\nproject.activeLayer.matrix = cartesian_matrix\r\n\r\n\r\n// connect points\r\n\r\n\r\n// rasterize never\r\n\r\n\r\n// var map = {\r\n// \tstring: '(x^2-i)(x+2)',\r\n// \ttransformation: function(x,y) {\r\n// \t\treturn new Point(Math.sin(x), - 2*Math.cos(y));\r\n// \t}\r\n// }\r\n\r\n\r\n// transform all points, see if points in both sets move ok\r\nvar transformation = new Matrix(1, 0, 0, 1, 0.01, -0.1);\r\ntransformation.rotate(0.1); \r\ntransformation.scale(0.99);\r\nconsole.log('trans', transformation)\r\n\r\nvar fixedpoint = (new Point(0,0)).transform(cartesian_matrix)\r\n//var radiusOfInversion = \r\n\r\nfunction applyTransform(seg,t) {\r\n\tvar vec = fixedpoint - seg.point\r\n\t\r\n\tif (vec.length != 0) {\r\n\t\tvec.angle += vec.length;\r\n\t \t\r\n\t\tseg.point = seg.point + (vec.normalize()*Math.cos(t/10))\r\n\t\t\r\n\t\t//console.log(fixedpoint)\r\n\t}\r\n\t\r\n\tfixedpoint = (new Point(0,0) + new Point(rx*Math.cos(t), ry*Math.sin(t))).transform(cartesian_matrix);\r\n\t\r\n\tseg.path.smooth();\r\n}\r\n\r\nview.onFrame = function(e) {\r\n\t// e {delta, time, count}\r\n\t_.each(lines, function(line) {\r\n\t\t_.each(line.segments, function(seg) {\r\n\t\t\tapplyTransform(seg, e.time / speed_coefficient)\r\n\t\t\t//console.log(map.transformation(seg.point.x, seg.point.y))\r\n\t\t\t//seg.point = map.transformation(seg.point.x, seg.point.y);\r\n\t\t})\r\n\t})\r\n}	{\r\n  "rx":{"type":"number","default":2},\r\n  "ry":{"type":"number","default":2},\r\n  "speed_coefficient":{"type":"number", "default": 1}\r\n}		71	2	1	\N	Papaver gravitation
33	2016-04-05 01:19:50.444524+00	2016-05-27 03:09:56.279155+00	Bivariate Polynomial Landscape	Choose coefficients of high-degree a polynomial function in 2 variables, as well as the 3x3 matrix used to project the graph of the surface onto a 2-dimensional canvas.  Many intricate and beautiful scenes emerge with certain affine transformations.  Defaults to a "standard" parallel projection of the z-axis (the axis "coming out of the screen")	text/paperscript	//Canvas = view._context.canvas;\n//view.viewSize = new Size(Canvas.width, Canvas.height);\n\nvar coeffs = _.mapObject(seed, function(val,key) {\n    return val.value;\n});\n\nvar polynomial_string = _.reduce(\n    _.filter(_.map(_.pairs(coeffs), function(coeff) {\n        var s = coeff[1] == 1 ? coeff[0].toString() : \t\n\t\t\tcoeff[1].toString()+coeff[0];\n        if (coeff[1] == 0) s = '';\n        return s;\n    }), function(x) {\n        return x != '';\n    }), function(a,b) {\n        var r = a;\n        var bnum = parseInt(b.replace(/[^0-9\\-]*/, '')) || 1;\n        r += (bnum > 0 ? '+'+b : b);\n        return r;\n    }, '');\n\nif (polynomial_string.substr(0,1) == '+') {\n    polynomial_string = polynomial_string.substr(1, polynomial_string.length);\n}\n\n\n\nDARK_GREY = new Color(0.3, 0.3, 0.3, 0.8);\nLIGHT_GREY = new Color(0.9, 0.9, 0.9, 0.2);\n\nx_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\nx_axis.add(new Point(-view.size.width/2, 0));\nx_axis.add(new Point(view.size.width/2, 0));\nx_axis.closed = true;\n//project.activeLayer.insertChild(0,x_axis)\n\ny_axis = new Path({ strokeColor: DARK_GREY, strokeWidth: 0.3, strokeScaling: false });\ny_axis.add(new Point(0, -view.size.height/2));\ny_axis.add(new Point(0, view.size.height/2));\n\nx_lines = [];\n_.each(_.range(-10,10), function(n) {\n    line = new Path({strokeColor: LIGHT_GREY });\n    line.add( new Point(n, view.size.height/2) );\n    line.add( new Point(n, -view.size.height/2) );\n    line.closed = true;\n    //project.activeLayer.insertChild(0, line);\n    x_lines.push( line );\n});\n\ny_lines = [];\n_.each(_.range(-10,10), function(n) {\n    line = new Path({strokeColor: LIGHT_GREY });\n    line.add( new Point(view.size.width/2, n) );\n    line.add( new Point(-view.size.width/2, n) );\n    line.closed = true;\n    //project.activeLayer.insertChild(0, line);\n    y_lines.push( line );\n});\n\nfunction transformToCartesian(lay) {\n    lay.transform( new Matrix((view.size.width / 10),0,0,(view.size.height / -10), view.center.x, view.center.y) );\n}\n\ntransformToCartesian(project.activeLayer);\n\n\n// define formal mathematical function\nMFunction = function(func, extrema) {\n    //console.log(func.length);\n    this.func = func;\n    if (!extrema) { extrema = [-5,5]; }\n\n    this.domain = {\n        elements: [],\n        min: (extrema[0] || -5),\n        max: (extrema[1] || 5)\n    };\n\n    this.codomain = {\n        elements: [],\n        min: null,\n        max: null\n    };\n\n    this.mapping = null;\n}\n\nMFunction.prototype = {\n    \n    compute: function(delta) {\n        if (!delta) { delta = 50; }\n        this.domain.elements = numeric.linspace(this.domain.min, this.domain.max, delta);\n        this.codomain.elements = _.map(this.domain.elements, this.func);\n        this.codomain.min = _.min(this.codomain.elements);\n        this.codomain.max = _.max(this.codomain.elements);\n        this.mapping = _.zip(this.domain.elements, this.codomain.elements);\n\n        this._w = Math.abs(this.domain.max - this.domain.min);\n        this._h = _.max(  [Math.abs(this.codomain.max),  Math.abs(this.codomain.min)]  );\n\n        this.transformation_matrix = new Matrix(\n            (view.size.width / this._w), 0,\n            0, (view.size.height / (-1*this._h)), \n            view.center.x, view.center.y);\n\n        this.computed = true;\n        //console.log("computed")\n    },\n\n    // "flattens" mapping\n    // i.e. [[1,2],3] -> [1,2,3]\n    getPoints: function() {\n        if (!this.computed) { this.compute(); }\n        this.points = _.map(this.mapping, function(pair) {\n            return _.flatten(pair);\n        });\n        return this.points;\n    },\n\n\n    draw: function(path, matrix_premult, map3d, tmatrix) {\n\n        if (!this.computed) { this.compute(); }\n\n        if (map3d) {\n            this.points = this.points3d;\n        } else {\n            this.points = this.getPoints();\n        }\n\n        if (matrix_premult) {\n            this.points = _.map(this.points, function(p) {\n                return numeric.dot(matrix_premult, p);\n            })\n        }\n\n        _.each(this.points, function(p) {\n            path.add(new Point(p));\n        })\n\n        path.add(new Point(this.domain.max*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\n        path.add(new Point(this.domain.min*2, Math.abs(this.codomain.min)*-5 + Math.abs(this.codomain.max)*-5));\n        path.closed = true;\n\n        if (tmatrix) {\n            path.transform(tmatrix);\n        } else {\n            path.transform(this.transformation_matrix);\n        } \n    }\n}\n\nvar PolynomialObj = {};\n$.post("/symbolic_math/latex/", {\n    expressionString: polynomial_string\n}, function(data) {\n  \n    PolynomialObj = data;\n    console.log(PolynomialObj)\n    startRendering();\n  \n  \ttokens = PolynomialObj.latex.split(" ");\n\tline_length = Math.ceil(tokens.length/2);\n\tline2 = tokens.splice(-1*line_length).join(" ");\n\tline1 = tokens.join(" ");\n\n\ttry {\n      var text = [\n\t\t'Polynomial Surface:<br />', \n\t\t"$f(x,y) = " + line1 + "\\\\\\\\\\n\\\\space \\\\space \\\\space \\\\space " \n            + line2 + "$",\n\t\t//'<div style="margin-top: 15px;">Projection Matrix:</div>',\n        //"$\\\\left(\\\\begin{array}{rrr}1 & 0 & \\\\frac{1}{2}\\\\sqrt{2}\\\\\\\\\\n 0 & 1 & \\\\frac{1}{2}\\\\sqrt{2}\\\\end{array}\\\\right)$"];\n\t\t];\n      var css = {"font-size":"11px", "color:":"#888888", "background-color": "rgba(230,230,230,0.7)"};\n      window.featureDisplay(text, css);\n    } catch (e) { console.log(e); }\n  \n});\n\nvar Polynomial = function(x,y) {\n    eval("var r = " + PolynomialObj.javascript + ";");\n    return r;\n}\n\nvar polynomial_degree = 5;\nvar zindex = undefined;\n\nfunction startRendering() {\n\n    slices = [];\n    zrange = [-15,0];\n    xrange = [-9, 9];\n    zspace = numeric.linspace(zrange[0], zrange[1], 50);\n\n    F0 = function(x) { return Polynomial(x,0); }\n    slice0 = new MFunction(F0, [xrange[0],xrange[1]]);\n    slice0.compute();\n    global_matrix = slice0.transformation_matrix;\n\n    CartesianMatrix = new Matrix(1,0,0,-1, view.center.x, view.center.y);\n\n    // begin drawing process\n    GraphLayer = new Layer({\n         blendMode: "multiply",\n    });\n\n    console.log("global matrix"); console.log(global_matrix);\n\n    function_shown = false;\n    zindex = 0;\n\n}\n\nvar animating = true;\nview.onFrame = function(event) {\n    \n    if (zindex != undefined && zindex < zspace.length) {\n        \n        l = new Layer({\n            //blendMode: "multiply"\n        });\n\n        z = zspace[zindex];\n    \n        F = function(x) { return Polynomial(x,z); }\n        slice = new MFunction(F, [xrange[0],xrange[1]]);\n\n        points3d = slice.getPoints();\n        _.each(_.range(points3d.length), function(i) { points3d[i].push(z); });\n\n        slice.points3d = points3d\n\n        transformation = [\n            [1, 0, 0], //5*Math.cos(Math.PI/-4)],\n            [0, 1, 0] //5*Math.sin(Math.PI/-4)],\n        ];\n\n        path1 = new Path({\n            strokeColor: new Color(0.3, 0.3, 0.3, 0.5),\n            strokeWidth: 1,\n            closed: true,\n            fillColor: new Color(Math.random(),1,Math.random(),0.2),\n        });\n\n        slice.draw(path1, transformation, true, global_matrix);\n        //path.transform(CartesianMatrix)\n\n        // transformation2 = new Matrix(\n        //     1-(z/50), 0, 0, 1-(z/50), 0, 0 //5*Math.sin(Math.PI/-4)],\n        // );\n\n        transformation2 = new Matrix(\n            1, 0, 0, 1, 0, 0 //5*Math.sin(Math.PI/-4)],\n        );\n\n        //path1.transform(transformation2);\n        path1.scale(1-(z/50), 1-(z/50), view.center)\n        path1.translate(new Point(-10*z, 30*z))\n        \n        project.activeLayer.insertChild(0,path1);\n\n        slices.push({layer: project.activeLayer,\n            func: slice,\n            transformation: transformation,\n            path: path1});\n\n        if (zindex == zspace.length-1) { \n            //console.log(slices);\n            //view.pause();\n        }\n        zindex++;\n\n    } else {\n\t \tif (zindex && animating) {\n\t\t  \tanimating = false;\n\t\t \twindow.renderingDone(); \n\t\t}\n\t}\n    \n}	{\n    "y":{"type":"number","default":1,"varname":"y"},\n    "y^2":{"type":"number","default":2,"varname":"y2"},\n    "y^3":{"type":"number","default":3,"varname":"y3"},\n    "y^4":{"type":"number","default":-2,"varname":"y4"},\n    "y^5":{"type":"number","default":5,"varname":"y5"},\n    "x":{"type":"number","default":1,"varname":"x"},\n    "xy":{"type":"number","default":1,"varname":"xy"},\n    "xy^2":{"type":"number","default":0,"varname":"xy2"},\n    "xy^3":{"type":"number","default":7,"varname":"xy3"},\n    "xy^4":{"type":"number","default":1,"varname":"xy4"},\n    "x^2":{"type":"number","default":1,"varname":"x2"},\n    "x^2y":{"type":"number","default":1,"varname":"x2y"},\n    "x^2y^2":{"type":"number","default":-13,"varname":"x2y2"},\n    "x^2y^3":{"type":"number","default":1,"varname":"x2y3"},\n    "x^3":{"type":"number","default":1,"varname":"x3"},\n    "x^3y":{"type":"number","default":0,"varname":"x3y"},\n    "x^3y^2":{"type":"number","default":1,"varname":"x3y2"},\n    "x^4":{"type":"number","default":1,"varname":"x4"},\n    "x^4y":{"type":"number","default":-5,"varname":"x4y"},\n    "x^5":{"type":"number","default":3,"varname":"x5", "index":true}\n}		447	2	1	\N	Surfaces in 3-space transformed into cartoon 2-space
41	2016-05-28 05:13:18.115043+00	2016-05-28 05:52:31.639862+00	Transformation on nested sets	A step toward generalizing the papaver transformation.	text/paperscript	var countN = function(n, func) { _.each(_.range(n), func) };\n\nvar cartesianProduct = function(set1, set2) {\n\treturn _.map(set1, function(el1) {\n\t\treturn _.map(set2, function(el2) {\n\t\t\treturn [el1, el2];\n\t\t})\n\t});\n}\n\n\nDARK_GREY = new Color(0.6, 0.6, 0.6, 0.5);\nCARTESIAN = new Matrix(1,0,0,-1,view.center.x, view.center.y);\n\n//N = 5\nSCALE = 0.25;\n\n// first version constructs pointset from center out. grid comes out in zigzags?\n\n\npointsets = [];\ncountN(N, function(n) {\n\n\tif (n==0) {\n\t\t//var points = [[0,0]];\n\t\treturn;\n\t} else {\n\n\t\tvar set1 = _.range(-n, n+1);\n\t\tvar set2 = _.clone(set1).reverse();\n\t\tvar min = _.min(set1);\n\t\tvar max = _.max(set1)\n\n\t\t//console.log('Sets: ', set1, set2, 'min,max', min, max);\n\n\t\tvar points = _.map(set1, function(s) { return [min,s]; }).slice(1)  // left, <upward\n\t\t\t.concat( _.map(set1, function(s) { return [s,max]; }).slice(1)) // top, <right\n\t\t\t.concat( _.map(set2, function(s) { return [max,s]; }).slice(1)) // right, <downward\n\t\t\t.concat( _.map(set2, function(s) { return [s,min]; }).slice(1)) // bottom <left\n\t}\n\n\t//points.map(function(p){console.log(p)})\n\tpointsets.push(points.map(function(p){return (new Point(p)*100);}));\n\n})\n\nvar originMarker = new Path.Circle({\n\tradius: 0.1,\n\tfillColor: 'grey',\n\tcenter: [0,0]\n});\n\nvar dots = [];\n_.each(pointsets, function(pointset) {\n\t_.each(pointset, function(point) {\n\t\t//console.log(point);\n\t\t// var circ = new Path.Circle({\n\t\t// \tradius: 0.01,\n\t\t// \tfillColor: 'black',\n\t\t// \tcenter: point\n\t\t// });\n\t\t// dots.push(circ);\n\t});\n});\n\nvar paths = [];\n_.each(pointsets, function(pointset) {\n\tvar line = new Path({\n\t\tstrokeWidth: 1,\n\t\tstrokeColor: DARK_GREY\n\t});\n\t_.each(pointset, function(point) {\n\t\tline.add(point);\n\t})\n\tline.closed = true;\n\tpaths.push(line);\n})\n\nproject.activeLayer.transform(CARTESIAN.scale(SCALE));\n\nvar fixedpoint = (new Point(0,0)).transform(CARTESIAN.scale(SCALE));\nvar localOrigin = (new Point(0,0)).transform(CARTESIAN.scale(SCALE));\n\nfunction iterate(iteration, time) {\n\t//console.log('iterate', iteration, time);\n\tvar t;\n\tif (time != undefined) {\n\t\tt=time;\n\t} else {\n\t\tt=iteration;\n\t}\n\t_.each(paths, function(path) {\n\t\t_.each(path.segments, function(seg) {\n\t\t\t// var directionToOrigin = (localOrigin - seg.point).normalize();\n\t\t\t// directionToOrigin.angle += 0.5 * Math.sqrt(Math.pow(seg.point.x, 2)+Math.pow(seg.point.y, 2));\n\t\t\t// seg.point = seg.point + directionToOrigin/5;\n\t\t\tvar vec = fixedpoint - seg.point;\n\t\t\t//console.log('vec', vec)\n\t\t\tif (vec.length != 0) {\n\t\t\t\tvec.angle += vec.length;\n\t\t\t\tseg.point = seg.point + (vec.normalize()*Math.cos(t/A))\n\n\t\t\t\t//console.log(fixedpoint)\n\t\t\t}\n\t\t\tvar r = 1;//1.22; //Math.log(t)\n\t\t\tfixedpoint = (new Point(0,0) + new Point(r*Math.cos(t/B),\n\t\t\t\tr*Math.sin(t))).transform(CARTESIAN.scale(SCALE));\n\t\t});\n\t\tpath.smooth();\n\t});\n}\n//\n// var iteration = 0;\n// setInterval(function() {\n// \titerate(iteration);\n// \titeration++;\n// }, 500)\n\nview.onFrame = function(event) {\n\t//if (event.count%10!=0) return;\n\titerate(event.count, event.time);\n}	{\n  "A":{"default":"7","type":"number"},\n  "B":{"default":"3","type":"number"},\n\t"N":{"default":"5","type":"number"},\n\t "SCALE":{"default":"0.25","type":"number"}\n}	\N	13	2	1	\N	Balls of string
\.


--
-- Data for Name: game_zeroplayergame_extraIncludes; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY "game_zeroplayergame_extraIncludes" (id, zeroplayergame_id, jslibrary_id) FROM stdin;
1	2	1
\.


--
-- Name: game_zeroplayergame_extraIncludes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('"game_zeroplayergame_extraIncludes_id_seq"', 1, true);


--
-- Name: game_zeroplayergame_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_zeroplayergame_id_seq', 1, false);


--
-- Data for Name: game_zeroplayergame_required_modules; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY game_zeroplayergame_required_modules (id, zeroplayergame_id, codemodule_id) FROM stdin;
1	5	1
2	5	2
3	27	1
4	27	2
\.


--
-- Name: game_zeroplayergame_required_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('game_zeroplayergame_required_modules_id_seq', 4, true);


--
-- Data for Name: portfolio_imagegallery; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_imagegallery (id, name) FROM stdin;
\.


--
-- Name: portfolio_imagegallery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_imagegallery_id_seq', 1, false);


--
-- Data for Name: portfolio_imagemodel; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_imagemodel (id, image, "timestamp", gallery_id) FROM stdin;
\.


--
-- Name: portfolio_imagemodel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_imagemodel_id_seq', 1, false);


--
-- Data for Name: portfolio_portfoliocategory; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_portfoliocategory (id, name, description, image) FROM stdin;
\.


--
-- Name: portfolio_portfoliocategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_portfoliocategory_id_seq', 1, false);


--
-- Data for Name: portfolio_portfolioitem; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_portfolioitem (id, title, subtitle, url, description, sourcecode, image, creationdate, category_id) FROM stdin;
\.


--
-- Name: portfolio_portfolioitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('portfolio_portfolioitem_id_seq', 1, false);


--
-- Data for Name: portfolio_proprietaryportfolioitem; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY portfolio_proprietaryportfolioitem (portfolioitem_ptr_id, company, gallery_id) FROM stdin;
\.


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY profiles_profile (user_id, slug, picture, bio, email_verified) FROM stdin;
1	5f4a81e2-0c14-435e-a4a4-b84f793fbc75	profile_pics/2016-02-02/97.jpg		f
2	8455a1e0-9dca-4738-b8e3-b6811e246439	profile_pics/2016-04-18/Screenshot_from_2016-04-13_190338.png	Dood who code-switched up-on the word 'code-switching' itself	f
\.


--
-- Data for Name: profiles_profile_followers; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY profiles_profile_followers (id, from_profile_id, to_profile_id) FROM stdin;
\.


--
-- Name: profiles_profile_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('profiles_profile_followers_id_seq', 1, false);


--
-- Data for Name: static_precompiler_dependency; Type: TABLE DATA; Schema: public; Owner: ninopq
--

COPY static_precompiler_dependency (id, source, depends_on) FROM stdin;
\.


--
-- Name: static_precompiler_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ninopq
--

SELECT pg_catalog.setval('static_precompiler_dependency_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_email_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user
    ADD CONSTRAINT authtools_user_email_key UNIQUE (email);


--
-- Name: authtools_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_groups_user_id_a8658824_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_user_id_a8658824_uniq UNIQUE (user_id, group_id);


--
-- Name: authtools_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user
    ADD CONSTRAINT authtools_user_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: authtools_user_user_permissions_user_id_3e9e8ba9_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_permissions_user_id_3e9e8ba9_uniq UNIQUE (user_id, permission_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: game_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_category
    ADD CONSTRAINT game_category_pkey PRIMARY KEY (id);


--
-- Name: game_codemodule_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_codemodule
    ADD CONSTRAINT game_codemodule_pkey PRIMARY KEY (id);


--
-- Name: game_codeswitchingphrase_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_codeswitchingphrase
    ADD CONSTRAINT game_codeswitchingphrase_pkey PRIMARY KEY (id);


--
-- Name: game_gameinstance_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_pkey PRIMARY KEY (id);


--
-- Name: game_gameinstance_seedParams_gameinstance_id_61e339cf_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_gameinstance_seedParams"
    ADD CONSTRAINT "game_gameinstance_seedParams_gameinstance_id_61e339cf_uniq" UNIQUE (gameinstance_id, seedkeyval_id);


--
-- Name: game_gameinstance_seedParams_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_gameinstance_seedParams"
    ADD CONSTRAINT "game_gameinstance_seedParams_pkey" PRIMARY KEY (id);


--
-- Name: game_gameinstance_vector_key; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_vector_key UNIQUE (vector);


--
-- Name: game_gameinstancesnapshot_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_gameinstancesnapshot
    ADD CONSTRAINT game_gameinstancesnapshot_pkey PRIMARY KEY (id);


--
-- Name: game_jslibrary_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_jslibrary
    ADD CONSTRAINT game_jslibrary_pkey PRIMARY KEY (id);


--
-- Name: game_savedfunction_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_savedfunction
    ADD CONSTRAINT game_savedfunction_pkey PRIMARY KEY (id);


--
-- Name: game_seedvectorparam_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_seedvectorparam
    ADD CONSTRAINT game_seedvectorparam_pkey PRIMARY KEY (id);


--
-- Name: game_zeroplayergame_extraInclud_zeroplayergame_id_2d035b3a_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT "game_zeroplayergame_extraInclud_zeroplayergame_id_2d035b3a_uniq" UNIQUE (zeroplayergame_id, jslibrary_id);


--
-- Name: game_zeroplayergame_extraIncludes_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT "game_zeroplayergame_extraIncludes_pkey" PRIMARY KEY (id);


--
-- Name: game_zeroplayergame_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_zeroplayergame_pkey PRIMARY KEY (id);


--
-- Name: game_zeroplayergame_required_mo_zeroplayergame_id_f81c04ef_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zeroplayergame_required_mo_zeroplayergame_id_f81c04ef_uniq UNIQUE (zeroplayergame_id, codemodule_id);


--
-- Name: game_zeroplayergame_required_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zeroplayergame_required_modules_pkey PRIMARY KEY (id);


--
-- Name: portfolio_imagegallery_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_imagegallery
    ADD CONSTRAINT portfolio_imagegallery_pkey PRIMARY KEY (id);


--
-- Name: portfolio_imagemodel_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_imagemodel
    ADD CONSTRAINT portfolio_imagemodel_pkey PRIMARY KEY (id);


--
-- Name: portfolio_portfoliocategory_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_portfoliocategory
    ADD CONSTRAINT portfolio_portfoliocategory_pkey PRIMARY KEY (id);


--
-- Name: portfolio_portfolioitem_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_portfolioitem
    ADD CONSTRAINT portfolio_portfolioitem_pkey PRIMARY KEY (id);


--
-- Name: portfolio_proprietaryportfolioitem_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY portfolio_proprietaryportfolioitem
    ADD CONSTRAINT portfolio_proprietaryportfolioitem_pkey PRIMARY KEY (portfolioitem_ptr_id);


--
-- Name: profiles_profile_followers_from_profile_id_8a9bcb07_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_profile_followers_from_profile_id_8a9bcb07_uniq UNIQUE (from_profile_id, to_profile_id);


--
-- Name: profiles_profile_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_profile_followers_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (user_id);


--
-- Name: static_precompiler_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY static_precompiler_dependency
    ADD CONSTRAINT static_precompiler_dependency_pkey PRIMARY KEY (id);


--
-- Name: static_precompiler_dependency_source_d8e91940_uniq; Type: CONSTRAINT; Schema: public; Owner: ninopq; Tablespace: 
--

ALTER TABLE ONLY static_precompiler_dependency
    ADD CONSTRAINT static_precompiler_dependency_source_d8e91940_uniq UNIQUE (source, depends_on);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: authtools_user_email_f133274f_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_email_f133274f_like ON authtools_user USING btree (email varchar_pattern_ops);


--
-- Name: authtools_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_groups_0e939a4f ON authtools_user_groups USING btree (group_id);


--
-- Name: authtools_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_groups_e8701ad4 ON authtools_user_groups USING btree (user_id);


--
-- Name: authtools_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_user_permissions_8373b171 ON authtools_user_user_permissions USING btree (permission_id);


--
-- Name: authtools_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX authtools_user_user_permissions_e8701ad4 ON authtools_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: game_category_6be37982; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_category_6be37982 ON game_category USING btree (parent_id);


--
-- Name: game_gameinstance_6072f8b3; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_gameinstance_6072f8b3 ON game_gameinstance USING btree (game_id);


--
-- Name: game_gameinstance_6ccdb143; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_gameinstance_6ccdb143 ON game_gameinstance USING btree (instantiator_id);


--
-- Name: game_gameinstance_seedParams_801ae61f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_gameinstance_seedParams_801ae61f" ON "game_gameinstance_seedParams" USING btree (gameinstance_id);


--
-- Name: game_gameinstance_seedParams_aa9ffff3; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_gameinstance_seedParams_aa9ffff3" ON "game_gameinstance_seedParams" USING btree (seedkeyval_id);


--
-- Name: game_gameinstance_vector_86d82897_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_gameinstance_vector_86d82897_like ON game_gameinstance USING btree (vector varchar_pattern_ops);


--
-- Name: game_gameinstancesnapshot_51afcc4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_gameinstancesnapshot_51afcc4f ON game_gameinstancesnapshot USING btree (instance_id);


--
-- Name: game_plerpingapp_5e7b1936; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_plerpingapp_5e7b1936 ON game_zeroplayergame USING btree (owner_id);


--
-- Name: game_plerpingapp_b583a629; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_plerpingapp_b583a629 ON game_zeroplayergame USING btree (category_id);


--
-- Name: game_savedfunction_5e7b1936; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_savedfunction_5e7b1936 ON game_savedfunction USING btree (owner_id);


--
-- Name: game_seedvectorparam_51afcc4f; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_seedvectorparam_51afcc4f ON game_seedvectorparam USING btree (instance_id);


--
-- Name: game_seedvectorparam_f382adfe; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_seedvectorparam_f382adfe ON game_seedvectorparam USING btree (app_id);


--
-- Name: game_zeroplayergame_5e7b1936; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_5e7b1936 ON game_zeroplayergame USING btree (owner_id);


--
-- Name: game_zeroplayergame_6be37982; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_6be37982 ON game_zeroplayergame USING btree (parent_id);


--
-- Name: game_zeroplayergame_b583a629; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_b583a629 ON game_zeroplayergame USING btree (category_id);


--
-- Name: game_zeroplayergame_extraIncludes_030a3785; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_zeroplayergame_extraIncludes_030a3785" ON "game_zeroplayergame_extraIncludes" USING btree (zeroplayergame_id);


--
-- Name: game_zeroplayergame_extraIncludes_32432e4e; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX "game_zeroplayergame_extraIncludes_32432e4e" ON "game_zeroplayergame_extraIncludes" USING btree (jslibrary_id);


--
-- Name: game_zeroplayergame_required_modules_030a3785; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_required_modules_030a3785 ON game_zeroplayergame_required_modules USING btree (zeroplayergame_id);


--
-- Name: game_zeroplayergame_required_modules_6cab8ff3; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX game_zeroplayergame_required_modules_6cab8ff3 ON game_zeroplayergame_required_modules USING btree (codemodule_id);


--
-- Name: portfolio_imagemodel_6d994cdb; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX portfolio_imagemodel_6d994cdb ON portfolio_imagemodel USING btree (gallery_id);


--
-- Name: portfolio_portfolioitem_b583a629; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX portfolio_portfolioitem_b583a629 ON portfolio_portfolioitem USING btree (category_id);


--
-- Name: portfolio_proprietaryportfolioitem_6d994cdb; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX portfolio_proprietaryportfolioitem_6d994cdb ON portfolio_proprietaryportfolioitem USING btree (gallery_id);


--
-- Name: profiles_profile_followers_658493f6; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX profiles_profile_followers_658493f6 ON profiles_profile_followers USING btree (to_profile_id);


--
-- Name: profiles_profile_followers_9c2b64df; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX profiles_profile_followers_9c2b64df ON profiles_profile_followers USING btree (from_profile_id);


--
-- Name: static_precompiler_dependency_1f903a40; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_1f903a40 ON static_precompiler_dependency USING btree (depends_on);


--
-- Name: static_precompiler_dependency_36cd38f4; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_36cd38f4 ON static_precompiler_dependency USING btree (source);


--
-- Name: static_precompiler_dependency_depends_on_a14c2c8b_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_depends_on_a14c2c8b_like ON static_precompiler_dependency USING btree (depends_on varchar_pattern_ops);


--
-- Name: static_precompiler_dependency_source_6c770ab0_like; Type: INDEX; Schema: public; Owner: ninopq; Tablespace: 
--

CREATE INDEX static_precompiler_dependency_source_6c770ab0_like ON static_precompiler_dependency USING btree (source varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_groups_group_id_fdf65e59_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_group_id_fdf65e59_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_groups_user_id_c1c2c51f_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_groups
    ADD CONSTRAINT authtools_user_groups_user_id_c1c2c51f_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_use_permission_id_039bf6fe_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_use_permission_id_039bf6fe_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtools_user_user_permi_user_id_d172ce6b_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY authtools_user_user_permissions
    ADD CONSTRAINT authtools_user_user_permi_user_id_d172ce6b_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_category_parent_id_4a4e38a7_fk_game_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_category
    ADD CONSTRAINT game_category_parent_id_4a4e38a7_fk_game_category_id FOREIGN KEY (parent_id) REFERENCES game_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinsta_gameinstance_id_17b880a7_fk_game_gameinstance_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_gameinstance_seedParams"
    ADD CONSTRAINT game_gameinsta_gameinstance_id_17b880a7_fk_game_gameinstance_id FOREIGN KEY (gameinstance_id) REFERENCES game_gameinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinstance_game_id_a878f786_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_game_id_a878f786_fk_game_zeroplayergame_id FOREIGN KEY (game_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinstance_instantiator_id_3f0b0fcb_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstance
    ADD CONSTRAINT game_gameinstance_instantiator_id_3f0b0fcb_fk_authtools_user_id FOREIGN KEY (instantiator_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_gameinstances_instance_id_d6d83406_fk_game_gameinstance_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_gameinstancesnapshot
    ADD CONSTRAINT game_gameinstances_instance_id_d6d83406_fk_game_gameinstance_id FOREIGN KEY (instance_id) REFERENCES game_gameinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_plerpingapp_owner_id_db15314c_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_plerpingapp_owner_id_db15314c_fk_authtools_user_id FOREIGN KEY (owner_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_savedfunction_owner_id_226d4578_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_savedfunction
    ADD CONSTRAINT game_savedfunction_owner_id_226d4578_fk_authtools_user_id FOREIGN KEY (owner_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_seedvectorpar_instance_id_cda21c91_fk_game_gameinstance_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_seedvectorparam
    ADD CONSTRAINT game_seedvectorpar_instance_id_cda21c91_fk_game_gameinstance_id FOREIGN KEY (instance_id) REFERENCES game_gameinstance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_seedvectorparam_app_id_d26d7218_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_seedvectorparam
    ADD CONSTRAINT game_seedvectorparam_app_id_d26d7218_fk_game_zeroplayergame_id FOREIGN KEY (app_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zerop_zeroplayergame_id_10eceedf_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zerop_zeroplayergame_id_10eceedf_fk_game_zeroplayergame_id FOREIGN KEY (zeroplayergame_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zerop_zeroplayergame_id_a5dd43ed_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT game_zerop_zeroplayergame_id_a5dd43ed_fk_game_zeroplayergame_id FOREIGN KEY (zeroplayergame_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergam_codemodule_id_a4a68a60_fk_game_codemodule_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame_required_modules
    ADD CONSTRAINT game_zeroplayergam_codemodule_id_a4a68a60_fk_game_codemodule_id FOREIGN KEY (codemodule_id) REFERENCES game_codemodule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergam_parent_id_00669d04_fk_game_zeroplayergame_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_zeroplayergam_parent_id_00669d04_fk_game_zeroplayergame_id FOREIGN KEY (parent_id) REFERENCES game_zeroplayergame(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergame__jslibrary_id_30752fb8_fk_game_jslibrary_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY "game_zeroplayergame_extraIncludes"
    ADD CONSTRAINT game_zeroplayergame__jslibrary_id_30752fb8_fk_game_jslibrary_id FOREIGN KEY (jslibrary_id) REFERENCES game_jslibrary(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergame_category_id_421feca0_fk_game_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_zeroplayergame_category_id_421feca0_fk_game_category_id FOREIGN KEY (category_id) REFERENCES game_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: game_zeroplayergame_owner_id_8ed6af34_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY game_zeroplayergame
    ADD CONSTRAINT game_zeroplayergame_owner_id_8ed6af34_fk_authtools_user_id FOREIGN KEY (owner_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: por_portfolioitem_ptr_id_da61254d_fk_portfolio_portfolioitem_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_proprietaryportfolioitem
    ADD CONSTRAINT por_portfolioitem_ptr_id_da61254d_fk_portfolio_portfolioitem_id FOREIGN KEY (portfolioitem_ptr_id) REFERENCES portfolio_portfolioitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: portfoli_category_id_db01a81d_fk_portfolio_portfoliocategory_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_portfolioitem
    ADD CONSTRAINT portfoli_category_id_db01a81d_fk_portfolio_portfoliocategory_id FOREIGN KEY (category_id) REFERENCES portfolio_portfoliocategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: portfolio_imag_gallery_id_ae9b842e_fk_portfolio_imagegallery_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_imagemodel
    ADD CONSTRAINT portfolio_imag_gallery_id_ae9b842e_fk_portfolio_imagegallery_id FOREIGN KEY (gallery_id) REFERENCES portfolio_imagegallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: portfolio_prop_gallery_id_e7ba0f54_fk_portfolio_imagegallery_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY portfolio_proprietaryportfolioitem
    ADD CONSTRAINT portfolio_prop_gallery_id_e7ba0f54_fk_portfolio_imagegallery_id FOREIGN KEY (gallery_id) REFERENCES portfolio_imagegallery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_p_from_profile_id_e7888571_fk_profiles_profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_p_from_profile_id_e7888571_fk_profiles_profile_user_id FOREIGN KEY (from_profile_id) REFERENCES profiles_profile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_pro_to_profile_id_562358dd_fk_profiles_profile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile_followers
    ADD CONSTRAINT profiles_pro_to_profile_id_562358dd_fk_profiles_profile_user_id FOREIGN KEY (to_profile_id) REFERENCES profiles_profile(user_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile_user_id_a3e81f91_fk_authtools_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ninopq
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_authtools_user_id FOREIGN KEY (user_id) REFERENCES authtools_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

