--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2017-05-03 09:43:31 ICT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12395)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 140884)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 140930)
-- Name: bus_routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bus_routes (
    id integer NOT NULL,
    name character varying,
    bus_type integer,
    list_bus_stations text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE bus_routes OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 140928)
-- Name: bus_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bus_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bus_routes_id_seq OWNER TO postgres;

--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 189
-- Name: bus_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bus_routes_id_seq OWNED BY bus_routes.id;


--
-- TOC entry 186 (class 1259 OID 140905)
-- Name: distances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE distances (
    id integer NOT NULL,
    origin integer,
    destination integer,
    distance_metter double precision,
    bus_route_id integer,
    route text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE distances OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 140903)
-- Name: distances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE distances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE distances_id_seq OWNER TO postgres;

--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 185
-- Name: distances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE distances_id_seq OWNED BY distances.id;


--
-- TOC entry 188 (class 1259 OID 140919)
-- Name: graph_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE graph_nodes (
    id integer NOT NULL,
    graph text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE graph_nodes OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 140917)
-- Name: graph_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE graph_nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE graph_nodes_id_seq OWNER TO postgres;

--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 187
-- Name: graph_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE graph_nodes_id_seq OWNED BY graph_nodes.id;


--
-- TOC entry 198 (class 1259 OID 141005)
-- Name: links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE links (
    id integer NOT NULL,
    origin integer,
    destination integer,
    cost double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE links OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 141003)
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE links_id_seq OWNER TO postgres;

--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 197
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE links_id_seq OWNED BY links.id;


--
-- TOC entry 194 (class 1259 OID 140962)
-- Name: list_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE list_nodes (
    id integer NOT NULL,
    bus_route_id integer,
    list text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE list_nodes OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 140960)
-- Name: list_nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE list_nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE list_nodes_id_seq OWNER TO postgres;

--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 193
-- Name: list_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE list_nodes_id_seq OWNED BY list_nodes.id;


--
-- TOC entry 196 (class 1259 OID 140979)
-- Name: nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nodes (
    id integer NOT NULL,
    bus_route_id integer,
    bus_station_id integer,
    arrival_time time without time zone,
    list_node_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE nodes OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 140977)
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nodes_id_seq OWNER TO postgres;

--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 195
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nodes_id_seq OWNED BY nodes.id;


--
-- TOC entry 192 (class 1259 OID 140942)
-- Name: bus_station_routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bus_station_routes (
    id integer NOT NULL,
    bus_route_id integer,
    bus_station_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE bus_station_routes OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 140940)
-- Name: bus_station_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bus_station_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bus_station_routes_id_seq OWNER TO postgres;

--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 191
-- Name: bus_station_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bus_station_routes_id_seq OWNED BY bus_station_routes.id;


--
-- TOC entry 184 (class 1259 OID 140894)
-- Name: bus_stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bus_stations (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    name character varying,
    address character varying,
    title character varying,
    code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE bus_stations OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 140892)
-- Name: bus_stations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bus_stations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bus_stations_id_seq OWNER TO postgres;

--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 183
-- Name: bus_stations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bus_stations_id_seq OWNED BY bus_stations.id;


--
-- TOC entry 181 (class 1259 OID 140876)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 141013)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 141011)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2086 (class 2604 OID 140933)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_routes ALTER COLUMN id SET DEFAULT nextval('bus_routes_id_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 140908)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY distances ALTER COLUMN id SET DEFAULT nextval('distances_id_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 140922)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY graph_nodes ALTER COLUMN id SET DEFAULT nextval('graph_nodes_id_seq'::regclass);


--
-- TOC entry 2090 (class 2604 OID 141008)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY links ALTER COLUMN id SET DEFAULT nextval('links_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 140965)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY list_nodes ALTER COLUMN id SET DEFAULT nextval('list_nodes_id_seq'::regclass);


--
-- TOC entry 2089 (class 2604 OID 140982)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- TOC entry 2087 (class 2604 OID 140945)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_station_routes ALTER COLUMN id SET DEFAULT nextval('bus_station_routes_id_seq'::regclass);


--
-- TOC entry 2083 (class 2604 OID 140897)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_stations ALTER COLUMN id SET DEFAULT nextval('bus_stations_id_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 141016)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2250 (class 0 OID 140884)
-- Dependencies: 182
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ar_internal_metadata VALUES ('environment', 'development', '2017-04-30 09:15:33.822283', '2017-04-30 09:15:33.822283');


--
-- TOC entry 2258 (class 0 OID 140930)
-- Dependencies: 190
-- Data for Name: bus_routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bus_routes VALUES (2, 'Tuyen so 1', 1, NULL, '2017-04-30 09:15:39.140548', '2017-04-30 09:15:39.140548');
INSERT INTO bus_routes VALUES (3, 'Tuyen so 2', 0, NULL, '2017-04-30 09:15:39.151777', '2017-04-30 09:15:39.151777');
INSERT INTO bus_routes VALUES (4, 'Tuyen so 2', 1, NULL, '2017-04-30 09:15:39.162487', '2017-04-30 09:15:39.162487');
INSERT INTO bus_routes VALUES (5, 'Tuyen so 3', 0, NULL, '2017-04-30 09:15:39.173605', '2017-04-30 09:15:39.173605');
INSERT INTO bus_routes VALUES (6, 'Tuyen so 3', 1, NULL, '2017-04-30 09:15:39.184929', '2017-04-30 09:15:39.184929');
INSERT INTO bus_routes VALUES (7, 'Tuyen so 4', 0, NULL, '2017-04-30 09:15:39.196032', '2017-04-30 09:15:39.196032');
INSERT INTO bus_routes VALUES (8, 'Tuyen so 4', 1, NULL, '2017-04-30 09:15:39.207058', '2017-04-30 09:15:39.207058');
INSERT INTO bus_routes VALUES (11, 'Tuyen so 6', 0, NULL, '2017-04-30 09:15:39.240258', '2017-04-30 09:15:39.240258');
INSERT INTO bus_routes VALUES (12, 'Tuyen so 6', 1, NULL, '2017-04-30 09:15:39.251363', '2017-04-30 09:15:39.251363');
INSERT INTO bus_routes VALUES (17, 'Tuyen so 11', 0, '---
- 27
- 146
- 147
- 148
- 149
- 150
- 151
- 152
- 153
- 154
- 155
- 156
- 157
- 158
- 159
- 160
- 161
- 162
- 163
- 164
- 165
- 166
- 167
- 168
- 169
- 170
- 171
', '2017-04-30 09:15:39.307129', '2017-05-03 02:16:39.321037');
INSERT INTO bus_routes VALUES (18, 'Tuyen so 11', 1, '---
- 171
- 172
- 173
- 174
- 175
- 176
- 177
- 178
- 179
- 180
- 181
- 182
- 183
- 184
- 185
- 186
- 187
- 188
- 189
- 190
- 191
- 192
- 193
- 194
- 27
', '2017-04-30 09:15:39.318247', '2017-05-03 02:21:33.49352');
INSERT INTO bus_routes VALUES (1, 'Tuyen so 1', 0, NULL, '2017-04-30 09:15:39.131664', '2017-05-03 01:30:45.14272');
INSERT INTO bus_routes VALUES (9, 'Tuyen so 5', 0, '---
- 1
- 2
- 3
- 4
- 5
- 6
- 7
- 8
- 9
- 10
- 11
- 12
- 13
- 14
- 15
- 16
- 17
- 18
- 19
- 20
- 21
- 22
- 23
- 24
- 26
- 27
', '2017-04-30 09:15:39.218111', '2017-05-03 01:32:04.528628');
INSERT INTO bus_routes VALUES (10, 'Tuyen so 5', 1, '---
- 27
- 28
- 29
- 30
- 31
- 32
- 33
- 34
- 35
- 36
- 37
- 38
- 39
- 40
- 41
- 42
- 43
- 45
- 46
- 47
- 48
- 1
', '2017-04-30 09:15:39.229218', '2017-05-03 01:33:51.926985');
INSERT INTO bus_routes VALUES (19, 'Tuyen so 12', 0, '---
- 195
- 196
- 197
- 198
- 199
- 200
- 201
- 202
- 203
- 204
- 205
- 206
- 207
- 208
- 209
- 28
- 51
- 212
- 213
- 214
- 215
- 216
- 217
- 218
- 219
- 220
- 221
- 222
- 223
- 224
- 225
- 226
- 227
- 228
- 229
- 230
', '2017-04-30 09:15:39.328825', '2017-05-03 02:27:04.160052');
INSERT INTO bus_routes VALUES (13, 'Tuyen so 7', 0, '---
- 27
- 28
- 51
- 52
- 30
- 31
- 55
- 56
- 57
- 58
- 59
- 60
- 61
- 62
- 63
- 65
- 66
- 67
- 68
- 70
- 71
- 72
', '2017-04-30 09:15:39.262487', '2017-05-03 01:36:57.86587');
INSERT INTO bus_routes VALUES (14, 'Tuyen so 7', 1, '---
- 72
- 73
- 74
- 75
- 76
- 77
- 78
- 79
- 80
- 81
- 82
- 83
- 84
- 85
- 86
- 87
- 88
- 89
- 90
- 91
- 26
- 27
', '2017-04-30 09:15:39.273479', '2017-05-03 01:43:08.979385');
INSERT INTO bus_routes VALUES (20, 'Tuyen so 12', 1, '---
- 230
- 231
- 232
- 233
- 234
- 235
- 236
- 237
- 238
- 239
- 240
- 241
- 242
- 156
- 244
- 245
- 246
- 247
- 248
- 249
- 250
- 25
- 26
- 253
- 254
- 255
- 256
- 94
- 143
- 259
- 260
- 261
- 262
- 263
- 264
- 265
- 266
- 195
', '2017-04-30 09:15:39.339843', '2017-05-03 02:35:48.112943');
INSERT INTO bus_routes VALUES (16, 'Tuyen so 8', 1, '---
- 72
- 73
- 74
- 122
- 77
- 124
- 125
- 126
- 127
- 128
- 129
- 130
- 131
- 132
- 133
- 134
- 135
- 136
- 137
- 138
- 139
- 140
- 141
- 142
- 143
- 144
- 94
', '2017-04-30 09:15:39.295647', '2017-05-03 02:07:23.965529');
INSERT INTO bus_routes VALUES (15, 'Tuyen so 8', 0, '---
- 94
- 95
- 96
- 97
- 98
- 99
- 100
- 101
- 102
- 103
- 104
- 105
- 106
- 107
- 108
- 109
- 110
- 111
- 112
- 113
- 114
- 69
- 70
- 71
- 72
', '2017-04-30 09:15:39.284596', '2017-05-03 02:10:38.783712');


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 189
-- Name: bus_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bus_routes_id_seq', 20, true);


--
-- TOC entry 2254 (class 0 OID 140905)
-- Dependencies: 186
-- Data for Name: distances; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO distances VALUES (367, 72, 73, 464, 16, '---
- :bounds:
    :northeast:
      :lat: 15.9984949
      :lng: 108.2073746
    :southwest:
      :lat: 15.9959816
      :lng: 108.2058809
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 464
    :duration:
      :text: 1 min
      :value: 65
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :start_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :steps:
    - :distance:
        :text: 36 m
        :value: 36
      :duration:
        :text: 1 min
        :value: 4
      :end_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :html_instructions: Head <b>south</b> on <b>Bàu Cầu 4</b> toward <b>Phan Văn
        Đáng</b>
      :polyline:
        :points: "{gs`Bw}lsS~@C"
      :start_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 158
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :html_instructions: Turn <b>left</b> onto <b>Phan Văn Đáng</b>
      :maneuver: turn-left
      :polyline:
        :points: "{es`B{}lsSQeH"
      :start_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 270
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :html_instructions: Turn <b>left</b> onto <b>Phạm Hùng</b><div style="font-size:0.9em">Pass
        by Thọ Tân Sơn (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mfs`BagmsS}DJmCFwCD
      :start_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{gs`Bw}lsS~@CQeHkIRwCD"
  :summary: Phan Văn Đáng and Phạm Hùng
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 15.9984949
      :lng: 108.2073062
    :southwest:
      :lat: 15.9963018
      :lng: 108.2058478
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 435
    :duration:
      :text: 2 mins
      :value: 96
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :start_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :steps:
    - :distance:
        :text: 64 m
        :value: 64
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :html_instructions: Head <b>north</b> on <b>Bàu Cầu 4</b> toward <b>Trần Văn
        Giàu</b>
      :polyline:
        :points: "{gs`Bw}lsSsBD"
      :start_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :travel_mode: DRIVING
    - :distance:
        :text: 33 m
        :value: 33
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :html_instructions: Turn <b>right</b> onto <b>Trần Văn Giàu</b>
      :maneuver: turn-right
      :polyline:
        :points: oks`Bq}lsSE}@
      :start_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 173
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 15.9970166
        :lng: 108.2073062
      :html_instructions: Turn <b>right</b> onto <b>Nguyễn Bảo</b>
      :maneuver: turn-right
      :polyline:
        :points: uks`Bo_msSNEBA@ABCN]h@{@DM@E?GAEACACCCCCcBkA
      :start_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 165
      :duration:
        :text: 1 min
        :value: 48
      :end_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :html_instructions: Turn <b>left</b> at Thọ Tân Sơn onto <b>Phạm Hùng</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Hoàng Tuấn Tú (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: kls`BufmsSmCFwCD
      :start_location:
        :lat: 15.9970166
        :lng: 108.2073062
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 15.9967767
        :lng: 108.2062375
      :step_index: 2
      :step_interpolation: 0.1006667809072486
  :overview_polyline:
    :points: "{gs`Bw}lsSsBDE}@RGDEx@yAFSAMKOcBkAmCFwCD"
  :summary: Nguyễn Bảo and Phạm Hùng
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 15.9984949
      :lng: 108.207272
    :southwest:
      :lat: 15.9963018
      :lng: 108.2058478
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 387
    :duration:
      :text: 2 mins
      :value: 106
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :start_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :steps:
    - :distance:
        :text: 64 m
        :value: 64
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :html_instructions: Head <b>north</b> on <b>Bàu Cầu 4</b> toward <b>Trần Văn
        Giàu</b>
      :polyline:
        :points: "{gs`Bw}lsSsBD"
      :start_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :travel_mode: DRIVING
    - :distance:
        :text: 33 m
        :value: 33
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :html_instructions: Turn <b>right</b> onto <b>Trần Văn Giàu</b>
      :maneuver: turn-right
      :polyline:
        :points: oks`Bq}lsSE}@
      :start_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 22
      :end_location:
        :lat: 15.9976763
        :lng: 108.2061537
      :html_instructions: Turn <b>left</b> onto <b>Nguyễn Bảo</b>
      :maneuver: turn-left
      :polyline:
        :points: uks`Bo_msS}@B_@?{@A
      :start_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 120
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 15.9977324
        :lng: 108.207272
      :html_instructions: Turn <b>right</b> onto <b>Đặng Hòa</b>
      :maneuver: turn-right
      :polyline:
        :points: ops`Bm_msSCoBEoB
      :start_location:
        :lat: 15.9976763
        :lng: 108.2061537
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Hoàng Tuấn Tú onto
        <b>Phạm Hùng</b><div style="font-size:0.9em">Pass by Shop Đĩa Thiên Hương
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-left
      :polyline:
        :points: yps`BmfmsSwCD
      :start_location:
        :lat: 15.9977324
        :lng: 108.207272
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 15.9975306
        :lng: 108.2061466
      :step_index: 2
      :step_interpolation: 0.8098967565064731
  :overview_polyline:
    :points: "{gs`Bw}lsSsBDE}@}AB{@ACoBEoBwCD"
  :summary: Đặng Hòa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:29.365861', '2017-05-03 02:07:29.365861');
INSERT INTO distances VALUES (368, 73, 74, 1574, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0121132
      :lng: 108.2078999
    :southwest:
      :lat: 15.9984949
      :lng: 108.2056407
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.6 km
      :value: 1574
    :duration:
      :text: 3 mins
      :value: 168
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0121132
      :lng: 108.2056407
    :start_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :steps:
    - :distance:
        :text: 1.0 km
        :value: 985
      :duration:
        :text: 2 mins
        :value: 105
      :end_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :html_instructions: Head <b>north</b> on <b>Phạm Hùng</b> toward <b>Mẹ Thứ</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Trang Trí Nội Thất Hiếu Phát (on
        the right)</div>
      :polyline:
        :points: qus`BgfmsSeA@gCFwCHmBD{@@aDF[?W?m@Aw@Ei@E_@C[EYEeC_@uEu@g@ImBYUESC[CQAO?O?W@]@_@FSBQDc@L
      :start_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 438
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :html_instructions: Continue onto <b>Cầu Cẩm Lệ</b><div style="font-size:0.9em">Pass
        by the bridge (on the right)</div>
      :polyline:
        :points: glu`BgimsSo@TuF~BgLzD
      :start_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 151
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0121132
        :lng: 108.2056407
      :html_instructions: Continue onto <b>Ông Ích Đường</b><div style="font-size:0.9em">Pass
        by Cửa Hàng Tạp Hóa Hoa (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: ubv`Bu~lsSw@XODSHg@Pc@HYB_@@]@
      :start_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qus`BgfmsSsMXqGHeBGiAIqKaB_Em@m@E_@?u@Bs@Ju@ReHtCcOdFg@Pc@Hy@D]@
  :summary: Phạm Hùng and Cầu Cẩm Lệ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:29.695958', '2017-05-03 02:07:29.695958');
INSERT INTO distances VALUES (369, 74, 122, 1155, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0193935
      :lng: 108.2097546
    :southwest:
      :lat: 16.0121132
      :lng: 108.204741
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.2 km
      :value: 1155
    :duration:
      :text: 3 mins
      :value: 191
    :end_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :end_location:
      :lat: 16.0193935
      :lng: 108.2097546
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0121132
      :lng: 108.2056407
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 550
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0169161
        :lng: 108.204741
      :html_instructions: Head <b>north</b> on <b>Ông Ích Đường</b> toward <b>Hồ Đắc
        Di</b><div style="font-size:0.9em">Pass by Tiệm Áo Cưới Hồng Anh (on the left)</div>
      :polyline:
        :points: ujv`Bg|lsSM?eBCQA}CIk@@Y?aAPcB^s@L}@PsB`@kAXQD}@Zo@P
      :start_location:
        :lat: 16.0121132
        :lng: 108.2056407
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 605
      :duration:
        :text: 2 mins
        :value: 91
      :end_location:
        :lat: 16.0193935
        :lng: 108.2097546
      :html_instructions: Turn <b>right</b> at Dịch Vụ Photocopy Thái Hòa onto <b>Cách
        Mạng Tháng 8</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Hiệu Buôn
        Ngọc Hạnh (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: whw`BsvlsSe@uBYeAM_@c@aAs@sAsAgCo@eAw@{AYu@Uk@Qo@iA{D
      :start_location:
        :lat: 16.0169161
        :lng: 108.204741
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ujv`Bg|lsSeCEiEGY?aAPwCl@qDr@}A^mBl@_A{Dq@aBgC{Eo@eAw@{Ao@aB{AkF
  :summary: Ông Ích Đường and Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0193935
      :lng: 108.2097546
    :southwest:
      :lat: 16.0121132
      :lng: 108.2053894
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.2 km
      :value: 1181
    :duration:
      :text: 4 mins
      :value: 242
    :end_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :end_location:
      :lat: 16.0193935
      :lng: 108.2097546
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0121132
      :lng: 108.2056407
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 328
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0150145
        :lng: 108.2053894
      :html_instructions: Head <b>north</b> on <b>Ông Ích Đường</b> toward <b>Hồ Đắc
        Di</b><div style="font-size:0.9em">Pass by Tiệm Áo Cưới Hồng Anh (on the left)</div>
      :polyline:
        :points: ujv`Bg|lsSM?eBCQA}CIk@@Y?aAPcB^s@L
      :start_location:
        :lat: 16.0121132
        :lng: 108.2056407
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 151
      :duration:
        :text: 1 min
        :value: 51
      :end_location:
        :lat: 16.0155092
        :lng: 108.2066802
      :html_instructions: Turn <b>right</b> at Cà Phê Tĩnh Viên onto <b>Phạm Tứ</b><div
        style="font-size:0.9em">Pass by Dịch Vụ Internet A Tàu (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: y|v`BuzlsS_@{BIs@IQOUS[KM
      :start_location:
        :lat: 16.0150145
        :lng: 108.2053894
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 222
      :duration:
        :text: 1 min
        :value: 77
      :end_location:
        :lat: 16.0173051
        :lng: 108.2058389
      :html_instructions: Turn <b>left</b> at Quán Cafe Win onto <b>Nguyễn Văn Huyên</b><div
        style="font-size:0.9em">Pass by QUÁN MÌ QUẢNG 41 (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: "}_w`BwbmsSsA~@YPYL]LK@kAZiBZ"
      :start_location:
        :lat: 16.0155092
        :lng: 108.2066802
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 480
      :duration:
        :text: 1 min
        :value: 70
      :end_location:
        :lat: 16.0193935
        :lng: 108.2097546
      :html_instructions: Turn <b>right</b> at Cửa Hàng Dụng Cụ Cơ Khí Bốn onto <b>Cách
        Mạng Tháng 8</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Cửa Hàng
        Cơ Điện Lạnh Thanh Bảy (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: ekw`Bo}lsSc@aAs@sAsAgCo@eAw@{AYu@Uk@Qo@iA{D
      :start_location:
        :lat: 16.0173051
        :lng: 108.2058389
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0150904
        :lng: 108.2057006
      :step_index: 1
      :step_interpolation: 0.2267591658688958
  :overview_polyline:
    :points: ujv`Bg|lsSeCEiEGY?aAPwCl@i@oDy@qAmBpAw@ZwA\iBZc@aAgC{Eo@eAw@{Ao@aB{AkF
  :summary: Ông Ích Đường and Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0193935
      :lng: 108.2097546
    :southwest:
      :lat: 16.0121132
      :lng: 108.2053894
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.2 km
      :value: 1205
    :duration:
      :text: 4 mins
      :value: 246
    :end_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :end_location:
      :lat: 16.0193935
      :lng: 108.2097546
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0121132
      :lng: 108.2056407
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 328
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0150145
        :lng: 108.2053894
      :html_instructions: Head <b>north</b> on <b>Ông Ích Đường</b> toward <b>Hồ Đắc
        Di</b><div style="font-size:0.9em">Pass by Tiệm Áo Cưới Hồng Anh (on the left)</div>
      :polyline:
        :points: ujv`Bg|lsSM?eBCQA}CIk@@Y?aAPcB^s@L
      :start_location:
        :lat: 16.0121132
        :lng: 108.2056407
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 412
      :duration:
        :text: 2 mins
        :value: 102
      :end_location:
        :lat: 16.0168204
        :lng: 108.2086959
      :html_instructions: Turn <b>right</b> at Cà Phê Tĩnh Viên onto <b>Phạm Tứ</b><div
        style="font-size:0.9em">Pass by Dịch Vụ Internet A Tàu (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: y|v`BuzlsS_@{BIs@IQOUS[KMa@q@wBsDkBmD
      :start_location:
        :lat: 16.0150145
        :lng: 108.2053894
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 211
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0184098
        :lng: 108.2076169
      :html_instructions: Turn <b>left</b> at Cửa Hàng Vlxd Thiên Hồng onto <b>Lương
        Định Của</b><div style="font-size:0.9em">Pass by Cà Phê Sài Gòn 7 (on the
        right)</div>
      :maneuver: turn-left
      :polyline:
        :points: chw`BkomsSC@qAx@kAp@oAx@kAn@
      :start_location:
        :lat: 16.0168204
        :lng: 108.2086959
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 254
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0193935
        :lng: 108.2097546
      :html_instructions: Turn <b>right</b> at Cà Phê Trung Tâm onto <b>Cách Mạng
        Tháng 8</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Hair Salon Diễm
        My (on the right)</div><div style="font-size:0.9em">Destination will be on
        the right</div>
      :maneuver: turn-right
      :polyline:
        :points: arw`BshmsSw@{AYu@Uk@Qo@iA{D
      :start_location:
        :lat: 16.0184098
        :lng: 108.2076169
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0158928
        :lng: 108.2072527
      :step_index: 1
      :step_interpolation: 0.5490514299621139
  :overview_polyline:
    :points: ujv`Bg|lsSeCEiEGY?aAPwCl@i@oDy@qAyCeFkBmDC@}CjB{ChBqAqCg@{AiA{D
  :summary: Ông Ích Đường and Phạm Tứ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:29.953699', '2017-05-03 02:07:29.953699');
INSERT INTO distances VALUES (370, 122, 77, 654, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0227883
      :lng: 108.2147211
    :southwest:
      :lat: 16.0193935
      :lng: 108.2097546
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 654
    :duration:
      :text: 2 mins
      :value: 100
    :end_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0227883
      :lng: 108.2147211
    :start_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :start_location:
      :lat: 16.0193935
      :lng: 108.2097546
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 654
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0227883
        :lng: 108.2147211
      :html_instructions: Head <b>northeast</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
        toward <b>An Hòa 1</b><div style="font-size:0.9em">Pass by Cửa Hàng Nhân (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: exw`B}umsSi@eBGOO]We@e@aAKWW[i@{@m@y@a@q@kAwAs@aAUa@cByB{@iAEIQWQ[O_@Yk@
      :start_location:
        :lat: 16.0193935
        :lng: 108.2097546
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: exw`B}umsSq@uBg@cAq@yAaAwAoAkB_CyC{DoFc@s@i@kA
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:30.211359', '2017-05-03 02:07:30.211359');
INSERT INTO distances VALUES (371, 77, 124, 815, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0252616
      :lng: 108.2163664
    :southwest:
      :lat: 16.0227883
      :lng: 108.2126317
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 815
    :duration:
      :text: 3 mins
      :value: 167
    :end_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0231551
      :lng: 108.2129533
    :start_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0227883
      :lng: 108.2147211
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 190
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0236311
        :lng: 108.2162712
      :html_instructions: Head <b>northeast</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Trung Tâm Hội Nghị Triển Lãm (on the right)</div>
      :polyline:
        :points: mmx`B_unsSIQaAuBMYmAsC
      :start_location:
        :lat: 16.0227883
        :lng: 108.2147211
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 217
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0252616
        :lng: 108.2153698
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Mỹ Nghệ Quang Huy toward
        <b>Trần Thủ Độ</b><div style="font-size:0.9em">Pass by Công Ty Kinh Doanh
        Máy &amp; Thiết Bị Phụ Tùng - Xưởng Cơ Điện Lạnh Số 2 (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: urx`Bu~nsSISSLmGhDYN
      :start_location:
        :lat: 16.0236311
        :lng: 108.2162712
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 343
      :duration:
        :text: 1 min
        :value: 84
      :end_location:
        :lat: 16.023648
        :lng: 108.2126317
      :html_instructions: Turn <b>left</b> onto <b>Trần Thủ Độ</b><div style="font-size:0.9em">Pass
        by Nghĩa Trủng Hòa vang (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: "{|x`BaynsSJPr@zA`AdBb@|@j@rAnB|D"
      :start_location:
        :lat: 16.0252616
        :lng: 108.2153698
      :travel_mode: DRIVING
    - :distance:
        :text: 65 m
        :value: 65
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0231551
        :lng: 108.2129533
      :html_instructions: Turn <b>left</b> at Beauty Salon Nhật Cường onto <b>Trần
        Phước Thành</b><div style="font-size:0.9em">Pass by Cửa Hàng Vật Tư Kim Khí
        Mai Hoa (on the left)</div><div style="font-size:0.9em">Destination will be
        on the left</div>
      :maneuver: turn-left
      :polyline:
        :points: yrx`B}gnsSlAs@RK
      :start_location:
        :lat: 16.023648
        :lng: 108.2126317
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mmx`B_unsSgDuHISSLgHxD~@lBdBbDzCpG`B_A
  :summary: Trần Thủ Độ
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0271737
      :lng: 108.2163664
    :southwest:
      :lat: 16.0227883
      :lng: 108.2114401
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1314
    :duration:
      :text: 4 mins
      :value: 218
    :end_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0231551
      :lng: 108.2129533
    :start_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0227883
      :lng: 108.2147211
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 190
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0236311
        :lng: 108.2162712
      :html_instructions: Head <b>northeast</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Trung Tâm Hội Nghị Triển Lãm (on the right)</div>
      :polyline:
        :points: mmx`B_unsSIQaAuBMYmAsC
      :start_location:
        :lat: 16.0227883
        :lng: 108.2147211
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 461
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.0271737
        :lng: 108.2142515
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Mỹ Nghệ Quang Huy toward
        <b>Trịnh Đình Thảo</b><div style="font-size:0.9em">Pass by Công Ty Kinh Doanh
        Máy &amp; Thiết Bị Phụ Tùng - Xưởng Cơ Điện Lạnh Số 2 (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: urx`Bu~nsSISSLmGhDYN}J~E
      :start_location:
        :lat: 16.0236311
        :lng: 108.2162712
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 349
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0255704
        :lng: 108.2114401
      :html_instructions: Turn <b>left</b> onto <b>Trịnh Đình Thảo</b><div style="font-size:0.9em">Pass
        by H&amp;T Computer (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: yhy`BarnsSJRf@hADHXl@f@dAl@lAd@bAnBbE
      :start_location:
        :lat: 16.0271737
        :lng: 108.2142515
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 314
      :duration:
        :text: 1 min
        :value: 87
      :end_location:
        :lat: 16.0231551
        :lng: 108.2129533
      :html_instructions: Turn <b>left</b> at Cafe CocPro onto <b>Trần Phước Thành</b><div
        style="font-size:0.9em">Pass by Đại Lý Gạo Thu Hà (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: y~x`Bo`nsSx@e@h@WlDkBz@e@p@]lAs@RK
      :start_location:
        :lat: 16.0255704
        :lng: 108.2114401
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0258503
        :lng: 108.2119308
      :step_index: 2
      :step_interpolation: 0.8254676287751619
  :overview_polyline:
    :points: mmx`B_unsSgDuHISSLgHxD}J~EJRl@rAtCdGnBbEx@e@vEcCnEcC
  :summary: Trịnh Đình Thảo
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0252616
      :lng: 108.2163664
    :southwest:
      :lat: 16.0227624
      :lng: 108.2129533
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 923
    :duration:
      :text: 3 mins
      :value: 187
    :end_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0231551
      :lng: 108.2129533
    :start_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0227883
      :lng: 108.2147211
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 190
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0236311
        :lng: 108.2162712
      :html_instructions: Head <b>northeast</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Trung Tâm Hội Nghị Triển Lãm (on the right)</div>
      :polyline:
        :points: mmx`B_unsSIQaAuBMYmAsC
      :start_location:
        :lat: 16.0227883
        :lng: 108.2147211
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 217
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0252616
        :lng: 108.2153698
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Mỹ Nghệ Quang Huy toward
        <b>Nguyễn Duy</b><div style="font-size:0.9em">Pass by Công Ty Kinh Doanh Máy
        &amp; Thiết Bị Phụ Tùng - Xưởng Cơ Điện Lạnh Số 2 (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: urx`Bu~nsSISSLmGhDYN
      :start_location:
        :lat: 16.0236311
        :lng: 108.2162712
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 133
      :duration:
        :text: 1 min
        :value: 56
      :end_location:
        :lat: 16.0242767
        :lng: 108.2158778
      :html_instructions: Make a <b>U-turn</b>
      :maneuver: uturn-left
      :polyline:
        :points: "{|x`BaynsSJPdBaApAu@"
      :start_location:
        :lat: 16.0252616
        :lng: 108.2153698
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 332
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.0227624
        :lng: 108.2132037
      :html_instructions: Turn <b>right</b> at Cửa Hàng Đá Granite Đen Huế onto <b>Nguyễn
        Duy</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Xây Dựng Giải Pháp
        Năng Lượng &amp; Môi Trường (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: wvx`Bg|nsSt@xAx@pB`BhDn@lAd@dAFL
      :start_location:
        :lat: 16.0242767
        :lng: 108.2158778
      :travel_mode: DRIVING
    - :distance:
        :text: 51 m
        :value: 51
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0231551
        :lng: 108.2129533
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Nga Đại Việt onto
        <b>Trần Phước Thành</b><div style="font-size:0.9em">Destination will be on
        the right</div>
      :maneuver: turn-right
      :polyline:
        :points: gmx`BoknsSoAp@
      :start_location:
        :lat: 16.0227624
        :lng: 108.2132037
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0241438
        :lng: 108.2156527
      :step_index: 3
      :step_interpolation: 0.08508194638052889
  :overview_polyline:
    :points: mmx`B_unsSgDuHISSLgHxDJPdBaApAu@t@xAx@pB`BhDtArCFLoAp@
  :summary: Nguyễn Duy
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:30.620785', '2017-05-03 02:07:30.620785');
INSERT INTO distances VALUES (372, 124, 125, 881, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0299441
      :lng: 108.2132633
    :southwest:
      :lat: 16.0231551
      :lng: 108.211389
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 881
    :duration:
      :text: 3 mins
      :value: 184
    :end_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0299441
      :lng: 108.211389
    :start_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0231551
      :lng: 108.2129533
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 136
      :duration:
        :text: 1 min
        :value: 32
      :end_location:
        :lat: 16.0242008
        :lng: 108.212289
      :html_instructions: Head <b>northwest</b> on <b>Trần Phước Thành</b> toward
        <b>Bình Hòa 6</b><div style="font-size:0.9em">Pass by Cửa Hàng Vật Tư Kim
        Khí Mai Hoa (on the right)</div>
      :polyline:
        :points: wox`B}insSSJmAr@q@\{@d@
      :start_location:
        :lat: 16.0231551
        :lng: 108.2129533
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 120
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0247364
        :lng: 108.2132633
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh - Mtv Vạn Thái toward
        <b>Nguyễn Phong Sắc</b><div style="font-size:0.9em">Pass by Phòng khám Nha
        Khoa Quang Hải (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: gvx`ByensSq@qAy@oB
      :start_location:
        :lat: 16.0242008
        :lng: 108.212289
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 625
      :duration:
        :text: 2 mins
        :value: 131
      :end_location:
        :lat: 16.0299441
        :lng: 108.211389
      :html_instructions: Turn <b>left</b> at Nha Khoa Quang Hải onto <b>Nguyễn Phong
        Sắc</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Vít Phạm Nguyên
        (on the left)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-left
      :polyline:
        :points: syx`B{knsSuDhBYPMFKFOHOHKFmBdAo@Xc@NWLMDOD_@DA@UBm@DaAHoBLA?gFX
      :start_location:
        :lat: 16.0247364
        :lng: 108.2132633
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wox`B}insSoEbCq@qAy@oBoEzBy@b@yBlAsAh@e@Ro@JgCTyIf@
  :summary: Nguyễn Phong Sắc
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0299441
      :lng: 108.2129533
    :southwest:
      :lat: 16.0231551
      :lng: 108.2111017
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 878
    :duration:
      :text: 3 mins
      :value: 183
    :end_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0299441
      :lng: 108.211389
    :start_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0231551
      :lng: 108.2129533
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 384
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0261184
        :lng: 108.2111017
      :html_instructions: Head <b>northwest</b> on <b>Trần Phước Thành</b> toward
        <b>Bình Hòa 6</b><div style="font-size:0.9em">Pass by Cửa Hàng Vật Tư Kim
        Khí Mai Hoa (on the right)</div>
      :polyline:
        :points: wox`B}insSSJmAr@q@\{@d@mDjBi@Vy@d@mBbA
      :start_location:
        :lat: 16.0231551
        :lng: 108.2129533
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 121
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0266847
        :lng: 108.2120724
      :html_instructions: Turn <b>right</b> at Nippon Nhất Trung Sơn onto <b>Hoàng
        Dư Khương</b>
      :maneuver: turn-right
      :polyline:
        :points: gby`Bk~msSoBaE
      :start_location:
        :lat: 16.0261184
        :lng: 108.2111017
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 373
      :duration:
        :text: 1 min
        :value: 72
      :end_location:
        :lat: 16.0299441
        :lng: 108.211389
      :html_instructions: Turn <b>left</b> at Cửa Hàng Tạp Hóa Nam Huệ onto <b>Nguyễn
        Phong Sắc</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mỹ Thuật Biển
        (on the left)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-left
      :polyline:
        :points: wey`BmdnsSo@Xc@NWLMDOD_@DA@UBm@DaAHoBLA?gFX
      :start_location:
        :lat: 16.0266847
        :lng: 108.2120724
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0251759
        :lng: 108.211691
      :step_index: 0
      :step_interpolation: 0.6818557830535928
  :overview_polyline:
    :points: wox`B}insSoEbCwEbCgDhBoBaEo@X{@\]Ja@FuF`@iFX
  :summary: Trần Phước Thành and Nguyễn Phong Sắc
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0308107
      :lng: 108.2153698
    :southwest:
      :lat: 16.0231551
      :lng: 108.2113041
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1303
    :duration:
      :text: 4 mins
      :value: 217
    :end_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0299441
      :lng: 108.211389
    :start_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0231551
      :lng: 108.2129533
    :steps:
    - :distance:
        :text: 65 m
        :value: 65
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.023648
        :lng: 108.2126317
      :html_instructions: Head <b>northwest</b> on <b>Trần Phước Thành</b> toward
        <b>Bình Hòa 6</b><div style="font-size:0.9em">Pass by Cửa Hàng Vật Tư Kim
        Khí Mai Hoa (on the right)</div>
      :polyline:
        :points: wox`B}insSSJmAr@
      :start_location:
        :lat: 16.0231551
        :lng: 108.2129533
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 332
      :duration:
        :text: 1 min
        :value: 73
      :end_location:
        :lat: 16.025204
        :lng: 108.2152768
      :html_instructions: Turn <b>right</b> at Beauty Salon Nhật Cường onto <b>Trần
        Thủ Độ</b><div style="font-size:0.9em">Pass by Nghĩa Trủng Hòa vang (on the
        right)</div>
      :maneuver: turn-right
      :polyline:
        :points: yrx`B}gnsSoB}Dk@sAc@}@aAeBs@{A
      :start_location:
        :lat: 16.023648
        :lng: 108.2126317
      :travel_mode: DRIVING
    - :distance:
        :text: 0.7 km
        :value: 716
      :duration:
        :text: 1 min
        :value: 81
      :end_location:
        :lat: 16.0308107
        :lng: 108.212284
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Truyền Hình Cáp Sài Gòn
        Tourist - Cn<div style="font-size:0.9em">Pass by Garage Kiện (on the left
        in 500&nbsp;m)</div>
      :maneuver: turn-left
      :polyline:
        :points: o|x`BoxnsSKQ}J~EqBdA_HnD[P{C~AYLUFS@g@Ba@D
      :start_location:
        :lat: 16.025204
        :lng: 108.2152768
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 105
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0307086
        :lng: 108.2113041
      :html_instructions: Turn <b>left</b> at Công Ty Cổ Phần Xây Dựng EVN Quốc Tế
        1 toward <b>Nguyễn Phong Sắc</b>
      :maneuver: turn-left
      :polyline:
        :points: q_z`BwensS@RDl@Fv@BhA
      :start_location:
        :lat: 16.0308107
        :lng: 108.212284
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0299441
        :lng: 108.211389
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Tin Học Điện Tử Viễn Thông
        Lê Trần Dana Việt onto <b>Nguyễn Phong Sắc</b><div style="font-size:0.9em">Pass
        by Cà Phê V.T (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: "}~y`Bs_nsS~@Gd@Cr@E"
      :start_location:
        :lat: 16.0307086
        :lng: 108.2113041
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0262177
        :lng: 108.2148107
      :step_index: 2
      :step_interpolation: 0.1869366676952883
  :overview_polyline:
    :points: wox`B}insSaB~@{CqGeBcD_AmBoNdH{H`EuDlBi@HiAHF`AJ`CdBKr@E
  :summary: Trần Thủ Độ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:31.279094', '2017-05-03 02:07:31.279094');
INSERT INTO distances VALUES (452, 106, 107, 372, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0427005
      :lng: 108.2421332
    :southwest:
      :lat: 16.0396793
      :lng: 108.2406433
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 372
    :duration:
      :text: 1 min
      :value: 56
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0396793
      :lng: 108.2421332
    :start_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0427005
      :lng: 108.2406433
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 372
      :duration:
        :text: 1 min
        :value: 56
      :end_location:
        :lat: 16.0396793
        :lng: 108.2421332
      :html_instructions: Head <b>southeast</b> on <b>Ngũ Hành Sơn</b> toward <b>Lê
        Văn Hưu</b><div style="font-size:0.9em">Pass by Dịch Vụ Internet Văn Thiện
        (on the right)</div>
      :polyline:
        :points: "{i|`B_wssSzAm@bA_@xAm@f@UbBo@p@YFCjBu@n@S"
      :start_location:
        :lat: 16.0427005
        :lng: 108.2406433
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{i|`B_wssS~CmA`CcAhGcCn@S"
  :summary: Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:47.907088', '2017-05-03 02:10:47.907088');
INSERT INTO distances VALUES (373, 125, 126, 176, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0314809
      :lng: 108.211389
    :southwest:
      :lat: 16.0299441
      :lng: 108.2112034
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 176
    :duration:
      :text: 1 min
      :value: 40
    :end_address: Xô Viết Nghệ Tĩnh, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0314809
      :lng: 108.21124
    :start_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0299441
      :lng: 108.211389
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 172
      :duration:
        :text: 1 min
        :value: 33
      :end_location:
        :lat: 16.0314769
        :lng: 108.2112034
      :html_instructions: Head <b>north</b> on <b>Nguyễn Phong Sắc</b> toward <b>Xô
        Viết Nghệ Tĩnh</b><div style="font-size:0.9em">Pass by Shop THỜI TRANG THÙY
        DƯƠNG (on the right)</div>
      :polyline:
        :points: czy`Be`nsSs@De@B_AFyCR
      :start_location:
        :lat: 16.0299441
        :lng: 108.211389
      :travel_mode: DRIVING
    - :distance:
        :text: 4 m
        :value: 4
      :duration:
        :text: 1 min
        :value: 7
      :end_location:
        :lat: 16.0314809
        :lng: 108.21124
      :html_instructions: Turn <b>right</b> at Quán Lucky onto <b>Xô Viết Nghệ Tĩnh</b>
      :maneuver: turn-right
      :polyline:
        :points: wcz`B__nsS?G
      :start_location:
        :lat: 16.0314769
        :lng: 108.2112034
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: czy`Be`nsSsHd@?G
  :summary: Nguyễn Phong Sắc
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:36.69343', '2017-05-03 02:07:36.69343');
INSERT INTO distances VALUES (374, 126, 127, 480, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0319846
      :lng: 108.2157038
    :southwest:
      :lat: 16.0314809
      :lng: 108.21124
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 480
    :duration:
      :text: 1 min
      :value: 50
    :end_address: Xô Viết Nghệ Tĩnh, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0319846
      :lng: 108.2157038
    :start_address: Xô Viết Nghệ Tĩnh, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0314809
      :lng: 108.21124
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 480
      :duration:
        :text: 1 min
        :value: 50
      :end_location:
        :lat: 16.0319846
        :lng: 108.2157038
      :html_instructions: Head <b>east</b> on <b>Xô Viết Nghệ Tĩnh</b> toward <b>Huỳnh
        Tấn Phát</b><div style="font-size:0.9em">Pass by Công Ty Cp Evn Quốc Tế (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: wcz`Bg_nsSI}AGiACUOyCKcBKqBO{CUgD?I
      :start_location:
        :lat: 16.0314809
        :lng: 108.21124
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wcz`Bg_nsScBqZ?I
  :summary: Xô Viết Nghệ Tĩnh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:36.99465', '2017-05-03 02:07:36.99465');
INSERT INTO distances VALUES (375, 127, 128, 1092, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0332271
      :lng: 108.2256584
    :southwest:
      :lat: 16.0319846
      :lng: 108.2157038
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.1 km
      :value: 1092
    :duration:
      :text: 2 mins
      :value: 140
    :end_address: QL14B, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0332271
      :lng: 108.2256584
    :start_address: Xô Viết Nghệ Tĩnh, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0319846
      :lng: 108.2157038
    :steps:
    - :distance:
        :text: 0.9 km
        :value: 900
      :duration:
        :text: 2 mins
        :value: 117
      :end_location:
        :lat: 16.0328951
        :lng: 108.2240723
      :html_instructions: Head <b>east</b> on <b>Xô Viết Nghệ Tĩnh</b> toward <b>Trần
        Đức Thảo</b><div style="font-size:0.9em">Pass by Chi Cục Hải Quan Quản Lý
        Hàng Đầu Tư - Gia Công Thành Phố Đà Nẵng (on the right)</div>
      :polyline:
        :points: "{fz`Bc{nsSK{AO}CKkB]_GQuCMmCG_BO_Ca@eHWyF"
      :start_location:
        :lat: 16.0319846
        :lng: 108.2157038
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 192
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0332271
        :lng: 108.2256584
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Tiên
        Sơn</b>/<b>QL14B</b><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: slz`BmopsSDC@ABCBC@CBC@C@E@E?E@C?E?EAEAEAE?CAA?CAAAAACCAAACAAAAAC?AAA?C?A?A?IWGY]qCCM
      :start_location:
        :lat: 16.0328951
        :lng: 108.2240723
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{fz`Bc{nsSeAeRw@cOy@_PFELODU?UK]UKE?KWi@yD"
  :summary: Xô Viết Nghệ Tĩnh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:37.257134', '2017-05-03 02:07:37.257134');
INSERT INTO distances VALUES (376, 128, 129, 1691, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0368068
      :lng: 108.2409959
    :southwest:
      :lat: 16.0332271
      :lng: 108.2256584
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.7 km
      :value: 1691
    :duration:
      :text: 2 mins
      :value: 123
    :end_address: Tiên Sơn, Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0368068
      :lng: 108.2409959
    :start_address: QL14B, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0332271
      :lng: 108.2256584
    :steps:
    - :distance:
        :text: 1.7 km
        :value: 1691
      :duration:
        :text: 2 mins
        :value: 123
      :end_location:
        :lat: 16.0368068
        :lng: 108.2409959
      :html_instructions: Head <b>east</b> on <b>Tiên Sơn</b>/<b>QL14B</b><div style="font-size:0.9em">Continue
        to follow QL14B</div><div style="font-size:0.9em">Pass by the bridge (on the
        left in 1.1&nbsp;km)</div><div style="font-size:0.9em">Destination will be
        on the right</div>
      :polyline:
        :points: unz`BkypsSi@cEoBuOiCqSa@gDUiBUgBy@yGkAqJCSIo@MkAIe@M{@UuAUeASs@Y}@]}@c@eACE
      :start_location:
        :lat: 16.0332271
        :lng: 108.2256584
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: unz`BkypsSeIso@qD}Ye@uDc@qCi@yBw@{Bg@kA
  :summary: QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:37.540804', '2017-05-03 02:07:37.540804');
INSERT INTO distances VALUES (377, 129, 130, 553, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0403796
      :lng: 108.2431656
    :southwest:
      :lat: 16.0368068
      :lng: 108.2409959
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 553
    :duration:
      :text: 2 mins
      :value: 94
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0403796
      :lng: 108.2420293
    :start_address: Tiên Sơn, Khuê Mỹ, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0368068
      :lng: 108.2409959
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 553
      :duration:
        :text: 2 mins
        :value: 94
      :end_location:
        :lat: 16.0403796
        :lng: 108.2420293
      :html_instructions: Head <b>northeast</b> on <b>Tiên Sơn</b>/<b>QL14B</b> toward
        <b>Lê Văn Hiến</b><div style="font-size:0.9em">Continue to follow QL14B</div><div
        style="font-size:0.9em">Pass by Cửa Hàng Đồng Hồ Thanh Nhơn (on the right
        in 500&nbsp;m)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: ae{`BgyssSc@}@GMqBiDc@}@Se@c@q@Qe@a@Vo@XQFqAn@qBl@iBt@k@T
      :start_location:
        :lat: 16.0368068
        :lng: 108.2409959
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ae{`BgyssSk@kAuCgFw@wAQe@a@VaA`@qAn@qBl@uCjA
  :summary: QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:37.893683', '2017-05-03 02:07:37.893683');
INSERT INTO distances VALUES (378, 130, 131, 297, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0427836
      :lng: 108.2420293
    :southwest:
      :lat: 16.0403796
      :lng: 108.2408213
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 297
    :duration:
      :text: 1 min
      :value: 47
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0427836
      :lng: 108.2408213
    :start_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0403796
      :lng: 108.2420293
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 297
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.0427836
        :lng: 108.2408213
      :html_instructions: Head <b>northwest</b> on <b>Ngũ Hành Sơn</b>/<b>QL14B</b>
        toward <b>Bà Huyện Thanh Quan</b><div style="font-size:0.9em">Pass by Công
        Ty Tnhh Phú Bình An (on the right)</div>
      :polyline:
        :points: k{{`Bu_tsSuBz@mEdBaA^yAn@
      :start_location:
        :lat: 16.0403796
        :lng: 108.2420293
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: k{{`Bu_tsS_NpF
  :summary: Ngũ Hành Sơn/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:38.188889', '2017-05-03 02:07:38.188889');
INSERT INTO distances VALUES (379, 131, 132, 566, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0474586
      :lng: 108.2408213
    :southwest:
      :lat: 16.0427836
      :lng: 108.2387669
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 566
    :duration:
      :text: 1 min
      :value: 84
    :end_address: 68 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0474586
      :lng: 108.2387669
    :start_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0427836
      :lng: 108.2408213
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 566
      :duration:
        :text: 1 min
        :value: 84
      :end_location:
        :lat: 16.0474586
        :lng: 108.2387669
      :html_instructions: Head <b>northwest</b> on <b>Ngũ Hành Sơn</b>/<b>QL14B</b>
        toward <b>Phan Hành Sơn</b>/<b>Phan Tứ</b><div style="font-size:0.9em">Pass
        by Cơ Sở Cơ Khí Mai Sơn (on the right)</div>
      :polyline:
        :points: kj|`BcxssS}CpA}D`B_@LQFwAj@uAh@}@\}@Xu@NsB`@eAN
      :start_location:
        :lat: 16.0427836
        :lng: 108.2408213
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kj|`BcxssSmKhEmDtA{Bv@oF`A
  :summary: Ngũ Hành Sơn/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0474586
      :lng: 108.2408213
    :southwest:
      :lat: 16.0427836
      :lng: 108.2385493
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 615
    :duration:
      :text: 2 mins
      :value: 95
    :end_address: 68 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0474586
      :lng: 108.2387669
    :start_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0427836
      :lng: 108.2408213
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 235
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0446803
        :lng: 108.2398522
      :html_instructions: Head <b>northwest</b> on <b>Ngũ Hành Sơn</b>/<b>QL14B</b>
        toward <b>Phan Hành Sơn</b>/<b>Phan Tứ</b><div style="font-size:0.9em">Pass
        by Cơ Sở Cơ Khí Mai Sơn (on the right)</div>
      :polyline:
        :points: kj|`BcxssS}CpA}D`B_@L
      :start_location:
        :lat: 16.0427836
        :lng: 108.2408213
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 356
      :duration:
        :text: 1 min
        :value: 52
      :end_location:
        :lat: 16.0474102
        :lng: 108.2385493
      :html_instructions: Continue straight past Công Ty Sx Đá Granite Đà Nẵng onto
        <b>Ngũ Hành Sơn</b><div style="font-size:0.9em">Pass by Cà Phê 246 (on the
        left)</div>
      :maneuver: straight
      :polyline:
        :points: gv|`BarssSQFFTFP{@Z}@\}Al@aAXgDv@}AX
      :start_location:
        :lat: 16.0446803
        :lng: 108.2398522
      :travel_mode: DRIVING
    - :distance:
        :text: 24 m
        :value: 24
      :duration:
        :text: 1 min
        :value: 6
      :end_location:
        :lat: 16.0474586
        :lng: 108.2387669
      :html_instructions: Turn <b>right</b> at Cửa Hàng Đtdđ Thái Thy 2 onto <b>Hàm
        Tử</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: ig}`B}issSESCW
      :start_location:
        :lat: 16.0474102
        :lng: 108.2385493
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0455402
        :lng: 108.239204
      :step_index: 1
      :step_interpolation: 0.3832032424403329
  :overview_polyline:
    :points: kj|`BcxssSmKhENf@{@Z{CjAiFpA}AXESCW
  :summary: Ngũ Hành Sơn/QL14B and Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:38.529772', '2017-05-03 02:07:38.529772');
INSERT INTO distances VALUES (380, 132, 133, 498, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0517666
      :lng: 108.2387669
    :southwest:
      :lat: 16.0474586
      :lng: 108.2374849
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 498
    :duration:
      :text: 1 min
      :value: 44
    :end_address: 29 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0517666
      :lng: 108.2374849
    :start_address: 68 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0474586
      :lng: 108.2387669
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 498
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0517666
        :lng: 108.2374849
      :html_instructions: Head <b>north</b> on <b>Ngũ Hành Sơn</b>/<b>QL14B</b> toward
        <b>Đỗ Bá</b><div style="font-size:0.9em">Pass by Quán Cơm 63 (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: sg}`BikssSoGpAs@L{@P{H|AaDp@
      :start_location:
        :lat: 16.0474586
        :lng: 108.2387669
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: sg}`BikssS}Y`G
  :summary: Ngũ Hành Sơn/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0517888
      :lng: 108.2387669
    :southwest:
      :lat: 16.0474586
      :lng: 108.2375672
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 506
    :duration:
      :text: 1 min
      :value: 56
    :end_address: 29 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0517888
      :lng: 108.2375672
    :start_address: 68 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0474586
      :lng: 108.2387669
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 222
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0493805
        :lng: 108.2382014
      :html_instructions: Head <b>north</b> on <b>Ngũ Hành Sơn</b>/<b>QL14B</b> toward
        <b>Đỗ Bá</b><div style="font-size:0.9em">Pass by Quán Cơm 63 (on the right)</div>
      :polyline:
        :points: sg}`BikssSoGpAs@L{@P
      :start_location:
        :lat: 16.0474586
        :lng: 108.2387669
      :travel_mode: DRIVING
    - :distance:
        :text: 8 m
        :value: 8
      :duration:
        :text: 1 min
        :value: 7
      :end_location:
        :lat: 16.0494012
        :lng: 108.2382736
      :html_instructions: Turn <b>right</b> at Cafe Wifi - Billards Nguyễn Lê onto
        <b>Đỗ Bá</b>
      :maneuver: turn-right
      :polyline:
        :points: ss}`BwgssSCM
      :start_location:
        :lat: 16.0493805
        :lng: 108.2382014
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 276
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0517888
        :lng: 108.2375672
      :html_instructions: Turn <b>left</b> at Nhà Sách Bảo Ngọc onto <b>Ngũ Hành Sơn</b><div
        style="font-size:0.9em">Pass by Cafe Minh Quang (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: ws}`BehssSeBZkCh@aEx@i@J
      :start_location:
        :lat: 16.0494012
        :lng: 108.2382736
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0504902
        :lng: 108.2379538
      :step_index: 2
      :step_interpolation: 0.4558340753793421
  :overview_polyline:
    :points: sg}`BikssScI~A{@PCMqFdAkFdA
  :summary: Ngũ Hành Sơn/QL14B and Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0517888
      :lng: 108.2388557
    :southwest:
      :lat: 16.0474633
      :lng: 108.2375672
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 506
    :duration:
      :text: 1 min
      :value: 75
    :end_address: 29 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0517888
      :lng: 108.2375672
    :start_address: 68 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0474633
      :lng: 108.238785
    :steps:
    - :distance:
        :text: 8 m
        :value: 8
      :duration:
        :text: 1 min
        :value: 1
      :end_location:
        :lat: 16.0474816
        :lng: 108.2388557
      :html_instructions: Head <b>east</b> toward <b>Ngũ Hành Sơn</b>
      :polyline:
        :points: sg}`BkkssSCO
      :start_location:
        :lat: 16.0474633
        :lng: 108.238785
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 498
      :duration:
        :text: 1 min
        :value: 74
      :end_location:
        :lat: 16.0517888
        :lng: 108.2375672
      :html_instructions: Turn <b>left</b> at Danang University of Economics - HD
        onto <b>Ngũ Hành Sơn</b><div style="font-size:0.9em">Pass by Dịch Vụ Tư Vấn
        Du Học Skyline (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: wg}`B{kssS]FiB`@gCh@c@HkAVeBZkCh@aEx@i@J
      :start_location:
        :lat: 16.0474816
        :lng: 108.2388557
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0481587
        :lng: 108.2386475
      :step_index: 1
      :step_interpolation: 0.1575460604118394
  :overview_polyline:
    :points: sg}`BkkssSCO]FqFjAaJfBkFdA
  :summary: Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:38.936469', '2017-05-03 02:07:38.936469');
INSERT INTO distances VALUES (381, 133, 134, 274, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0540613
      :lng: 108.2374849
    :southwest:
      :lat: 16.0517666
      :lng: 108.2368381
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 274
    :duration:
      :text: 1 min
      :value: 38
    :end_address: Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0540613
      :lng: 108.2368381
    :start_address: 29 Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0517666
      :lng: 108.2374849
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 158
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0531334
        :lng: 108.2370883
      :html_instructions: Head <b>north</b> on <b>Ngũ Hành Sơn</b>/<b>QL14B</b><div
        style="font-size:0.9em">Continue to follow QL14B</div><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Tmdv Cựu Kim Sơn (on the left)</div>
      :polyline:
        :points: qb~`BgcssSoAVg@HgAX]Fq@H
      :start_location:
        :lat: 16.0517666
        :lng: 108.2374849
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 116
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0540613
        :lng: 108.2368381
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Ngô
        Quyền</b><div style="font-size:0.9em">Destination will be on the left</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ak~`By`ssSAACAAACAA?EAC?C?A?C?C@C?C@C@A@CBA@A@A@ABA@AB?BABWCa@Hy@P
      :start_location:
        :lat: 16.0531334
        :lng: 108.2370883
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qb~`BgcssSwB`@eB`@s@FECOCM@MDIHEHAFWCa@Hy@P
  :summary: QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:39.277247', '2017-05-03 02:07:39.277247');
INSERT INTO distances VALUES (382, 134, 135, 949, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0621836
      :lng: 108.2368381
    :southwest:
      :lat: 16.0540613
      :lng: 108.2342912
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 949
    :duration:
      :text: 2 mins
      :value: 129
    :end_address: 1021 Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0621836
      :lng: 108.2342912
    :start_address: Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0540613
      :lng: 108.2368381
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 520
      :duration:
        :text: 1 min
        :value: 61
      :end_location:
        :lat: 16.0585486
        :lng: 108.2354746
      :html_instructions: Head <b>north</b> on <b>Ngô Quyền</b> toward <b>Nguyễn Duy
        Hiệu</b><div style="font-size:0.9em">Pass by Dntn Túy Hoa (on the right)</div>
      :polyline:
        :points: "{p~`Bg_ssSyDv@A?sL~BqGxA"
      :start_location:
        :lat: 16.0540613
        :lng: 108.2368381
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 323
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.0613384
        :lng: 108.2346359
      :html_instructions: Continue straight past Shop Thời Trang Trẻ Em Havii to stay
        on <b>Ngô Quyền</b><div style="font-size:0.9em">Pass by Đại Lý Gas Anh Bửu
        (on the left)</div>
      :maneuver: straight
      :polyline:
        :points: "}l_aBuvrsSoF`AaAV_Dr@m@Hm@L"
      :start_location:
        :lat: 16.0585486
        :lng: 108.2354746
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 106
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0621836
        :lng: 108.2342912
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Ngô
        Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Destination will be on
        the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: k~_aBoqrsSGAEAG?C?G@GDEDEJMHMFYH[J_@F
      :start_location:
        :lat: 16.0613384
        :lng: 108.2346359
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{p~`Bg_ssSoRvDqGxAoF`AaAV_Dr@m@Hm@LGAMAK@MJEJMHg@P{@R"
  :summary: Ngô Quyền
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0621836
      :lng: 108.2368381
    :southwest:
      :lat: 16.0540613
      :lng: 108.2342912
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 968
    :duration:
      :text: 2 mins
      :value: 120
    :end_address: 1021 Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0621836
      :lng: 108.2342912
    :start_address: Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0540613
      :lng: 108.2368381
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 108
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0549938
        :lng: 108.2365635
      :html_instructions: Head <b>north</b> on <b>Ngô Quyền</b> toward <b>Nguyễn Duy
        Hiệu</b><div style="font-size:0.9em">Pass by Dntn Túy Hoa (on the right)</div>
      :polyline:
        :points: "{p~`Bg_ssSyDv@"
      :start_location:
        :lat: 16.0540613
        :lng: 108.2368381
      :travel_mode: DRIVING
    - :distance:
        :text: 10 m
        :value: 10
      :duration:
        :text: 1 min
        :value: 1
      :end_location:
        :lat: 16.0549673
        :lng: 108.2364724
      :html_instructions: Turn <b>left</b> at Cửa Hàng Đồ Gỗ Nội Thất Hoàng Linh onto
        <b>Nguyễn Duy Hiệu</b>
      :maneuver: turn-left
      :polyline:
        :points: uv~`Bo}rsSBP
      :start_location:
        :lat: 16.0549938
        :lng: 108.2365635
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 412
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0585272
        :lng: 108.2353992
      :html_instructions: Turn <b>right</b> at Đại Lý Bia Lương Dũng onto <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Hiệu Vàng Trung Xuân (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: qv~`B}|rsSuL|B{Bf@uCn@
      :start_location:
        :lat: 16.0549673
        :lng: 108.2364724
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 332
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0613384
        :lng: 108.2346359
      :html_instructions: Continue straight past Công Ty Tnhh Trương Gia Anh onto
        <b>Ngô Quyền</b><div style="font-size:0.9em">Pass by Đại Lý Gas Anh Bửu (on
        the left)</div>
      :maneuver: straight
      :polyline:
        :points: yl_aBgvrsSCMoF`AaAV_Dr@m@Hm@L
      :start_location:
        :lat: 16.0585272
        :lng: 108.2353992
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 106
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0621836
        :lng: 108.2342912
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Ngô
        Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Destination will be on
        the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: k~_aBoqrsSGAEAG?C?G@GDEDEJMHMFYH[J_@F
      :start_location:
        :lat: 16.0613384
        :lng: 108.2346359
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.056063
        :lng: 108.2361544
      :step_index: 2
      :step_interpolation: 0.3068787862071825
  :overview_polyline:
    :points: "{p~`Bg_ssSyDv@BPqPdDuCn@CMoF`AaFjA{AVYCOFKP[Pu@T_@F"
  :summary: Ngô Quyền and Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:54.898947', '2017-05-03 02:07:54.898947');
INSERT INTO distances VALUES (383, 135, 136, 491, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0664208
      :lng: 108.2342912
    :southwest:
      :lat: 16.0621836
      :lng: 108.2330059
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 491
    :duration:
      :text: 1 min
      :value: 43
    :end_address: 867 Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0664208
      :lng: 108.2330059
    :start_address: 1021 Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0621836
      :lng: 108.2342912
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 491
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0664208
        :lng: 108.2330059
      :html_instructions: Head <b>north</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Lương Thế Vinh</b><div style="font-size:0.9em">Pass by Tiệm Cắt Tóc Thái
        Phong (on the right)</div><div style="font-size:0.9em">Destination will be
        on the left</div>
      :polyline:
        :points: sc`aBiorsSeCb@cEz@gATiDt@sGrA
      :start_location:
        :lat: 16.0621836
        :lng: 108.2342912
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: sc`aBiorsSeCb@cEz@qFjAsGrA
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:55.617799', '2017-05-03 02:07:55.617799');
INSERT INTO distances VALUES (384, 136, 137, 538, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0708826
      :lng: 108.2330059
    :southwest:
      :lat: 16.0664208
      :lng: 108.2313672
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 538
    :duration:
      :text: 1 min
      :value: 51
    :end_address: Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0708826
      :lng: 108.2313672
    :start_address: 867 Ngô Quyền, An Hải Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0664208
      :lng: 108.2330059
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 145
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0676898
        :lng: 108.2326881
      :html_instructions: Head <b>north</b> on <b>Ngô Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass
        by Quán Phở Hà Nội (on the right)</div>
      :polyline:
        :points: c~`aBigrsSc@JaDf@QBK@MBK@
      :start_location:
        :lat: 16.0664208
        :lng: 108.2330059
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 393
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0708826
        :lng: 108.2313672
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Ngô Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Cà Phê Aloha
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: afaaBiersSCCAAC?AAAAEAEAC?E?C?E@C@C@C@C@CBCBABCBADAFOJQJMFoDfAaEnAkCt@
      :start_location:
        :lat: 16.0676898
        :lng: 108.2326881
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: c~`aBigrsScFx@YDEEMESAQFMLEHAFOJ_@RqJvCkCt@
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:55.862348', '2017-05-03 02:07:55.862348');
INSERT INTO distances VALUES (385, 137, 138, 889, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0782524
      :lng: 108.2325742
    :southwest:
      :lat: 16.0708826
      :lng: 108.2306474
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 889
    :duration:
      :text: 2 mins
      :value: 117
    :end_address: 555 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0782524
      :lng: 108.2325742
    :start_address: Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0708826
      :lng: 108.2313672
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 167
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.072308
        :lng: 108.230909
      :html_instructions: Head <b>north</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Dương Đình Nghệ</b><div style="font-size:0.9em">Pass by Cà Phê Trung Tín
        (on the right)</div>
      :polyline:
        :points: _zaaBa}qsSuA`@}A`@g@NSDI?O@S?
      :start_location:
        :lat: 16.0708826
        :lng: 108.2313672
      :travel_mode: DRIVING
    - :distance:
        :text: 0.7 km
        :value: 722
      :duration:
        :text: 2 mins
        :value: 99
      :end_location:
        :lat: 16.0782524
        :lng: 108.2325742
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Ngô Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Công Ty
        Cp Kim Khí Miền Trung - Cửa Hàng Sắt Thép (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: "}bbaBezqsSIAOAY?W@WBYBG@KDa@NOFWF_@Ba@@c@@o@Au@C{@G_AMo@Ms@Oy@S{@SmA]cAc@y@a@k@_@c@[YS]Yo@m@a@c@"
      :start_location:
        :lat: 16.072308
        :lng: 108.230909
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _zaaBa}qsSsDbA{@TY@]Ai@Ao@Da@Dm@Tg@NaADsA?qBKoB[mBc@iCq@}BeAoA{@w@m@qAqA
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:56.112647', '2017-05-03 02:07:56.112647');
INSERT INTO distances VALUES (386, 138, 139, 351, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0805478
      :lng: 108.2348327
    :southwest:
      :lat: 16.0782524
      :lng: 108.2325742
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 351
    :duration:
      :text: 1 min
      :value: 33
    :end_address: Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0805478
      :lng: 108.2348327
    :start_address: 555 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0782524
      :lng: 108.2325742
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 351
      :duration:
        :text: 1 min
        :value: 33
      :end_location:
        :lat: 16.0805478
        :lng: 108.2348327
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Nguyễn Trung Trực</b><div style="font-size:0.9em">Pass by Công ty TNHH
        Thiết kế &amp; In ấn Mặt Nạ (on the right)</div><div style="font-size:0.9em">Destination
        will be on the left</div>
      :polyline:
        :points: ahcaBqdrsSWYg@e@}C{CaB}AmAmA}@{@
      :start_location:
        :lat: 16.0782524
        :lng: 108.2325742
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ahcaBqdrsSkMcM
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:56.401376', '2017-05-03 02:07:56.401376');
INSERT INTO distances VALUES (26, 1, 2, 1924, 9, '---
- :bounds:
    :northeast:
      :lat: 16.1071028
      :lng: 108.1463012
    :southwest:
      :lat: 16.094907
      :lng: 108.1348556
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.9 km
      :value: 1924
    :duration:
      :text: 3 mins
      :value: 182
    :end_address: Nguyễn Tất Thành, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.094907
      :lng: 108.1463012
    :start_address: Nguyễn Tất Thành, Nam Ô 1, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng,
      Vietnam
    :start_location:
      :lat: 16.1064987
      :lng: 108.1354885
    :steps:
    - :distance:
        :text: 89 m
        :value: 89
      :duration:
        :text: 1 min
        :value: 6
      :end_location:
        :lat: 16.1071028
        :lng: 108.1349474
      :html_instructions: Head <b>northwest</b> on <b>Nguyễn Tất Thành</b>
      :polyline:
        :points: sxhaBye_sSaA|@u@l@
      :start_location:
        :lat: 16.1064987
        :lng: 108.1354885
      :travel_mode: DRIVING
    - :distance:
        :text: 1.8 km
        :value: 1835
      :duration:
        :text: 3 mins
        :value: 176
      :end_location:
        :lat: 16.094907
        :lng: 108.1463012
      :html_instructions: Make a <b>U-turn</b><div style="font-size:0.9em">Pass by
        Quán Ăn Cây Mít (on the right in 500&nbsp;m)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: uturn-left
      :polyline:
        :points: k|haBmb_sSLP?@vAoAz@u@ZUlAcAz@s@bA{@`@_@bCuB|@u@bAw@fFqEl@k@b@]PO`FeE\[|DgDx@q@vAkA`@]NMfAaAbA_A`A_A@Ax@aAnByBHKnD_EdAuAf@q@fAmAX[
      :start_location:
        :lat: 16.1071028
        :lng: 108.1349474
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: sxhaBye_sSwBjBLPnDyCnFsE`EkDjHiGdI_HlJaI|DmDbAaAhD{DxDkElBgC`BiB
  :summary: Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:05.004743', '2017-05-03 01:32:05.004743');
INSERT INTO distances VALUES (27, 2, 3, 294, 9, '---
- :bounds:
    :northeast:
      :lat: 16.094907
      :lng: 108.1483377
    :southwest:
      :lat: 16.0931303
      :lng: 108.1463012
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 294
    :duration:
      :text: 1 min
      :value: 21
    :end_address: Nguyễn Tất Thành, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0931303
      :lng: 108.1483377
    :start_address: Nguyễn Tất Thành, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.094907
      :lng: 108.1463012
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 294
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0931303
        :lng: 108.1483377
      :html_instructions: Head <b>southeast</b> on <b>Nguyễn Tất Thành</b><div style="font-size:0.9em">Pass
        by Nhà Hàng - Khách Sạn Red Beach (on the right)</div>
      :polyline:
        :points: epfaBkiasSPSjAoAX]PSJMt@}@tAcBPWn@y@
      :start_location:
        :lat: 16.094907
        :lng: 108.1463012
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: epfaBkiasShCuChDgEn@y@
  :summary: Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:05.325345', '2017-05-03 01:32:05.325345');
INSERT INTO distances VALUES (28, 3, 4, 1306, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0931303
      :lng: 108.1581652
    :southwest:
      :lat: 16.0861598
      :lng: 108.1483377
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1306
    :duration:
      :text: 2 mins
      :value: 97
    :end_address: Nguyễn Tất Thành, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0861598
      :lng: 108.1581652
    :start_address: Nguyễn Tất Thành, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0931303
      :lng: 108.1483377
    :steps:
    - :distance:
        :text: 1.3 km
        :value: 1306
      :duration:
        :text: 2 mins
        :value: 97
      :end_location:
        :lat: 16.0861598
        :lng: 108.1581652
      :html_instructions: Head <b>southeast</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Phan Văn Định</b><div style="font-size:0.9em">Pass by Tổng Cục Kỹ Thuật
        Nhà Nghỉ (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :polyline:
        :points: aefaBcvasStBoCRUbAsAPUvBuC~CeFHM?ANWdCgEPY\m@lEgHnD_GjCsEpA{BlAqB
      :start_location:
        :lat: 16.0931303
        :lng: 108.1483377
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: aefaBcvasS~EoGvBuC~CeFHOdEgH|JgP|EoIlAqB
  :summary: Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:05.610586', '2017-05-03 01:32:05.610586');
INSERT INTO distances VALUES (29, 4, 5, 456, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0861598
      :lng: 108.1592613
    :southwest:
      :lat: 16.0831046
      :lng: 108.1576038
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 456
    :duration:
      :text: 1 min
      :value: 53
    :end_address: 43 Trần Đình Tri, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0831046
      :lng: 108.1576038
    :start_address: Nguyễn Tất Thành, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0861598
      :lng: 108.1581652
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 141
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.0854513
        :lng: 108.1592613
      :html_instructions: Head <b>southeast</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Trần Đình Tri</b>
      :polyline:
        :points: oydaBqscsShAiBbAoB
      :start_location:
        :lat: 16.0861598
        :lng: 108.1581652
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 315
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0831046
        :lng: 108.1576038
      :html_instructions: Turn <b>right</b> at Quán Nhậu Lan Hương onto <b>Trần Đình
        Tri</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: audaBkzcsS`@VRNNHNLTL`Ap@\RxCjBDBPLXP\RXNDB
      :start_location:
        :lat: 16.0854513
        :lng: 108.1592613
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: oydaBqscsShAiBbAoBt@f@vBvAnEpCvAx@
  :summary: Nguyễn Tất Thành and Trần Đình Tri
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:05.878286', '2017-05-03 01:32:05.878286');
INSERT INTO distances VALUES (30, 5, 6, 447, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0831046
      :lng: 108.1604954
    :southwest:
      :lat: 16.0807223
      :lng: 108.1573923
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 447
    :duration:
      :text: 1 min
      :value: 69
    :end_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0807223
      :lng: 108.1604954
    :start_address: 43 Trần Đình Tri, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0831046
      :lng: 108.1576038
    :steps:
    - :distance:
        :text: 38 m
        :value: 38
      :duration:
        :text: 1 min
        :value: 5
      :end_location:
        :lat: 16.0828198
        :lng: 108.1574111
      :html_instructions: Head <b>southwest</b> on <b>Trần Đình Tri</b>
      :polyline:
        :points: kfdaB_pcsSVN^T
      :start_location:
        :lat: 16.0831046
        :lng: 108.1576038
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 409
      :duration:
        :text: 1 min
        :value: 64
      :end_location:
        :lat: 16.0807223
        :lng: 108.1604954
      :html_instructions: Turn <b>left</b> at Cửa Hàng Tạp Hóa Phương onto <b>Kinh
        Dương Vương</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Thành
        Hoàng Châu (on the left)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: sddaByncsSDD@Ax@oAlAwBLQdCyE~ByD
      :start_location:
        :lat: 16.0828198
        :lng: 108.1574111
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kfdaB_pcsSv@d@FBfCgErCkF~ByD
  :summary: Kinh Dương Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:06.152656', '2017-05-03 01:32:06.152656');
INSERT INTO distances VALUES (31, 6, 7, 851, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0807223
      :lng: 108.1668714
    :southwest:
      :lat: 16.0764881
      :lng: 108.1604954
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 851
    :duration:
      :text: 2 mins
      :value: 141
    :end_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0764881
      :lng: 108.1668714
    :start_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0807223
      :lng: 108.1604954
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 466
      :duration:
        :text: 1 min
        :value: 83
      :end_location:
        :lat: 16.078375
        :lng: 108.1641106
      :html_instructions: Head <b>southeast</b> on <b>Kinh Dương Vương</b> toward
        <b>đường Hòa Minh 12</b><div style="font-size:0.9em">Pass by Dịch Vụ Nhà Đất
        Văn Phúc (on the right)</div>
      :polyline:
        :points: owcaBcbdsSNUbBwCx@yAt@oAl@gAn@iArCgF
      :start_location:
        :lat: 16.0807223
        :lng: 108.1604954
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 385
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.0764881
        :lng: 108.1668714
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Kinh Dương Vương</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa
        Hạnh (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: yhcaBuxdsS@@B?@@B?B@@?B?B?@AB?DA@ABA@A@C@A@A@C@A?C@C?C?A?C?C?A?CACAA?CAAACCAAC`@u@l@eAh@y@p@cAz@mAv@yAR[Ve@
      :start_location:
        :lat: 16.078375
        :lng: 108.1641106
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: owcaBcbdsSbFwI|AqCrCgF@@D@F@JANEFIDM?MCKGKAC`@u@vA_ClBqCjAuBVe@
  :summary: Kinh Dương Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:06.430268', '2017-05-03 01:32:06.430268');
INSERT INTO distances VALUES (32, 7, 8, 294, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0764881
      :lng: 108.1691383
    :southwest:
      :lat: 16.0749964
      :lng: 108.1668714
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 294
    :duration:
      :text: 1 min
      :value: 46
    :end_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0749964
      :lng: 108.1691383
    :start_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0764881
      :lng: 108.1668714
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 294
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0749964
        :lng: 108.1691383
      :html_instructions: Head <b>southeast</b> on <b>Kinh Dương Vương</b> toward
        <b>Phùng Hưng</b><div style="font-size:0.9em">Pass by Nhà A (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: a}baB}iesS~CsFR_@t@mADKl@aAJU
      :start_location:
        :lat: 16.0764881
        :lng: 108.1668714
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: a}baB}iesSrDsGz@yAx@wA
  :summary: Kinh Dương Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:06.668541', '2017-05-03 01:32:06.668541');
INSERT INTO distances VALUES (33, 8, 9, 540, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0749964
      :lng: 108.1733239
    :southwest:
      :lat: 16.0722734
      :lng: 108.1691383
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 540
    :duration:
      :text: 1 min
      :value: 81
    :end_address: 55 Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0722734
      :lng: 108.1733239
    :start_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0749964
      :lng: 108.1691383
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 540
      :duration:
        :text: 1 min
        :value: 81
      :end_location:
        :lat: 16.0722734
        :lng: 108.1733239
      :html_instructions: Head <b>southeast</b> on <b>Kinh Dương Vương</b> toward
        <b>Phú Lộc 8</b><div style="font-size:0.9em">Pass by Dịch Vụ Cầm Đồ Bé Lương
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: wsbaBcxesSVc@j@gAl@gAh@cAR]h@{@n@oApDgGdByC
      :start_location:
        :lat: 16.0749964
        :lng: 108.1691383
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wsbaBcxesSzCwF|@yAn@oApDgGdByC
  :summary: Kinh Dương Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:06.925249', '2017-05-03 01:32:06.925249');
INSERT INTO distances VALUES (34, 9, 10, 378, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0746019
      :lng: 108.1754149
    :southwest:
      :lat: 16.0720794
      :lng: 108.1733239
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 378
    :duration:
      :text: 1 min
      :value: 48
    :end_address: Lý Thái Tông, Thanh Khê, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0746019
      :lng: 108.1754149
    :start_address: 55 Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0722734
      :lng: 108.1733239
    :steps:
    - :distance:
        :text: 38 m
        :value: 38
      :duration:
        :text: 1 min
        :value: 4
      :end_location:
        :lat: 16.0720794
        :lng: 108.1736212
      :html_instructions: Head <b>southeast</b> on <b>Kinh Dương Vương</b> toward
        <b>Lý Thái Tông</b>
      :polyline:
        :points: ubbaBgrfsSd@{@
      :start_location:
        :lat: 16.0722734
        :lng: 108.1733239
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 340
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0746019
        :lng: 108.1754149
      :html_instructions: Turn <b>left</b> at Quán Ăn 147 onto <b>Lý Thái Tông</b><div
        style="font-size:0.9em">Pass by Cơ Sở Cơ Khí Thanh Bình (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: oabaBctfsSaBcAcBkAYQsEoCYSUSSK
      :start_location:
        :lat: 16.0720794
        :lng: 108.1736212
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ubbaBgrfsSd@{@aBcA}B}AmFcDi@_@
  :summary: Lý Thái Tông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:07.215059', '2017-05-03 01:32:07.215059');
INSERT INTO distances VALUES (35, 10, 11, 205, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0750868
      :lng: 108.1767168
    :southwest:
      :lat: 16.0742547
      :lng: 108.1754149
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 205
    :duration:
      :text: 1 min
      :value: 37
    :end_address: 100-103 Dũng Sĩ Thanh Khê, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0742547
      :lng: 108.1766862
    :start_address: Lý Thái Tông, Thanh Khê, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0746019
      :lng: 108.1754149
    :steps:
    - :distance:
        :text: 66 m
        :value: 66
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.0750868
        :lng: 108.1757756
      :html_instructions: Head <b>northeast</b> on <b>Lý Thái Tông</b> toward <b>Thanh
        Khê 6</b><div style="font-size:0.9em">Pass by Quán Ăn Thanh Tâm (on the right)</div>
      :polyline:
        :points: gqbaBi_gsSKGUO_Aq@
      :start_location:
        :lat: 16.0746019
        :lng: 108.1754149
      :travel_mode: DRIVING
    - :distance:
        :text: 57 m
        :value: 57
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0747823
        :lng: 108.176208
      :html_instructions: Turn <b>right</b> at Đồng Tiến Bakery onto <b>Thanh Khê
        6</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Diện Nam - Vpđd (on
        the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: itbaBsagsSl@{@NY
      :start_location:
        :lat: 16.0750868
        :lng: 108.1757756
      :travel_mode: DRIVING
    - :distance:
        :text: 78 m
        :value: 78
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0742771
        :lng: 108.1767168
      :html_instructions: At Nhà Thuốc Phước Thành, continue onto <b>Dũng Sĩ Thanh
        Khê</b><div style="font-size:0.9em">Pass by Cà Phê 154 (on the left)</div>
      :polyline:
        :points: krbaBidgsSDGHMNS^[^[BC
      :start_location:
        :lat: 16.0747823
        :lng: 108.176208
      :travel_mode: DRIVING
    - :distance:
        :text: 4 m
        :value: 4
      :duration:
        :text: 1 min
        :value: 2
      :end_location:
        :lat: 16.0742547
        :lng: 108.1766862
      :html_instructions: Turn <b>right</b> at Công Ty Mtv Psu Việt Nam
      :maneuver: turn-right
      :polyline:
        :points: gobaBoggsSDD
      :start_location:
        :lat: 16.0742771
        :lng: 108.1767168
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gqbaBi_gsSa@W_Aq@l@{@Ta@Xa@~@w@BCDD
  :summary: Lý Thái Tông, Thanh Khê 6 and Dũng Sĩ Thanh Khê
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0747488
      :lng: 108.1767168
    :southwest:
      :lat: 16.0741151
      :lng: 108.1752482
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 256
    :duration:
      :text: 1 min
      :value: 80
    :end_address: 100-103 Dũng Sĩ Thanh Khê, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0742547
      :lng: 108.1766862
    :start_address: Lý Thái Tông, Thanh Khê, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0746019
      :lng: 108.1754149
    :steps:
    - :distance:
        :text: 30 m
        :value: 30
      :duration:
        :text: 1 min
        :value: 4
      :end_location:
        :lat: 16.0743875
        :lng: 108.1752482
      :html_instructions: Head <b>southwest</b> on <b>Lý Thái Tông</b> toward <b>Dũng
        Sĩ Thanh Khê</b>
      :polyline:
        :points: gqbaBi_gsSRJTR
      :start_location:
        :lat: 16.0746019
        :lng: 108.1754149
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 149
      :duration:
        :text: 1 min
        :value: 59
      :end_location:
        :lat: 16.0747488
        :lng: 108.1762496
      :html_instructions: Turn <b>left</b> at Cửa Hàng Phụ Tùng Xe Máy Trung Thành
        onto <b>Dũng Sĩ Thanh Khê</b><div style="font-size:0.9em">Pass by Quán Lẩu
        Bò 6 Vy (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: "}obaBi~fsSb@g@LSBG?A?A?E?C?ACEIK_BuAOK"
      :start_location:
        :lat: 16.0743875
        :lng: 108.1752482
      :travel_mode: DRIVING
    - :distance:
        :text: 73 m
        :value: 73
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0742771
        :lng: 108.1767168
      :html_instructions: Turn <b>right</b> at Dịch Vụ Rửa Xe Lâm Quân to stay on
        <b>Dũng Sĩ Thanh Khê</b><div style="font-size:0.9em">Pass by Cà Phê 154 (on
        the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: erbaBqdgsSHMNS^[^[BC
      :start_location:
        :lat: 16.0747488
        :lng: 108.1762496
      :travel_mode: DRIVING
    - :distance:
        :text: 4 m
        :value: 4
      :duration:
        :text: 1 min
        :value: 2
      :end_location:
        :lat: 16.0742547
        :lng: 108.1766862
      :html_instructions: Turn <b>right</b> at Công Ty Mtv Psu Việt Nam<div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: gobaBoggsSDD
      :start_location:
        :lat: 16.0742771
        :lng: 108.1767168
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.074403
        :lng: 108.1759485
      :step_index: 1
      :step_interpolation: 0.664074791319206
  :overview_polyline:
    :points: gqbaBi_gsSh@^p@{@BQCKiBaBOKHMn@o@b@_@DD
  :summary: Dũng Sĩ Thanh Khê
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:07.511596', '2017-05-03 01:32:07.511596');
INSERT INTO distances VALUES (36, 11, 12, 340, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0742771
      :lng: 108.1787897
    :southwest:
      :lat: 16.0720032
      :lng: 108.1766862
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 340
    :duration:
      :text: 1 min
      :value: 55
    :end_address: 91 Dũng Sĩ Thanh Khê, Thanh Khê, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0720032
      :lng: 108.1787897
    :start_address: 100-103 Dũng Sĩ Thanh Khê, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0742547
      :lng: 108.1766862
    :steps:
    - :distance:
        :text: 4 m
        :value: 4
      :duration:
        :text: 1 min
        :value: 1
      :end_location:
        :lat: 16.0742771
        :lng: 108.1767168
      :html_instructions: Head <b>northeast</b> toward <b>Dũng Sĩ Thanh Khê</b>
      :polyline:
        :points: aobaBiggsSEE
      :start_location:
        :lat: 16.0742547
        :lng: 108.1766862
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 336
      :duration:
        :text: 1 min
        :value: 54
      :end_location:
        :lat: 16.0720032
        :lng: 108.1787897
      :html_instructions: Turn <b>right</b> at Công Ty Mtv Psu Việt Nam onto <b>Dũng
        Sĩ Thanh Khê</b><div style="font-size:0.9em">Pass by Cà Phê Galaxy (on the
        right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: gobaBoggsSfCwBlBeBxAsAd@c@pAgA
      :start_location:
        :lat: 16.0742771
        :lng: 108.1767168
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: aobaBiggsSEEfCwBfEyDvBkB
  :summary: Dũng Sĩ Thanh Khê
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:07.830239', '2017-05-03 01:32:07.830239');
INSERT INTO distances VALUES (37, 12, 13, 237, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0720032
      :lng: 108.1802625
    :southwest:
      :lat: 16.0704111
      :lng: 108.1787897
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 237
    :duration:
      :text: 1 min
      :value: 35
    :end_address: 6 Dũng Sĩ Thanh Khê, Thanh Khê, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0704111
      :lng: 108.1802625
    :start_address: 91 Dũng Sĩ Thanh Khê, Thanh Khê, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0720032
      :lng: 108.1787897
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 237
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0704111
        :lng: 108.1802625
      :html_instructions: Head <b>southeast</b> on <b>Dũng Sĩ Thanh Khê</b> toward
        <b>Yên Khê 1</b><div style="font-size:0.9em">Pass by Cà Phê Phúc Thành Tiến
        (on the left)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: _abaBmtgsSx@s@\Y^[dE{D
      :start_location:
        :lat: 16.0720032
        :lng: 108.1787897
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _abaBmtgsSvAmAdFwE
  :summary: Dũng Sĩ Thanh Khê
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:08.089395', '2017-05-03 01:32:08.089395');
INSERT INTO distances VALUES (38, 13, 14, 532, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0704111
      :lng: 108.1832766
    :southwest:
      :lat: 16.0675469
      :lng: 108.1802625
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 532
    :duration:
      :text: 2 mins
      :value: 108
    :end_address: 721 Trần Cao Vân, Thanh Khê Đông, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0684313
      :lng: 108.1832766
    :start_address: 6 Dũng Sĩ Thanh Khê, Thanh Khê, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0704111
      :lng: 108.1802625
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 384
      :duration:
        :text: 1 min
        :value: 81
      :end_location:
        :lat: 16.0675469
        :lng: 108.1822497
      :html_instructions: Head <b>southeast</b> on <b>Dũng Sĩ Thanh Khê</b> toward
        <b>Yên Khê 1</b><div style="font-size:0.9em">Pass by Xí Nghiệp Xd Công Trình
        3 - Công Ty Xd Công Trình Giao Thông 529 (on the left)</div>
      :polyline:
        :points: awaaBs}gsSJK~AsAlAw@^QnBaAnAm@xBuAf@]
      :start_location:
        :lat: 16.0704111
        :lng: 108.1802625
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 148
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0684313
        :lng: 108.1832766
      :html_instructions: Turn <b>left</b> at Cửa Hàng Giày Dép Thể Thao onto <b>Trần
        Cao Vân</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: eeaaBajhsSw@gAg@u@e@i@e@a@CC
      :start_location:
        :lat: 16.0675469
        :lng: 108.1822497
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: awaaBs}gsSjB_BlBiA~DoB`DsB_B}BkAkACC
  :summary: Dũng Sĩ Thanh Khê and Trần Cao Vân
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0704111
      :lng: 108.1832766
    :southwest:
      :lat: 16.0678323
      :lng: 108.1802625
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 531
    :duration:
      :text: 2 mins
      :value: 132
    :end_address: 721 Trần Cao Vân, Thanh Khê Đông, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0684313
      :lng: 108.1832766
    :start_address: 6 Dũng Sĩ Thanh Khê, Thanh Khê, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0704111
      :lng: 108.1802625
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 224
      :duration:
        :text: 1 min
        :value: 49
      :end_location:
        :lat: 16.0687561
        :lng: 108.1814381
      :html_instructions: Head <b>southeast</b> on <b>Dũng Sĩ Thanh Khê</b> toward
        <b>Yên Khê 1</b><div style="font-size:0.9em">Pass by Xí Nghiệp Xd Công Trình
        3 - Công Ty Xd Công Trình Giao Thông 529 (on the left)</div>
      :polyline:
        :points: awaaBs}gsSJK~AsAlAw@^QnBaA
      :start_location:
        :lat: 16.0704111
        :lng: 108.1802625
      :travel_mode: DRIVING
    - :distance:
        :text: 56 m
        :value: 56
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0690139
        :lng: 108.1818885
      :html_instructions: Turn <b>left</b> at Cà Phê N-M onto <b>Yên Khê 2</b>
      :maneuver: turn-left
      :polyline:
        :points: wlaaB_ehsSGQO]MUKS
      :start_location:
        :lat: 16.0687561
        :lng: 108.1814381
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 153
      :duration:
        :text: 1 min
        :value: 39
      :end_location:
        :lat: 16.0678323
        :lng: 108.1826144
      :html_instructions: Turn <b>right</b> at Cà Phê Z5 onto <b>Thanh Huy 3</b><div
        style="font-size:0.9em">Pass by Quán Bún Chả Cá Bà Lý (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: inaaByghsSdCsAdB{@
      :start_location:
        :lat: 16.0690139
        :lng: 108.1818885
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 98
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0684313
        :lng: 108.1832766
      :html_instructions: Turn <b>left</b> at Cửa Hàng Quang Nhật Computer onto <b>Trần
        Cao Vân</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: "}faaBilhsSg@u@e@i@e@a@CC"
      :start_location:
        :lat: 16.0678323
        :lng: 108.1826144
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0686762
        :lng: 108.1821004
      :step_index: 2
      :step_interpolation: 0.2873569465721529
  :overview_polyline:
    :points: awaaBs}gsSjB_BlBiAnBaAGQ]s@KSdCsAdB{@g@u@kAkACC
  :summary: Dũng Sĩ Thanh Khê and Thanh Huy 3
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:08.364253', '2017-05-03 01:32:08.364253');
INSERT INTO distances VALUES (39, 14, 15, 571, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0718082
      :lng: 108.1868973
    :southwest:
      :lat: 16.0684313
      :lng: 108.1832766
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 571
    :duration:
      :text: 1 min
      :value: 86
    :end_address: 601 Trần Cao Vân, Xuân Hà, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0716566
      :lng: 108.1868973
    :start_address: 721 Trần Cao Vân, Thanh Khê Đông, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0684313
      :lng: 108.1832766
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 571
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0716566
        :lng: 108.1868973
      :html_instructions: Head <b>northeast</b> on <b>Trần Cao Vân</b> toward <b>Thanh
        Huy 1</b><div style="font-size:0.9em">Pass by Cty TNHH Vạn Nhất Trung (on
        the left)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ujaaBophsSq@e@u@q@cBiBiAmAW[kAeAm@_@aBy@YK]Ma@UOIKIIKGIKSCQAE?S?QDUFWHYDS
      :start_location:
        :lat: 16.0684313
        :lng: 108.1832766
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ujaaBophsSgBwAmDwDW[kAeAm@_@aBy@w@Yq@_@UUS]EW?e@\{A
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:08.6549', '2017-05-03 01:32:08.6549');
INSERT INTO distances VALUES (40, 15, 16, 576, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0716566
      :lng: 108.1922406
    :southwest:
      :lat: 16.0712476
      :lng: 108.1868973
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 576
    :duration:
      :text: 2 mins
      :value: 100
    :end_address: 614 Trần Cao Vân, Xuân Hà, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0712476
      :lng: 108.1922406
    :start_address: 601 Trần Cao Vân, Xuân Hà, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0716566
      :lng: 108.1868973
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 576
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0712476
        :lng: 108.1922406
      :html_instructions: Head <b>east</b> on <b>Trần Cao Vân</b> toward <b>Nguyễn
        Đức Trung</b><div style="font-size:0.9em">Pass by Cà Phê Pro (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: "{~aaBcgisSBINo@DW?MRmALyA@O?kA?m@@i@B}BH{BByA?mD?mB"
      :start_location:
        :lat: 16.0716566
        :lng: 108.1868973
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{~aaBcgisSRy@De@RmALyA@{A@wALyFByA?mD?mB"
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:08.934177', '2017-05-03 01:32:08.934177');
INSERT INTO distances VALUES (41, 16, 17, 694, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0712476
      :lng: 108.1986527
    :southwest:
      :lat: 16.0710265
      :lng: 108.1922406
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 694
    :duration:
      :text: 2 mins
      :value: 101
    :end_address: K 291 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0710265
      :lng: 108.1986472
    :start_address: 614 Trần Cao Vân, Xuân Hà, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0712476
      :lng: 108.1922406
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 685
      :duration:
        :text: 2 mins
        :value: 98
      :end_location:
        :lat: 16.0711087
        :lng: 108.1986527
      :html_instructions: Head <b>east</b> on <b>Trần Cao Vân</b> toward <b>Xuân Đán
        1</b><div style="font-size:0.9em">Pass by Shop Sang My (on the right)</div>
      :polyline:
        :points: i|aaBohjsS?c@@c@@mBBg@@o@?sA?q@@oAAm@BgC@uA?k@BwA@yCBsC@_B
      :start_location:
        :lat: 16.0712476
        :lng: 108.1922406
      :travel_mode: DRIVING
    - :distance:
        :text: 9 m
        :value: 9
      :duration:
        :text: 1 min
        :value: 3
      :end_location:
        :lat: 16.0710265
        :lng: 108.1986472
      :html_instructions: Turn <b>right</b> at Quán Bò Né Vũ Gia onto <b>K 291 Trần
        Cao Vân</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: m{aaBqpksSN?
      :start_location:
        :lat: 16.0711087
        :lng: 108.1986527
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: i|aaBohjsSF}EBeGBwHJeNN?
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:14.503291', '2017-05-03 01:32:14.503291');
INSERT INTO distances VALUES (42, 17, 18, 352, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0711285
      :lng: 108.2018571
    :southwest:
      :lat: 16.0710265
      :lng: 108.1986472
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 352
    :duration:
      :text: 2 mins
      :value: 101
    :end_address: 324 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0711285
      :lng: 108.2018571
    :start_address: K 291 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0710265
      :lng: 108.1986472
    :steps:
    - :distance:
        :text: 9 m
        :value: 9
      :duration:
        :text: 1 min
        :value: 2
      :end_location:
        :lat: 16.0711087
        :lng: 108.1986527
      :html_instructions: Head <b>north</b> on <b>K 291 Trần Cao Vân</b> toward <b>Trần
        Cao Vân</b>
      :polyline:
        :points: "}zaaBqpksSO?"
      :start_location:
        :lat: 16.0710265
        :lng: 108.1986472
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 343
      :duration:
        :text: 2 mins
        :value: 99
      :end_location:
        :lat: 16.0711285
        :lng: 108.2018571
      :html_instructions: Turn <b>right</b> at Quán Bò Né Vũ Gia onto <b>Trần Cao
        Vân</b><div style="font-size:0.9em">Pass by Cơ Sở Sản Xuất Bánh Cô Khéo (on
        the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: m{aaBqpksS?i@BuA?a@@qA@qBAwAAqAAi@Ak@C[
      :start_location:
        :lat: 16.0711087
        :lng: 108.1986527
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}zaaBqpksSO??i@BwBBcECiDGqB"
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:14.769015', '2017-05-03 01:32:14.769015');
INSERT INTO distances VALUES (43, 18, 19, 695, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0723945
      :lng: 108.2082523
    :southwest:
      :lat: 16.0711311
      :lng: 108.2018816
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 695
    :duration:
      :text: 2 mins
      :value: 112
    :end_address: 138 Trần Cao Vân, Tam Thuận, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0723945
      :lng: 108.2082523
    :start_address: 324 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0711311
      :lng: 108.2018816
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 695
      :duration:
        :text: 2 mins
        :value: 112
      :end_location:
        :lat: 16.0723945
        :lng: 108.2082523
      :html_instructions: Head <b>east</b> on <b>Trần Cao Vân</b><div style="font-size:0.9em">Pass
        by Shop Thời Trang Hồng Hạnh (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: q{aaBwdlsSAOGo@Ea@EYEa@?ACWCME]AKIe@AQCOGg@Ec@Ii@?EGg@EYEUCc@Ge@CSAGAIQgAKu@UoBWsBOsA]yC?ME_@
      :start_location:
        :lat: 16.0711311
        :lng: 108.2018816
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: q{aaBwdlsSc@eEo@gFS}AO}Aa@oC{AqMEm@
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:15.035039', '2017-05-03 01:32:15.035039');
INSERT INTO distances VALUES (44, 19, 20, 692, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0749763
      :lng: 108.2128887
    :southwest:
      :lat: 16.0723945
      :lng: 108.2082523
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 692
    :duration:
      :text: 2 mins
      :value: 131
    :end_address: 103-105 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0749763
      :lng: 108.2125689
    :start_address: 138 Trần Cao Vân, Tam Thuận, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0723945
      :lng: 108.2082523
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 506
      :duration:
        :text: 1 min
        :value: 85
      :end_location:
        :lat: 16.0733364
        :lng: 108.2128887
      :html_instructions: Head <b>east</b> on <b>Trần Cao Vân</b> toward <b>k112 Trần
        Cao Vân</b><div style="font-size:0.9em">Pass by Tiệm Hớt Tóc Hoàng Tín (on
        the right)</div>
      :polyline:
        :points: mcbaBqlmsSQwAe@iDGo@OmAQsAACIu@YwB]wCWaC
      :start_location:
        :lat: 16.0723945
        :lng: 108.2082523
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 186
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0749763
        :lng: 108.2125689
      :html_instructions: Turn <b>left</b> at Viettel Store onto <b>Ông Ích Khiêm</b><div
        style="font-size:0.9em">Pass by Cà Phê 137 (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: kibaBqinsS{CZkC\_@D
      :start_location:
        :lat: 16.0733364
        :lng: 108.2128887
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mcbaBqlmsSw@aGW}Bw@eGu@yGgHx@_@D
  :summary: Trần Cao Vân and Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0762271
      :lng: 108.2125689
    :southwest:
      :lat: 16.0723945
      :lng: 108.2082523
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 861
    :duration:
      :text: 4 mins
      :value: 235
    :end_address: 103-105 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0749763
      :lng: 108.2125689
    :start_address: 138 Trần Cao Vân, Tam Thuận, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0723945
      :lng: 108.2082523
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 141
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0726701
        :lng: 108.2095376
      :html_instructions: Head <b>east</b> on <b>Trần Cao Vân</b> toward <b>k112 Trần
        Cao Vân</b><div style="font-size:0.9em">Pass by Tiệm Hớt Tóc Hoàng Tín (on
        the right)</div>
      :polyline:
        :points: mcbaBqlmsSQwAe@iD
      :start_location:
        :lat: 16.0723945
        :lng: 108.2082523
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 111
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0735098
        :lng: 108.2089806
      :html_instructions: Turn <b>left</b> at Rèm Màn Đà Nẵng Tabitha onto <b>k112
        Trần Cao Vân</b>
      :maneuver: turn-left
      :polyline:
        :points: eebaBstmsSmAj@yAbA
      :start_location:
        :lat: 16.0726701
        :lng: 108.2095376
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 467
      :duration:
        :text: 2 mins
        :value: 146
      :end_location:
        :lat: 16.0762271
        :lng: 108.2123069
      :html_instructions: Turn <b>right</b> at Anh Tuấn 85 Studio onto <b>Đinh Tiên
        Hoàng</b><div style="font-size:0.9em">Pass by Trường tiểu học Ông Ích Khiêm-cơ
        sở 2 (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: mjbaBcqmsSyAgBy@mAw@cA_AoAa@i@o@y@u@_AYa@IM}@oAi@k@
      :start_location:
        :lat: 16.0735098
        :lng: 108.2089806
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 142
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0749763
        :lng: 108.2125689
      :html_instructions: Turn <b>right</b> at Nhà May Lan Anh onto <b>Ông Ích Khiêm</b><div
        style="font-size:0.9em">Pass by Quán Bia Dũng Nga (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: m{baB}ensSNA|AOtAUt@K
      :start_location:
        :lat: 16.0762271
        :lng: 108.2123069
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0737329
        :lng: 108.2092408
      :step_index: 2
      :step_interpolation: 0.07984439356879286
  :overview_polyline:
    :points: mcbaBqlmsSw@aGmAj@yAbAyAgBy@mAwBsCaDeEgA}Ai@k@NA|AOtAUt@K
  :summary: Đinh Tiên Hoàng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:15.324664', '2017-05-03 01:32:15.324664');
INSERT INTO distances VALUES (453, 107, 108, 1868, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0396793
      :lng: 108.242747
    :southwest:
      :lat: 16.0337823
      :lng: 108.227814
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.9 km
      :value: 1868
    :duration:
      :text: 3 mins
      :value: 153
    :end_address: Tiên Sơn, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0337823
      :lng: 108.227814
    :start_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0396793
      :lng: 108.2421332
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 148
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0384979
        :lng: 108.242747
      :html_instructions: Head <b>southeast</b> on <b>Ngũ Hành Sơn</b> toward <b>QL14B</b><div
        style="font-size:0.9em">Pass by Bưu điện Ngũ Hành Sơn (on the left)</div>
      :polyline:
        :points: _w{`Bi`tsSl@SzBy@VMNKHINI
      :start_location:
        :lat: 16.0396793
        :lng: 108.2421332
      :travel_mode: DRIVING
    - :distance:
        :text: 1.7 km
        :value: 1720
      :duration:
        :text: 2 mins
        :value: 133
      :end_location:
        :lat: 16.0337823
        :lng: 108.227814
      :html_instructions: Turn <b>right</b> at Cà Phê Đồng Quê onto <b>Tiên Sơn</b>/<b>QL14B</b><div
        style="font-size:0.9em">Continue to follow QL14B</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: so{`BedtsSnA\d@Vl@`A`BrCjAtBXz@\z@XfAV|@h@vC^rCD\D^jApJz@zGTfBThBVdBTtBlCfTl@|E
      :start_location:
        :lat: 16.0384979
        :lng: 108.242747
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _w{`Bi`tsShDmAf@YHINInA\d@VnCtEjAtBXz@v@bCV|@h@vCd@pDpApK~BrQpEz^
  :summary: QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:48.179367', '2017-05-03 02:10:48.179367');
INSERT INTO distances VALUES (45, 20, 21, 370, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0782388
      :lng: 108.2125689
    :southwest:
      :lat: 16.0749763
      :lng: 108.2119098
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 370
    :duration:
      :text: 1 min
      :value: 67
    :end_address: 44-48 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0782388
      :lng: 108.2119098
    :start_address: 103-105 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0749763
      :lng: 108.2125689
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 370
      :duration:
        :text: 1 min
        :value: 67
      :end_location:
        :lat: 16.0782388
        :lng: 108.2119098
      :html_instructions: Head <b>north</b> on <b>Ông Ích Khiêm</b> toward <b>K33
        Ông ích Khiêm</b><div style="font-size:0.9em">Pass by Shop Hoa Ry Cây (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ssbaBqgnsSu@JuAT}ANO@mAN]Hs@HG?k@Hg@DYD{BT
      :start_location:
        :lat: 16.0749763
        :lng: 108.2125689
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ssbaBqgnsSkC`@mBPkBX{@HiFj@
  :summary: Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:15.552645', '2017-05-03 01:32:15.552645');
INSERT INTO distances VALUES (46, 21, 22, 393, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0792393
      :lng: 108.2145415
    :southwest:
      :lat: 16.0779872
      :lng: 108.2118528
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 393
    :duration:
      :text: 1 min
      :value: 79
    :end_address: 158 Lý Tự Trọng, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0779872
      :lng: 108.2145415
    :start_address: 44-48 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0782388
      :lng: 108.2119098
    :steps:
    - :distance:
        :text: 29 m
        :value: 29
      :duration:
        :text: 1 min
        :value: 6
      :end_location:
        :lat: 16.0784955
        :lng: 108.2118528
      :html_instructions: Head <b>north</b> on <b>Ông Ích Khiêm</b> toward <b>K18
        Ông Ích Khiêm</b>
      :polyline:
        :points: _hcaBmcnsS]DUD
      :start_location:
        :lat: 16.0782388
        :lng: 108.2119098
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 142
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0792393
        :lng: 108.2129277
      :html_instructions: Turn <b>right</b> at Ban Quản Lý Dự Án Xd Tp. Đà Nẵng onto
        <b>Thanh Sơn</b><div style="font-size:0.9em">Pass by Dịch Vụ Internet Susu
        2 (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: sicaBacnsS_@s@y@qAy@qA
      :start_location:
        :lat: 16.0784955
        :lng: 108.2118528
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 222
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0779872
        :lng: 108.2145415
      :html_instructions: Turn <b>right</b> at Quán Ăn Sen onto <b>Lý Tự Trọng</b><div
        style="font-size:0.9em">Pass by Quán Mì Quảng Phú Chiêm (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: gncaByinsSpBcCj@y@f@y@Vc@Ze@
      :start_location:
        :lat: 16.0792393
        :lng: 108.2129277
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _hcaBmcnsSs@JyAeCy@qApBcCrAsBr@iA
  :summary: Thanh Sơn and Lý Tự Trọng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:15.854836', '2017-05-03 01:32:15.854836');
INSERT INTO distances VALUES (47, 22, 23, 297, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0779872
      :lng: 108.2165777
    :southwest:
      :lat: 16.0768997
      :lng: 108.2145415
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 297
    :duration:
      :text: 1 min
      :value: 74
    :end_address: 228-230 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0775769
      :lng: 108.2165777
    :start_address: 158 Lý Tự Trọng, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0779872
      :lng: 108.2145415
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 207
      :duration:
        :text: 1 min
        :value: 51
      :end_location:
        :lat: 16.0768997
        :lng: 108.2161178
      :html_instructions: Head <b>southeast</b> on <b>Lý Tự Trọng</b> toward <b>Kiệt
        46 Cao Thắng</b><div style="font-size:0.9em">Pass by Tiệm Uốn Tóc Tuyết Mai
        (on the right)</div>
      :polyline:
        :points: mfcaB{snsSZg@b@s@LS^i@d@}@dAcB
      :start_location:
        :lat: 16.0779872
        :lng: 108.2145415
      :travel_mode: DRIVING
    - :distance:
        :text: 90 m
        :value: 90
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0775769
        :lng: 108.2165777
      :html_instructions: Turn <b>left</b> at Anh Thu Company onto <b>Đống Đa</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Đồ Chơi Tấn Phát (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: s_caBw}nsSgC{A
      :start_location:
        :lat: 16.0768997
        :lng: 108.2161178
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mfcaB{snsSlByCjBaDgC{A
  :summary: Lý Tự Trọng and Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:16.147334', '2017-05-03 01:32:16.147334');
INSERT INTO distances VALUES (48, 23, 24, 347, 9, '---
- :bounds:
    :northeast:
      :lat: 16.080182
      :lng: 108.2183577
    :southwest:
      :lat: 16.0775769
      :lng: 108.2165777
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 347
    :duration:
      :text: 1 min
      :value: 50
    :end_address: 126-136 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.080182
      :lng: 108.2183577
    :start_address: 228-230 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0775769
      :lng: 108.2165777
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 347
      :duration:
        :text: 1 min
        :value: 50
      :end_location:
        :lat: 16.080182
        :lng: 108.2183577
      :html_instructions: Head <b>northeast</b> on <b>Đống Đa</b> toward <b>Nguyễn
        Du</b><div style="font-size:0.9em">Pass by Shop Thời Trang Nem (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: "{ccaBs`osSeAo@SMg@]UOoG{D_@S_Ag@"
      :start_location:
        :lat: 16.0775769
        :lng: 108.2165777
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{ccaBs`osSwCkBoHoE_Ag@"
  :summary: Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:16.452379', '2017-05-03 01:32:16.452379');
INSERT INTO distances VALUES (49, 24, 26, 791, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0842668
      :lng: 108.2225844
    :southwest:
      :lat: 16.080182
      :lng: 108.2183577
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 791
    :duration:
      :text: 2 mins
      :value: 119
    :end_address: 22 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0842668
      :lng: 108.2214247
    :start_address: 126-136 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.080182
      :lng: 108.2183577
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 531
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0825806
        :lng: 108.2222807
      :html_instructions: Head <b>northeast</b> on <b>Đống Đa</b> toward <b>Lê Lợi</b>/<b>Trần
        Quý Cáp</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Tư Vấn Kiến Trúc
        Miền Trung (on the right)</div>
      :polyline:
        :points: ctcaBwkosSo@]u@g@e@]q@a@i@Y]Uc@_@a@a@Yc@Ye@O]M]ES?AESIe@Im@Gw@IeAAEImACaA
      :start_location:
        :lat: 16.080182
        :lng: 108.2183577
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 260
      :duration:
        :text: 1 min
        :value: 33
      :end_location:
        :lat: 16.0842668
        :lng: 108.2214247
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>3 Tháng
        2</b><div style="font-size:0.9em">Pass by Ngân hàng Public Việt Nam, (on the
        right)</div><div style="font-size:0.9em">Destination will be on the left</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ccdaBgdpsS@A@C?A@A@A?C?A@C?A?C?AAA?CAA?AAC?AAAAAAAAAAAAAC?AAA?CAC?A?A?C?A?C@A?A@A@A?A@C@?@ABA@aElCo@j@e@ZA@
      :start_location:
        :lat: 16.0825806
        :lng: 108.2222807
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ctcaBwkosSeBeAwA_AgAo@eAaAs@iA]{@UoAQeBKkAMoCBEBI@KGSQKW?ONaElCo@j@g@\
  :summary: Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:16.753783', '2017-05-03 01:32:16.753783');
INSERT INTO distances VALUES (50, 26, 27, 513, 9, '---
- :bounds:
    :northeast:
      :lat: 16.0870588
      :lng: 108.2214096
    :southwest:
      :lat: 16.0842834
      :lng: 108.2195475
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 513
    :duration:
      :text: 1 min
      :value: 81
    :end_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.086579
      :lng: 108.2204171
    :start_address: 22 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0842834
      :lng: 108.2214096
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 245
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :html_instructions: Head <b>northwest</b> on <b>3 Tháng 2</b> toward <b>Đức
        Lợi 2</b><div style="font-size:0.9em">Pass by TheSinhTourist Da Nang (on the
        right)</div>
      :polyline:
        :points: wmdaBy~osSYT[X]VKNU^A@Uf@Sh@Qb@o@`BQ`@
      :start_location:
        :lat: 16.0842834
        :lng: 108.2214096
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 183
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Turn <b>right</b> at Cà Phê 82 onto <b>Xuân Diệu</b><div
        style="font-size:0.9em">Pass by Cafe Monza (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: mudaBesosS}Am@{A]_@Iw@Oc@E
      :start_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.086579
        :lng: 108.2204171
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Đinh Công Tráng</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: c_eaBqvosSD[@M@CBM@E@CBCBABANAJ?VHHBB?
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wmdaBy~osS_BvAW`@i@pAaAdCQ`@}Am@{Bg@{AUL{@JORCb@HLB
  :summary: 3 Tháng 2 and Xuân Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:32:17.160512', '2017-05-03 01:32:17.160512');
INSERT INTO distances VALUES (387, 139, 140, 498, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0838336
      :lng: 108.2380358
    :southwest:
      :lat: 16.0805622
      :lng: 108.2348467
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 498
    :duration:
      :text: 1 min
      :value: 44
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0838336
      :lng: 108.2380358
    :start_address: Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0805622
      :lng: 108.2348467
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 498
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0838336
        :lng: 108.2380358
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Trần Thánh Tông</b><div style="font-size:0.9em">Pass by Vietcombank - PGD
        Sơn Trà (on the right)</div>
      :polyline:
        :points: ovcaByrrsSmCiCeAcAwCsCeD_Dc@c@iAgAMO
      :start_location:
        :lat: 16.0805622
        :lng: 108.2348467
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ovcaByrrsSmS}R
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:56.65012', '2017-05-03 02:07:56.65012');
INSERT INTO distances VALUES (388, 140, 141, 136, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0846925
      :lng: 108.2380358
    :southwest:
      :lat: 16.0838336
      :lng: 108.2371246
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.1 km
      :value: 136
    :duration:
      :text: 1 min
      :value: 20
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0846925
      :lng: 108.2371246
    :start_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0838336
      :lng: 108.2380358
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 136
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0846925
        :lng: 108.2371246
      :html_instructions: Head <b>northwest</b> on <b>Trần Thánh Tông</b> toward <b>Ngô
        Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Cafe Nhạc Xưa (on
        the right)</div>
      :polyline:
        :points: "}jdaBwfssSA@QPKJqAtAy@`A"
      :start_location:
        :lat: 16.0838336
        :lng: 108.2380358
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}jdaBwfssSkDvD"
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:56.976593', '2017-05-03 02:07:56.976593');
INSERT INTO distances VALUES (389, 141, 142, 1100, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0914002
      :lng: 108.2371246
    :southwest:
      :lat: 16.0846925
      :lng: 108.2310586
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.1 km
      :value: 1100
    :duration:
      :text: 3 mins
      :value: 176
    :end_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0914002
      :lng: 108.2313478
    :start_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0846925
      :lng: 108.2371246
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 597
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0883491
        :lng: 108.2330401
      :html_instructions: Head <b>northwest</b> on <b>Trần Thánh Tông</b> toward <b>Lý
        Đạo Thành</b><div style="font-size:0.9em">Pass by Cửa Hàng Xăng Dầu Số 28
        - Petrolimex (on the left in 450&nbsp;m)</div>
      :polyline:
        :points: ipdaB_assSiApASR_@b@eBnBmArAyBdCaBnBKN{CjDe@n@
      :start_location:
        :lat: 16.0846925
        :lng: 108.2371246
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 250
      :duration:
        :text: 1 min
        :value: 48
      :end_location:
        :lat: 16.0905061
        :lng: 108.2328827
      :html_instructions: At the roundabout, take the <b>2nd</b> exit<div style="font-size:0.9em">Pass
        by Công Ty Tnhh Thương Mại &amp; Dịch Vụ Tam Phùng Hưng Thịnh (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: egeaBogrsSCACAEAC?E?C?C?E@C@E@CBC@ABCBABADCF{@?}A@gD?g@A
      :start_location:
        :lat: 16.0883491
        :lng: 108.2330401
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 205
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0910663
        :lng: 108.2310586
      :html_instructions: Turn <b>left</b> at Mầm Non Hải Ca onto <b>Phạm Huy Thông</b><div
        style="font-size:0.9em">Pass by Chung cư A6 (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: uteaBofrsSAV{@vDCJm@nC
      :start_location:
        :lat: 16.0905061
        :lng: 108.2328827
      :travel_mode: DRIVING
    - :distance:
        :text: 48 m
        :value: 48
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0914002
        :lng: 108.2313478
      :html_instructions: Turn <b>right</b>
      :maneuver: turn-right
      :polyline:
        :points: exeaBc{qsSaAy@
      :start_location:
        :lat: 16.0910663
        :lng: 108.2310586
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ipdaB_assScFxFuHxIaEzEGCSASDMLCHCF{@?eG@g@AAV_AbEm@nCaAy@
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0914002
      :lng: 108.2371246
    :southwest:
      :lat: 16.0846925
      :lng: 108.2309973
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.2 km
      :value: 1156
    :duration:
      :text: 3 mins
      :value: 198
    :end_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0914002
      :lng: 108.2313478
    :start_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0846925
      :lng: 108.2371246
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 597
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0883491
        :lng: 108.2330401
      :html_instructions: Head <b>northwest</b> on <b>Trần Thánh Tông</b> toward <b>Lý
        Đạo Thành</b><div style="font-size:0.9em">Pass by Cửa Hàng Xăng Dầu Số 28
        - Petrolimex (on the left in 450&nbsp;m)</div>
      :polyline:
        :points: ipdaB_assSiApASR_@b@eBnBmArAyBdCaBnBKN{CjDe@n@
      :start_location:
        :lat: 16.0846925
        :lng: 108.2371246
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 135
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0894659
        :lng: 108.232867
      :html_instructions: At the roundabout, take the <b>2nd</b> exit
      :maneuver: roundabout-right
      :polyline:
        :points: egeaBogrsSCACAEAC?E?C?C?E@C@E@CBC@ABCBABADCF{@?}A@
      :start_location:
        :lat: 16.0883491
        :lng: 108.2330401
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 199
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0894771
        :lng: 108.2310016
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Thương Mại &amp; Dịch Vụ
        Tam Phùng Hưng Thịnh onto <b>Bùi Dương Lịch</b><div style="font-size:0.9em">Pass
        by Trang Điểm Đà Nẵng - Ngọc Bích Make Up (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: eneaBmfrsS?RA`J
      :start_location:
        :lat: 16.0894659
        :lng: 108.232867
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 225
      :duration:
        :text: 1 min
        :value: 57
      :end_location:
        :lat: 16.0914002
        :lng: 108.2313478
      :html_instructions: Turn <b>right</b> at the 1st cross street<div style="font-size:0.9em">Pass
        by Đại Lý Gạo Anh Tuấn (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: gneaBwzqsSgA?Q?kC?wAKaAy@
      :start_location:
        :lat: 16.0894771
        :lng: 108.2310016
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0894724
        :lng: 108.2318875
      :step_index: 2
      :step_interpolation: 0.5250928631952442
  :overview_polyline:
    :points: ipdaB_assScFxFuHxIaEzEGCSASDMLCHCF{@?}A@?RA`JgA?}C?wAKaAy@
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0927213
      :lng: 108.2378803
    :southwest:
      :lat: 16.0846925
      :lng: 108.2313478
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.5 km
      :value: 1476
    :duration:
      :text: 5 mins
      :value: 276
    :end_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0914002
      :lng: 108.2313478
    :start_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0846925
      :lng: 108.2371246
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 184
      :duration:
        :text: 1 min
        :value: 22
      :end_location:
        :lat: 16.0858349
        :lng: 108.2358736
      :html_instructions: Head <b>northwest</b> on <b>Trần Thánh Tông</b> toward <b>Lý
        Đạo Thành</b>
      :polyline:
        :points: ipdaB_assSiApASR_@b@eBnB
      :start_location:
        :lat: 16.0846925
        :lng: 108.2371246
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 318
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0879444
        :lng: 108.2378803
      :html_instructions: Turn <b>right</b> at the 2nd cross street onto <b>Trần Nhân
        Tông</b><div style="font-size:0.9em">Pass by Cà Phê Tùng Hằng (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: mwdaBeyrsS_A{@m@k@mBmBcA_AeC{B
      :start_location:
        :lat: 16.0858349
        :lng: 108.2358736
      :travel_mode: DRIVING
    - :distance:
        :text: 0.8 km
        :value: 777
      :duration:
        :text: 2 mins
        :value: 128
      :end_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :html_instructions: Turn <b>left</b> at Dịch Vụ Giới Thiệu Nhà Đất Cát Vàng
        onto <b>Khúc Hạo</b><div style="font-size:0.9em">Pass by Cơ Sở Nhôm Kính Chí
        Đức (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: sdeaBwessSGFWPa@j@_CnCgCxC_AfA}AbBoBbCyB`CMN]`@}DnE
      :start_location:
        :lat: 16.0879444
        :lng: 108.2378803
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 197
      :duration:
        :text: 1 min
        :value: 80
      :end_location:
        :lat: 16.0914002
        :lng: 108.2313478
      :html_instructions: Turn <b>left</b> at Trung tâm tập gym<div style="font-size:0.9em">Pass
        by the pharmacy (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: obfaBsdrsShAhA`A|@z@v@@?PNj@d@
      :start_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0892493
        :lng: 108.2364234
      :step_index: 2
      :step_interpolation: 0.2741169633062654
  :overview_polyline:
    :points: ipdaB_assScFxFmBgBqDmDeC{BGFWPa@j@gGhH}CjDuGvH}DnEhAhA|BtB~@t@
  :summary: Khúc Hạo
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:57.212944', '2017-05-03 02:07:57.212944');
INSERT INTO distances VALUES (390, 142, 143, 427, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0941311
      :lng: 108.2325758
    :southwest:
      :lat: 16.0914002
      :lng: 108.2310058
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 427
    :duration:
      :text: 1 min
      :value: 79
    :end_address: 296 Khúc Hạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0941311
      :lng: 108.2310058
    :start_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0914002
      :lng: 108.2313478
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 197
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :html_instructions: Head <b>northeast</b> toward <b>Nại Hiên Đông 9</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Dương Thiên Phú (on the left)</div>
      :polyline:
        :points: gzeaB}|qsSk@e@QOA?{@w@aA}@iAiA
      :start_location:
        :lat: 16.0914002
        :lng: 108.2313478
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 230
      :duration:
        :text: 1 min
        :value: 41
      :end_location:
        :lat: 16.0941311
        :lng: 108.2310058
      :html_instructions: Turn <b>left</b> at Trung tâm tập gym onto <b>Khúc Hạo</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Vlxd Châu Trinh (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: obfaBsdrsS{CnDeAhASXc@d@
      :start_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gzeaB}|qsS{BmBkCgCaFxFw@~@
  :summary: Khúc Hạo
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0941311
      :lng: 108.231615
    :southwest:
      :lat: 16.0914002
      :lng: 108.2303485
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 429
    :duration:
      :text: 1 min
      :value: 86
    :end_address: 296 Khúc Hạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0941311
      :lng: 108.2310058
    :start_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0914002
      :lng: 108.2313478
    :steps:
    - :distance:
        :text: 45 m
        :value: 45
      :duration:
        :text: 1 min
        :value: 7
      :end_location:
        :lat: 16.0917087
        :lng: 108.231615
      :html_instructions: Head <b>northeast</b> toward <b>Nại Hiên Đông 9</b>
      :polyline:
        :points: gzeaB}|qsSk@e@QO
      :start_location:
        :lat: 16.0914002
        :lng: 108.2313478
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 183
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0928221
        :lng: 108.2303485
      :html_instructions: Turn <b>left</b> onto <b>Nại Hiên Đông 9</b>
      :maneuver: turn-left
      :polyline:
        :points: e|eaBs~qsSaAjAsA`BgAnA
      :start_location:
        :lat: 16.0917087
        :lng: 108.231615
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 154
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0938455
        :lng: 108.231326
      :html_instructions: Turn <b>right</b> toward <b>Khúc Hạo</b>
      :maneuver: turn-right
      :polyline:
        :points: ccfaBuvqsSmEcE
      :start_location:
        :lat: 16.0928221
        :lng: 108.2303485
      :travel_mode: DRIVING
    - :distance:
        :text: 47 m
        :value: 47
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.0941311
        :lng: 108.2310058
      :html_instructions: Turn <b>left</b> at Quán Ăn Chiều Nhớ onto <b>Khúc Hạo</b><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: qifaBy|qsSSXc@d@
      :start_location:
        :lat: 16.0938455
        :lng: 108.231326
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0926418
        :lng: 108.2305473
      :step_index: 1
      :step_interpolation: 0.840763259267147
  :overview_polyline:
    :points: gzeaB}|qsS}@u@uClDgAnAmEcEw@~@
  :summary: Nại Hiên Đông 9
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:57.588712', '2017-05-03 02:07:57.588712');
INSERT INTO distances VALUES (391, 143, 144, 344, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0961496
      :lng: 108.2310058
    :southwest:
      :lat: 16.0941311
      :lng: 108.2290064
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 344
    :duration:
      :text: 1 min
      :value: 70
    :end_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0961496
      :lng: 108.229422
    :start_address: 296 Khúc Hạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0941311
      :lng: 108.2310058
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 295
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :html_instructions: Head <b>northwest</b> on <b>Khúc Hạo</b> toward <b>Lê Cảnh
        Tuân</b><div style="font-size:0.9em">Pass by Đại Lý Nệm Lan Khoa (on the left)</div>
      :polyline:
        :points: ikfaByzqsSa@f@{@~@w@`AwEdF
      :start_location:
        :lat: 16.0941311
        :lng: 108.2310058
      :travel_mode: DRIVING
    - :distance:
        :text: 49 m
        :value: 49
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0961496
        :lng: 108.229422
      :html_instructions: Turn <b>right</b> onto <b>Lý Nhật Quang</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: wvfaBinqsSe@qA
      :start_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ikfaByzqsS}AfBw@`AwEdFe@qA
  :summary: Khúc Hạo
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:57.860727', '2017-05-03 02:07:57.860727');
INSERT INTO distances VALUES (473, 27, 146, 642, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0870588
      :lng: 108.2204922
    :southwest:
      :lat: 16.0855067
      :lng: 108.2164149
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 642
    :duration:
      :text: 2 mins
      :value: 112
    :end_address: 140 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0870034
      :lng: 108.2164149
    :start_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.086579
      :lng: 108.2204171
    :steps:
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Head <b>north</b> on <b>Đinh Công Tráng</b> toward <b>Xuân
        Diệu</b>
      :polyline:
        :points: c|daBsxosSC?ICWIK?O@C@C@CBABADCLABALEZ
      :start_location:
        :lat: 16.086579
        :lng: 108.2204171
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 183
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Xuân Diệu</b><div style="font-size:0.9em">Pass by Xuân
        Diệu SeaView House (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: c_eaBqvosSb@Dv@N^HzA\|Al@
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 374
      :duration:
        :text: 1 min
        :value: 57
      :end_location:
        :lat: 16.0870034
        :lng: 108.2164149
      :html_instructions: Turn <b>right</b> at Cà Phê 82 onto <b>3 Tháng 2</b><div
        style="font-size:0.9em">Pass by Công Ty Cp Giám Định &amp; Khử Trùng Fcc -
        Cn Đà Nẵng (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: mudaBesosSw@|Bg@xAO`@gCdG[`ACJQd@
      :start_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: c|daBsxosSq@MSBGDIZGh@zATzBf@|Al@w@|Bw@zBgCdG[`AUp@
  :summary: Xuân Diệu and 3 Tháng 2
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0874978
      :lng: 108.2204922
    :southwest:
      :lat: 16.0864373
      :lng: 108.2164149
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 611
    :duration:
      :text: 2 mins
      :value: 142
    :end_address: 140 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0870034
      :lng: 108.2164149
    :start_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.086579
      :lng: 108.2204171
    :steps:
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Head <b>north</b> on <b>Đinh Công Tráng</b> toward <b>Xuân
        Diệu</b>
      :polyline:
        :points: c|daBsxosSC?ICWIK?O@C@C@CBABADCLABALEZ
      :start_location:
        :lat: 16.086579
        :lng: 108.2204171
      :travel_mode: DRIVING
    - :distance:
        :text: 71 m
        :value: 71
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0864373
        :lng: 108.2199348
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Xuân Diệu</b>
      :maneuver: turn-left
      :polyline:
        :points: c_eaBqvosSb@Dv@N^H
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 387
      :duration:
        :text: 1 min
        :value: 76
      :end_location:
        :lat: 16.0867453
        :lng: 108.2169916
      :html_instructions: Turn <b>right</b> at Công Ty Cp Giáo Dục - Tư Vấn Du Học
        Sao Sáng Á Châu onto <b>Nguyễn Hữu Cảnh</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Thương Mại Dịch Vụ Bách An Nam (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: g{daBquosSsBlFwApDEPAN?@BRBNDHFLLJpB~@
      :start_location:
        :lat: 16.0864373
        :lng: 108.2199348
      :travel_mode: DRIVING
    - :distance:
        :text: 68 m
        :value: 68
      :duration:
        :text: 1 min
        :value: 32
      :end_location:
        :lat: 16.0870034
        :lng: 108.2164149
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Tm - Dv Thiên Phú onto
        <b>3 Tháng 2</b><div style="font-size:0.9em">Pass by Quán Cà Phê Đinh Khang
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-right
      :polyline:
        :points: e}daBecosS[`ACJQd@
      :start_location:
        :lat: 16.0867453
        :lng: 108.2169916
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0872809
        :lng: 108.2182158
      :step_index: 2
      :step_interpolation: 0.5328929305851049
  :overview_polyline:
    :points: c|daBsxosSq@MSBGDIZGh@zAT^HsBlF}AbEAPFb@LV~BjAq@rB
  :summary: Nguyễn Hữu Cảnh
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0877787
      :lng: 108.2204922
    :southwest:
      :lat: 16.086579
      :lng: 108.2164149
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 577
    :duration:
      :text: 2 mins
      :value: 146
    :end_address: 140 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0870034
      :lng: 108.2164149
    :start_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.086579
      :lng: 108.2204171
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 228
      :duration:
        :text: 1 min
        :value: 48
      :end_location:
        :lat: 16.0877787
        :lng: 108.2191004
      :html_instructions: Head <b>north</b> on <b>Đinh Công Tráng</b> toward <b>Xuân
        Diệu</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Thiết Kế Cải
        Tạo Ô Tô Miền Trung (on the right)</div>
      :polyline:
        :points: c|daBsxosSC?ICWIK?O@C@C@CBABADCLABALEZKj@G\Gb@ADAD?@CBEFOHuAr@
      :start_location:
        :lat: 16.086579
        :lng: 108.2204171
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 221
      :duration:
        :text: 1 min
        :value: 51
      :end_location:
        :lat: 16.0876967
        :lng: 108.2170327
      :html_instructions: Turn <b>left</b> at Công ty Danang Engineering onto <b>Nguyễn
        Văn Thủ</b><div style="font-size:0.9em">Pass by Dntn Sa Sinh (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: sceaBkposSLxG@bC
      :start_location:
        :lat: 16.0877787
        :lng: 108.2191004
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 99
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0868854
        :lng: 108.2166552
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Thương Mại Dịch Vụ
        Nam Phú - Cn Đà Nẵng onto <b>Phạm Ngọc Thạch</b><div style="font-size:0.9em">Pass
        by Công Ty Cp Tổ Ong (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: cceaBmcosS\Jj@Rv@ZZJB@
      :start_location:
        :lat: 16.0876967
        :lng: 108.2170327
      :travel_mode: DRIVING
    - :distance:
        :text: 29 m
        :value: 29
      :duration:
        :text: 1 min
        :value: 7
      :end_location:
        :lat: 16.0870034
        :lng: 108.2164149
      :html_instructions: Turn <b>right</b> at Quán Cà Phê Đinh Khang onto <b>3 Tháng
        2</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: a~daBcaosSCJQd@
      :start_location:
        :lat: 16.0868854
        :lng: 108.2166552
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0877439
        :lng: 108.2183939
      :step_index: 1
      :step_interpolation: 0.3418049100334164
  :overview_polyline:
    :points: c|daBsxosSq@MSBGDIZ[rBKp@IJeB|@N|KhA^rAf@B@CJQd@
  :summary: Đinh Công Tráng and Nguyễn Văn Thủ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:39.583802', '2017-05-03 02:16:39.583802');
INSERT INTO distances VALUES (474, 146, 147, 379, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0878277
      :lng: 108.2164149
    :southwest:
      :lat: 16.0861561
      :lng: 108.2144216
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 379
    :duration:
      :text: 1 min
      :value: 43
    :end_address: 33 Nguyễn Tất Thành, Thanh Bình, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0861561
      :lng: 108.2144216
    :start_address: 140 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0870034
      :lng: 108.2164149
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 129
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0876069
        :lng: 108.2153793
      :html_instructions: Head <b>northwest</b> on <b>3 Tháng 2</b> toward <b>Xuân
        Tâm</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Tùng Lộc (on
        the right)</div>
      :polyline:
        :points: w~daBq_osSQ`@g@bA_AfB
      :start_location:
        :lat: 16.0870034
        :lng: 108.2164149
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 250
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0861561
        :lng: 108.2144216
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Nguyễn
        Tất Thành</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: qbeaBcynsSE?C?C@C?C@A@C@ABC@ABABA@?BA@?BAB?B?@?B@B?B@B@B@B@B@@BBDBB@B@B?B@@?B?B?BAB?BABCj@HNDLDlA^tBx@
      :start_location:
        :lat: 16.0876069
        :lng: 108.2153793
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: w~daBq_osSy@dB_AfBE?G@G@KHELCL@LFNNJLBNAFEz@NzAd@tBx@
  :summary: 3 Tháng 2 and Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:39.928021', '2017-05-03 02:16:39.928021');
INSERT INTO distances VALUES (392, 144, 94, 178, 16, '---
- :bounds:
    :northeast:
      :lat: 16.0968973
      :lng: 108.2308965
    :southwest:
      :lat: 16.0961496
      :lng: 108.229422
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 178
    :duration:
      :text: 1 min
      :value: 27
    :end_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0968973
      :lng: 108.2308965
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0961496
      :lng: 108.229422
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 178
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0968973
        :lng: 108.2308965
      :html_instructions: Head <b>northeast</b> on <b>Lý Nhật Quang</b> toward <b>Nguyễn
        Khắc Cần</b><div style="font-size:0.9em">Pass by Dịch Vụ Nấu Ăn Long Vỹ (on
        the left)</div><div style="font-size:0.9em">Destination will be on the left</div>
      :polyline:
        :points: "}wfaB{pqsSQg@{@wBgAgC"
      :start_location:
        :lat: 16.0961496
        :lng: 108.229422
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}wfaB{pqsSuCgH"
  :summary: Lý Nhật Quang
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:07:58.141735', '2017-05-03 02:07:58.141735');
INSERT INTO distances VALUES (475, 147, 148, 711, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0861561
      :lng: 108.2144216
    :southwest:
      :lat: 16.080636
      :lng: 108.2111492
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 711
    :duration:
      :text: 1 min
      :value: 62
    :end_address: Nguyễn Tất Thành, Thanh Bình, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.080636
      :lng: 108.2111492
    :start_address: 33 Nguyễn Tất Thành, Thanh Bình, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0861561
      :lng: 108.2144216
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 711
      :duration:
        :text: 1 min
        :value: 62
      :end_location:
        :lat: 16.080636
        :lng: 108.2111492
      :html_instructions: Head <b>southwest</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Ông Ích Khiêm</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Tm -
        Dv Hợp Lợi Phát - Cn (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: oydaBcsnsSPFjBr@vBx@\LfDlAzAh@`@Nt@X~@`@z@d@bAn@z@p@XT`E~CFF
      :start_location:
        :lat: 16.0861561
        :lng: 108.2144216
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: oydaBcsnsSrGbCzI`DzBfA~B`BbF|D
  :summary: Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:40.217092', '2017-05-03 02:16:40.217092');
INSERT INTO distances VALUES (476, 148, 149, 239, 17, '---
- :bounds:
    :northeast:
      :lat: 16.080636
      :lng: 108.2117926
    :southwest:
      :lat: 16.0788599
      :lng: 108.2109481
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 239
    :duration:
      :text: 1 min
      :value: 70
    :end_address: 11-15 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0788599
      :lng: 108.2117926
    :start_address: Nguyễn Tất Thành, Thanh Bình, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.080636
      :lng: 108.2111492
    :steps:
    - :distance:
        :text: 34 m
        :value: 34
      :duration:
        :text: 1 min
        :value: 3
      :end_location:
        :lat: 16.0804041
        :lng: 108.2109481
      :html_instructions: Head <b>southwest</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Ông Ích Khiêm</b>
      :polyline:
        :points: _wcaBu~msSn@f@
      :start_location:
        :lat: 16.080636
        :lng: 108.2111492
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 205
      :duration:
        :text: 1 min
        :value: 67
      :end_location:
        :lat: 16.0788599
        :lng: 108.2117926
      :html_instructions: Turn <b>left</b> onto <b>Ông Ích Khiêm</b><div style="font-size:0.9em">Pass
        by Dịch Vụ Du Lịch Đình Luyện (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: oucaBm}msSNSr@{@j@o@d@Oj@E@?`AOd@AF?
      :start_location:
        :lat: 16.0804041
        :lng: 108.2109481
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _wcaBu~msSn@f@NS~AkBd@Oj@EbAOl@A
  :summary: Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:40.467264', '2017-05-03 02:16:40.467264');
INSERT INTO distances VALUES (477, 149, 150, 104, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0788599
      :lng: 108.2119629
    :southwest:
      :lat: 16.0779403
      :lng: 108.2117926
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.1 km
      :value: 104
    :duration:
      :text: 1 min
      :value: 19
    :end_address: 24 Ông Ích Khiêm, Thanh Bình, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0779403
      :lng: 108.2119629
    :start_address: 11-15 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0788599
      :lng: 108.2117926
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 104
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0779403
        :lng: 108.2119629
      :html_instructions: Head <b>south</b> on <b>Ông Ích Khiêm</b> toward <b>Thanh
        Sơn</b><div style="font-size:0.9em">Pass by Cà Phê 15 (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: "{kcaBubnsSfAKTExAO"
      :start_location:
        :lat: 16.0788599
        :lng: 108.2117926
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{kcaBubnsSvDa@"
  :summary: Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:40.803365', '2017-05-03 02:16:40.803365');
INSERT INTO distances VALUES (478, 150, 151, 331, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0779403
      :lng: 108.2125585
    :southwest:
      :lat: 16.0750236
      :lng: 108.2119629
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 331
    :duration:
      :text: 1 min
      :value: 61
    :end_address: 105-107 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0750236
      :lng: 108.2125585
    :start_address: 24 Ông Ích Khiêm, Thanh Bình, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0779403
      :lng: 108.2119629
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 331
      :duration:
        :text: 1 min
        :value: 61
      :end_location:
        :lat: 16.0750236
        :lng: 108.2125585
      :html_instructions: Head <b>south</b> on <b>Ông Ích Khiêm</b> toward <b>Cao
        Thắng</b><div style="font-size:0.9em">Pass by Tiệm Internet Thùy Trang (on
        the right)</div>
      :polyline:
        :points: cfcaBwcnsS~@KXEf@Ej@IF?r@I\IlAONA|AOtAUl@I
      :start_location:
        :lat: 16.0779403
        :lng: 108.2119629
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: cfcaBwcnsSlDa@z@IjBYlBQbC_@
  :summary: Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:41.184082', '2017-05-03 02:16:41.184082');
INSERT INTO distances VALUES (479, 151, 152, 259, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0750236
      :lng: 108.213012
    :southwest:
      :lat: 16.0727394
      :lng: 108.2125585
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 259
    :duration:
      :text: 1 min
      :value: 65
    :end_address: 160 Ông Ích Khiêm, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0727394
      :lng: 108.213012
    :start_address: 105-107 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0750236
      :lng: 108.2125585
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 259
      :duration:
        :text: 1 min
        :value: 65
      :end_location:
        :lat: 16.0727394
        :lng: 108.213012
      :html_instructions: Head <b>south</b> on <b>Ông Ích Khiêm</b> toward <b>K49
        Ông Ích Khiêm</b><div style="font-size:0.9em">Pass by Bánh Canh Cá Lóc, Chả
        Cua - Bé Huế (on the left)</div>
      :polyline:
        :points: "{sbaBognsSf@GjC]zC[vBW"
      :start_location:
        :lat: 16.0750236
        :lng: 108.2125585
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{sbaBognsSrDe@rGs@"
  :summary: Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:41.550623', '2017-05-03 02:16:41.550623');
INSERT INTO distances VALUES (480, 152, 153, 294, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0727394
      :lng: 108.2130771
    :southwest:
      :lat: 16.0712967
      :lng: 108.2112326
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 294
    :duration:
      :text: 1 min
      :value: 58
    :end_address: 196 Hải Phòng, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0712967
      :lng: 108.2112326
    :start_address: 160 Ông Ích Khiêm, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0727394
      :lng: 108.213012
    :steps:
    - :distance:
        :text: 61 m
        :value: 61
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0721944
        :lng: 108.2130771
      :html_instructions: Head <b>south</b> on <b>Ông Ích Khiêm</b> toward <b>Đống
        Đa</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa Mỹ Vân Nhi (on
        the right)</div>
      :polyline:
        :points: sebaBijnsSx@K\?TA
      :start_location:
        :lat: 16.0727394
        :lng: 108.213012
      :travel_mode: DRIVING
    - :distance:
        :text: 82 m
        :value: 82
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0716165
        :lng: 108.2126046
      :html_instructions: Turn <b>right</b> at Bánh Kem Ngon Đẹp Đà Nẵng toward <b>Hải
        Phòng</b><div style="font-size:0.9em">Pass by Quán Cafe Trung Nam (on the
        left)</div>
      :maneuver: turn-right
      :polyline:
        :points: ebbaBwjnsSpB~A
      :start_location:
        :lat: 16.0721944
        :lng: 108.2130771
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 151
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0712967
        :lng: 108.2112326
      :html_instructions: Turn <b>right</b> at Quán Ốc Tí onto <b>Hải Phòng</b><div
        style="font-size:0.9em">Pass by Chụp ảnh thẻ Đà Nẵng (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: s~aaBwgnsSf@hDVfB
      :start_location:
        :lat: 16.0716165
        :lng: 108.2126046
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: sebaBijnsSx@K\?TApB~A~@pG
  :summary: Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:41.904798', '2017-05-03 02:16:41.904798');
INSERT INTO distances VALUES (481, 153, 154, 271, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0712967
      :lng: 108.2112326
    :southwest:
      :lat: 16.0707845
      :lng: 108.2087565
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 271
    :duration:
      :text: 1 min
      :value: 49
    :end_address: 202 Hải Phòng, Tam Thuận, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0707845
      :lng: 108.2087565
    :start_address: 196 Hải Phòng, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0712967
      :lng: 108.2112326
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 271
      :duration:
        :text: 1 min
        :value: 49
      :end_location:
        :lat: 16.0707845
        :lng: 108.2087565
      :html_instructions: Head <b>west</b> on <b>Hải Phòng</b> toward <b>K253 Hải
        Phòng</b><div style="font-size:0.9em">Pass by Cà Phê 235 (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: s|aaBe_nsS\hCDRVrCHl@Fv@TdABN
      :start_location:
        :lat: 16.0712967
        :lng: 108.2112326
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: s|aaBe_nsSb@|C`@`EFv@TdABN
  :summary: Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:42.251846', '2017-05-03 02:16:42.251846');
INSERT INTO distances VALUES (482, 154, 155, 591, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0707784
      :lng: 108.2087308
    :southwest:
      :lat: 16.0678488
      :lng: 108.2049358
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 591
    :duration:
      :text: 2 mins
      :value: 90
    :end_address: 441 Hải Phòng, Chính Gián, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0678488
      :lng: 108.2049843
    :start_address: 202 Hải Phòng, Tam Thuận, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0707784
      :lng: 108.2087308
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 591
      :duration:
        :text: 2 mins
        :value: 90
      :end_location:
        :lat: 16.0678488
        :lng: 108.2049843
      :html_instructions: Head <b>west</b> on <b>Hải Phòng</b> toward <b>K309 Hải
        Phòng</b><div style="font-size:0.9em">Pass by Quán Phở Hoa (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: kyaaBqomsSFl@DZBVBLDb@P~A@JJ~ANt@Nh@\x@\j@LTNPNPz@v@r@b@FB`@VFBHFRFTBNBP@R?j@?VAVCZA
      :start_location:
        :lat: 16.0707784
        :lng: 108.2087308
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kyaaBqomsSTnBVbCLjB^~A\x@\j@\f@jAhAdBbA\Nd@Fd@@bAAr@E
  :summary: Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:42.531444', '2017-05-03 02:16:42.531444');
INSERT INTO distances VALUES (71, 27, 28, 425, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0870588
      :lng: 108.2207002
    :southwest:
      :lat: 16.0847991
      :lng: 108.2195007
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 425
    :duration:
      :text: 1 min
      :value: 80
    :end_address: 32 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0847991
      :lng: 108.2207002
    :start_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.086579
      :lng: 108.2204171
    :steps:
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Head <b>north</b> on <b>Đinh Công Tráng</b> toward <b>Xuân
        Diệu</b>
      :polyline:
        :points: c|daBsxosSC?ICWIK?O@C@C@CBABADCLABALEZ
      :start_location:
        :lat: 16.086579
        :lng: 108.2204171
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 183
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Xuân Diệu</b><div style="font-size:0.9em">Pass by Xuân
        Diệu SeaView House (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: c_eaBqvosSb@Dv@N^HzA\|Al@
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 157
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0847991
        :lng: 108.2207002
      :html_instructions: Turn <b>left</b> at Cà Phê 82 onto <b>3 Tháng 2</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa 61 (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mudaBesosSTHFS|@{BPc@L]P]
      :start_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: c|daBsxosSq@MSBGDIZGh@zATzBf@rBv@dBqEP]
  :summary: Xuân Diệu and 3 Tháng 2
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:52.458817', '2017-05-03 01:33:52.458817');
INSERT INTO distances VALUES (72, 28, 29, 511, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0847991
      :lng: 108.2228525
    :southwest:
      :lat: 16.0810591
      :lng: 108.2207002
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 511
    :duration:
      :text: 1 min
      :value: 70
    :end_address: 1 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0810591
      :lng: 108.2228525
    :start_address: 32 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0847991
      :lng: 108.2207002
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 278
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0828511
        :lng: 108.2222907
      :html_instructions: Head <b>southeast</b> on <b>3 Tháng 2</b> toward <b>Châu
        Văn Liêm</b><div style="font-size:0.9em">Pass by Công Ty Cp Vận Tải Pst Đà
        Nẵng (on the left)</div>
      :polyline:
        :points: _qdaBkzosS@AR[PS\]LMJI\Uf@]TOFGJMBCr@e@lAw@PKJEPG
      :start_location:
        :lat: 16.0847991
        :lng: 108.2207002
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 233
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0810591
        :lng: 108.2228525
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Trần
        Phú</b><div style="font-size:0.9em">Pass by Ngân hàng Public Việt Nam, (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: yddaBidpsSB@@@@@@@@@@?B@@?@?B@@?@?@?@A@?B?@ADC@?@A@A@A@C?A@A@A?C?A@C?A?C?AAA?CAADMBEBCHIHGLCPCZAbBI`AId@C
      :start_location:
        :lat: 16.0828511
        :lng: 108.2222907
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _qdaBkzosST]n@q@XWdAs@\WNQ`C}A\QPGB@BBHDP?LEFIDUCIHSLMVKl@EjEW
  :summary: 3 Tháng 2 and Trần Phú
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:52.696803', '2017-05-03 01:33:52.696803');
INSERT INTO distances VALUES (483, 155, 156, 255, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0678488
      :lng: 108.2055456
    :southwest:
      :lat: 16.065984
      :lng: 108.2049843
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 255
    :duration:
      :text: 1 min
      :value: 54
    :end_address: 26 Điện Biên Phủ, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0660524
      :lng: 108.2055456
    :start_address: 441 Hải Phòng, Chính Gián, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0678488
      :lng: 108.2049843
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 197
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0660826
        :lng: 108.2051051
      :html_instructions: Head <b>south</b> on <b>Hải Phòng</b> toward <b>Điện Biên
        Phủ</b><div style="font-size:0.9em">Pass by Bún Thịt Nướng Quán Xuân (on
        the left)</div>
      :polyline:
        :points: agaaBcxlsSlCMNAbEI
      :start_location:
        :lat: 16.0678488
        :lng: 108.2049843
      :travel_mode: DRIVING
    - :distance:
        :text: 58 m
        :value: 58
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0660524
        :lng: 108.2055456
      :html_instructions: Turn <b>left</b> at Eximbank - Atm onto <b>Điện Biên Phủ</b><div
        style="font-size:0.9em">Pass by Trung Tâm Kinh Doanh Và Sữa Chữa Thiết Bị
        Công Nghệ ilap (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: _|`aB}xlsSR?C]Iq@?G
      :start_location:
        :lat: 16.0660826
        :lng: 108.2051051
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: agaaBcxlsS|COvEIMwA
  :summary: Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:42.78948', '2017-05-03 02:16:42.78948');
INSERT INTO distances VALUES (73, 29, 30, 582, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0810591
      :lng: 108.2235447
    :southwest:
      :lat: 16.0758703
      :lng: 108.2228525
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 582
    :duration:
      :text: 2 mins
      :value: 96
    :end_address: 29 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0758703
      :lng: 108.2235447
    :start_address: 1 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0810591
      :lng: 108.2228525
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 582
      :duration:
        :text: 2 mins
        :value: 96
      :end_location:
        :lat: 16.0758703
        :lng: 108.2235447
      :html_instructions: Head <b>south</b> on <b>Trần Phú</b> toward <b>Lý Thường
        Kiệt</b><div style="font-size:0.9em">Pass by Công Ty Sản Xuất, Cung Cấp Quà
        Tặng Tinh Tế Việt (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: sycaBygpsSrBKjCK~CWPAlF]bBOjC[|BM
      :start_location:
        :lat: 16.0810591
        :lng: 108.2228525
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: sycaBygpsS~FWpDYpIm@jC[|BM
  :summary: Trần Phú
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:52.936291', '2017-05-03 01:33:52.936291');
INSERT INTO distances VALUES (74, 30, 31, 183, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0758703
      :lng: 108.223589
    :southwest:
      :lat: 16.0752294
      :lng: 108.2222818
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 183
    :duration:
      :text: 1 min
      :value: 34
    :end_address: 25 Quang Trung, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0752294
      :lng: 108.2222818
    :start_address: 29 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0758703
      :lng: 108.2235447
    :steps:
    - :distance:
        :text: 40 m
        :value: 40
      :duration:
        :text: 1 min
        :value: 7
      :end_location:
        :lat: 16.0755131
        :lng: 108.223589
      :html_instructions: Head <b>south</b> on <b>Trần Phú</b> toward <b>Quang Trung</b>
      :polyline:
        :points: eybaBclpsSfAI
      :start_location:
        :lat: 16.0758703
        :lng: 108.2235447
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 143
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0752294
        :lng: 108.2222818
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Một Thành Viên Authentica
        Habita onto <b>Quang Trung</b><div style="font-size:0.9em">Pass by Vy Gia
        Coffee (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: "}vbaBmlpsSn@xEFj@"
      :start_location:
        :lat: 16.0755131
        :lng: 108.223589
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: eybaBclpsSfAIn@xEFj@
  :summary: Quang Trung
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:53.224103', '2017-05-03 01:33:53.224103');
INSERT INTO distances VALUES (75, 31, 32, 685, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0752294
      :lng: 108.2222818
    :southwest:
      :lat: 16.0739758
      :lng: 108.2160048
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 685
    :duration:
      :text: 2 mins
      :value: 147
    :end_address: 130 Quang Trung, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0739758
      :lng: 108.2160048
    :start_address: 25 Quang Trung, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0752294
      :lng: 108.2222818
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 685
      :duration:
        :text: 2 mins
        :value: 147
      :end_location:
        :lat: 16.0739758
        :lng: 108.2160048
      :html_instructions: Head <b>west</b> on <b>Quang Trung</b> toward <b>Nguyễn
        Chí Thanh</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Thương Mại
        Dịch Vụ Giải Trí Công Nghệ Cao Hoàng Hải (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: eubaBgdpsSJfAJ~@LhAVhB^pC^|D`@|DVvBBJHb@Fn@PdAFb@PzA
      :start_location:
        :lat: 16.0752294
        :lng: 108.2222818
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: eubaBgdpsSVfCd@rD^pC^|Dx@tHf@dDX~B
  :summary: Quang Trung
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:53.550275', '2017-05-03 01:33:53.550275');
INSERT INTO distances VALUES (76, 32, 33, 415, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0739758
      :lng: 108.2160048
    :southwest:
      :lat: 16.0732105
      :lng: 108.2122049
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 415
    :duration:
      :text: 2 mins
      :value: 123
    :end_address: 1-3 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0732105
      :lng: 108.2122049
    :start_address: 130 Quang Trung, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0739758
      :lng: 108.2160048
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 341
      :duration:
        :text: 2 mins
        :value: 104
      :end_location:
        :lat: 16.0733364
        :lng: 108.2128887
      :html_instructions: Head <b>west</b> on <b>Quang Trung</b> toward <b>K136 Hải
        Phòng</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa 140 (on the
        right)</div>
      :polyline:
        :points: kmbaB_}nsS@F~@dHRnBNjABb@T~A
      :start_location:
        :lat: 16.0739758
        :lng: 108.2160048
      :travel_mode: DRIVING
    - :distance:
        :text: 74 m
        :value: 74
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0732105
        :lng: 108.2122049
      :html_instructions: At Viettel Store, continue onto <b>Trần Cao Vân</b><div
        style="font-size:0.9em">Pass by Shop Giày Dép 06 (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: kibaBqinsSV`C@F
      :start_location:
        :lat: 16.0733364
        :lng: 108.2128887
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kmbaB_}nsS`AlHb@zDXbCXhC
  :summary: Quang Trung
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:53.849512', '2017-05-03 01:33:53.849512');
INSERT INTO distances VALUES (197, 26, 27, 513, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0870588
      :lng: 108.2214096
    :southwest:
      :lat: 16.0842834
      :lng: 108.2195475
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 513
    :duration:
      :text: 1 min
      :value: 81
    :end_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.086579
      :lng: 108.2204171
    :start_address: 22 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0842834
      :lng: 108.2214096
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 245
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :html_instructions: Head <b>northwest</b> on <b>3 Tháng 2</b> toward <b>Đức
        Lợi 2</b><div style="font-size:0.9em">Pass by TheSinhTourist Da Nang (on the
        right)</div>
      :polyline:
        :points: wmdaBy~osSYT[X]VKNU^A@Uf@Sh@Qb@o@`BQ`@
      :start_location:
        :lat: 16.0842834
        :lng: 108.2214096
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 183
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Turn <b>right</b> at Cà Phê 82 onto <b>Xuân Diệu</b><div
        style="font-size:0.9em">Pass by Cafe Monza (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: mudaBesosS}Am@{A]_@Iw@Oc@E
      :start_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.086579
        :lng: 108.2204171
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Đinh Công Tráng</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: c_eaBqvosSD[@M@CBM@E@CBCBABANAJ?VHHBB?
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wmdaBy~osS_BvAW`@i@pAaAdCQ`@}Am@{Bg@{AUL{@JORCb@HLB
  :summary: 3 Tháng 2 and Xuân Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:19.196635', '2017-05-03 01:43:19.196635');
INSERT INTO distances VALUES (77, 33, 34, 459, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0732105
      :lng: 108.2122049
    :southwest:
      :lat: 16.0723551
      :lng: 108.2080046
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 459
    :duration:
      :text: 1 min
      :value: 71
    :end_address: 77-81 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0723551
      :lng: 108.2080046
    :start_address: 1-3 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0732105
      :lng: 108.2122049
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 459
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0723551
        :lng: 108.2080046
      :html_instructions: Head <b>west</b> on <b>Trần Cao Vân</b> toward <b>Kiệt 74
        Trần Cao Vân</b><div style="font-size:0.9em">Pass by Cơ Sở Nhôm Kính Tân Bình
        (on the left)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: qhbaBgensSZnCXvBHt@@BPrANlAFn@d@hDVvB?L?B
      :start_location:
        :lat: 16.0732105
        :lng: 108.2122049
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qhbaBgensS`A`I`@`Dl@xEVhC
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:54.07854', '2017-05-03 01:33:54.07854');
INSERT INTO distances VALUES (78, 34, 35, 635, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0723551
      :lng: 108.2080046
    :southwest:
      :lat: 16.0711799
      :lng: 108.2021941
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 635
    :duration:
      :text: 2 mins
      :value: 104
    :end_address: 324 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0711799
      :lng: 108.2021941
    :start_address: 77-81 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0723551
      :lng: 108.2080046
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 635
      :duration:
        :text: 2 mins
        :value: 104
      :end_location:
        :lat: 16.0711799
        :lng: 108.2021941
      :html_instructions: Head <b>west</b> on <b>Trần Cao Vân</b> toward <b>Kiệt 196
        Trần Cao Vân</b><div style="font-size:0.9em">Pass by Phòng Khám Đông Y Lê
        Hiếu (on the left)</div><div style="font-size:0.9em">Destination will be on
        the right</div>
      :polyline:
        :points: gcbaB_kmsS\tCNrAVrBTnBJt@PfA@H@FBRFd@Bb@DTDXFf@?DHh@Db@Ff@BN@PHd@@JD\BLBV?@D`@DXD`@?@
      :start_location:
        :lat: 16.0723551
        :lng: 108.2080046
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gcbaB_kmsSzAlM`@nCN|AR|An@fFXfC
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:54.342584', '2017-05-03 01:33:54.342584');
INSERT INTO distances VALUES (79, 35, 36, 958, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0712229
      :lng: 108.2021941
    :southwest:
      :lat: 16.0710791
      :lng: 108.1932415
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 958
    :duration:
      :text: 3 mins
      :value: 161
    :end_address: 606 Trần Cao Vân, Xuân Hà, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0712229
      :lng: 108.1932415
    :start_address: 324 Trần Cao Vân, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0711799
      :lng: 108.2021941
    :steps:
    - :distance:
        :text: 1.0 km
        :value: 958
      :duration:
        :text: 3 mins
        :value: 161
      :end_location:
        :lat: 16.0712229
        :lng: 108.1932415
      :html_instructions: Head <b>west</b> on <b>Trần Cao Vân</b> toward <b>Lê Độ</b>/<b>Tôn
        Thất Đạm</b><div style="font-size:0.9em">Pass by Shop Thời Trang Hồng Hạnh
        (on the right)</div>
      :polyline:
        :points: "{{aaBuflsSFl@@RBZ@j@@h@@pA@vAApBApA?`@CtA?h@A~ACrCAxCCvA?j@AtACfC@l@AnA?p@?rAAn@AT"
      :start_location:
        :lat: 16.0711799
        :lng: 108.2021941
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{{aaBuflsSH`ADfABzB?hEErFKdNCvHCdGAT"
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:54.548219', '2017-05-03 01:33:54.548219');
INSERT INTO distances VALUES (80, 36, 37, 614, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0714948
      :lng: 108.1932415
    :southwest:
      :lat: 16.0712229
      :lng: 108.1875119
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 614
    :duration:
      :text: 2 mins
      :value: 100
    :end_address: 595 Trần Cao Vân, Thanh Khê Đông, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0714948
      :lng: 108.1875119
    :start_address: 606 Trần Cao Vân, Xuân Hà, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0712229
      :lng: 108.1932415
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 614
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0714948
        :lng: 108.1875119
      :html_instructions: Head <b>west</b> on <b>Trần Cao Vân</b> toward <b>Hà Huy
        Tập</b><div style="font-size:0.9em">Pass by Shop Mẹ &amp; Bé Bin Bo (on the
        right)</div>
      :polyline:
        :points: c|aaBwnjsSAPAlBAb@?pC?lDCxAIzBC|BAh@?l@?jAANMxAKr@
      :start_location:
        :lat: 16.0712229
        :lng: 108.1932415
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: c|aaBwnjsSEtH?lDCxAMxFCrDYlC
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:54.864738', '2017-05-03 01:33:54.864738');
INSERT INTO distances VALUES (81, 37, 38, 693, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0718082
      :lng: 108.1875119
    :southwest:
      :lat: 16.0680768
      :lng: 108.1829333
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 693
    :duration:
      :text: 2 mins
      :value: 103
    :end_address: 737 Trần Cao Vân, Thanh Khê Đông, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0680768
      :lng: 108.1829333
    :start_address: 595 Trần Cao Vân, Thanh Khê Đông, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0714948
      :lng: 108.1875119
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 693
      :duration:
        :text: 2 mins
        :value: 103
      :end_location:
        :lat: 16.0680768
        :lng: 108.1829333
      :html_instructions: Head <b>west</b> on <b>Trần Cao Vân</b> toward <b>Nguyễn
        Đức Trung</b><div style="font-size:0.9em">Pass by Cà Phê Pro (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: y}aaB}jisSGX?LEVOn@I\IXGVET?P?R@DBPJRFHHJJHNH`@T\LXJ`Bx@l@^jAdAVZhAlAbBhBt@p@t@h@d@`@Z^
      :start_location:
        :lat: 16.0714948
        :lng: 108.1875119
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: y}aaB}jisSGf@UfAa@dB?d@DVR\TTp@^v@X`Bx@l@^jAdAVZlDvDjBzA`A`A
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0715309
      :lng: 108.1875119
    :southwest:
      :lat: 16.0680768
      :lng: 108.1829333
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 760
    :duration:
      :text: 3 mins
      :value: 152
    :end_address: 737 Trần Cao Vân, Thanh Khê Đông, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0680768
      :lng: 108.1829333
    :start_address: 595 Trần Cao Vân, Thanh Khê Đông, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0714948
      :lng: 108.1875119
    :steps:
    - :distance:
        :text: 22 m
        :value: 22
      :duration:
        :text: 1 min
        :value: 4
      :end_location:
        :lat: 16.0715309
        :lng: 108.1873097
      :html_instructions: Head <b>west</b> on <b>Trần Cao Vân</b> toward <b>Nguyễn
        Đức Trung</b>
      :polyline:
        :points: y}aaB}jisSGX?L
      :start_location:
        :lat: 16.0714948
        :lng: 108.1875119
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 103
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0706327
        :lng: 108.1872936
      :html_instructions: Turn <b>left</b> at Cửa Hàng Tượng Phật Nguyễn Khương onto
        <b>Nguyễn Đức Trung</b><div style="font-size:0.9em">Pass by Cafe 05 Nguyen
        Duc Trung (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: a~aaBuiisSlATR?pAQ
      :start_location:
        :lat: 16.0715309
        :lng: 108.1873097
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 95
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0704304
        :lng: 108.1864326
      :html_instructions: Turn <b>right</b> at Quán Cafe Hoa Sữa<div style="font-size:0.9em">Pass
        by Dntn Bàu Làng (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: mxaaBqiisSf@jD
      :start_location:
        :lat: 16.0706327
        :lng: 108.1872936
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 124
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0697371
        :lng: 108.1857902
      :html_instructions: At Công Ty Tnhh Mtv Kỹ Thuật Sông Đông, continue onto <b>Bàu
        Làng</b><div style="font-size:0.9em">Pass by Trường Mầm Non Phương Thảo (on
        the right)</div>
      :polyline:
        :points: ewaaBedisSRnABH@D@@BBDDn@\D@F?NCTG
      :start_location:
        :lat: 16.0704304
        :lng: 108.1864326
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 111
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0695096
        :lng: 108.1847835
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Ngọc Linh onto <b>Kỳ Đồng</b><div
        style="font-size:0.9em">Pass by Cơ Sở Sản Xuất Nước Đá Thu An (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: "{raaBe`isSl@hE"
      :start_location:
        :lat: 16.0697371
        :lng: 108.1857902
      :travel_mode: DRIVING
    - :distance:
        :text: 39 m
        :value: 39
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0698157
        :lng: 108.1846382
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Quảng Cáo &amp; Tm Hải
        Đường - Vpđd toward <b>Trần Cao Vân</b>
      :maneuver: turn-right
      :polyline:
        :points: mqaaB{yhsSU@E@IDIDGDED
      :start_location:
        :lat: 16.0695096
        :lng: 108.1847835
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 266
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0680768
        :lng: 108.1829333
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Thương Mại Dịch Vụ Xây
        Dựng Phúc Thành Tiến onto <b>Trần Cao Vân</b><div style="font-size:0.9em">Pass
        by Nhà May T-T (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: ksaaB_yhsShAlAbBhBt@p@t@h@d@`@Z^
      :start_location:
        :lat: 16.0698157
        :lng: 108.1846382
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0696234
        :lng: 108.1852868
      :step_index: 4
      :step_interpolation: 0.5
  :overview_polyline:
    :points: y}aaB}jisSGf@lATR?pAQf@jDVxALPt@^VCTGl@hE[BSJMJlDvDjBzA`A`A
  :summary: Trần Cao Vân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:55.096898', '2017-05-03 01:33:55.096898');
INSERT INTO distances VALUES (82, 38, 39, 530, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0707564
      :lng: 108.1829333
    :southwest:
      :lat: 16.0675469
      :lng: 108.179936
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 530
    :duration:
      :text: 2 mins
      :value: 108
    :end_address: 11-23 Dũng Sĩ Thanh Khê, Thanh Khê Tây, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0707564
      :lng: 108.179936
    :start_address: 737 Trần Cao Vân, Thanh Khê Đông, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0680768
      :lng: 108.1829333
    :steps:
    - :distance:
        :text: 94 m
        :value: 94
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0675469
        :lng: 108.1822497
      :html_instructions: Head <b>southwest</b> on <b>Trần Cao Vân</b> toward <b>Thanh
        Huy 3</b>
      :polyline:
        :points: ohaaBinhsSHHf@t@v@fA
      :start_location:
        :lat: 16.0680768
        :lng: 108.1829333
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 436
      :duration:
        :text: 2 mins
        :value: 91
      :end_location:
        :lat: 16.0707564
        :lng: 108.179936
      :html_instructions: Turn <b>right</b> at Cửa Hàng Giày Dép Thể Thao onto <b>Dũng
        Sĩ Thanh Khê</b><div style="font-size:0.9em">Pass by Nhà May Đức Hà (on the
        right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: eeaaBajhsSg@\yBtAoAl@oB`A_@PmAv@_BrAqAjA
      :start_location:
        :lat: 16.0675469
        :lng: 108.1822497
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ohaaBinhsSp@~@v@fAg@\yBtAoAl@oCrAmAv@_BrAqAjA
  :summary: Dũng Sĩ Thanh Khê
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0707564
      :lng: 108.1829333
    :southwest:
      :lat: 16.0678323
      :lng: 108.179936
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 529
    :duration:
      :text: 2 mins
      :value: 130
    :end_address: 11-23 Dũng Sĩ Thanh Khê, Thanh Khê Tây, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0707564
      :lng: 108.179936
    :start_address: 737 Trần Cao Vân, Thanh Khê Đông, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0680768
      :lng: 108.1829333
    :steps:
    - :distance:
        :text: 44 m
        :value: 44
      :duration:
        :text: 1 min
        :value: 6
      :end_location:
        :lat: 16.0678323
        :lng: 108.1826144
      :html_instructions: Head <b>southwest</b> on <b>Trần Cao Vân</b> toward <b>Thanh
        Huy 3</b>
      :polyline:
        :points: ohaaBinhsSHHf@t@
      :start_location:
        :lat: 16.0680768
        :lng: 108.1829333
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 153
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.0690139
        :lng: 108.1818885
      :html_instructions: Turn <b>right</b> at Cửa Hàng Quang Nhật Computer onto <b>Thanh
        Huy 3</b><div style="font-size:0.9em">Pass by Tiệm Tóc Huyền Quỳnh (on the
        right)</div>
      :maneuver: turn-right
      :polyline:
        :points: "}faaBilhsSeBz@eCrA"
      :start_location:
        :lat: 16.0678323
        :lng: 108.1826144
      :travel_mode: DRIVING
    - :distance:
        :text: 56 m
        :value: 56
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0687561
        :lng: 108.1814381
      :html_instructions: Turn <b>left</b> at Cà Phê Z5 onto <b>Yên Khê 2</b>
      :maneuver: turn-left
      :polyline:
        :points: inaaByghsSJRLTN\FP
      :start_location:
        :lat: 16.0690139
        :lng: 108.1818885
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 276
      :duration:
        :text: 1 min
        :value: 53
      :end_location:
        :lat: 16.0707564
        :lng: 108.179936
      :html_instructions: Turn <b>right</b> at Cà Phê N-M onto <b>Cầu Phú Lộc</b>/<b>Dũng
        Sĩ Thanh Khê</b><div style="font-size:0.9em">Continue to follow Dũng Sĩ Thanh
        Khê</div><div style="font-size:0.9em">Pass by Xí Nghiệp Xd Công Trình 3 -
        Công Ty Xd Công Trình Giao Thông 529 (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: wlaaB_ehsSoB`A_@PmAv@_BrAqAjA
      :start_location:
        :lat: 16.0687561
        :lng: 108.1814381
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0686762
        :lng: 108.1821004
      :step_index: 1
      :step_interpolation: 0.7126430534278471
  :overview_polyline:
    :points: ohaaBinhsSp@~@kFnCXh@Vn@oCrAmAv@_BrAqAjA
  :summary: Thanh Huy 3 and Dũng Sĩ Thanh Khê
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:55.365183', '2017-05-03 01:33:55.365183');
INSERT INTO distances VALUES (83, 39, 40, 495, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0740966
      :lng: 108.179936
    :southwest:
      :lat: 16.0707564
      :lng: 108.1768772
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 495
    :duration:
      :text: 1 min
      :value: 67
    :end_address: 96 Dũng Sĩ Thanh Khê, Thanh Khê Tây, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0740966
      :lng: 108.1768772
    :start_address: 11-23 Dũng Sĩ Thanh Khê, Thanh Khê Tây, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0707564
      :lng: 108.179936
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 495
      :duration:
        :text: 1 min
        :value: 67
      :end_location:
        :lat: 16.0740966
        :lng: 108.1768772
      :html_instructions: Head <b>northwest</b> on <b>Dũng Sĩ Thanh Khê</b> toward
        <b>Kiet 90/01 Dung Si Thanh Khe</b><div style="font-size:0.9em">Pass by Công
        Ty Tnhh Du Lịch Sao Mai Quốc Tế - Vpđd (on the right)</div>
      :polyline:
        :points: gyaaBs{gsS_CzB_@Z]XkCzBe@b@yArAmBdBcBvA
      :start_location:
        :lat: 16.0707564
        :lng: 108.179936
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gyaaBs{gsS_DvCiDtC_CvBqE|D
  :summary: Dũng Sĩ Thanh Khê
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:55.598959', '2017-05-03 01:33:55.598959');
INSERT INTO distances VALUES (84, 40, 41, 215, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0750868
      :lng: 108.1768772
    :southwest:
      :lat: 16.0740966
      :lng: 108.1754827
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 215
    :duration:
      :text: 1 min
      :value: 42
    :end_address: Lý Thái Tông, Thanh Khê, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0747002
      :lng: 108.1754827
    :start_address: 96 Dũng Sĩ Thanh Khê, Thanh Khê Tây, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0740966
      :lng: 108.1768772
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 105
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0747823
        :lng: 108.176208
      :html_instructions: Head <b>northwest</b> on <b>Dũng Sĩ Thanh Khê</b> toward
        <b>Phục Đán</b><div style="font-size:0.9em">Pass by Cà Phê 154 (on the right)</div>
      :polyline:
        :points: cnbaBohgsSc@^CB_@Z_@ZORILEF
      :start_location:
        :lat: 16.0740966
        :lng: 108.1768772
      :travel_mode: DRIVING
    - :distance:
        :text: 57 m
        :value: 57
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.0750868
        :lng: 108.1757756
      :html_instructions: At Nhà Thuốc Phước Thành, continue onto <b>Thanh Khê 6</b><div
        style="font-size:0.9em">Pass by Quán Cafe Góc Phố (on the right)</div>
      :polyline:
        :points: krbaBidgsSOXm@z@
      :start_location:
        :lat: 16.0747823
        :lng: 108.176208
      :travel_mode: DRIVING
    - :distance:
        :text: 53 m
        :value: 53
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0747002
        :lng: 108.1754827
      :html_instructions: Turn <b>left</b> at Đồng Tiến Bakery onto <b>Lý Thái Tông</b><div
        style="font-size:0.9em">Pass by Dịch Vụ Nhà Đất Xuân Hương (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: itbaBsagsS~@p@LH
      :start_location:
        :lat: 16.0750868
        :lng: 108.1757756
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: cnbaBohgsSgBzAo@bAm@z@~@p@LH
  :summary: Dũng Sĩ Thanh Khê and Thanh Khê 6
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:55.940462', '2017-05-03 01:33:55.940462');
INSERT INTO distances VALUES (85, 41, 42, 426, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0747002
      :lng: 108.1754827
    :southwest:
      :lat: 16.0720794
      :lng: 108.1730577
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 426
    :duration:
      :text: 1 min
      :value: 52
    :end_address: 55 Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0724471
      :lng: 108.1730577
    :start_address: Lý Thái Tông, Thanh Khê, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0747002
      :lng: 108.1754827
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 353
      :duration:
        :text: 1 min
        :value: 41
      :end_location:
        :lat: 16.0720794
        :lng: 108.1736212
      :html_instructions: Head <b>southwest</b> on <b>Lý Thái Tông</b> toward <b>Dũng
        Sĩ Thanh Khê</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Hoàng Phú
        (on the right)</div>
      :polyline:
        :points: "{qbaBw_gsSFD^RTRXRrEnCXPbBjA`BbA"
      :start_location:
        :lat: 16.0747002
        :lng: 108.1754827
      :travel_mode: DRIVING
    - :distance:
        :text: 73 m
        :value: 73
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.0724471
        :lng: 108.1730577
      :html_instructions: Turn <b>right</b> at Quán Ăn 147 onto <b>Kinh Dương Vương</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Vlxd Tân Khải Hoàn (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: oabaBctfsSiAnB
      :start_location:
        :lat: 16.0720794
        :lng: 108.1736212
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{qbaBw_gsSvA`AlF`DdEnCiAnB"
  :summary: Lý Thái Tông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:56.269176', '2017-05-03 01:33:56.269176');
INSERT INTO distances VALUES (86, 42, 43, 490, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0749144
      :lng: 108.1730577
    :southwest:
      :lat: 16.0724471
      :lng: 108.1692643
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 490
    :duration:
      :text: 1 min
      :value: 71
    :end_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0749144
      :lng: 108.1692643
    :start_address: 55 Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0724471
      :lng: 108.1730577
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 490
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0749144
        :lng: 108.1692643
      :html_instructions: Head <b>northwest</b> on <b>Kinh Dương Vương</b> toward
        <b>Phú Lộc 9</b><div style="font-size:0.9em">Pass by Nhà May Vân Trang (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ycbaBspfsSaAdBqDfGo@nAi@z@S\i@bAm@fAk@fAEJ
      :start_location:
        :lat: 16.0724471
        :lng: 108.1730577
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ycbaBspfsSsFlJyAjCwCpFEJ
  :summary: Kinh Dương Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:56.498164', '2017-05-03 01:33:56.498164');
INSERT INTO distances VALUES (87, 43, 45, 1320, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0815276
      :lng: 108.1692643
    :southwest:
      :lat: 16.0749144
      :lng: 108.159301
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1320
    :duration:
      :text: 3 mins
      :value: 187
    :end_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0815276
      :lng: 108.159301
    :start_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0749144
      :lng: 108.1692643
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 628
      :duration:
        :text: 1 min
        :value: 87
      :end_location:
        :lat: 16.0781515
        :lng: 108.1644466
      :html_instructions: Head <b>northwest</b> on <b>Kinh Dương Vương</b> toward
        <b>Phú Lộc 3</b><div style="font-size:0.9em">Pass by Nhà A (on the left)</div>
      :polyline:
        :points: esbaB{xesS]l@m@`AEJu@lAS^wDxGSZw@xA{@lAq@bAi@x@m@dAa@t@
      :start_location:
        :lat: 16.0749144
        :lng: 108.1692643
      :travel_mode: DRIVING
    - :distance:
        :text: 0.7 km
        :value: 692
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0815276
        :lng: 108.159301
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Kinh Dương Vương</b><div style="font-size:0.9em">Pass by Karaoke Ánh Tuyết
        (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: mgcaByzdsSEAAACAA?C?CAC?A?C@E?A@C@A@A@C@A@ABA@AB?@AB?B?@AB?B@B?@?B@B@@@B@@@B@@DBsCfFo@hAm@fAu@nAy@xAcBvCoCnEa@t@
      :start_location:
        :lat: 16.0781515
        :lng: 108.1644466
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: esbaB{xesSgChEwGnLmBpCwA~Ba@t@EAECMAMBKFGJAJ?LDLJJgHhM}CpFqDdG
  :summary: Kinh Dương Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:57.153908', '2017-05-03 01:33:57.153908');
INSERT INTO distances VALUES (88, 45, 46, 402, 10, '---
- :bounds:
    :northeast:
      :lat: 16.083941
      :lng: 108.159301
    :southwest:
      :lat: 16.0815276
      :lng: 108.1573923
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 402
    :duration:
      :text: 1 min
      :value: 53
    :end_address: 43 Trần Đình Tri, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.083941
      :lng: 108.1581798
    :start_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0815276
      :lng: 108.159301
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 248
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0827852
        :lng: 108.1573832
      :html_instructions: Head <b>northwest</b> on <b>Kinh Dương Vương</b> toward
        <b>Hòa Minh 1</b><div style="font-size:0.9em">Pass by Hotel Gia Lợi (on the
        right)</div>
      :polyline:
        :points: q|caBszcsScBbDMPmAvBy@nAA@
      :start_location:
        :lat: 16.0815276
        :lng: 108.159301
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 154
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.083941
        :lng: 108.1581798
      :html_instructions: Turn <b>right</b> onto <b>Trần Đình Tri</b><div style="font-size:0.9em">Pass
        by Cửa Hàng Tạp Hóa Phương (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: mddaBsncsSEE_@U]SYO]SYQQMECw@g@
      :start_location:
        :lat: 16.0827852
        :lng: 108.1573832
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: q|caBszcsSqBtDgCfEGC}@i@cBcA}@k@
  :summary: Kinh Dương Vương and Trần Đình Tri
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.083941
      :lng: 108.159301
    :southwest:
      :lat: 16.0815276
      :lng: 108.1577939
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 413
    :duration:
      :text: 1 min
      :value: 64
    :end_address: 43 Trần Đình Tri, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.083941
      :lng: 108.1581798
    :start_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0815276
      :lng: 108.159301
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 194
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0824947
        :lng: 108.1577939
      :html_instructions: Head <b>northwest</b> on <b>Kinh Dương Vương</b> toward
        <b>Hòa Minh 1</b><div style="font-size:0.9em">Pass by Hotel Gia Lợi (on the
        right)</div>
      :polyline:
        :points: q|caBszcsScBbDMPmAvB
      :start_location:
        :lat: 16.0815276
        :lng: 108.159301
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 116
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0833389
        :lng: 108.158439
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Top Rượu onto <b>Hòa Minh
        1</b>
      :maneuver: turn-right
      :polyline:
        :points: qbdaBeqcsSaAq@YU[Sq@e@
      :start_location:
        :lat: 16.0824947
        :lng: 108.1577939
      :travel_mode: DRIVING
    - :distance:
        :text: 61 m
        :value: 61
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0836285
        :lng: 108.1579562
      :html_instructions: Turn <b>left</b> at Caffe Cỏ Xanh onto <b>Nguyễn Thúy</b>
      :maneuver: turn-left
      :polyline:
        :points: "{gdaBgucsSy@~A"
      :start_location:
        :lat: 16.0833389
        :lng: 108.158439
      :travel_mode: DRIVING
    - :distance:
        :text: 42 m
        :value: 42
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.083941
        :lng: 108.1581798
      :html_instructions: Turn <b>right</b> at Công Ty Phong Tâm Đà Nẵng onto <b>Trần
        Đình Tri</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: uidaBgrcsSECw@g@
      :start_location:
        :lat: 16.0836285
        :lng: 108.1579562
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0827252
        :lng: 108.1579716
      :step_index: 1
      :step_interpolation: 0.2738493717613659
  :overview_polyline:
    :points: q|caBszcsSqBtDmAvBaAq@u@i@q@e@y@~A}@k@
  :summary: Kinh Dương Vương and Hòa Minh 1
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.083941
      :lng: 108.1601694
    :southwest:
      :lat: 16.0813599
      :lng: 108.1579562
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 474
    :duration:
      :text: 1 min
      :value: 86
    :end_address: 43 Trần Đình Tri, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.083941
      :lng: 108.1581798
    :start_address: Kinh Dương Vương, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0815276
      :lng: 108.159301
    :steps:
    - :distance:
        :text: 35 m
        :value: 35
      :duration:
        :text: 1 min
        :value: 4
      :end_location:
        :lat: 16.0813599
        :lng: 108.1595728
      :html_instructions: Head <b>southeast</b> on <b>Kinh Dương Vương</b>
      :polyline:
        :points: q|caBszcsS`@u@
      :start_location:
        :lat: 16.0815276
        :lng: 108.159301
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 111
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0821803
        :lng: 108.1601694
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Âu Việt Hưng toward <b>Nguyễn
        Thúy</b><div style="font-size:0.9em">Pass by Cà Phê Khánh Linh (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: o{caBi|csSwA}@AAiAw@
      :start_location:
        :lat: 16.0813599
        :lng: 108.1595728
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 286
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0836285
        :lng: 108.1579562
      :html_instructions: Turn <b>left</b> at Công Ty Phong Tâm Đà Nẵng onto <b>Nguyễn
        Thúy</b>
      :maneuver: turn-left
      :polyline:
        :points: s`daBa`dsSy@tAm@bAy@vAeAfBy@~A
      :start_location:
        :lat: 16.0821803
        :lng: 108.1601694
      :travel_mode: DRIVING
    - :distance:
        :text: 42 m
        :value: 42
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.083941
        :lng: 108.1581798
      :html_instructions: Turn <b>right</b> at Công Ty Phong Tâm Đà Nẵng onto <b>Trần
        Đình Tri</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: uidaBgrcsSECw@g@
      :start_location:
        :lat: 16.0836285
        :lng: 108.1579562
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0819887
        :lng: 108.1600272
      :step_index: 1
      :step_interpolation: 0.7648907133231428
  :overview_polyline:
    :points: q|caBszcsS`@u@wA}@kAy@gFxIy@~AECw@g@
  :summary: Nguyễn Thúy
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:57.382932', '2017-05-03 01:33:57.382932');
INSERT INTO distances VALUES (89, 46, 47, 810, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0886276
      :lng: 108.1593119
    :southwest:
      :lat: 16.083941
      :lng: 108.1547633
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 810
    :duration:
      :text: 1 min
      :value: 74
    :end_address: Nguyễn Tất Thành, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0886276
      :lng: 108.1547633
    :start_address: 43 Trần Đình Tri, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.083941
      :lng: 108.1581798
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 204
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0854513
        :lng: 108.1592613
      :html_instructions: Head <b>northeast</b> on <b>Trần Đình Tri</b> toward <b>Lê
        Văn Miến</b>
      :polyline:
        :points: skdaBsscsSaBcA]SaAq@UMOMOISOa@W
      :start_location:
        :lat: 16.083941
        :lng: 108.1581798
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 606
      :duration:
        :text: 1 min
        :value: 48
      :end_location:
        :lat: 16.0886276
        :lng: 108.1547633
      :html_instructions: Turn <b>left</b> at Quán Nhậu Lan Hương onto <b>Nguyễn Tất
        Thành</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: audaBkzcsSMImCjEqBhDq@lAKNeBvCyA`Cc@p@kAlB
      :start_location:
        :lat: 16.0854513
        :lng: 108.1592613
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: skdaBsscsSmHwEMImCjEcDvFoFzIkAlB
  :summary: Trần Đình Tri and Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:57.683615', '2017-05-03 01:33:57.683615');
INSERT INTO distances VALUES (90, 47, 48, 594, 10, '---
- :bounds:
    :northeast:
      :lat: 16.0917559
      :lng: 108.1547633
    :southwest:
      :lat: 16.0886276
      :lng: 108.1502625
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 594
    :duration:
      :text: 1 min
      :value: 42
    :end_address: Nguyễn Tất Thành, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0917559
      :lng: 108.1502625
    :start_address: Nguyễn Tất Thành, Hòa Minh, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0886276
      :lng: 108.1547633
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 594
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0917559
        :lng: 108.1502625
      :html_instructions: Head <b>northwest</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Nguyễn Chánh</b><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: "}heaBg~bsSEF]l@wA~BsAxBWb@{BzD_@l@QXKJIL{BnDiA`B"
      :start_location:
        :lat: 16.0886276
        :lng: 108.1547633
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}heaBg~bsSuKvQUXeEpG"
  :summary: Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:58.042134', '2017-05-03 01:33:58.042134');
INSERT INTO distances VALUES (91, 48, 1, 2281, 10, '---
- :bounds:
    :northeast:
      :lat: 16.1064987
      :lng: 108.1502625
    :southwest:
      :lat: 16.0917559
      :lng: 108.1354885
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 2.3 km
      :value: 2281
    :duration:
      :text: 3 mins
      :value: 153
    :end_address: Nguyễn Tất Thành, Nam Ô 1, Hòa Hiệp Nam, Liên Chiểu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.1064987
      :lng: 108.1354885
    :start_address: Nguyễn Tất Thành, Hòa Khánh Bắc, Liên Chiểu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0917559
      :lng: 108.1502625
    :steps:
    - :distance:
        :text: 2.3 km
        :value: 2281
      :duration:
        :text: 3 mins
        :value: 153
      :end_location:
        :lat: 16.1064987
        :lng: 108.1354885
      :html_instructions: Head <b>northwest</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Phan Văn Định</b><div style="font-size:0.9em">Pass by The Nature Villas
        &amp; Resort (on the right in 550&nbsp;m)</div><div style="font-size:0.9em">Destination
        will be on the left</div>
      :polyline:
        :points: o|eaBcbbsScAzASTgGbICFORsA~AgBrBuA|AeBjBcBxBeBnBoB|BqAxAeAjAKJiAfA{@x@iA~@w@r@oC|BmB~A{AnAg@d@uBfByBhBCB}BpBy@r@OLqAfAy@r@}@v@cBxAcA|@_@Vg@^{@t@iAbAWT[V
      :start_location:
        :lat: 16.0917559
        :lng: 108.1502625
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: o|eaBcbbsSwApBkGjIaHdIeBjBcBxBeBnBaEvEqAvAeC`CaCrBaKrIgQdOeGfFeEnD[V
  :summary: Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:33:58.358009', '2017-05-03 01:33:58.358009');
INSERT INTO distances VALUES (484, 156, 157, 484, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0661587
      :lng: 108.2083238
    :southwest:
      :lat: 16.0640706
      :lng: 108.2055456
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 484
    :duration:
      :text: 2 mins
      :value: 93
    :end_address: 102 Phan Thanh, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0640706
      :lng: 108.2083238
    :start_address: 26 Điện Biên Phủ, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0660524
      :lng: 108.2055456
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 123
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0661472
        :lng: 108.2066868
      :html_instructions: Head <b>east</b> on <b>Điện Biên Phủ</b> toward <b>K 26
        Điện Biên Phủ</b><div style="font-size:0.9em">Pass by Vườn Hoa Kiểng (on the
        left)</div>
      :polyline:
        :points: y{`aBu{lsSA_@C]A]Be@C_@Eo@EQ
      :start_location:
        :lat: 16.0660524
        :lng: 108.2055456
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 119
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0661587
        :lng: 108.2077487
      :html_instructions: At the roundabout, continue straight onto <b>Lý Thái Tổ</b><div
        style="font-size:0.9em">Pass by Shop Mẹ &amp; Bé Bibi (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: m|`aBybmsS@?@??A@??A@??A@A?A?A?A?A?A?AA??AA??AA??AA?A?@yAC_B
      :start_location:
        :lat: 16.0661472
        :lng: 108.2066868
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 242
      :duration:
        :text: 1 min
        :value: 54
      :end_location:
        :lat: 16.0640706
        :lng: 108.2083238
      :html_instructions: Turn <b>right</b> at Tiệm Mì Thu onto <b>Phan Thanh</b><div
        style="font-size:0.9em">Pass by Lều Phượt Cá Mập (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: o|`aBmimsS`Em@L?h@Cr@IZGVIVM\QHC
      :start_location:
        :lat: 16.0661587
        :lng: 108.2077487
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: y{`aBu{lsSE}@@cAOaBB?BE?MCCAA?yAC_B`Em@v@CnAQVIVMf@U
  :summary: Điện Biên Phủ and Phan Thanh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:43.480229', '2017-05-03 02:16:43.480229');
INSERT INTO distances VALUES (195, 90, 91, 369, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0807474
      :lng: 108.2240824
    :southwest:
      :lat: 16.0774493
      :lng: 108.2237237
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 369
    :duration:
      :text: 1 min
      :value: 44
    :end_address: 8 Bạch Đằng, Thạch Thang, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0807474
      :lng: 108.2237237
    :start_address: 36 Bạch Đằng, Thạch Thang, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0774493
      :lng: 108.2240824
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 369
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0807474
        :lng: 108.2237237
      :html_instructions: Head <b>north</b> on <b>Bạch Đằng</b> toward <b>Lý Tự Trọng</b><div
        style="font-size:0.9em">Pass by Báo Công Lý - Vpđd Miền Trung (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: accaBoopsSiAFoEVq@BiBH_CJaAF[D
      :start_location:
        :lat: 16.0774493
        :lng: 108.2240824
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: accaBoopsSyG^{CL}EX
  :summary: Bạch Đằng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:18.658629', '2017-05-03 01:43:18.658629');
INSERT INTO distances VALUES (485, 157, 158, 358, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0640706
      :lng: 108.209316
    :southwest:
      :lat: 16.061015
      :lng: 108.2083238
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 358
    :duration:
      :text: 1 min
      :value: 84
    :end_address: 110/2 Phan Thanh, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.061015
      :lng: 108.209316
    :start_address: 102 Phan Thanh, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0640706
      :lng: 108.2083238
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 358
      :duration:
        :text: 1 min
        :value: 84
      :end_location:
        :lat: 16.061015
        :lng: 108.209316
      :html_instructions: Head <b>southeast</b> on <b>Phan Thanh</b> toward <b>K 70
        Phan Thanh</b><div style="font-size:0.9em">Pass by Shop Thời Trang Love (on
        the left)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: mo`aB_mmsSNIh@WVIZKfBc@REZK\IRGf@M`@KhBQfAOHAd@I
      :start_location:
        :lat: 16.0640706
        :lng: 108.2083238
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mo`aB_mmsSx@a@r@UtD_Az@U`@KhBQpAQd@I
  :summary: Phan Thanh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:43.735457', '2017-05-03 02:16:43.735457');
INSERT INTO distances VALUES (486, 158, 159, 339, 17, '---
- :bounds:
    :northeast:
      :lat: 16.061015
      :lng: 108.209759
    :southwest:
      :lat: 16.0580057
      :lng: 108.209316
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 339
    :duration:
      :text: 2 mins
      :value: 98
    :end_address: 40 Phạm Văn Nghị, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0580057
      :lng: 108.209759
    :start_address: 110/2 Phan Thanh, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.061015
      :lng: 108.209316
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 140
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0597648
        :lng: 108.2094412
      :html_instructions: Head <b>south</b> on <b>Phan Thanh</b> toward <b>K 138 Phan
        Thanh</b><div style="font-size:0.9em">Pass by Cửa Hàng Hiếu Hiền Computer
        (on the right)</div>
      :polyline:
        :points: i|_aBgsmsSRCp@Cp@ARCXArAG
      :start_location:
        :lat: 16.061015
        :lng: 108.209316
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 199
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0580057
        :lng: 108.209759
      :html_instructions: At Công ty Đầu Tư Xây Dựng Và Phát Triển Rồng Vàng, continue
        onto <b>Phạm Văn Nghị</b><div style="font-size:0.9em">Pass by Ủy Ban Mặt Trận
        Tổ Quốc Việt Nam &amp; Các Đoàn Thể Phường Thạc Gián (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ot_aB_tmsSRAfBOZCLAFApAGNATEZIZK
      :start_location:
        :lat: 16.0597648
        :lng: 108.2094412
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: i|_aBgsmsSdAGp@ARClBIzBQbCOd@Gv@U
  :summary: Phan Thanh and Phạm Văn Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:44.122763', '2017-05-03 02:16:44.122763');
INSERT INTO distances VALUES (487, 159, 160, 399, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0580057
      :lng: 108.2101141
    :southwest:
      :lat: 16.0560509
      :lng: 108.2086215
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 399
    :duration:
      :text: 2 mins
      :value: 99
    :end_address: 249-255 Nguyễn Tri Phương, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0560509
      :lng: 108.2092438
    :start_address: 40 Phạm Văn Nghị, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0580057
      :lng: 108.209759
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 318
      :duration:
        :text: 1 min
        :value: 78
      :end_location:
        :lat: 16.0564561
        :lng: 108.2086215
      :html_instructions: Head <b>south</b> on <b>Phạm Văn Nghị</b> toward <b>Tôn
        Thất Tùng</b><div style="font-size:0.9em">Pass by Cà Phê Thanh Nguyên (on
        the left)</div>
      :polyline:
        :points: qi_aB_vmsSJCBAj@MXIZGREHA|@K`AKBTBPDTDXD^J|@@`@?^Ap@
      :start_location:
        :lat: 16.0580057
        :lng: 108.209759
      :travel_mode: DRIVING
    - :distance:
        :text: 81 m
        :value: 81
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0560509
        :lng: 108.2092438
      :html_instructions: Turn <b>left</b> at Quán Nhậu 105 onto <b>Nguyễn Tri Phương</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Đoàn Thanh Mau (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: "{__aB{nmsSFEDEDEt@_BFI"
      :start_location:
        :lat: 16.0564561
        :lng: 108.2086215
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qi_aB_vmsStA]vB[`AKBTHf@Jx@L~AApALKbAoB
  :summary: Phạm Văn Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:44.58317', '2017-05-03 02:16:44.58317');
INSERT INTO distances VALUES (488, 160, 161, 526, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0560509
      :lng: 108.210535
    :southwest:
      :lat: 16.0518313
      :lng: 108.2092438
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 526
    :duration:
      :text: 2 mins
      :value: 100
    :end_address: 217 Lê Đình Lý, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0518313
      :lng: 108.2101174
    :start_address: 249-255 Nguyễn Tri Phương, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0560509
      :lng: 108.2092438
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 445
      :duration:
        :text: 1 min
        :value: 81
      :end_location:
        :lat: 16.0524356
        :lng: 108.210535
      :html_instructions: Head <b>southeast</b> on <b>Nguyễn Tri Phương</b> toward
        <b>K 118 Lê Đình Lý</b>/<b>K 147 Nguyễn Tri Phương</b><div style="font-size:0.9em">Pass
        by Hoàn Thiện Auto (on the right)</div>
      :polyline:
        :points: i}~`BwrmsSJSFIJKNKPMVG^Ed@CvAI`@E`AInBYt@Gp@GNAf@Gj@Kx@sA
      :start_location:
        :lat: 16.0560509
        :lng: 108.2092438
      :travel_mode: DRIVING
    - :distance:
        :text: 81 m
        :value: 81
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0518313
        :lng: 108.2101174
      :html_instructions: Turn <b>right</b> at Mắt Kính Đại Nam onto <b>Lê Đình Lý</b><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: wf~`B{zmsSxBrA
      :start_location:
        :lat: 16.0524356
        :lng: 108.210535
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: i}~`BwrmsSR]ZWh@UdAIxBOpDc@~CYj@Kx@sAxBrA
  :summary: Nguyễn Tri Phương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:44.932766', '2017-05-03 02:16:44.932766');
INSERT INTO distances VALUES (105, 27, 28, 425, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0870588
      :lng: 108.2207002
    :southwest:
      :lat: 16.0847991
      :lng: 108.2195007
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 425
    :duration:
      :text: 1 min
      :value: 80
    :end_address: 32 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0847991
      :lng: 108.2207002
    :start_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.086579
      :lng: 108.2204171
    :steps:
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Head <b>north</b> on <b>Đinh Công Tráng</b> toward <b>Xuân
        Diệu</b>
      :polyline:
        :points: c|daBsxosSC?ICWIK?O@C@C@CBABADCLABALEZ
      :start_location:
        :lat: 16.086579
        :lng: 108.2204171
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 183
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Xuân Diệu</b><div style="font-size:0.9em">Pass by Xuân
        Diệu SeaView House (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: c_eaBqvosSb@Dv@N^HzA\|Al@
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 157
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0847991
        :lng: 108.2207002
      :html_instructions: Turn <b>left</b> at Cà Phê 82 onto <b>3 Tháng 2</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa 61 (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mudaBesosSTHFS|@{BPc@L]P]
      :start_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: c|daBsxosSq@MSBGDIZGh@zATzBf@rBv@dBqEP]
  :summary: Xuân Diệu and 3 Tháng 2
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:36:58.118133', '2017-05-03 01:36:58.118133');
INSERT INTO distances VALUES (106, 28, 51, 457, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0847991
      :lng: 108.2222907
    :southwest:
      :lat: 16.0823859
      :lng: 108.2207002
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 457
    :duration:
      :text: 1 min
      :value: 65
    :end_address: 22-24 Đống Đa, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0823859
      :lng: 108.2207749
    :start_address: 32 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0847991
      :lng: 108.2207002
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 278
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0828511
        :lng: 108.2222907
      :html_instructions: Head <b>southeast</b> on <b>3 Tháng 2</b> toward <b>Châu
        Văn Liêm</b><div style="font-size:0.9em">Pass by Công Ty Cp Vận Tải Pst Đà
        Nẵng (on the left)</div>
      :polyline:
        :points: _qdaBkzosS@AR[PS\]LMJI\Uf@]TOFGJMBCr@e@lAw@PKJEPG
      :start_location:
        :lat: 16.0847991
        :lng: 108.2207002
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 179
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0823859
        :lng: 108.2207749
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Đống
        Đa</b><div style="font-size:0.9em">Pass by Vib - Atm (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: yddaBidpsSB@@@@@@@@@@?B@@?@?B@@?@?Zt@HlA@DHdAFv@BX
      :start_location:
        :lat: 16.0828511
        :lng: 108.2222907
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _qdaBkzosST]n@q@XWdAs@\WNQ`C}A\QPGB@BBHDH@\t@JrATvC
  :summary: 3 Tháng 2 and Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:36:58.652905', '2017-05-03 01:36:58.652905');
INSERT INTO distances VALUES (107, 51, 52, 484, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0823859
      :lng: 108.2207749
    :southwest:
      :lat: 16.0790091
      :lng: 108.2190294
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 484
    :duration:
      :text: 1 min
      :value: 80
    :end_address: 40-42 Lê Lợi, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0790091
      :lng: 108.2194133
    :start_address: 22-24 Đống Đa, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0823859
      :lng: 108.2207749
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 241
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0811312
        :lng: 108.2190294
      :html_instructions: Head <b>west</b> on <b>Đống Đa</b> toward <b>Châu Văn Liêm</b><div
        style="font-size:0.9em">Pass by Đại Lý Gạo Sỉ &amp; Lẻ (on the left)</div>
      :polyline:
        :points: "}adaByzosSDRHd@DR?@DRL\\N\\Xd@Xb@`@`@b@^\\Th@X"
      :start_location:
        :lat: 16.0823859
        :lng: 108.2207749
      :travel_mode: DRIVING
    - :distance:
        :text: 11 m
        :value: 11
      :duration:
        :text: 1 min
        :value: 4
      :end_location:
        :lat: 16.0810796
        :lng: 108.2191118
      :html_instructions: Turn <b>left</b> at Internet Chomchom onto <b>Lê Lợi</b>/<b>Trần
        Quý Cáp</b>
      :maneuver: turn-left
      :polyline:
        :points: azcaB}oosSHO
      :start_location:
        :lat: 16.0811312
        :lng: 108.2190294
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 232
      :duration:
        :text: 1 min
        :value: 39
      :end_location:
        :lat: 16.0790091
        :lng: 108.2194133
      :html_instructions: Turn <b>right</b> at Công ty CP Thiết kế &amp; Xây dựng
        TT onto <b>Lê Lợi</b><div style="font-size:0.9em">Pass by Cửa Hàng Dịch Vụ
        Văn Hóa (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: wycaBmposSpEa@jEY
      :start_location:
        :lat: 16.0810796
        :lng: 108.2191118
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}adaByzosSTnARp@h@bAz@dA`At@h@XHO|K{@"
  :summary: Đống Đa and Lê Lợi
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:36:58.907515', '2017-05-03 01:36:58.907515');
INSERT INTO distances VALUES (108, 52, 30, 790, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0790091
      :lng: 108.2235447
    :southwest:
      :lat: 16.0758703
      :lng: 108.2194133
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 790
    :duration:
      :text: 3 mins
      :value: 163
    :end_address: 29 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0758703
      :lng: 108.2235447
    :start_address: 40-42 Lê Lợi, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0790091
      :lng: 108.2194133
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 197
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0772491
        :lng: 108.21966
      :html_instructions: Head <b>south</b> on <b>Lê Lợi</b> toward <b>Nguyễn Du</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Du Lịch Dịch Vụ Đông Dương (on
        the right)</div>
      :polyline:
        :points: ylcaBirosS`BM|Fc@
      :start_location:
        :lat: 16.0790091
        :lng: 108.2194133
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 387
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0776984
        :lng: 108.2232547
      :html_instructions: Turn <b>left</b> at Công Ty Cổ Phần Đầu Tư Xây Dựng Và Thương
        Mại Vn Đà Thành onto <b>Lý Tự Trọng</b><div style="font-size:0.9em">Pass by
        Song Han Hotel (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: yacaB{sosSKgCOwBCYSsCe@_H
      :start_location:
        :lat: 16.0772491
        :lng: 108.21966
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 206
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0758703
        :lng: 108.2235447
      :html_instructions: Turn <b>right</b> at Tổng Lãnh Sự Quán Nga onto <b>Trần
        Phú</b><div style="font-size:0.9em">Pass by Hội Doanh Nghiệp Trẻ Tp. Đà Nẵng
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-right
      :polyline:
        :points: sdcaBijpsSbBOjC[|BM
      :start_location:
        :lat: 16.0776984
        :lng: 108.2232547
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ylcaBirosS~Iq@[_GWmDe@_HbBOjC[|BM
  :summary: Lý Tự Trọng and Trần Phú
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0790091
      :lng: 108.2235447
    :southwest:
      :lat: 16.0758703
      :lng: 108.2194133
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 792
    :duration:
      :text: 3 mins
      :value: 174
    :end_address: 29 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0758703
      :lng: 108.2235447
    :start_address: 40-42 Lê Lợi, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0790091
      :lng: 108.2194133
    :steps:
    - :distance:
        :text: 54 m
        :value: 54
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 16.0785233
        :lng: 108.2194769
      :html_instructions: Head <b>south</b> on <b>Lê Lợi</b> toward <b>Nguyễn Du</b>
      :polyline:
        :points: ylcaBirosS`BM
      :start_location:
        :lat: 16.0790091
        :lng: 108.2194133
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 389
      :duration:
        :text: 2 mins
        :value: 93
      :end_location:
        :lat: 16.0789815
        :lng: 108.2230899
      :html_instructions: Turn <b>left</b> at Cửa Hàng Tạp Hóa Yến onto <b>Nguyễn
        Du</b><div style="font-size:0.9em">Pass by Cơ Sở Tin Học It (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: wicaBwrosSKgAIaAQuC?GScCIoAEs@Cu@KkB
      :start_location:
        :lat: 16.0785233
        :lng: 108.2194769
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 349
      :duration:
        :text: 1 min
        :value: 73
      :end_location:
        :lat: 16.0758703
        :lng: 108.2235447
      :html_instructions: Turn <b>right</b> at Công ty CP truyền thông Mắt Bão Đà
        Nẵng onto <b>Trần Phú</b><div style="font-size:0.9em">Pass by Công Ty Cp Đầu
        Tư Xây Dựng Du Lịch Cit - Vpđd Đà Nẵng (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: slcaBiipsSPAlF]bBOjC[|BM
      :start_location:
        :lat: 16.0789815
        :lng: 108.2230899
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0786756
        :lng: 108.2205654
      :step_index: 1
      :step_interpolation: 0.3018235131262022
  :overview_polyline:
    :points: ylcaBirosS`BMKgA[wEc@oGOaD~F_@bBOjC[|BM
  :summary: Nguyễn Du and Trần Phú
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0790091
      :lng: 108.2235447
    :southwest:
      :lat: 16.0758703
      :lng: 108.2194133
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 795
    :duration:
      :text: 3 mins
      :value: 177
    :end_address: 29 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0758703
      :lng: 108.2235447
    :start_address: 40-42 Lê Lợi, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0790091
      :lng: 108.2194133
    :steps:
    - :distance:
        :text: 54 m
        :value: 54
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 16.0785233
        :lng: 108.2194769
      :html_instructions: Head <b>south</b> on <b>Lê Lợi</b> toward <b>Nguyễn Du</b>
      :polyline:
        :points: ylcaBirosS`BM
      :start_location:
        :lat: 16.0790091
        :lng: 108.2194133
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 232
      :duration:
        :text: 1 min
        :value: 52
      :end_location:
        :lat: 16.0788159
        :lng: 108.2216221
      :html_instructions: Turn <b>left</b> at Cửa Hàng Tạp Hóa Yến onto <b>Nguyễn
        Du</b><div style="font-size:0.9em">Pass by Cơ Sở Tin Học It (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: wicaBwrosSKgAIaAQuC?GScC
      :start_location:
        :lat: 16.0785233
        :lng: 108.2194769
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 147
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0775091
        :lng: 108.2218105
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Một Thành Viên Idoleen
        onto <b>Phan Bội Châu</b><div style="font-size:0.9em">Pass by IDOLEEN (on
        the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: skcaBc`psS`CSbCQ
      :start_location:
        :lat: 16.0788159
        :lng: 108.2216221
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 156
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0776984
        :lng: 108.2232547
      :html_instructions: Turn <b>left</b> at Quán Phở Hồng onto <b>Lý Tự Trọng</b><div
        style="font-size:0.9em">Pass by Xanh Coffee (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: mccaBiapsSe@_H
      :start_location:
        :lat: 16.0775091
        :lng: 108.2218105
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 206
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0758703
        :lng: 108.2235447
      :html_instructions: Turn <b>right</b> at Tổng Lãnh Sự Quán Nga onto <b>Trần
        Phú</b><div style="font-size:0.9em">Pass by Hội Doanh Nghiệp Trẻ Tp. Đà Nẵng
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-right
      :polyline:
        :points: sdcaBijpsSbBOjC[|BM
      :start_location:
        :lat: 16.0776984
        :lng: 108.2232547
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0778393
        :lng: 108.2217663
      :step_index: 2
      :step_interpolation: 0.7476997190731197
  :overview_polyline:
    :points: ylcaBirosS`BMKgA[wESkCdGe@e@_HbBOjC[|BM
  :summary: Nguyễn Du and Trần Phú
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:36:59.25222', '2017-05-03 01:36:59.25222');
INSERT INTO distances VALUES (109, 30, 31, 183, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0758703
      :lng: 108.223589
    :southwest:
      :lat: 16.0752294
      :lng: 108.2222818
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 183
    :duration:
      :text: 1 min
      :value: 34
    :end_address: 25 Quang Trung, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0752294
      :lng: 108.2222818
    :start_address: 29 Trần Phú, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0758703
      :lng: 108.2235447
    :steps:
    - :distance:
        :text: 40 m
        :value: 40
      :duration:
        :text: 1 min
        :value: 7
      :end_location:
        :lat: 16.0755131
        :lng: 108.223589
      :html_instructions: Head <b>south</b> on <b>Trần Phú</b> toward <b>Quang Trung</b>
      :polyline:
        :points: eybaBclpsSfAI
      :start_location:
        :lat: 16.0758703
        :lng: 108.2235447
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 143
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0752294
        :lng: 108.2222818
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Một Thành Viên Authentica
        Habita onto <b>Quang Trung</b><div style="font-size:0.9em">Pass by Vy Gia
        Coffee (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: "}vbaBmlpsSn@xEFj@"
      :start_location:
        :lat: 16.0755131
        :lng: 108.223589
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: eybaBclpsSfAIn@xEFj@
  :summary: Quang Trung
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:36:59.496291', '2017-05-03 01:36:59.496291');
INSERT INTO distances VALUES (110, 31, 55, 324, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0752294
      :lng: 108.2222818
    :southwest:
      :lat: 16.0741214
      :lng: 108.2199722
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 324
    :duration:
      :text: 1 min
      :value: 77
    :end_address: 124 Lê Lợi, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0741214
      :lng: 108.2200694
    :start_address: 25 Quang Trung, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0752294
      :lng: 108.2222818
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 252
      :duration:
        :text: 1 min
        :value: 60
      :end_location:
        :lat: 16.0747592
        :lng: 108.2199722
      :html_instructions: Head <b>west</b> on <b>Quang Trung</b> toward <b>Nguyễn
        Chí Thanh</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Thương Mại
        Dịch Vụ Giải Trí Công Nghệ Cao Hoàng Hải (on the right)</div>
      :polyline:
        :points: eubaBgdpsSJfAJ~@LhAVhB^pC
      :start_location:
        :lat: 16.0752294
        :lng: 108.2222818
      :travel_mode: DRIVING
    - :distance:
        :text: 72 m
        :value: 72
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0741214
        :lng: 108.2200694
      :html_instructions: Turn <b>left</b> at Viện Nghiên Cứu Phát Triển Kinh Tế Xã
        Hội onto <b>Lê Lợi</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Nhà
        Đầu Tư Pcmk (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: grbaByuosSlAKp@G
      :start_location:
        :lat: 16.0747592
        :lng: 108.2199722
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: eubaBgdpsSVfCd@rD^pClAKp@G
  :summary: Quang Trung
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:36:59.790105', '2017-05-03 01:36:59.790105');
INSERT INTO distances VALUES (111, 55, 56, 235, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0741214
      :lng: 108.2203436
    :southwest:
      :lat: 16.072024
      :lng: 108.2200694
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 235
    :duration:
      :text: 1 min
      :value: 44
    :end_address: 167 Lê Lợi, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.072024
      :lng: 108.2203436
    :start_address: 124 Lê Lợi, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0741214
      :lng: 108.2200694
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 235
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.072024
        :lng: 108.2203436
      :html_instructions: Head <b>south</b> on <b>Lê Lợi</b> toward <b>Lê Thánh Tôn</b><div
        style="font-size:0.9em">Pass by Myzo Milk Tea &amp; Drink (on the right)</div><div
        style="font-size:0.9em">Destination will be on the left</div>
      :polyline:
        :points: gnbaBmvosSh@E`G]vBQ
      :start_location:
        :lat: 16.0741214
        :lng: 108.2200694
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gnbaBmvosSjHc@vBQ
  :summary: Lê Lợi
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:00.104764', '2017-05-03 01:37:00.104764');
INSERT INTO distances VALUES (112, 56, 57, 369, 13, '---
- :bounds:
    :northeast:
      :lat: 16.072024
      :lng: 108.2205481
    :southwest:
      :lat: 16.0687238
      :lng: 108.2203436
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 369
    :duration:
      :text: 1 min
      :value: 81
    :end_address: 6 Phan Châu Trinh, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0687238
      :lng: 108.2203723
    :start_address: 167 Lê Lợi, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.072024
      :lng: 108.2203436
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 169
      :duration:
        :text: 1 min
        :value: 41
      :end_location:
        :lat: 16.0705138
        :lng: 108.2205481
      :html_instructions: Head <b>south</b> on <b>Lê Lợi</b> toward <b>Lê Duẩn</b><div
        style="font-size:0.9em">Pass by Shop Trẻ Em Jerry (on the right)</div>
      :polyline:
        :points: cabaBcxosSfCUdDS
      :start_location:
        :lat: 16.072024
        :lng: 108.2203436
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 200
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0687238
        :lng: 108.2203723
      :html_instructions: At Nhà May Hoàng, continue onto <b>Phan Châu Trinh</b><div
        style="font-size:0.9em">Pass by Nhà May Lực (on the right)</div>
      :polyline:
        :points: uwaaBmyosSh@BzH^
      :start_location:
        :lat: 16.0705138
        :lng: 108.2205481
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: cabaBcxosSlHi@dJb@
  :summary: Lê Lợi and Phan Châu Trinh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:00.371223', '2017-05-03 01:37:00.371223');
INSERT INTO distances VALUES (113, 57, 58, 347, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0687238
      :lng: 108.2203723
    :southwest:
      :lat: 16.0656286
      :lng: 108.2200448
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 347
    :duration:
      :text: 2 mins
      :value: 98
    :end_address: 115 Phan Châu Trinh, Hải Châu, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0656286
      :lng: 108.2200448
    :start_address: 6 Phan Châu Trinh, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0687238
      :lng: 108.2203723
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 347
      :duration:
        :text: 2 mins
        :value: 98
      :end_location:
        :lat: 16.0656286
        :lng: 108.2200448
      :html_instructions: Head <b>south</b> on <b>Phan Châu Trinh</b> toward <b>Hùng
        Vương</b><div style="font-size:0.9em">Pass by the pharmacy (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: olaaBixosSZ@jAHpCJtEPXFd@JxAB
      :start_location:
        :lat: 16.0687238
        :lng: 108.2203723
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: olaaBixosSnMh@~@RxAB
  :summary: Phan Châu Trinh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:00.716846', '2017-05-03 01:37:00.716846');
INSERT INTO distances VALUES (114, 58, 59, 400, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0656286
      :lng: 108.2200448
    :southwest:
      :lat: 16.0620509
      :lng: 108.2196867
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 400
    :duration:
      :text: 2 mins
      :value: 100
    :end_address: 195-209 Phan Châu Trinh, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0620509
      :lng: 108.2196867
    :start_address: 115 Phan Châu Trinh, Hải Châu, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0656286
      :lng: 108.2200448
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 400
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0620509
        :lng: 108.2196867
      :html_instructions: Head <b>south</b> on <b>Phan Châu Trinh</b> toward <b>Thái
        Phiên</b><div style="font-size:0.9em">Pass by Công ty TNHH TM và DV Thu Tâm
        (on the right)</div>
      :polyline:
        :points: ey`aBgvosShA@|AD`CLr@FrBJfAFnCP`@@
      :start_location:
        :lat: 16.0656286
        :lng: 108.2200448
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ey`aBgvosSfDFtDTlJf@
  :summary: Phan Châu Trinh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:06.227156', '2017-05-03 01:37:06.227156');
INSERT INTO distances VALUES (115, 59, 60, 687, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0620509
      :lng: 108.2196867
    :southwest:
      :lat: 16.0559545
      :lng: 108.2187523
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 687
    :duration:
      :text: 2 mins
      :value: 140
    :end_address: 389 Phan Châu Trinh, Bình Thuận, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0559545
      :lng: 108.2187718
    :start_address: 195-209 Phan Châu Trinh, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0620509
      :lng: 108.2196867
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 687
      :duration:
        :text: 2 mins
        :value: 140
      :end_location:
        :lat: 16.0559545
        :lng: 108.2187718
      :html_instructions: Head <b>south</b> on <b>Phan Châu Trinh</b> toward <b>Lê
        Đình Dương</b><div style="font-size:0.9em">Pass by VINAFOR TRAVEL (on the
        right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: yb`aBatosStAFr@FXDr@BZDZF`BBfFl@`@Dh@HZDPBH@XBp@F\DhALb@Dd@FJ?`@Db@D^B^Bl@Bf@C
      :start_location:
        :lat: 16.0620509
        :lng: 108.2196867
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yb`aBatosShCNlAHv@L`BBfFl@jANl@HrBR~CZdCRl@Bf@C
  :summary: Phan Châu Trinh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:06.479697', '2017-05-03 01:37:06.479697');
INSERT INTO distances VALUES (116, 60, 61, 470, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0559545
      :lng: 108.2204095
    :southwest:
      :lat: 16.0529034
      :lng: 108.2187718
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 470
    :duration:
      :text: 2 mins
      :value: 97
    :end_address: 142 Núi Thành, Hòa Thuận Đông, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0529034
      :lng: 108.2204095
    :start_address: 389 Phan Châu Trinh, Bình Thuận, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0559545
      :lng: 108.2187718
    :steps:
    - :distance:
        :text: 93 m
        :value: 93
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0551193
        :lng: 108.2188554
      :html_instructions: Head <b>south</b> on <b>Phan Châu Trinh</b> toward <b>Tuệ
        Tĩnh</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Tm &amp; Đầu Tư
        Quốc Vương (on the right)</div>
      :polyline:
        :points: u|~`BinosSdDQ
      :start_location:
        :lat: 16.0559545
        :lng: 108.2187718
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 140
      :duration:
        :text: 1 min
        :value: 33
      :end_location:
        :lat: 16.0550118
        :lng: 108.2201573
      :html_instructions: Turn <b>left</b> at Hội Bảo Trợ Phụ Nữ Và Trẻ Em Nghèo Thành
        Phố Đà Nẵng onto <b>Tuệ Tĩnh</b><div style="font-size:0.9em">Pass by Cà Phê
        24H (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: ow~`B{nosSDwCNkB
      :start_location:
        :lat: 16.0551193
        :lng: 108.2188554
      :travel_mode: DRIVING
    - :distance:
        :text: 32 m
        :value: 32
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.054727
        :lng: 108.2201332
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Gia Kỳ Anh onto <b>Trưng Nữ Vương</b>
      :maneuver: turn-right
      :polyline:
        :points: yv~`B_wosSv@D
      :start_location:
        :lat: 16.0550118
        :lng: 108.2201573
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 205
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0529034
        :lng: 108.2204095
      :html_instructions: Slight <b>left</b> at Công Ty Tnhh Trung Quang onto <b>Núi
        Thành</b><div style="font-size:0.9em">Pass by Quán Tiểu Bảo (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-slight-left
      :polyline:
        :points: au~`ByvosSn@KzAQ|BMbBK
      :start_location:
        :lat: 16.054727
        :lng: 108.2201332
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: u|~`BinosSdDQDwCNkBv@DjC]`FY
  :summary: Tuệ Tĩnh and Núi Thành
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0559545
      :lng: 108.2204095
    :southwest:
      :lat: 16.0529034
      :lng: 108.2187718
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 591
    :duration:
      :text: 2 mins
      :value: 118
    :end_address: 142 Núi Thành, Hòa Thuận Đông, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0529034
      :lng: 108.2204095
    :start_address: 389 Phan Châu Trinh, Bình Thuận, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0559545
      :lng: 108.2187718
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 243
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0538153
        :lng: 108.2191941
      :html_instructions: Head <b>south</b> on <b>Phan Châu Trinh</b> toward <b>Tuệ
        Tĩnh</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Tm &amp; Đầu Tư
        Quốc Vương (on the right)</div>
      :polyline:
        :points: u|~`BinosSdDQx@K`BQz@Oj@S
      :start_location:
        :lat: 16.0559545
        :lng: 108.2187718
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 143
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.054727
        :lng: 108.2201332
      :html_instructions: Turn <b>left</b> at Bidv onto <b>Trưng Nữ Vương</b><div
        style="font-size:0.9em">Pass by Quán Phở Thiên Phương (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: ko~`B}posSuD{D
      :start_location:
        :lat: 16.0538153
        :lng: 108.2191941
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 205
      :duration:
        :text: 1 min
        :value: 39
      :end_location:
        :lat: 16.0529034
        :lng: 108.2204095
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Trung Quang onto <b>Núi
        Thành</b><div style="font-size:0.9em">Pass by Quán Tiểu Bảo (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: au~`ByvosSn@KzAQ|BMbBK
      :start_location:
        :lat: 16.054727
        :lng: 108.2201332
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.05431
        :lng: 108.2190172
      :step_index: 0
      :step_interpolation: 0.7602414610108619
  :overview_polyline:
    :points: u|~`BinosSdDQx@K`BQz@Oj@SuD{DjC]`FY
  :summary: Phan Châu Trinh and Núi Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:06.767667', '2017-05-03 01:37:06.767667');
INSERT INTO distances VALUES (117, 61, 62, 672, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0529034
      :lng: 108.2211011
    :southwest:
      :lat: 16.046943
      :lng: 108.2204095
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 672
    :duration:
      :text: 2 mins
      :value: 111
    :end_address: 175 Núi Thành, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.046943
      :lng: 108.2211011
    :start_address: 142 Núi Thành, Hòa Thuận Đông, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0529034
      :lng: 108.2204095
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 672
      :duration:
        :text: 2 mins
        :value: 111
      :end_location:
        :lat: 16.046943
        :lng: 108.2211011
      :html_instructions: Head <b>south</b> on <b>Núi Thành</b><div style="font-size:0.9em">Go
        through 1 roundabout</div><div style="font-size:0.9em">Pass by Công ty TNHH
        Gia Linh (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :polyline:
        :points: si~`BqxosSt@GD?TA\CzAK~BKxEWbBMF@D?H?HANC@@@@@??@@?@??@@?@?@?@?@?@?@??A@?@??A@??A@?@A?A@AP@JANIVAtAInAGnCOjAG
      :start_location:
        :lat: 16.0529034
        :lng: 108.2204095
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: si~`BqxosShSkA`@?PADBF@NE@CR?ZKlBKjH_@
  :summary: Núi Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:07.300872', '2017-05-03 01:37:07.300872');
INSERT INTO distances VALUES (118, 62, 63, 1290, 13, '---
- :bounds:
    :northeast:
      :lat: 16.046943
      :lng: 108.2218488
    :southwest:
      :lat: 16.038996
      :lng: 108.2177581
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1290
    :duration:
      :text: 3 mins
      :value: 202
    :end_address: 76 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.038996
      :lng: 108.2180322
    :start_address: 175 Núi Thành, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.046943
      :lng: 108.2211011
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 683
      :duration:
        :text: 2 mins
        :value: 117
      :end_location:
        :lat: 16.0408411
        :lng: 108.2218488
      :html_instructions: Head <b>south</b> on <b>Núi Thành</b> toward <b>Tiểu La</b><div
        style="font-size:0.9em">Pass by Công ty thiết kế &amp; thi công nhà xinh -
        Danaxinh.com (on the right)</div>
      :polyline:
        :points: kd}`B{|osSFAfBK`CQdCOd@E|BO~CQ~BOnEYlAIhBI
      :start_location:
        :lat: 16.046943
        :lng: 108.2211011
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 422
      :duration:
        :text: 1 min
        :value: 53
      :end_location:
        :lat: 16.0404402
        :lng: 108.2179239
      :html_instructions: Turn <b>right</b> at Làm Chìa Khóa ÔTÔ onto <b>30 Tháng
        4</b><div style="font-size:0.9em">Pass by Báo Công Lý - Vpđd Miền Trung (on
        the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: g~{`BqapsSNjDH|ADnABd@Bn@PdDRbD@V
      :start_location:
        :lat: 16.0408411
        :lng: 108.2218488
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 185
      :duration:
        :text: 1 min
        :value: 32
      :end_location:
        :lat: 16.038996
        :lng: 108.2180322
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Lê Thanh
        Nghị</b><div style="font-size:0.9em">Pass by Cafe Thu Hà 113 Lê Thanh Nghị-Hàn
        Thuyên (on the right)</div><div style="font-size:0.9em">Destination will be
        on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: w{{`B_iosSA@?@?@A@?@?@?@@??@?@?@@@?@@??@@??@@??@@?@??@@?@?@?@?@?@?@?@A@??A@?@A@A?A@??A?A@??A?A?A?A?ArCQdBK
      :start_location:
        :lat: 16.0404402
        :lng: 108.2179239
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kd}`B{|osSnBMfGa@bMw@|Gc@hBINjDNlDFtAf@`JABAFFLLDLEDM?CxF]
  :summary: Núi Thành and 30 Tháng 4
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.046943
      :lng: 108.2211658
    :southwest:
      :lat: 16.038996
      :lng: 108.2171595
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.2 km
      :value: 1202
    :duration:
      :text: 4 mins
      :value: 211
    :end_address: 76 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.038996
      :lng: 108.2180322
    :start_address: 175 Núi Thành, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.046943
      :lng: 108.2211011
    :steps:
    - :distance:
        :text: 63 m
        :value: 63
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :html_instructions: Head <b>south</b> on <b>Núi Thành</b> toward <b>Tiểu La</b><div
        style="font-size:0.9em">Pass by Công ty thiết kế &amp; thi công nhà xinh -
        Danaxinh.com (on the right)</div>
      :polyline:
        :points: kd}`B{|osSFAfBK
      :start_location:
        :lat: 16.046943
        :lng: 108.2211011
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 455
      :duration:
        :text: 1 min
        :value: 73
      :end_location:
        :lat: 16.0448258
        :lng: 108.2172996
      :html_instructions: Turn <b>right</b> at Sai Gon Bank onto <b>Tiểu La</b><div
        style="font-size:0.9em">Pass by Công Ty Cp Vina Everest (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: "{`}`Bi}osSD`@D`@DXHVLXRVLPLRLVJb@Fh@Ff@Ft@Hd@HXN^HXFLDNFNf@zAZn@BH?LBF@DFJDDHF"
      :start_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :travel_mode: DRIVING
    - :distance:
        :text: 0.7 km
        :value: 684
      :duration:
        :text: 2 mins
        :value: 125
      :end_location:
        :lat: 16.038996
        :lng: 108.2180322
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Lê Thanh
        Nghị</b><div style="font-size:0.9em">Go through 1 roundabout</div><div style="font-size:0.9em">Pass
        by Coffee Nguyên (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ew|`BceosS?@?@?@?@@@?@?@@@?@@??@@@@@@??@@?@?@@@?@?@?@?@?@?@A@?@A@??A@??A@??A@??A?A@A?A?Af@Or@OfCSfBM@?vCO~DU\CvBK?@@??@?@?@@@?@@??@@??@@??@@?@??@@?@?@?@?@?@?@?@A@??A@?@A@A?A@??A?A@??A?A?A?A?ArCQdBK
      :start_location:
        :lat: 16.0448258
        :lng: 108.2172996
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0452375
        :lng: 108.218092
      :step_index: 1
      :step_interpolation: 0.7842225210113277
  :overview_polyline:
    :points: kd}`B{|osSnBMJbANp@`@p@Zd@Xz@NpAPzAj@`BL^f@zAZn@BVDLLPHF?D@B@FNHNCHOzA_@nFa@vJi@xBI?BBFDBN@JI@G?CxF_@
  :summary: Tiểu La and Lê Thanh Nghị
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.046943
      :lng: 108.2211658
    :southwest:
      :lat: 16.038996
      :lng: 108.2175181
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.2 km
      :value: 1230
    :duration:
      :text: 4 mins
      :value: 256
    :end_address: 76 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.038996
      :lng: 108.2180322
    :start_address: 175 Núi Thành, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.046943
      :lng: 108.2211011
    :steps:
    - :distance:
        :text: 63 m
        :value: 63
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :html_instructions: Head <b>south</b> on <b>Núi Thành</b> toward <b>Tiểu La</b><div
        style="font-size:0.9em">Pass by Công ty thiết kế &amp; thi công nhà xinh -
        Danaxinh.com (on the right)</div>
      :polyline:
        :points: kd}`B{|osSFAfBK
      :start_location:
        :lat: 16.046943
        :lng: 108.2211011
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 232
      :duration:
        :text: 1 min
        :value: 39
      :end_location:
        :lat: 16.0456795
        :lng: 108.2191607
      :html_instructions: Turn <b>right</b> at Sai Gon Bank onto <b>Tiểu La</b><div
        style="font-size:0.9em">Pass by Công Ty Cp Vina Everest (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: "{`}`Bi}osSD`@D`@DXHVLXRVLPLRLVJb@Fh@Ff@Ft@"
      :start_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 225
      :duration:
        :text: 1 min
        :value: 57
      :end_location:
        :lat: 16.0436607
        :lng: 108.2193507
      :html_instructions: Turn <b>left</b> at Cơ Sở Sửa Điện Lạnh Đình Nam onto <b>Lê
        Vĩnh Huy</b><div style="font-size:0.9em">Pass by Dịch Vụ Cưới Hạnh (on the
        left)</div>
      :maneuver: turn-left
      :polyline:
        :points: o||`BwposSvDUvAGbCG
      :start_location:
        :lat: 16.0456795
        :lng: 108.2191607
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 197
      :duration:
        :text: 1 min
        :value: 56
      :end_location:
        :lat: 16.043456
        :lng: 108.2175181
      :html_instructions: Turn <b>right</b> at Công Ty Cp A.V.A onto <b>Lê Bá Trinh</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa 66 (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: "{o|`B}qosSH|ABd@Bn@FlALjB"
      :start_location:
        :lat: 16.0436607
        :lng: 108.2193507
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 513
      :duration:
        :text: 2 mins
        :value: 91
      :end_location:
        :lat: 16.038996
        :lng: 108.2180322
      :html_instructions: Turn <b>left</b> at Công Ty Cp Lương Thực Ngon Sạch Bổ onto
        <b>Lê Thanh Nghị</b><div style="font-size:0.9em">Go through 1 roundabout</div><div
        style="font-size:0.9em">Pass by Cửa Hàng Thời Trang Sơ Ry (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: sn|`BofosSfBM@?vCO~DU\CvBK?@@??@?@?@@@?@@??@@??@@??@@?@??@@?@?@?@?@?@?@?@A@??A@?@A@A?A@??A?A@??A?A?A?A?ArCQdBK
      :start_location:
        :lat: 16.043456
        :lng: 108.2175181
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0445396
        :lng: 108.2192896
      :step_index: 2
      :step_interpolation: 0.5655569665561281
  :overview_polyline:
    :points: kd}`B{|osSnBMJbANp@`@p@Zd@Xz@NpAFt@vDUzEOLbCJ|BLjBfBMxCO|EYxBI@FDDLBLGBMxF_@
  :summary: Lê Thanh Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:07.538531', '2017-05-03 01:37:07.538531');
INSERT INTO distances VALUES (119, 63, 65, 962, 13, '---
- :bounds:
    :northeast:
      :lat: 16.038996
      :lng: 108.2190044
    :southwest:
      :lat: 16.030394
      :lng: 108.2180322
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 962
    :duration:
      :text: 3 mins
      :value: 178
    :end_address: Lê Thanh Nghị, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.030394
      :lng: 108.2190044
    :start_address: 76 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.038996
      :lng: 108.2180322
    :steps:
    - :distance:
        :text: 1.0 km
        :value: 962
      :duration:
        :text: 3 mins
        :value: 178
      :end_location:
        :lat: 16.030394
        :lng: 108.2190044
      :html_instructions: Head <b>south</b> on <b>Lê Thanh Nghị</b> toward <b>Nguyễn
        Cư Trinh</b><div style="font-size:0.9em">Pass by Đại Lý Sơn Phúc Quang Thịnh
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: wr{`BuiosSfAIj@EvDQdAI`BGbAGtCQhFW~CSvAIpAG`AGF?H?zCQjCQnAIJ?
      :start_location:
        :lat: 16.038996
        :lng: 108.2180322
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wr{`BuiosSrBO|F[dDO~Ji@jKm@xHc@zAI
  :summary: Lê Thanh Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:07.9835', '2017-05-03 01:37:07.9835');
INSERT INTO distances VALUES (120, 65, 66, 647, 13, '---
- :bounds:
    :northeast:
      :lat: 16.030394
      :lng: 108.2210036
    :southwest:
      :lat: 16.0258162
      :lng: 108.2190044
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 647
    :duration:
      :text: 1 min
      :value: 86
    :end_address: Cách Mạng Tháng 8, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0258162
      :lng: 108.2200717
    :start_address: Lê Thanh Nghị, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.030394
      :lng: 108.2190044
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 534
      :duration:
        :text: 1 min
        :value: 66
      :end_location:
        :lat: 16.0262876
        :lng: 108.2210036
      :html_instructions: Head <b>south</b> on <b>Lê Thanh Nghị</b> toward <b>Lê Nổ</b><div
        style="font-size:0.9em">Pass by Công Ty Quản Lý Cầu Đường Đà Nẵng (on the
        left)</div>
      :polyline:
        :points: "}|y`BwoosSjAIbBMXCvBMr@CdAKTAVCPGLEJIPMzEuFn@s@"
      :start_location:
        :lat: 16.030394
        :lng: 108.2190044
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 113
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0258162
        :lng: 108.2200717
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Cách
        Mạng Tháng 8</b>/<b>QL14B</b><div style="font-size:0.9em">Destination will
        be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: icy`Bg|osSN\lAzC
      :start_location:
        :lat: 16.0262876
        :lng: 108.2210036
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}|y`BwoosS`Ii@fDU^M\\WjGiH|AxD"
  :summary: Lê Thanh Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:08.403327', '2017-05-03 01:37:08.403327');
INSERT INTO distances VALUES (121, 66, 67, 654, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0258162
      :lng: 108.2200717
    :southwest:
      :lat: 16.0229033
      :lng: 108.2147533
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 654
    :duration:
      :text: 1 min
      :value: 63
    :end_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0229033
      :lng: 108.2147533
    :start_address: Cách Mạng Tháng 8, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0258162
      :lng: 108.2200717
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 654
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0229033
        :lng: 108.2147533
      :html_instructions: Head <b>southwest</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Vận Tải Quang Tính (on the right
        in 500&nbsp;m)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: k`y`BmvosSjBrEZv@Vj@Vh@vBxEnAfCVl@JRj@jA~@rBv@`B
      :start_location:
        :lat: 16.0258162
        :lng: 108.2200717
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: k`y`BmvosSvD`JjFbLbD`H
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:08.761207', '2017-05-03 01:37:08.761207');
INSERT INTO distances VALUES (122, 67, 68, 408, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0229033
      :lng: 108.2147533
    :southwest:
      :lat: 16.0206892
      :lng: 108.2117239
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 408
    :duration:
      :text: 1 min
      :value: 52
    :end_address: 99 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng 550000, Vietnam
    :end_location:
      :lat: 16.0206892
      :lng: 108.2117239
    :start_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0229033
      :lng: 108.2147533
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 408
      :duration:
        :text: 1 min
        :value: 52
      :end_location:
        :lat: 16.0206892
        :lng: 108.2117239
      :html_instructions: Head <b>southwest</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
        toward <b>Trần Phước Thành</b><div style="font-size:0.9em">Pass by Quán Cafe
        Giải Khát (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :polyline:
        :points: cnx`BeunsSHRh@hAT^JNFHR^b@l@f@t@r@`AtAfBt@dAn@~@JP
      :start_location:
        :lat: 16.0229033
        :lng: 108.2147533
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: cnx`BeunsSr@|A`@n@fBlChChDdBdCJP
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:09.171919', '2017-05-03 01:37:09.171919');
INSERT INTO distances VALUES (123, 68, 70, 1436, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0206892
      :lng: 108.2117239
    :southwest:
      :lat: 16.0119761
      :lng: 108.2047034
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.4 km
      :value: 1436
    :duration:
      :text: 4 mins
      :value: 226
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0119761
      :lng: 108.2056464
    :start_address: 99 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng 550000, Vietnam
    :start_location:
      :lat: 16.0206892
      :lng: 108.2117239
    :steps:
    - :distance:
        :text: 0.9 km
        :value: 860
      :duration:
        :text: 2 mins
        :value: 134
      :end_location:
        :lat: 16.0170055
        :lng: 108.2047034
      :html_instructions: Head <b>southwest</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
        toward <b>Nguyễn Hữu Thọ</b><div style="font-size:0.9em">Pass by Vườn Cây
        Kiểng Chín Sađéc (on the left)</div>
      :polyline:
        :points: i`x`BgbnsS^j@d@x@R^LTPVPVRTJRL\P^Pb@^lAZbA`@`BJ`@Nd@Rf@Xt@n@jAhB~CXf@Zh@Td@R`@Rd@Pj@Rp@VpALl@
      :start_location:
        :lat: 16.0206892
        :lng: 108.2117239
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 576
      :duration:
        :text: 2 mins
        :value: 92
      :end_location:
        :lat: 16.0119761
        :lng: 108.2056464
      :html_instructions: Turn <b>left</b> at Cửa Hàng Phụ Tùng Xe Máy Phùng La onto
        <b>Ông Ích Đường</b><div style="font-size:0.9em">Pass by 60 Ông Ích Đường
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-left
      :polyline:
        :points: iiw`BkvlsSPGn@Q|@[PEjAYrBa@|@Qr@MbB_@`AQX?j@A|CHP@dBBf@A
      :start_location:
        :lat: 16.0170055
        :lng: 108.2047034
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: i`x`BgbnsSdAdB`@t@bAxA^|@p@pBxAlFl@|AxCjF~AxCd@pAj@bCLl@PGlBm@|A_@pDs@vCm@`AQX?hEFP@lC@
  :summary: Cách Mạng Tháng 8/QL14B and Ông Ích Đường
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0206892
      :lng: 108.2120976
    :southwest:
      :lat: 16.0114871
      :lng: 108.2056464
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.5 km
      :value: 1464
    :duration:
      :text: 3 mins
      :value: 193
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0119761
      :lng: 108.2056464
    :start_address: 99 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng 550000, Vietnam
    :start_location:
      :lat: 16.0206892
      :lng: 108.2117239
    :steps:
    - :distance:
        :text: 67 m
        :value: 67
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.020335
        :lng: 108.2112136
      :html_instructions: Head <b>southwest</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
        toward <b>Nguyễn Hữu Thọ</b>
      :polyline:
        :points: i`x`BgbnsS^j@d@x@
      :start_location:
        :lat: 16.0206892
        :lng: 108.2117239
      :travel_mode: DRIVING
    - :distance:
        :text: 65 m
        :value: 65
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0198859
        :lng: 108.2112456
      :html_instructions: Turn <b>left</b> at Cà Phê Bamba onto <b>Cầu Nguyễn Tri
        Phương</b>
      :maneuver: turn-left
      :polyline:
        :points: c~w`Ba_nsSR^\Of@W
      :start_location:
        :lat: 16.020335
        :lng: 108.2112136
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 239
      :duration:
        :text: 1 min
        :value: 31
      :end_location:
        :lat: 16.0179428
        :lng: 108.2120976
      :html_instructions: Turn <b>right</b> at Chuyển Phát Nhanh Đà Nẵng onto <b>Nguyễn
        Hữu Thọ</b>
      :maneuver: turn-right
      :polyline:
        :points: i{w`Bi_nsSFBB@B@D@HAf@Q`DmAzCqA
      :start_location:
        :lat: 16.0198859
        :lng: 108.2112456
      :travel_mode: DRIVING
    - :distance:
        :text: 0.9 km
        :value: 851
      :duration:
        :text: 1 min
        :value: 79
      :end_location:
        :lat: 16.0117667
        :lng: 108.2074593
      :html_instructions: Turn <b>right</b> onto <b>Thăng Long</b><div style="font-size:0.9em">Pass
        by Quán Mô Đây (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: cow`BsdnsSLb@NTLPLJ`@VhEjCvA`AlDzBpCbBxFtDrBpAdDxB
      :start_location:
        :lat: 16.0179428
        :lng: 108.2120976
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 187
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0114871
        :lng: 108.205732
      :html_instructions: Turn <b>right</b> at Quán Hiền Lương onto <b>Hòa An 9</b><div
        style="font-size:0.9em">Pass by Quán Nhậu Thảo (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: qhv`BsgmsSLzAJnALhANbB
      :start_location:
        :lat: 16.0117667
        :lng: 108.2074593
      :travel_mode: DRIVING
    - :distance:
        :text: 55 m
        :value: 55
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0119761
        :lng: 108.2056464
      :html_instructions: Turn <b>right</b> at Dịch Vụ Nhà Đất Uy Tín onto <b>Ông
        Ích Đường</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: yfv`By|lsSc@HYB_@@C?
      :start_location:
        :lat: 16.0114871
        :lng: 108.205732
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0191258
        :lng: 108.211496
      :step_index: 2
      :step_interpolation: 0.3861802354926637
  :overview_polyline:
    :points: i`x`BgbnsSdAdBR^\Of@WFBFBN?hE_BzCqALb@\f@n@b@`HlE~H~ElJfGdDxBLzAXxCNbBc@Hy@DC?
  :summary: Thăng Long
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0206892
      :lng: 108.2117239
    :southwest:
      :lat: 16.0119761
      :lng: 108.2053894
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.5 km
      :value: 1487
    :duration:
      :text: 4 mins
      :value: 267
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0119761
      :lng: 108.2056464
    :start_address: 99 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng 550000, Vietnam
    :start_location:
      :lat: 16.0206892
      :lng: 108.2117239
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 510
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0184966
        :lng: 108.2075661
      :html_instructions: Head <b>southwest</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
        toward <b>Nguyễn Hữu Thọ</b><div style="font-size:0.9em">Pass by Vườn Cây
        Kiểng Chín Sađéc (on the left)</div>
      :polyline:
        :points: i`x`BgbnsS^j@d@x@R^LTPVPVRTJRL\P^Pb@^lAZbA`@`BJ`@Nd@Rf@Xt@n@jA
      :start_location:
        :lat: 16.0206892
        :lng: 108.2117239
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 222
      :duration:
        :text: 1 min
        :value: 51
      :end_location:
        :lat: 16.0168204
        :lng: 108.2086959
      :html_instructions: Turn <b>left</b> at Công Ty IN đẹp In Phun Quảng Cáo onto
        <b>Lương Định Của</b><div style="font-size:0.9em">Pass by Tiệm Rửa Xe Thành
        Phát (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: srw`BihmsSPIjAo@nAy@jAq@pAy@BA
      :start_location:
        :lat: 16.0184966
        :lng: 108.2075661
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 412
      :duration:
        :text: 1 min
        :value: 83
      :end_location:
        :lat: 16.0150145
        :lng: 108.2053894
      :html_instructions: Turn <b>right</b> at Cửa Hàng Vlxd Thiên Hồng onto <b>Phạm
        Tứ</b><div style="font-size:0.9em">Pass by Cửa Hàng Điện Tử Công Huy (on the
        left)</div>
      :maneuver: turn-right
      :polyline:
        :points: chw`BkomsSjBlDvBrD`@p@JLRZNTHPHr@^zB
      :start_location:
        :lat: 16.0168204
        :lng: 108.2086959
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 343
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.0119761
        :lng: 108.2056464
      :html_instructions: Turn <b>left</b> at Cà Phê Tĩnh Viên onto <b>Ông Ích Đường</b><div
        style="font-size:0.9em">Pass by Tiệm Vàng Hoa Kim Nguyên (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: y|v`BuzlsSr@MbB_@`AQX?j@A|CHP@dBBf@A
      :start_location:
        :lat: 16.0150145
        :lng: 108.2053894
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.01744
        :lng: 108.208272
      :step_index: 1
      :step_interpolation: 0.6287568352654335
  :overview_polyline:
    :points: i`x`BgbnsSdAdB`@t@bAxA^|@p@pBxAlFl@|An@jAPIzCiB|CkBBAjBlDxCdFx@pAh@nDvCm@`AQX?hEFP@lC@
  :summary: Cách Mạng Tháng 8/QL14B and Phạm Tứ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:09.422871', '2017-05-03 01:37:09.422871');
INSERT INTO distances VALUES (124, 70, 71, 1055, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0119761
      :lng: 108.2078934
    :southwest:
      :lat: 16.0030116
      :lng: 108.2056464
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.1 km
      :value: 1055
    :duration:
      :text: 2 mins
      :value: 112
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0030116
      :lng: 108.2071422
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0119761
      :lng: 108.2056464
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 135
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :html_instructions: Head <b>south</b> on <b>Ông Ích Đường</b> toward <b>Hòa
        An 9</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa Hoa (on the
        right)</div>
      :polyline:
        :points: "{iv`Bi|lsSB?^AXCb@If@QRINEv@Y"
      :start_location:
        :lat: 16.0119761
        :lng: 108.2056464
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 438
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :html_instructions: Continue onto <b>Cầu Cẩm Lệ</b><div style="font-size:0.9em">Pass
        by the bridge (on the left in 300&nbsp;m)</div>
      :polyline:
        :points: ubv`Bu~lsSfL{DtF_Cn@U
      :start_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 482
      :duration:
        :text: 1 min
        :value: 57
      :end_location:
        :lat: 16.0030116
        :lng: 108.2071422
      :html_instructions: Continue onto <b>Phạm Hùng</b><div style="font-size:0.9em">Pass
        by Cty VIỆT MAY (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: glu`BgimsSb@MPERC^G\AVAN?N?P@ZBRBTDlBXf@HtEt@dC^XDZDL@
      :start_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{iv`Bi|lsSb@A|@MbC{@fL{DtF_CrAc@d@I|@IhA?rDf@|KdBh@F"
  :summary: Cầu Cẩm Lệ and Phạm Hùng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:09.704382', '2017-05-03 01:37:09.704382');
INSERT INTO distances VALUES (125, 71, 72, 967, 13, '---
- :bounds:
    :northeast:
      :lat: 16.0030116
      :lng: 108.2073746
    :southwest:
      :lat: 15.9959816
      :lng: 108.2058809
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 967
    :duration:
      :text: 2 mins
      :value: 101
    :end_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :start_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0030116
      :lng: 108.2071422
    :steps:
    - :distance:
        :text: 0.8 km
        :value: 773
      :duration:
        :text: 1 min
        :value: 69
      :end_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :html_instructions: Head <b>south</b> on <b>Phạm Hùng</b> toward <b>Lê Đình
        Diên</b><div style="font-size:0.9em">Pass by Áo Cưới Bin Wedding (on the left)</div>
      :polyline:
        :points: yqt`BsemsSP@h@Dv@Dl@@V?Z?`DGz@AlBEvCIfCG|EGlCG|DK
      :start_location:
        :lat: 16.0030116
        :lng: 108.2071422
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 158
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :html_instructions: Turn <b>right</b> onto <b>Phan Văn Đáng</b>
      :maneuver: turn-right
      :polyline:
        :points: mfs`BagmsSPdH
      :start_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :travel_mode: DRIVING
    - :distance:
        :text: 36 m
        :value: 36
      :duration:
        :text: 1 min
        :value: 9
      :end_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :html_instructions: Turn <b>right</b> onto <b>Bàu Cầu 4</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: "{es`B{}lsS_AB"
      :start_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yqt`BsemsSz@FdBFpGIjR_@jISPdH_AB
  :summary: Phạm Hùng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:37:10.887244', '2017-05-03 01:37:10.887244');
INSERT INTO distances VALUES (489, 161, 162, 381, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0518313
      :lng: 108.2101174
    :southwest:
      :lat: 16.0492421
      :lng: 108.2088943
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 381
    :duration:
      :text: 1 min
      :value: 53
    :end_address: 36/12 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0492421
      :lng: 108.2093667
    :start_address: 217 Lê Đình Lý, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0518313
      :lng: 108.2101174
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 145
      :duration:
        :text: 1 min
        :value: 22
      :end_location:
        :lat: 16.0507611
        :lng: 108.2093622
      :html_instructions: Head <b>southwest</b> on <b>Lê Đình Lý</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Mtv Đại Mộc Xanh (on the right)</div>
      :polyline:
        :points: "}b~`BgxmsSzBtALP@@RRLHDB`@J"
      :start_location:
        :lat: 16.0518313
        :lng: 108.2101174
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 236
      :duration:
        :text: 1 min
        :value: 31
      :end_location:
        :lat: 16.0492421
        :lng: 108.2093667
      :html_instructions: At the roundabout, take the <b>4th</b> exit onto <b>Nguyễn
        Hữu Thọ</b><div style="font-size:0.9em">Pass by Công Ty Cp Sách &amp; Thiết
        Bị Giáo Dục Miền Trung (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: g|}`BosmsSCDAHAH?F?F@F?@BDBFBDDDBBDBD@DBD?D@D?D?B?DADABADABCBCBCBCBEBG@E@G?E?G?E`BIFAf@Cl@G
      :start_location:
        :lat: 16.0507611
        :lng: 108.2093622
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}b~`BgxmsSzBtALPTTRL`@JENAPDVPVVHT@TGNOJ[?S~DW"
  :summary: Lê Đình Lý and Nguyễn Hữu Thọ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:45.592396', '2017-05-03 02:16:45.592396');
INSERT INTO distances VALUES (490, 162, 163, 481, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0492421
      :lng: 108.2098915
    :southwest:
      :lat: 16.0449453
      :lng: 108.2093667
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 481
    :duration:
      :text: 1 min
      :value: 67
    :end_address: 198 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0449453
      :lng: 108.2098915
    :start_address: 36/12 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0492421
      :lng: 108.2093667
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 481
      :duration:
        :text: 1 min
        :value: 67
      :end_location:
        :lat: 16.0449453
        :lng: 108.2098915
      :html_instructions: Head <b>south</b> on <b>Nguyễn Hữu Thọ</b> toward <b>Trưng
        Nữ Vương</b><div style="font-size:0.9em">Pass by Công Ty Cp Xây Lắp Công Nghệ
        Tân Thịnh (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :polyline:
        :points: wr}`BqsmsStDYvAKjAItGa@bAG@?t@?lBM
      :start_location:
        :lat: 16.0492421
        :lng: 108.2093667
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wr}`BqsmsSlGe@`Jk@dAGt@?lBM
  :summary: Nguyễn Hữu Thọ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:45.981359', '2017-05-03 02:16:45.981359');
INSERT INTO distances VALUES (179, 74, 75, 495, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0164514
      :lng: 108.2057134
    :southwest:
      :lat: 16.0121132
      :lng: 108.2049303
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 495
    :duration:
      :text: 1 min
      :value: 83
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0164514
      :lng: 108.2049303
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0121132
      :lng: 108.2056407
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 495
      :duration:
        :text: 1 min
        :value: 83
      :end_location:
        :lat: 16.0164514
        :lng: 108.2049303
      :html_instructions: Head <b>north</b> on <b>Ông Ích Đường</b> toward <b>Hồ Đắc
        Di</b><div style="font-size:0.9em">Pass by Tiệm Áo Cưới Hồng Anh (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ujv`Bg|lsSM?eBCQA}CIk@@Y?aAPcB^s@L}@PsB`@kAXQDOF
      :start_location:
        :lat: 16.0121132
        :lng: 108.2056407
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ujv`Bg|lsSeCEiEGY?aAPwCl@qDr@mBf@
  :summary: Ông Ích Đường
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:09.655832', '2017-05-03 01:43:09.655832');
INSERT INTO distances VALUES (180, 75, 76, 661, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0193935
      :lng: 108.2097546
    :southwest:
      :lat: 16.0164514
      :lng: 108.204741
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 661
    :duration:
      :text: 2 mins
      :value: 108
    :end_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :end_location:
      :lat: 16.0193935
      :lng: 108.2097546
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0164514
      :lng: 108.2049303
    :steps:
    - :distance:
        :text: 56 m
        :value: 56
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0169161
        :lng: 108.204741
      :html_instructions: Head <b>northwest</b> on <b>Ông Ích Đường</b> toward <b>Cách
        Mạng Tháng 8</b>/<b>QL14B</b>
      :polyline:
        :points: yew`BywlsSm@Ro@P
      :start_location:
        :lat: 16.0164514
        :lng: 108.2049303
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 605
      :duration:
        :text: 2 mins
        :value: 91
      :end_location:
        :lat: 16.0193935
        :lng: 108.2097546
      :html_instructions: Turn <b>right</b> at Dịch Vụ Photocopy Thái Hòa onto <b>Cách
        Mạng Tháng 8</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Hiệu Buôn
        Ngọc Hạnh (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: whw`BsvlsSe@uBYeAM_@c@aAs@sAsAgCo@eAw@{AYu@Uk@Qo@iA{D
      :start_location:
        :lat: 16.0169161
        :lng: 108.204741
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yew`BywlsS}Ad@_A{Dq@aBgC{Eo@eAw@{Ao@aB{AkF
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:09.898647', '2017-05-03 01:43:09.898647');
INSERT INTO distances VALUES (491, 163, 164, 296, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0449453
      :lng: 108.211777
    :southwest:
      :lat: 16.0440118
      :lng: 108.2098915
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 296
    :duration:
      :text: 1 min
      :value: 59
    :end_address: Tiểu La, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.044204
      :lng: 108.211777
    :start_address: 198 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0449453
      :lng: 108.2098915
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 105
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0440118
        :lng: 108.2100063
      :html_instructions: Head <b>south</b> on <b>Nguyễn Hữu Thọ</b> toward <b>Tiểu
        La</b><div style="font-size:0.9em">Pass by Công Ty Cp Dịch Vụ Thương Mại &amp;
        Đầu Tư Vinagraft (on the right)</div>
      :polyline:
        :points: "}w|`ByvmsSXCjAGtAK"
      :start_location:
        :lat: 16.0449453
        :lng: 108.2098915
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 191
      :duration:
        :text: 1 min
        :value: 41
      :end_location:
        :lat: 16.044204
        :lng: 108.211777
      :html_instructions: Turn <b>left</b> at Cửa Hàng Tạp Hóa Diễm onto <b>Tiểu La</b><div
        style="font-size:0.9em">Pass by Cà Phê Ngẫu Nhiên (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: ar|`BqwmsSCWK}BIq@Cy@EkA?AAQ
      :start_location:
        :lat: 16.0440118
        :lng: 108.2100063
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}w|`ByvmsSdBKtAKCWK}BIq@IeCAS"
  :summary: Nguyễn Hữu Thọ and Tiểu La
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:46.237046', '2017-05-03 02:16:46.237046');
INSERT INTO distances VALUES (492, 164, 165, 421, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0444069
      :lng: 108.2135971
    :southwest:
      :lat: 16.0421349
      :lng: 108.211777
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 421
    :duration:
      :text: 1 min
      :value: 57
    :end_address: 59 Nguyễn Hữu Dật, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0421349
      :lng: 108.2135971
    :start_address: Tiểu La, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.044204
      :lng: 108.211777
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 167
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0444069
        :lng: 108.2133299
      :html_instructions: Head <b>east</b> on <b>Tiểu La</b> toward <b>Nguyễn Hữu
        Dật</b>
      :polyline:
        :points: gs|`BsbnsSi@uH
      :start_location:
        :lat: 16.044204
        :lng: 108.211777
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 254
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.0421349
        :lng: 108.2135971
      :html_instructions: Turn <b>right</b> at Quán Cafe Lô Cốt onto <b>Nguyễn Hữu
        Dật</b><div style="font-size:0.9em">Pass by Cơ Sở Đá Ốp Lát Thủy Thanh (on
        the right)</div><div style="font-size:0.9em">Destination will be on the left</div>
      :maneuver: turn-right
      :polyline:
        :points: qt|`BilnsSxAIdDQ@?`DUH?RADA
      :start_location:
        :lat: 16.0444069
        :lng: 108.2133299
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gs|`BsbnsSi@uHxAIfDQdEY
  :summary: Tiểu La and Nguyễn Hữu Dật
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:46.527765', '2017-05-03 02:16:46.527765');
INSERT INTO distances VALUES (177, 72, 73, 464, 14, '---
- :bounds:
    :northeast:
      :lat: 15.9984949
      :lng: 108.2073746
    :southwest:
      :lat: 15.9959816
      :lng: 108.2058809
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 464
    :duration:
      :text: 1 min
      :value: 65
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :start_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :steps:
    - :distance:
        :text: 36 m
        :value: 36
      :duration:
        :text: 1 min
        :value: 4
      :end_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :html_instructions: Head <b>south</b> on <b>Bàu Cầu 4</b> toward <b>Phan Văn
        Đáng</b>
      :polyline:
        :points: "{gs`Bw}lsS~@C"
      :start_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 158
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :html_instructions: Turn <b>left</b> onto <b>Phan Văn Đáng</b>
      :maneuver: turn-left
      :polyline:
        :points: "{es`B{}lsSQeH"
      :start_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 270
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :html_instructions: Turn <b>left</b> onto <b>Phạm Hùng</b><div style="font-size:0.9em">Pass
        by Thọ Tân Sơn (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mfs`BagmsS}DJmCFwCD
      :start_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{gs`Bw}lsS~@CQeHkIRwCD"
  :summary: Phan Văn Đáng and Phạm Hùng
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 15.9984949
      :lng: 108.2073062
    :southwest:
      :lat: 15.9963018
      :lng: 108.2058478
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 435
    :duration:
      :text: 2 mins
      :value: 96
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :start_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :steps:
    - :distance:
        :text: 64 m
        :value: 64
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :html_instructions: Head <b>north</b> on <b>Bàu Cầu 4</b> toward <b>Trần Văn
        Giàu</b>
      :polyline:
        :points: "{gs`Bw}lsSsBD"
      :start_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :travel_mode: DRIVING
    - :distance:
        :text: 33 m
        :value: 33
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :html_instructions: Turn <b>right</b> onto <b>Trần Văn Giàu</b>
      :maneuver: turn-right
      :polyline:
        :points: oks`Bq}lsSE}@
      :start_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 173
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 15.9970166
        :lng: 108.2073062
      :html_instructions: Turn <b>right</b> onto <b>Nguyễn Bảo</b>
      :maneuver: turn-right
      :polyline:
        :points: uks`Bo_msSNEBA@ABCN]h@{@DM@E?GAEACACCCCCcBkA
      :start_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 165
      :duration:
        :text: 1 min
        :value: 48
      :end_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :html_instructions: Turn <b>left</b> at Thọ Tân Sơn onto <b>Phạm Hùng</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Hoàng Tuấn Tú (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: kls`BufmsSmCFwCD
      :start_location:
        :lat: 15.9970166
        :lng: 108.2073062
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 15.9967767
        :lng: 108.2062375
      :step_index: 2
      :step_interpolation: 0.1006667809072486
  :overview_polyline:
    :points: "{gs`Bw}lsSsBDE}@RGDEx@yAFSAMKOcBkAmCFwCD"
  :summary: Nguyễn Bảo and Phạm Hùng
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 15.9984949
      :lng: 108.207272
    :southwest:
      :lat: 15.9963018
      :lng: 108.2058478
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 387
    :duration:
      :text: 2 mins
      :value: 106
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :start_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :steps:
    - :distance:
        :text: 64 m
        :value: 64
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :html_instructions: Head <b>north</b> on <b>Bàu Cầu 4</b> toward <b>Trần Văn
        Giàu</b>
      :polyline:
        :points: "{gs`Bw}lsSsBD"
      :start_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :travel_mode: DRIVING
    - :distance:
        :text: 33 m
        :value: 33
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :html_instructions: Turn <b>right</b> onto <b>Trần Văn Giàu</b>
      :maneuver: turn-right
      :polyline:
        :points: oks`Bq}lsSE}@
      :start_location:
        :lat: 15.9968808
        :lng: 108.2058478
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 22
      :end_location:
        :lat: 15.9976763
        :lng: 108.2061537
      :html_instructions: Turn <b>left</b> onto <b>Nguyễn Bảo</b>
      :maneuver: turn-left
      :polyline:
        :points: uks`Bo_msS}@B_@?{@A
      :start_location:
        :lat: 15.9969095
        :lng: 108.2061589
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 120
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 15.9977324
        :lng: 108.207272
      :html_instructions: Turn <b>right</b> onto <b>Đặng Hòa</b>
      :maneuver: turn-right
      :polyline:
        :points: ops`Bm_msSCoBEoB
      :start_location:
        :lat: 15.9976763
        :lng: 108.2061537
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Hoàng Tuấn Tú onto
        <b>Phạm Hùng</b><div style="font-size:0.9em">Pass by Shop Đĩa Thiên Hương
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-left
      :polyline:
        :points: yps`BmfmsSwCD
      :start_location:
        :lat: 15.9977324
        :lng: 108.207272
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 15.9975306
        :lng: 108.2061466
      :step_index: 2
      :step_interpolation: 0.8098967565064731
  :overview_polyline:
    :points: "{gs`Bw}lsSsBDE}@}AB{@ACoBEoBwCD"
  :summary: Đặng Hòa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:09.22079', '2017-05-03 01:43:09.22079');
INSERT INTO distances VALUES (178, 73, 74, 1574, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0121132
      :lng: 108.2078999
    :southwest:
      :lat: 15.9984949
      :lng: 108.2056407
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.6 km
      :value: 1574
    :duration:
      :text: 3 mins
      :value: 168
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0121132
      :lng: 108.2056407
    :start_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 15.9984949
      :lng: 108.2072406
    :steps:
    - :distance:
        :text: 1.0 km
        :value: 985
      :duration:
        :text: 2 mins
        :value: 105
      :end_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :html_instructions: Head <b>north</b> on <b>Phạm Hùng</b> toward <b>Mẹ Thứ</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Trang Trí Nội Thất Hiếu Phát (on
        the right)</div>
      :polyline:
        :points: qus`BgfmsSeA@gCFwCHmBD{@@aDF[?W?m@Aw@Ei@E_@C[EYEeC_@uEu@g@ImBYUESC[CQAO?O?W@]@_@FSBQDc@L
      :start_location:
        :lat: 15.9984949
        :lng: 108.2072406
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 438
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :html_instructions: Continue onto <b>Cầu Cẩm Lệ</b><div style="font-size:0.9em">Pass
        by the bridge (on the right)</div>
      :polyline:
        :points: glu`BgimsSo@TuF~BgLzD
      :start_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 151
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0121132
        :lng: 108.2056407
      :html_instructions: Continue onto <b>Ông Ích Đường</b><div style="font-size:0.9em">Pass
        by Cửa Hàng Tạp Hóa Hoa (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: ubv`Bu~lsSw@XODSHg@Pc@HYB_@@]@
      :start_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qus`BgfmsSsMXqGHeBGiAIqKaB_Em@m@E_@?u@Bs@Ju@ReHtCcOdFg@Pc@Hy@D]@
  :summary: Phạm Hùng and Cầu Cẩm Lệ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:09.45528', '2017-05-03 01:43:09.45528');
INSERT INTO distances VALUES (196, 91, 26, 472, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0842668
      :lng: 108.2237237
    :southwest:
      :lat: 16.0807474
      :lng: 108.2214247
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 472
    :duration:
      :text: 1 min
      :value: 52
    :end_address: 22 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0842668
      :lng: 108.2214247
    :start_address: 8 Bạch Đằng, Thạch Thang, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0807474
      :lng: 108.2237237
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 254
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0826783
        :lng: 108.2225864
      :html_instructions: Head <b>north</b> on <b>Bạch Đằng</b> toward <b>Như Nguyệt</b><div
        style="font-size:0.9em">Pass by Madame Lan Restaurant (on the left)</div>
      :polyline:
        :points: uwcaBgmpsS_BPa@@IBEBg@f@[Ra@Xm@`@eA|@UN
      :start_location:
        :lat: 16.0807474
        :lng: 108.2237237
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 218
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0842668
        :lng: 108.2214247
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>3 Tháng
        2</b><div style="font-size:0.9em">Pass by Cà Phê Cóc 08 (on the left)</div><div
        style="font-size:0.9em">Destination will be on the left</div>
      :maneuver: roundabout-right
      :polyline:
        :points: wcdaBefpsSC?A?A?C?A?C@A?A@A@A?A@C@?@ABA@aElCo@j@e@ZA@
      :start_location:
        :lat: 16.0826783
        :lng: 108.2225864
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: uwcaBgmpsSaCROFg@f@[RoAz@{AlAE?K@OLcEnCuAfAA@
  :summary: Bạch Đằng and 3 Tháng 2
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:18.896865', '2017-05-03 01:43:18.896865');
INSERT INTO distances VALUES (181, 76, 77, 654, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0227883
      :lng: 108.2147211
    :southwest:
      :lat: 16.0193935
      :lng: 108.2097546
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 654
    :duration:
      :text: 2 mins
      :value: 100
    :end_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0227883
      :lng: 108.2147211
    :start_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :start_location:
      :lat: 16.0193935
      :lng: 108.2097546
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 654
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0227883
        :lng: 108.2147211
      :html_instructions: Head <b>northeast</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
        toward <b>An Hòa 1</b><div style="font-size:0.9em">Pass by Cửa Hàng Nhân (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: exw`B}umsSi@eBGOO]We@e@aAKWW[i@{@m@y@a@q@kAwAs@aAUa@cByB{@iAEIQWQ[O_@Yk@
      :start_location:
        :lat: 16.0193935
        :lng: 108.2097546
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: exw`B}umsSq@uBg@cAq@yAaAwAoAkB_CyC{DoFc@s@i@kA
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:10.129786', '2017-05-03 01:43:10.129786');
INSERT INTO distances VALUES (182, 77, 78, 629, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0255552
      :lng: 108.219847
    :southwest:
      :lat: 16.0227883
      :lng: 108.2147211
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 629
    :duration:
      :text: 1 min
      :value: 62
    :end_address: Cách Mạng Tháng 8, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0255552
      :lng: 108.219847
    :start_address: 27 Cách Mạng Tháng 8, Thanh Khê, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0227883
      :lng: 108.2147211
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 629
      :duration:
        :text: 1 min
        :value: 62
      :end_location:
        :lat: 16.0255552
        :lng: 108.219847
      :html_instructions: Head <b>northeast</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Trung Tâm Hội Nghị Triển Lãm (on the right)</div>
      :polyline:
        :points: mmx`B_unsSIQaAuBMYmAsCISk@gAm@oAwAwCiAiCWq@Wm@K[q@gBMY
      :start_location:
        :lat: 16.0227883
        :lng: 108.2147211
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mmx`B_unsSgDuH{DcIaB{Dc@iA_AaC
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:10.363108', '2017-05-03 01:43:10.363108');
INSERT INTO distances VALUES (183, 78, 79, 712, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0301081
      :lng: 108.2212702
    :southwest:
      :lat: 16.0255552
      :lng: 108.2190406
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 712
    :duration:
      :text: 2 mins
      :value: 93
    :end_address: Lê Thanh Nghị, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0301081
      :lng: 108.2190406
    :start_address: Cách Mạng Tháng 8, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0255552
      :lng: 108.219847
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 128
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0260762
        :lng: 108.2209112
      :html_instructions: Head <b>northeast</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
      :polyline:
        :points: w~x`BauosSgBsE
      :start_location:
        :lat: 16.0255552
        :lng: 108.219847
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 584
      :duration:
        :text: 1 min
        :value: 76
      :end_location:
        :lat: 16.0301081
        :lng: 108.2190406
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Lê Thanh
        Nghị</b><div style="font-size:0.9em">Pass by Công Ty Cp Đầu Tư Xây Dựng Đại
        Hồng Phúc - Cn Đà Nẵng (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: _by`Bu{osSSi@Q]A@C?C@A@C@A@ABA@Pd@o@r@{EtFQLKHMDQFWBU@eAJs@BwBLYBcBLS@
      :start_location:
        :lat: 16.0260762
        :lng: 108.2209112
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: w~x`BauosS{B}FQ]A@G@EBCDA@Pd@kGhH]V_@Lm@DkG`@wBN
  :summary: Lê Thanh Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:10.596992', '2017-05-03 01:43:10.596992');
INSERT INTO distances VALUES (184, 79, 80, 1033, 14, '---
- :bounds:
    :northeast:
      :lat: 16.039344
      :lng: 108.2190406
    :southwest:
      :lat: 16.0301081
      :lng: 108.217989
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 1033
    :duration:
      :text: 3 mins
      :value: 186
    :end_address: 76 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.039344
      :lng: 108.217989
    :start_address: Lê Thanh Nghị, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0301081
      :lng: 108.2190406
    :steps:
    - :distance:
        :text: 1.0 km
        :value: 1033
      :duration:
        :text: 3 mins
        :value: 186
      :end_location:
        :lat: 16.039344
        :lng: 108.217989
      :html_instructions: Head <b>north</b> on <b>Lê Thanh Nghị</b> toward <b>Xô Viết
        Nghệ Tĩnh</b><div style="font-size:0.9em">Pass by Công Ty Thoát Nước &amp;
        Xử Lý Nước Thải Đà Nẵng - Trạm Xử Lý Nước Thải Hòa Cường (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: e{y`B_posScAFoAHkCP{CPI?G?aAFqAFwAH_DRiFVuCPcAFaBFeAHwDPk@DkCP
      :start_location:
        :lat: 16.0301081
        :lng: 108.2190406
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: e{y`B_posS{Lt@eDNwRfAcLj@wDV
  :summary: Lê Thanh Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:10.827015', '2017-05-03 01:43:10.827015');
INSERT INTO distances VALUES (185, 80, 81, 371, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0425493
      :lng: 108.217989
    :southwest:
      :lat: 16.039344
      :lng: 108.21763
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 371
    :duration:
      :text: 1 min
      :value: 59
    :end_address: 25 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0425493
      :lng: 108.21763
    :start_address: 76 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.039344
      :lng: 108.217989
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 371
      :duration:
        :text: 1 min
        :value: 59
      :end_location:
        :lat: 16.0425493
        :lng: 108.21763
      :html_instructions: Head <b>north</b> on <b>Lê Thanh Nghị</b> toward <b>Hàn
        Thuyên</b><div style="font-size:0.9em">Go through 1 roundabout</div><div style="font-size:0.9em">Pass
        by Hữu Giang (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: "{t{`BmiosSa@BsCP?A?AA??A?AAAAAAAAAA??AA?A?A?A?A?A?A?A?A@A??@A??@A??@A??@A@?@?@A@?@?@wBJ]B_ETkAF"
      :start_location:
        :lat: 16.039344
        :lng: 108.217989
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{t{`BmiosSuDRACCEMEMBGL?BaLl@"
  :summary: Lê Thanh Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:11.055887', '2017-05-03 01:43:11.055887');
INSERT INTO distances VALUES (186, 81, 82, 856, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0477636
      :lng: 108.2211658
    :southwest:
      :lat: 16.0425493
      :lng: 108.2173417
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 856
    :duration:
      :text: 3 mins
      :value: 160
    :end_address: 10 Núi Thành, Hải Châu, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0477636
      :lng: 108.2210139
    :start_address: 25 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0425493
      :lng: 108.21763
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 235
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0446364
        :lng: 108.2173671
      :html_instructions: Head <b>north</b> on <b>Lê Thanh Nghị</b> toward <b>Lê Bá
        Trinh</b><div style="font-size:0.9em">Pass by Cửa Hàng Thời Trang Sơ Ry (on
        the right)</div>
      :polyline:
        :points: "}h|`BegosSkAFA?gBLgCRs@No@E"
      :start_location:
        :lat: 16.0425493
        :lng: 108.21763
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 466
      :duration:
        :text: 1 min
        :value: 80
      :end_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Tiểu
        La</b><div style="font-size:0.9em">Pass by Chung cư Nguyễn Tri Phương (on
        the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: _v|`BqeosSAAA??AA?A?A??AA?A?A?A?A@A?A?QOMMECEACI[o@g@{AGOEOGMIYO_@IYIe@Gu@Gg@Gi@Kc@MWMSMQSWMYIWEYEa@Ea@
      :start_location:
        :lat: 16.0446364
        :lng: 108.2173671
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 155
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0477636
        :lng: 108.2210139
      :html_instructions: Turn <b>left</b> at Sai Gon Bank onto <b>Núi Thành</b><div
        style="font-size:0.9em">Pass by Cơ Sở Kỹ Nghệ Sắt Nhân Thành (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: "{`}`Bi}osSgBJsAHwAH"
      :start_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}h|`BegosS}Hh@s@No@ECCE?GAE@_@]KE_@y@}@iCYy@S_AO}AGi@Kc@[k@a@i@Wq@K{@Ea@gBJkDR"
  :summary: Lê Thanh Nghị and Tiểu La
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0477636
      :lng: 108.2211658
    :southwest:
      :lat: 16.0425493
      :lng: 108.2175181
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 917
    :duration:
      :text: 3 mins
      :value: 208
    :end_address: 10 Núi Thành, Hải Châu, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0477636
      :lng: 108.2210139
    :start_address: 25 Lê Thanh Nghị, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0425493
      :lng: 108.21763
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 102
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.043456
        :lng: 108.2175181
      :html_instructions: Head <b>north</b> on <b>Lê Thanh Nghị</b> toward <b>Lê Bá
        Trinh</b><div style="font-size:0.9em">Pass by Cửa Hàng Thời Trang Sơ Ry (on
        the right)</div>
      :polyline:
        :points: "}h|`BegosSkAFA?gBL"
      :start_location:
        :lat: 16.0425493
        :lng: 108.21763
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 101
      :duration:
        :text: 1 min
        :value: 33
      :end_location:
        :lat: 16.043566
        :lng: 108.2184533
      :html_instructions: Turn <b>right</b> at Công Ty Cp Lương Thực Ngon Sạch Bổ
        onto <b>Lê Bá Trinh</b><div style="font-size:0.9em">Pass by Cơm Bình dân Phương
        (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: sn|`BofosSMkBGmA
      :start_location:
        :lat: 16.043456
        :lng: 108.2175181
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 121
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0446427
        :lng: 108.218314
      :html_instructions: Turn <b>left</b> at Cửa Hàng Tạp Hóa 66 onto <b>Mai Dị</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa Dũng Hạnh (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: io|`BilosSuEZ
      :start_location:
        :lat: 16.043566
        :lng: 108.2184533
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 103
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0447566
        :lng: 108.2192719
      :html_instructions: Turn <b>right</b> at Công Ty Cp Văn Hiếu Mặt Trời onto <b>Dương
        Thưởng</b><div style="font-size:0.9em">Pass by Hair Salon Sài Gòn (on the
        right)</div>
      :maneuver: turn-right
      :polyline:
        :points: _v|`BmkosSEi@Ee@KoB
      :start_location:
        :lat: 16.0446427
        :lng: 108.218314
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 103
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0456795
        :lng: 108.2191607
      :html_instructions: Turn <b>left</b> at khóa thẻ từ khách sạn đà nẵng onto <b>Lê
        Vĩnh Huy</b><div style="font-size:0.9em">Pass by Dịch Vụ Cưới Hạnh (on the
        right)</div>
      :maneuver: turn-left
      :polyline:
        :points: wv|`BmqosSwDT
      :start_location:
        :lat: 16.0447566
        :lng: 108.2192719
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 232
      :duration:
        :text: 1 min
        :value: 51
      :end_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :html_instructions: Turn <b>right</b> at Cơ Sở Sửa Điện Lạnh Đình Nam onto <b>Tiểu
        La</b><div style="font-size:0.9em">Pass by Shop Thời Trang Seven (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: o||`BwposSGu@Gg@Gi@Kc@MWMSMQSWMYIWEYEa@Ea@
      :start_location:
        :lat: 16.0456795
        :lng: 108.2191607
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 155
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0477636
        :lng: 108.2210139
      :html_instructions: Turn <b>left</b> at Sai Gon Bank onto <b>Núi Thành</b><div
        style="font-size:0.9em">Pass by Cơ Sở Kỹ Nghệ Sắt Nhân Thành (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: "{`}`Bi}osSgBJsAHwAH"
      :start_location:
        :lat: 16.0463817
        :lng: 108.2211658
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0447296
        :lng: 108.2189911
      :step_index: 3
      :step_interpolation: 0.7077308422799232
  :overview_polyline:
    :points: "}h|`BegosSmAFgBLMkBGmAuEZKoAKoBwDTO}AGi@Kc@[k@a@i@Wq@K{@Ea@gBJkDR"
  :summary: Tiểu La
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:11.287295', '2017-05-03 01:43:11.287295');
INSERT INTO distances VALUES (187, 82, 83, 613, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0531539
      :lng: 108.2210139
    :southwest:
      :lat: 16.0477636
      :lng: 108.2203773
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 613
    :duration:
      :text: 2 mins
      :value: 108
    :end_address: 154 Núi Thành, Hải Châu, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0531539
      :lng: 108.2203773
    :start_address: 10 Núi Thành, Hải Châu, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0477636
      :lng: 108.2210139
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 613
      :duration:
        :text: 2 mins
        :value: 108
      :end_location:
        :lat: 16.0531539
        :lng: 108.2203773
      :html_instructions: Head <b>north</b> on <b>Núi Thành</b> toward <b>Duy Tân</b><div
        style="font-size:0.9em">Go through 1 roundabout</div><div style="font-size:0.9em">Pass
        by Quán Phở Đức Phương (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: oi}`Bi|osSw@DoAFuAHW@QEIAQA?AA??AA??AA??AA?AAA?AAA?A?A?A?A?A@A?A@A??@A?A@?@A@?@A@?@OBG@GBEDGDcBLyEV_CJ{AJ]BU@E?gBL
      :start_location:
        :lat: 16.0477636
        :lng: 108.2210139
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: oi}`Bi|osSuFXm@KEEOCMFCFWFMHGDcBLyIb@yBNcCN
  :summary: Núi Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:16.508856', '2017-05-03 01:43:16.508856');
INSERT INTO distances VALUES (188, 83, 84, 482, 14, '---
- :bounds:
    :northeast:
      :lat: 16.054727
      :lng: 108.2203773
    :southwest:
      :lat: 16.0528254
      :lng: 108.218082
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 482
    :duration:
      :text: 2 mins
      :value: 114
    :end_address: 267 Trưng Nữ Vương, Hòa Thuận Đông, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0528254
      :lng: 108.218082
    :start_address: 154 Núi Thành, Hải Châu, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0531539
      :lng: 108.2203773
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 177
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.054727
        :lng: 108.2201332
      :html_instructions: Head <b>north</b> on <b>Núi Thành</b> toward <b>Phan Thành
        Tài</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Khỏe Đẹp (on the
        right)</div>
      :polyline:
        :points: ek~`BkxosSq@D}BL{APo@J
      :start_location:
        :lat: 16.0531539
        :lng: 108.2203773
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 305
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0528254
        :lng: 108.218082
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Trung Quang onto <b>Trưng
        Nữ Vương</b><div style="font-size:0.9em">Pass by Quán Phở Thiên Phương (on
        the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: au~`ByvosStDzDFHt@z@v@x@nA|A
      :start_location:
        :lat: 16.054727
        :lng: 108.2201332
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ek~`BkxosSoDRkC\|DdElBtBnA|A
  :summary: Núi Thành and Trưng Nữ Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:16.718615', '2017-05-03 01:43:16.718615');
INSERT INTO distances VALUES (189, 84, 85, 486, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0564741
      :lng: 108.218082
    :southwest:
      :lat: 16.0525529
      :lng: 108.2171788
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 486
    :duration:
      :text: 2 mins
      :value: 109
    :end_address: 320 Hoàng Diệu, Bình Hiên, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0564741
      :lng: 108.2171788
    :start_address: 267 Trưng Nữ Vương, Hòa Thuận Đông, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0528254
      :lng: 108.218082
    :steps:
    - :distance:
        :text: 45 m
        :value: 45
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0525529
        :lng: 108.2177704
      :html_instructions: Head <b>southwest</b> on <b>Trưng Nữ Vương</b> toward <b>Hoàng
        Diệu</b><div style="font-size:0.9em">Pass by Zeeshop.Com (on the right)</div>
      :polyline:
        :points: ei~`B_josSv@|@
      :start_location:
        :lat: 16.0528254
        :lng: 108.218082
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 441
      :duration:
        :text: 2 mins
        :value: 97
      :end_location:
        :lat: 16.0564741
        :lng: 108.2171788
      :html_instructions: Turn <b>right</b> at Tiệm Sửa Xe Trung onto <b>Hoàng Diệu</b><div
        style="font-size:0.9em">Pass by Áo Cưới Ngọc Vân (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: mg~`BahosSeBLE?qD\UBwBR}@HeF^]Ba@B
      :start_location:
        :lat: 16.0525529
        :lng: 108.2177704
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ei~`B_josSv@|@eBLwD\mCVcHh@_AF
  :summary: Hoàng Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:17.264904', '2017-05-03 01:43:17.264904');
INSERT INTO distances VALUES (190, 85, 86, 377, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0598589
      :lng: 108.2171788
    :southwest:
      :lat: 16.0564741
      :lng: 108.2170594
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 377
    :duration:
      :text: 1 min
      :value: 83
    :end_address: 292 Hoàng Diệu, Nam Dương, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0598589
      :lng: 108.2170681
    :start_address: 320 Hoàng Diệu, Bình Hiên, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0564741
      :lng: 108.2171788
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 377
      :duration:
        :text: 1 min
        :value: 83
      :end_location:
        :lat: 16.0598589
        :lng: 108.2170681
      :html_instructions: Head <b>north</b> on <b>Hoàng Diệu</b> toward <b>Chu Văn
        An</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Thắng Thịnh Thành
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: "}__aBkdosSuAFaAAuB@qA@CAuBBmA?mAJo@A"
      :start_location:
        :lat: 16.0564741
        :lng: 108.2171788
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}__aBkdosSuAFaAAgEByB@mA?mAJo@A"
  :summary: Hoàng Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:17.47706', '2017-05-03 01:43:17.47706');
INSERT INTO distances VALUES (191, 86, 87, 954, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0664479
      :lng: 108.2208833
    :southwest:
      :lat: 16.0598589
      :lng: 108.2170681
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 954
    :duration:
      :text: 4 mins
      :value: 235
    :end_address: 221 Nguyễn Chí Thanh, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0664479
      :lng: 108.2208833
    :start_address: 292 Hoàng Diệu, Nam Dương, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0598589
      :lng: 108.2170681
    :steps:
    - :distance:
        :text: 92 m
        :value: 92
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0606773
        :lng: 108.2171341
      :html_instructions: Head <b>north</b> on <b>Hoàng Diệu</b> toward <b>K240 Hoàng
        Diệu</b><div style="font-size:0.9em">Pass by Cửa hàng đồ gỗ Hoàng Anh Gia
        Lai (on the right)</div>
      :polyline:
        :points: cu_aBucosSa@?gAAQEOAMAI?
      :start_location:
        :lat: 16.0598589
        :lng: 108.2170681
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 581
      :duration:
        :text: 2 mins
        :value: 112
      :end_location:
        :lat: 16.065288
        :lng: 108.2194388
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Hoàng Diệu</b><div style="font-size:0.9em">Pass by Trung Tâm Thông Tin
        Di Động Ht Mobile Khu Vực 2 (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: gz_aBadosS?AAAAAAAA??AA?A?A?AAA?A?A@A?A?A??@A?A??@QUECIEQEQEmBa@_B[iB]kAUIAa@Ma@USMMKkAy@i@_@qA}@IEmBkA
      :start_location:
        :lat: 16.0606773
        :lng: 108.2171341
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 141
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0651919
        :lng: 108.2207557
      :html_instructions: Turn <b>right</b> at Cửa Hàng Giới Thiệu Sản Phẩm Sữa Vinamik
        onto <b>Thái Phiên</b><div style="font-size:0.9em">Pass by Cơm gà A.Hải (on
        the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: aw`aBorosSBY@{ALqC
      :start_location:
        :lat: 16.065288
        :lng: 108.2194388
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 140
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0664479
        :lng: 108.2208833
      :html_instructions: Turn <b>left</b> at Mi Total onto <b>Nguyễn Chí Thanh</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Tm &amp; Dv Vận Tải Văn Lang
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-left
      :polyline:
        :points: mv`aBwzosS{COmAEAAO?
      :start_location:
        :lat: 16.0651919
        :lng: 108.2207557
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: cu_aBucosSiBAa@GYEECQAEBWY[KiIaBuAWcAc@wCsB{AcAmBkABY@{ALqCiFUQA
  :summary: Hoàng Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:17.705704', '2017-05-03 01:43:17.705704');
INSERT INTO distances VALUES (192, 87, 88, 316, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0685967
      :lng: 108.2218253
    :southwest:
      :lat: 16.0664479
      :lng: 108.2208833
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 316
    :duration:
      :text: 1 min
      :value: 70
    :end_address: 82A Hùng Vương, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0685967
      :lng: 108.2218253
    :start_address: 221 Nguyễn Chí Thanh, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0664479
      :lng: 108.2208833
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 239
      :duration:
        :text: 1 min
        :value: 49
      :end_location:
        :lat: 16.0685874
        :lng: 108.2211031
      :html_instructions: Head <b>north</b> on <b>Nguyễn Chí Thanh</b> toward <b>Phạm
        Hồng Thái</b><div style="font-size:0.9em">Pass by Cơm Gà Phì lũ (on the right)</div>
      :polyline:
        :points: i~`aBo{osSyAIiBGoACiACmAQ
      :start_location:
        :lat: 16.0664479
        :lng: 108.2208833
      :travel_mode: DRIVING
    - :distance:
        :text: 77 m
        :value: 77
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0685967
        :lng: 108.2218253
      :html_instructions: Turn <b>right</b> at Nhà hát Trưng Vương onto <b>Hùng Vương</b><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: ukaaB{|osSAqC
      :start_location:
        :lat: 16.0685874
        :lng: 108.2211031
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: i~`aBo{osS}IYmAQAqC
  :summary: Nguyễn Chí Thanh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:17.914102', '2017-05-03 01:43:17.914102');
INSERT INTO distances VALUES (193, 88, 89, 620, 14, '---
- :bounds:
    :northeast:
      :lat: 16.071095
      :lng: 108.2252239
    :southwest:
      :lat: 16.0685967
      :lng: 108.2218253
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 620
    :duration:
      :text: 2 mins
      :value: 126
    :end_address: 68 Bạch Đằng, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.071095
      :lng: 108.2252188
    :start_address: 82A Hùng Vương, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0685967
      :lng: 108.2218253
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 345
      :duration:
        :text: 1 min
        :value: 84
      :end_location:
        :lat: 16.0686303
        :lng: 108.2250569
      :html_instructions: Head <b>east</b> on <b>Hùng Vương</b> toward <b>Yên Bái</b><div
        style="font-size:0.9em">Pass by kim dung optic (on the left)</div>
      :polyline:
        :points: wkaaBmapsSAqD@qFA}@CcD
      :start_location:
        :lat: 16.0685967
        :lng: 108.2218253
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 275
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.071095
        :lng: 108.2252188
      :html_instructions: Turn <b>left</b> at Công Ty Cp Du Lịch Đà Nẵng (Danatour)
        onto <b>Bạch Đằng</b><div style="font-size:0.9em">Pass by 제주항공 다낭라운지 (on the
        right)</div>
      :maneuver: turn-left
      :polyline:
        :points: "}kaaBsupsSwCI_CEUAmDMQ?"
      :start_location:
        :lat: 16.0686303
        :lng: 108.2250569
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wkaaBmapsS?cLEaFwGOcEOQ?
  :summary: Hùng Vương and Bạch Đằng
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.071095
      :lng: 108.2252239
    :southwest:
      :lat: 16.0685967
      :lng: 108.2218253
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 640
    :duration:
      :text: 2 mins
      :value: 144
    :end_address: 68 Bạch Đằng, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.071095
      :lng: 108.2252188
    :start_address: 82A Hùng Vương, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0685967
      :lng: 108.2218253
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 95
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0686083
        :lng: 108.2227178
      :html_instructions: Head <b>east</b> on <b>Hùng Vương</b> toward <b>Yên Bái</b>
      :polyline:
        :points: wkaaBmapsSAqD
      :start_location:
        :lat: 16.0685967
        :lng: 108.2218253
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 197
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.070371
        :lng: 108.2228985
      :html_instructions: Turn <b>left</b> at Shb - Atm onto <b>Yên Bái</b><div style="font-size:0.9em">Pass
        by 峴港管鼻鸌飯店 (Fulmar Hotel Danang) (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: ykaaB_gpsS_Jc@
      :start_location:
        :lat: 16.0686083
        :lng: 108.2227178
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 242
      :duration:
        :text: 1 min
        :value: 66
      :end_location:
        :lat: 16.0701402
        :lng: 108.2251525
      :html_instructions: Turn <b>right</b> at Bin Bánh Mỳ Đà Nẵng onto <b>Phan Đình
        Phùng</b><div style="font-size:0.9em">Pass by Nha Nghi Hostel (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: yvaaBchpsSBg@JcBJ_BFiBHkB
      :start_location:
        :lat: 16.070371
        :lng: 108.2228985
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 106
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.071095
        :lng: 108.2252188
      :html_instructions: Turn <b>left</b> at Công Ty TNHH Truyền Thông Và Tổ Chức
        Sự Kiện Hoàng Hạo onto <b>Bạch Đằng</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: kuaaBevpsSmDMQ?
      :start_location:
        :lat: 16.0701402
        :lng: 108.2251525
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0694897
        :lng: 108.2228081
      :step_index: 1
      :step_interpolation: 0.5000000000000001
  :overview_polyline:
    :points: wkaaBmapsSAqD_Jc@NkCRiEHkBmDMQ?
  :summary: Yên Bái and Phan Đình Phùng
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.071095
      :lng: 108.2252188
    :southwest:
      :lat: 16.0678046
      :lng: 108.2218253
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 763
    :duration:
      :text: 3 mins
      :value: 157
    :end_address: 68 Bạch Đằng, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.071095
      :lng: 108.2252188
    :start_address: 82A Hùng Vương, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0685967
      :lng: 108.2218253
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 95
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0686083
        :lng: 108.2227178
      :html_instructions: Head <b>east</b> on <b>Hùng Vương</b> toward <b>Yên Bái</b>
      :polyline:
        :points: wkaaBmapsSAqD
      :start_location:
        :lat: 16.0685967
        :lng: 108.2218253
      :travel_mode: DRIVING
    - :distance:
        :text: 48 m
        :value: 48
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0681796
        :lng: 108.2226741
      :html_instructions: Turn <b>right</b> at Shb - Atm onto <b>Yên Bái</b>
      :maneuver: turn-right
      :polyline:
        :points: ykaaB_gpsStAH
      :start_location:
        :lat: 16.0686083
        :lng: 108.2227178
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 253
      :duration:
        :text: 1 min
        :value: 75
      :end_location:
        :lat: 16.0678046
        :lng: 108.2250095
      :html_instructions: Turn <b>left</b> at mắt kính chuyên nghiệp Phương Nam onto
        <b>Nguyễn Thái Học</b><div style="font-size:0.9em">Pass by Green Mango (on
        the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: ciaaBufpsSXkFp@gF
      :start_location:
        :lat: 16.0681796
        :lng: 108.2226741
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 367
      :duration:
        :text: 1 min
        :value: 54
      :end_location:
        :lat: 16.071095
        :lng: 108.2252188
      :html_instructions: Turn <b>left</b> at Aroi Dessert Cafe onto <b>Bạch Đằng</b><div
        style="font-size:0.9em">Pass by Cold Drink Vending Machine - Han Market -
        Minh Lam Vending Machine Co., Ltd (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: wfaaBiupsSyAEo@A[AwCI_CEUAmDMQ?
      :start_location:
        :lat: 16.0678046
        :lng: 108.2250095
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0681142
        :lng: 108.223264
      :step_index: 2
      :step_interpolation: 0.2504652820545733
  :overview_polyline:
    :points: wkaaBmapsSAqDtAHXkFp@gFiCGsDKuCG_EM
  :summary: Nguyễn Thái Học and Bạch Đằng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:18.163209', '2017-05-03 01:43:18.163209');
INSERT INTO distances VALUES (194, 89, 90, 717, 14, '---
- :bounds:
    :northeast:
      :lat: 16.0774493
      :lng: 108.2252188
    :southwest:
      :lat: 16.071095
      :lng: 108.2240824
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 717
    :duration:
      :text: 1 min
      :value: 79
    :end_address: 36 Bạch Đằng, Thạch Thang, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0774493
      :lng: 108.2240824
    :start_address: 68 Bạch Đằng, Hải Châu 1, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.071095
      :lng: 108.2252188
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 717
      :duration:
        :text: 1 min
        :value: 79
      :end_location:
        :lat: 16.0774493
        :lng: 108.2240824
      :html_instructions: Head <b>north</b> on <b>Bạch Đằng</b> toward <b>Quang Trung</b><div
        style="font-size:0.9em">Pass by ATM Vietinbank Đà Nẵng (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: k{aaBsvpsSU@g@Bm@DQBiAN{ARyGx@aFl@mBT}D^iDP
      :start_location:
        :lat: 16.071095
        :lng: 108.2252188
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: k{aaBsvpsS}BNaTjCkHt@iDP
  :summary: Bạch Đằng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 01:43:18.424208', '2017-05-03 01:43:18.424208');
INSERT INTO distances VALUES (493, 165, 166, 601, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0421349
      :lng: 108.214228
    :southwest:
      :lat: 16.0368903
      :lng: 108.2135971
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 601
    :duration:
      :text: 2 mins
      :value: 109
    :end_address: Huỳnh Tấn Phát, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0368903
      :lng: 108.214228
    :start_address: 59 Nguyễn Hữu Dật, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0421349
      :lng: 108.2135971
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 242
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0399759
        :lng: 108.2138535
      :html_instructions: Head <b>south</b> on <b>Nguyễn Hữu Dật</b> toward <b>Lê
        Khôi</b><div style="font-size:0.9em">Pass by Đại Lý Gạo Phương Nhi (on the
        right)</div>
      :polyline:
        :points: if|`B_nnsSd@CbCKfCSzBM
      :start_location:
        :lat: 16.0421349
        :lng: 108.2135971
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 359
      :duration:
        :text: 1 min
        :value: 75
      :end_location:
        :lat: 16.0368903
        :lng: 108.214228
      :html_instructions: At the roundabout, continue straight onto <b>Huỳnh Tấn Phát</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Xd Hoa Phú Long (on the right)</div><div
        style="font-size:0.9em">Destination will be on the left</div>
      :maneuver: roundabout-right
      :polyline:
        :points: "{x{`BqonsS@@?@?@@@?@@??@@??@@??@@?@?@@@?@?@?@?@A@?@??A@??A@??A@??A@A?A?A@A?A?AAAvCQvF[n@EbCQ"
      :start_location:
        :lat: 16.0399759
        :lng: 108.2138535
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: if|`B_nnsShDObGa@@@@DHFJ?HGBKtCSfHa@bCQ
  :summary: Nguyễn Hữu Dật and Huỳnh Tấn Phát
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:46.827237', '2017-05-03 02:16:46.827237');
INSERT INTO distances VALUES (494, 166, 167, 338, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0368903
      :lng: 108.2164492
    :southwest:
      :lat: 16.035886
      :lng: 108.214228
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 338
    :duration:
      :text: 1 min
      :value: 66
    :end_address: 110 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0360978
      :lng: 108.2164492
    :start_address: Huỳnh Tấn Phát, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0368903
      :lng: 108.214228
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 112
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.035886
        :lng: 108.2143517
      :html_instructions: Head <b>south</b> on <b>Huỳnh Tấn Phát</b> toward <b>Phan
        Đăng Lưu</b><div style="font-size:0.9em">Pass by Cà Phê 107 (on the right)</div>
      :polyline:
        :points: qe{`B}qnsSnAIvBM
      :start_location:
        :lat: 16.0368903
        :lng: 108.214228
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 226
      :duration:
        :text: 1 min
        :value: 39
      :end_location:
        :lat: 16.0360978
        :lng: 108.2164492
      :html_instructions: Turn <b>left</b> at Quán Nhậu Hải onto <b>Phan Đăng Lưu</b><div
        style="font-size:0.9em">Pass by Cà Phê Lá Xanh (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: i_{`BurnsS@[AYC[CYC]Ck@CaAGy@MqB
      :start_location:
        :lat: 16.035886
        :lng: 108.2143517
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qe{`B}qnsSfEW?u@O_CYmF
  :summary: Huỳnh Tấn Phát and Phan Đăng Lưu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:47.120276', '2017-05-03 02:16:47.120276');
INSERT INTO distances VALUES (495, 167, 168, 278, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0368329
      :lng: 108.2189167
    :southwest:
      :lat: 16.0360978
      :lng: 108.2164492
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 278
    :duration:
      :text: 1 min
      :value: 55
    :end_address: 90 Phan Đăng Lưu, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0368329
      :lng: 108.2189167
    :start_address: 110 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0360978
      :lng: 108.2164492
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 278
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0368329
        :lng: 108.2189167
      :html_instructions: Head <b>east</b> on <b>Phan Đăng Lưu</b> toward <b>Ngô Tất
        Tố</b><div style="font-size:0.9em">Pass by Cửa Hàng Nhôm Kính Đoàn Thanh Mau
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: s`{`By_osSQwCk@_BISMa@M_@Ka@G_@Kg@Ie@CO
      :start_location:
        :lat: 16.0360978
        :lng: 108.2164492
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: s`{`By_osSQwCk@_BWu@YaASgAMu@
  :summary: Phan Đăng Lưu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:47.419296', '2017-05-03 02:16:47.419296');
INSERT INTO distances VALUES (496, 168, 169, 262, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0373907
      :lng: 108.2212954
    :southwest:
      :lat: 16.0368329
      :lng: 108.2189167
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 262
    :duration:
      :text: 1 min
      :value: 45
    :end_address: 30 Phan Đăng Lưu, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0373907
      :lng: 108.2212954
    :start_address: 90 Phan Đăng Lưu, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0368329
      :lng: 108.2189167
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 262
      :duration:
        :text: 1 min
        :value: 45
      :end_location:
        :lat: 16.0373907
        :lng: 108.2212954
      :html_instructions: Head <b>east</b> on <b>Phan Đăng Lưu</b> toward <b>Phan
        Huy Ôn</b><div style="font-size:0.9em">Pass by Quán Phở Hồng (on the right)</div>
      :polyline:
        :points: ee{`BgoosSMo@AMKm@SqAAAQmAIg@CQEYMeAIs@
      :start_location:
        :lat: 16.0368329
        :lng: 108.2189167
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ee{`BgoosSqAgI]sC
  :summary: Phan Đăng Lưu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:47.725081', '2017-05-03 02:16:47.725081');
INSERT INTO distances VALUES (497, 169, 170, 447, 17, '---
- :bounds:
    :northeast:
      :lat: 16.0377395
      :lng: 108.2239231
    :southwest:
      :lat: 16.036093
      :lng: 108.2212954
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 447
    :duration:
      :text: 1 min
      :value: 87
    :end_address: 528 2 Tháng 9, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.036093
      :lng: 108.2239231
    :start_address: 30 Phan Đăng Lưu, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0373907
      :lng: 108.2212954
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 263
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0377395
        :lng: 108.2237231
      :html_instructions: Head <b>east</b> on <b>Phan Đăng Lưu</b> toward <b>Núi Thành</b><div
        style="font-size:0.9em">Pass by Tiệm Bánh Mì Ba Hưng (on the right)</div>
      :polyline:
        :points: uh{`Bc~osSe@yDG{@KaCKkB
      :start_location:
        :lat: 16.0373907
        :lng: 108.2212954
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 184
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.036093
        :lng: 108.2239231
      :html_instructions: Turn <b>right</b> at Cảnh sát PC&amp;CC Tp Đà Nẵng onto
        <b>2 Tháng 9</b><div style="font-size:0.9em">Pass by Tổng Công Ty Thép Việt
        Nam - Cn Miền Trung (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: "{j{`BgmpsSxAKtDU`@CVA"
      :start_location:
        :lat: 16.0377395
        :lng: 108.2237231
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: uh{`Bc~osSm@uFWmFhIg@
  :summary: Phan Đăng Lưu and 2 Tháng 9
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:48.029811', '2017-05-03 02:16:48.029811');
INSERT INTO distances VALUES (498, 170, 171, 2074, 17, '---
- :bounds:
    :northeast:
      :lat: 16.036093
      :lng: 108.2342867
    :southwest:
      :lat: 16.0327572
      :lng: 108.2239231
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 2.1 km
      :value: 2074
    :duration:
      :text: 4 mins
      :value: 246
    :end_address: 6 Nại Nam, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.034256
      :lng: 108.2293902
    :start_address: 528 2 Tháng 9, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.036093
      :lng: 108.2239231
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 313
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0332921
        :lng: 108.2242427
      :html_instructions: Head <b>south</b> on <b>2 Tháng 9</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Ô Tô Tứ Thọ (on the right)</div>
      :polyline:
        :points: q`{`BonpsSnES|AKtBQtAK@?r@A
      :start_location:
        :lat: 16.036093
        :lng: 108.2239231
      :travel_mode: DRIVING
    - :distance:
        :text: 1.2 km
        :value: 1174
      :duration:
        :text: 2 mins
        :value: 122
      :end_location:
        :lat: 16.0347787
        :lng: 108.2342492
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Quy
        Mỹ</b><div style="font-size:0.9em">Pass by Văn Phòng Đại Diện Ban Quản Lý
        Dự Án 85 - Đường Hồ Chí Minh (on the right in 300&nbsp;m)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: aoz`BoppsS@DBDBDBDBBDBFBD@D@B?D?B?D?DABABADC@ABCBC@CBC@C@E@E?E@C?E?EAEAEAE?CAA?CAAAAACCAAACAIuAUcBk@{EeB}Ms@_Gk@oFkBiP
      :start_location:
        :lat: 16.0332921
        :lng: 108.2242427
      :travel_mode: DRIVING
    - :distance:
        :text: 82 m
        :value: 82
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0352883
        :lng: 108.2339948
      :html_instructions: Turn <b>left</b> onto <b>Thăng Long</b>
      :maneuver: turn-left
      :polyline:
        :points: kxz`BaorsSQCQCM?M@K@I@CBC@EDABA@AB?B?FBR
      :start_location:
        :lat: 16.0347787
        :lng: 108.2342492
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 505
      :duration:
        :text: 1 min
        :value: 75
      :end_location:
        :lat: 16.034256
        :lng: 108.2293902
      :html_instructions: Continue onto <b>Nại Nam</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: q{z`BmmrsS^~Cp@bFh@tDb@`DXlBP`A@J
      :start_location:
        :lat: 16.0352883
        :lng: 108.2339948
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: q`{`BonpsSlH_@jE]t@ADJPRVFTANILODU?UEQEKECCAIuAaA_IyC}UwCyWc@G[@UBONCPb@rDzAxKpA|I
  :summary: Quy Mỹ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:16:48.3019', '2017-05-03 02:16:48.3019');
INSERT INTO distances VALUES (522, 171, 172, 895, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0362585
      :lng: 108.2293902
    :southwest:
      :lat: 16.0331869
      :lng: 108.2240265
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 895
    :duration:
      :text: 2 mins
      :value: 137
    :end_address: 528 2 Tháng 9, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0362585
      :lng: 108.2240265
    :start_address: 6 Nại Nam, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.034256
      :lng: 108.2293902
    :steps:
    - :distance:
        :text: 54 m
        :value: 54
      :duration:
        :text: 1 min
        :value: 9
      :end_location:
        :lat: 16.034122
        :lng: 108.2289009
      :html_instructions: Head <b>west</b> on <b>Nại Nam</b> toward <b>Phố Lotte</b>
      :polyline:
        :points: cuz`BupqsSJh@Nv@
      :start_location:
        :lat: 16.034256
        :lng: 108.2293902
      :travel_mode: DRIVING
    - :distance:
        :text: 13 m
        :value: 13
      :duration:
        :text: 1 min
        :value: 31
      :end_location:
        :lat: 16.0340108
        :lng: 108.2289208
      :html_instructions: Turn <b>left</b> at the 1st cross street onto <b>Phố Lotte</b>
      :maneuver: turn-left
      :polyline:
        :points: gtz`BsmqsSTC
      :start_location:
        :lat: 16.034122
        :lng: 108.2289009
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 474
      :duration:
        :text: 1 min
        :value: 59
      :end_location:
        :lat: 16.0331869
        :lng: 108.224571
      :html_instructions: Turn <b>right</b> onto <b>Tiên Sơn</b>/<b>QL14B</b>
      :maneuver: turn-right
      :polyline:
        :points: qsz`BwmqsSxChVHt@?dA
      :start_location:
        :lat: 16.0340108
        :lng: 108.2289208
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 354
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0362585
        :lng: 108.2240265
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>2 Tháng
        9</b><div style="font-size:0.9em">Pass by Khu bể bơi hành tích cao (on the
        right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: mnz`BqrpsSA@A?A@A@A@?@C@?@A??@A@?@A@?@?@?Bi@L]DyG`@oAFa@@kBJQ@
      :start_location:
        :lat: 16.0331869
        :lng: 108.224571
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: cuz`BupqsSZ`BTCxChVHt@?dAA@EBEFEJ?BgARwNv@Q@
  :summary: Tiên Sơn/QL14B and 2 Tháng 9
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0362585
      :lng: 108.2293902
    :southwest:
      :lat: 16.0332616
      :lng: 108.2240265
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 876
    :duration:
      :text: 3 mins
      :value: 157
    :end_address: 528 2 Tháng 9, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0362585
      :lng: 108.2240265
    :start_address: 6 Nại Nam, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.034256
      :lng: 108.2293902
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 533
      :duration:
        :text: 2 mins
        :value: 120
      :end_location:
        :lat: 16.0332561
        :lng: 108.2245097
      :html_instructions: Head <b>west</b> on <b>Nại Nam</b> toward <b>Phố Lotte</b>
      :polyline:
        :points: cuz`BupqsSJh@Nv@nAvKd@bEf@dEDb@Ff@
      :start_location:
        :lat: 16.034256
        :lng: 108.2293902
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 343
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0362585
        :lng: 108.2240265
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>2 Tháng
        9</b><div style="font-size:0.9em">Pass by Khu bể bơi hành tích cao (on the
        right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: "{nz`BerpsS?@A??@A@?@A@?@?@?Bi@L]DyG`@oAFa@@kBJQ@"
      :start_location:
        :lat: 16.0332561
        :lng: 108.2245097
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0334884
        :lng: 108.2256867
      :step_index: 0
      :step_interpolation: 0.7592304898987425
  :overview_polyline:
    :points: cuz`BupqsSZ`BtBzQt@rGEJ?BgARwNv@Q@
  :summary: Nại Nam and 2 Tháng 9
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0362585
      :lng: 108.2293902
    :southwest:
      :lat: 16.034122
      :lng: 108.2240265
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 814
    :duration:
      :text: 3 mins
      :value: 155
    :end_address: 528 2 Tháng 9, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0362585
      :lng: 108.2240265
    :start_address: 6 Nại Nam, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.034256
      :lng: 108.2293902
    :steps:
    - :distance:
        :text: 54 m
        :value: 54
      :duration:
        :text: 1 min
        :value: 9
      :end_location:
        :lat: 16.034122
        :lng: 108.2289009
      :html_instructions: Head <b>west</b> on <b>Nại Nam</b> toward <b>Phố Lotte</b>
      :polyline:
        :points: cuz`BupqsSJh@Nv@
      :start_location:
        :lat: 16.034256
        :lng: 108.2293902
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 177
      :duration:
        :text: 1 min
        :value: 62
      :end_location:
        :lat: 16.0356995
        :lng: 108.2286841
      :html_instructions: Turn <b>right</b> at the 1st cross street onto <b>Phố Lotte</b>
      :maneuver: turn-right
      :polyline:
        :points: gtz`BsmqsSa@B_EXyAL
      :start_location:
        :lat: 16.034122
        :lng: 108.2289009
      :travel_mode: DRIVING
    - :distance:
        :text: 46 m
        :value: 46
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 16.035657
        :lng: 108.2282603
      :html_instructions: Turn <b>left</b> at Vietinbank - ATM to stay on <b>Phố Lotte</b>
      :maneuver: turn-left
      :polyline:
        :points: c~z`BglqsSFrA
      :start_location:
        :lat: 16.0356995
        :lng: 108.2286841
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 193
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0358684
        :lng: 108.2266402
      :html_instructions: Continue straight
      :maneuver: straight
      :polyline:
        :points: "{}z`BsiqsSXhE@\\APENUb@MLIDO@"
      :start_location:
        :lat: 16.035657
        :lng: 108.2282603
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 273
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0356268
        :lng: 108.2240973
      :html_instructions: Turn <b>left</b> toward <b>2 Tháng 9</b>
      :maneuver: turn-left
      :polyline:
        :points: e_{`Bo_qsSRpE@TXrG
      :start_location:
        :lat: 16.0358684
        :lng: 108.2266402
      :travel_mode: DRIVING
    - :distance:
        :text: 71 m
        :value: 71
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0362585
        :lng: 108.2240265
      :html_instructions: Turn <b>right</b> onto <b>2 Tháng 9</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: u}z`BsopsSkBJQ@
      :start_location:
        :lat: 16.0356268
        :lng: 108.2240973
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0346858
        :lng: 108.2288242
      :step_index: 1
      :step_interpolation: 0.3573637041375971
  :overview_polyline:
    :points: cuz`BupqsSZ`BaF\yALFrAZfFG`@c@p@YFTfFXrGkBJQ@
  :summary: Phố Lotte
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:33.925013', '2017-05-03 02:21:33.925013');
INSERT INTO distances VALUES (523, 172, 173, 304, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0377553
      :lng: 108.2240265
    :southwest:
      :lat: 16.0362585
      :lng: 108.2225755
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 304
    :duration:
      :text: 1 min
      :value: 61
    :end_address: 185 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0376255
      :lng: 108.2225755
    :start_address: 528 2 Tháng 9, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0362585
      :lng: 108.2240265
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 168
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0377553
        :lng: 108.2238449
      :html_instructions: Head <b>north</b> on <b>2 Tháng 9</b>
      :polyline:
        :points: sa{`BeopsSoAHaCLqAJG@
      :start_location:
        :lat: 16.0362585
        :lng: 108.2240265
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 136
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.0376255
        :lng: 108.2225755
      :html_instructions: Turn <b>left</b> onto <b>Phan Đăng Lưu</b><div style="font-size:0.9em">Pass
        by Cảnh sát PC&amp;CC Tp Đà Nẵng (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: _k{`B_npsS@?@VJjBHvB
      :start_location:
        :lat: 16.0377553
        :lng: 108.2238449
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: sa{`BeopsSkHd@XzF
  :summary: 2 Tháng 9 and Phan Đăng Lưu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:34.276316', '2017-05-03 02:21:34.276316');
INSERT INTO distances VALUES (524, 173, 174, 315, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0376255
      :lng: 108.2225755
    :southwest:
      :lat: 16.0370299
      :lng: 108.2196984
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 315
    :duration:
      :text: 1 min
      :value: 60
    :end_address: 68 Phan Đăng Lưu, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0370299
      :lng: 108.2196984
    :start_address: 185 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0376255
      :lng: 108.2225755
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 315
      :duration:
        :text: 1 min
        :value: 60
      :end_location:
        :lat: 16.0370299
        :lng: 108.2196984
      :html_instructions: Head <b>west</b> on <b>Phan Đăng Lưu</b> toward <b>Núi Thành</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Đặc Sản Nhị An (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ej{`BcfpsS@HFz@n@lFLdADXBPHf@PlA@@F`@
      :start_location:
        :lat: 16.0376255
        :lng: 108.2225755
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ej{`BcfpsSHdA|@rHd@`DHb@
  :summary: Phan Đăng Lưu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:35.016474', '2017-05-03 02:21:35.016474');
INSERT INTO distances VALUES (525, 174, 175, 271, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0370299
      :lng: 108.2196984
    :southwest:
      :lat: 16.0362386
      :lng: 108.2173106
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 271
    :duration:
      :text: 1 min
      :value: 55
    :end_address: 110 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0362386
      :lng: 108.2173106
    :start_address: 68 Phan Đăng Lưu, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0370299
      :lng: 108.2196984
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 271
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0362386
        :lng: 108.2173106
      :html_instructions: Head <b>west</b> on <b>Phan Đăng Lưu</b> toward <b>Phan
        Huy Ôn</b><div style="font-size:0.9em">Pass by Cửa Hàng Đtdđ Ngọc Tú (on the
        right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: mf{`BctosSJn@Jl@@LP~@Hd@Jf@F^J`@L^L`@HR`@jA
      :start_location:
        :lat: 16.0370299
        :lng: 108.2196984
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mf{`BctosSj@jDTlAR`AfA`D
  :summary: Phan Đăng Lưu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:35.252118', '2017-05-03 02:21:35.252118');
INSERT INTO distances VALUES (526, 175, 176, 458, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0371198
      :lng: 108.2173106
    :southwest:
      :lat: 16.0358804
      :lng: 108.2141964
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 458
    :duration:
      :text: 1 min
      :value: 77
    :end_address: Huỳnh Tấn Phát, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0371198
      :lng: 108.2141964
    :start_address: 110 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0362386
      :lng: 108.2173106
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 320
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.035886
        :lng: 108.2143517
      :html_instructions: Head <b>southwest</b> on <b>Phan Đăng Lưu</b> toward <b>Ngô
        Tất Tố</b><div style="font-size:0.9em">Pass by Cà Phê Chuông Gió (on the right)</div>
      :polyline:
        :points: oa{`BeeosSHRPvCLpBFx@B`ABj@B\BXBZ@XAZ
      :start_location:
        :lat: 16.0362386
        :lng: 108.2173106
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 138
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0371198
        :lng: 108.2141964
      :html_instructions: Turn <b>right</b> at Quán Nhậu Hải onto <b>Huỳnh Tấn Phát</b><div
        style="font-size:0.9em">Pass by Cà Phê 107 (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: i_{`BurnsSwBL}BN
      :start_location:
        :lat: 16.035886
        :lng: 108.2143517
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: oa{`BeeosSHRPvCTjDNdDDt@AZwBL}BN
  :summary: Phan Đăng Lưu and Huỳnh Tấn Phát
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0371198
      :lng: 108.2173106
    :southwest:
      :lat: 16.0359918
      :lng: 108.2141964
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 454
    :duration:
      :text: 2 mins
      :value: 94
    :end_address: Huỳnh Tấn Phát, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0371198
      :lng: 108.2141964
    :start_address: 110 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0362386
      :lng: 108.2173106
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 187
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0359918
        :lng: 108.2155889
      :html_instructions: Head <b>southwest</b> on <b>Phan Đăng Lưu</b> toward <b>Ngô
        Tất Tố</b><div style="font-size:0.9em">Pass by Cà Phê Chuông Gió (on the right)</div>
      :polyline:
        :points: oa{`BeeosSHRPvCLpBFx@
      :start_location:
        :lat: 16.0362386
        :lng: 108.2173106
      :travel_mode: DRIVING
    - :distance:
        :text: 70 m
        :value: 70
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0366096
        :lng: 108.215456
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Cây Cảnh Văn Khoa onto
        <b>Trần Đức Thảo</b>
      :maneuver: turn-right
      :polyline:
        :points: "}_{`BmznsS{BX"
      :start_location:
        :lat: 16.0359918
        :lng: 108.2155889
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 126
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0364908
        :lng: 108.2142829
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Tm Dịch Vụ Sản Xuất Minh
        Chương - Kho Hàng toward <b>Huỳnh Tấn Phát</b><div style="font-size:0.9em">Pass
        by Đồng Phục Áo Thun (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: yc{`BsynsSD|@FjAFjA@T
      :start_location:
        :lat: 16.0366096
        :lng: 108.215456
      :travel_mode: DRIVING
    - :distance:
        :text: 71 m
        :value: 71
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0371198
        :lng: 108.2141964
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Tm Và Dv Thuyên Phương
        onto <b>Huỳnh Tấn Phát</b><div style="font-size:0.9em">Destination will be
        on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: ac{`BgrnsS}BN
      :start_location:
        :lat: 16.0364908
        :lng: 108.2142829
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0365944
        :lng: 108.2153007
      :step_index: 2
      :step_interpolation: 0.1322884146757516
  :overview_polyline:
    :points: oa{`BeeosSHRPvCTjD{BXD|@NvC@T}BN
  :summary: Phan Đăng Lưu
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0371198
      :lng: 108.2173106
    :southwest:
      :lat: 16.0361905
      :lng: 108.2141964
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 447
    :duration:
      :text: 2 mins
      :value: 110
    :end_address: Huỳnh Tấn Phát, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0371198
      :lng: 108.2141964
    :start_address: 110 Phan Đăng Lưu, Hòa Cường Nam, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0362386
      :lng: 108.2173106
    :steps:
    - :distance:
        :text: 12 m
        :value: 12
      :duration:
        :text: 1 min
        :value: 2
      :end_location:
        :lat: 16.0361905
        :lng: 108.2172058
      :html_instructions: Head <b>southwest</b> on <b>Phan Đăng Lưu</b> toward <b>Ngô
        Tất Tố</b>
      :polyline:
        :points: oa{`BeeosSHR
      :start_location:
        :lat: 16.0362386
        :lng: 108.2173106
      :travel_mode: DRIVING
    - :distance:
        :text: 92 m
        :value: 92
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0369053
        :lng: 108.2167702
      :html_instructions: Turn <b>right</b> at Công Ty Cp Vinaconex 25 onto <b>Ngô
        Tất Tố</b>
      :maneuver: turn-right
      :polyline:
        :points: ea{`BqdosSoCvA
      :start_location:
        :lat: 16.0361905
        :lng: 108.2172058
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 272
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0364908
        :lng: 108.2142829
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Du Lịch Bách Bảo Tùng toward
        <b>Huỳnh Tấn Phát</b><div style="font-size:0.9em">Pass by An Lạc (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: ue{`ByaosSPZHRHXD^NzCD|@FjAFjA@T
      :start_location:
        :lat: 16.0369053
        :lng: 108.2167702
      :travel_mode: DRIVING
    - :distance:
        :text: 71 m
        :value: 71
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0371198
        :lng: 108.2141964
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Tm Và Dv Thuyên Phương
        onto <b>Huỳnh Tấn Phát</b><div style="font-size:0.9em">Destination will be
        on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: ac{`BgrnsS}BN
      :start_location:
        :lat: 16.0364908
        :lng: 108.2142829
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0365479
        :lng: 108.216988
      :step_index: 1
      :step_interpolation: 0.5000000000000001
  :overview_polyline:
    :points: oa{`BeeosSHRoCvAZn@Nx@TxENvC@T}BN
  :summary: Ngô Tất Tố
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:35.752838', '2017-05-03 02:21:35.752838');
INSERT INTO distances VALUES (527, 176, 177, 513, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0416071
      :lng: 108.2141964
    :southwest:
      :lat: 16.0371198
      :lng: 108.2136503
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 513
    :duration:
      :text: 1 min
      :value: 86
    :end_address: 120 Nguyễn Hữu Dật, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0416071
      :lng: 108.2136503
    :start_address: Huỳnh Tấn Phát, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0371198
      :lng: 108.2141964
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 298
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0397851
        :lng: 108.2138763
      :html_instructions: Head <b>north</b> on <b>Huỳnh Tấn Phát</b> toward <b>Hàn
        Thuyên</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa Cô Thuận (on
        the left)</div>
      :polyline:
        :points: _g{`BwqnsSuAJo@DwFZwCP
      :start_location:
        :lat: 16.0371198
        :lng: 108.2141964
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 215
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0416071
        :lng: 108.2136503
      :html_instructions: At the roundabout, continue straight onto <b>Nguyễn Hữu
        Dật</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Kim Hoàn Ân (on
        the left)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: uw{`BwonsS?A?A?AA??AA??AA??AA??AA?A??AA?A?A?A?A?A??@A?A??@A?A@?@A??@A??@?@?@A@?@?@{BLgCRaAD
      :start_location:
        :lat: 16.0397851
        :lng: 108.2138763
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _g{`BwqnsSeCPoKl@?CCCIGK@IFAF?@eIh@
  :summary: Huỳnh Tấn Phát and Nguyễn Hữu Dật
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:36.039288', '2017-05-03 02:21:36.039288');
INSERT INTO distances VALUES (528, 177, 178, 331, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0444289
      :lng: 108.2136503
    :southwest:
      :lat: 16.0416071
      :lng: 108.2133299
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 331
    :duration:
      :text: 1 min
      :value: 49
    :end_address: Tiểu La, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0444289
      :lng: 108.2134945
    :start_address: 120 Nguyễn Hữu Dật, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0416071
      :lng: 108.2136503
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 313
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0444069
        :lng: 108.2133299
      :html_instructions: Head <b>north</b> on <b>Nguyễn Hữu Dật</b> toward <b>Lê
        Khôi</b><div style="font-size:0.9em">Pass by Dịch Vụ Internet Bom Bom (on
        the right)</div>
      :polyline:
        :points: ac|`BinnsSaADk@DS@I?aDTA?eDPyAH
      :start_location:
        :lat: 16.0416071
        :lng: 108.2136503
      :travel_mode: DRIVING
    - :distance:
        :text: 18 m
        :value: 18
      :duration:
        :text: 1 min
        :value: 6
      :end_location:
        :lat: 16.0444289
        :lng: 108.2134945
      :html_instructions: Turn <b>right</b> at Quán Cafe Lô Cốt onto <b>Tiểu La</b><div
        style="font-size:0.9em">Destination will be on the left</div>
      :maneuver: turn-right
      :polyline:
        :points: qt|`BilnsSC_@
      :start_location:
        :lat: 16.0444069
        :lng: 108.2133299
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ac|`BinnsSkCLcLp@C_@
  :summary: Nguyễn Hữu Dật
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:36.29034', '2017-05-03 02:21:36.29034');
INSERT INTO distances VALUES (529, 178, 179, 416, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0445154
      :lng: 108.2134945
    :southwest:
      :lat: 16.0440291
      :lng: 108.2100749
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 416
    :duration:
      :text: 1 min
      :value: 81
    :end_address: 198 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0445154
      :lng: 108.2100749
    :start_address: Tiểu La, Hòa Cường Bắc, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0444289
      :lng: 108.2134945
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 362
      :duration:
        :text: 1 min
        :value: 65
      :end_location:
        :lat: 16.0440291
        :lng: 108.2101318
      :html_instructions: Head <b>west</b> on <b>Tiểu La</b> toward <b>Nguyễn Hữu
        Dật</b><div style="font-size:0.9em">Pass by Phong thủy Thái An (on the right)</div>
      :polyline:
        :points: ut|`BimnsSB^j@fI?@DjABx@Hp@J|B
      :start_location:
        :lat: 16.0444289
        :lng: 108.2134945
      :travel_mode: DRIVING
    - :distance:
        :text: 54 m
        :value: 54
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0445154
        :lng: 108.2100749
      :html_instructions: Turn <b>right</b> at Quán Hùng Cường onto <b>Nguyễn Hữu
        Thọ</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: er|`BixmsSaBJ
      :start_location:
        :lat: 16.0440291
        :lng: 108.2101318
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ut|`BimnsSt@tLBx@Hp@J|BaBJ
  :summary: Tiểu La
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:36.560305', '2017-05-03 02:21:36.560305');
INSERT INTO distances VALUES (530, 179, 180, 495, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0489353
      :lng: 108.2100749
    :southwest:
      :lat: 16.0445154
      :lng: 108.2095696
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 495
    :duration:
      :text: 1 min
      :value: 63
    :end_address: 36/12 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0489353
      :lng: 108.2095696
    :start_address: 198 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0445154
      :lng: 108.2100749
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 495
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0489353
        :lng: 108.2095696
      :html_instructions: Head <b>north</b> on <b>Nguyễn Hữu Thọ</b> toward <b>Trưng
        Nữ Vương</b><div style="font-size:0.9em">Pass by Cửa Hàng Điện Cơ Thương (on
        the right)</div>
      :polyline:
        :points: gu|`B}wmsS_AFyCRc@Cs@FmHb@q@DgADyCR
      :start_location:
        :lat: 16.0445154
        :lng: 108.2100749
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gu|`B}wmsSyEZc@Cs@F_Jh@aFX
  :summary: Nguyễn Hữu Thọ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:37.100188', '2017-05-03 02:21:37.100188');
INSERT INTO distances VALUES (531, 180, 181, 327, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0516909
      :lng: 108.2100203
    :southwest:
      :lat: 16.0489353
      :lng: 108.2093992
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 327
    :duration:
      :text: 1 min
      :value: 44
    :end_address: 217 Lê Đình Lý, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0516909
      :lng: 108.2100203
    :start_address: 36/12 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0489353
      :lng: 108.2095696
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 149
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0502586
        :lng: 108.2093886
      :html_instructions: Head <b>north</b> on <b>Nguyễn Hữu Thọ</b><div style="font-size:0.9em">Pass
        by the gas station (on the right)</div>
      :polyline:
        :points: "{p}`BytmsS}AJ{@H{@BM?c@H"
      :start_location:
        :lat: 16.0489353
        :lng: 108.2095696
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 178
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0516909
        :lng: 108.2100203
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Lê Đình
        Lý</b><div style="font-size:0.9em">Pass by Phú Gia Thịnh (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: cy}`BusmsS?AAAA??AAAAAA?ACCACACACAEAC?CAC?A?C?A?A@C?A?C@a@IQGC?cAS_BaA
      :start_location:
        :lat: 16.0502586
        :lng: 108.2093886
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{p}`BytmsSyCTiABc@FCACEKG_@GI@e@GUGcAS_BaA"
  :summary: Nguyễn Hữu Thọ and Lê Đình Lý
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:37.416671', '2017-05-03 02:21:37.416671');
INSERT INTO distances VALUES (532, 181, 182, 418, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0550664
      :lng: 108.210535
    :southwest:
      :lat: 16.0516909
      :lng: 108.2096898
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 418
    :duration:
      :text: 1 min
      :value: 82
    :end_address: 203 Nguyễn Tri Phương, Hòa Thuận Tây, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0550664
      :lng: 108.2096898
    :start_address: 217 Lê Đình Lý, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0516909
      :lng: 108.2100203
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 99
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0524356
        :lng: 108.210535
      :html_instructions: Head <b>northeast</b> on <b>Lê Đình Lý</b> toward <b>Nguyễn
        Tri Phương</b>
      :polyline:
        :points: ab~`BswmsSuCgB
      :start_location:
        :lat: 16.0516909
        :lng: 108.2100203
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 319
      :duration:
        :text: 1 min
        :value: 65
      :end_location:
        :lat: 16.0550664
        :lng: 108.2096898
      :html_instructions: Turn <b>left</b> at Mắt Kính Đại Nam onto <b>Nguyễn Tri
        Phương</b><div style="font-size:0.9em">Pass by Tiệm Hớt Tóc Hoàng (on the
        right)</div>
      :maneuver: turn-left
      :polyline:
        :points: wf~`B{zmsSy@rAk@Jg@FO@q@Fu@FoBXaAHa@Ds@D
      :start_location:
        :lat: 16.0524356
        :lng: 108.210535
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ab~`BswmsSuCgBy@rAsARaAHeD`@wCT
  :summary: Nguyễn Tri Phương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:37.625359', '2017-05-03 02:21:37.625359');
INSERT INTO distances VALUES (533, 182, 183, 539, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0581216
      :lng: 108.2101141
    :southwest:
      :lat: 16.0550664
      :lng: 108.2086215
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 539
    :duration:
      :text: 2 mins
      :value: 126
    :end_address: 42 Phạm Văn Nghị, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0581216
      :lng: 108.2097101
    :start_address: 203 Nguyễn Tri Phương, Hòa Thuận Tây, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0550664
      :lng: 108.2096898
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 207
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0564561
        :lng: 108.2086215
      :html_instructions: Head <b>north</b> on <b>Nguyễn Tri Phương</b> toward <b>K
        118 Lê Đình Lý</b>/<b>K 147 Nguyễn Tri Phương</b><div style="font-size:0.9em">Pass
        by Remax (on the right)</div>
      :polyline:
        :points: ew~`BqumsSc@Be@B_@DWFQLOJKJGHS\u@~AEDEDGD
      :start_location:
        :lat: 16.0550664
        :lng: 108.2096898
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 162
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.0566517
        :lng: 108.2101141
      :html_instructions: Turn <b>right</b> at Quán Nhậu 105 onto <b>Phạm Văn Nghị</b><div
        style="font-size:0.9em">Pass by Hair Salon Tường Vy (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: "{__aB{nmsS@q@?_@Aa@K}@E_@EYEUCQCU"
      :start_location:
        :lat: 16.0564561
        :lng: 108.2086215
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 170
      :duration:
        :text: 1 min
        :value: 45
      :end_location:
        :lat: 16.0581216
        :lng: 108.2097101
      :html_instructions: Turn <b>left</b> at Chợ Tân Lập to stay on <b>Phạm Văn Nghị</b><div
        style="font-size:0.9em">Pass by Phòng Chẩn Trị Đông Y Tư Nhân Hoàng Anh Đường
        (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: aa_aBexmsSaAJ}@JI@SD[FYHk@LC@a@L
      :start_location:
        :lat: 16.0566517
        :lng: 108.2101141
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ew~`BqumsSiAFw@La@XSTiA|BKJGD@q@AaAQ}AKo@Gg@_CVsAXqA\
  :summary: Nguyễn Tri Phương and Phạm Văn Nghị
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:42.884577', '2017-05-03 02:21:42.884577');
INSERT INTO distances VALUES (445, 99, 100, 1284, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0812632
      :lng: 108.2351987
    :southwest:
      :lat: 16.0714978
      :lng: 108.2303098
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1284
    :duration:
      :text: 3 mins
      :value: 154
    :end_address: 496 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0714978
      :lng: 108.2309724
    :start_address: 374 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0812632
      :lng: 108.2351987
    :steps:
    - :distance:
        :text: 1.1 km
        :value: 1069
      :duration:
        :text: 2 mins
        :value: 124
      :end_location:
        :lat: 16.0732223
        :lng: 108.2304298
      :html_instructions: Head <b>southwest</b> toward <b>Lưu Hữu Phước</b><div style="font-size:0.9em">Pass
        by Cà Phê Hồng Ân (on the right)</div>
      :polyline:
        :points: "{zcaB_ursSlBfBzBrBnCvC~BxB`Az@tArAv@n@|@r@j@Zb@VhA`@~Af@`@JpAT`BXXDzANvAHtA?h@@J?B?D?BA@?@?@?@A"
      :start_location:
        :lat: 16.0812632
        :lng: 108.2351987
      :travel_mode: DRIVING
    - :distance:
        :text: 11 m
        :value: 11
      :duration:
        :text: 1 min
        :value: 2
      :end_location:
        :lat: 16.0731276
        :lng: 108.230402
      :html_instructions: Slight <b>right</b> at Công Ty Ô Tô Thịnh Hưng onto <b>Ngô
        Quyền</b>/<b>QL14B</b>
      :maneuver: turn-slight-right
      :polyline:
        :points: shbaBewqsSPD
      :start_location:
        :lat: 16.0732223
        :lng: 108.2304298
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 204
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0714978
        :lng: 108.2309724
      :html_instructions: At the roundabout, take the <b>3rd</b> exit and stay on
        <b>Ngô Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Destination will
        be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ahbaB_wqsSHDDBHBJBX?\Cd@EVI`@OFG\_@JKLKTKp@S
      :start_location:
        :lat: 16.0731276
        :lng: 108.230402
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{zcaB_ursShFzEnCvC~BxBvCnCtBbBnAr@hA`@~Af@rB`@zB^zANvAH~B@XAFAZJNFd@BbAIx@Yd@g@XWfA_@"
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:45.626675', '2017-05-03 02:10:45.626675');
INSERT INTO distances VALUES (534, 183, 184, 279, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0606089
      :lng: 108.2097101
    :southwest:
      :lat: 16.0581216
      :lng: 108.2093648
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 279
    :duration:
      :text: 1 min
      :value: 87
    :end_address: 146 Phan Thanh, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0606089
      :lng: 108.2093648
    :start_address: 42 Phạm Văn Nghị, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0581216
      :lng: 108.2097101
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 173
      :duration:
        :text: 1 min
        :value: 50
      :end_location:
        :lat: 16.0596572
        :lng: 108.2094533
      :html_instructions: Head <b>north</b> on <b>Phạm Văn Nghị</b> toward <b>Trần
        Tống</b><div style="font-size:0.9em">Pass by Quán Bún Bò (on the left)</div>
      :polyline:
        :points: gj_aBuumsSE@[HUDO@qAFG@M@[BgBN
      :start_location:
        :lat: 16.0581216
        :lng: 108.2097101
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 106
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0606089
        :lng: 108.2093648
      :html_instructions: At Cửa Hàng Toàn Mỹ, continue onto <b>Phan Thanh</b><div
        style="font-size:0.9em">Pass by Cà Phê Linda (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: "{s_aBatmsSS@sAFY@SBg@@"
      :start_location:
        :lat: 16.0596572
        :lng: 108.2094533
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gj_aBuumsSgARcCN{BPmBH{@D
  :summary: Phạm Văn Nghị and Phan Thanh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:43.246499', '2017-05-03 02:21:43.246499');
INSERT INTO distances VALUES (535, 184, 185, 486, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0647483
      :lng: 108.2093648
    :southwest:
      :lat: 16.0606089
      :lng: 108.2080322
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 486
    :duration:
      :text: 2 mins
      :value: 116
    :end_address: 132 Phan Thanh, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0647483
      :lng: 108.2080322
    :start_address: 146 Phan Thanh, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0606089
      :lng: 108.2093648
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 486
      :duration:
        :text: 2 mins
        :value: 116
      :end_location:
        :lat: 16.0647483
        :lng: 108.2080322
      :html_instructions: Head <b>north</b> on <b>Phan Thanh</b> toward <b>K 144 Phan
        Thanh</b><div style="font-size:0.9em">Pass by GUU Store (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: yy_aBosmsSI?q@By@LI@gANiBPa@Jg@LSF]H[JSDgBb@[JWHi@VYL]PWLWH[FSB
      :start_location:
        :lat: 16.0606089
        :lng: 108.2093648
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yy_aBosmsS{@BcANqD`@iAXaBb@cCn@aA`@w@^WLWHo@J
  :summary: Phan Thanh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:43.833807', '2017-05-03 02:21:43.833807');
INSERT INTO distances VALUES (536, 185, 186, 189, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0661587
      :lng: 108.2080322
    :southwest:
      :lat: 16.0647483
      :lng: 108.2074748
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 189
    :duration:
      :text: 1 min
      :value: 45
    :end_address: 101 Lý Thái Tổ, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0661457
      :lng: 108.2074748
    :start_address: 132 Phan Thanh, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0647483
      :lng: 108.2080322
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 160
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0661587
        :lng: 108.2077487
      :html_instructions: Head <b>north</b> on <b>Phan Thanh</b> toward <b>K 40 Phan
        Thanh</b><div style="font-size:0.9em">Pass by Cà Phê Như Ý (on the left)</div>
      :polyline:
        :points: us`aBekmsS_@Di@BM?aEl@
      :start_location:
        :lat: 16.0647483
        :lng: 108.2080322
      :travel_mode: DRIVING
    - :distance:
        :text: 29 m
        :value: 29
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.0661457
        :lng: 108.2074748
      :html_instructions: Turn <b>left</b> at Tiệm Mì Thu onto <b>Lý Thái Tổ</b>
      :maneuver: turn-left
      :polyline:
        :points: o|`aBmimsS@v@
      :start_location:
        :lat: 16.0661587
        :lng: 108.2077487
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: us`aBekmsSiAHoEl@@v@
  :summary: Phan Thanh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:44.12129', '2017-05-03 02:21:44.12129');
INSERT INTO distances VALUES (537, 186, 187, 518, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0683117
      :lng: 108.2074748
    :southwest:
      :lat: 16.0660502
      :lng: 108.2049392
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 518
    :duration:
      :text: 2 mins
      :value: 94
    :end_address: 361 Hải Phòng, Chính Gián, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0683117
      :lng: 108.2049392
    :start_address: 101 Lý Thái Tổ, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0661457
      :lng: 108.2074748
    :steps:
    - :distance:
        :text: 70 m
        :value: 70
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.06615
        :lng: 108.2068245
      :html_instructions: Head <b>west</b> on <b>Lý Thái Tổ</b>
      :polyline:
        :points: m|`aBugmsS@f@AxA
      :start_location:
        :lat: 16.0661457
        :lng: 108.2074748
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 199
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0660826
        :lng: 108.2051051
      :html_instructions: At the roundabout, continue straight onto <b>Điện Biên Phủ</b><div
        style="font-size:0.9em">Pass by the church (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: m|`aBscmsS?AA?A?A??@A?A?A@A??@?@A??@?@A@?@@@?@?@@??@?@@?@@@?@??@@?@?@ADPDn@B^Cd@@\B\@f@Gt@@X
      :start_location:
        :lat: 16.06615
        :lng: 108.2068245
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 249
      :duration:
        :text: 1 min
        :value: 49
      :end_location:
        :lat: 16.0683117
        :lng: 108.2049392
      :html_instructions: Turn <b>right</b> at Eximbank - Atm onto <b>Hải Phòng</b><div
        style="font-size:0.9em">Pass by Bún Thịt Nướng Quán Xuân (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: _|`aB}xlsScEHO@iDNWBW@O?
      :start_location:
        :lat: 16.0660826
        :lng: 108.2051051
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: m|`aBugmsS?~BA?C?EBEJBFDBD@@AJ`AB^Cd@Dz@@f@Gt@@XcEHyDPo@DO?
  :summary: Điện Biên Phủ and Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:44.478158', '2017-05-03 02:21:44.478158');
INSERT INTO distances VALUES (538, 187, 188, 561, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0708302
      :lng: 108.2089264
    :southwest:
      :lat: 16.0683117
      :lng: 108.2049392
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 561
    :duration:
      :text: 2 mins
      :value: 91
    :end_address: 279 Hải Phòng, Tân Chính, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0708302
      :lng: 108.2089264
    :start_address: 361 Hải Phòng, Chính Gián, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0683117
      :lng: 108.2049392
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 561
      :duration:
        :text: 2 mins
        :value: 91
      :end_location:
        :lat: 16.0708302
        :lng: 108.2089264
      :html_instructions: Head <b>north</b> on <b>Hải Phòng</b> toward <b>K 300 Hải
        Phòng</b><div style="font-size:0.9em">Pass by Cà Phê Hoàng (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: "}iaaB{wlsS[?S?QAOCUCSGIGGCa@WGCs@c@{@w@OQOQMU]k@]y@Oi@Ou@K_BAKQ_BEc@CMCWE[Gm@CUEQ"
      :start_location:
        :lat: 16.0683117
        :lng: 108.2049392
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}iaaB{wlsSo@?a@Ei@KQKi@[s@c@{@w@_@c@k@aA]y@Oi@Ou@K_BSkBIq@UwBEQ"
  :summary: Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:44.838193', '2017-05-03 02:21:44.838193');
INSERT INTO distances VALUES (539, 188, 189, 221, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0712354
      :lng: 108.2109508
    :southwest:
      :lat: 16.0708302
      :lng: 108.2089264
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 221
    :duration:
      :text: 1 min
      :value: 46
    :end_address: 239 Hải Phòng, Tân Chính, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0712354
      :lng: 108.2109508
    :start_address: 279 Hải Phòng, Tân Chính, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0708302
      :lng: 108.2089264
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 221
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0712354
        :lng: 108.2109508
      :html_instructions: Head <b>east</b> on <b>Hải Phòng</b> toward <b>Hoàng Hoa
        Thám</b><div style="font-size:0.9em">Pass by Nhà May Thùy Dung (on the left)</div>
      :polyline:
        :points: uyaaBypmsSOs@Gw@Im@WsCESQqA
      :start_location:
        :lat: 16.0708302
        :lng: 108.2089264
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: uyaaBypmsSOs@Gw@a@aEWeB
  :summary: Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:45.192876', '2017-05-03 02:21:45.192876');
INSERT INTO distances VALUES (540, 189, 190, 610, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0749763
      :lng: 108.2131579
    :southwest:
      :lat: 16.0712354
      :lng: 108.2109508
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 610
    :duration:
      :text: 3 mins
      :value: 163
    :end_address: 103-105 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0749763
      :lng: 108.2125689
    :start_address: 239 Hải Phòng, Tân Chính, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0712354
      :lng: 108.2109508
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 242
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0717202
        :lng: 108.2131579
      :html_instructions: Head <b>east</b> on <b>Hải Phòng</b> toward <b>K223 Hải
        Phòng</b><div style="font-size:0.9em">Pass by Cà Phê 190 (on the right)</div>
      :polyline:
        :points: g|aaBm}msSKw@WgBg@iDSoB
      :start_location:
        :lat: 16.0712354
        :lng: 108.2109508
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 368
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.0749763
        :lng: 108.2125689
      :html_instructions: Turn <b>left</b> at Trung Tâm Thương Mại Dệt May onto <b>Ông
        Ích Khiêm</b><div style="font-size:0.9em">Pass by Cửa Hàng Lan Nhi (on the
        right)</div>
      :maneuver: turn-left
      :polyline:
        :points: g_baBgknsS}ANU@]?qDb@{CZkC\_@D
      :start_location:
        :lat: 16.0717202
        :lng: 108.2131579
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: g|aaBm}msSc@_D{@yGsBP]?qDb@gHx@_@D
  :summary: Hải Phòng and Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:45.476835', '2017-05-03 02:21:45.476835');
INSERT INTO distances VALUES (541, 190, 191, 370, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0782388
      :lng: 108.2125689
    :southwest:
      :lat: 16.0749763
      :lng: 108.2119098
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 370
    :duration:
      :text: 1 min
      :value: 67
    :end_address: 44-48 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0782388
      :lng: 108.2119098
    :start_address: 103-105 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0749763
      :lng: 108.2125689
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 370
      :duration:
        :text: 1 min
        :value: 67
      :end_location:
        :lat: 16.0782388
        :lng: 108.2119098
      :html_instructions: Head <b>north</b> on <b>Ông Ích Khiêm</b> toward <b>K33
        Ông ích Khiêm</b><div style="font-size:0.9em">Pass by Shop Hoa Ry Cây (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ssbaBqgnsSu@JuAT}ANO@mAN]Hs@HG?k@Hg@DYD{BT
      :start_location:
        :lat: 16.0749763
        :lng: 108.2125689
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ssbaBqgnsSkC`@mBPkBX{@HiFj@
  :summary: Ông Ích Khiêm
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:45.814763', '2017-05-03 02:21:45.814763');
INSERT INTO distances VALUES (542, 191, 192, 348, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0809369
      :lng: 108.2119098
    :southwest:
      :lat: 16.0782388
      :lng: 108.2110514
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 348
    :duration:
      :text: 1 min
      :value: 87
    :end_address: Nguyễn Tất Thành, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0809369
      :lng: 108.2115638
    :start_address: 44-48 Ông Ích Khiêm, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0782388
      :lng: 108.2119098
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 260
      :duration:
        :text: 1 min
        :value: 66
      :end_location:
        :lat: 16.080317
        :lng: 108.2110514
      :html_instructions: Head <b>north</b> on <b>Ông Ích Khiêm</b> toward <b>K18
        Ông Ích Khiêm</b><div style="font-size:0.9em">Pass by Cà Phê 17 (on the left)</div>
      :polyline:
        :points: _hcaBmcnsS]DUDoAJe@@aANA?k@De@Nk@n@s@z@
      :start_location:
        :lat: 16.0782388
        :lng: 108.2119098
      :travel_mode: DRIVING
    - :distance:
        :text: 88 m
        :value: 88
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0809369
        :lng: 108.2115638
      :html_instructions: Turn <b>right</b> at Nhà Hàng Phố Biển onto <b>Nguyễn Tất
        Thành</b><div style="font-size:0.9em">Pass by Công Ty Cp Hóa Chất Dịch Vụ
        Ngân Hải (on the left)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: _ucaBa~msSsAeAg@_@
      :start_location:
        :lat: 16.080317
        :lng: 108.2110514
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _hcaBmcnsSs@JoAJe@@cANk@De@N_BjB{BeB
  :summary: Ông Ích Khiêm and Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:46.166827', '2017-05-03 02:21:46.166827');
INSERT INTO distances VALUES (451, 105, 106, 615, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0477396
      :lng: 108.2406433
    :southwest:
      :lat: 16.0427005
      :lng: 108.2385553
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 615
    :duration:
      :text: 1 min
      :value: 87
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0427005
      :lng: 108.2406433
    :start_address: 59 Ngũ Hành Sơn, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0477396
      :lng: 108.2385553
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 358
      :duration:
        :text: 1 min
        :value: 45
      :end_location:
        :lat: 16.0447277
        :lng: 108.2396989
      :html_instructions: Head <b>south</b> on <b>Ngũ Hành Sơn</b>/<b>QL14B</b> toward
        <b>Hàm Tử</b><div style="font-size:0.9em">Pass by Dịch Vụ Photocopy Khánh
        (on the right)</div>
      :polyline:
        :points: ki}`B_jssSz@Q~AUvAYj@Mb@Md@MtBy@xB}@
      :start_location:
        :lat: 16.0477396
        :lng: 108.2385553
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 257
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0427005
        :lng: 108.2406433
      :html_instructions: Continue straight past CÔNG TY TNHH MTV NHÂN HÒA onto <b>Ngũ
        Hành Sơn</b><div style="font-size:0.9em">Pass by Quán Cơm Gà Quay Thành Nhân
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: straight
      :polyline:
        :points: qv|`BcqssSFPNK`Bq@`@QlBw@dAc@~@_@DA
      :start_location:
        :lat: 16.0447277
        :lng: 108.2396989
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ki}`B_jssSzCg@bCg@hA[nFwBFPNKbCcAxF}B
  :summary: Ngũ Hành Sơn/QL14B and Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.047711
      :lng: 108.2406433
    :southwest:
      :lat: 16.0427005
      :lng: 108.2384562
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 606
    :duration:
      :text: 2 mins
      :value: 93
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0427005
      :lng: 108.2406433
    :start_address: 59 Ngũ Hành Sơn, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.047711
      :lng: 108.2384562
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 359
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.044694
        :lng: 108.2396144
      :html_instructions: Head <b>south</b> on <b>Ngũ Hành Sơn</b> toward <b>Hàm Tử</b><div
        style="font-size:0.9em">Pass by Cửa hàng Giao dịch Viettel Ngũ Hành Sơn (on
        the left)</div>
      :polyline:
        :points: ei}`BkissSz@Q|AYfDw@`AY|Am@|@]z@[
      :start_location:
        :lat: 16.047711
        :lng: 108.2384562
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 247
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0427005
        :lng: 108.2406433
      :html_instructions: Continue straight to stay on <b>Ngũ Hành Sơn</b><div style="font-size:0.9em">Pass
        by Quán Cơm Gà Quay Thành Nhân (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: straight
      :polyline:
        :points: iv|`BqpssSNK`Bq@`@QlBw@dAc@~@_@DA
      :start_location:
        :lat: 16.044694
        :lng: 108.2396144
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0448433
        :lng: 108.2395438
      :step_index: 0
      :step_interpolation: 0.9491270241014348
  :overview_polyline:
    :points: ei}`BkissSxCk@hFqAvEgB`GgCjCeA
  :summary: Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:47.316839', '2017-05-03 02:10:47.316839');
INSERT INTO distances VALUES (543, 192, 193, 466, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0844982
      :lng: 108.2138105
    :southwest:
      :lat: 16.0809369
      :lng: 108.2115638
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 466
    :duration:
      :text: 1 min
      :value: 47
    :end_address: 77 Nguyễn Tất Thành, Thanh Bình, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0844982
      :lng: 108.2138105
    :start_address: Nguyễn Tất Thành, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0809369
      :lng: 108.2115638
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 466
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.0844982
        :lng: 108.2138105
      :html_instructions: Head <b>northeast</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Hải Sơn</b><div style="font-size:0.9em">Pass by D.Ae Jang Gum (on the right)</div>
      :polyline:
        :points: "{xcaBgansSq@i@gBsAOOQOOKk@a@k@]QKUK_@S{@]i@UKCSMgAa@}Am@o@U"
      :start_location:
        :lat: 16.0809369
        :lng: 108.2115638
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{xcaBgansS{D}C{@m@}@i@u@_@eBs@eEaBo@U"
  :summary: Nguyễn Tất Thành
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:46.521548', '2017-05-03 02:21:46.521548');
INSERT INTO distances VALUES (544, 193, 194, 498, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0874235
      :lng: 108.2163942
    :southwest:
      :lat: 16.0844982
      :lng: 108.2138105
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 498
    :duration:
      :text: 1 min
      :value: 55
    :end_address: 140 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0868937
      :lng: 108.2163942
    :start_address: 77 Nguyễn Tất Thành, Thanh Bình, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0844982
      :lng: 108.2138105
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 355
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0874055
        :lng: 108.2151928
      :html_instructions: Head <b>northeast</b> on <b>Nguyễn Tất Thành</b> toward
        <b>Hàn Mặc Tử</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Khách
        Sạn Minh Ty (on the right)</div>
      :polyline:
        :points: codaBionsSm@UqCeAkBo@mFqBk@U
      :start_location:
        :lat: 16.0844982
        :lng: 108.2138105
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 143
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0868937
        :lng: 108.2163942
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>3 Tháng
        2</b><div style="font-size:0.9em">Pass by Hội Sinh Vật Cảnh Thành Phố Đà Nẵng
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: iaeaB}wnsS?A?A?A?AAA?A?AA?\y@X}@JYZ{@JS
      :start_location:
        :lat: 16.0874055
        :lng: 108.2151928
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: codaBionsS_E{AyIaDk@W?CAG`AqCf@oA
  :summary: Nguyễn Tất Thành and 3 Tháng 2
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:47.565621', '2017-05-03 02:21:47.565621');
INSERT INTO distances VALUES (545, 194, 27, 651, 18, '---
- :bounds:
    :northeast:
      :lat: 16.0870588
      :lng: 108.2204859
    :southwest:
      :lat: 16.0854032
      :lng: 108.2163942
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 651
    :duration:
      :text: 2 mins
      :value: 119
    :end_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.086579
      :lng: 108.2204171
    :start_address: 140 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0868937
      :lng: 108.2163942
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 371
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.0854032
        :lng: 108.2195007
      :html_instructions: Head <b>southeast</b> on <b>3 Tháng 2</b> toward <b>Lê Khắc
        Cần</b><div style="font-size:0.9em">Pass by Trúc Vàng Quán (on the right)</div>
      :polyline:
        :points: a~daBm_osSXw@\w@|BcG^}@@Ad@uAj@cB
      :start_location:
        :lat: 16.0868937
        :lng: 108.2163942
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 195
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Mtv Tư Vấn Thiết Kế Xây
        Dựng Art Thi onto <b>Xuân Diệu</b><div style="font-size:0.9em">Pass by Cafe
        Monza (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: wtdaB{rosSUI}Am@{A]_@Iw@Oc@E
      :start_location:
        :lat: 16.0854032
        :lng: 108.2195007
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.086579
        :lng: 108.2204171
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Đinh Công Tráng</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: c_eaBqvosSD[@M@CBM@E@CBCBABANAJ?VHHBB?
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: a~daBm_osStEqLf@wAj@cBUI}Am@{A]wAYc@ED[BQJ[FCZAd@L
  :summary: 3 Tháng 2 and Xuân Diệu
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0870588
      :lng: 108.2204859
    :southwest:
      :lat: 16.0859765
      :lng: 108.2163942
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 649
    :duration:
      :text: 2 mins
      :value: 141
    :end_address: Đinh Công Tráng, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.086579
      :lng: 108.2204171
    :start_address: 140 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0868937
      :lng: 108.2163942
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 223
      :duration:
        :text: 1 min
        :value: 32
      :end_location:
        :lat: 16.0859765
        :lng: 108.2182546
      :html_instructions: Head <b>southeast</b> on <b>3 Tháng 2</b> toward <b>Lê Khắc
        Cần</b><div style="font-size:0.9em">Pass by Trúc Vàng Quán (on the right)</div>
      :polyline:
        :points: a~daBm_osSXw@\w@|BcG
      :start_location:
        :lat: 16.0868937
        :lng: 108.2163942
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 127
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0870201
        :lng: 108.2187389
      :html_instructions: Turn <b>left</b> at Dntn Lệ Nim - Cơ Sở 2 onto <b>Võ Thị
        Sáu</b>
      :maneuver: turn-left
      :polyline:
        :points: kxdaBakosSQIoAa@YIsAk@
      :start_location:
        :lat: 16.0859765
        :lng: 108.2182546
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 143
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0864373
        :lng: 108.2199348
      :html_instructions: Turn <b>right</b> at Cửa Hàng Văn Phòng Phẩm 16 onto <b>Nguyễn
        Hữu Cảnh</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Thương Mại Dịch
        Vụ Bách An Nam (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: "{~daBcnosSrBmF"
      :start_location:
        :lat: 16.0870201
        :lng: 108.2187389
      :travel_mode: DRIVING
    - :distance:
        :text: 71 m
        :value: 71
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :html_instructions: Turn <b>left</b> at Công Ty Cp Giáo Dục - Tư Vấn Du Học
        Sao Sáng Á Châu onto <b>Xuân Diệu</b>
      :maneuver: turn-left
      :polyline:
        :points: g{daBquosS_@Iw@Oc@E
      :start_location:
        :lat: 16.0864373
        :lng: 108.2199348
      :travel_mode: DRIVING
    - :distance:
        :text: 85 m
        :value: 85
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.086579
        :lng: 108.2204171
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Thương Mại &amp; Dịch
        Vụ Human Care onto <b>Đinh Công Tráng</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: c_eaBqvosSD[@M@CBM@E@CBCBABANAJ?VHHBB?
      :start_location:
        :lat: 16.0870588
        :lng: 108.2200905
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0863357
        :lng: 108.2184105
      :step_index: 1
      :step_interpolation: 0.3404534206493313
  :overview_polyline:
    :points: a~daBm_osSv@oB|BcGQIiBk@sAk@rBmFwAYc@ED[BQDSLKZA`@LB?
  :summary: 3 Tháng 2
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:21:47.878013', '2017-05-03 02:21:47.878013');
INSERT INTO distances VALUES (440, 94, 95, 696, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0971328
      :lng: 108.2330445
    :southwest:
      :lat: 16.0930795
      :lng: 108.2308965
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 696
    :duration:
      :text: 2 mins
      :value: 108
    :end_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0930795
      :lng: 108.2321706
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0968973
      :lng: 108.2308965
    :steps:
    - :distance:
        :text: 58 m
        :value: 58
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :html_instructions: Head <b>northeast</b> on <b>Lý Nhật Quang</b> toward <b>Hoa
        Lư</b>
      :polyline:
        :points: s|faBczqsSCGi@yA
      :start_location:
        :lat: 16.0968973
        :lng: 108.2308965
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 242
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0956495
        :lng: 108.2330445
      :html_instructions: Turn <b>right</b> at the 2nd cross street onto <b>Chu Huy
        Mân</b>
      :maneuver: turn-right
      :polyline:
        :points: a~faBe}qsSfHiI
      :start_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 272
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0938455
        :lng: 108.231326
      :html_instructions: Turn <b>right</b> at the 1st cross street toward <b>Khúc
        Hạo</b>
      :maneuver: turn-right
      :polyline:
        :points: ytfaBogrsSdA`AlBdBrDlD
      :start_location:
        :lat: 16.0956495
        :lng: 108.2330445
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 124
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0930795
        :lng: 108.2321706
      :html_instructions: Turn <b>left</b> at Quán Ăn Chiều Nhớ onto <b>Khúc Hạo</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Điện Nước Út Tài (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: qifaBy|qsSdAiArA}A
      :start_location:
        :lat: 16.0938455
        :lng: 108.231326
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: s|faBczqsSm@aBfHiIdA`A`HrGxCgD
  :summary: Chu Huy Mân
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0968973
      :lng: 108.2321706
    :southwest:
      :lat: 16.0930795
      :lng: 108.2290064
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 692
    :duration:
      :text: 2 mins
      :value: 132
    :end_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0930795
      :lng: 108.2321706
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0968973
      :lng: 108.2308965
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 227
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :html_instructions: Head <b>southwest</b> on <b>Lý Nhật Quang</b> toward <b>Lê
        Hữu Kiều</b><div style="font-size:0.9em">Pass by Dịch Vụ Nấu Ăn Long Vỹ (on
        the right)</div>
      :polyline:
        :points: s|faBczqsSfAfCz@vBv@xB
      :start_location:
        :lat: 16.0968973
        :lng: 108.2308965
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 465
      :duration:
        :text: 2 mins
        :value: 97
      :end_location:
        :lat: 16.0930795
        :lng: 108.2321706
      :html_instructions: Turn <b>left</b> onto <b>Khúc Hạo</b><div style="font-size:0.9em">Pass
        by Điện nước Út Tài (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: wvfaBinqsSvEeFv@aAz@_AdAmARYdAiArA}A
      :start_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0944503
        :lng: 108.2306527
      :step_index: 1
      :step_interpolation: 0.5218048103745487
  :overview_polyline:
    :points: s|faBczqsSbC~Fv@xBvEeFrBaCxAgBxCgD
  :summary: Lý Nhật Quang and Khúc Hạo
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0969444
      :lng: 108.2321706
    :southwest:
      :lat: 16.0930795
      :lng: 108.2301572
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 611
    :duration:
      :text: 2 mins
      :value: 130
    :end_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0930795
      :lng: 108.2321706
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0969444
      :lng: 108.2309242
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 96
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0963386
        :lng: 108.2315589
      :html_instructions: Head <b>southeast</b> on <b>Hoa Lư</b> toward <b>Lý Nhật
        Quang</b><div style="font-size:0.9em">Pass by CC 3B Làng Cá (on the right)</div>
      :polyline:
        :points: "{|faBgzqsSBCrB{B"
      :start_location:
        :lat: 16.0969444
        :lng: 108.2309242
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 221
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0948823
        :lng: 108.2301572
      :html_instructions: Turn <b>right</b> onto <b>Hồ Sĩ Tân</b>
      :maneuver: turn-right
      :polyline:
        :points: cyfaBg~qsSnBjBtArA|AvA
      :start_location:
        :lat: 16.0963386
        :lng: 108.2315589
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 294
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0930795
        :lng: 108.2321706
      :html_instructions: Turn <b>left</b> at Quán Cà Phê Khánh Quỳnh onto <b>Khúc
        Hạo</b><div style="font-size:0.9em">Pass by Đại Lý Nệm Lan Khoa (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: _pfaBouqsSv@aAz@_AdAmARYdAiArA}A
      :start_location:
        :lat: 16.0948823
        :lng: 108.2301572
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0955633
        :lng: 108.2308108
      :step_index: 1
      :step_interpolation: 0.5329889427270765
  :overview_polyline:
    :points: "{|faBgzqsSvB_CdE~D|AvAv@aA`CmClDaE"
  :summary: Hồ Sĩ Tân and Khúc Hạo
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:39.122333', '2017-05-03 02:10:39.122333');
INSERT INTO distances VALUES (441, 95, 96, 198, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0930795
      :lng: 108.2325758
    :southwest:
      :lat: 16.0917997
      :lng: 108.231699
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 198
    :duration:
      :text: 1 min
      :value: 53
    :end_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0917997
      :lng: 108.231699
    :start_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0930795
      :lng: 108.2321706
    :steps:
    - :distance:
        :text: 59 m
        :value: 59
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :html_instructions: Head <b>southeast</b> on <b>Khúc Hạo</b>
      :polyline:
        :points: wdfaBabrsSfAqA
      :start_location:
        :lat: 16.0930795
        :lng: 108.2321706
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 139
      :duration:
        :text: 1 min
        :value: 45
      :end_location:
        :lat: 16.0917997
        :lng: 108.231699
      :html_instructions: Turn <b>right</b> at Trung tâm tập gym<div style="font-size:0.9em">Pass
        by the pharmacy (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: obfaBsdrsShAhA`A|@j@f@
      :start_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wdfaBabrsSfAqAhAhAlBdB
  :summary: Khúc Hạo
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:39.435398', '2017-05-03 02:10:39.435398');
INSERT INTO distances VALUES (442, 96, 97, 1081, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0917997
      :lng: 108.2361225
    :southwest:
      :lat: 16.0854177
      :lng: 108.2309973
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.1 km
      :value: 1081
    :duration:
      :text: 3 mins
      :value: 195
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0854177
      :lng: 108.2361225
    :start_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0917997
      :lng: 108.231699
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 399
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0884439
        :lng: 108.2310184
      :html_instructions: Head <b>southwest</b> toward <b>Nại Hiên Đông 9</b><div
        style="font-size:0.9em">Pass by Đại Lý Gạo Anh Tuấn (on the left)</div>
      :polyline:
        :points: w|eaBc_rsSNN@?PNlB~AvAJjC?P?fA?bBAjBA
      :start_location:
        :lat: 16.0917997
        :lng: 108.231699
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 167
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0884513
        :lng: 108.2325816
      :html_instructions: Turn <b>left</b> at the pharmacy toward <b>Trần Thánh Tông</b><div
        style="font-size:0.9em">Pass by Cà Phê Mạnh Hồ (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: wgeaB{zqsSAyA?A?mA?cA?_@?[?M
      :start_location:
        :lat: 16.0884439
        :lng: 108.2310184
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 515
      :duration:
        :text: 1 min
        :value: 66
      :end_location:
        :lat: 16.0854177
        :lng: 108.2361225
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Trần
        Thánh Tông</b><div style="font-size:0.9em">Pass by Cà Phê Ti Gôn (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ygeaBsdrsSFABABABABABCBCBC@C@C@E?C@E?C?EAC?EACd@q@|AmB|@}@Za@rA}AlAuAvBeC|@cA
      :start_location:
        :lat: 16.0884513
        :lng: 108.2325816
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: w|eaBc_rsSpC~BvAJjC?xA?nECA{A?qD?i@JCNIJOBSCSd@q@|AmBxA_BvI}J
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0927213
      :lng: 108.2378803
    :southwest:
      :lat: 16.0854177
      :lng: 108.231699
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1300
    :duration:
      :text: 4 mins
      :value: 225
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0854177
      :lng: 108.2361225
    :start_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0917997
      :lng: 108.231699
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 139
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :html_instructions: Head <b>northeast</b> toward <b>Nại Hiên Đông 8</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Dương Thiên Phú (on the left)</div>
      :polyline:
        :points: w|eaBc_rsSk@g@aA}@iAiA
      :start_location:
        :lat: 16.0917997
        :lng: 108.231699
      :travel_mode: DRIVING
    - :distance:
        :text: 0.8 km
        :value: 777
      :duration:
        :text: 2 mins
        :value: 130
      :end_location:
        :lat: 16.0879444
        :lng: 108.2378803
      :html_instructions: Turn <b>right</b> at Trung tâm tập gym onto <b>Khúc Hạo</b><div
        style="font-size:0.9em">Pass by Công Ty Mtv Thiết Bị Giáo Dục Vi Khanh (on
        the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: obfaBsdrsS|DoE\a@LOxBaCnBcC|AcB~@gAfCyC~BoC`@k@VQFG
      :start_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 318
      :duration:
        :text: 1 min
        :value: 53
      :end_location:
        :lat: 16.0858349
        :lng: 108.2358736
      :html_instructions: Turn <b>right</b> at Dịch Vụ Giới Thiệu Nhà Đất Cát Vàng
        onto <b>Trần Nhân Tông</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp
        Hóa Long Hương (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: sdeaBwessSdCzBbA~@lBlBl@j@~@z@
      :start_location:
        :lat: 16.0879444
        :lng: 108.2378803
      :travel_mode: DRIVING
    - :distance:
        :text: 66 m
        :value: 66
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0854177
        :lng: 108.2361225
      :html_instructions: Turn <b>left</b> onto <b>Trần Thánh Tông</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mwdaBeyrsSRP|@cA
      :start_location:
        :lat: 16.0858349
        :lng: 108.2358736
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0909548
        :lng: 108.2345133
      :step_index: 1
      :step_interpolation: 0.36727398893681
  :overview_polyline:
    :points: w|eaBc_rsSmBeBiAiA|DoEj@q@hFeG|CkDfGiH`@k@VQFGdCzBpDlDlBfBRP|@cA
  :summary: Khúc Hạo and Trần Nhân Tông
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0927213
      :lng: 108.2361225
    :southwest:
      :lat: 16.0854177
      :lng: 108.231699
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.5 km
      :value: 1508
    :duration:
      :text: 4 mins
      :value: 236
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0854177
      :lng: 108.2361225
    :start_address: Dương Vân Nga, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0917997
      :lng: 108.231699
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 139
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :html_instructions: Head <b>northeast</b> toward <b>Nại Hiên Đông 8</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Dương Thiên Phú (on the left)</div>
      :polyline:
        :points: w|eaBc_rsSk@g@aA}@iAiA
      :start_location:
        :lat: 16.0917997
        :lng: 108.231699
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 456
      :duration:
        :text: 1 min
        :value: 75
      :end_location:
        :lat: 16.08991
        :lng: 108.2356763
      :html_instructions: Turn <b>right</b> at Trung tâm tập gym onto <b>Khúc Hạo</b><div
        style="font-size:0.9em">Pass by Công Ty Mtv Thiết Bị Giáo Dục Vi Khanh (on
        the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: obfaBsdrsS|DoE\a@LOxBaCnBcC|AcB
      :start_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 323
      :duration:
        :text: 1 min
        :value: 50
      :end_location:
        :lat: 16.0885432
        :lng: 108.2330592
      :html_instructions: Turn <b>right</b> at Cà Phê Phan Lê onto <b>Vân Đồn</b><div
        style="font-size:0.9em">Pass by Đậu Đỏ Kids Shop (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: "}peaB_xrsStBvCp@bAXpAXfAPv@J\\DNHVBNBF"
      :start_location:
        :lat: 16.08991
        :lng: 108.2356763
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 590
      :duration:
        :text: 1 min
        :value: 84
      :end_location:
        :lat: 16.0854177
        :lng: 108.2361225
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Trần
        Thánh Tông</b><div style="font-size:0.9em">Pass by Cà Phê Ti Gôn (on the right
        in 350&nbsp;m)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: kheaBsgrsSC@E@CBC@ABCBABADCF?B?@?@?B?@?@?B@@?D@BBB@BBB@BB@BBD@B@B?D?D@FABABABABABCBCBC@C@C@E?C@E?C?EAC?EACd@q@|AmB|@}@Za@rA}AlAuAvBeC|@cA
      :start_location:
        :lat: 16.0885432
        :lng: 108.2330592
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.088868
        :lng: 108.233978
      :step_index: 2
      :step_interpolation: 0.6757984560442131
  :overview_polyline:
    :points: w|eaBc_rsSmBeBiAiA|DoEj@q@hFeG|AcBtBvCp@bAXpAj@~BPl@Lf@BFC@IDEDKT?J@HFPLLRBTCNKHQ@SAIACd@q@zCkDnB_CbG_H
  :summary: Khúc Hạo and Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:44.730987', '2017-05-03 02:10:44.730987');
INSERT INTO distances VALUES (443, 97, 98, 313, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0854177
      :lng: 108.2378186
    :southwest:
      :lat: 16.0834644
      :lng: 108.2361225
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 313
    :duration:
      :text: 1 min
      :value: 45
    :end_address: 312 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0834644
      :lng: 108.2374025
    :start_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0854177
      :lng: 108.2361225
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 247
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0839037
        :lng: 108.2378186
      :html_instructions: Head <b>southeast</b> on <b>Trần Thánh Tông</b> toward <b>Lý
        Đạo Thành</b><div style="font-size:0.9em">Pass by Quán Cà Phê Hùng Huy (on
        the right)</div>
      :polyline:
        :points: "{tdaBwzrsSNOt@}@PU~@eA~@gAvAaB"
      :start_location:
        :lat: 16.0854177
        :lng: 108.2361225
      :travel_mode: DRIVING
    - :distance:
        :text: 66 m
        :value: 66
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.0834644
        :lng: 108.2374025
      :html_instructions: Turn <b>right</b><div style="font-size:0.9em">Destination
        will be on the left</div>
      :maneuver: turn-right
      :polyline:
        :points: kkdaBkessS`@^p@p@B@
      :start_location:
        :lat: 16.0839037
        :lng: 108.2378186
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{tdaBwzrsSvCiDvCiDrApAB@"
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:45.017697', '2017-05-03 02:10:45.017697');
INSERT INTO distances VALUES (444, 98, 99, 340, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0834644
      :lng: 108.2374025
    :southwest:
      :lat: 16.0812632
      :lng: 108.2351987
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 340
    :duration:
      :text: 1 min
      :value: 32
    :end_address: 374 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0812632
      :lng: 108.2351987
    :start_address: 312 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0834644
      :lng: 108.2374025
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 340
      :duration:
        :text: 1 min
        :value: 32
      :end_location:
        :lat: 16.0812632
        :lng: 108.2351987
      :html_instructions: Head <b>southwest</b> toward <b>Đỗ Anh Hàn</b><div style="font-size:0.9em">Pass
        by Văn Phòng Công Chứng Trung Việt (on the right)</div>
      :polyline:
        :points: shdaBwbssSv@x@p@p@nAlAr@t@t@t@f@f@x@x@^^PN
      :start_location:
        :lat: 16.0834644
        :lng: 108.2374025
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: shdaBwbssSdLfLPN
  :summary: ''''
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:45.352297', '2017-05-03 02:10:45.352297');
INSERT INTO distances VALUES (446, 100, 101, 612, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0714978
      :lng: 108.2327792
    :southwest:
      :lat: 16.0663738
      :lng: 108.2309724
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 612
    :duration:
      :text: 1 min
      :value: 61
    :end_address: Ngô Quyền, An Hải Tây, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0663738
      :lng: 108.2327792
    :start_address: 496 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0714978
      :lng: 108.2309724
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 415
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.0680088
        :lng: 108.2323233
      :html_instructions: Head <b>south</b> on <b>Ngô Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass
        by Áo Cưới Hằng Huệ (on the right)</div>
      :polyline:
        :points: "{}aaBqzqsSh@ObCu@fCu@zBo@vCy@pAe@\\A"
      :start_location:
        :lat: 16.0714978
        :lng: 108.2309724
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 197
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0663738
        :lng: 108.2327792
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Ngô
        Quyền</b><div style="font-size:0.9em">Pass by Quán Chè 916 (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ahaaB_crsS@@@?@??@@??@B?B@B@D?B?D?B?DABABABCBABC@CBC@EXDNGh@SjB_@@?z@Q
      :start_location:
        :lat: 16.0680088
        :lng: 108.2323233
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{}aaBqzqsSpLkDvCy@pAe@^?D@JDR?PILM@EXDx@[hDq@"
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:45.909999', '2017-05-03 02:10:45.909999');
INSERT INTO distances VALUES (447, 101, 102, 937, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0663738
      :lng: 108.2352767
    :southwest:
      :lat: 16.0583974
      :lng: 108.2327792
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 937
    :duration:
      :text: 2 mins
      :value: 137
    :end_address: 736 Ngô Quyền, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0583974
      :lng: 108.2352767
    :start_address: Ngô Quyền, An Hải Tây, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0663738
      :lng: 108.2327792
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 562
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0615511
        :lng: 108.2342912
      :html_instructions: Head <b>south</b> on <b>Ngô Quyền</b> toward <b>Triệu Việt
        Vương</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Sản Xuất Thương
        Mại Hà Trung Hậu - Cn (on the left)</div>
      :polyline:
        :points: y}`aB{ersSdCi@nB[rEcA~EeAvBe@\E~A[NCRQ
      :start_location:
        :lat: 16.0663738
        :lng: 108.2327792
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 375
      :duration:
        :text: 1 min
        :value: 51
      :end_location:
        :lat: 16.0583974
        :lng: 108.2352767
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Ngô
        Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Cà Phê Huy Việt
        (on the left)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: u_`aBiorsSBBFBF?F?F?DCDCFEDG@E@GXEjGuAnCk@lB[NE
      :start_location:
        :lat: 16.0615511
        :lng: 108.2342912
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: y}`aB{ersSdCi@nB[rLiCdGkARQBBNBN?JGLMBMdH{AnCk@lB[NE
  :summary: Ngô Quyền and Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:46.138753', '2017-05-03 02:10:46.138753');
INSERT INTO distances VALUES (448, 102, 103, 462, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0583974
      :lng: 108.2364941
    :southwest:
      :lat: 16.0544132
      :lng: 108.2352767
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 462
    :duration:
      :text: 1 min
      :value: 38
    :end_address: QL14B, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0544132
      :lng: 108.2364941
    :start_address: 736 Ngô Quyền, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0583974
      :lng: 108.2352767
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 462
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0544132
        :lng: 108.2364941
      :html_instructions: Head <b>south</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Vũ Văn Dũng</b><div style="font-size:0.9em">Continue to follow QL14B</div><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Tin Học Dv Nec Computer (on the
        left)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: _l_aBoursSXGlFiAdEw@bB_@~Bi@jB]
      :start_location:
        :lat: 16.0583974
        :lng: 108.2352767
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _l_aBoursSfGqAdEw@bB_@jFgA
  :summary: QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:46.464594', '2017-05-03 02:10:46.464594');
INSERT INTO distances VALUES (449, 103, 104, 222, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0544132
      :lng: 108.2370027
    :southwest:
      :lat: 16.0525499
      :lng: 108.2364941
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 222
    :duration:
      :text: 1 min
      :value: 29
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0525499
      :lng: 108.2370027
    :start_address: QL14B, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0544132
      :lng: 108.2364941
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 117
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0533889
        :lng: 108.2367385
      :html_instructions: Head <b>south</b> on <b>QL14B</b> toward <b>Ngô Quyền</b>
      :polyline:
        :points: as~`Ba}rsSbDo@f@A
      :start_location:
        :lat: 16.0544132
        :lng: 108.2364941
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 105
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.0525499
        :lng: 108.2370027
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Ngũ
        Hành Sơn</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Vinh Sơn (on
        the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ul~`Bs~rsSB@B@B?B@@?B?B?B?B?BABABABA@A@A@C@A@A@C?A@C?C@ArAQPC
      :start_location:
        :lat: 16.0533889
        :lng: 108.2367385
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: as~`Ba}rsSbDo@f@AFBL@J?NGFIDK@EdBU
  :summary: QL14B and Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:46.737139', '2017-05-03 02:10:46.737139');
INSERT INTO distances VALUES (450, 104, 105, 560, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0525499
      :lng: 108.2384562
    :southwest:
      :lat: 16.047711
      :lng: 108.2370027
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 560
    :duration:
      :text: 1 min
      :value: 58
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.047711
      :lng: 108.2384562
    :start_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0525499
      :lng: 108.2370027
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 560
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.047711
        :lng: 108.2384562
      :html_instructions: Head <b>south</b> on <b>Ngũ Hành Sơn</b> toward <b>Phạm
        Hữu Kính</b><div style="font-size:0.9em">Pass by Bánh Cuốn Hà Nội (on the
        right)</div><div style="font-size:0.9em">Destination will be on the left</div>
      :polyline:
        :points: mg~`Bg`ssS`Dq@nDo@r@U~FiAbCe@rCm@h@M
      :start_location:
        :lat: 16.0525499
        :lng: 108.2370027
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mg~`Bg`ssSpIaBr@U~FiAvGsAh@M
  :summary: Ngũ Hành Sơn
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0530645
      :lng: 108.2385553
    :southwest:
      :lat: 16.0477396
      :lng: 108.2368855
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 681
    :duration:
      :text: 1 min
      :value: 65
    :end_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0477396
      :lng: 108.2385553
    :start_address: Ngũ Hành Sơn, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0525499
      :lng: 108.2370027
    :steps:
    - :distance:
        :text: 59 m
        :value: 59
      :duration:
        :text: 1 min
        :value: 6
      :end_location:
        :lat: 16.0530645
        :lng: 108.2368855
      :html_instructions: Head <b>north</b> on <b>Ngũ Hành Sơn</b> toward <b>Cầu Trần
        Thị Lý</b>
      :polyline:
        :points: mg~`Bg`ssSQBsAP
      :start_location:
        :lat: 16.0525499
        :lng: 108.2370027
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 622
      :duration:
        :text: 1 min
        :value: 59
      :end_location:
        :lat: 16.0477396
        :lng: 108.2385553
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>QL14B</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Đtdđ A Quảng (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: sj~`Bq_ssS?A?C?CxCm@vGuAXIfB_@pDs@nB_@hDs@f@M
      :start_location:
        :lat: 16.0530645
        :lng: 108.2368855
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0515901
        :lng: 108.2373844
      :step_index: 1
      :step_interpolation: 0.2828886023749668
  :overview_polyline:
    :points: mg~`Bg`ssSeBT?E?CxCm@pH_BrPgDf@M
  :summary: QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:46.986576', '2017-05-03 02:10:46.986576');
INSERT INTO distances VALUES (454, 108, 109, 880, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0337823
      :lng: 108.227814
    :southwest:
      :lat: 16.0325531
      :lng: 108.2198281
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 880
    :duration:
      :text: 2 mins
      :value: 105
    :end_address: 1249 Xô Viết Nghệ Tĩnh, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0325531
      :lng: 108.2198281
    :start_address: Tiên Sơn, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0337823
      :lng: 108.227814
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 353
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0331869
        :lng: 108.224571
      :html_instructions: Head <b>west</b> on <b>Tiên Sơn</b>/<b>QL14B</b>
      :polyline:
        :points: crz`ByfqsSjBjOHt@?dA
      :start_location:
        :lat: 16.0337823
        :lng: 108.227814
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 527
      :duration:
        :text: 1 min
        :value: 77
      :end_location:
        :lat: 16.0325531
        :lng: 108.2198281
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Xô Viết
        Nghệ Tĩnh</b><div style="font-size:0.9em">Pass by Cà Phê Nâu Nhã Thy (on the
        left)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: mnz`BqrpsSA@A?A@A@A@?@C@?@A??@A@?@A@?@?@?BAB?BAD?B@B?B?D@B@DBDBDBDBBDBFBD@RrABXHbAHfAj@dLTjD
      :start_location:
        :lat: 16.0331869
        :lng: 108.224571
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: crz`ByfqsStB`Q?dAEBKLCN?PBRNTLFD@RrAL|At@lNTjD
  :summary: Tiên Sơn/QL14B and Xô Viết Nghệ Tĩnh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:48.491333', '2017-05-03 02:10:48.491333');
INSERT INTO distances VALUES (455, 109, 110, 354, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0325531
      :lng: 108.2198281
    :southwest:
      :lat: 16.032173
      :lng: 108.216535
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 354
    :duration:
      :text: 1 min
      :value: 39
    :end_address: Xô Viết Nghệ Tĩnh, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.032173
      :lng: 108.216535
    :start_address: 1249 Xô Viết Nghệ Tĩnh, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0325531
      :lng: 108.2198281
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 354
      :duration:
        :text: 1 min
        :value: 39
      :end_location:
        :lat: 16.032173
        :lng: 108.216535
      :html_instructions: Head <b>west</b> on <b>Xô Viết Nghệ Tĩnh</b> toward <b>Lê
        Thanh Nghị</b><div style="font-size:0.9em">Pass by HoreMart Đà Nẵng (on the
        right)</div>
      :polyline:
        :points: mjz`B}tosSXrEZ`GBd@PtC
      :start_location:
        :lat: 16.0325531
        :lng: 108.2198281
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mjz`B}tosSjApS
  :summary: Xô Viết Nghệ Tĩnh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:48.772554', '2017-05-03 02:10:48.772554');
INSERT INTO distances VALUES (456, 110, 111, 556, 15, '---
- :bounds:
    :northeast:
      :lat: 16.032168
      :lng: 108.2164912
    :southwest:
      :lat: 16.0316021
      :lng: 108.211318
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 556
    :duration:
      :text: 1 min
      :value: 58
    :end_address: Xô Viết Nghệ Tĩnh, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0316021
      :lng: 108.211318
    :start_address: Xô Viết Nghệ Tĩnh, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.032168
      :lng: 108.2164912
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 556
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.0316021
        :lng: 108.211318
      :html_instructions: Head <b>west</b> on <b>Xô Viết Nghệ Tĩnh</b> toward <b>Trần
        Đức Thảo</b><div style="font-size:0.9em">Pass by Cà Phê Aloha (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: ahz`Ba`osSFbA\lGPxCXvENxC@TLtC
      :start_location:
        :lat: 16.032168
        :lng: 108.2164912
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ahz`Ba`osSpAbU^dI
  :summary: Xô Viết Nghệ Tĩnh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:49.048017', '2017-05-03 02:10:49.048017');
INSERT INTO distances VALUES (457, 111, 112, 306, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0316021
      :lng: 108.2114922
    :southwest:
      :lat: 16.0290136
      :lng: 108.211158
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 306
    :duration:
      :text: 1 min
      :value: 54
    :end_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0290136
      :lng: 108.2114922
    :start_address: Xô Viết Nghệ Tĩnh, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0316021
      :lng: 108.211318
    :steps:
    - :distance:
        :text: 17 m
        :value: 17
      :duration:
        :text: 1 min
        :value: 2
      :end_location:
        :lat: 16.031588
        :lng: 108.211158
      :html_instructions: Head <b>west</b> on <b>Xô Viết Nghệ Tĩnh</b> toward <b>Lương
        Nhữ Hộc</b>
      :polyline:
        :points: odz`Bw_nsS@^
      :start_location:
        :lat: 16.0316021
        :lng: 108.211318
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 289
      :duration:
        :text: 1 min
        :value: 52
      :end_location:
        :lat: 16.0290136
        :lng: 108.2114922
      :html_instructions: Turn <b>left</b> onto <b>Nguyễn Phong Sắc</b><div style="font-size:0.9em">Pass
        by Quán Cơm Hoa (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mdz`Bw~msSTGxCS~@Gd@ClFY
      :start_location:
        :lat: 16.031588
        :lng: 108.211158
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: odz`Bw_nsS@^TGxE[rG]
  :summary: Nguyễn Phong Sắc
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:49.364492', '2017-05-03 02:10:49.364492');
INSERT INTO distances VALUES (458, 112, 113, 795, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0290136
      :lng: 108.2132633
    :southwest:
      :lat: 16.0230192
      :lng: 108.2114922
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 795
    :duration:
      :text: 3 mins
      :value: 184
    :end_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0230192
      :lng: 108.21304
    :start_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0290136
      :lng: 108.2114922
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 521
      :duration:
        :text: 2 mins
        :value: 111
      :end_location:
        :lat: 16.0247364
        :lng: 108.2132633
      :html_instructions: Head <b>south</b> on <b>Nguyễn Phong Sắc</b> toward <b>Lê
        Ngân</b><div style="font-size:0.9em">Pass by Cửa Hàng Đồ Gổ Hoàng Phúc (on
        the right)</div>
      :polyline:
        :points: ity`By`nsSl@E@?nBM`AIl@ETC@A^ENELEVMb@On@YlBeAJGNINIJGLGXQtDiB
      :start_location:
        :lat: 16.0290136
        :lng: 108.2114922
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 120
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0242008
        :lng: 108.212289
      :html_instructions: Turn <b>right</b> at Nha Khoa Quang Hải toward <b>Trần Phước
        Thành</b><div style="font-size:0.9em">Pass by Phòng khám Nha Khoa Quang Hải
        (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: syx`B{knsSx@nBp@pA
      :start_location:
        :lat: 16.0247364
        :lng: 108.2132633
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 154
      :duration:
        :text: 1 min
        :value: 47
      :end_location:
        :lat: 16.0230192
        :lng: 108.21304
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh - Mtv Vạn Thái onto <b>Trần
        Phước Thành</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Thiết Kế
        &amp; Xây Dựng Hưng Vượng (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: gvx`ByensSz@e@p@]lAs@n@]
      :start_location:
        :lat: 16.0242008
        :lng: 108.212289
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ity`By`nsS`F]dBQ\Kz@]xDqBbAk@tDiBx@nBp@pAz@e@~BqAn@]
  :summary: Nguyễn Phong Sắc
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0290136
      :lng: 108.21304
    :southwest:
      :lat: 16.0230192
      :lng: 108.2114401
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 794
    :duration:
      :text: 3 mins
      :value: 179
    :end_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0230192
      :lng: 108.21304
    :start_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0290136
      :lng: 108.2114922
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 341
      :duration:
        :text: 1 min
        :value: 67
      :end_location:
        :lat: 16.0261302
        :lng: 108.2124215
      :html_instructions: Head <b>south</b> on <b>Nguyễn Phong Sắc</b> toward <b>Lê
        Ngân</b><div style="font-size:0.9em">Pass by Cửa Hàng Đồ Gổ Hoàng Phúc (on
        the right)</div>
      :polyline:
        :points: ity`By`nsSl@E@?nBM`AIl@ETC@A^ENELEVMb@On@YlBeA
      :start_location:
        :lat: 16.0290136
        :lng: 108.2114922
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 122
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0255704
        :lng: 108.2114401
      :html_instructions: Turn <b>right</b> at Cà Phê Trung Sơn onto <b>Trịnh Đình
        Thảo</b><div style="font-size:0.9em">Pass by Tiệm Hớt Tóc Đa Na (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: iby`BsfnsSnBbE
      :start_location:
        :lat: 16.0261302
        :lng: 108.2124215
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 331
      :duration:
        :text: 1 min
        :value: 89
      :end_location:
        :lat: 16.0230192
        :lng: 108.21304
      :html_instructions: Turn <b>left</b> at Cafe CocPro onto <b>Trần Phước Thành</b><div
        style="font-size:0.9em">Pass by Đại Lý Gạo Thu Hà (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: y~x`Bo`nsSx@e@h@WlDkBz@e@p@]lAs@n@]
      :start_location:
        :lat: 16.0255704
        :lng: 108.2114401
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0254258
        :lng: 108.2115358
      :step_index: 2
      :step_interpolation: 0.05753697391992693
  :overview_polyline:
    :points: ity`By`nsS`F]dBQ\Kz@]|C_BnBbEx@e@vEcClBcA|BqA
  :summary: Nguyễn Phong Sắc and Trần Phước Thành
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0307969
      :lng: 108.2158778
    :southwest:
      :lat: 16.0227624
      :lng: 108.2113041
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.5 km
      :value: 1480
    :duration:
      :text: 4 mins
      :value: 237
    :end_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0230192
      :lng: 108.21304
    :start_address: Nguyễn Phong Sắc, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0290136
      :lng: 108.2114922
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 190
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0307086
        :lng: 108.2113041
      :html_instructions: Head <b>north</b> on <b>Nguyễn Phong Sắc</b><div style="font-size:0.9em">Pass
        by Shop THỜI TRANG THÙY DƯƠNG (on the right)</div>
      :polyline:
        :points: ity`By`nsSmFXe@B_AF
      :start_location:
        :lat: 16.0290136
        :lng: 108.2114922
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 95
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0307969
        :lng: 108.2121839
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Tin Học Điện Tử Viễn Thông
        Lê Trần Dana Việt
      :maneuver: turn-right
      :polyline:
        :points: "}~y`Bs_nsSCiAGw@Em@"
      :start_location:
        :lat: 16.0307086
        :lng: 108.2113041
      :travel_mode: DRIVING
    - :distance:
        :text: 0.8 km
        :value: 830
      :duration:
        :text: 2 mins
        :value: 102
      :end_location:
        :lat: 16.0242767
        :lng: 108.2158778
      :html_instructions: Turn <b>right</b> at Quán Nhậu Dung<div style="font-size:0.9em">Pass
        by Công Ty Cp Hoàng Minh Thy (on the right in 350&nbsp;m)</div>
      :maneuver: turn-right
      :polyline:
        :points: o_z`BcensS~@I`@C\I`@S`@U~@e@jAm@`@WrBcAxAu@p@]pAq@\Q`B{@zGeDdBaApAu@
      :start_location:
        :lat: 16.0307969
        :lng: 108.2121839
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 332
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.0227624
        :lng: 108.2132037
      :html_instructions: Turn <b>right</b> at Cửa Hàng Đá Granite Đen Huế onto <b>Nguyễn
        Duy</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Xây Dựng Giải Pháp
        Năng Lượng &amp; Môi Trường (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: wvx`Bg|nsSt@xAx@pB`BhDn@lAd@dAFL
      :start_location:
        :lat: 16.0242767
        :lng: 108.2158778
      :travel_mode: DRIVING
    - :distance:
        :text: 33 m
        :value: 33
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0230192
        :lng: 108.21304
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Nga Đại Việt onto
        <b>Trần Phước Thành</b><div style="font-size:0.9em">Destination will be on
        the right</div>
      :maneuver: turn-right
      :polyline:
        :points: gmx`BoknsSs@^
      :start_location:
        :lat: 16.0227624
        :lng: 108.2132037
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0287487
        :lng: 108.2131649
      :step_index: 2
      :step_interpolation: 0.3062445631799405
  :overview_polyline:
    :points: ity`By`nsSsG\_AFCiAMeB`BM~@]`B{@zH_EbG}CzGeDdBaApAu@t@xAx@pB`BhDtArCFLs@^
  :summary: Nguyễn Duy
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:49.721207', '2017-05-03 02:10:49.721207');
INSERT INTO distances VALUES (459, 113, 114, 796, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0230192
      :lng: 108.2136025
    :southwest:
      :lat: 16.0188906
      :lng: 108.2082586
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 796
    :duration:
      :text: 3 mins
      :value: 152
    :end_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :end_location:
      :lat: 16.0188906
      :lng: 108.2082586
    :start_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0230192
      :lng: 108.21304
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 114
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0221526
        :lng: 108.2136025
      :html_instructions: Head <b>southeast</b> on <b>Trần Phước Thành</b> toward
        <b>Nguyễn Duy</b><div style="font-size:0.9em">Pass by Nhà Thuốc 152 (Dapharco)
        (on the right)</div>
      :polyline:
        :points: "{nx`BojnsSr@_@nAq@h@]"
      :start_location:
        :lat: 16.0230192
        :lng: 108.21304
      :travel_mode: DRIVING
    - :distance:
        :text: 0.7 km
        :value: 682
      :duration:
        :text: 2 mins
        :value: 114
      :end_location:
        :lat: 16.0188906
        :lng: 108.2082586
      :html_instructions: Turn <b>right</b> at Công Ty Tnhh Mtv Phát Triển Vật Liệu
        Tiên Tiến onto <b>Cách Mạng Tháng 8</b>/<b>QL14B</b><div style="font-size:0.9em">Pass
        by Dịch Vụ Internet 102 (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: mix`B_nnsSf@t@r@`AtAfBt@dAn@~@j@|@d@x@R^LTPVPVRTJRL\P^Pb@^lAZbA`@`BJ`@Nd@N^
      :start_location:
        :lat: 16.0221526
        :lng: 108.2136025
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{nx`BojnsSbCqAh@]f@t@hChDdBdCpAvB`@t@bAxA^|@p@pBxAlFN^"
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.023648
      :lng: 108.21304
    :southwest:
      :lat: 16.0188906
      :lng: 108.2082586
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 973
    :duration:
      :text: 3 mins
      :value: 200
    :end_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :end_location:
      :lat: 16.0188906
      :lng: 108.2082586
    :start_address: Trần Phước Thành, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0230192
      :lng: 108.21304
    :steps:
    - :distance:
        :text: 82 m
        :value: 82
      :duration:
        :text: 1 min
        :value: 17
      :end_location:
        :lat: 16.023648
        :lng: 108.2126317
      :html_instructions: Head <b>northwest</b> on <b>Trần Phước Thành</b> toward
        <b>Bình Hòa 6</b><div style="font-size:0.9em">Pass by Cửa Hàng Vật Tư Kim
        Khí Mai Hoa (on the right)</div>
      :polyline:
        :points: "{nx`BojnsSo@\\mAr@"
      :start_location:
        :lat: 16.0230192
        :lng: 108.21304
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 172
      :duration:
        :text: 1 min
        :value: 45
      :end_location:
        :lat: 16.0228448
        :lng: 108.2112531
      :html_instructions: Turn <b>left</b> at Beauty Salon Nhật Cường onto <b>Trần
        Thủ Độ</b><div style="font-size:0.9em">Pass by Trung Tâm Tư Vấn Kỹ Thuật Xây
        Dựng &amp; Nông Lâm (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: yrx`B}gnsSl@jAh@hAhA|B
      :start_location:
        :lat: 16.023648
        :lng: 108.2126317
      :travel_mode: DRIVING
    - :distance:
        :text: 24 m
        :value: 24
      :duration:
        :text: 1 min
        :value: 5
      :end_location:
        :lat: 16.022666
        :lng: 108.2113759
      :html_instructions: Turn <b>left</b> at Bánh mỳ Nga onto <b>Đỗ Thúc Tịnh</b><div
        style="font-size:0.9em">Pass by Quán Cafe 134 (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: wmx`Bi_nsS`@Y
      :start_location:
        :lat: 16.0228448
        :lng: 108.2112531
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 132
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0220068
        :lng: 108.2103499
      :html_instructions: Turn <b>right</b> at Tiệm Cầm Đồ Thanh Thảo onto <b>Thành
        Thái</b><div style="font-size:0.9em">Pass by Quán Cafe Quốc Thịnh (on the
        left)</div>
      :maneuver: turn-right
      :polyline:
        :points: ulx`Bc`nsSdAlBb@p@Xl@
      :start_location:
        :lat: 16.022666
        :lng: 108.2113759
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 227
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0202417
        :lng: 108.2110485
      :html_instructions: Turn <b>left</b> at Garage Phú Quốc onto <b>Nguyễn Hữu Thọ</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Gỗ Mỹ Nghệ Bắc Ninh (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: qhx`BuymsSP\j@UtAm@dBw@hA_@\M
      :start_location:
        :lat: 16.0220068
        :lng: 108.2103499
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 336
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0188906
        :lng: 108.2082586
      :html_instructions: Turn <b>right</b> at the gas station onto <b>Cách Mạng Tháng
        8</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by Vườn Cây Kiểng Chín
        Sađéc (on the left)</div><div style="font-size:0.9em">Destination will be
        on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: o}w`Ba~msSLTPVPVRTJRL\P^Pb@^lAZbA`@`BJ`@Nd@N^
      :start_location:
        :lat: 16.0202417
        :lng: 108.2110485
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0219623
        :lng: 108.2102734
      :step_index: 4
      :step_interpolation: 0.04216580916852098
  :overview_polyline:
    :points: "{nx`BojnsS}BpAvAtChA|B`@YhB~Cj@jA`CcAdBw@hA_@\\MLTb@n@^h@^|@p@pBxAlFN^"
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:49.994318', '2017-05-03 02:10:49.994318');
INSERT INTO distances VALUES (460, 114, 69, 537, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0188906
      :lng: 108.2082586
    :southwest:
      :lat: 16.0161598
      :lng: 108.2047034
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 537
    :duration:
      :text: 2 mins
      :value: 92
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0161598
      :lng: 108.2050394
    :start_address: 736/10 Cách Mạng Tháng 8, Khuê Trung, Hồ Chí Minh, Vietnam
    :start_location:
      :lat: 16.0188906
      :lng: 108.2082586
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 436
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0170055
        :lng: 108.2047034
      :html_instructions: Head <b>southwest</b> on <b>Cách Mạng Tháng 8</b>/<b>QL14B</b>
        toward <b>Trần Văn Đang</b><div style="font-size:0.9em">Pass by Trung Tâm
        Khuyến Ngư Nông Lâm (on the right)</div>
      :polyline:
        :points: auw`BslmsSBFXt@n@jAhB~CXf@Zh@Td@R`@Rd@Pj@Rp@VpALl@
      :start_location:
        :lat: 16.0188906
        :lng: 108.2082586
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 101
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0161598
        :lng: 108.2050394
      :html_instructions: Turn <b>left</b> at Cửa Hàng Phụ Tùng Xe Máy Phùng La onto
        <b>Ông Ích Đường</b><div style="font-size:0.9em">Pass by 60 Ông Ích Đường
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-left
      :polyline:
        :points: iiw`BkvlsSPGn@Q|@[PEVG
      :start_location:
        :lat: 16.0170055
        :lng: 108.2047034
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: auw`BslmsS\|@xCjF~AxCd@pAj@bCLl@PGlBm@h@M
  :summary: Cách Mạng Tháng 8/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:50.30031', '2017-05-03 02:10:50.30031');
INSERT INTO distances VALUES (461, 69, 70, 476, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0161598
      :lng: 108.205717
    :southwest:
      :lat: 16.0119761
      :lng: 108.2050394
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 476
    :duration:
      :text: 1 min
      :value: 63
    :end_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0119761
      :lng: 108.2056464
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0161598
      :lng: 108.2050394
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 476
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0119761
        :lng: 108.2056464
      :html_instructions: Head <b>south</b> on <b>Ông Ích Đường</b> toward <b>Phạm
        Tứ</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa Phong Thủy (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: _dw`BoxlsSr@QrBa@|@Qr@MbB_@`AQX?j@A|CHP@dBBf@A
      :start_location:
        :lat: 16.0161598
        :lng: 108.2050394
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _dw`BoxlsSxGsAdDq@dAAtGNf@A
  :summary: Ông Ích Đường
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:50.56842', '2017-05-03 02:10:50.56842');
INSERT INTO distances VALUES (462, 70, 71, 1055, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0119761
      :lng: 108.2078934
    :southwest:
      :lat: 16.0030116
      :lng: 108.2056464
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.1 km
      :value: 1055
    :duration:
      :text: 2 mins
      :value: 112
    :end_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0030116
      :lng: 108.2071422
    :start_address: Ông Ích Đường, Khuê Trung, Cẩm Lệ, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0119761
      :lng: 108.2056464
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 135
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :html_instructions: Head <b>south</b> on <b>Ông Ích Đường</b> toward <b>Hòa
        An 9</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa Hoa (on the
        right)</div>
      :polyline:
        :points: "{iv`Bi|lsSB?^AXCb@If@QRINEv@Y"
      :start_location:
        :lat: 16.0119761
        :lng: 108.2056464
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 438
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :html_instructions: Continue onto <b>Cầu Cẩm Lệ</b><div style="font-size:0.9em">Pass
        by the bridge (on the left in 300&nbsp;m)</div>
      :polyline:
        :points: ubv`Bu~lsSfL{DtF_Cn@U
      :start_location:
        :lat: 16.0108254
        :lng: 108.2060265
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 482
      :duration:
        :text: 1 min
        :value: 57
      :end_location:
        :lat: 16.0030116
        :lng: 108.2071422
      :html_instructions: Continue onto <b>Phạm Hùng</b><div style="font-size:0.9em">Pass
        by Cty VIỆT MAY (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: glu`BgimsSb@MPERC^G\AVAN?N?P@ZBRBTDlBXf@HtEt@dC^XDZDL@
      :start_location:
        :lat: 16.0072404
        :lng: 108.2077215
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{iv`Bi|lsSb@A|@MbC{@fL{DtF_CrAc@d@I|@IhA?rDf@|KdBh@F"
  :summary: Cầu Cẩm Lệ and Phạm Hùng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:50.987262', '2017-05-03 02:10:50.987262');
INSERT INTO distances VALUES (463, 71, 72, 967, 15, '---
- :bounds:
    :northeast:
      :lat: 16.0030116
      :lng: 108.2073746
    :southwest:
      :lat: 15.9959816
      :lng: 108.2058809
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 967
    :duration:
      :text: 2 mins
      :value: 101
    :end_address: Bàu Cầu 4, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :end_location:
      :lat: 15.9963018
      :lng: 108.2058809
    :start_address: Phạm Hùng, Hòa Châu, Hòa Vang, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0030116
      :lng: 108.2071422
    :steps:
    - :distance:
        :text: 0.8 km
        :value: 773
      :duration:
        :text: 1 min
        :value: 69
      :end_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :html_instructions: Head <b>south</b> on <b>Phạm Hùng</b> toward <b>Lê Đình
        Diên</b><div style="font-size:0.9em">Pass by Áo Cưới Bin Wedding (on the left)</div>
      :polyline:
        :points: yqt`BsemsSP@h@Dv@Dl@@V?Z?`DGz@AlBEvCIfCG|EGlCG|DK
      :start_location:
        :lat: 16.0030116
        :lng: 108.2071422
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 158
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :html_instructions: Turn <b>right</b> onto <b>Phan Văn Đáng</b>
      :maneuver: turn-right
      :polyline:
        :points: mfs`BagmsSPdH
      :start_location:
        :lat: 15.9960704
        :lng: 108.2073746
      :travel_mode: DRIVING
    - :distance:
        :text: 36 m
        :value: 36
      :duration:
        :text: 1 min
        :value: 9
      :end_location:
        :lat: 15.9963018
        :lng: 108.2058809
      :html_instructions: Turn <b>right</b> onto <b>Bàu Cầu 4</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: "{es`B{}lsS_AB"
      :start_location:
        :lat: 15.9959816
        :lng: 108.2058992
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yqt`BsemsSz@FdBFpGIjR_@jISPdH_AB
  :summary: Phạm Hùng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:10:51.249268', '2017-05-03 02:10:51.249268');
INSERT INTO distances VALUES (839, 230, 231, 879, 20, '---
- :bounds:
    :northeast:
      :lat: 16.075584
      :lng: 108.2455061
    :southwest:
      :lat: 16.0698842
      :lng: 108.2450143
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 879
    :duration:
      :text: 2 mins
      :value: 116
    :end_address: 240 Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0698842
      :lng: 108.2451733
    :start_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0736794
      :lng: 108.2455061
    :steps:
    - :distance:
        :text: 83 m
        :value: 83
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0743562
        :lng: 108.2452692
      :html_instructions: Head <b>north</b> toward <b>Võ Nguyên Giáp</b>
      :polyline:
        :points: okbaBmutsSU@_ADMFOLSP
      :start_location:
        :lat: 16.0736794
        :lng: 108.2455061
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 135
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0755689
        :lng: 108.245335
      :html_instructions: Turn <b>right</b> at Temple Đà Nẵng onto <b>Võ Nguyên Giáp</b>
      :maneuver: turn-right
      :polyline:
        :points: wobaB}stsSC?sAAuAEcAE
      :start_location:
        :lat: 16.0743562
        :lng: 108.2452692
      :travel_mode: DRIVING
    - :distance:
        :text: 0.7 km
        :value: 661
      :duration:
        :text: 1 min
        :value: 73
      :end_location:
        :lat: 16.0698842
        :lng: 108.2451733
      :html_instructions: Make a <b>U-turn</b> at Seven Sea Hotel Da Nang<div style="font-size:0.9em">Pass
        by Khách Sạn Orchid (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: uturn-left
      :polyline:
        :points: iwbaBkttsS?@Ap@hADpABnB@z@@p@AfFKdDEfGGd@A|@A
      :start_location:
        :lat: 16.0755689
        :lng: 108.245335
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: okbaBmutsSuAF]TSPC?iDGcAEAr@zCHjDBfU[bBC
  :summary: Võ Nguyên Giáp
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:48.423478', '2017-05-03 02:35:48.423478');
INSERT INTO distances VALUES (840, 231, 232, 468, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0698842
      :lng: 108.2452728
    :southwest:
      :lat: 16.0656937
      :lng: 108.2451733
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 468
    :duration:
      :text: 1 min
      :value: 52
    :end_address: 240 Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0656937
      :lng: 108.2452378
    :start_address: 240 Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0698842
      :lng: 108.2451733
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 468
      :duration:
        :text: 1 min
        :value: 52
      :end_location:
        :lat: 16.0656937
        :lng: 108.2452378
      :html_instructions: Head <b>south</b> on <b>Võ Nguyên Giáp</b> toward <b>Dương
        Đình Nghệ</b><div style="font-size:0.9em">Pass by Grand Tourane Hotel (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: wsaaBistsSdEKrJGJDFBDBB?dCCfBC
      :start_location:
        :lat: 16.0698842
        :lng: 108.2451733
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wsaaBistsSdEKrJGRHHBlFG
  :summary: Võ Nguyên Giáp
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:48.691253', '2017-05-03 02:35:48.691253');
INSERT INTO distances VALUES (841, 232, 233, 932, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0656937
      :lng: 108.2468875
    :southwest:
      :lat: 16.0577976
      :lng: 108.2452378
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 932
    :duration:
      :text: 2 mins
      :value: 108
    :end_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0577976
      :lng: 108.2468875
    :start_address: 240 Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0656937
      :lng: 108.2452378
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 176
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0641276
        :lng: 108.2453642
      :html_instructions: Head <b>south</b> on <b>Võ Nguyên Giáp</b> toward <b>Hà
        Chương</b><div style="font-size:0.9em">Pass by Quán Ăn Phượng Thành (on the
        right)</div>
      :polyline:
        :points: qy`aBwstsShAAjBA@?l@Ab@AVCJEHE
      :start_location:
        :lat: 16.0656937
        :lng: 108.2452378
      :travel_mode: DRIVING
    - :distance:
        :text: 0.8 km
        :value: 756
      :duration:
        :text: 1 min
        :value: 88
      :end_location:
        :lat: 16.0577976
        :lng: 108.2468875
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Võ Nguyên Giáp</b><div style="font-size:0.9em">Pass by Quán Ăn Duyên Tuyết
        Loan (on the right)</div><div style="font-size:0.9em">Destination will be
        on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: yo`aBottsS@@@?@@@?B?F?D?DAD?BADABCDA?ABCBG@I?G?ITYf@s@PURINERE^ChBU`@?jACbBKhESxDOv@GvFk@TC
      :start_location:
        :lat: 16.0641276
        :lng: 108.2453642
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qy`aBwstsSdFEz@ETKFBVARGDCFK@Q?ITYx@iAb@Or@IhBU`@?nDObKc@dIw@
  :summary: Võ Nguyên Giáp
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:48.903166', '2017-05-03 02:35:48.903166');
INSERT INTO distances VALUES (842, 233, 234, 555, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0577976
      :lng: 108.247107
    :southwest:
      :lat: 16.055434
      :lng: 108.2434818
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 555
    :duration:
      :text: 1 min
      :value: 88
    :end_address: 116 Nguyễn Văn Thoại, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.055434
      :lng: 108.2434818
    :start_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0577976
      :lng: 108.2468875
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 151
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0564599
        :lng: 108.247107
      :html_instructions: Head <b>south</b> on <b>Võ Nguyên Giáp</b> toward <b>Nguyễn
        Văn Thoại</b><div style="font-size:0.9em">Pass by Cửa Hàng Đặc Sản Miền Trung
        Thủy Mộc (on the right)</div>
      :polyline:
        :points: gh_aBa~tsSlD]|AM
      :start_location:
        :lat: 16.0577976
        :lng: 108.2468875
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 404
      :duration:
        :text: 1 min
        :value: 72
      :end_location:
        :lat: 16.055434
        :lng: 108.2434818
      :html_instructions: Turn <b>right</b> at Nhà hàng Cua Đỏ onto <b>Nguyễn Văn
        Thoại</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Thương Mại
        Dịch Vụ Kim Diệu Chi (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: "{__aBm_usSV|AX~A?@XrADXRdATdAR`ARbAN~@Nt@H^"
      :start_location:
        :lat: 16.0564599
        :lng: 108.247107
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gh_aBa~tsSjGk@p@|Dr@tDh@fCb@bCXtA
  :summary: Võ Nguyên Giáp and Nguyễn Văn Thoại
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:49.174079', '2017-05-03 02:35:49.174079');
INSERT INTO distances VALUES (843, 234, 235, 172, 20, '---
- :bounds:
    :northeast:
      :lat: 16.055434
      :lng: 108.2434818
    :southwest:
      :lat: 16.0549906
      :lng: 108.2419382
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 172
    :duration:
      :text: 1 min
      :value: 26
    :end_address: 171 Nguyễn Văn Thoại, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0549906
      :lng: 108.2419382
    :start_address: 116 Nguyễn Văn Thoại, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.055434
      :lng: 108.2434818
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 172
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0549906
        :lng: 108.2419382
      :html_instructions: Head <b>west</b> on <b>Nguyễn Văn Thoại</b> toward <b>K
        195 Nguyễn Duy Hiệu</b><div style="font-size:0.9em">Pass by Ken Coffee (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: my~`BwhtsSDVTjA@JZ~A\bB
      :start_location:
        :lat: 16.055434
        :lng: 108.2434818
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: my~`BwhtsSvArH
  :summary: Nguyễn Văn Thoại
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:49.418015', '2017-05-03 02:35:49.418015');
INSERT INTO distances VALUES (844, 235, 236, 2388, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0549906
      :lng: 108.2419382
    :southwest:
      :lat: 16.0493969
      :lng: 108.221412
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 2.4 km
      :value: 2388
    :duration:
      :text: 4 mins
      :value: 249
    :end_address: 2 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0493969
      :lng: 108.221412
    :start_address: 171 Nguyễn Văn Thoại, Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0549906
      :lng: 108.2419382
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 553
      :duration:
        :text: 1 min
        :value: 86
      :end_location:
        :lat: 16.0534515
        :lng: 108.2370337
      :html_instructions: Head <b>west</b> on <b>Nguyễn Văn Thoại</b> toward <b>Thủ
        Khoa Huân</b><div style="font-size:0.9em">Pass by Cửa Hàng Biti''s (on the
        left)</div>
      :polyline:
        :points: uv~`Bc_tsS@HRfAJn@HZF^Jf@F\Nr@F`@Pv@DPF\ZfBJf@Jj@XxAXxAb@|@JVPf@Hd@
      :start_location:
        :lat: 16.0549906
        :lng: 108.2419382
      :travel_mode: DRIVING
    - :distance:
        :text: 1.7 km
        :value: 1689
      :duration:
        :text: 2 mins
        :value: 140
      :end_location:
        :lat: 16.049603
        :lng: 108.2225781
      :html_instructions: At the roundabout, take the <b>4th</b> exit onto <b>Cầu
        Trần Thị Lý</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Vinh Sơn
        (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: am~`Bm`ssSA@AB?BAB?B?B?B?B@B?B@@@B@BB@@BBBB@B@B?B@@?B?B?B?B?bCxAl@^v@^@?n@j@b@b@b@h@b@x@Vj@Pn@Jj@Hl@F|@HhADj@Dj@HrALbBp@xJbA|N^tFJpAD|@LvBFdCJ|BP`E?XEV
      :start_location:
        :lat: 16.0534515
        :lng: 108.2370337
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 146
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0493969
        :lng: 108.221412
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Duy
        Tân</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: _u}`BcfpsSA@A?A@A?A@A@A@CBA@A@ABA@?BA@?BAB?B?D?B?B?B@B?B@B@B@B@B@@BB@@B@@@B@@@B?@@B?@@B?H\Df@Df@@R
      :start_location:
        :lat: 16.049603
        :lng: 108.2225781
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: uv~`Bc_tsSvAvHtB~KXxAb@|@\~@Hd@CDAN@NHJLJL@J?pDxBx@^rAnAb@h@b@x@h@zATxA\~ElCn`@j@fIRtDRbGPzEGXC@GDGFG\@NDNTRJBL\JnA@R
  :summary: Cầu Trần Thị Lý
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:49.667151', '2017-05-03 02:35:49.667151');
INSERT INTO distances VALUES (845, 236, 237, 380, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0494195
      :lng: 108.221412
    :southwest:
      :lat: 16.048986
      :lng: 108.2179214
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 380
    :duration:
      :text: 1 min
      :value: 45
    :end_address: 26 Duy Tân, Hòa Thuận Đông, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.048986
      :lng: 108.2179214
    :start_address: 2 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0493969
      :lng: 108.221412
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 380
      :duration:
        :text: 1 min
        :value: 45
      :end_location:
        :lat: 16.048986
        :lng: 108.2179214
      :html_instructions: Head <b>west</b> on <b>Duy Tân</b> toward <b>Núi Thành</b><div
        style="font-size:0.9em">Go through 1 roundabout</div><div style="font-size:0.9em">Pass
        by Chân Gà Nướng Sơn (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: ws}`By~osS@D?\@TC`@?@A@?@A@?@?@?@?@?@?@?@@??@?@@??@@@@@@??@@?@?FxANfBHbAXxEJzA
      :start_location:
        :lat: 16.0493969
        :lng: 108.221412
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ws}`By~osS@b@Av@ABADBNBDB@HxAXjDd@tH
  :summary: Duy Tân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:49.945421', '2017-05-03 02:35:49.945421');
INSERT INTO distances VALUES (846, 237, 238, 855, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0498295
      :lng: 108.2179214
    :southwest:
      :lat: 16.0483291
      :lng: 108.2104113
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 855
    :duration:
      :text: 2 mins
      :value: 97
    :end_address: 86 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0498295
      :lng: 108.2104113
    :start_address: 26 Duy Tân, Hòa Thuận Đông, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.048986
      :lng: 108.2179214
    :steps:
    - :distance:
        :text: 0.9 km
        :value: 855
      :duration:
        :text: 2 mins
        :value: 97
      :end_location:
        :lat: 16.0498295
        :lng: 108.2104113
      :html_instructions: Head <b>west</b> on <b>Duy Tân</b> toward <b>Lê Đình Thám</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Nhỏ Liên Sport (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: eq}`B_iosSRxCTxCT`DXjDPzBL|ABz@Dz@E`@Qd@GLsB`E_AbBwAlC
      :start_location:
        :lat: 16.048986
        :lng: 108.2179214
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: eq}`B_iosSh@rHn@lI^xEHvBE`@Qd@{BnEwCpF
  :summary: Duy Tân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:50.18153', '2017-05-03 02:35:50.18153');
INSERT INTO distances VALUES (847, 238, 239, 438, 20, '---
- :bounds:
    :northeast:
      :lat: 16.053228
      :lng: 108.2104113
    :southwest:
      :lat: 16.0498295
      :lng: 108.2089273
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 438
    :duration:
      :text: 1 min
      :value: 49
    :end_address: 81-89 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.053228
      :lng: 108.2089273
    :start_address: 86 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0498295
      :lng: 108.2104113
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 119
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0504684
        :lng: 108.2095168
      :html_instructions: Head <b>northwest</b> on <b>Duy Tân</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Thang Máy Phát Thành (on the right)</div>
      :polyline:
        :points: mv}`BazmsSo@lAYf@SVED[\
      :start_location:
        :lat: 16.0498295
        :lng: 108.2104113
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 319
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.053228
        :lng: 108.2089273
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Nguyễn
        Hữu Thọ</b><div style="font-size:0.9em">Pass by Quán Phở Hoàn Kiếm - Hà Nội
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: mz}`BotmsSC?A?C?A?A@C?A?C@E@E@EBCBEDCBADCDo@Da@DG@Q@uATa@B[DkBN}BN
      :start_location:
        :lat: 16.0504684
        :lng: 108.2095168
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mv}`BazmsSiAtBY\_@\E?I@UHORCDqAJYBwBXeGd@
  :summary: Duy Tân and Nguyễn Hữu Thọ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:50.438834', '2017-05-03 02:35:50.438834');
INSERT INTO distances VALUES (848, 239, 240, 646, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0581285
      :lng: 108.2089273
    :southwest:
      :lat: 16.053228
      :lng: 108.2064256
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 646
    :duration:
      :text: 1 min
      :value: 80
    :end_address: 88 Nguyễn Tri Phương, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0581285
      :lng: 108.2064256
    :start_address: 81-89 Nguyễn Hữu Thọ, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.053228
      :lng: 108.2089273
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 387
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.056306
        :lng: 108.2076511
      :html_instructions: Head <b>north</b> on <b>Nguyễn Hữu Thọ</b> toward <b>Hẻm
        59 Nguyễn Hữu Thọ</b><div style="font-size:0.9em">Pass by Siêu Thị Mini Mart
        T&amp;T (on the left)</div>
      :polyline:
        :points: uk~`BypmsSeBLgA@c@@E@{@DYB[BMB]Je@Pm@Zk@\k@d@OPWVGHUf@
      :start_location:
        :lat: 16.053228
        :lng: 108.2089273
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 259
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.0581285
        :lng: 108.2064256
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Nguyễn
        Tri Phương</b><div style="font-size:0.9em">Pass by Văn Phòng Luật Sư Lê Lâm
        (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: "}~~`ByhmsS?AA?A??AA?A?A?AAE?E?C?C?E@C@C@CBA@EDABCBAB?DAB?D?B?B@DKLGLMROPQNUN]PSHYJUFmBj@"
      :start_location:
        :lat: 16.056306
        :lng: 108.2076511
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: uk~`BypmsSeBLgA@i@B_CPcA\yAx@{AxAUd@C?EAQAQDMNGP@Rq@`Ag@^q@Z}C~@
  :summary: Nguyễn Hữu Thọ and Nguyễn Tri Phương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:50.645308', '2017-05-03 02:35:50.645308');
INSERT INTO distances VALUES (849, 240, 241, 510, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0621538
      :lng: 108.2064256
    :southwest:
      :lat: 16.0581285
      :lng: 108.2043487
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 510
    :duration:
      :text: 1 min
      :value: 83
    :end_address: 524 Nguyễn Tri Phương, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0621538
      :lng: 108.2043487
    :start_address: 88 Nguyễn Tri Phương, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0581285
      :lng: 108.2064256
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 510
      :duration:
        :text: 1 min
        :value: 83
      :end_location:
        :lat: 16.0621538
        :lng: 108.2043487
      :html_instructions: Head <b>north</b> on <b>Nguyễn Tri Phương</b> toward <b>Nguyễn
        Văn Linh</b><div style="font-size:0.9em">Go through 1 roundabout</div>
      :polyline:
        :points: ij_aBeamsSWHs@RKFGDAAAA?AA?AAA?AAA?AAA?A?A?A?C?A?A?A@A?A@A?A@A@A@A@A@?@A@?@A@?@?@?B?@cA`@wAj@YLy@Va@NIDs@VyAn@]PeEzB
      :start_location:
        :lat: 16.0581285
        :lng: 108.2064256
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ij_aBeamsSkA\SLEEOEQBKLAF?DcA`@mE`B}@\wB`AeEzB
  :summary: Nguyễn Tri Phương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:50.901396', '2017-05-03 02:35:50.901396');
INSERT INTO distances VALUES (850, 241, 242, 414, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0655266
      :lng: 108.2043487
    :southwest:
      :lat: 16.0621538
      :lng: 108.2027168
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 414
    :duration:
      :text: 1 min
      :value: 46
    :end_address: 18 Nguyễn Tri Phương, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0655266
      :lng: 108.2027168
    :start_address: 524 Nguyễn Tri Phương, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0621538
      :lng: 108.2043487
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 414
      :duration:
        :text: 1 min
        :value: 46
      :end_location:
        :lat: 16.0655266
        :lng: 108.2027168
      :html_instructions: Head <b>northwest</b> on <b>Nguyễn Tri Phương</b><div style="font-size:0.9em">Pass
        by Clb Ba Tin (on the left in 350&nbsp;m)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: mc`aBetlsSi@X{@d@YNUJa@PWJc@NyBt@eFbBoA`@
      :start_location:
        :lat: 16.0621538
        :lng: 108.2043487
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mc`aBetlsSuCzAy@\}CdAuHdC
  :summary: Nguyễn Tri Phương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:51.096778', '2017-05-03 02:35:51.096778');
INSERT INTO distances VALUES (851, 242, 156, 488, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0660946
      :lng: 108.2055456
    :southwest:
      :lat: 16.0655266
      :lng: 108.2021739
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 488
    :duration:
      :text: 1 min
      :value: 79
    :end_address: 26 Điện Biên Phủ, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0660524
      :lng: 108.2055456
    :start_address: 18 Nguyễn Tri Phương, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0655266
      :lng: 108.2027168
    :steps:
    - :distance:
        :text: 28 m
        :value: 28
      :duration:
        :text: 1 min
        :value: 5
      :end_location:
        :lat: 16.065755
        :lng: 108.2026143
      :html_instructions: Head <b>northwest</b> on <b>Nguyễn Tri Phương</b>
      :polyline:
        :points: qx`aB_jlsSm@T
      :start_location:
        :lat: 16.0655266
        :lng: 108.2027168
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 460
      :duration:
        :text: 1 min
        :value: 74
      :end_location:
        :lat: 16.0660524
        :lng: 108.2055456
      :html_instructions: At the roundabout, take the <b>4th</b> exit onto <b>Điện
        Biên Phủ</b><div style="font-size:0.9em">Pass by Công ty CP tư vấn giải pháp
        quản lý &amp; công nghệ B.D.S (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: _z`aBiilsSB@@@B@@@@@@B@@@B@D?D@B?B?DAB?BADABABCBCBC@C@CBC?C@C?C@E?CAA?A?A??AA?A?AAA?ECACCCAACCAE?CAC?C?E?C?C@E?C@C@CBC@CBABCBABABA@?@?@?B?@?@?@?@?GcDA]GmDI}BC]Iq@?G
      :start_location:
        :lat: 16.065755
        :lng: 108.2026143
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: qx`aB_jlsSm@TB@DBFHDRAPIPOJOBMAQKKOAQ@QHONIHAH?EcDIkEM{CIy@
  :summary: Điện Biên Phủ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:51.336098', '2017-05-03 02:35:51.336098');
INSERT INTO distances VALUES (852, 156, 244, 279, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0670729
      :lng: 108.2075671
    :southwest:
      :lat: 16.0660524
      :lng: 108.2055456
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 279
    :duration:
      :text: 1 min
      :value: 44
    :end_address: 433 Lê Duẩn, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0670729
      :lng: 108.2075671
    :start_address: 26 Điện Biên Phủ, Chính Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0660524
      :lng: 108.2055456
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 123
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0661472
        :lng: 108.2066868
      :html_instructions: Head <b>east</b> on <b>Điện Biên Phủ</b> toward <b>K 26
        Điện Biên Phủ</b><div style="font-size:0.9em">Pass by Vườn Hoa Kiểng (on the
        left)</div>
      :polyline:
        :points: y{`aBu{lsSA_@C]A]Be@C_@Eo@EQ
      :start_location:
        :lat: 16.0660524
        :lng: 108.2055456
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 156
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0670729
        :lng: 108.2075671
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Lê Duẩn</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Thái Hòa Lê (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: m|`aBybmsS@?@??A@??A@??A@A?A?A?A?A?A?AA??AA??AA??AA?A??AA?A?A??@A?A?A@A??@?@A??@gD}C
      :start_location:
        :lat: 16.0661472
        :lng: 108.2066868
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: y{`aBu{lsSE}@@cAOaBB?BE?MIGKDA@gD{C
  :summary: Điện Biên Phủ and Lê Duẩn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:51.582908', '2017-05-03 02:35:51.582908');
INSERT INTO distances VALUES (853, 244, 245, 408, 20, '---
- :bounds:
    :northeast:
      :lat: 16.06955
      :lng: 108.2102818
    :southwest:
      :lat: 16.0670729
      :lng: 108.2075671
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 408
    :duration:
      :text: 1 min
      :value: 71
    :end_address: 316 Lê Duẩn, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.06955
      :lng: 108.2102818
    :start_address: 433 Lê Duẩn, Thạc Gián, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0670729
      :lng: 108.2075671
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 408
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.06955
        :lng: 108.2102818
      :html_instructions: Head <b>northeast</b> on <b>Lê Duẩn</b> toward <b>K424 Lê
        Duẩn</b><div style="font-size:0.9em">Pass by Shop Himeo - Bông (on the left)</div>
      :polyline:
        :points: ebaaBihmsSa@]iBcBKIk@i@k@g@WSkBcBcAaAa@e@GQGm@E_@
      :start_location:
        :lat: 16.0670729
        :lng: 108.2075671
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ebaaBihmsScEuDcA{@oDeDa@e@GQMmA
  :summary: Lê Duẩn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:51.818744', '2017-05-03 02:35:51.818744');
INSERT INTO distances VALUES (854, 245, 246, 498, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0705166
      :lng: 108.2148661
    :southwest:
      :lat: 16.0695546
      :lng: 108.2103112
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 498
    :duration:
      :text: 2 mins
      :value: 101
    :end_address: 155 Lê Duẩn, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0705166
      :lng: 108.2148661
    :start_address: 315 Lê Duẩn, Tân Chính, Q. Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0695546
      :lng: 108.2103112
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 498
      :duration:
        :text: 2 mins
        :value: 101
      :end_location:
        :lat: 16.0705166
        :lng: 108.2148661
      :html_instructions: Head <b>east</b> on <b>Lê Duẩn</b> toward <b>K 298 Lê Duẩn</b><div
        style="font-size:0.9em">Pass by Cơ Sở Tiện Tin Tưởng (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: uqaaBmymsSIw@SuAi@wDQoAq@cFYyC[{B
      :start_location:
        :lat: 16.0695546
        :lng: 108.2103112
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: uqaaBmymsS]mC{@gGq@cFYyC[{B
  :summary: Lê Duẩn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:52.020464', '2017-05-03 02:35:52.020464');
INSERT INTO distances VALUES (855, 246, 247, 471, 20, '---
- :bounds:
    :northeast:
      :lat: 16.07119
      :lng: 108.2192123
    :southwest:
      :lat: 16.0705166
      :lng: 108.2148661
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 471
    :duration:
      :text: 2 mins
      :value: 100
    :end_address: 58 Lê Duẩn, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.07119
      :lng: 108.2192123
    :start_address: 155 Lê Duẩn, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0705166
      :lng: 108.2148661
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 471
      :duration:
        :text: 2 mins
        :value: 100
      :end_location:
        :lat: 16.07119
        :lng: 108.2192123
      :html_instructions: Head <b>east</b> on <b>Lê Duẩn</b> toward <b>Chi Lăng</b><div
        style="font-size:0.9em">Pass by Shop Mỹ Dung (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: wwaaB}unsSGi@UwBQ{A_@mDIyAKmBEm@K{AMeB
      :start_location:
        :lat: 16.0705166
        :lng: 108.2148661
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wwaaB}unsSoAkLg@qIMeB
  :summary: Lê Duẩn
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:52.26407', '2017-05-03 02:35:52.26407');
INSERT INTO distances VALUES (856, 247, 248, 435, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0734303
      :lng: 108.2211514
    :southwest:
      :lat: 16.07119
      :lng: 108.2192123
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 435
    :duration:
      :text: 2 mins
      :value: 111
    :end_address: 137-139 Nguyễn Chí Thanh, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0734303
      :lng: 108.2208638
    :start_address: 58 Lê Duẩn, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.07119
      :lng: 108.2192123
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 209
      :duration:
        :text: 1 min
        :value: 68
      :end_location:
        :lat: 16.071415
        :lng: 108.2211514
      :html_instructions: Head <b>east</b> on <b>Lê Duẩn</b> toward <b>Kiệt 48 Lê
        Duẩn</b><div style="font-size:0.9em">Pass by Cửa Hàng Điện Lạnh, Điện Tử (on
        the left)</div>
      :polyline:
        :points: "}{aaBaqosSCY?CEm@Ee@MeCG}@EmA"
      :start_location:
        :lat: 16.07119
        :lng: 108.2192123
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 226
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0734303
        :lng: 108.2208638
      :html_instructions: Turn <b>left</b> at Cửa Hàng Yến Sào Việt Nam onto <b>Nguyễn
        Chí Thanh</b><div style="font-size:0.9em">Pass by Cửa hàng thời trang công
        sở Vesse (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: i}aaBe}osSgCP{BRoCR
      :start_location:
        :lat: 16.071415
        :lng: 108.2211514
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}{aaBaqosSOqBUcEEmAgCPkGf@"
  :summary: Lê Duẩn and Nguyễn Chí Thanh
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0734303
      :lng: 108.2209549
    :southwest:
      :lat: 16.0711203
      :lng: 108.2184679
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 548
    :duration:
      :text: 2 mins
      :value: 143
    :end_address: 137-139 Nguyễn Chí Thanh, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0734303
      :lng: 108.2208638
    :start_address: 58 Lê Duẩn, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.07119
      :lng: 108.2192123
    :steps:
    - :distance:
        :text: 55 m
        :value: 55
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0711203
        :lng: 108.218705
      :html_instructions: Head <b>west</b> on <b>Lê Duẩn</b> toward <b>Nguyễn Thị
        Minh Khai</b>
      :polyline:
        :points: "}{aaBaqosSLdB"
      :start_location:
        :lat: 16.07119
        :lng: 108.2192123
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 144
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0723907
        :lng: 108.2184679
      :html_instructions: Turn <b>right</b> at Cửa Hàng Bánh Pía Sóc Trăng onto <b>Nguyễn
        Thị Minh Khai</b>
      :maneuver: turn-right
      :polyline:
        :points: o{aaB{mosSkBPqCZ
      :start_location:
        :lat: 16.0711203
        :lng: 108.218705
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 268
      :duration:
        :text: 1 min
        :value: 73
      :end_location:
        :lat: 16.07271
        :lng: 108.2209581
      :html_instructions: Turn <b>right</b> at Quán Cafe Phước onto <b>Hải Phòng</b><div
        style="font-size:0.9em">Pass by Hanoitourist Bldg (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: mcbaBmlosSK_BOgCC]M}AQkC?A
      :start_location:
        :lat: 16.0723907
        :lng: 108.2184679
      :travel_mode: DRIVING
    - :distance:
        :text: 81 m
        :value: 81
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0734303
        :lng: 108.2208638
      :html_instructions: Turn <b>left</b> at Công Ty Cp Công Nghệ Cotimex onto <b>Nguyễn
        Chí Thanh</b><div style="font-size:0.9em">Pass by Bb Coffee (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mebaB_|osSoCR
      :start_location:
        :lat: 16.07271
        :lng: 108.2209581
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0717557
        :lng: 108.2185874
      :step_index: 1
      :step_interpolation: 0.5
  :overview_polyline:
    :points: "}{aaBaqosSLdBkBPqCZK_BSeD_@iFoCP"
  :summary: Nguyễn Thị Minh Khai and Hải Phòng
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:52.509323', '2017-05-03 02:35:52.509323');
INSERT INTO distances VALUES (857, 248, 249, 692, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0795993
      :lng: 108.2208638
    :southwest:
      :lat: 16.0734303
      :lng: 108.2200012
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 692
    :duration:
      :text: 2 mins
      :value: 129
    :end_address: 8 Nguyễn Chí Thanh, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0795993
      :lng: 108.2200012
    :start_address: 137-139 Nguyễn Chí Thanh, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0734303
      :lng: 108.2208638
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 692
      :duration:
        :text: 2 mins
        :value: 129
      :end_location:
        :lat: 16.0795993
        :lng: 108.2200012
      :html_instructions: Head <b>north</b> on <b>Nguyễn Chí Thanh</b> toward <b>K113
        Nguyễn Chí Thanh</b><div style="font-size:0.9em">Pass by Shop Hoa Tươi Thùy
        Trâm (on the right)</div><div style="font-size:0.9em">Destination will be
        on the right</div>
      :polyline:
        :points: "}ibaBk{osSqAHW@_AH_CHoHl@mDXgG`@aE`@"
      :start_location:
        :lat: 16.0734303
        :lng: 108.2208638
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}ibaBk{osSiBJ_AH_CH}MfAgG`@aE`@"
  :summary: Nguyễn Chí Thanh
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:52.765265', '2017-05-03 02:35:52.765265');
INSERT INTO distances VALUES (858, 249, 250, 290, 20, '---
- :bounds:
    :northeast:
      :lat: 16.080182
      :lng: 108.2200012
    :southwest:
      :lat: 16.0795993
      :lng: 108.218156
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 290
    :duration:
      :text: 1 min
      :value: 62
    :end_address: 126-136 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.080182
      :lng: 108.2183577
    :start_address: 8 Nguyễn Chí Thanh, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0795993
      :lng: 108.2200012
    :steps:
    - :distance:
        :text: 58 m
        :value: 58
      :duration:
        :text: 1 min
        :value: 9
      :end_location:
        :lat: 16.0801097
        :lng: 108.2199141
      :html_instructions: Head <b>north</b> on <b>Nguyễn Chí Thanh</b> toward <b>Lý
        Thường Kiệt</b>
      :polyline:
        :points: opcaB_vosSeBP
      :start_location:
        :lat: 16.0795993
        :lng: 108.2200012
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 190
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0798616
        :lng: 108.218156
      :html_instructions: Turn <b>left</b> at Shop Thời Trang Xuất Khẩu F21 onto <b>Lý
        Thường Kiệt</b><div style="font-size:0.9em">Pass by Showroom Cửa Nguyễn Trọng
        Quang (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: uscaBmuosSDd@HvA`@~E
      :start_location:
        :lat: 16.0801097
        :lng: 108.2199141
      :travel_mode: DRIVING
    - :distance:
        :text: 42 m
        :value: 42
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.080182
        :lng: 108.2183577
      :html_instructions: Turn <b>right</b> at Rửa Xe 148 Đống Đa onto <b>Đống Đa</b><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: crcaBojosS_Ag@
      :start_location:
        :lat: 16.0798616
        :lng: 108.218156
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: opcaB_vosSeBPDd@j@vH_Ag@
  :summary: Lý Thường Kiệt
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:53.099117', '2017-05-03 02:35:53.099117');
INSERT INTO distances VALUES (859, 250, 25, 410, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0824506
      :lng: 108.2211532
    :southwest:
      :lat: 16.080182
      :lng: 108.2183577
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 410
    :duration:
      :text: 1 min
      :value: 61
    :end_address: 14-16 Đống Đa, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0824506
      :lng: 108.2211532
    :start_address: 126-136 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.080182
      :lng: 108.2183577
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 410
      :duration:
        :text: 1 min
        :value: 61
      :end_location:
        :lat: 16.0824506
        :lng: 108.2211532
      :html_instructions: Head <b>northeast</b> on <b>Đống Đa</b> toward <b>Lê Lợi</b>/<b>Trần
        Quý Cáp</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Tư Vấn Kiến Trúc
        Miền Trung (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :polyline:
        :points: ctcaBwkosSo@]u@g@e@]q@a@i@Y]Uc@_@a@a@Yc@Ye@O]M]ES?AESIe@Im@Gq@
      :start_location:
        :lat: 16.080182
        :lng: 108.2183577
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ctcaBwkosSeBeAwA_AgAo@eAaAs@iA]{@UoAQ_B
  :summary: Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:53.366581', '2017-05-03 02:35:53.366581');
INSERT INTO distances VALUES (860, 25, 26, 381, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0842668
      :lng: 108.2225888
    :southwest:
      :lat: 16.0824506
      :lng: 108.2211532
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 381
    :duration:
      :text: 1 min
      :value: 58
    :end_address: 22 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0842668
      :lng: 108.2214247
    :start_address: 14-16 Đống Đa, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0824506
      :lng: 108.2211532
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 121
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0825806
        :lng: 108.2222807
      :html_instructions: Head <b>east</b> on <b>Đống Đa</b><div style="font-size:0.9em">Pass
        by Nhà Thuốc Ngọc Thành (on the right)</div>
      :polyline:
        :points: ibdaBe}osS?EIeAAEImACaA
      :start_location:
        :lat: 16.0824506
        :lng: 108.2211532
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 260
      :duration:
        :text: 1 min
        :value: 33
      :end_location:
        :lat: 16.0842668
        :lng: 108.2214247
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>3 Tháng
        2</b><div style="font-size:0.9em">Pass by Ngân hàng Public Việt Nam, (on the
        right)</div><div style="font-size:0.9em">Destination will be on the left</div>
      :maneuver: roundabout-right
      :polyline:
        :points: ccdaBgdpsS@A@C?A@A@A?C?A@C?A?C?AAA?CAA?AAC?AAAAAAAAAAAAAC?AAA?CAC?A?A?C?A?C@A?A@A@A?A@C@?@ABA@aElCo@j@e@ZA@
      :start_location:
        :lat: 16.0825806
        :lng: 108.2222807
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ibdaBe}osSU_DAcA@EBI@KISSKK?IBoEzCwAhA
  :summary: Đống Đa and 3 Tháng 2
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:53.868464', '2017-05-03 02:35:53.868464');
INSERT INTO distances VALUES (861, 26, 253, 434, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0871156
      :lng: 108.2214096
    :southwest:
      :lat: 16.0842834
      :lng: 108.2195475
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 434
    :duration:
      :text: 1 min
      :value: 69
    :end_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0871156
      :lng: 108.2201066
    :start_address: 22 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0842834
      :lng: 108.2214096
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 245
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :html_instructions: Head <b>northwest</b> on <b>3 Tháng 2</b> toward <b>Đức
        Lợi 2</b><div style="font-size:0.9em">Pass by TheSinhTourist Da Nang (on the
        right)</div>
      :polyline:
        :points: wmdaBy~osSYT[X]VKNU^A@Uf@Sh@Qb@o@`BQ`@
      :start_location:
        :lat: 16.0842834
        :lng: 108.2214096
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 189
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0871156
        :lng: 108.2201066
      :html_instructions: Turn <b>right</b> at Cà Phê 82 onto <b>Xuân Diệu</b><div
        style="font-size:0.9em">Pass by Cafe Monza (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: mudaBesosS}Am@{A]_@Iw@Oc@EKC
      :start_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wmdaBy~osS_BvAW`@i@pAaAdCQ`@}Am@{Bg@{AUKC
  :summary: 3 Tháng 2 and Xuân Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:54.367191', '2017-05-03 02:35:54.367191');
INSERT INTO distances VALUES (862, 253, 254, 201, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0887846
      :lng: 108.2202256
    :southwest:
      :lat: 16.0871156
      :lng: 108.2196676
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.2 km
      :value: 201
    :duration:
      :text: 1 min
      :value: 31
    :end_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0887846
      :lng: 108.2196676
    :start_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0871156
      :lng: 108.2201066
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 201
      :duration:
        :text: 1 min
        :value: 31
      :end_location:
        :lat: 16.0887846
        :lng: 108.2196676
      :html_instructions: Head <b>north</b> on <b>Xuân Diệu</b> toward <b>Huỳnh Lý</b>
      :polyline:
        :points: o_eaBuvosSs@MWEQAOAOFa@NkDvA
      :start_location:
        :lat: 16.0871156
        :lng: 108.2201066
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: o_eaBuvosSkASa@C}EnB
  :summary: Xuân Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:54.607784', '2017-05-03 02:35:54.607784');
INSERT INTO distances VALUES (863, 254, 255, 1207, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0935617
      :lng: 108.2196676
    :southwest:
      :lat: 16.0887846
      :lng: 108.2148184
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.2 km
      :value: 1207
    :duration:
      :text: 3 mins
      :value: 160
    :end_address: Nguyễn Tất Thành, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0899976
      :lng: 108.214882
    :start_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0887846
      :lng: 108.2196676
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 189
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0903076
        :lng: 108.2188787
      :html_instructions: Head <b>northwest</b> on <b>Xuân Diệu</b> toward <b>Huỳnh
        Lý</b><div style="font-size:0.9em">Pass by Công Ty Cp Xuất Nhập Khẩu Xây Dựng
        Nam Á (on the left)</div>
      :polyline:
        :points: "{ieaB}sosScDrAcAb@iAd@"
      :start_location:
        :lat: 16.0887846
        :lng: 108.2196676
      :travel_mode: DRIVING
    - :distance:
        :text: 81 m
        :value: 81
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0906511
        :lng: 108.2195454
      :html_instructions: Turn <b>right</b> at Aloe Garden Homestay toward <b>Như
        Nguyệt</b>
      :maneuver: turn-right
      :polyline:
        :points: mseaB_oosScAeC
      :start_location:
        :lat: 16.0903076
        :lng: 108.2188787
      :travel_mode: DRIVING
    - :distance:
        :text: 0.9 km
        :value: 937
      :duration:
        :text: 2 mins
        :value: 103
      :end_location:
        :lat: 16.0899976
        :lng: 108.214882
      :html_instructions: Turn <b>left</b> onto <b>Như Nguyệt</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: queaBesosSw@`@g@VUNWTWTWVsAdBg@j@e@f@WTYTc@Tu@^k@Xe@ZA@ABABAD?@?B@BFNl@~A^bAVh@R^VZPTTRRPXPTNXLVJXJ^HTDZDVBN?~A?jAEbAEH?
      :start_location:
        :lat: 16.0906511
        :lng: 108.2195454
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{ieaB}sosSgFvBiAd@cAeC_Bx@m@d@o@l@{BpC}@|@}@j@aBx@g@\\ENv@vBv@lBj@z@f@h@l@b@n@\\p@Vt@Nr@HnB?nCKH?"
  :summary: Như Nguyệt
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0935539
      :lng: 108.2196676
    :southwest:
      :lat: 16.0887846
      :lng: 108.2148184
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.6 km
      :value: 1597
    :duration:
      :text: 4 mins
      :value: 238
    :end_address: Nguyễn Tất Thành, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0899976
      :lng: 108.214882
    :start_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0887846
      :lng: 108.2196676
    :steps:
    - :distance:
        :text: 1.0 km
        :value: 1048
      :duration:
        :text: 3 mins
        :value: 163
      :end_location:
        :lat: 16.0933335
        :lng: 108.2172863
      :html_instructions: Head <b>northwest</b> on <b>Xuân Diệu</b> toward <b>Huỳnh
        Lý</b><div style="font-size:0.9em">Pass by Công Ty Cp Xuất Nhập Khẩu Xây Dựng
        Nam Á (on the left)</div>
      :polyline:
        :points: "{ieaB}sosScDrAcAb@iAd@BdBDxBFnCLxGBrA}CNs@Aq@Ig@Kw@We@Uc@YYW_@a@]g@c@aAuAkD"
      :start_location:
        :lat: 16.0887846
        :lng: 108.2196676
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 549
      :duration:
        :text: 1 min
        :value: 75
      :end_location:
        :lat: 16.0899976
        :lng: 108.214882
      :html_instructions: Turn <b>left</b> onto the <b>Nguyễn Tất Thành</b> ramp<div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: iffaBaeosSe@ZA@ABABAD?@?B@BFNl@~A^bAVh@R^VZPTTRRPXPTNXLVJXJ^HTDZDVBN?~A?jAEbAEH?
      :start_location:
        :lat: 16.0933335
        :lng: 108.2172863
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0901424
        :lng: 108.2154232
      :step_index: 0
      :step_interpolation: 0.5333476148590367
  :overview_polyline:
    :points: "{ieaB}sosSgFvBiAd@BdBLhGPlJ}CNs@AyAUw@We@U}@q@_@a@]g@yBmFg@\\CF?Nt@nBv@lBj@z@f@h@l@b@n@\\p@Vt@Nr@HnB?xCK"
  :summary: Xuân Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:54.815989', '2017-05-03 02:35:54.815989');
INSERT INTO distances VALUES (864, 255, 256, 2674, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0998993
      :lng: 108.2300987
    :southwest:
      :lat: 16.0874103
      :lng: 108.214882
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 2.7 km
      :value: 2674
    :duration:
      :text: 4 mins
      :value: 224
    :end_address: Lê Đức Thọ, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0998993
      :lng: 108.2300987
    :start_address: Nguyễn Tất Thành, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0899976
      :lng: 108.214882
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 163
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0885387
        :lng: 108.2150408
      :html_instructions: Head <b>south</b> toward <b>Nguyễn Tất Thành</b>
      :polyline:
        :points: oqeaB_vnsSp@ChAC|@ChBS
      :start_location:
        :lat: 16.0899976
        :lng: 108.214882
      :travel_mode: DRIVING
    - :distance:
        :text: 91 m
        :value: 91
      :duration:
        :text: 1 min
        :value: 9
      :end_location:
        :lat: 16.0877222
        :lng: 108.2149676
      :html_instructions: Merge onto <b>Nguyễn Tất Thành</b>
      :maneuver: merge
      :polyline:
        :points: kheaB_wnsSbDL
      :start_location:
        :lat: 16.0885387
        :lng: 108.2150408
      :travel_mode: DRIVING
    - :distance:
        :text: 0.9 km
        :value: 853
      :duration:
        :text: 1 min
        :value: 79
      :end_location:
        :lat: 16.0934431
        :lng: 108.2170726
      :html_instructions: At the roundabout, take the <b>3rd</b> exit and stay on
        <b>Nguyễn Tất Thành</b><div style="font-size:0.9em">Pass by Đội Quản Lý Cầu
        Thuận Phước (on the right in 400&nbsp;m)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: gceaBqvnsSB@B@B?B@@?B?B?BAB?BABCDA@A@CBA@C@C?C@C?C@C?CAC?A?A?A?AAA?A?AA?ACACACCAAACACACACAC?C?E?C?C@C?C@A@C@ABC@ABsBH[BC?_@TE?E?C?E?sFPoCLgABa@?[Cc@G_@I]IWKWKUOYQUQOMY]SYQ[Ym@Yu@y@yB
      :start_location:
        :lat: 16.0877222
        :lng: 108.2149676
      :travel_mode: DRIVING
    - :distance:
        :text: 1.3 km
        :value: 1336
      :duration:
        :text: 2 mins
        :value: 103
      :end_location:
        :lat: 16.0989822
        :lng: 108.228166
      :html_instructions: Continue onto <b>Cầu Thuận Phước</b><div style="font-size:0.9em">Pass
        by the bridge (on the right in 450&nbsp;m)</div>
      :polyline:
        :points: _gfaBucosSKUi@qA}CsH_D_IsGgPwAsDyDyJyDyJ
      :start_location:
        :lat: 16.0934431
        :lng: 108.2170726
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 231
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0998993
        :lng: 108.2300987
      :html_instructions: <b>Cầu Thuận Phước</b> turns slightly <b>right</b> and becomes
        <b>Lê Đức Thọ</b><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: sigaBaiqsSCWEUeDeIGM
      :start_location:
        :lat: 16.0989822
        :lng: 108.228166
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: oqeaB_vnsSzBG|@ChBSfDNF@L@NGLIDO?WMSMGQAOBKHuBL_@Be@TI?qMb@}@CcAQu@Um@[o@c@i@k@e@u@s@cBeAoCgEeKsLgZqGmPyDyJCWEUeDeIGM
  :summary: Nguyễn Tất Thành and Cầu Thuận Phước
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:55.058106', '2017-05-03 02:35:55.058106');
INSERT INTO distances VALUES (865, 256, 94, 764, 20, '---
- :bounds:
    :northeast:
      :lat: 16.1006123
      :lng: 108.2316782
    :southwest:
      :lat: 16.0968973
      :lng: 108.2300736
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 764
    :duration:
      :text: 1 min
      :value: 87
    :end_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0968973
      :lng: 108.2308965
    :start_address: Lê Đức Thọ, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0998993
      :lng: 108.2300987
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 181
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.1006204
        :lng: 108.231618
      :html_instructions: Head <b>northeast</b> on <b>Lê Đức Thọ</b>
      :polyline:
        :points: kogaBcuqsSiAsCi@wA[cA
      :start_location:
        :lat: 16.0998993
        :lng: 108.2300987
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 525
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Chu
        Huy Mân</b>
      :maneuver: roundabout-right
      :polyline:
        :points: "{sgaBs~qsS@A?A@C?A?ARLLLHLHJbCjGjBy@tAm@dAe@VCzEuB"
      :start_location:
        :lat: 16.1006204
        :lng: 108.231618
      :travel_mode: DRIVING
    - :distance:
        :text: 58 m
        :value: 58
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0968973
        :lng: 108.2308965
      :html_instructions: Turn <b>right</b> onto <b>Lý Nhật Quang</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: a~faBe}qsSh@xABF
      :start_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kogaBcuqsSsBkFYeA@I`@ZRXbCjGjBy@zCsAVCzEuBl@`B
  :summary: Chu Huy Mân
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.1006198
      :lng: 108.2325999
    :southwest:
      :lat: 16.0969444
      :lng: 108.2300987
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 798
    :duration:
      :text: 2 mins
      :value: 113
    :end_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0969444
      :lng: 108.2309242
    :start_address: Lê Đức Thọ, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0998993
      :lng: 108.2300987
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 181
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.1006204
        :lng: 108.231618
      :html_instructions: Head <b>northeast</b> on <b>Lê Đức Thọ</b>
      :polyline:
        :points: kogaBcuqsSiAsCi@wA[cA
      :start_location:
        :lat: 16.0998993
        :lng: 108.2300987
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 207
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0991486
        :lng: 108.2325999
      :html_instructions: At the roundabout, take the <b>2nd</b> exit
      :maneuver: roundabout-right
      :polyline:
        :points: "{sgaBs~qsS@A?A@C?A?A@A?A?C?A?C?AAA?CAAACj@UpAi@lAm@xAm@"
      :start_location:
        :lat: 16.1006204
        :lng: 108.231618
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 274
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0980178
        :lng: 108.23032
      :html_instructions: Turn <b>right</b> onto <b>Khúc Thừa Dụ</b>
      :maneuver: turn-right
      :polyline:
        :points: ujgaBwdrsStBdFz@nBDPh@~A
      :start_location:
        :lat: 16.0991486
        :lng: 108.2325999
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 136
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0969444
        :lng: 108.2309242
      :html_instructions: Turn <b>left</b> onto <b>Hoa Lư</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: scgaBovqsSlB_AhBw@
      :start_location:
        :lat: 16.0980178
        :lng: 108.23032
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.1003043
        :lng: 108.2319788
      :step_index: 1
      :step_interpolation: 0.2999918621595643
  :overview_polyline:
    :points: kogaBcuqsSsBkFYeA@I?UCE|B_AfD{ApDtIn@pBvEwB
  :summary: Khúc Thừa Dụ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:55.325105', '2017-05-03 02:35:55.325105');
INSERT INTO distances VALUES (866, 94, 143, 522, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0968973
      :lng: 108.2310058
    :southwest:
      :lat: 16.0941311
      :lng: 108.2290064
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 522
    :duration:
      :text: 2 mins
      :value: 104
    :end_address: 296 Khúc Hạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0941311
      :lng: 108.2310058
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0968973
      :lng: 108.2308965
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 227
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :html_instructions: Head <b>southwest</b> on <b>Lý Nhật Quang</b> toward <b>Lê
        Hữu Kiều</b><div style="font-size:0.9em">Pass by Dịch Vụ Nấu Ăn Long Vỹ (on
        the right)</div>
      :polyline:
        :points: s|faBczqsSfAfCz@vBv@xB
      :start_location:
        :lat: 16.0968973
        :lng: 108.2308965
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 295
      :duration:
        :text: 1 min
        :value: 69
      :end_location:
        :lat: 16.0941311
        :lng: 108.2310058
      :html_instructions: Turn <b>left</b> onto <b>Khúc Hạo</b><div style="font-size:0.9em">Pass
        by Điện nước Út Tài (on the left)</div><div style="font-size:0.9em">Destination
        will be on the left</div>
      :maneuver: turn-left
      :polyline:
        :points: wvfaBinqsSvEeFv@aAz@_A`@g@
      :start_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: s|faBczqsSbC~Fv@xBvEeFrBaC`@g@
  :summary: Lý Nhật Quang and Khúc Hạo
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0971328
      :lng: 108.2330445
    :southwest:
      :lat: 16.0938455
      :lng: 108.2308965
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 619
    :duration:
      :text: 2 mins
      :value: 98
    :end_address: 296 Khúc Hạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0941311
      :lng: 108.2310058
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0968973
      :lng: 108.2308965
    :steps:
    - :distance:
        :text: 58 m
        :value: 58
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :html_instructions: Head <b>northeast</b> on <b>Lý Nhật Quang</b> toward <b>Hoa
        Lư</b>
      :polyline:
        :points: s|faBczqsSCGi@yA
      :start_location:
        :lat: 16.0968973
        :lng: 108.2308965
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 242
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0956495
        :lng: 108.2330445
      :html_instructions: Turn <b>right</b> at the 2nd cross street onto <b>Chu Huy
        Mân</b>
      :maneuver: turn-right
      :polyline:
        :points: a~faBe}qsSfHiI
      :start_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 272
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0938455
        :lng: 108.231326
      :html_instructions: Turn <b>right</b> at the 1st cross street toward <b>Khúc
        Hạo</b>
      :maneuver: turn-right
      :polyline:
        :points: ytfaBogrsSdA`AlBdBrDlD
      :start_location:
        :lat: 16.0956495
        :lng: 108.2330445
      :travel_mode: DRIVING
    - :distance:
        :text: 47 m
        :value: 47
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0941311
        :lng: 108.2310058
      :html_instructions: Turn <b>right</b> at Quán Ăn Chiều Nhớ onto <b>Khúc Hạo</b><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: qifaBy|qsSSXc@d@
      :start_location:
        :lat: 16.0938455
        :lng: 108.231326
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0950278
        :lng: 108.2324541
      :step_index: 2
      :step_interpolation: 0.3441406857084005
  :overview_polyline:
    :points: s|faBczqsSm@aBfHiIdA`A`HrGw@~@
  :summary: Chu Huy Mân
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0969444
      :lng: 108.2315589
    :southwest:
      :lat: 16.0941311
      :lng: 108.2301572
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 440
    :duration:
      :text: 2 mins
      :value: 102
    :end_address: 296 Khúc Hạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0941311
      :lng: 108.2310058
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0969444
      :lng: 108.2309242
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 96
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0963386
        :lng: 108.2315589
      :html_instructions: Head <b>southeast</b> on <b>Hoa Lư</b> toward <b>Lý Nhật
        Quang</b><div style="font-size:0.9em">Pass by CC 3B Làng Cá (on the right)</div>
      :polyline:
        :points: "{|faBgzqsSBCrB{B"
      :start_location:
        :lat: 16.0969444
        :lng: 108.2309242
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 221
      :duration:
        :text: 1 min
        :value: 43
      :end_location:
        :lat: 16.0948823
        :lng: 108.2301572
      :html_instructions: Turn <b>right</b> onto <b>Hồ Sĩ Tân</b>
      :maneuver: turn-right
      :polyline:
        :points: cyfaBg~qsSnBjBtArA|AvA
      :start_location:
        :lat: 16.0963386
        :lng: 108.2315589
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 123
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0941311
        :lng: 108.2310058
      :html_instructions: Turn <b>left</b> at Quán Cà Phê Khánh Quỳnh onto <b>Khúc
        Hạo</b><div style="font-size:0.9em">Pass by Đại Lý Nệm Lan Khoa (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: _pfaBouqsSv@aAz@_A`@g@
      :start_location:
        :lat: 16.0948823
        :lng: 108.2301572
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0955633
        :lng: 108.2308108
      :step_index: 1
      :step_interpolation: 0.5329889427270765
  :overview_polyline:
    :points: "{|faBgzqsSvB_CdE~D|AvAv@aA|AgB"
  :summary: Hồ Sĩ Tân and Khúc Hạo
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:55.568864', '2017-05-03 02:35:55.568864');
INSERT INTO distances VALUES (867, 143, 259, 490, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0941311
      :lng: 108.2337853
    :southwest:
      :lat: 16.0910667
      :lng: 108.2310058
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 490
    :duration:
      :text: 1 min
      :value: 79
    :end_address: Trần Thánh Tông, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0910667
      :lng: 108.2332661
    :start_address: 296 Khúc Hạo, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0941311
      :lng: 108.2310058
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 407
      :duration:
        :text: 1 min
        :value: 60
      :end_location:
        :lat: 16.0916227
        :lng: 108.2337853
      :html_instructions: Head <b>southeast</b> on <b>Khúc Hạo</b> toward <b>Bùi Huy
        Bích</b><div style="font-size:0.9em">Pass by Cửa Hàng Điện Nước Út Tài (on
        the left)</div>
      :polyline:
        :points: ikfaByzqsSb@e@RYdAiAzCoD|DoE\a@
      :start_location:
        :lat: 16.0941311
        :lng: 108.2310058
      :travel_mode: DRIVING
    - :distance:
        :text: 83 m
        :value: 83
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0910667
        :lng: 108.2332661
      :html_instructions: Turn <b>right</b>
      :maneuver: turn-right
      :polyline:
        :points: s{eaBelrsSjAfA`@^
      :start_location:
        :lat: 16.0916227
        :lng: 108.2337853
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ikfaByzqsSxGyHzEqFlBfB
  :summary: Khúc Hạo
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:55.885975', '2017-05-03 02:35:55.885975');
INSERT INTO distances VALUES (868, 259, 260, 839, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0910667
      :lng: 108.236144
    :southwest:
      :lat: 16.0853985
      :lng: 108.2325914
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 839
    :duration:
      :text: 2 mins
      :value: 133
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0853985
      :lng: 108.236144
    :start_address: Trần Thánh Tông, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0910667
      :lng: 108.2332661
    :steps:
    - :distance:
        :text: 82 m
        :value: 82
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0905183
        :lng: 108.2327579
      :html_instructions: Head <b>southwest</b> toward <b>Phạm Huy Thông</b>
      :polyline:
        :points: exeaB}hrsSj@f@b@`@\Z
      :start_location:
        :lat: 16.0910667
        :lng: 108.2332661
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 203
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0886929
        :lng: 108.232768
      :html_instructions: Turn <b>left</b> at <b>Phạm Huy Thông</b><div style="font-size:0.9em">Pass
        by Lớp Mẫu Giáo Ánh Dương (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: wteaBwersSpEA~A?z@?
      :start_location:
        :lat: 16.0905183
        :lng: 108.2327579
      :travel_mode: DRIVING
    - :distance:
        :text: 0.6 km
        :value: 554
      :duration:
        :text: 1 min
        :value: 79
      :end_location:
        :lat: 16.0853985
        :lng: 108.236144
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Trần
        Thánh Tông</b><div style="font-size:0.9em">Pass by Cà Phê Ti Gôn (on the right
        in 300&nbsp;m)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: iieaByersS?D@BBB@BBB@BB@BBD@B@B?D?D@FABABABABABCBCBC@C@C@E?C@E?C?EAC?EACd@q@|AmB|@}@Za@rA}AlAuAvBeC`AgA
      :start_location:
        :lat: 16.0886929
        :lng: 108.232768
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: exeaB}hrsSnAhA\ZpEAzC?@HJNPHV?NGLODSASACd@q@zCkDtH{I`AgA
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:56.208738', '2017-05-03 02:35:56.208738');
INSERT INTO distances VALUES (869, 260, 261, 640, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0862061
      :lng: 108.2403486
    :southwest:
      :lat: 16.083764
      :lng: 108.236144
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 640
    :duration:
      :text: 1 min
      :value: 70
    :end_address: 330 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0862061
      :lng: 108.2403486
    :start_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0853985
      :lng: 108.236144
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 252
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.0838566
        :lng: 108.2378718
      :html_instructions: Head <b>southeast</b> on <b>Trần Thánh Tông</b> toward <b>Lý
        Đạo Thành</b><div style="font-size:0.9em">Pass by Quán Cà Phê Hùng Huy (on
        the right)</div>
      :polyline:
        :points: wtdaB{zrsSJKt@}@PU~@eA~@gAvAaBFI
      :start_location:
        :lat: 16.0853985
        :lng: 108.236144
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 388
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0862061
        :lng: 108.2403486
      :html_instructions: Turn <b>left</b> at Công Ty Điện Tử &amp; Tin Học Hoàng
        Minh onto <b>Ngô Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by
        Cửa Hàng Nhôm Kính Phước Chính (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: ckdaBuessSRQMOiCeCmBmB}AuAe@e@_B}A
      :start_location:
        :lat: 16.0838566
        :lng: 108.2378718
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wtdaB{zrsSrCeDrDeEMOwFsFcFyE
  :summary: Trần Thánh Tông and Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:57.566368', '2017-05-03 02:35:57.566368');
INSERT INTO distances VALUES (870, 261, 262, 423, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0895056
      :lng: 108.2422483
    :southwest:
      :lat: 16.0862061
      :lng: 108.2403486
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 423
    :duration:
      :text: 1 min
      :value: 54
    :end_address: 322 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0895056
      :lng: 108.2422483
    :start_address: 330 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0862061
      :lng: 108.2403486
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 423
      :duration:
        :text: 1 min
        :value: 54
      :end_location:
        :lat: 16.0895056
        :lng: 108.2422483
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Phó Đức Chính</b><div style="font-size:0.9em">Pass by Dịch Vụ Vẽ Thiết
        Kế Mỹ Thuật Minh Trí (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: yydaBeussSgAgAOMSQk@e@}@c@oAe@cA]yAe@YKQGqBu@EAk@S
      :start_location:
        :lat: 16.0862061
        :lng: 108.2403486
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yydaBeussSwAuA_Aw@}@c@oAe@}CcAcDkAk@S
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0895056
      :lng: 108.2422483
    :southwest:
      :lat: 16.0862061
      :lng: 108.2403486
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 457
    :duration:
      :text: 1 min
      :value: 69
    :end_address: 322 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0895056
      :lng: 108.2422483
    :start_address: 330 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0862061
      :lng: 108.2403486
    :steps:
    - :distance:
        :text: 67 m
        :value: 67
      :duration:
        :text: 1 min
        :value: 6
      :end_location:
        :lat: 16.0866465
        :lng: 108.2407812
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Phó Đức Chính</b><div style="font-size:0.9em">Pass by Dịch Vụ Vẽ Thiết
        Kế Mỹ Thuật Minh Trí (on the right)</div>
      :polyline:
        :points: yydaBeussSgAgAOM
      :start_location:
        :lat: 16.0862061
        :lng: 108.2403486
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 243
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.0884294
        :lng: 108.241881
      :html_instructions: Keep <b>right</b> to continue toward <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Kim Ân Phú (on the right)</div>
      :maneuver: keep-right
      :polyline:
        :points: q|daB{wssSJGWYu@i@}@e@cFiB
      :start_location:
        :lat: 16.0866465
        :lng: 108.2407812
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 147
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0895056
        :lng: 108.2422483
      :html_instructions: Continue straight past Quán Ăn Thương onto <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Đtdđ Duy Tuấn (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: straight
      :polyline:
        :points: ugeaBw~ssSc@O@XQGqBu@EAk@S
      :start_location:
        :lat: 16.0884294
        :lng: 108.241881
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0875409
        :lng: 108.2414693
      :step_index: 1
      :step_interpolation: 0.5549598474235001
  :overview_polyline:
    :points: yydaBeussSwAuAJGWYu@i@}@e@gGyB@XQGwBw@k@S
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:58.151034', '2017-05-03 02:35:58.151034');
INSERT INTO distances VALUES (600, 196, 197, 966, 19, '---
- :bounds:
    :northeast:
      :lat: 16.1071733
      :lng: 108.2540872
    :southwest:
      :lat: 16.105019
      :lng: 108.2465232
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 966
    :duration:
      :text: 2 mins
      :value: 107
    :end_address: 53 Yết Kiêu, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.105019
      :lng: 108.2467799
    :start_address: Lê Đức Thọ, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.1059095
      :lng: 108.2540872
    :steps:
    - :distance:
        :text: 0.9 km
        :value: 854
      :duration:
        :text: 1 min
        :value: 83
      :end_location:
        :lat: 16.1058893
        :lng: 108.2466645
      :html_instructions: Head <b>northwest</b> on <b>Lê Đức Thọ</b><div style="font-size:0.9em">Pass
        by Cà Phê Khánh Trinh (on the right)</div>
      :polyline:
        :points: "}thaBakvsScAvA_@f@IRS\\Ub@S^O^K^K`@G^If@Il@Gz@AZAJ?b@@h@?^DXDd@F^P~@Nh@DNXpAh@~BFV\\xAVjAPv@Pt@Lf@?@Lj@"
      :start_location:
        :lat: 16.1059095
        :lng: 108.2540872
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 112
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.105019
        :lng: 108.2467799
      :html_instructions: Turn <b>left</b> at Quán Thịt Cầy Nam Định onto <b>Yết Kiêu</b>/<b>QL14B</b><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: ythaBs|tsSHZBAPEf@OdB[
      :start_location:
        :lat: 16.1058893
        :lng: 108.2466645
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}thaBakvsScB~B]p@i@bA[~@S`AStAIvAAn@@hAJ~@X~ATx@hBbIhA`FLl@HZBAx@UdB["
  :summary: Lê Đức Thọ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:04.753514', '2017-05-03 02:27:04.753514');
INSERT INTO distances VALUES (871, 262, 263, 697, 20, '---
- :bounds:
    :northeast:
      :lat: 16.0952537
      :lng: 108.2448366
    :southwest:
      :lat: 16.0895056
      :lng: 108.2422483
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 697
    :duration:
      :text: 1 min
      :value: 55
    :end_address: Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0952537
      :lng: 108.2448366
    :start_address: 322 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0895056
      :lng: 108.2422483
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 697
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0952537
        :lng: 108.2448366
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Trương Định</b><div style="font-size:0.9em">Pass by Cà Phê Cây Bàng (on
        the left)</div>
      :polyline:
        :points: mneaBaatsSsAe@mBw@y@Ww@WYK}Bw@k@SMEa@OkAc@k@SiC{@oBq@yAg@gCy@?A
      :start_location:
        :lat: 16.0895056
        :lng: 108.2422483
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mneaBaatsSaE}AqBo@qE}AmBs@uDoAqIuC
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0952537
      :lng: 108.2448366
    :southwest:
      :lat: 16.0895056
      :lng: 108.2422483
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 715
    :duration:
      :text: 1 min
      :value: 80
    :end_address: Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0952537
      :lng: 108.2448366
    :start_address: 322 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0895056
      :lng: 108.2422483
    :steps:
    - :distance:
        :text: 52 m
        :value: 52
      :duration:
        :text: 1 min
        :value: 5
      :end_location:
        :lat: 16.0899333
        :lng: 108.2424361
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Trương Định</b>
      :polyline:
        :points: mneaBaatsSsAe@
      :start_location:
        :lat: 16.0895056
        :lng: 108.2422483
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 294
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0922462
        :lng: 108.2435782
      :html_instructions: Keep <b>right</b> to continue toward <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa Ngọc Phương (on the right)</div>
      :maneuver: keep-right
      :polyline:
        :points: aqeaBgbtsSDO]KoAe@w@[oAc@_Cy@k@Ss@S
      :start_location:
        :lat: 16.0899333
        :lng: 108.2424361
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 369
      :duration:
        :text: 1 min
        :value: 33
      :end_location:
        :lat: 16.0952537
        :lng: 108.2448366
      :html_instructions: Keep <b>left</b> to continue on <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Công Ty Tnhh Đức Toàn (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: keep-left
      :polyline:
        :points: q_faBkitsSCLkAc@k@SiC{@oBq@yAg@gCy@?A
      :start_location:
        :lat: 16.0922462
        :lng: 108.2435782
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0914543
        :lng: 108.2432344
      :step_index: 1
      :step_interpolation: 0.6758611585724549
  :overview_polyline:
    :points: mneaBaatsSsAe@DOmBq@gC_AkDmAs@SCLwBw@{MoE?A
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:58.421724', '2017-05-03 02:35:58.421724');
INSERT INTO distances VALUES (872, 263, 264, 641, 20, '---
- :bounds:
    :northeast:
      :lat: 16.1005549
      :lng: 108.2471881
    :southwest:
      :lat: 16.0952537
      :lng: 108.2448366
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 641
    :duration:
      :text: 1 min
      :value: 70
    :end_address: 31 Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.1005549
      :lng: 108.2471881
    :start_address: Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0952537
      :lng: 108.2448366
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 641
      :duration:
        :text: 1 min
        :value: 70
      :end_location:
        :lat: 16.1005549
        :lng: 108.2471881
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Phạm Bằng</b>/<b>Đinh Công Trứ</b><div style="font-size:0.9em">Pass by
        Cà Phê Euro (on the right)</div><div style="font-size:0.9em">Destination will
        be on the right</div>
      :polyline:
        :points: irfaBgqtsSs@U_A[{Ai@uAe@eA]}Bw@m@SyAa@a@MoCcAi@QeA_@iAa@eAa@
      :start_location:
        :lat: 16.0952537
        :lng: 108.2448366
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: irfaBgqtsSeHaCcEuAgCu@aHcCoCcA
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:58.723101', '2017-05-03 02:35:58.723101');
INSERT INTO distances VALUES (873, 264, 265, 582, 20, '---
- :bounds:
    :northeast:
      :lat: 16.1054634
      :lng: 108.2477906
    :southwest:
      :lat: 16.1005549
      :lng: 108.2467954
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 582
    :duration:
      :text: 1 min
      :value: 60
    :end_address: 53 Yết Kiêu, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.1054634
      :lng: 108.2467954
    :start_address: 31 Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.1005549
      :lng: 108.2471881
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 117
      :duration:
        :text: 1 min
        :value: 11
      :end_location:
        :lat: 16.1015299
        :lng: 108.2476054
      :html_instructions: Head <b>northeast</b> on <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Cafe Bảo Trâm (on the right)</div>
      :polyline:
        :points: msgaB}_usSaDiAOCQE
      :start_location:
        :lat: 16.1005549
        :lng: 108.2471881
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 465
      :duration:
        :text: 1 min
        :value: 49
      :end_location:
        :lat: 16.1054634
        :lng: 108.2467954
      :html_instructions: At the roundabout, take the <b>3rd</b> exit and stay on
        <b>Ngô Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Continue to follow
        QL14B</div><div style="font-size:0.9em">Pass by Cửa Hàng Đồ Gỗ Quốc Phương
        (on the right in 400&nbsp;m)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: qygaBqbusSAE?CAAACAACCAAAACACAAACAC?CAG?C?C?C?C@C@C@C@A??@A??@A??@A??@A@A@?@?@A??@?@e@AW@g@Dm@Fi@Hi@JqDr@_@He@JgAPoCh@A?
      :start_location:
        :lat: 16.1015299
        :lng: 108.2476054
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: msgaB}_usSqDmAQEAEAECEKIMESAODKFEJe@?_AFwAP{E~@eATwEz@A?
  :summary: QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:58.985821', '2017-05-03 02:35:58.985821');
INSERT INTO distances VALUES (874, 265, 266, 578, 20, '---
- :bounds:
    :northeast:
      :lat: 16.1070771
      :lng: 108.2515601
    :southwest:
      :lat: 16.1054634
      :lng: 108.2467065
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 578
    :duration:
      :text: 1 min
      :value: 69
    :end_address: Lê Đức Thọ, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.1070597
      :lng: 108.2515601
    :start_address: 53 Yết Kiêu, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.1054634
      :lng: 108.2467954
    :steps:
    - :distance:
        :text: 35 m
        :value: 35
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.1057666
        :lng: 108.2467065
      :html_instructions: Head <b>north</b> on <b>Yết Kiêu</b>/<b>QL14B</b> toward
        <b>Lê Đức Thọ</b>
      :polyline:
        :points: crhaBo}tsSSDi@J
      :start_location:
        :lat: 16.1054634
        :lng: 108.2467954
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 543
      :duration:
        :text: 1 min
        :value: 59
      :end_location:
        :lat: 16.1070597
        :lng: 108.2515601
      :html_instructions: Turn <b>right</b> onto <b>Lê Đức Thọ</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: athaB}|tsSGa@CIe@iBWcAQq@]wASw@_@sAYoACMI]_@uBIw@Cq@Am@?i@Be@
      :start_location:
        :lat: 16.1057666
        :lng: 108.2467065
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: crhaBo}tsS}@PKk@mBwHqAiFi@sCMiBAwABe@
  :summary: Lê Đức Thọ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:59.283647', '2017-05-03 02:35:59.283647');
INSERT INTO distances VALUES (875, 266, 195, 1258, 20, '---
- :bounds:
    :northeast:
      :lat: 16.1070597
      :lng: 108.2573812
    :southwest:
      :lat: 16.0995138
      :lng: 108.2515601
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.3 km
      :value: 1258
    :duration:
      :text: 2 mins
      :value: 114
    :end_address: Hoàng Sa, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0995138
      :lng: 108.2549446
    :start_address: Lê Đức Thọ, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.1070597
      :lng: 108.2515601
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 455
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.1049327
        :lng: 108.255088
      :html_instructions: Head <b>east</b> on <b>Lê Đức Thọ</b> toward <b>Thành Vinh
        2</b><div style="font-size:0.9em">Pass by Nhà Nghỉ Minh An (on the right in
        350&nbsp;m)</div>
      :polyline:
        :points: c|haBg{usS@QFo@Jm@BMLk@Rw@L]\k@d@aA\e@jAaBf@s@h@u@JOHMV_@NQJGTI
      :start_location:
        :lat: 16.1070597
        :lng: 108.2515601
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 432
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.101653
        :lng: 108.2572024
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Lê Đức Thọ</b>
      :maneuver: roundabout-right
      :polyline:
        :points: ynhaBiqvsSD?DAHABCBEFQNM^U~BoALIDAhEaCZQZQ~@g@vAs@JC
      :start_location:
        :lat: 16.1049327
        :lng: 108.255088
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 371
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.0995138
        :lng: 108.2549446
      :html_instructions: Turn <b>right</b> onto <b>Hoàng Sa</b><div style="font-size:0.9em">Pass
        by Quán ăn Eo Biển (on the right in 350&nbsp;m)</div><div style="font-size:0.9em">Destination
        will be on the left</div>
      :maneuver: turn-right
      :polyline:
        :points: izgaBo~vsSv@c@HRf@bA|@fB`@h@jCbD`@`@j@l@FH
      :start_location:
        :lat: 16.101653
        :lng: 108.2572024
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: c|haBg{usSHaAN{@`@cBj@iAd@aA\e@rBuCvAsBZYZIRGJWNM^UlCyAnEcCv@c@vC{AbAg@p@vA|@fB`@h@jCbD`@`@r@v@
  :summary: Lê Đức Thọ and Hoàng Sa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:35:59.532932', '2017-05-03 02:35:59.532932');
INSERT INTO distances VALUES (599, 195, 196, 989, 19, '---
- :bounds:
    :northeast:
      :lat: 16.1059095
      :lng: 108.2575607
    :southwest:
      :lat: 16.0995138
      :lng: 108.2540872
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.0 km
      :value: 989
    :duration:
      :text: 2 mins
      :value: 93
    :end_address: Lê Đức Thọ, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.1059095
      :lng: 108.2540872
    :start_address: Hoàng Sa, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0995138
      :lng: 108.2549446
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 334
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.1013685
        :lng: 108.2573812
      :html_instructions: Head <b>northeast</b> on <b>Hoàng Sa</b> toward <b>Nguyễn
        Phan Vinh</b><div style="font-size:0.9em">Pass by Quán ăn Eo Biển (on the
        left)</div>
      :polyline:
        :points: "}lgaBkpvsSGIk@m@a@a@kCcDa@i@}@gBg@cAIS"
      :start_location:
        :lat: 16.0995138
        :lng: 108.2549446
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 464
      :duration:
        :text: 1 min
        :value: 45
      :end_location:
        :lat: 16.1048782
        :lng: 108.2554404
      :html_instructions: Turn <b>left</b> onto <b>Lê Đức Thọ</b>
      :maneuver: turn-left
      :polyline:
        :points: qxgaBs_wsSQc@}@\k@^kDlBo@\sC|AWNgAl@k@Zk@XGDQD
      :start_location:
        :lat: 16.1013685
        :lng: 108.2573812
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 191
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.1059095
        :lng: 108.2540872
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Lê Đức Thọ</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: onhaBosvsSG?I@IDEFADADAH@D?@KRMT[b@CD}AvBOR
      :start_location:
        :lat: 16.1048782
        :lng: 108.2554404
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}lgaBkpvsSs@w@a@a@kCcDa@i@}@gBq@wAQc@}@\\wElCcHxDwAt@YJQ@OLCJ?NKTi@x@qBpC"
  :summary: Hoàng Sa and Lê Đức Thọ
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:04.442077', '2017-05-03 02:27:04.442077');
INSERT INTO distances VALUES (601, 197, 198, 518, 19, '---
- :bounds:
    :northeast:
      :lat: 16.105019
      :lng: 108.2475236
    :southwest:
      :lat: 16.1006035
      :lng: 108.2467799
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 518
    :duration:
      :text: 1 min
      :value: 57
    :end_address: 2-6 Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.1006035
      :lng: 108.2470856
    :start_address: 53 Yết Kiêu, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.105019
      :lng: 108.2467799
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 348
      :duration:
        :text: 1 min
        :value: 36
      :end_location:
        :lat: 16.1019861
        :lng: 108.2474952
      :html_instructions: Head <b>south</b> on <b>Yết Kiêu</b>/<b>QL14B</b> toward
        <b>Mân Quang 2</b><div style="font-size:0.9em">Pass by Quán Nhậu Tú Mập (on
        the right)</div>
      :polyline:
        :points: kohaBk}tsS^GbDq@dE}@REr@Mb@C\CP?NAJ@N@J@
      :start_location:
        :lat: 16.105019
        :lng: 108.2467799
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 170
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.1006035
        :lng: 108.2470856
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Ngô
        Quyền</b>/<b>QL14B</b><div style="font-size:0.9em">Pass by ShopHouse NGO QUYEN
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: m|gaB{ausS@D@@@B@@B@@BB@@@@?B@@?@@@?B@@?@?B?B?B?BAB?BABA@?@A@?@A@A@A@??A@ALB\DH@FBbCt@
      :start_location:
        :lat: 16.1019861
        :lng: 108.2474952
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kohaBk}tsS|K}BvAQn@Cv@BFLTLX?TIDE|@NbCt@
  :summary: Yết Kiêu/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:05.12073', '2017-05-03 02:27:05.12073');
INSERT INTO distances VALUES (602, 198, 199, 550, 19, '---
- :bounds:
    :northeast:
      :lat: 16.1006035
      :lng: 108.2470856
    :southwest:
      :lat: 16.0960597
      :lng: 108.2450663
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 550
    :duration:
      :text: 1 min
      :value: 60
    :end_address: The Summit, Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0960597
      :lng: 108.2450663
    :start_address: 2-6 Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.1006035
      :lng: 108.2470856
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 550
      :duration:
        :text: 1 min
        :value: 60
      :end_location:
        :lat: 16.0960597
        :lng: 108.2450663
      :html_instructions: Head <b>south</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Mân Quang 11</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Toàn
        Phước (on the right)</div><div style="font-size:0.9em">Destination will be
        on the right</div>
      :polyline:
        :points: wsgaBi_usSpBp@tAn@pAd@~@ZdLpDjC|@
      :start_location:
        :lat: 16.1006035
        :lng: 108.2470856
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wsgaBi_usSpBp@tAn@pC`ApPnF
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:05.433783', '2017-05-03 02:27:05.433783');
INSERT INTO distances VALUES (603, 199, 200, 766, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0960597
      :lng: 108.2450663
    :southwest:
      :lat: 16.0897278
      :lng: 108.2422464
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 766
    :duration:
      :text: 1 min
      :value: 61
    :end_address: 148 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0897278
      :lng: 108.2422464
    :start_address: The Summit, Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0960597
      :lng: 108.2450663
    :steps:
    - :distance:
        :text: 0.8 km
        :value: 766
      :duration:
        :text: 1 min
        :value: 61
      :end_location:
        :lat: 16.0897278
        :lng: 108.2422464
      :html_instructions: Head <b>southwest</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Bình Than</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa 130
        (on the right)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :polyline:
        :points: kwfaBurtsSl@TtDnAfA\pBn@jBv@lBn@rBp@|Ah@x@VHB`A^f@RdEtAr@T
      :start_location:
        :lat: 16.0960597
        :lng: 108.2450663
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kwfaBurtsS|KrDxEfBpEzAlDnAxFjB
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0960597
      :lng: 108.2450663
    :southwest:
      :lat: 16.0897278
      :lng: 108.2422464
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 787
    :duration:
      :text: 1 min
      :value: 74
    :end_address: 148 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0897278
      :lng: 108.2422464
    :start_address: The Summit, Ngô Quyền, Thọ Quang, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0960597
      :lng: 108.2450663
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 316
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0934517
        :lng: 108.2438933
      :html_instructions: Head <b>southwest</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Bình Than</b><div style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa 130
        (on the right)</div>
      :polyline:
        :points: kwfaBurtsSl@TtDnAfA\pBn@jBv@
      :start_location:
        :lat: 16.0960597
        :lng: 108.2450663
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 429
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0900227
        :lng: 108.2422711
      :html_instructions: Keep <b>right</b> to continue toward <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Văn Phòng Liên Danh Công Ty Tnhh Kỹ Thuật
        Môi Trường Upl (on the right)</div>
      :maneuver: keep-right
      :polyline:
        :points: agfaBiktsSGNrFbBnCfAjBl@lBn@vAh@
      :start_location:
        :lat: 16.0934517
        :lng: 108.2438933
      :travel_mode: DRIVING
    - :distance:
        :text: 42 m
        :value: 42
      :duration:
        :text: 1 min
        :value: 5
      :end_location:
        :lat: 16.0897278
        :lng: 108.2422464
      :html_instructions: Keep <b>left</b> to continue on <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Tiệm Sửa Xe Quang Đệ 2 (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: keep-left
      :polyline:
        :points: sqeaBeatsS?ADOr@T
      :start_location:
        :lat: 16.0900227
        :lng: 108.2422711
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0934694
        :lng: 108.2438519
      :step_index: 1
      :step_interpolation: 0.01129871552018311
  :overview_polyline:
    :points: kwfaBurtsS|KrDjBv@GNrFbBnCfAxE|AvAf@DOr@T
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:05.688057', '2017-05-03 02:27:05.688057');
INSERT INTO distances VALUES (604, 200, 201, 441, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0897278
      :lng: 108.2422464
    :southwest:
      :lat: 16.0863985
      :lng: 108.2402775
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 441
    :duration:
      :text: 1 min
      :value: 59
    :end_address: 446 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0863985
      :lng: 108.2402775
    :start_address: 148 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0897278
      :lng: 108.2422464
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 293
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0873052
        :lng: 108.2411624
      :html_instructions: Head <b>southwest</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Chu Huy Mân</b><div style="font-size:0.9em">Pass by Dịch Vụ Internet Duy
        Khánh (on the right)</div>
      :polyline:
        :points: yoeaBaatsSTHv@VfBl@B@f@NLDFBzBv@|@\p@V
      :start_location:
        :lat: 16.0897278
        :lng: 108.2422464
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 148
      :duration:
        :text: 1 min
        :value: 15
      :end_location:
        :lat: 16.0863985
        :lng: 108.2402775
      :html_instructions: Keep <b>right</b><div style="font-size:0.9em">Pass by Công
        Ty Tnhh Mtv Thiên Nhật Quang (on the right)</div><div style="font-size:0.9em">Destination
        will be on the left</div>
      :maneuver: keep-right
      :polyline:
        :points: u`eaBgzssSIL^Px@j@v@r@l@n@
      :start_location:
        :lat: 16.0873052
        :lng: 108.2411624
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yoeaBaatsSrJbDnBt@IL^Px@j@v@r@l@n@
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0897278
      :lng: 108.2422464
    :southwest:
      :lat: 16.0863985
      :lng: 108.2402775
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 441
    :duration:
      :text: 1 min
      :value: 66
    :end_address: 446 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0863985
      :lng: 108.2402775
    :start_address: 148 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0897278
      :lng: 108.2422464
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 136
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0886005
        :lng: 108.241759
      :html_instructions: Head <b>southwest</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Chu Huy Mân</b>
      :polyline:
        :points: yoeaBaatsSTHv@VfBl@B@f@N
      :start_location:
        :lat: 16.0897278
        :lng: 108.2422464
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 167
      :duration:
        :text: 1 min
        :value: 34
      :end_location:
        :lat: 16.0873595
        :lng: 108.2410887
      :html_instructions: Continue straight past Điểm bán hoa<div style="font-size:0.9em">Pass
        by Tiệm Sửa Xe Quốc Dũng (on the right)</div>
      :maneuver: straight
      :polyline:
        :points: wheaB_~ssSGTRFVHdCt@lAf@
      :start_location:
        :lat: 16.0886005
        :lng: 108.241759
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 138
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0863985
        :lng: 108.2402775
      :html_instructions: Keep <b>right</b><div style="font-size:0.9em">Pass by Công
        Ty Tnhh Mtv Thiên Nhật Quang (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: keep-right
      :polyline:
        :points: _aeaByyssS^Px@j@v@r@l@n@
      :start_location:
        :lat: 16.0873595
        :lng: 108.2410887
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0885885
        :lng: 108.2416302
      :step_index: 1
      :step_interpolation: 0.1083876918181256
  :overview_polyline:
    :points: yoeaBaatsSxDpAf@NGTj@PdCt@lAf@^Px@j@dBbB
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0897278
      :lng: 108.2422464
    :southwest:
      :lat: 16.0860177
      :lng: 108.2399434
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 543
    :duration:
      :text: 1 min
      :value: 83
    :end_address: 446 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0863985
      :lng: 108.2402775
    :start_address: 148 Ngô Quyền, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0897278
      :lng: 108.2422464
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 484
      :duration:
        :text: 1 min
        :value: 59
      :end_location:
        :lat: 16.0860177
        :lng: 108.2399902
      :html_instructions: Head <b>southwest</b> on <b>Ngô Quyền</b>/<b>QL14B</b> toward
        <b>Chu Huy Mân</b><div style="font-size:0.9em">Pass by Dịch Vụ Internet Duy
        Khánh (on the right)</div>
      :polyline:
        :points: yoeaBaatsSTHv@VfBl@B@f@NLDFBzBv@|@\p@Vv@d@l@d@`@^TTZZb@f@b@b@
      :start_location:
        :lat: 16.0897278
        :lng: 108.2422464
      :travel_mode: DRIVING
    - :distance:
        :text: 7 m
        :value: 7
      :duration:
        :text: 1 min
        :value: 3
      :end_location:
        :lat: 16.0860626
        :lng: 108.2399434
      :html_instructions: Turn <b>right</b> at Cà Phê Young onto <b>Khúc Hạo</b>
      :maneuver: turn-right
      :polyline:
        :points: sxdaB}rssSGH
      :start_location:
        :lat: 16.0860177
        :lng: 108.2399902
      :travel_mode: DRIVING
    - :distance:
        :text: 52 m
        :value: 52
      :duration:
        :text: 1 min
        :value: 21
      :end_location:
        :lat: 16.0863985
        :lng: 108.2402775
      :html_instructions: Turn <b>right</b> at Nhà Sách Sơn Trà<div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: "{xdaBsrssSk@k@WW"
      :start_location:
        :lat: 16.0860626
        :lng: 108.2399434
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0869574
        :lng: 108.2409066
      :step_index: 0
      :step_interpolation: 0.7038325951621738
  :overview_polyline:
    :points: yoeaBaatsSrJbDnBt@dBjAvBxBb@b@GHcAcA
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:10.976446', '2017-05-03 02:27:10.976446');
INSERT INTO distances VALUES (605, 201, 202, 484, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0863985
      :lng: 108.2402775
    :southwest:
      :lat: 16.0839854
      :lng: 108.2371246
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 484
    :duration:
      :text: 1 min
      :value: 58
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0846925
      :lng: 108.2371246
    :start_address: 446 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0863985
      :lng: 108.2402775
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 371
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0839854
        :lng: 108.237883
      :html_instructions: Head <b>southwest</b> toward <b>Khúc Hạo</b>
      :polyline:
        :points: _{daBwtssSVVj@j@|EzEdDdDXX
      :start_location:
        :lat: 16.0863985
        :lng: 108.2402775
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 113
      :duration:
        :text: 1 min
        :value: 20
      :end_location:
        :lat: 16.0846925
        :lng: 108.2371246
      :html_instructions: Turn <b>right</b> at Cà Phê 546 onto <b>Trần Thánh Tông</b><div
        style="font-size:0.9em">Pass by Cafe Nhạc Xưa (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: "}kdaBwessSqAtAy@`A"
      :start_location:
        :lat: 16.0839854
        :lng: 108.237883
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _{daBwtssSfMdMXXqAtAy@`A
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0863985
      :lng: 108.2402775
    :southwest:
      :lat: 16.0839329
      :lng: 108.2371246
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 499
    :duration:
      :text: 1 min
      :value: 54
    :end_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0846925
      :lng: 108.2371246
    :start_address: 446 Ngô Quyền, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0863985
      :lng: 108.2402775
    :steps:
    - :distance:
        :text: 52 m
        :value: 52
      :duration:
        :text: 1 min
        :value: 5
      :end_location:
        :lat: 16.0860626
        :lng: 108.2399434
      :html_instructions: Head <b>southwest</b> toward <b>Khúc Hạo</b>
      :polyline:
        :points: _{daBwtssSVVj@j@
      :start_location:
        :lat: 16.0863985
        :lng: 108.2402775
      :travel_mode: DRIVING
    - :distance:
        :text: 7 m
        :value: 7
      :duration:
        :text: 1 min
        :value: 1
      :end_location:
        :lat: 16.0860177
        :lng: 108.2399902
      :html_instructions: Turn <b>left</b> at Nhà Sách Sơn Trà onto <b>Khúc Hạo</b>
      :maneuver: turn-left
      :polyline:
        :points: "{xdaBsrssSFI"
      :start_location:
        :lat: 16.0860626
        :lng: 108.2399434
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 319
      :duration:
        :text: 1 min
        :value: 29
      :end_location:
        :lat: 16.0839329
        :lng: 108.237938
      :html_instructions: Turn <b>right</b> at Cà Phê Young onto <b>Ngô Quyền</b>/<b>QL14B</b><div
        style="font-size:0.9em">Pass by Quán Cafe Mây Hồng (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: sxdaB}rssS`@^PNZ\nAfAzC|CdBdB
      :start_location:
        :lat: 16.0860177
        :lng: 108.2399902
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 121
      :duration:
        :text: 1 min
        :value: 19
      :end_location:
        :lat: 16.0846925
        :lng: 108.2371246
      :html_instructions: Turn <b>right</b> at Quán Cơm Mỹ Phương onto <b>Trần Thánh
        Tông</b><div style="font-size:0.9em">Pass by Cafe Nhạc Xưa (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: qkdaBcfssSKJqAtAy@`A
      :start_location:
        :lat: 16.0839329
        :lng: 108.237938
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0854193
        :lng: 108.2394218
      :step_index: 2
      :step_interpolation: 0.282314304825579
  :overview_polyline:
    :points: _{daBwtssSbAbAFI`@^l@l@nAfAzC|CdBdBKJkCvC
  :summary: Ngô Quyền/QL14B
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:11.530289', '2017-05-03 02:27:11.530289');
INSERT INTO distances VALUES (606, 202, 203, 799, 19, '---
- :bounds:
    :northeast:
      :lat: 16.090074
      :lng: 108.2371246
    :southwest:
      :lat: 16.0846925
      :lng: 108.2328711
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 799
    :duration:
      :text: 2 mins
      :value: 111
    :end_address: Trần Thánh Tông, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.090074
      :lng: 108.2328711
    :start_address: Trần Thánh Tông, An Hải Bắc, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0846925
      :lng: 108.2371246
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 597
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0883491
        :lng: 108.2330401
      :html_instructions: Head <b>northwest</b> on <b>Trần Thánh Tông</b> toward <b>Lý
        Đạo Thành</b><div style="font-size:0.9em">Pass by Cửa Hàng Xăng Dầu Số 28
        - Petrolimex (on the left in 450&nbsp;m)</div>
      :polyline:
        :points: ipdaB_assSiApASR_@b@eBnBmArAyBdCaBnBKN{CjDe@n@
      :start_location:
        :lat: 16.0846925
        :lng: 108.2371246
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 202
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.090074
        :lng: 108.2328711
      :html_instructions: At the roundabout, take the <b>2nd</b> exit<div style="font-size:0.9em">Pass
        by Công Ty Tnhh Thương Mại &amp; Dịch Vụ Tam Phùng Hưng Thịnh (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: egeaBogrsSCACAEAC?E?C?C?E@C@E@CBC@ABCBABADCF{@?}A@wB?
      :start_location:
        :lat: 16.0883491
        :lng: 108.2330401
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ipdaB_assScFxFuHxIaEzEGCSASDMLCHCF{@?uE@
  :summary: Trần Thánh Tông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:12.071804', '2017-05-03 02:27:12.071804');
INSERT INTO distances VALUES (607, 203, 204, 459, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0931148
      :lng: 108.2338686
    :southwest:
      :lat: 16.090074
      :lng: 108.2321307
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 459
    :duration:
      :text: 1 min
      :value: 83
    :end_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0931148
      :lng: 108.2321307
    :start_address: Trần Thánh Tông, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.090074
      :lng: 108.2328711
    :steps:
    - :distance:
        :text: 48 m
        :value: 48
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 16.0905061
        :lng: 108.2328827
      :html_instructions: Head <b>north</b> toward <b>Phạm Huy Thông</b>
      :polyline:
        :points: "}qeaBmfrsSo@?g@A"
      :start_location:
        :lat: 16.090074
        :lng: 108.2328711
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 156
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0915456
        :lng: 108.2338686
      :html_instructions: Continue straight past Mầm Non Hải Ca<div style="font-size:0.9em">Pass
        by KHU VUI CHƠI HAPPY CITY (on the left)</div>
      :maneuver: straight
      :polyline:
        :points: uteaBofrsScC_CkAeA
      :start_location:
        :lat: 16.0905061
        :lng: 108.2328827
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 255
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0931148
        :lng: 108.2321307
      :html_instructions: Turn <b>left</b> onto <b>Khúc Hạo</b><div style="font-size:0.9em">Pass
        by Công Ty Mtv Thiết Bị Giáo Dục Vi Khanh (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: e{eaBulrsSMN]`@}DnEmAxA
      :start_location:
        :lat: 16.0915456
        :lng: 108.2338686
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}qeaBmfrsSwAAoEeEwHzI"
  :summary: Khúc Hạo
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0931148
      :lng: 108.2328827
    :southwest:
      :lat: 16.090074
      :lng: 108.2310586
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 563
    :duration:
      :text: 2 mins
      :value: 118
    :end_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0931148
      :lng: 108.2321307
    :start_address: Trần Thánh Tông, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.090074
      :lng: 108.2328711
    :steps:
    - :distance:
        :text: 48 m
        :value: 48
      :duration:
        :text: 1 min
        :value: 8
      :end_location:
        :lat: 16.0905061
        :lng: 108.2328827
      :html_instructions: Head <b>north</b> toward <b>Phạm Huy Thông</b>
      :polyline:
        :points: "}qeaBmfrsSo@?g@A"
      :start_location:
        :lat: 16.090074
        :lng: 108.2328711
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 205
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0910663
        :lng: 108.2310586
      :html_instructions: Turn <b>left</b> at Mầm Non Hải Ca onto <b>Phạm Huy Thông</b><div
        style="font-size:0.9em">Pass by Chung cư A6 (on the right)</div>
      :maneuver: turn-left
      :polyline:
        :points: uteaBofrsSAV{@vDCJm@nC
      :start_location:
        :lat: 16.0905061
        :lng: 108.2328827
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 245
      :duration:
        :text: 1 min
        :value: 54
      :end_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :html_instructions: Turn <b>right</b> toward <b>Khúc Hạo</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Mtv Dương Thiên Phú (on the left)</div>
      :maneuver: turn-right
      :polyline:
        :points: exeaBc{qsSmB_BQOA?{@w@aA}@iAiA
      :start_location:
        :lat: 16.0910663
        :lng: 108.2310586
      :travel_mode: DRIVING
    - :distance:
        :text: 65 m
        :value: 65
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0931148
        :lng: 108.2321307
      :html_instructions: Turn <b>left</b> at Trung tâm tập gym onto <b>Khúc Hạo</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Vlxd Châu Trinh (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: obfaBsdrsSmAxA
      :start_location:
        :lat: 16.0927213
        :lng: 108.2325758
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0909536
        :lng: 108.2314185
      :step_index: 1
      :step_interpolation: 0.8026568601319735
  :overview_polyline:
    :points: "}qeaBmfrsSwAAAV{@vDq@zC_CoBiE_EmAxA"
  :summary: Phạm Huy Thông
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:12.729952', '2017-05-03 02:27:12.729952');
INSERT INTO distances VALUES (608, 204, 205, 739, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0972
      :lng: 108.2331357
    :southwest:
      :lat: 16.0931148
      :lng: 108.230705
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 739
    :duration:
      :text: 2 mins
      :value: 110
    :end_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0967979
      :lng: 108.230705
    :start_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0931148
      :lng: 108.2321307
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 118
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0938455
        :lng: 108.231326
      :html_instructions: Head <b>northwest</b> on <b>Khúc Hạo</b> toward <b>Bùi Huy
        Bích</b><div style="font-size:0.9em">Pass by Cửa Hàng Điện Nước Út Tài (on
        the right)</div>
      :polyline:
        :points: "}dfaByarsSmAtAeAhA"
      :start_location:
        :lat: 16.0931148
        :lng: 108.2321307
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 272
      :duration:
        :text: 1 min
        :value: 41
      :end_location:
        :lat: 16.0956495
        :lng: 108.2330445
      :html_instructions: Turn <b>right</b> at Quán Ăn Chiều Nhớ toward <b>Chu Huy
        Mân</b>
      :maneuver: turn-right
      :polyline:
        :points: qifaBy|qsSsDmDmBeBeAaA
      :start_location:
        :lat: 16.0938455
        :lng: 108.231326
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 250
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0972
        :lng: 108.2315308
      :html_instructions: Turn <b>left</b> onto <b>Chu Huy Mân</b>
      :maneuver: turn-left
      :polyline:
        :points: ytfaBogrsSUS_AdAaCvCkApAQP
      :start_location:
        :lat: 16.0956495
        :lng: 108.2330445
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 99
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0967979
        :lng: 108.230705
      :html_instructions: Turn <b>left</b> onto <b>Lý Nhật Quang</b>
      :maneuver: turn-left
      :polyline:
        :points: o~faBa~qsSLZh@xAVn@
      :start_location:
        :lat: 16.0972
        :lng: 108.2315308
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}dfaByarsSsC~CaHsG{AuAaE|E}AbBv@tBVn@"
  :summary: Chu Huy Mân
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0967979
      :lng: 108.2321307
    :southwest:
      :lat: 16.0931148
      :lng: 108.2290064
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 664
    :duration:
      :text: 2 mins
      :value: 121
    :end_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0967979
      :lng: 108.230705
    :start_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0931148
      :lng: 108.2321307
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 460
      :duration:
        :text: 1 min
        :value: 82
      :end_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :html_instructions: Head <b>northwest</b> on <b>Khúc Hạo</b> toward <b>Bùi Huy
        Bích</b><div style="font-size:0.9em">Pass by Cửa Hàng Điện Nước Út Tài (on
        the right)</div>
      :polyline:
        :points: "}dfaByarsSmAtAeAhASXeAlA{@~@w@`AwEdF"
      :start_location:
        :lat: 16.0931148
        :lng: 108.2321307
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 204
      :duration:
        :text: 1 min
        :value: 39
      :end_location:
        :lat: 16.0967979
        :lng: 108.230705
      :html_instructions: Turn <b>right</b> onto <b>Lý Nhật Quang</b><div style="font-size:0.9em">Pass
        by Dịch Vụ Nấu Ăn Long Vỹ (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: wvfaBinqsSw@yB{@wBs@_B
      :start_location:
        :lat: 16.0959561
        :lng: 108.2290064
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0954192
        :lng: 108.2295818
      :step_index: 0
      :step_interpolation: 0.8135728359039459
  :overview_polyline:
    :points: "}dfaByarsSmFfGsB`CwEdFw@yBoBwE"
  :summary: Khúc Hạo and Lý Nhật Quang
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.0967979
      :lng: 108.2321972
    :southwest:
      :lat: 16.0931148
      :lng: 108.2302152
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 605
    :duration:
      :text: 2 mins
      :value: 121
    :end_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0967979
      :lng: 108.230705
    :start_address: 196 Khúc Hạo, Mân Thái, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0931148
      :lng: 108.2321307
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 118
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0938455
        :lng: 108.231326
      :html_instructions: Head <b>northwest</b> on <b>Khúc Hạo</b> toward <b>Bùi Huy
        Bích</b><div style="font-size:0.9em">Pass by Cửa Hàng Điện Nước Út Tài (on
        the right)</div>
      :polyline:
        :points: "}dfaByarsSmAtAeAhA"
      :start_location:
        :lat: 16.0931148
        :lng: 108.2321307
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 137
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0947522
        :lng: 108.2321972
      :html_instructions: Turn <b>right</b> at Quán Ăn Chiều Nhớ toward <b>Lê Hữu
        Kiều</b>
      :maneuver: turn-right
      :polyline:
        :points: qifaBy|qsSsDmD
      :start_location:
        :lat: 16.0938455
        :lng: 108.231326
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 291
      :duration:
        :text: 1 min
        :value: 68
      :end_location:
        :lat: 16.0965434
        :lng: 108.2302152
      :html_instructions: Turn <b>left</b> onto <b>Lê Hữu Kiều</b>
      :maneuver: turn-left
      :polyline:
        :points: eofaBgbrsS{AfBy@bAw@~@wC~C
      :start_location:
        :lat: 16.0947522
        :lng: 108.2321972
      :travel_mode: DRIVING
    - :distance:
        :text: 59 m
        :value: 59
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0967979
        :lng: 108.230705
      :html_instructions: Turn <b>right</b> onto <b>Lý Nhật Quang</b><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: kzfaB{uqsSs@_B
      :start_location:
        :lat: 16.0965434
        :lng: 108.2302152
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0956401
        :lng: 108.2311815
      :step_index: 2
      :step_interpolation: 0.5045436211598268
  :overview_polyline:
    :points: "}dfaByarsSsC~CsDmD{AfBqBbCwC~Cs@_B"
  :summary: Lê Hữu Kiều
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:12.997803', '2017-05-03 02:27:12.997803');
INSERT INTO distances VALUES (609, 205, 206, 919, 19, '---
- :bounds:
    :northeast:
      :lat: 16.1009491
      :lng: 108.231903
    :southwest:
      :lat: 16.0967979
      :lng: 108.2298532
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 919
    :duration:
      :text: 2 mins
      :value: 99
    :end_address: Lê Đức Thọ, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0998962
      :lng: 108.2298532
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0967979
      :lng: 108.230705
    :steps:
    - :distance:
        :text: 82 m
        :value: 82
      :duration:
        :text: 1 min
        :value: 13
      :end_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :html_instructions: Head <b>northeast</b> on <b>Lý Nhật Quang</b> toward <b>Hoa
        Lư</b>
      :polyline:
        :points: _|faB{xqsSWo@i@yA
      :start_location:
        :lat: 16.0967979
        :lng: 108.230705
      :travel_mode: DRIVING
    - :distance:
        :text: 0.5 km
        :value: 536
      :duration:
        :text: 1 min
        :value: 58
      :end_location:
        :lat: 16.1005954
        :lng: 108.2316782
      :html_instructions: Turn <b>left</b> at the 2nd cross street onto <b>Chu Huy
        Mân</b>
      :maneuver: turn-left
      :polyline:
        :points: a~faBe}qsSM[OLaAd@y@`@gAh@QTeAd@uAl@kBx@cCkGIKIMMMSM
      :start_location:
        :lat: 16.0971328
        :lng: 108.2313851
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 301
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0998962
        :lng: 108.2298532
      :html_instructions: At the roundabout, take the <b>4th</b> exit onto <b>Lê Đức
        Thọ</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: wsgaB__rsS@A?A?C?A?C?AAA?CAAACAAACAAAAA?AAAACAA?C?AAC?C@C?A?A@C?A@A@A@A@A@A@A@ABAB?@AB?@?@?B?@?B@@?B@@@@?B@@@@@@@@@@@?@@@?@@D?PXT^jCvG
      :start_location:
        :lat: 16.1005954
        :lng: 108.2316782
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _|faB{xqsSaAiCM[OL{BfAgAh@QT{CrAkBx@cCkGSYa@[@IAKOQKCM?QJGJAHDVNJF@f@x@jCvG
  :summary: Chu Huy Mân
  :warnings: []
  :waypoint_order: []
- :bounds:
    :northeast:
      :lat: 16.1009417
      :lng: 108.233485
    :southwest:
      :lat: 16.0967742
      :lng: 108.2298532
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 1.1 km
      :value: 1064
    :duration:
      :text: 3 mins
      :value: 180
    :end_address: Lê Đức Thọ, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0998962
      :lng: 108.2298532
    :start_address: Lý Nhật Quang, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0967979
      :lng: 108.230705
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 163
      :duration:
        :text: 1 min
        :value: 48
      :end_location:
        :lat: 16.0974959
        :lng: 108.2320457
      :html_instructions: Head <b>northeast</b> on <b>Lý Nhật Quang</b> toward <b>Hoa
        Lư</b>
      :polyline:
        :points: _|faB{xqsSWo@i@yAM[{@gB
      :start_location:
        :lat: 16.0967979
        :lng: 108.230705
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 121
      :duration:
        :text: 1 min
        :value: 24
      :end_location:
        :lat: 16.0967742
        :lng: 108.2328991
      :html_instructions: Turn <b>right</b> at Mầm Non Ty Gôn onto <b>Ngô Thì Hương</b>
      :maneuver: turn-right
      :polyline:
        :points: k`gaBiarsSpCiD
      :start_location:
        :lat: 16.0974959
        :lng: 108.2320457
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 159
      :duration:
        :text: 1 min
        :value: 31
      :end_location:
        :lat: 16.0980885
        :lng: 108.233485
      :html_instructions: Turn <b>left</b> onto <b>Vũng Thùng 3</b>
      :maneuver: turn-left
      :polyline:
        :points: y{faBsfrsSyAg@oAa@}Ai@
      :start_location:
        :lat: 16.0967742
        :lng: 108.2328991
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 336
      :duration:
        :text: 1 min
        :value: 49
      :end_location:
        :lat: 16.1006198
        :lng: 108.2318223
      :html_instructions: Turn <b>left</b> onto <b>Ngô Thì Hiệu</b>
      :maneuver: turn-left
      :polyline:
        :points: adgaBgjrsSuBzB}Ar@yAl@mAl@qAh@k@T
      :start_location:
        :lat: 16.0980885
        :lng: 108.233485
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 285
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0998962
        :lng: 108.2298532
      :html_instructions: At the roundabout, take the <b>3rd</b> exit onto <b>Lê Đức
        Thọ</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: "{sgaB{_rsSAAACAAAAA?AAAACAA?C?AAC?C@C?A?A@C?A@A@A@A@A@A@A@ABAB?@AB?@?@?B?@?B@@?B@@@@?B@@@@@@@@@@@?@@@?@@D?PXT^jCvG"
      :start_location:
        :lat: 16.1006198
        :lng: 108.2318223
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint:
    - :location:
        :lat: 16.0978565
        :lng: 108.2333761
      :step_index: 2
      :step_interpolation: 0.8220026792417685
  :overview_polyline:
    :points: _|faB{xqsSaAiCiAcCpCiDyAg@mDkAuBzB}Ar@gDzA}B~@CEGEKCM?IBGFGJ?TJRFBF@f@x@jCvG
  :summary: Ngô Thì Hiệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:13.264771', '2017-05-03 02:27:13.264771');
INSERT INTO distances VALUES (610, 206, 207, 2561, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0998962
      :lng: 108.2298532
    :southwest:
      :lat: 16.0874112
      :lng: 108.2149329
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 2.6 km
      :value: 2561
    :duration:
      :text: 4 mins
      :value: 218
    :end_address: Nguyễn Tất Thành, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0892157
      :lng: 108.2152383
    :start_address: Lê Đức Thọ, Nại Hiên Đông, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0998962
      :lng: 108.2298532
    :steps:
    - :distance:
        :text: 0.2 km
        :value: 208
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0989822
        :lng: 108.228166
      :html_instructions: Head <b>southwest</b> on <b>Lê Đức Thọ</b> toward <b>Cầu
        Thuận Phước</b>
      :polyline:
        :points: kogaBqsqsSnCzGFNLTPL
      :start_location:
        :lat: 16.0998962
        :lng: 108.2298532
      :travel_mode: DRIVING
    - :distance:
        :text: 2.0 km
        :value: 1975
      :duration:
        :text: 3 mins
        :value: 154
      :end_location:
        :lat: 16.0886932
        :lng: 108.215109
      :html_instructions: <b>Lê Đức Thọ</b> turns slightly <b>right</b> and becomes
        <b>Cầu Thuận Phước</b><div style="font-size:0.9em">Pass by the bridge (on
        the left in 900&nbsp;m)</div>
      :polyline:
        :points: sigaBaiqsSxDxJxDxJvArDrGfP~C~H|CrHh@pAJTx@xBXt@Xl@PZRXX\NLTPXPTNVJVJ\H^Hb@FZB`@?fACnCMrFQD?B?D?D?
      :start_location:
        :lat: 16.0989822
        :lng: 108.228166
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 110
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.0877222
        :lng: 108.2149676
      :html_instructions: "<b>Cầu Thuận Phước</b> turns slightly <b>right</b> and
        becomes <b>Nguyễn Tất Thành</b>"
      :polyline:
        :points: iieaBmwnsS\LbDL
      :start_location:
        :lat: 16.0886932
        :lng: 108.215109
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 191
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0885282
        :lng: 108.2152191
      :html_instructions: At the roundabout, take the <b>3rd</b> exit and stay on
        <b>Nguyễn Tất Thành</b>
      :maneuver: roundabout-right
      :polyline:
        :points: gceaBqvnsSB@B@B?B@@?B?B?BAB?BABCDA@A@CBA@C@C?C@C?C@C?CAC?A?A?A?AAA?A?AA?ACACACCAAACACACACAC?C?E?C?C@C?C@A@C@ABC@ABsBH[BC?
      :start_location:
        :lat: 16.0877222
        :lng: 108.2149676
      :travel_mode: DRIVING
    - :distance:
        :text: 77 m
        :value: 77
      :duration:
        :text: 1 min
        :value: 12
      :end_location:
        :lat: 16.0892157
        :lng: 108.2152383
      :html_instructions: Take the exit
      :maneuver: ramp-right
      :polyline:
        :points: iheaBcxnsSk@EY?a@@a@?
      :start_location:
        :lat: 16.0885282
        :lng: 108.2152191
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: kogaBqsqsSvCjHLTPLrJrVjJzUrJzUrAnDj@hAl@v@d@^n@`@n@V|@R~@JhBCbK_@T?\LbDLFBL@NCLKFM@YISMGOCQ@KHEDoCLo@E{@@a@?
  :summary: Cầu Thuận Phước
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:13.503847', '2017-05-03 02:27:13.503847');
INSERT INTO distances VALUES (611, 207, 208, 419, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0902768
      :lng: 108.2181759
    :southwest:
      :lat: 16.0892157
      :lng: 108.2152143
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 419
    :duration:
      :text: 1 min
      :value: 69
    :end_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0902768
      :lng: 108.2181759
    :start_address: Nguyễn Tất Thành, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0892157
      :lng: 108.2152383
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 102
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.0901307
        :lng: 108.2152143
      :html_instructions: Head <b>north</b> toward <b>Xuân Diệu</b>
      :polyline:
        :points: sleaBgxnsSeA@sA@[@
      :start_location:
        :lat: 16.0892157
        :lng: 108.2152383
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 317
      :duration:
        :text: 1 min
        :value: 59
      :end_location:
        :lat: 16.0902768
        :lng: 108.2181759
      :html_instructions: Turn <b>right</b> onto <b>Xuân Diệu</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Mtv Hj Tour (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: ireaBaxnsSCsAMyGGoCCsA
      :start_location:
        :lat: 16.0901307
        :lng: 108.2152143
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: sleaBgxnsSyCB[@CsAUiLCsA
  :summary: Xuân Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:13.789773', '2017-05-03 02:27:13.789773');
INSERT INTO distances VALUES (612, 208, 209, 256, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0903076
      :lng: 108.2196353
    :southwest:
      :lat: 16.0888467
      :lng: 108.2181759
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 256
    :duration:
      :text: 1 min
      :value: 50
    :end_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0888467
      :lng: 108.2196353
    :start_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0902768
      :lng: 108.2181759
    :steps:
    - :distance:
        :text: 75 m
        :value: 75
      :duration:
        :text: 1 min
        :value: 10
      :end_location:
        :lat: 16.0903076
        :lng: 108.2188787
      :html_instructions: Head <b>east</b> on <b>Xuân Diệu</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Mtv Thương Mại Xây Dựng Yomi (on the left)</div>
      :polyline:
        :points: gseaBsjosSAe@CeB
      :start_location:
        :lat: 16.0902768
        :lng: 108.2181759
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 181
      :duration:
        :text: 1 min
        :value: 40
      :end_location:
        :lat: 16.0888467
        :lng: 108.2196353
      :html_instructions: Turn <b>right</b> at Aloe Garden Homestay to stay on <b>Xuân
        Diệu</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Thương Mại Tài Nhân
        Phong (on the right)</div><div style="font-size:0.9em">Destination will be
        on the right</div>
      :maneuver: turn-right
      :polyline:
        :points: mseaB_oosShAe@bAc@tCmA
      :start_location:
        :lat: 16.0903076
        :lng: 108.2188787
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: gseaBsjosSEkClCiAtCmA
  :summary: Xuân Diệu
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:14.06977', '2017-05-03 02:27:14.06977');
INSERT INTO distances VALUES (613, 209, 28, 555, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0888467
      :lng: 108.2207002
    :southwest:
      :lat: 16.0847991
      :lng: 108.2195007
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 555
    :duration:
      :text: 2 mins
      :value: 96
    :end_address: 32 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0847991
      :lng: 108.2207002
    :start_address: Xuân Diệu, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0888467
      :lng: 108.2196353
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 398
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :html_instructions: Head <b>southeast</b> on <b>Xuân Diệu</b> toward <b>Đinh
        Công Tráng</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Thương
        Mại &amp; Dịch Vụ Human Care (on the right)</div>
      :polyline:
        :points: ijeaBwsosSxD}A`@ONGN@P@VD~@Pb@Dv@N^HzA\|Al@
      :start_location:
        :lat: 16.0888467
        :lng: 108.2196353
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 157
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0847991
        :lng: 108.2207002
      :html_instructions: Turn <b>left</b> at Cà Phê 82 onto <b>3 Tháng 2</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Tạp Hóa 61 (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: mudaBesosSTHFS|@{BPc@L]P]
      :start_location:
        :lat: 16.0855067
        :lng: 108.2195475
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ijeaBwsosSzEmBNGN@h@FbBVvAXzA\|Al@THFSnA_D^{@
  :summary: Xuân Diệu and 3 Tháng 2
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:14.405323', '2017-05-03 02:27:14.405323');
INSERT INTO distances VALUES (614, 28, 51, 457, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0847991
      :lng: 108.2222907
    :southwest:
      :lat: 16.0823859
      :lng: 108.2207002
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 457
    :duration:
      :text: 1 min
      :value: 65
    :end_address: 22-24 Đống Đa, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0823859
      :lng: 108.2207749
    :start_address: 32 3 Tháng 2, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0847991
      :lng: 108.2207002
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 278
      :duration:
        :text: 1 min
        :value: 35
      :end_location:
        :lat: 16.0828511
        :lng: 108.2222907
      :html_instructions: Head <b>southeast</b> on <b>3 Tháng 2</b> toward <b>Châu
        Văn Liêm</b><div style="font-size:0.9em">Pass by Công Ty Cp Vận Tải Pst Đà
        Nẵng (on the left)</div>
      :polyline:
        :points: _qdaBkzosS@AR[PS\]LMJI\Uf@]TOFGJMBCr@e@lAw@PKJEPG
      :start_location:
        :lat: 16.0847991
        :lng: 108.2207002
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 179
      :duration:
        :text: 1 min
        :value: 30
      :end_location:
        :lat: 16.0823859
        :lng: 108.2207749
      :html_instructions: At the roundabout, take the <b>1st</b> exit onto <b>Đống
        Đa</b><div style="font-size:0.9em">Pass by Vib - Atm (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: yddaBidpsSB@@@@@@@@@@?B@@?@?B@@?@?Zt@HlA@DHdAFv@BX
      :start_location:
        :lat: 16.0828511
        :lng: 108.2222907
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _qdaBkzosST]n@q@XWdAs@\WNQ`C}A\QPGB@BBHDH@\t@JrATvC
  :summary: 3 Tháng 2 and Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:14.664691', '2017-05-03 02:27:14.664691');
INSERT INTO distances VALUES (615, 51, 212, 286, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0823859
      :lng: 108.2207749
    :southwest:
      :lat: 16.0807965
      :lng: 108.2187942
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 286
    :duration:
      :text: 1 min
      :value: 44
    :end_address: 100-104 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0807965
      :lng: 108.2187942
    :start_address: 22-24 Đống Đa, Thuận Phước, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0823859
      :lng: 108.2207749
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 286
      :duration:
        :text: 1 min
        :value: 44
      :end_location:
        :lat: 16.0807965
        :lng: 108.2187942
      :html_instructions: Head <b>west</b> on <b>Đống Đa</b> toward <b>Châu Văn Liêm</b><div
        style="font-size:0.9em">Pass by Đại Lý Gạo Sỉ &amp; Lẻ (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: "}adaByzosSDRHd@DR?@DRL\\N\\Xd@Xb@`@`@b@^\\Th@Xp@`@NL"
      :start_location:
        :lat: 16.0823859
        :lng: 108.2207749
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}adaByzosSTnARp@h@bAz@dA`At@jBhA"
  :summary: Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:14.961287', '2017-05-03 02:27:14.961287');
INSERT INTO distances VALUES (616, 212, 213, 465, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0807965
      :lng: 108.2187942
    :southwest:
      :lat: 16.0773119
      :lng: 108.2163977
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 465
    :duration:
      :text: 1 min
      :value: 72
    :end_address: 230-244 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0773119
      :lng: 108.2163977
    :start_address: 100-104 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0807965
      :lng: 108.2187942
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 465
      :duration:
        :text: 1 min
        :value: 72
      :end_location:
        :lat: 16.0773119
        :lng: 108.2163977
      :html_instructions: Head <b>southwest</b> on <b>Đống Đa</b> toward <b>Lý Thường
        Kiệt</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Mtv Giao Khôi (on
        the right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: _xcaBmnosSTNt@f@nBdA^RnGzDTNf@\RLzBrA
      :start_location:
        :lat: 16.0807965
        :lng: 108.2187942
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _xcaBmnosSjAv@nCxAdHjEz@j@zBrA
  :summary: Đống Đa
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:15.322062', '2017-05-03 02:27:15.322062');
INSERT INTO distances VALUES (617, 213, 214, 359, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0773119
      :lng: 108.2178301
    :southwest:
      :lat: 16.0758492
      :lng: 108.2160581
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 359
    :duration:
      :text: 1 min
      :value: 82
    :end_address: 7 Nguyễn Thị Minh Khai, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0758492
      :lng: 108.2178301
    :start_address: 230-244 Đống Đa, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0773119
      :lng: 108.2163977
    :steps:
    - :distance:
        :text: 66 m
        :value: 66
      :duration:
        :text: 1 min
        :value: 18
      :end_location:
        :lat: 16.0768108
        :lng: 108.2160581
      :html_instructions: Head <b>southwest</b> on <b>Đống Đa</b> toward <b>Lý Tự
        Trọng</b>
      :polyline:
        :points: ebcaBo_osSpAv@PJ
      :start_location:
        :lat: 16.0773119
        :lng: 108.2163977
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 169
      :duration:
        :text: 1 min
        :value: 38
      :end_location:
        :lat: 16.0769509
        :lng: 108.2176312
      :html_instructions: Turn <b>left</b> at Công Ty Tnhh Dịch Vụ &amp; Thương Mại
        Hà Thành Đà Nẵng onto <b>Lý Tự Trọng</b><div style="font-size:0.9em">Pass
        by Cửa Hàng Tạp Hóa Phước Cường (on the left)</div>
      :maneuver: turn-left
      :polyline:
        :points: a_caBk}nsSEi@EcAOkE
      :start_location:
        :lat: 16.0768108
        :lng: 108.2160581
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 124
      :duration:
        :text: 1 min
        :value: 26
      :end_location:
        :lat: 16.0758492
        :lng: 108.2178301
      :html_instructions: Turn <b>right</b> at Đại Lý Điện Thoại Công Cộng onto <b>Nguyễn
        Thị Minh Khai</b><div style="font-size:0.9em">Pass by Trường Mầm Non Vietkids
        (on the left)</div><div style="font-size:0.9em">Destination will be on the
        right</div>
      :maneuver: turn-right
      :polyline:
        :points: "}_caBegosSlD_@l@G"
      :start_location:
        :lat: 16.0769509
        :lng: 108.2176312
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ebcaBo_osSbBbAKmBOkElD_@l@G
  :summary: Lý Tự Trọng and Nguyễn Thị Minh Khai
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:15.81819', '2017-05-03 02:27:15.81819');
INSERT INTO distances VALUES (618, 214, 215, 766, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0758492
      :lng: 108.2190421
    :southwest:
      :lat: 16.0690585
      :lng: 108.2178301
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 766
    :duration:
      :text: 3 mins
      :value: 195
    :end_address: 115 Nguyễn Thị Minh Khai, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0690585
      :lng: 108.2190421
    :start_address: 7 Nguyễn Thị Minh Khai, Thạch Thang, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0758492
      :lng: 108.2178301
    :steps:
    - :distance:
        :text: 0.8 km
        :value: 766
      :duration:
        :text: 3 mins
        :value: 195
      :end_location:
        :lat: 16.0690585
        :lng: 108.2190421
      :html_instructions: Head <b>south</b> on <b>Nguyễn Thị Minh Khai</b> toward
        <b>Lê Lai</b><div style="font-size:0.9em">Pass by Brown Cafe (on the right)</div>
      :polyline:
        :points: aybaBmhosS~BSr@IfBQrDa@XEhEg@pC[jBQtBSrBOpBWv@EFA
      :start_location:
        :lat: 16.0758492
        :lng: 108.2178301
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: aybaBmhosSrD]zGs@`N{AhFc@hD]FA
  :summary: Nguyễn Thị Minh Khai
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:16.115613', '2017-05-03 02:27:16.115613');
INSERT INTO distances VALUES (619, 215, 216, 273, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0690585
      :lng: 108.2191693
    :southwest:
      :lat: 16.067981
      :lng: 108.2173956
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 273
    :duration:
      :text: 1 min
      :value: 69
    :end_address: 113 Hùng Vương, Hải Châu 2, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.067981
      :lng: 108.2173956
    :start_address: 115 Nguyễn Thị Minh Khai, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0690585
      :lng: 108.2190421
    :steps:
    - :distance:
        :text: 79 m
        :value: 79
      :duration:
        :text: 1 min
        :value: 16
      :end_location:
        :lat: 16.0683556
        :lng: 108.2191693
      :html_instructions: Head <b>south</b> on <b>Nguyễn Thị Minh Khai</b> toward
        <b>Hùng Vương</b><div style="font-size:0.9em">Pass by higlo (on the left)</div>
      :polyline:
        :points: snaaB_posSjCY
      :start_location:
        :lat: 16.0690585
        :lng: 108.2190421
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 194
      :duration:
        :text: 1 min
        :value: 53
      :end_location:
        :lat: 16.067981
        :lng: 108.2173956
      :html_instructions: Turn <b>right</b> at Cửa Hàng Đức Tuấn onto <b>Hùng Vương</b><div
        style="font-size:0.9em">Pass by Trung Tâm Mắt Kính (on the right)</div>
      :maneuver: turn-right
      :polyline:
        :points: gjaaByposSNx@Jz@?@Jv@RbBBV?FJl@
      :start_location:
        :lat: 16.0683556
        :lng: 108.2191693
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: snaaB_posSjCYNx@J|@b@zDJl@
  :summary: Nguyễn Thị Minh Khai and Hùng Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:16.717972', '2017-05-03 02:27:16.717972');
INSERT INTO distances VALUES (620, 216, 217, 299, 19, '---
- :bounds:
    :northeast:
      :lat: 16.067981
      :lng: 108.2173956
    :southwest:
      :lat: 16.0673661
      :lng: 108.2146728
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 299
    :duration:
      :text: 1 min
      :value: 77
    :end_address: 227 Hùng Vương, Hải Châu 2, Q. Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0673661
      :lng: 108.2146728
    :start_address: 113 Hùng Vương, Hải Châu 2, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.067981
      :lng: 108.2173956
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 299
      :duration:
        :text: 1 min
        :value: 77
      :end_location:
        :lat: 16.0673661
        :lng: 108.2146728
      :html_instructions: Head <b>west</b> on <b>Hùng Vương</b> toward <b>Chi Lăng</b>/<b>Triệu
        Nữ Vương</b><div style="font-size:0.9em">Pass by Công Ty Cp Đầu Tư Và Kinh
        Doanh Vàng Việt Nam - Cn Đà Nẵng (on the left)</div>
      :polyline:
        :points: "{gaaBweosS^jCd@fD^zCH\\Hr@"
      :start_location:
        :lat: 16.067981
        :lng: 108.2173956
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{gaaBweosSdArHh@xDHr@"
  :summary: Hùng Vương
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:17.02339', '2017-05-03 02:27:17.02339');
INSERT INTO distances VALUES (621, 217, 218, 824, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0673661
      :lng: 108.2146728
    :southwest:
      :lat: 16.0633905
      :lng: 108.2103528
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 824
    :duration:
      :text: 3 mins
      :value: 199
    :end_address: 1 Hàm Nghi, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0633905
      :lng: 108.2106706
    :start_address: 227 Hùng Vương, Hải Châu 2, Q. Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0673661
      :lng: 108.2146728
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 471
      :duration:
        :text: 2 mins
        :value: 139
      :end_location:
        :lat: 16.0665467
        :lng: 108.2103528
      :html_instructions: Head <b>west</b> on <b>Hùng Vương</b> toward <b>Ông Ích
        Khiêm</b><div style="font-size:0.9em">Pass by Cửa Hàng Vàng Miếng Sjc (on
        the left)</div>
      :polyline:
        :points: adaaButnsSXlBv@rHDd@Fj@@@LhA@R@FTnBBRFd@B^Hx@
      :start_location:
        :lat: 16.0673661
        :lng: 108.2146728
      :travel_mode: DRIVING
    - :distance:
        :text: 0.4 km
        :value: 353
      :duration:
        :text: 1 min
        :value: 60
      :end_location:
        :lat: 16.0633905
        :lng: 108.2106706
      :html_instructions: Turn <b>left</b> at Nike Store Đà Nẵng onto <b>Hàm Nghi</b><div
        style="font-size:0.9em">Pass by Trung Tâm Tiếng Anh Meet-to-talk và Trường
        Năng Khiếu Hoa Anh (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: "}~`aBuymsStBExDM\\C|AK`BMhBM"
      :start_location:
        :lat: 16.0665467
        :lng: 108.2103528
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: adaaButnsSpA`LLpARfBd@hEHx@tBEvEQhHg@
  :summary: Hùng Vương and Hàm Nghi
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:17.310687', '2017-05-03 02:27:17.310687');
INSERT INTO distances VALUES (622, 218, 219, 565, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0633905
      :lng: 108.2114014
    :southwest:
      :lat: 16.0583639
      :lng: 108.2106706
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.6 km
      :value: 565
    :duration:
      :text: 2 mins
      :value: 105
    :end_address: 35 Lê Đình Lý, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0583639
      :lng: 108.2114014
    :start_address: 1 Hàm Nghi, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0633905
      :lng: 108.2106706
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 380
      :duration:
        :text: 1 min
        :value: 68
      :end_location:
        :lat: 16.0600062
        :lng: 108.2111445
      :html_instructions: Head <b>south</b> on <b>Hàm Nghi</b> toward <b>Tản Đà</b><div
        style="font-size:0.9em">Pass by Nha Khoa Nhật Quang (on the right)</div>
      :polyline:
        :points: ek`aBu{msS|AKhBQrBOxDYHAd@C|BO
      :start_location:
        :lat: 16.0633905
        :lng: 108.2106706
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 185
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0583639
        :lng: 108.2114014
      :html_instructions: At Abbank - Atm, continue onto <b>Lê Đình Lý</b><div style="font-size:0.9em">Pass
        by Trung Tâm Giao Dịch Địa Ốc Hoàng Hương (on the left)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: av_aBs~msSVEpCWzAKbAI
      :start_location:
        :lat: 16.0600062
        :lng: 108.2111445
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ek`aBu{msStNgAdE[pHm@
  :summary: Hàm Nghi and Lê Đình Lý
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:18.053437', '2017-05-03 02:27:18.053437');
INSERT INTO distances VALUES (623, 219, 220, 490, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0583639
      :lng: 108.2120014
    :southwest:
      :lat: 16.0540881
      :lng: 108.2114014
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 490
    :duration:
      :text: 1 min
      :value: 66
    :end_address: 132 Lê Đình Lý, Vĩnh Trung, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0540881
      :lng: 108.211664
    :start_address: 35 Lê Đình Lý, Thạc Gián, Thanh Khê, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0583639
      :lng: 108.2114014
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 490
      :duration:
        :text: 1 min
        :value: 66
      :end_location:
        :lat: 16.0540881
        :lng: 108.211664
      :html_instructions: Head <b>south</b> on <b>Lê Đình Lý</b> toward <b>Tôn Thất
        Tùng</b><div style="font-size:0.9em">Pass by TRUONG AN THINH (on the left)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: wk_aBg`nsStAK~@E~AKXA`@GdAKfDa@hBYTCXCFA\FP@\HdAp@
      :start_location:
        :lat: 16.0583639
        :lng: 108.2114014
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: wk_aBg`nsSnG_@fBSpG{@n@Gd@Dn@JdAp@
  :summary: Lê Đình Lý
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:18.648824', '2017-05-03 02:27:18.648824');
INSERT INTO distances VALUES (624, 220, 221, 300, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0540881
      :lng: 108.211664
    :southwest:
      :lat: 16.0518313
      :lng: 108.2101174
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.3 km
      :value: 300
    :duration:
      :text: 1 min
      :value: 55
    :end_address: 217 Lê Đình Lý, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0518313
      :lng: 108.2101174
    :start_address: 132 Lê Đình Lý, Vĩnh Trung, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0540881
      :lng: 108.211664
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 300
      :duration:
        :text: 1 min
        :value: 55
      :end_location:
        :lat: 16.0518313
        :lng: 108.2101174
      :html_instructions: Head <b>southwest</b> on <b>Lê Đình Lý</b> toward <b>Nguyễn
        Tri Phương</b><div style="font-size:0.9em">Pass by Xitrumhousedn (on the right)</div><div
        style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: aq~`B{ansS~@j@tDvBrAz@xBrA
      :start_location:
        :lat: 16.0540881
        :lng: 108.211664
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: aq~`B{ansStFbDlEnC
  :summary: Lê Đình Lý
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:18.890277', '2017-05-03 02:27:18.890277');
INSERT INTO distances VALUES (625, 221, 222, 406, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0518313
      :lng: 108.2102661
    :southwest:
      :lat: 16.0497417
      :lng: 108.2088943
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 406
    :duration:
      :text: 1 min
      :value: 59
    :end_address: 86 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0497417
      :lng: 108.2102661
    :start_address: 217 Lê Đình Lý, Thanh Khê, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0518313
      :lng: 108.2101174
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 145
      :duration:
        :text: 1 min
        :value: 22
      :end_location:
        :lat: 16.0507611
        :lng: 108.2093622
      :html_instructions: Head <b>southwest</b> on <b>Lê Đình Lý</b><div style="font-size:0.9em">Pass
        by Công Ty Tnhh Mtv Đại Mộc Xanh (on the right)</div>
      :polyline:
        :points: "}b~`BgxmsSzBtALP@@RRLHDB`@J"
      :start_location:
        :lat: 16.0518313
        :lng: 108.2101174
      :travel_mode: DRIVING
    - :distance:
        :text: 0.3 km
        :value: 261
      :duration:
        :text: 1 min
        :value: 37
      :end_location:
        :lat: 16.0497417
        :lng: 108.2102661
      :html_instructions: At the roundabout, take the <b>5th</b> exit onto <b>Duy
        Tân</b><div style="font-size:0.9em">Pass by Công Ty Cp Sách &amp; Thiết Bị
        Giáo Dục Miền Trung (on the right)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: g|}`BosmsSCDAHAH?F?F@F?@BDBFBDDDBBDBD@DBD?D@D?D?B?DADABADABCBCBCBCBEBG@E@G?E?G?EAE?AAC?CAAACACAA?AAAA??AAAAAA?f@q@T_@FGj@kA
      :start_location:
        :lat: 16.0507611
        :lng: 108.2093622
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "}b~`BgxmsSzBtALPTTRL`@JENAPDVPVVHT@TGNOJ[?SCOKQEC|@qAr@sA"
  :summary: Lê Đình Lý and Duy Tân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:19.407459', '2017-05-03 02:27:19.407459');
INSERT INTO distances VALUES (626, 222, 223, 549, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0497417
      :lng: 108.2149263
    :southwest:
      :lat: 16.0481893
      :lng: 108.2102661
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.5 km
      :value: 549
    :duration:
      :text: 1 min
      :value: 71
    :end_address: Cty CP Xây lăp dầu khí Miền Trung, 78A Duy Tân, Hòa Thuận Đông,
      Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0484612
      :lng: 108.2149263
    :start_address: 86 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0497417
      :lng: 108.2102661
    :steps:
    - :distance:
        :text: 0.5 km
        :value: 549
      :duration:
        :text: 1 min
        :value: 71
      :end_location:
        :lat: 16.0484612
        :lng: 108.2149263
      :html_instructions: Head <b>southeast</b> on <b>Duy Tân</b> toward <b>Trưng
        Nữ Vương</b><div style="font-size:0.9em">Pass by Ho Chi Mih Memorial (on the
        right)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: "{u}`BeymsSzA{CFK|C}FJUTg@JUDSKcB_@gFIiA"
      :start_location:
        :lat: 16.0497417
        :lng: 108.2102661
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{u}`BeymsSlG{L`@}@DSu@uK"
  :summary: Duy Tân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:21.672684', '2017-05-03 02:27:21.672684');
INSERT INTO distances VALUES (627, 223, 224, 680, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0492586
      :lng: 108.2211903
    :southwest:
      :lat: 16.0484612
      :lng: 108.2149263
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.7 km
      :value: 680
    :duration:
      :text: 1 min
      :value: 70
    :end_address: 2 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0492298
      :lng: 108.2211903
    :start_address: Cty CP Xây lăp dầu khí Miền Trung, 78A Duy Tân, Hòa Thuận Đông,
      Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0484612
      :lng: 108.2149263
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 633
      :duration:
        :text: 1 min
        :value: 63
      :end_location:
        :lat: 16.0492514
        :lng: 108.2207914
      :html_instructions: Head <b>east</b> on <b>Duy Tân</b> toward <b>Lê Đình Thám</b><div
        style="font-size:0.9em">Pass by Eden Plaza Danang Hotel (on the right)</div>
      :polyline:
        :points: "{m}`BivnsSSeCMgBGu@e@oGGw@IiASkDEm@WkDCu@Ea@"
      :start_location:
        :lat: 16.0484612
        :lng: 108.2149263
      :travel_mode: DRIVING
    - :distance:
        :text: 47 m
        :value: 47
      :duration:
        :text: 1 min
        :value: 7
      :end_location:
        :lat: 16.0492298
        :lng: 108.2211903
      :html_instructions: At the roundabout, take the <b>2nd</b> exit and stay on
        <b>Duy Tân</b><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: roundabout-right
      :polyline:
        :points: yr}`B}zosS?A@?@A?A@A?A@A?A?C?A?A?AAA?A?AA??AA??AA??AA?BI@S?M
      :start_location:
        :lat: 16.0492514
        :lng: 108.2207914
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: "{m}`BivnsSoAsPk@{Ia@eGBA@E@IEMCAD]?M"
  :summary: Duy Tân
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:21.982003', '2017-05-03 02:27:21.982003');
INSERT INTO distances VALUES (628, 224, 225, 1958, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0538684
      :lng: 108.2379852
    :southwest:
      :lat: 16.0492298
      :lng: 108.2211903
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 2.0 km
      :value: 1958
    :duration:
      :text: 3 mins
      :value: 184
    :end_address: 18 Nguyễn Văn Thoại, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0538684
      :lng: 108.2379852
    :start_address: 2 Duy Tân, Hải Châu, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0492298
      :lng: 108.2211903
    :steps:
    - :distance:
        :text: 0.1 km
        :value: 102
      :duration:
        :text: 1 min
        :value: 14
      :end_location:
        :lat: 16.0493058
        :lng: 108.2221427
      :html_instructions: Head <b>east</b> on <b>Duy Tân</b>
      :polyline:
        :points: ur}`Bm}osSI{CEa@
      :start_location:
        :lat: 16.0492298
        :lng: 108.2211903
      :travel_mode: DRIVING
    - :distance:
        :text: 1.7 km
        :value: 1702
      :duration:
        :text: 2 mins
        :value: 142
      :end_location:
        :lat: 16.0530645
        :lng: 108.2368855
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Cầu
        Trần Thị Lý</b>
      :maneuver: roundabout-right
      :polyline:
        :points: es}`BkcpsS@A@A@A@A?C@A?A@A?A?A@??A?A?A?A@E?C?EACAE?CCEACACAACCCAAACACACAG[Ac@KuDAi@G{AEwAIaCSaDUiDMsB_A}MUeD[sEOmBImAEk@Ei@M}AMcAKm@Os@Sg@Wk@Yg@[a@]]a@_@c@]AA]UQSiDaC
      :start_location:
        :lat: 16.0493058
        :lng: 108.2221427
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 154
      :duration:
        :text: 1 min
        :value: 28
      :end_location:
        :lat: 16.0538684
        :lng: 108.2379852
      :html_instructions: At the roundabout, take the <b>2nd</b> exit onto <b>Nguyễn
        Văn Thoại</b><div style="font-size:0.9em">Pass by Công Ty Tnhh Thép &amp;
        Vt Xd Hà Thịnh Thành (on the left)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: sj~`Bq_ssS?A?C?C?CAC?CCEACACCA?AAACAAACAA?CEMUe@_@IEWOc@}@G[
      :start_location:
        :lat: 16.0530645
        :lng: 108.2368855
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ur}`Bm}osSO}DBCDIBK@MCSIOMIGCG[Ac@M_FMsD]cHc@}GaCe]c@aGYqBc@{Aq@sAy@_AeA}@_@WQSiDaC?EAKGQIGKIMUe@_@a@Uc@}@G[
  :summary: Cầu Trần Thị Lý
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:22.441226', '2017-05-03 02:27:22.441226');
INSERT INTO distances VALUES (629, 225, 226, 423, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0549468
      :lng: 108.2417774
    :southwest:
      :lat: 16.0538684
      :lng: 108.2379852
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 423
    :duration:
      :text: 1 min
      :value: 61
    :end_address: 102 Nguyễn Văn Thoại, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0549468
      :lng: 108.2417774
    :start_address: 18 Nguyễn Văn Thoại, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0538684
      :lng: 108.2379852
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 423
      :duration:
        :text: 1 min
        :value: 61
      :end_location:
        :lat: 16.0549468
        :lng: 108.2417774
      :html_instructions: Head <b>east</b> on <b>Nguyễn Văn Thoại</b> toward <b>Phạm
        Cự Lượng</b><div style="font-size:0.9em">Pass by Quán Cháo Vịt Thủy Tú (on
        the left)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :polyline:
        :points: uo~`BmfssSQ}@YyAKk@Kg@[gBG]EQQw@Ga@Os@G]Kg@G_@I[Ko@Mq@
      :start_location:
        :lat: 16.0538684
        :lng: 108.2379852
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: uo~`BmfssS_C{LwAyH
  :summary: Nguyễn Văn Thoại
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:23.030903', '2017-05-03 02:27:23.030903');
INSERT INTO distances VALUES (630, 226, 227, 755, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0578939
      :lng: 108.247107
    :southwest:
      :lat: 16.0549468
      :lng: 108.2417774
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.8 km
      :value: 755
    :duration:
      :text: 2 mins
      :value: 119
    :end_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0578939
      :lng: 108.2468709
    :start_address: 102 Nguyễn Văn Thoại, Bắc Mỹ An, Ngũ Hành Sơn, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0549468
      :lng: 108.2417774
    :steps:
    - :distance:
        :text: 0.6 km
        :value: 594
      :duration:
        :text: 2 mins
        :value: 96
      :end_location:
        :lat: 16.0564599
        :lng: 108.247107
      :html_instructions: Head <b>east</b> on <b>Nguyễn Văn Thoại</b> toward <b>Thủ
        Khoa Huân</b><div style="font-size:0.9em">Pass by Cửa Hàng Giặt Ủi Đà Nẵng
        (on the left)</div>
      :polyline:
        :points: mv~`Bc~ssSEU_@mB[_BAKUkAOw@Ou@O_AScASaAUeASeAEYYsA?AY_BW}A
      :start_location:
        :lat: 16.0549468
        :lng: 108.2417774
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 161
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0578939
        :lng: 108.2468709
      :html_instructions: Turn <b>left</b> at Nhà hàng Cua Đỏ onto <b>Võ Nguyên Giáp</b><div
        style="font-size:0.9em">Pass by Cửa Hàng Đặc Sản Miền Trung Thủy Mộc (on the
        left)</div><div style="font-size:0.9em">Destination will be on the right</div>
      :maneuver: turn-left
      :polyline:
        :points: "{__aBm_usS}AL_E`@"
      :start_location:
        :lat: 16.0564599
        :lng: 108.247107
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: mv~`Bc~ssSiCiNqAqGy@oEW}A}AL_E`@
  :summary: Nguyễn Văn Thoại
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:23.286222', '2017-05-03 02:27:23.286222');
INSERT INTO distances VALUES (631, 227, 228, 918, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0659204
      :lng: 108.2468709
    :southwest:
      :lat: 16.0578939
      :lng: 108.2454579
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.9 km
      :value: 918
    :duration:
      :text: 2 mins
      :value: 92
    :end_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0659204
      :lng: 108.2454579
    :start_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0578939
      :lng: 108.2468709
    :steps:
    - :distance:
        :text: 0.7 km
        :value: 696
      :duration:
        :text: 1 min
        :value: 69
      :end_location:
        :lat: 16.064018
        :lng: 108.2458242
      :html_instructions: Head <b>north</b> on <b>Võ Nguyên Giáp</b> toward <b>Trường
        Sa</b><div style="font-size:0.9em">Pass by GALINA DANANG Mud Bath &amp; Spa
        (on the left)</div>
      :polyline:
        :points: yh_aB}}tsSC?wFj@w@FyDNiERcBJkABa@?iBT_@BSDODSHS@OBODSFMHWNOJ
      :start_location:
        :lat: 16.0578939
        :lng: 108.2468709
      :travel_mode: DRIVING
    - :distance:
        :text: 0.2 km
        :value: 222
      :duration:
        :text: 1 min
        :value: 23
      :end_location:
        :lat: 16.0659204
        :lng: 108.2454579
      :html_instructions: At the roundabout, take the <b>1st</b> exit and stay on
        <b>Võ Nguyên Giáp</b><div style="font-size:0.9em">Pass by F2Bar (on the right)</div>
      :maneuver: roundabout-right
      :polyline:
        :points: co`aBkwtsSC?C@C?C@CBEDEBABABADSF[Jg@F[By@@c@?cCD
      :start_location:
        :lat: 16.064018
        :lng: 108.2458242
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: yh_aB}}tsS{Fj@qFVmH^mBBiCXc@JSHS@_@Ha@Pg@ZK@SNCFULcARuADgDD
  :summary: Võ Nguyên Giáp
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:23.564429', '2017-05-03 02:27:23.564429');
INSERT INTO distances VALUES (632, 228, 229, 444, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0698934
      :lng: 108.2454938
    :southwest:
      :lat: 16.0659204
      :lng: 108.2454043
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 444
    :duration:
      :text: 1 min
      :value: 42
    :end_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0698934
      :lng: 108.2454043
    :start_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0659204
      :lng: 108.2454579
    :steps:
    - :distance:
        :text: 0.4 km
        :value: 444
      :duration:
        :text: 1 min
        :value: 42
      :end_location:
        :lat: 16.0698934
        :lng: 108.2454043
      :html_instructions: Head <b>north</b> on <b>Võ Nguyên Giáp</b><div style="font-size:0.9em">Pass
        by Bãi Tắm Phước Mỹ (on the right in 350&nbsp;m)</div><div style="font-size:0.9em">Destination
        will be on the right</div>
      :polyline:
        :points: _{`aBcutsSE?eDDU?WKiA@wBAuDFeABeAB{@@
      :start_location:
        :lat: 16.0659204
        :lng: 108.2454579
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: _{`aBcutsSkDDU?WKaE?{FJaCD
  :summary: Võ Nguyên Giáp
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:23.883676', '2017-05-03 02:27:23.883676');
INSERT INTO distances VALUES (633, 229, 230, 428, 19, '---
- :bounds:
    :northeast:
      :lat: 16.0736794
      :lng: 108.2455322
    :southwest:
      :lat: 16.0698934
      :lng: 108.2453124
  :copyrights: Map data ©2017 Google
  :legs:
  - :distance:
      :text: 0.4 km
      :value: 428
    :duration:
      :text: 1 min
      :value: 52
    :end_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :end_location:
      :lat: 16.0736794
      :lng: 108.2455061
    :start_address: Võ Nguyên Giáp, Phước Mỹ, Sơn Trà, Đà Nẵng, Vietnam
    :start_location:
      :lat: 16.0698934
      :lng: 108.2454043
    :steps:
    - :distance:
        :text: 0.3 km
        :value: 281
      :duration:
        :text: 1 min
        :value: 25
      :end_location:
        :lat: 16.0724187
        :lng: 108.2453124
      :html_instructions: Head <b>north</b> on <b>Võ Nguyên Giáp</b><div style="font-size:0.9em">Pass
        by the park (on the right)</div>
      :polyline:
        :points: ysaaBwttsS}@@e@@}@?_B@eBBkABeAB
      :start_location:
        :lat: 16.0698934
        :lng: 108.2454043
      :travel_mode: DRIVING
    - :distance:
        :text: 0.1 km
        :value: 147
      :duration:
        :text: 1 min
        :value: 27
      :end_location:
        :lat: 16.0736794
        :lng: 108.2455061
      :html_instructions: Turn <b>right</b> at WiWi Fastfood Bien Dong Park, Da Nang
      :maneuver: turn-right
      :polyline:
        :points: scbaBettsS]Ya@MkACoBB
      :start_location:
        :lat: 16.0724187
        :lng: 108.2453124
      :travel_mode: DRIVING
    :traffic_speed_entry: []
    :via_waypoint: []
  :overview_polyline:
    :points: ysaaBwttsSaGDqDFeAB]Ya@MkACoBB
  :summary: Võ Nguyên Giáp
  :warnings: []
  :waypoint_order: []
', '2017-05-03 02:27:24.137668', '2017-05-03 02:27:24.137668');


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 185
-- Name: distances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('distances_id_seq', 875, true);


--
-- TOC entry 2256 (class 0 OID 140919)
-- Dependencies: 188
-- Data for Name: graph_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO graph_nodes VALUES (1, NULL, '2017-04-30 09:15:39.104284', '2017-04-30 09:15:39.104284');


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 187
-- Name: graph_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('graph_nodes_id_seq', 1, true);


--
-- TOC entry 2266 (class 0 OID 141005)
-- Dependencies: 198
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 197
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('links_id_seq', 1, false);


--
-- TOC entry 2262 (class 0 OID 140962)
-- Dependencies: 194
-- Data for Name: list_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 193
-- Name: list_nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('list_nodes_id_seq', 1, false);


--
-- TOC entry 2264 (class 0 OID 140979)
-- Dependencies: 196
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 195
-- Name: nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('nodes_id_seq', 1, false);


--
-- TOC entry 2260 (class 0 OID 140942)
-- Dependencies: 192
-- Data for Name: bus_station_routes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 191
-- Name: bus_station_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bus_station_routes_id_seq', 1, false);


--
-- TOC entry 2252 (class 0 OID 140894)
-- Dependencies: 184
-- Data for Name: bus_stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO bus_stations VALUES (2, 16.0948680000000017, 108.146261999999993, 'Name 2', 'KDL Xuân Thiều', 'Title 2', 'BT2', '2017-04-30 09:15:55.592836', '2017-04-30 09:16:24.052962');
INSERT INTO bus_stations VALUES (3, 16.0931169999999995, 108.148325999999997, 'Name 3', 'Doanh Trại Quân Đội', 'Title 3', 'BT3', '2017-04-30 09:15:55.603539', '2017-04-30 09:16:24.075109');
INSERT INTO bus_stations VALUES (4, 16.0861100000000015, 108.158128000000005, 'Name 4', 'D/d Bãi tắm Liên Chiểu', 'Title 4', 'BT4', '2017-04-30 09:15:55.613448', '2017-04-30 09:16:24.097311');
INSERT INTO bus_stations VALUES (5, 16.0831310000000016, 108.157559000000006, 'Name 5', 'D/d 83 Nguyễn Đình Trí', 'Title 5', 'BT5', '2017-04-30 09:15:55.625734', '2017-04-30 09:16:24.108762');
INSERT INTO bus_stations VALUES (6, 16.0806949999999986, 108.160475000000005, 'Name 6', '405 Kinh Dương Vương', 'Title 6', 'BT6', '2017-04-30 09:15:55.63677', '2017-04-30 09:16:24.119249');
INSERT INTO bus_stations VALUES (7, 16.0764989999999983, 108.166878999999994, 'Name 7', 'THPT Thanh Khê', 'Title 7', 'BT7', '2017-04-30 09:15:55.646906', '2017-04-30 09:16:24.130493');
INSERT INTO bus_stations VALUES (8, 16.0749689999999994, 108.169118999999995, 'Name 8', 'D/d 200 Kinh Dương Vương', 'Title 8', 'BT8', '2017-04-30 09:15:55.660253', '2017-04-30 09:16:24.141308');
INSERT INTO bus_stations VALUES (9, 16.0722580000000015, 108.173312999999993, 'Name 9', '33 Kinh Dương Vương', 'Title 9', 'BT9', '2017-04-30 09:15:55.669882', '2017-04-30 09:16:24.152409');
INSERT INTO bus_stations VALUES (10, 16.0745879999999985, 108.175437000000002, 'Name 10', '59 Lý Thái Tông', 'Title 10', 'BT10', '2017-04-30 09:15:55.680033', '2017-04-30 09:16:24.163365');
INSERT INTO bus_stations VALUES (11, 16.0742410000000007, 108.176697000000004, 'Name 11', 'BV Da Liễu', 'Title 11', 'BT11', '2017-04-30 09:15:55.691683', '2017-04-30 09:16:24.175509');
INSERT INTO bus_stations VALUES (12, 16.0719829999999995, 108.178764999999999, 'Name 12', 'CĐ Thương Mại', 'Title 12', 'BT12', '2017-04-30 09:15:55.725673', '2017-04-30 09:16:24.186443');
INSERT INTO bus_stations VALUES (13, 16.0703950000000013, 108.180244000000002, 'Name 13', 'TT Thể Thao TW3 (43 Dũng Sỹ Thanh Khê)', 'Title 13', 'BT13', '2017-04-30 09:15:55.735407', '2017-04-30 09:16:24.19692');
INSERT INTO bus_stations VALUES (14, 16.0684110000000011, 108.183304000000007, 'Name 14', 'THPT Thái Phiên 735 Trần Cao Vân', 'Title 14', 'BT14', '2017-04-30 09:15:55.746637', '2017-04-30 09:16:24.207686');
INSERT INTO bus_stations VALUES (15, 16.0715760000000003, 108.186864999999997, 'Name 15', '583 Trần Cao Vân', 'Title 15', 'BT15', '2017-04-30 09:15:55.76051', '2017-04-30 09:16:24.220147');
INSERT INTO bus_stations VALUES (16, 16.0711949999999995, 108.192239999999998, 'Name 16', 'UBND Phường Xuân Hà', 'Title 16', 'BT16', '2017-04-30 09:15:55.768724', '2017-04-30 09:16:24.230808');
INSERT INTO bus_stations VALUES (17, 16.0710300000000004, 108.198590999999993, 'Name 17', '301 Trần Cao Vân', 'Title 17', 'BT17', '2017-04-30 09:15:55.779678', '2017-04-30 09:16:24.241001');
INSERT INTO bus_stations VALUES (18, 16.0711019999999998, 108.201885000000004, 'Name 18', '189 Trần Cao Vân', 'Title 18', 'BT18', '2017-04-30 09:15:55.790716', '2017-04-30 09:16:24.252242');
INSERT INTO bus_stations VALUES (19, 16.0723190000000002, 108.208269000000001, 'Name 19', 'TH Hoàng Diệu', 'Title 19', 'BT19', '2017-04-30 09:15:55.801837', '2017-04-30 09:16:24.26319');
INSERT INTO bus_stations VALUES (20, 16.074978999999999, 108.212581999999998, 'Name 20', '79 Ông ích Khiêm', 'Title 20', 'BT20', '2017-04-30 09:15:55.813242', '2017-04-30 09:16:24.274013');
INSERT INTO bus_stations VALUES (21, 16.0782470000000011, 108.211960000000005, 'Name 21', 'Cao Đằng Công nghệ', 'Title 21', 'BT21', '2017-04-30 09:15:55.824131', '2017-04-30 09:16:24.285293');
INSERT INTO bus_stations VALUES (22, 16.0779379999999996, 108.214502999999993, 'Name 22', '145 Lý Tự Trọng', 'Title 22', 'BT22', '2017-04-30 09:15:55.836957', '2017-04-30 09:16:24.307737');
INSERT INTO bus_stations VALUES (23, 16.0775460000000017, 108.216627000000003, 'Name 23', '163 Đống Đa', 'Title 23', 'BT23', '2017-04-30 09:15:55.847057', '2017-04-30 09:16:24.318174');
INSERT INTO bus_stations VALUES (24, 16.0801650000000009, 108.218387000000007, 'Name 24', '75 Đống Đa', 'Title 24', 'BT24', '2017-04-30 09:15:55.868825', '2017-04-30 09:16:24.329294');
INSERT INTO bus_stations VALUES (26, 16.0842509999999983, 108.221406000000002, 'Name 26', '24 3 tháng 2', 'Title 26', 'BT26', '2017-04-30 09:15:55.890219', '2017-04-30 09:16:24.352525');
INSERT INTO bus_stations VALUES (27, 16.0866030000000002, 108.220320999999998, 'Name 27', 'Trạm Xe buýt xuân diệu', 'Title 27', 'BT27', '2017-04-30 09:15:55.901752', '2017-04-30 09:16:24.36286');
INSERT INTO bus_stations VALUES (28, 16.084738999999999, 108.220662000000004, 'Name 28', '49 3 tháng 2', 'Title 28', 'BT28', '2017-04-30 09:15:55.913247', '2017-04-30 09:16:24.373925');
INSERT INTO bus_stations VALUES (29, 16.0810570000000013, 108.222830000000002, 'Name 29', '06 Trần Phú (Báo Nhân Dân)', 'Title 29', 'BT29', '2017-04-30 09:15:55.923659', '2017-04-30 09:16:24.385248');
INSERT INTO bus_stations VALUES (30, 16.0758679999999998, 108.223524999999995, 'Name 30', 'Trung tâm Hành Chính Đà Nẵng Đường Trần Phú', 'Title 30', 'BT30', '2017-04-30 09:15:55.935607', '2017-04-30 09:16:24.395851');
INSERT INTO bus_stations VALUES (31, 16.0752389999999998, 108.222279999999998, 'Name 31', 'Công viên phần mềm Quang Trung', 'Title 31', 'BT31', '2017-04-30 09:15:55.946507', '2017-04-30 09:16:24.407016');
INSERT INTO bus_stations VALUES (32, 16.0740009999999991, 108.215998999999996, 'Name 32', '134 Quang Trung (THCS Nguyễn Huệ)', 'Title 32', 'BT32', '2017-04-30 09:15:55.95717', '2017-04-30 09:16:24.418066');
INSERT INTO bus_stations VALUES (33, 16.0732379999999999, 108.212198999999998, 'Name 33', '24 Trần Cao Vân', 'Title 33', 'BT33', '2017-04-30 09:15:55.968663', '2017-04-30 09:16:24.429479');
INSERT INTO bus_stations VALUES (34, 16.0723820000000011, 108.207999000000001, 'Name 34', '162 Trần Cao Vân (THCS Hoàng Diệu)', 'Title 34', 'BT34', '2017-04-30 09:15:55.979355', '2017-04-30 09:16:24.439822');
INSERT INTO bus_stations VALUES (35, 16.0712070000000011, 108.202189000000004, 'Name 35', '312 Trần Cao Vân', 'Title 35', 'BT35', '2017-04-30 09:15:55.990129', '2017-04-30 09:16:24.451353');
INSERT INTO bus_stations VALUES (36, 16.0712170000000008, 108.193241, 'Name 36', '396 Trần Cao Vân', 'Title 36', 'BT36', '2017-04-30 09:15:56.001372', '2017-04-30 09:16:24.462298');
INSERT INTO bus_stations VALUES (37, 16.0714949999999988, 108.187511999999998, 'Name 37', '714A Trần Cao Vân', 'Title 37', 'BT37', '2017-04-30 09:15:56.012149', '2017-04-30 09:16:24.473338');
INSERT INTO bus_stations VALUES (38, 16.068124000000001, 108.182886999999994, 'Name 38', '856 Trân Cao Vân', 'Title 38', 'BT38', '2017-04-30 09:15:56.023257', '2017-04-30 09:16:24.484212');
INSERT INTO bus_stations VALUES (39, 16.0707729999999991, 108.179955000000007, 'Name 39', 'ĐHTDTT (44 Dũng Sỹ Thanh Khê)', 'Title 39', 'BT39', '2017-04-30 09:15:56.034818', '2017-04-30 09:16:24.495478');
INSERT INTO bus_stations VALUES (40, 16.074107999999999, 108.176890999999998, 'Name 40', '100 Dũng Sỹ Thanh Khế (BV Da Liễu)', 'Title 40', 'BT40', '2017-04-30 09:15:56.045409', '2017-04-30 09:16:24.517978');
INSERT INTO bus_stations VALUES (41, 16.0747220000000013, 108.175449, 'Name 41', '56 Lý Thái Tông', 'Title 41', 'BT41', '2017-04-30 09:15:56.056315', '2017-04-30 09:16:24.529033');
INSERT INTO bus_stations VALUES (42, 16.0724799999999988, 108.173080999999996, 'Name 42', '28 Kinh Dương Vương', 'Title 42', 'BT42', '2017-04-30 09:15:56.068115', '2017-04-30 09:16:24.540112');
INSERT INTO bus_stations VALUES (43, 16.0749309999999994, 108.169275999999996, 'Name 43', '200 Kinh Dương Vương', 'Title 43', 'BT43', '2017-04-30 09:15:56.079138', '2017-04-30 09:16:24.550947');
INSERT INTO bus_stations VALUES (45, 16.0815379999999983, 108.159307999999996, 'Name 45', 'D/d 399 Kinh Dương Vương', 'Title 45', 'BT45', '2017-04-30 09:15:56.101011', '2017-04-30 09:16:24.573086');
INSERT INTO bus_stations VALUES (46, 16.0839190000000016, 108.158214000000001, 'Name 46', '43 Trần Đình Trí', 'Title 46', 'BT46', '2017-04-30 09:15:56.112941', '2017-04-30 09:16:24.583957');
INSERT INTO bus_stations VALUES (47, 16.0886509999999987, 108.154781, 'Name 47', 'Bãi tắm Liên Chiểu', 'Title 47', 'BT47', '2017-04-30 09:15:56.123182', '2017-04-30 09:16:24.595239');
INSERT INTO bus_stations VALUES (48, 16.0917850000000016, 108.150285999999994, 'Name 48', 'D/d Doanh Trại Quân Đội', 'Title 48', 'BT48', '2017-04-30 09:15:56.134274', '2017-04-30 09:16:24.606263');
INSERT INTO bus_stations VALUES (49, 16.0866030000000002, 108.220320999999998, 'Name 49', 'Trạm Xe buýt xuân diệu', 'Title 49', 'BT49', '2017-04-30 09:15:56.146853', '2017-04-30 09:16:24.617269');
INSERT INTO bus_stations VALUES (50, 16.084738999999999, 108.220662000000004, 'Name 50', '49 3 tháng 2', 'Title 50', 'BT50', '2017-04-30 09:15:56.156316', '2017-04-30 09:16:24.6285');
INSERT INTO bus_stations VALUES (51, 16.0823989999999988, 108.220771999999997, 'Name 51', 'Bar Phương Đông, 20 Đống Đa', 'Title 51', 'BT51', '2017-04-30 09:15:56.167345', '2017-04-30 09:16:24.639697');
INSERT INTO bus_stations VALUES (52, 16.0790080000000017, 108.219403999999997, 'Name 52', '40 Lê Lợi', 'Title 52', 'BT52', '2017-04-30 09:15:56.17828', '2017-04-30 09:16:24.650509');
INSERT INTO bus_stations VALUES (53, 16.0758679999999998, 108.223524999999995, 'Name 53', 'Trung tâm Hành Chính Đà Nẵng Đường Trần Phú', 'Title 53', 'BT53', '2017-04-30 09:15:56.18928', '2017-04-30 09:16:24.662481');
INSERT INTO bus_stations VALUES (54, 16.0752389999999998, 108.222279999999998, 'Name 54', 'Công viên phần mềm Quang Trung', 'Title 54', 'BT54', '2017-04-30 09:15:56.200626', '2017-04-30 09:16:24.673335');
INSERT INTO bus_stations VALUES (55, 16.0741200000000006, 108.220059000000006, 'Name 55', '126 Lê Lợi', 'Title 55', 'BT55', '2017-04-30 09:15:56.212055', '2017-04-30 09:16:24.68379');
INSERT INTO bus_stations VALUES (56, 16.0720269999999985, 108.220365000000001, 'Name 56', '154 Lê Lợi (Trường THPT Phan Châu Triinh)', 'Title 56', 'BT56', '2017-04-30 09:15:56.222714', '2017-04-30 09:16:24.696817');
INSERT INTO bus_stations VALUES (57, 16.0687229999999985, 108.220381000000003, 'Name 57', 'Nhà hát Trưng Vương', 'Title 57', 'BT57', '2017-04-30 09:15:56.234526', '2017-04-30 09:16:24.706081');
INSERT INTO bus_stations VALUES (58, 16.0656299999999987, 108.220005, 'Name 58', '106 Phan Châu Trinh', 'Title 58', 'BT58', '2017-04-30 09:15:56.24521', '2017-04-30 09:16:24.716997');
INSERT INTO bus_stations VALUES (59, 16.0620520000000013, 108.219672000000003, 'Name 59', '174 Phan Châu Trinh', 'Title 59', 'BT59', '2017-04-30 09:15:56.255512', '2017-04-30 09:16:24.729357');
INSERT INTO bus_stations VALUES (60, 16.0559469999999997, 108.218691000000007, 'Name 60', '391 Phan Châu Trinh (chùa Phổ Đà)', 'Title 60', 'BT60', '2017-04-30 09:15:56.266911', '2017-04-30 09:16:24.739579');
INSERT INTO bus_stations VALUES (61, 16.0529000000000011, 108.220381000000003, 'Name 61', '60 Núi Thành', 'Title 61', 'BT61', '2017-04-30 09:15:56.278383', '2017-04-30 09:16:24.753282');
INSERT INTO bus_stations VALUES (62, 16.0469329999999992, 108.220999000000006, 'Name 62', 'D/d 161 Núi Thành', 'Title 62', 'BT62', '2017-04-30 09:15:56.288787', '2017-04-30 09:16:24.772644');
INSERT INTO bus_stations VALUES (63, 16.0389920000000004, 108.217996999999997, 'Name 63', '62 Lê Thanh Nghị', 'Title 63', 'BT63', '2017-04-30 09:15:56.300055', '2017-04-30 09:16:24.783422');
INSERT INTO bus_stations VALUES (65, 16.0303879999999985, 108.218952999999999, 'Name 65', 'Chơ Đầu Mối Hòa Cường', 'Title 65', 'BT65', '2017-04-30 09:15:56.321905', '2017-04-30 09:16:24.805783');
INSERT INTO bus_stations VALUES (66, 16.025860999999999, 108.220046999999994, 'Name 66', 'METRO', 'Title 66', 'BT66', '2017-04-30 09:15:56.333293', '2017-04-30 09:16:24.817165');
INSERT INTO bus_stations VALUES (67, 16.022984000000001, 108.214703999999998, 'Name 67', '52 Cách Mạng Tháng 8 (Bệnh Viên Tâm Trí)', 'Title 67', 'BT67', '2017-04-30 09:15:56.345905', '2017-04-30 09:16:24.828406');
INSERT INTO bus_stations VALUES (68, 16.0207039999999985, 108.211712000000006, 'Name 68', '178 Cách Mạng Tháng 8', 'Title 68', 'BT68', '2017-04-30 09:15:56.355905', '2017-04-30 09:16:24.850114');
INSERT INTO bus_stations VALUES (70, 16.0119739999999986, 108.205591999999996, 'Name 70', '166 Ông Ích Đường', 'Title 70', 'BT70', '2017-04-30 09:15:56.379108', '2017-04-30 09:16:24.872403');
INSERT INTO bus_stations VALUES (71, 16.0030290000000015, 108.207024000000004, 'Name 71', '50 Phạm Hùng', 'Title 71', 'BT71', '2017-04-30 09:15:56.388812', '2017-04-30 09:16:24.883208');
INSERT INTO bus_stations VALUES (72, 15.9963110000000004, 108.206056000000004, 'Name 72', 'Trạm xe buýt Phạm Hùng', 'Title 72', 'BT72', '2017-04-30 09:15:56.400913', '2017-04-30 09:16:24.894253');
INSERT INTO bus_stations VALUES (73, 15.9984970000000004, 108.207295999999999, 'Name 73', '121 Phạm Hùng', 'Title 73', 'BT73', '2017-04-30 09:15:56.412006', '2017-04-30 09:16:24.906156');
INSERT INTO bus_stations VALUES (74, 16.0121150000000014, 108.205687999999995, 'Name 74', '297 Ông Ích Đường', 'Title 74', 'BT74', '2017-04-30 09:15:56.421902', '2017-04-30 09:16:24.916992');
INSERT INTO bus_stations VALUES (75, 16.0164819999999999, 108.205006999999995, 'Name 75', '173 Ông Ích Đường', 'Title 75', 'BT75', '2017-04-30 09:15:56.433048', '2017-04-30 09:16:24.927546');
INSERT INTO bus_stations VALUES (76, 16.0193370000000002, 108.209778999999997, 'Name 76', '151 Cách Mạng Tháng 8', 'Title 76', 'BT76', '2017-04-30 09:15:56.445771', '2017-04-30 09:16:24.939372');
INSERT INTO bus_stations VALUES (77, 16.0227560000000011, 108.214741000000004, 'Name 77', '23 Cách Mạng Tháng 8 (BV Tâm Trí)', 'Title 77', 'BT77', '2017-04-30 09:15:56.454736', '2017-04-30 09:16:24.950296');
INSERT INTO bus_stations VALUES (78, 16.0255399999999995, 108.219854999999995, 'Name 78', 'METRO', 'Title 78', 'BT78', '2017-04-30 09:15:56.466359', '2017-04-30 09:16:24.960816');
INSERT INTO bus_stations VALUES (79, 16.0301180000000016, 108.219125000000005, 'Name 79', 'Chơ Đầu Mối Hòa Cường 2', 'Title 79', 'BT79', '2017-04-30 09:15:56.477864', '2017-04-30 09:16:24.971818');
INSERT INTO bus_stations VALUES (80, 16.0393490000000014, 108.218033000000005, 'Name 80', '221 Lê Thanh Nghị', 'Title 80', 'BT80', '2017-04-30 09:15:56.488295', '2017-04-30 09:16:24.983164');
INSERT INTO bus_stations VALUES (81, 16.0425520000000006, 108.217656000000005, 'Name 81', '41 Lê Thanh Nghị', 'Title 81', 'BT81', '2017-04-30 09:15:56.499795', '2017-04-30 09:16:24.993897');
INSERT INTO bus_stations VALUES (82, 16.0477649999999983, 108.221028000000004, 'Name 82', '149 Núi Thành (THCS Tây Sơn)', 'Title 82', 'BT82', '2017-04-30 09:15:56.511966', '2017-04-30 09:16:25.005082');
INSERT INTO bus_stations VALUES (83, 16.0531569999999988, 108.220403000000005, 'Name 83', '21 Núi Thành', 'Title 83', 'BT83', '2017-04-30 09:15:56.521532', '2017-04-30 09:16:25.016069');
INSERT INTO bus_stations VALUES (84, 16.0528359999999992, 108.218072000000006, 'Name 84', '308 Trưng Nữ Vương', 'Title 84', 'BT84', '2017-04-30 09:15:56.53284', '2017-04-30 09:16:25.027621');
INSERT INTO bus_stations VALUES (85, 16.0564649999999993, 108.217186999999996, 'Name 85', '315 Hoàng Diệu', 'Title 85', 'BT85', '2017-04-30 09:15:56.543684', '2017-04-30 09:16:25.038465');
INSERT INTO bus_stations VALUES (86, 16.0598570000000009, 108.217123000000001, 'Name 86', '199 Hoàng Diệu (UBND Nam Dương)', 'Title 86', 'BT86', '2017-04-30 09:15:56.555506', '2017-04-30 09:16:25.060687');
INSERT INTO bus_stations VALUES (87, 16.0664459999999991, 108.220904000000004, 'Name 87', '241 Nguyễn Chí Thanh', 'Title 87', 'BT87', '2017-04-30 09:15:56.565808', '2017-04-30 09:16:25.071629');
INSERT INTO bus_stations VALUES (88, 16.0685439999999993, 108.221825999999993, 'Name 88', 'Công Viên Hùng Vương', 'Title 88', 'BT88', '2017-04-30 09:15:56.577806', '2017-04-30 09:16:25.082732');
INSERT INTO bus_stations VALUES (89, 16.0710960000000007, 108.225237000000007, 'Name 89', 'Bưu Điện Bạch Đằng', 'Title 89', 'BT89', '2017-04-30 09:15:56.587882', '2017-04-30 09:16:25.093143');
INSERT INTO bus_stations VALUES (90, 16.077452000000001, 108.224109999999996, 'Name 90', 'Novotel', 'Title 90', 'BT90', '2017-04-30 09:15:56.59913', '2017-04-30 09:16:25.104461');
INSERT INTO bus_stations VALUES (91, 16.0807509999999994, 108.223744999999994, 'Name 91', 'D/d 12 Bạch Đằng', 'Title 91', 'BT91', '2017-04-30 09:15:56.610877', '2017-04-30 09:16:25.11569');
INSERT INTO bus_stations VALUES (92, 16.0842509999999983, 108.221406000000002, 'Name 92', '24 3 tháng 2', 'Title 92', 'BT92', '2017-04-30 09:15:56.621301', '2017-04-30 09:16:25.126507');
INSERT INTO bus_stations VALUES (93, 16.0971229999999998, 108.231353999999996, 'Name 93', 'Thọ Quang (Vũng Thùng)', 'Title 93', 'BT93', '2017-04-30 09:15:56.632645', '2017-04-30 09:16:25.137631');
INSERT INTO bus_stations VALUES (95, 16.0930579999999992, 108.232150000000004, 'Name 95', 'D/d 230 Khúc Hạo', 'Title 95', 'BT95', '2017-04-30 09:15:56.654381', '2017-04-30 09:16:25.160823');
INSERT INTO bus_stations VALUES (96, 16.0918260000000011, 108.231667999999999, 'Name 96', 'Chung cư D2 Dương Vân Nga', 'Title 96', 'BT96', '2017-04-30 09:15:56.66567', '2017-04-30 09:16:25.171076');
INSERT INTO bus_stations VALUES (97, 16.0854140000000001, 108.236119000000002, 'Name 97', 'Đường Trần Thánh Tông, doanh trại bộ đội', 'Title 97', 'BT97', '2017-04-30 09:15:56.677687', '2017-04-30 09:16:25.182885');
INSERT INTO bus_stations VALUES (98, 16.0834440000000001, 108.237424000000004, 'Name 98', '570 Ngô Quyền', 'Title 98', 'BT98', '2017-04-30 09:15:56.687648', '2017-04-30 09:16:25.193323');
INSERT INTO bus_stations VALUES (99, 16.0812689999999989, 108.235191999999998, 'Name 99', '692 Ngô Quyền', 'Title 99', 'BT99', '2017-04-30 09:15:56.698607', '2017-04-30 09:16:25.204442');
INSERT INTO bus_stations VALUES (100, 16.0714790000000001, 108.230919999999998, 'Name 100', 'TH Tiểu La', 'Title 100', 'BT100', '2017-04-30 09:15:56.710659', '2017-04-30 09:16:25.217639');
INSERT INTO bus_stations VALUES (101, 16.0663760000000018, 108.232787000000002, 'Name 101', '926 Ngô Quyền (Công ty Điên Lực Sơn Trà)', 'Title 101', 'BT101', '2017-04-30 09:15:56.721247', '2017-04-30 09:16:25.226621');
INSERT INTO bus_stations VALUES (102, 16.0583840000000002, 108.235230999999999, 'Name 102', 'D/d 1075 Ngô Quyền (BV Quận Sơn Trà)', 'Title 102', 'BT102', '2017-04-30 09:15:56.731551', '2017-04-30 09:16:25.237674');
INSERT INTO bus_stations VALUES (103, 16.0544040000000017, 108.236459999999994, 'Name 103', 'D/d 1181 Ngô Quyền', 'Title 103', 'BT103', '2017-04-30 09:15:56.743634', '2017-04-30 09:16:25.250592');
INSERT INTO bus_stations VALUES (104, 16.0525480000000016, 108.236996000000005, 'Name 104', '38 Ngũ Hành Sơn', 'Title 104', 'BT104', '2017-04-30 09:15:56.753888', '2017-04-30 09:16:25.259923');
INSERT INTO bus_stations VALUES (105, 16.0477230000000013, 108.238498000000007, 'Name 105', '180 Ngũ Hành Sơn', 'Title 105', 'BT105', '2017-04-30 09:15:56.765119', '2017-04-30 09:16:25.271109');
INSERT INTO bus_stations VALUES (106, 16.0426810000000017, 108.240600999999998, 'Name 106', '310A Ngũ Hành Sơn', 'Title 106', 'BT106', '2017-04-30 09:15:56.777351', '2017-04-30 09:16:25.283777');
INSERT INTO bus_stations VALUES (107, 16.0396800000000006, 108.242135000000005, 'Name 107', 'D/d 175 Ngũ Hành Sơn', 'Title 107', 'BT107', '2017-04-30 09:15:56.787211', '2017-04-30 09:16:25.292877');
INSERT INTO bus_stations VALUES (108, 16.0338269999999987, 108.227804000000006, 'Name 108', 'Cầu Tiên Sơn', 'Title 108', 'BT108', '2017-04-30 09:15:56.798697', '2017-04-30 09:16:25.305034');
INSERT INTO bus_stations VALUES (109, 16.0325999999999986, 108.219821999999994, 'Name 109', '52 Xô Viết Nghệ Tĩnh (DH Đông Á)', 'Title 109', 'BT109', '2017-04-30 09:15:56.809911', '2017-04-30 09:16:25.317408');
INSERT INTO bus_stations VALUES (110, 16.0322180000000003, 108.216485000000006, 'Name 110', 'Lô 1288 Xô Viết Nghệ Tĩnh', 'Title 110', 'BT110', '2017-04-30 09:15:56.820418', '2017-04-30 09:16:25.326004');
INSERT INTO bus_stations VALUES (111, 16.0316340000000004, 108.211314999999999, 'Name 111', 'Nút giao Nguyễn Phong Sắc', 'Title 111', 'BT111', '2017-04-30 09:15:56.83157', '2017-04-30 09:16:25.337271');
INSERT INTO bus_stations VALUES (112, 16.0290110000000006, 108.211466999999999, 'Name 112', 'D/d Khu Chung Cư K3 Nguyễn Phong Sắc', 'Title 112', 'BT112', '2017-04-30 09:15:56.84284', '2017-04-30 09:16:25.350764');
INSERT INTO bus_stations VALUES (113, 16.0229980000000012, 108.213003999999998, 'Name 113', '86 Trần Phú Thành', 'Title 113', 'BT113', '2017-04-30 09:15:56.853682', '2017-04-30 09:16:25.359106');
INSERT INTO bus_stations VALUES (114, 16.0189319999999995, 108.208237999999994, 'Name 114', 'Cầu Nguyễn Tri Phương', 'Title 114', 'BT114', '2017-04-30 09:15:56.864636', '2017-04-30 09:16:25.370289');
INSERT INTO bus_stations VALUES (115, 16.0161480000000012, 108.205001999999993, 'Name 115', '58 Ông Ích Đường', 'Title 115', 'BT115', '2017-04-30 09:15:56.876909', '2017-04-30 09:16:25.383493');
INSERT INTO bus_stations VALUES (116, 16.0119739999999986, 108.205591999999996, 'Name 116', '166 Ông Ích Đường', 'Title 116', 'BT116', '2017-04-30 09:15:56.886847', '2017-04-30 09:16:25.392294');
INSERT INTO bus_stations VALUES (117, 16.0030290000000015, 108.207024000000004, 'Name 117', '48 Phạm Hùng', 'Title 117', 'BT117', '2017-04-30 09:15:56.897862', '2017-04-30 09:16:25.403694');
INSERT INTO bus_stations VALUES (118, 15.9963110000000004, 108.206056000000004, 'Name 118', 'Trạm xe buýt Phạm Hùng', 'Title 118', 'BT118', '2017-04-30 09:15:56.910003', '2017-04-30 09:16:25.414712');
INSERT INTO bus_stations VALUES (119, 15.9984970000000004, 108.207295999999999, 'Name 119', '119 Phạm Hùng', 'Title 119', 'BT119', '2017-04-30 09:15:56.920098', '2017-04-30 09:16:25.428741');
INSERT INTO bus_stations VALUES (120, 16.0121150000000014, 108.205687999999995, 'Name 120', '297 Ông Ích Đường', 'Title 120', 'BT120', '2017-04-30 09:15:56.931218', '2017-04-30 09:16:25.437053');
INSERT INTO bus_stations VALUES (122, 16.0193370000000002, 108.209778999999997, 'Name 122', '149 Cách Mạng Tháng 8', 'Title 122', 'BT122', '2017-04-30 09:15:56.953299', '2017-04-30 09:16:25.470584');
INSERT INTO bus_stations VALUES (123, 16.0227560000000011, 108.214741000000004, 'Name 123', '23 Cách Mạng Tháng 8 (BV Tâm Trí)', 'Title 123', 'BT123', '2017-04-30 09:15:57.004986', '2017-04-30 09:16:25.481168');
INSERT INTO bus_stations VALUES (124, 16.0231850000000016, 108.213003999999998, 'Name 124', '67 Trần Phú Thành', 'Title 124', 'BT124', '2017-04-30 09:15:57.030893', '2017-04-30 09:16:25.494261');
INSERT INTO bus_stations VALUES (125, 16.0299499999999995, 108.211447000000007, 'Name 125', 'Khu Chung Cư K4 Nguyễn Phong Sắc', 'Title 125', 'BT125', '2017-04-30 09:15:57.054355', '2017-04-30 09:16:25.503354');
INSERT INTO bus_stations VALUES (126, 16.0314639999999997, 108.211241999999999, 'Name 126', 'Nút giao Lương Nhữ Hộc', 'Title 126', 'BT126', '2017-04-30 09:15:57.075466', '2017-04-30 09:16:25.514622');
INSERT INTO bus_stations VALUES (127, 16.0319530000000015, 108.215708000000006, 'Name 127', 'Tổng Cục Hải Quan (Xô Viết Nghê Tĩnh)', 'Title 127', 'BT127', '2017-04-30 09:15:57.097819', '2017-04-30 09:16:25.526992');
INSERT INTO bus_stations VALUES (128, 16.0331949999999992, 108.225666000000004, 'Name 128', 'D/d lô 1214', 'Title 128', 'BT128', '2017-04-30 09:15:57.147987', '2017-04-30 09:16:25.536309');
INSERT INTO bus_stations VALUES (129, 16.0367299999999986, 108.241045, 'Name 129', 'Cầu Tiên Sơn', 'Title 129', 'BT129', '2017-04-30 09:15:57.174923', '2017-04-30 09:16:25.54856');
INSERT INTO bus_stations VALUES (130, 16.0404009999999992, 108.242075, 'Name 130', 'Showroom ISUZU', 'Title 130', 'BT130', '2017-04-30 09:15:57.185883', '2017-04-30 09:16:25.559185');
INSERT INTO bus_stations VALUES (131, 16.042783, 108.240819999999999, 'Name 131', '133 Ngũ Hành Sơn', 'Title 131', 'BT131', '2017-04-30 09:15:57.199685', '2017-04-30 09:16:25.569247');
INSERT INTO bus_stations VALUES (132, 16.0474740000000011, 108.238782, 'Name 132', 'ĐH Kinh Tế Đà Nẵng', 'Title 132', 'BT132', '2017-04-30 09:15:57.207443', '2017-04-30 09:16:25.580345');
INSERT INTO bus_stations VALUES (133, 16.0517760000000003, 108.237517999999994, 'Name 133', '29 Ngũ Hành Sơn (Doanh trại Quân Đội)', 'Title 133', 'BT133', '2017-04-30 09:15:57.218744', '2017-04-30 09:16:25.592038');
INSERT INTO bus_stations VALUES (134, 16.0540550000000017, 108.236815000000007, 'Name 134', 'TT GDTT Q. Sơn Trà (1093 Ngô Quyền)', 'Title 134', 'BT134', '2017-04-30 09:15:57.230379', '2017-04-30 09:16:25.602931');
INSERT INTO bus_stations VALUES (135, 16.0621909999999986, 108.234320999999994, 'Name 135', '1041 Ngô Quyền', 'Title 135', 'BT135', '2017-04-30 09:15:57.2423', '2017-04-30 09:16:25.613809');
INSERT INTO bus_stations VALUES (1, 16.1064779999999992, 108.135463999999999, 'Name 1', 'Chung cư Hòa Hiệp Nam', 'Title 1', 'BT1', '2017-04-30 09:15:55.569187', '2017-04-30 09:16:24.032752');
INSERT INTO bus_stations VALUES (25, 16.0824280000000002, 108.221157000000005, 'Name 25', 'Bar Phương Đông, 09 Đống Đa', 'Title 25', 'BT25', '2017-04-30 09:15:55.880855', '2017-04-30 09:16:24.340769');
INSERT INTO bus_stations VALUES (44, 16.0778579999999991, 108.164946, 'Name 44', 'D/d 261 Kinh Dương Vương', 'Title 44', 'BT44', '2017-04-30 09:15:56.089505', '2017-04-30 09:16:24.561833');
INSERT INTO bus_stations VALUES (64, 16.0368570000000012, 108.218275000000006, 'Name 64', 'D/d 213 Lê Thanh Nghị (TH Phan Đăng Lưu)', 'Title 64', 'BT64', '2017-04-30 09:15:56.311931', '2017-04-30 09:16:24.795119');
INSERT INTO bus_stations VALUES (69, 16.0161480000000012, 108.205001999999993, 'Name 69', '58 Ông Ích Đường', 'Title 69', 'BT69', '2017-04-30 09:15:56.366969', '2017-04-30 09:16:24.861217');
INSERT INTO bus_stations VALUES (94, 16.0969230000000003, 108.230881999999994, 'Name 94', 'Ngã Tư Lý Nhật Quang - Hoa Lư', 'Title 94', 'BT94', '2017-04-30 09:15:56.644245', '2017-04-30 09:16:25.14843');
INSERT INTO bus_stations VALUES (121, 16.0164819999999999, 108.205006999999995, 'Name 121', '171 Ông Ích Đường', 'Title 121', 'BT121', '2017-04-30 09:15:56.943084', '2017-04-30 09:16:25.44783');
INSERT INTO bus_stations VALUES (136, 16.0664149999999992, 108.232984999999999, 'Name 136', '851 Ngô Quyền (Công ty điện lực Sơn Trà)', 'Title 136', 'BT136', '2017-04-30 09:15:57.252127', '2017-04-30 09:16:25.624938');
INSERT INTO bus_stations VALUES (137, 16.0708890000000011, 108.231385000000003, 'Name 137', '739 Ngô Quyền', 'Title 137', 'BT137', '2017-04-30 09:15:57.265645', '2017-04-30 09:16:25.636075');
INSERT INTO bus_stations VALUES (138, 16.078240000000001, 108.232586999999995, 'Name 138', '575 Ngô Quyền', 'Title 138', 'BT138', '2017-04-30 09:15:57.274806', '2017-04-30 09:16:25.648181');
INSERT INTO bus_stations VALUES (139, 16.0805700000000016, 108.234808000000001, 'Name 139', '461 Ngô Quyền', 'Title 139', 'BT139', '2017-04-30 09:15:57.28512', '2017-04-30 09:16:25.658174');
INSERT INTO bus_stations VALUES (140, 16.0838169999999998, 108.238067999999998, 'Name 140', '369 Ngô Quyền', 'Title 140', 'BT140', '2017-04-30 09:15:57.296075', '2017-04-30 09:16:25.670285');
INSERT INTO bus_stations VALUES (141, 16.0846979999999995, 108.237129999999993, 'Name 141', 'Doang Trại Bộ Đội (Trần Thánh Tông)', 'Title 141', 'BT141', '2017-04-30 09:15:57.307539', '2017-04-30 09:16:25.68154');
INSERT INTO bus_stations VALUES (142, 16.0913959999999996, 108.231352999999999, 'Name 142', 'Lô 113 Dương Vân Nga', 'Title 142', 'BT142', '2017-04-30 09:15:57.318754', '2017-04-30 09:16:25.691363');
INSERT INTO bus_stations VALUES (143, 16.0941529999999986, 108.231026999999997, 'Name 143', '281 Khúc Hạo', 'Title 143', 'BT143', '2017-04-30 09:15:57.329797', '2017-04-30 09:16:25.702374');
INSERT INTO bus_stations VALUES (144, 16.0961120000000015, 108.229440999999994, 'Name 144', '43 Lý Nhật Quang', 'Title 144', 'BT144', '2017-04-30 09:15:57.340869', '2017-04-30 09:16:25.715091');
INSERT INTO bus_stations VALUES (145, 16.0866030000000002, 108.220320999999998, 'Name 145', 'Trạm Xe buýt xuân diệu', 'Title 145', 'BT145', '2017-04-30 09:15:57.352121', '2017-04-30 09:16:25.724516');
INSERT INTO bus_stations VALUES (146, 16.0869980000000012, 108.216412000000005, 'Name 146', '192 3 tháng 2', 'Title 146', 'BT146', '2017-04-30 09:16:25.735762', '2017-04-30 09:16:25.735762');
INSERT INTO bus_stations VALUES (147, 16.0861690000000017, 108.214393000000001, 'Name 147', 'D/d 39 Nguyễn Tất Thành', 'Title 147', 'BT147', '2017-04-30 09:16:25.747354', '2017-04-30 09:16:25.747354');
INSERT INTO bus_stations VALUES (148, 16.0806609999999992, 108.211117999999999, 'Name 148', 'D/d 221 Nguyễn Tất Thành', 'Title 148', 'BT148', '2017-04-30 09:16:25.757557', '2017-04-30 09:16:25.757557');
INSERT INTO bus_stations VALUES (149, 16.0788580000000003, 108.211780000000005, 'Name 149', '8 Ông Ích Khiêm', 'Title 149', 'BT149', '2017-04-30 09:16:25.768792', '2017-04-30 09:16:25.768792');
INSERT INTO bus_stations VALUES (150, 16.0779320000000006, 108.211911999999998, 'Name 150', 'Trường Cao Đằng Công nghệ', 'Title 150', 'BT150', '2017-04-30 09:16:25.779714', '2017-04-30 09:16:25.779714');
INSERT INTO bus_stations VALUES (151, 16.0750199999999985, 108.212541000000002, 'Name 151', '144 Ông Ích Khiêm', 'Title 151', 'BT151', '2017-04-30 09:16:25.794944', '2017-04-30 09:16:25.794944');
INSERT INTO bus_stations VALUES (152, 16.072735999999999, 108.212993999999995, 'Name 152', 'Công viên ngã tư Quang Trung', 'Title 152', 'BT152', '2017-04-30 09:16:25.837571', '2017-04-30 09:16:25.837571');
INSERT INTO bus_stations VALUES (153, 16.071314000000001, 108.211243999999994, 'Name 153', '196 Hải Phòng', 'Title 153', 'BT153', '2017-04-30 09:16:25.857234', '2017-04-30 09:16:25.857234');
INSERT INTO bus_stations VALUES (154, 16.0708139999999986, 108.208748999999997, 'Name 154', '212 Hải Phòng', 'Title 154', 'BT154', '2017-04-30 09:16:25.888175', '2017-04-30 09:16:25.888175');
INSERT INTO bus_stations VALUES (155, 16.0678470000000004, 108.204964000000004, 'Name 155', '352 Hải Phòng', 'Title 155', 'BT155', '2017-04-30 09:16:25.912739', '2017-04-30 09:16:25.912739');
INSERT INTO bus_stations VALUES (156, 16.0660319999999999, 108.205546999999996, 'Name 156', 'Công viên 29/03, d/d điện máy Nguyễn Kim', 'Title 156', 'BT156', '2017-04-30 09:16:25.94676', '2017-04-30 09:16:25.94676');
INSERT INTO bus_stations VALUES (157, 16.0640569999999983, 108.208299999999994, 'Name 157', '70B Phan Thanh', 'Title 157', 'BT157', '2017-04-30 09:16:25.956983', '2017-04-30 09:16:25.956983');
INSERT INTO bus_stations VALUES (158, 16.0610099999999996, 108.209294, 'Name 158', '132 Phan Thanh', 'Title 158', 'BT158', '2017-04-30 09:16:25.967859', '2017-04-30 09:16:25.967859');
INSERT INTO bus_stations VALUES (159, 16.0579959999999993, 108.209733999999997, 'Name 159', '42 Phạm Văn Nghị', 'Title 159', 'BT159', '2017-04-30 09:16:25.979123', '2017-04-30 09:16:25.979123');
INSERT INTO bus_stations VALUES (160, 16.0560369999999999, 108.209233999999995, 'Name 160', '304A Nguyễn Tri Phương', 'Title 160', 'BT160', '2017-04-30 09:16:25.990152', '2017-04-30 09:16:25.990152');
INSERT INTO bus_stations VALUES (161, 16.0518590000000003, 108.210074000000006, 'Name 161', 'D/d 159 Lê Đình Lý', 'Title 161', 'BT161', '2017-04-30 09:16:26.000905', '2017-04-30 09:16:26.000905');
INSERT INTO bus_stations VALUES (162, 16.049239, 108.209344000000002, 'Name 162', '38 Nguyễn Hữu Thọ', 'Title 162', 'BT162', '2017-04-30 09:16:26.011739', '2017-04-30 09:16:26.011739');
INSERT INTO bus_stations VALUES (163, 16.044943, 108.209871000000007, 'Name 163', '128 Nguyễn Hữu Thọ', 'Title 163', 'BT163', '2017-04-30 09:16:26.023428', '2017-04-30 09:16:26.023428');
INSERT INTO bus_stations VALUES (164, 16.0441900000000004, 108.211779000000007, 'Name 164', '297 Tiểu La', 'Title 164', 'BT164', '2017-04-30 09:16:26.054524', '2017-04-30 09:16:26.054524');
INSERT INTO bus_stations VALUES (165, 16.0421370000000003, 108.213621000000003, 'Name 165', '100 Nguyễn Hữu Đạt', 'Title 165', 'BT165', '2017-04-30 09:16:26.079898', '2017-04-30 09:16:26.079898');
INSERT INTO bus_stations VALUES (166, 16.0368929999999992, 108.214248999999995, 'Name 166', '86 Huỳnh Tấn Phát', 'Title 166', 'BT166', '2017-04-30 09:16:26.089672', '2017-04-30 09:16:26.089672');
INSERT INTO bus_stations VALUES (167, 16.0360879999999995, 108.216444999999993, 'Name 167', 'Cao Đẳng Bách Khoa', 'Title 167', 'BT167', '2017-04-30 09:16:26.10076', '2017-04-30 09:16:26.10076');
INSERT INTO bus_stations VALUES (168, 16.0368139999999997, 108.218922000000006, 'Name 168', 'THPT Nguyễn Hiền', 'Title 168', 'BT168', '2017-04-30 09:16:26.112734', '2017-04-30 09:16:26.112734');
INSERT INTO bus_stations VALUES (169, 16.0373739999999998, 108.221299000000002, 'Name 169', 'Cao Đẳng Phương Đông', 'Title 169', 'BT169', '2017-04-30 09:16:26.122914', '2017-04-30 09:16:26.122914');
INSERT INTO bus_stations VALUES (170, 16.0360900000000015, 108.223888000000002, 'Name 170', '472 2 tháng 9', 'Title 170', 'BT170', '2017-04-30 09:16:26.1341', '2017-04-30 09:16:26.1341');
INSERT INTO bus_stations VALUES (171, 16.0343020000000003, 108.229376999999999, 'Name 171', 'Siêu thị Lotte', 'Title 171', 'BT171', '2017-04-30 09:16:26.147147', '2017-04-30 09:16:26.147147');
INSERT INTO bus_stations VALUES (172, 16.0362620000000007, 108.224057999999999, 'Name 172', 'Khu vui chơi Hello Center', 'Title 172', 'BT172', '2017-04-30 09:16:26.156282', '2017-04-30 09:16:26.156282');
INSERT INTO bus_stations VALUES (173, 16.0376510000000003, 108.222572999999997, 'Name 173', '06 Phan Đăng Lưu', 'Title 173', 'BT173', '2017-04-30 09:16:26.167189', '2017-04-30 09:16:26.167189');
INSERT INTO bus_stations VALUES (174, 16.0370610000000013, 108.21969, 'Name 174', 'Bệnh viện mắt Đà Nẵng', 'Title 174', 'BT174', '2017-04-30 09:16:26.178461', '2017-04-30 09:16:26.178461');
INSERT INTO bus_stations VALUES (175, 16.0362580000000001, 108.217301000000006, 'Name 175', '128 Phan Đăng Lưu', 'Title 175', 'BT175', '2017-04-30 09:16:26.191329', '2017-04-30 09:16:26.191329');
INSERT INTO bus_stations VALUES (176, 16.0371230000000011, 108.214222000000007, 'Name 176', '85 Huỳnh Tấn Phát', 'Title 176', 'BT176', '2017-04-30 09:16:26.201006', '2017-04-30 09:16:26.201006');
INSERT INTO bus_stations VALUES (177, 16.0416099999999986, 108.213680999999994, 'Name 177', '109 Nguyễn Hữu Dật', 'Title 177', 'BT177', '2017-04-30 09:16:26.211428', '2017-04-30 09:16:26.211428');
INSERT INTO bus_stations VALUES (178, 16.0444670000000009, 108.213488999999996, 'Name 178', '100 Tiểu La', 'Title 178', 'BT178', '2017-04-30 09:16:26.222796', '2017-04-30 09:16:26.222796');
INSERT INTO bus_stations VALUES (179, 16.0445059999999984, 108.210109000000003, 'Name 179', 'TH Lý Công Uẩn', 'Title 179', 'BT179', '2017-04-30 09:16:26.235147', '2017-04-30 09:16:26.235147');
INSERT INTO bus_stations VALUES (180, 16.0489360000000012, 108.209575000000001, 'Name 180', 'Showroom Mercesdes-Benz', 'Title 180', 'BT180', '2017-04-30 09:16:26.244776', '2017-04-30 09:16:26.244776');
INSERT INTO bus_stations VALUES (181, 16.051679, 108.210038999999995, 'Name 181', '191 Lê Đình Lý', 'Title 181', 'BT181', '2017-04-30 09:16:26.255956', '2017-04-30 09:16:26.255956');
INSERT INTO bus_stations VALUES (182, 16.0550679999999986, 108.209706999999995, 'Name 182', '175 Nguyễn Tri Phương', 'Title 182', 'BT182', '2017-04-30 09:16:26.267333', '2017-04-30 09:16:26.267333');
INSERT INTO bus_stations VALUES (183, 16.0581269999999989, 108.209723999999994, 'Name 183', '39 Phạm Văn Nghị', 'Title 183', 'BT183', '2017-04-30 09:16:26.278084', '2017-04-30 09:16:26.278084');
INSERT INTO bus_stations VALUES (184, 16.0606089999999995, 108.209384, 'Name 184', '189 Phan Thanh', 'Title 184', 'BT184', '2017-04-30 09:16:26.288931', '2017-04-30 09:16:26.288931');
INSERT INTO bus_stations VALUES (185, 16.0647540000000006, 108.208061999999998, 'Name 185', '45 Phan Thanh', 'Title 185', 'BT185', '2017-04-30 09:16:26.300166', '2017-04-30 09:16:26.300166');
INSERT INTO bus_stations VALUES (186, 16.066161000000001, 108.207474000000005, 'Name 186', '130 Lý Thái Tổ', 'Title 186', 'BT186', '2017-04-30 09:16:26.312667', '2017-04-30 09:16:26.312667');
INSERT INTO bus_stations VALUES (187, 16.0683119999999988, 108.204952000000006, 'Name 187', '461 Hải Phòng', 'Title 187', 'BT187', '2017-04-30 09:16:26.323722', '2017-04-30 09:16:26.323722');
INSERT INTO bus_stations VALUES (188, 16.0708130000000011, 108.208932000000004, 'Name 188', '305 Hải Phòng', 'Title 188', 'BT188', '2017-04-30 09:16:26.333493', '2017-04-30 09:16:26.333493');
INSERT INTO bus_stations VALUES (189, 16.0712219999999988, 108.210954000000001, 'Name 189', '231 Hải Phòng', 'Title 189', 'BT189', '2017-04-30 09:16:26.344469', '2017-04-30 09:16:26.344469');
INSERT INTO bus_stations VALUES (190, 16.074978999999999, 108.212581999999998, 'Name 190', '79 Ông ích Khiêm', 'Title 190', 'BT190', '2017-04-30 09:16:26.359007', '2017-04-30 09:16:26.359007');
INSERT INTO bus_stations VALUES (191, 16.0782470000000011, 108.211960000000005, 'Name 191', 'Cao Đằng Công nghệ', 'Title 191', 'BT191', '2017-04-30 09:16:26.366801', '2017-04-30 09:16:26.366801');
INSERT INTO bus_stations VALUES (192, 16.0809180000000005, 108.211589000000004, 'Name 192', '219 Nguyễn Tất Thành', 'Title 192', 'BT192', '2017-04-30 09:16:26.377836', '2017-04-30 09:16:26.377836');
INSERT INTO bus_stations VALUES (193, 16.0844920000000009, 108.213825, 'Name 193', '61 Nguyễn Tất Thành', 'Title 193', 'BT193', '2017-04-30 09:16:26.389592', '2017-04-30 09:16:26.389592');
INSERT INTO bus_stations VALUES (194, 16.0868749999999991, 108.216384000000005, 'Name 194', '159 3 tháng 2', 'Title 194', 'BT194', '2017-04-30 09:16:26.399776', '2017-04-30 09:16:26.399776');
INSERT INTO bus_stations VALUES (195, 16.099494, 108.254963000000004, 'Name 195', 'Bến Thọ Quang', 'Title 195', 'BT195', '2017-04-30 09:16:26.410767', '2017-04-30 09:16:26.410767');
INSERT INTO bus_stations VALUES (196, 16.1059330000000003, 108.254107000000005, 'Name 196', 'Lô 16B1.1 Lê Đức Thọ', 'Title 196', 'BT196', '2017-04-30 09:16:26.421857', '2017-04-30 09:16:26.421857');
INSERT INTO bus_stations VALUES (197, 16.1050110000000011, 108.246748999999994, 'Name 197', '26 Yết Kiêu', 'Title 197', 'BT197', '2017-04-30 09:16:26.433214', '2017-04-30 09:16:26.433214');
INSERT INTO bus_stations VALUES (198, 16.1006140000000002, 108.247058999999993, 'Name 198', 'D/d 35 Ngô Quyền', 'Title 198', 'BT198', '2017-04-30 09:16:26.445047', '2017-04-30 09:16:26.445047');
INSERT INTO bus_stations VALUES (199, 16.0960709999999985, 108.245039000000006, 'Name 199', '118 Ngô Quyền', 'Title 199', 'BT199', '2017-04-30 09:16:26.478143', '2017-04-30 09:16:26.478143');
INSERT INTO bus_stations VALUES (200, 16.0897390000000016, 108.242219000000006, 'Name 200', '314 Ngô Quyền', 'Title 200', 'BT200', '2017-04-30 09:16:26.4899', '2017-04-30 09:16:26.4899');
INSERT INTO bus_stations VALUES (201, 16.0863839999999989, 108.240292999999994, 'Name 201', '442 Ngô Quyền', 'Title 201', 'BT201', '2017-04-30 09:16:26.499385', '2017-04-30 09:16:26.499385');
INSERT INTO bus_stations VALUES (202, 16.0846979999999995, 108.237129999999993, 'Name 202', 'Đường Trần Thánh Tông, doanh trại bộ đội', 'Title 202', 'BT202', '2017-04-30 09:16:26.510326', '2017-04-30 09:16:26.510326');
INSERT INTO bus_stations VALUES (203, 16.0900740000000013, 108.232876000000005, 'Name 203', 'Đường Trần Thánh Tông, khu nhà 12T1', 'Title 203', 'BT203', '2017-04-30 09:16:26.52303', '2017-04-30 09:16:26.52303');
INSERT INTO bus_stations VALUES (204, 16.0931360000000012, 108.232151000000002, 'Name 204', '210 Khúc Hạo', 'Title 204', 'BT204', '2017-04-30 09:16:26.532356', '2017-04-30 09:16:26.532356');
INSERT INTO bus_stations VALUES (205, 16.0967890000000011, 108.230710000000002, 'Name 205', 'Đường Lý Nhật Quang, khu chung cư Hoa Lư', 'Title 205', 'BT205', '2017-04-30 09:16:26.543874', '2017-04-30 09:16:26.543874');
INSERT INTO bus_stations VALUES (206, 16.0999349999999986, 108.229832000000002, 'Name 206', 'Đường Lê Đức Thọ, chân cầu Thuận Phước', 'Title 206', 'BT206', '2017-04-30 09:16:26.556302', '2017-04-30 09:16:26.556302');
INSERT INTO bus_stations VALUES (207, 16.0892160000000004, 108.215253000000004, 'Name 207', 'Chân cầu Thuận Phước, Blooming Tower', 'Title 207', 'BT207', '2017-04-30 09:16:26.566844', '2017-04-30 09:16:26.566844');
INSERT INTO bus_stations VALUES (208, 16.0902570000000011, 108.218176999999997, 'Name 208', '57D Xuân Diệu', 'Title 208', 'BT208', '2017-04-30 09:16:26.576833', '2017-04-30 09:16:26.576833');
INSERT INTO bus_stations VALUES (209, 16.0888370000000016, 108.219615000000005, 'Name 209', '121 Xuân Diệu', 'Title 209', 'BT209', '2017-04-30 09:16:26.589308', '2017-04-30 09:16:26.589308');
INSERT INTO bus_stations VALUES (210, 16.084738999999999, 108.220662000000004, 'Name 210', '49 3 tháng 2', 'Title 210', 'BT210', '2017-04-30 09:16:26.600241', '2017-04-30 09:16:26.600241');
INSERT INTO bus_stations VALUES (211, 16.0823989999999988, 108.220771999999997, 'Name 211', 'Bar Phương Đông, 20 Đống Đa', 'Title 211', 'BT211', '2017-04-30 09:16:26.609842', '2017-04-30 09:16:26.609842');
INSERT INTO bus_stations VALUES (212, 16.0808120000000017, 108.218772000000001, 'Name 212', '106 Đống Đa', 'Title 212', 'BT212', '2017-04-30 09:16:26.621229', '2017-04-30 09:16:26.621229');
INSERT INTO bus_stations VALUES (213, 16.0773229999999998, 108.216380000000001, 'Name 213', '240 Đống Đa', 'Title 213', 'BT213', '2017-04-30 09:16:26.632441', '2017-04-30 09:16:26.632441');
INSERT INTO bus_stations VALUES (214, 16.0758450000000011, 108.217800999999994, 'Name 214', '10 Nguyễn Thị Minh Khai, CATP', 'Title 214', 'BT214', '2017-04-30 09:16:26.6438', '2017-04-30 09:16:26.6438');
INSERT INTO bus_stations VALUES (215, 16.0690559999999998, 108.219026999999997, 'Name 215', '156 Nguyễn Thị Minh Khai', 'Title 215', 'BT215', '2017-04-30 09:16:26.656391', '2017-04-30 09:16:26.656391');
INSERT INTO bus_stations VALUES (216, 16.0679949999999998, 108.217392000000004, 'Name 216', '192 Hùng Vương', 'Title 216', 'BT216', '2017-04-30 09:16:26.665222', '2017-04-30 09:16:26.665222');
INSERT INTO bus_stations VALUES (217, 16.0673780000000015, 108.214669999999998, 'Name 217', 'Đường Hùng Vương, Chợ Cồn', 'Title 217', 'BT217', '2017-04-30 09:16:26.676598', '2017-04-30 09:16:26.676598');
INSERT INTO bus_stations VALUES (218, 16.0633869999999987, 108.210642000000007, 'Name 218', 'Đường Hàm Nghi, Hồ Thạc Gián', 'Title 218', 'BT218', '2017-04-30 09:16:26.689809', '2017-04-30 09:16:26.689809');
INSERT INTO bus_stations VALUES (219, 16.0583589999999994, 108.211365000000001, 'Name 219', 'Đường Lê Đình Lý, khu Chung cư', 'Title 219', 'BT219', '2017-04-30 09:16:26.69843', '2017-04-30 09:16:26.69843');
INSERT INTO bus_stations VALUES (220, 16.0541139999999984, 108.211623000000003, 'Name 220', 'D/d Toyota Lê Đình Lý', 'Title 220', 'BT220', '2017-04-30 09:16:26.709917', '2017-04-30 09:16:26.709917');
INSERT INTO bus_stations VALUES (221, 16.0518590000000003, 108.210074000000006, 'Name 221', 'D/d 159 Lê Đình Lý', 'Title 221', 'BT221', '2017-04-30 09:16:26.722691', '2017-04-30 09:16:26.722691');
INSERT INTO bus_stations VALUES (222, 16.0497119999999995, 108.210246999999995, 'Name 222', 'Toyota Duy Tân', 'Title 222', 'BT222', '2017-04-30 09:16:26.731812', '2017-04-30 09:16:26.731812');
INSERT INTO bus_stations VALUES (223, 16.0484310000000008, 108.214931000000007, 'Name 223', 'Bảo tàng Quân Khu 5, 07 Duy Tân', 'Title 223', 'BT223', '2017-04-30 09:16:26.742722', '2017-04-30 09:16:26.742722');
INSERT INTO bus_stations VALUES (224, 16.0492069999999991, 108.221192000000002, 'Name 224', 'Cầu Trần Thị Lý', 'Title 224', 'BT224', '2017-04-30 09:16:26.754762', '2017-04-30 09:16:26.754762');
INSERT INTO bus_stations VALUES (225, 16.0538600000000002, 108.237988000000001, 'Name 225', '54 Nguyễn Văn Thoại', 'Title 225', 'BT225', '2017-04-30 09:16:26.765162', '2017-04-30 09:16:26.765162');
INSERT INTO bus_stations VALUES (226, 16.0549169999999997, 108.241786000000005, 'Name 226', '120 Nguyễn Văn Thoại', 'Title 226', 'BT226', '2017-04-30 09:16:26.776054', '2017-04-30 09:16:26.776054');
INSERT INTO bus_stations VALUES (227, 16.0578980000000016, 108.246897000000004, 'Name 227', 'Đường Võ Nguyên Giáp, khách sạn Mỹ Khê Đức Long', 'Title 227', 'BT227', '2017-04-30 09:16:26.789464', '2017-04-30 09:16:26.789464');
INSERT INTO bus_stations VALUES (228, 16.0659209999999995, 108.245472000000007, 'Name 228', 'Nhà hàng Mỹ Hạnh', 'Title 228', 'BT228', '2017-04-30 09:16:26.798149', '2017-04-30 09:16:26.798149');
INSERT INTO bus_stations VALUES (229, 16.0698940000000015, 108.245425999999995, 'Name 229', 'Công viên Biển Đông', 'Title 229', 'BT229', '2017-04-30 09:16:26.809916', '2017-04-30 09:16:26.809916');
INSERT INTO bus_stations VALUES (230, 16.0736789999999985, 108.245496000000003, 'Name 230', 'Bãi xe Công viên Biển Đông', 'Title 230', 'BT230', '2017-04-30 09:16:26.822067', '2017-04-30 09:16:26.822067');
INSERT INTO bus_stations VALUES (231, 16.0698819999999998, 108.245132999999996, 'Name 231', 'D/d Công viên Biển Đông', 'Title 231', 'BT231', '2017-04-30 09:16:26.831843', '2017-04-30 09:16:26.831843');
INSERT INTO bus_stations VALUES (232, 16.0656929999999996, 108.24521, 'Name 232', 'Đường Võ Nguyên Giáp, quán A.Hạnh', 'Title 232', 'BT232', '2017-04-30 09:16:26.844202', '2017-04-30 09:16:26.844202');
INSERT INTO bus_stations VALUES (233, 16.0577940000000012, 108.246865, 'Name 233', 'Đường Võ Nguyên Giáp, khách sạn Mỹ Khê Đức Long', 'Title 233', 'BT233', '2017-04-30 09:16:26.853307', '2017-04-30 09:16:26.853307');
INSERT INTO bus_stations VALUES (234, 16.0554570000000005, 108.243475000000004, 'Name 234', '181 Nguyễn Văn Thoại', 'Title 234', 'BT234', '2017-04-30 09:16:26.864788', '2017-04-30 09:16:26.864788');
INSERT INTO bus_stations VALUES (235, 16.055019999999999, 108.241928999999999, 'Name 235', '119 Nguyễn Văn Thoại', 'Title 235', 'BT235', '2017-04-30 09:16:26.875797', '2017-04-30 09:16:26.875797');
INSERT INTO bus_stations VALUES (236, 16.0494289999999999, 108.221407999999997, 'Name 236', 'Công ty Hữu Toàn, 02 Duy Tân', 'Title 236', 'BT236', '2017-04-30 09:16:26.886602', '2017-04-30 09:16:26.886602');
INSERT INTO bus_stations VALUES (237, 16.0490099999999991, 108.217917999999997, 'Name 237', '28 Duy Tân', 'Title 237', 'BT237', '2017-04-30 09:16:26.897978', '2017-04-30 09:16:26.897978');
INSERT INTO bus_stations VALUES (238, 16.0498529999999988, 108.210426999999996, 'Name 238', 'Showroom Toyota, 88B Duy Tân', 'Title 238', 'BT238', '2017-04-30 09:16:26.909159', '2017-04-30 09:16:26.909159');
INSERT INTO bus_stations VALUES (239, 16.0532329999999988, 108.208967999999999, 'Name 239', '91 Nguyễn Hữu Thọ', 'Title 239', 'BT239', '2017-04-30 09:16:26.920342', '2017-04-30 09:16:26.920342');
INSERT INTO bus_stations VALUES (240, 16.058133999999999, 108.206440000000001, 'Name 240', 'Đường vào sân bay, 13 Nguyễn Tri Phương', 'Title 240', 'BT240', '2017-04-30 09:16:26.931104', '2017-04-30 09:16:26.931104');
INSERT INTO bus_stations VALUES (241, 16.0621580000000002, 108.204356000000004, 'Name 241', 'Công viên 29/03, 90 Nguyễn Tri Phương', 'Title 241', 'BT241', '2017-04-30 09:16:26.942015', '2017-04-30 09:16:26.942015');
INSERT INTO bus_stations VALUES (242, 16.0655369999999991, 108.202742000000001, 'Name 242', 'Công viên 29/03, 06 Nguyễn Tri Phương', 'Title 242', 'BT242', '2017-04-30 09:16:26.953161', '2017-04-30 09:16:26.953161');
INSERT INTO bus_stations VALUES (243, 16.0660319999999999, 108.205546999999996, 'Name 243', 'Công viên 29/03, d/d điện máy Nguyễn Kim', 'Title 243', 'BT243', '2017-04-30 09:16:26.966379', '2017-04-30 09:16:26.966379');
INSERT INTO bus_stations VALUES (244, 16.0670609999999989, 108.207581000000005, 'Name 244', 'TT Răng Hàm mặt - Sở Y tế, 437 Lê Duẩn', 'Title 244', 'BT244', '2017-04-30 09:16:26.999577', '2017-04-30 09:16:26.999577');
INSERT INTO bus_stations VALUES (245, 16.0695380000000014, 108.210313999999997, 'Name 245', '301 Lê Duẩn', 'Title 245', 'BT245', '2017-04-30 09:16:27.00865', '2017-04-30 09:16:27.00865');
INSERT INTO bus_stations VALUES (246, 16.0704920000000016, 108.214872, 'Name 246', '155 Lê Duẩn', 'Title 246', 'BT246', '2017-04-30 09:16:27.019733', '2017-04-30 09:16:27.019733');
INSERT INTO bus_stations VALUES (247, 16.0711650000000006, 108.219216000000003, 'Name 247', 'Đại Học Đà Nẵng, 43 Lê Duẩn', 'Title 247', 'BT247', '2017-04-30 09:16:27.030734', '2017-04-30 09:16:27.030734');
INSERT INTO bus_stations VALUES (248, 16.0734320000000004, 108.220877999999999, 'Name 248', 'D/d 76 Nguyễn Chí Thanh', 'Title 248', 'BT248', '2017-04-30 09:16:27.042282', '2017-04-30 09:16:27.042282');
INSERT INTO bus_stations VALUES (249, 16.0796039999999998, 108.220031000000006, 'Name 249', '17 Nguyễn Chí Thanh', 'Title 249', 'BT249', '2017-04-30 09:16:27.053535', '2017-04-30 09:16:27.053535');
INSERT INTO bus_stations VALUES (250, 16.0801650000000009, 108.218387000000007, 'Name 250', '75 Đống Đa', 'Title 250', 'BT250', '2017-04-30 09:16:27.06413', '2017-04-30 09:16:27.06413');
INSERT INTO bus_stations VALUES (251, 16.0824280000000002, 108.221157000000005, 'Name 251', 'Bar Phương Đông, 09 Đống Đa', 'Title 251', 'BT251', '2017-04-30 09:16:27.076613', '2017-04-30 09:16:27.076613');
INSERT INTO bus_stations VALUES (252, 16.0842509999999983, 108.221406000000002, 'Name 252', '24 3 tháng 2', 'Title 252', 'BT252', '2017-04-30 09:16:27.086799', '2017-04-30 09:16:27.086799');
INSERT INTO bus_stations VALUES (253, 16.0871099999999991, 108.220128000000003, 'Name 253', 'D/d 131 Xuân Diệu', 'Title 253', 'BT253', '2017-04-30 09:16:27.097291', '2017-04-30 09:16:27.097291');
INSERT INTO bus_stations VALUES (254, 16.0887920000000015, 108.219683000000003, 'Name 254', 'D/d 33 Xuân Diệu', 'Title 254', 'BT254', '2017-04-30 09:16:27.108841', '2017-04-30 09:16:27.108841');
INSERT INTO bus_stations VALUES (255, 16.0899959999999993, 108.214860999999999, 'Name 255', 'Chân cầu Thuận Phước, Deawoo', 'Title 255', 'BT255', '2017-04-30 09:16:27.119432', '2017-04-30 09:16:27.119432');
INSERT INTO bus_stations VALUES (256, 16.0998799999999989, 108.230108999999999, 'Name 256', 'Chân cầu Thuận Phước', 'Title 256', 'BT256', '2017-04-30 09:16:27.130777', '2017-04-30 09:16:27.130777');
INSERT INTO bus_stations VALUES (257, 16.0969230000000003, 108.230881999999994, 'Name 257', 'Ngã Tư Lý Nhật Quang - Hoa Lư', 'Title 257', 'BT257', '2017-04-30 09:16:27.143169', '2017-04-30 09:16:27.143169');
INSERT INTO bus_stations VALUES (258, 16.0941529999999986, 108.231026999999997, 'Name 258', '281 Khúc Hạo', 'Title 258', 'BT258', '2017-04-30 09:16:27.152727', '2017-04-30 09:16:27.152727');
INSERT INTO bus_stations VALUES (259, 16.0910709999999995, 108.233260999999999, 'Name 259', 'Đường Trần Thánh Tông, khu nhà 12T1', 'Title 259', 'BT259', '2017-04-30 09:16:27.163831', '2017-04-30 09:16:27.163831');
INSERT INTO bus_stations VALUES (260, 16.0853830000000002, 108.236129000000005, 'Name 260', 'Đường Trần Thánh Tông, doanh trại bộ đội', 'Title 260', 'BT260', '2017-04-30 09:16:27.17547', '2017-04-30 09:16:27.17547');
INSERT INTO bus_stations VALUES (261, 16.0861860000000014, 108.240370999999996, 'Name 261', '333 Ngô Quyền', 'Title 261', 'BT261', '2017-04-30 09:16:27.186225', '2017-04-30 09:16:27.186225');
INSERT INTO bus_stations VALUES (262, 16.0894939999999984, 108.242277000000001, 'Name 262', '253 Ngô Quyền', 'Title 262', 'BT262', '2017-04-30 09:16:27.197102', '2017-04-30 09:16:27.197102');
INSERT INTO bus_stations VALUES (263, 16.0952470000000005, 108.244853000000006, 'Name 263', '111 Ngô Quyền', 'Title 263', 'BT263', '2017-04-30 09:16:27.216272', '2017-04-30 09:16:27.216272');
INSERT INTO bus_stations VALUES (264, 16.1005429999999983, 108.247215999999995, 'Name 264', 'Công ty Huy Đăng, 35 Ngô Quyền', 'Title 264', 'BT264', '2017-04-30 09:16:27.233494', '2017-04-30 09:16:27.233494');
INSERT INTO bus_stations VALUES (265, 16.1054689999999994, 108.246815999999995, 'Name 265', '07 Yết Kiêu', 'Title 265', 'BT265', '2017-04-30 09:16:27.242411', '2017-04-30 09:16:27.242411');
INSERT INTO bus_stations VALUES (266, 16.1070390000000003, 108.251558000000003, 'Name 266', 'Điểm dừng đường Lê Đức Thọ', 'Title 266', 'BT266', '2017-04-30 09:16:27.252274', '2017-04-30 09:16:27.252274');


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 183
-- Name: bus_stations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bus_stations_id_seq', 1, false);


--
-- TOC entry 2249 (class 0 OID 140876)
-- Dependencies: 181
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO schema_migrations VALUES ('20170313071315');
INSERT INTO schema_migrations VALUES ('20170313073624');
INSERT INTO schema_migrations VALUES ('20170322024250');
INSERT INTO schema_migrations VALUES ('20170408084421');
INSERT INTO schema_migrations VALUES ('20170411014826');
INSERT INTO schema_migrations VALUES ('20170418015610');
INSERT INTO schema_migrations VALUES ('20170419022547');
INSERT INTO schema_migrations VALUES ('20170419023149');
INSERT INTO schema_migrations VALUES ('20170424032636');


--
-- TOC entry 2268 (class 0 OID 141013)
-- Dependencies: 200
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- TOC entry 2098 (class 2606 OID 140891)
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 2109 (class 2606 OID 140938)
-- Name: bus_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_routes
    ADD CONSTRAINT bus_routes_pkey PRIMARY KEY (id);


--
-- TOC entry 2102 (class 2606 OID 140913)
-- Name: distances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY distances
    ADD CONSTRAINT distances_pkey PRIMARY KEY (id);


--
-- TOC entry 2107 (class 2606 OID 140927)
-- Name: graph_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY graph_nodes
    ADD CONSTRAINT graph_nodes_pkey PRIMARY KEY (id);


--
-- TOC entry 2124 (class 2606 OID 141010)
-- Name: links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- TOC entry 2117 (class 2606 OID 140970)
-- Name: list_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY list_nodes
    ADD CONSTRAINT list_nodes_pkey PRIMARY KEY (id);


--
-- TOC entry 2122 (class 2606 OID 140984)
-- Name: nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 140947)
-- Name: bus_station_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_station_routes
    ADD CONSTRAINT bus_station_routes_pkey PRIMARY KEY (id);


--
-- TOC entry 2100 (class 2606 OID 140902)
-- Name: bus_stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_stations
    ADD CONSTRAINT bus_stations_pkey PRIMARY KEY (id);


--
-- TOC entry 2096 (class 2606 OID 140883)
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2128 (class 2606 OID 141024)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2110 (class 1259 OID 140939)
-- Name: index_bus_routes_on_name_and_bus_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_bus_routes_on_name_and_bus_type ON bus_routes USING btree (name, bus_type);


--
-- TOC entry 2103 (class 1259 OID 140915)
-- Name: index_distances_on_destination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_distances_on_destination ON distances USING btree (destination);


--
-- TOC entry 2104 (class 1259 OID 140914)
-- Name: index_distances_on_origin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_distances_on_origin ON distances USING btree (origin);


--
-- TOC entry 2105 (class 1259 OID 140916)
-- Name: index_distances_on_origin_and_destination_and_bus_route_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_distances_on_origin_and_destination_and_bus_route_id ON distances USING btree (origin, destination, bus_route_id);


--
-- TOC entry 2115 (class 1259 OID 140976)
-- Name: index_list_nodes_on_bus_route_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_list_nodes_on_bus_route_id ON list_nodes USING btree (bus_route_id);


--
-- TOC entry 2118 (class 1259 OID 141000)
-- Name: index_nodes_on_bus_route_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_nodes_on_bus_route_id ON nodes USING btree (bus_route_id);


--
-- TOC entry 2119 (class 1259 OID 141002)
-- Name: index_nodes_on_list_node_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_nodes_on_list_node_id ON nodes USING btree (list_node_id);


--
-- TOC entry 2120 (class 1259 OID 141001)
-- Name: index_nodes_on_bus_station_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_nodes_on_bus_station_id ON nodes USING btree (bus_station_id);


--
-- TOC entry 2111 (class 1259 OID 140958)
-- Name: index_bus_station_routes_on_bus_route_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bus_station_routes_on_bus_route_id ON bus_station_routes USING btree (bus_route_id);


--
-- TOC entry 2112 (class 1259 OID 140959)
-- Name: index_bus_station_routes_on_bus_station_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_bus_station_routes_on_bus_station_id ON bus_station_routes USING btree (bus_station_id);


--
-- TOC entry 2125 (class 1259 OID 141025)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- TOC entry 2126 (class 1259 OID 141026)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- TOC entry 2129 (class 2606 OID 140948)
-- Name: fk_rails_10753dc633; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_station_routes
    ADD CONSTRAINT fk_rails_10753dc633 FOREIGN KEY (bus_route_id) REFERENCES bus_routes(id);


--
-- TOC entry 2132 (class 2606 OID 140985)
-- Name: fk_rails_19b412f1c2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT fk_rails_19b412f1c2 FOREIGN KEY (bus_route_id) REFERENCES bus_routes(id);


--
-- TOC entry 2134 (class 2606 OID 140995)
-- Name: fk_rails_6bdc114b2d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT fk_rails_6bdc114b2d FOREIGN KEY (list_node_id) REFERENCES list_nodes(id);


--
-- TOC entry 2131 (class 2606 OID 140971)
-- Name: fk_rails_70daa84fe8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY list_nodes
    ADD CONSTRAINT fk_rails_70daa84fe8 FOREIGN KEY (bus_route_id) REFERENCES bus_routes(id);


--
-- TOC entry 2133 (class 2606 OID 140990)
-- Name: fk_rails_9b8047a706; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT fk_rails_9b8047a706 FOREIGN KEY (bus_station_id) REFERENCES bus_stations(id);


--
-- TOC entry 2130 (class 2606 OID 140953)
-- Name: fk_rails_d02cd28575; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bus_station_routes
    ADD CONSTRAINT fk_rails_d02cd28575 FOREIGN KEY (bus_station_id) REFERENCES bus_stations(id);


--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-05-03 09:43:31 ICT

--
-- PostgreSQL database dump complete
--

