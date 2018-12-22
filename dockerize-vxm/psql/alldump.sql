--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE batch;
ALTER ROLE batch WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION;
CREATE ROLE marvin;
ALTER ROLE marvin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION;
-- CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;






--
-- Database creation
--

CREATE DATABASE marvin WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE marvin FROM PUBLIC;
REVOKE ALL ON DATABASE marvin FROM postgres;
GRANT ALL ON DATABASE marvin TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE marvin TO PUBLIC;
GRANT ALL ON DATABASE marvin TO marvin;
CREATE DATABASE mysticmanager WITH TEMPLATE = template0 OWNER = postgres;
CREATE DATABASE spring_batch WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE spring_batch FROM PUBLIC;
REVOKE ALL ON DATABASE spring_batch FROM postgres;
GRANT ALL ON DATABASE spring_batch TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE spring_batch TO PUBLIC;
GRANT ALL ON DATABASE spring_batch TO batch;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect marvin

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    username character varying(255),
    password character varying(255)
);


ALTER TABLE public.accounts OWNER TO marvin;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO marvin;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: cluster_properties; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.cluster_properties (
    id bigint NOT NULL,
    ntp_server_csv character varying(255),
    syslog_server_csv character varying(255),
    dns_server_csv character varying(255),
    proxy_server character varying(255),
    proxy_port_string character varying(255),
    proxy_username character varying(255),
    proxy_password character varying(255),
    logging_type_string character varying(255),
    loginsight_hostname character varying(255),
    loginsight_server character varying(255),
    nic_profile character varying(255),
    join_vc boolean,
    cluster_type character varying(255),
    customize_network_mode boolean DEFAULT false
);


ALTER TABLE public.cluster_properties OWNER TO marvin;

--
-- Name: cluster_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.cluster_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_properties_id_seq OWNER TO marvin;

--
-- Name: cluster_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.cluster_properties_id_seq OWNED BY public.cluster_properties.id;


--
-- Name: diskprofile; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.diskprofile (
    id bigint NOT NULL,
    block bigint NOT NULL,
    blocksize integer NOT NULL,
    ssd boolean NOT NULL,
    hardwareprofile_id bigint
);


ALTER TABLE public.diskprofile OWNER TO marvin;

--
-- Name: distributed_virtual_portgroup; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.distributed_virtual_portgroup (
    id bigint NOT NULL,
    dvportgroup_key character varying(255),
    vxrailtraffictype character varying(255),
    morefid character varying(255),
    dvswitchid bigint,
    name character varying(255),
    portgroup_type character varying(255),
    vlan_id integer
);


ALTER TABLE public.distributed_virtual_portgroup OWNER TO marvin;

--
-- Name: distributed_virtual_portgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.distributed_virtual_portgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distributed_virtual_portgroup_id_seq OWNER TO marvin;

--
-- Name: distributed_virtual_portgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.distributed_virtual_portgroup_id_seq OWNED BY public.distributed_virtual_portgroup.id;


--
-- Name: distributed_virtual_switch; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.distributed_virtual_switch (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    vxraillegacyname character varying(255) NOT NULL,
    morefid character varying(255) NOT NULL
);


ALTER TABLE public.distributed_virtual_switch OWNER TO marvin;

--
-- Name: distributed_virtual_switch_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.distributed_virtual_switch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distributed_virtual_switch_id_seq OWNER TO marvin;

--
-- Name: distributed_virtual_switch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.distributed_virtual_switch_id_seq OWNED BY public.distributed_virtual_switch.id;


--
-- Name: dvs_uplink_port; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.dvs_uplink_port (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.dvs_uplink_port OWNER TO marvin;

--
-- Name: dvs_uplink_port_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.dvs_uplink_port_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dvs_uplink_port_id_seq OWNER TO marvin;

--
-- Name: dvs_uplink_port_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.dvs_uplink_port_id_seq OWNED BY public.dvs_uplink_port.id;


--
-- Name: hardwareprofile; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.hardwareprofile (
    id bigint NOT NULL,
    cpucores integer NOT NULL,
    cpumhz bigint NOT NULL,
    memorysize bigint NOT NULL
);


ALTER TABLE public.hardwareprofile OWNER TO marvin;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO marvin;

--
-- Name: host_config; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.host_config (
    id bigint NOT NULL,
    applianceid character varying(255) NOT NULL,
    nodeposition integer NOT NULL,
    totalsupportednodes integer NOT NULL,
    management_account_id integer,
    rootpassword character varying(255),
    management_network_id integer,
    vsan_network_id integer,
    vmotion_network_id integer,
    witness_network_id integer
);


ALTER TABLE public.host_config OWNER TO marvin;

--
-- Name: host_config_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.host_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_config_id_seq OWNER TO marvin;

--
-- Name: host_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.host_config_id_seq OWNED BY public.host_config.id;


--
-- Name: host_network_config; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.host_network_config (
    id bigint NOT NULL,
    ip character varying(255),
    hostname character varying(255),
    netmask character varying(255),
    gateway character varying(255),
    vlan integer
);


ALTER TABLE public.host_network_config OWNER TO marvin;

--
-- Name: host_network_config_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.host_network_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_network_config_id_seq OWNER TO marvin;

--
-- Name: host_network_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.host_network_config_id_seq OWNED BY public.host_network_config.id;


--
-- Name: ipset; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.ipset (
    id bigint NOT NULL,
    hostname character varying(255),
    managementip character varying(255),
    vmotionip character varying(255),
    vsanip character varying(255),
    witnessip character varying(255)
);


ALTER TABLE public.ipset OWNER TO marvin;

--
-- Name: job_context_objects; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.job_context_objects (
    id bigint NOT NULL
);


ALTER TABLE public.job_context_objects OWNER TO marvin;

--
-- Name: job_context_objects_host_config; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.job_context_objects_host_config (
    job_context_objects_id bigint NOT NULL,
    host_config_id bigint NOT NULL
);


ALTER TABLE public.job_context_objects_host_config OWNER TO marvin;

--
-- Name: job_context_objects_hosts; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.job_context_objects_hosts (
    job_context_objects_id bigint NOT NULL,
    host_applianceid character varying(255),
    host_nodeposition integer,
    host_totalsupportednodes integer
);


ALTER TABLE public.job_context_objects_hosts OWNER TO marvin;

--
-- Name: nicprofile; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.nicprofile (
    id bigint NOT NULL,
    speedmb integer NOT NULL,
    hardwareprofile_id bigint,
    uplink_port_id bigint,
    device character varying(255),
    nic_key character varying(255)
);


ALTER TABLE public.nicprofile OWNER TO marvin;

--
-- Name: portgroup_uplink_port_active; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.portgroup_uplink_port_active (
    portgroup_id bigint NOT NULL,
    uplink_port_id bigint NOT NULL
);


ALTER TABLE public.portgroup_uplink_port_active OWNER TO marvin;

--
-- Name: portgroup_uplink_port_standby; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.portgroup_uplink_port_standby (
    portgroup_id bigint NOT NULL,
    uplink_port_id bigint NOT NULL
);


ALTER TABLE public.portgroup_uplink_port_standby OWNER TO marvin;

--
-- Name: schema_version; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.schema_version (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.schema_version OWNER TO marvin;

--
-- Name: switch_properties; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.switch_properties (
    id bigint NOT NULL,
    vip character varying(255),
    fabric_id bigint NOT NULL,
    device_type character varying(255),
    context_path character varying(255),
    http_service character varying(255),
    switch_username character varying(255),
    switch_password character varying(255),
    server_profile_id character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.switch_properties OWNER TO marvin;

--
-- Name: switch_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.switch_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.switch_properties_id_seq OWNER TO marvin;

--
-- Name: switch_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.switch_properties_id_seq OWNED BY public.switch_properties.id;


--
-- Name: virtual_machine; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.virtual_machine (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    system_vm_type character varying(255) NOT NULL,
    morefid character varying(255) NOT NULL,
    vm_name character varying(255)
);


ALTER TABLE public.virtual_machine OWNER TO marvin;

--
-- Name: virtual_machine_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.virtual_machine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtual_machine_id_seq OWNER TO marvin;

--
-- Name: virtual_machine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.virtual_machine_id_seq OWNED BY public.virtual_machine.id;


--
-- Name: vxrailhost; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.vxrailhost (
    applianceid character varying(255) NOT NULL,
    nodeposition integer NOT NULL,
    totalsupportednodes integer NOT NULL,
    assettag character varying(255),
    biosuuid character varying(255),
    clusteraffinity integer,
    configurationstate integer,
    discovereddate timestamp without time zone,
    evouuid character varying(255),
    fallbackip character varying(255),
    ip character varying(255),
    model character varying(255),
    morefid character varying(255),
    build character varying(255),
    version character varying(255),
    number integer NOT NULL,
    prerecordedip character varying(255),
    primaryip character varying(255),
    primarynode boolean NOT NULL,
    rsapublickey character varying(500),
    sslthumbprint character varying(255),
    vcuuid character varying(255),
    hardwareprofile_id bigint,
    ipset_id bigint NOT NULL,
    vsanrepairtimeoutvalue integer DEFAULT 0
);


ALTER TABLE public.vxrailhost OWNER TO marvin;

--
-- Name: witness_network; Type: TABLE; Schema: public; Owner: marvin; Tablespace: 
--

CREATE TABLE public.witness_network (
    id bigint NOT NULL,
    management_ip character varying(255),
    hostname character varying(255),
    witness_ip character varying(255),
    netmask character varying(255),
    gateway character varying(255)
);


ALTER TABLE public.witness_network OWNER TO marvin;

--
-- Name: witness_network_id_seq; Type: SEQUENCE; Schema: public; Owner: marvin
--

CREATE SEQUENCE public.witness_network_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.witness_network_id_seq OWNER TO marvin;

--
-- Name: witness_network_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marvin
--

ALTER SEQUENCE public.witness_network_id_seq OWNED BY public.witness_network.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.cluster_properties ALTER COLUMN id SET DEFAULT nextval('public.cluster_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.distributed_virtual_portgroup ALTER COLUMN id SET DEFAULT nextval('public.distributed_virtual_portgroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.distributed_virtual_switch ALTER COLUMN id SET DEFAULT nextval('public.distributed_virtual_switch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.dvs_uplink_port ALTER COLUMN id SET DEFAULT nextval('public.dvs_uplink_port_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.host_config ALTER COLUMN id SET DEFAULT nextval('public.host_config_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.host_network_config ALTER COLUMN id SET DEFAULT nextval('public.host_network_config_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.switch_properties ALTER COLUMN id SET DEFAULT nextval('public.switch_properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.virtual_machine ALTER COLUMN id SET DEFAULT nextval('public.virtual_machine_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.witness_network ALTER COLUMN id SET DEFAULT nextval('public.witness_network_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.accounts (id, username, password) FROM stdin;
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.accounts_id_seq', 1, false);


--
-- Data for Name: cluster_properties; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.cluster_properties (id, ntp_server_csv, syslog_server_csv, dns_server_csv, proxy_server, proxy_port_string, proxy_username, proxy_password, logging_type_string, loginsight_hostname, loginsight_server, nic_profile, join_vc, cluster_type, customize_network_mode) FROM stdin;
849			192.168.104.156					NONE			TWO_HIGH_SPEED	f	\N	f
\.


--
-- Name: cluster_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.cluster_properties_id_seq', 1, false);


--
-- Data for Name: diskprofile; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.diskprofile (id, block, blocksize, ssd, hardwareprofile_id) FROM stdin;
2	7814037168	512	f	1
3	7814037168	512	f	1
4	3750748848	512	t	1
5	3750748848	512	t	1
12	3750748848	512	t	11
13	7814037168	512	f	11
14	3750748848	512	t	11
15	7814037168	512	f	11
22	7814037168	512	f	21
23	3750748848	512	t	21
24	3750748848	512	t	21
25	7814037168	512	f	21
32	3750748848	512	t	31
33	7814037168	512	f	31
34	7814037168	512	f	31
35	3750748848	512	t	31
36	7814037168	512	f	31
43	7814037168	512	f	42
44	7814037168	512	f	42
45	3750748848	512	t	42
46	3750748848	512	t	42
53	3750748848	512	t	52
54	7814037168	512	f	52
55	3750748848	512	t	52
56	7814037168	512	f	52
63	7814037168	512	f	62
64	3750748848	512	t	62
65	3750748848	512	t	62
66	7814037168	512	f	62
73	3750748848	512	t	72
74	7814037168	512	f	72
75	7814037168	512	f	72
76	3750748848	512	t	72
77	7814037168	512	f	72
84	7814037168	512	f	83
85	7814037168	512	f	83
86	3750748848	512	t	83
87	3750748848	512	t	83
94	3750748848	512	t	93
95	7814037168	512	f	93
96	3750748848	512	t	93
97	7814037168	512	f	93
104	7814037168	512	f	103
105	3750748848	512	t	103
106	3750748848	512	t	103
107	7814037168	512	f	103
114	3750748848	512	t	113
115	7814037168	512	f	113
116	7814037168	512	f	113
117	3750748848	512	t	113
118	7814037168	512	f	113
125	7814037168	512	f	124
126	7814037168	512	f	124
127	3750748848	512	t	124
128	3750748848	512	t	124
135	3750748848	512	t	134
136	7814037168	512	f	134
137	3750748848	512	t	134
138	7814037168	512	f	134
145	7814037168	512	f	144
146	3750748848	512	t	144
147	3750748848	512	t	144
148	7814037168	512	f	144
155	3750748848	512	t	154
156	7814037168	512	f	154
157	7814037168	512	f	154
158	3750748848	512	t	154
159	7814037168	512	f	154
166	7814037168	512	f	165
167	7814037168	512	f	165
168	3750748848	512	t	165
169	3750748848	512	t	165
176	3750748848	512	t	175
177	7814037168	512	f	175
178	3750748848	512	t	175
179	7814037168	512	f	175
186	7814037168	512	f	185
187	3750748848	512	t	185
188	3750748848	512	t	185
189	7814037168	512	f	185
196	3750748848	512	t	195
197	7814037168	512	f	195
198	7814037168	512	f	195
199	3750748848	512	t	195
200	7814037168	512	f	195
207	7814037168	512	f	206
208	7814037168	512	f	206
209	3750748848	512	t	206
210	3750748848	512	t	206
217	3750748848	512	t	216
218	7814037168	512	f	216
219	3750748848	512	t	216
220	7814037168	512	f	216
227	7814037168	512	f	226
228	3750748848	512	t	226
229	3750748848	512	t	226
230	7814037168	512	f	226
237	3750748848	512	t	236
238	7814037168	512	f	236
239	7814037168	512	f	236
240	3750748848	512	t	236
241	7814037168	512	f	236
248	7814037168	512	f	247
249	7814037168	512	f	247
250	3750748848	512	t	247
251	3750748848	512	t	247
258	3750748848	512	t	257
259	7814037168	512	f	257
260	3750748848	512	t	257
261	7814037168	512	f	257
268	7814037168	512	f	267
269	3750748848	512	t	267
270	3750748848	512	t	267
271	7814037168	512	f	267
278	3750748848	512	t	277
279	7814037168	512	f	277
280	7814037168	512	f	277
281	3750748848	512	t	277
282	7814037168	512	f	277
289	7814037168	512	f	288
290	7814037168	512	f	288
291	3750748848	512	t	288
292	3750748848	512	t	288
299	3750748848	512	t	298
300	7814037168	512	f	298
301	3750748848	512	t	298
302	7814037168	512	f	298
309	7814037168	512	f	308
310	3750748848	512	t	308
311	3750748848	512	t	308
312	7814037168	512	f	308
319	3750748848	512	t	318
320	7814037168	512	f	318
321	7814037168	512	f	318
322	3750748848	512	t	318
323	7814037168	512	f	318
330	7814037168	512	f	329
331	7814037168	512	f	329
332	3750748848	512	t	329
333	3750748848	512	t	329
340	3750748848	512	t	339
341	7814037168	512	f	339
342	3750748848	512	t	339
343	7814037168	512	f	339
350	7814037168	512	f	349
351	3750748848	512	t	349
352	3750748848	512	t	349
353	7814037168	512	f	349
360	3750748848	512	t	359
361	7814037168	512	f	359
362	7814037168	512	f	359
363	3750748848	512	t	359
364	7814037168	512	f	359
371	7814037168	512	f	370
372	7814037168	512	f	370
373	3750748848	512	t	370
374	3750748848	512	t	370
381	3750748848	512	t	380
382	7814037168	512	f	380
383	3750748848	512	t	380
384	7814037168	512	f	380
391	7814037168	512	f	390
392	3750748848	512	t	390
393	3750748848	512	t	390
394	7814037168	512	f	390
401	3750748848	512	t	400
402	7814037168	512	f	400
403	7814037168	512	f	400
404	3750748848	512	t	400
405	7814037168	512	f	400
412	7814037168	512	f	411
413	7814037168	512	f	411
414	3750748848	512	t	411
415	3750748848	512	t	411
422	3750748848	512	t	421
423	7814037168	512	f	421
424	3750748848	512	t	421
425	7814037168	512	f	421
432	7814037168	512	f	431
433	3750748848	512	t	431
434	3750748848	512	t	431
435	7814037168	512	f	431
442	3750748848	512	t	441
443	7814037168	512	f	441
444	7814037168	512	f	441
445	3750748848	512	t	441
446	7814037168	512	f	441
453	7814037168	512	f	452
454	7814037168	512	f	452
455	3750748848	512	t	452
456	3750748848	512	t	452
463	3750748848	512	t	462
464	7814037168	512	f	462
465	3750748848	512	t	462
466	7814037168	512	f	462
473	7814037168	512	f	472
474	3750748848	512	t	472
475	3750748848	512	t	472
476	7814037168	512	f	472
483	3750748848	512	t	482
484	7814037168	512	f	482
485	7814037168	512	f	482
486	3750748848	512	t	482
487	7814037168	512	f	482
494	7814037168	512	f	493
495	7814037168	512	f	493
496	3750748848	512	t	493
497	3750748848	512	t	493
504	3750748848	512	t	503
505	7814037168	512	f	503
506	3750748848	512	t	503
507	7814037168	512	f	503
514	7814037168	512	f	513
515	3750748848	512	t	513
516	3750748848	512	t	513
517	7814037168	512	f	513
524	3750748848	512	t	523
525	7814037168	512	f	523
526	7814037168	512	f	523
527	3750748848	512	t	523
528	7814037168	512	f	523
535	7814037168	512	f	534
536	7814037168	512	f	534
537	3750748848	512	t	534
538	3750748848	512	t	534
545	3750748848	512	t	544
546	7814037168	512	f	544
547	3750748848	512	t	544
548	7814037168	512	f	544
555	7814037168	512	f	554
556	3750748848	512	t	554
557	3750748848	512	t	554
558	7814037168	512	f	554
565	3750748848	512	t	564
566	7814037168	512	f	564
567	7814037168	512	f	564
568	3750748848	512	t	564
569	7814037168	512	f	564
576	7814037168	512	f	575
577	7814037168	512	f	575
578	3750748848	512	t	575
579	3750748848	512	t	575
586	3750748848	512	t	585
587	7814037168	512	f	585
588	3750748848	512	t	585
589	7814037168	512	f	585
596	7814037168	512	f	595
597	3750748848	512	t	595
598	3750748848	512	t	595
599	7814037168	512	f	595
606	3750748848	512	t	605
607	7814037168	512	f	605
608	7814037168	512	f	605
609	3750748848	512	t	605
610	7814037168	512	f	605
617	7814037168	512	f	616
618	7814037168	512	f	616
619	3750748848	512	t	616
620	3750748848	512	t	616
627	3750748848	512	t	626
628	7814037168	512	f	626
629	3750748848	512	t	626
630	7814037168	512	f	626
637	7814037168	512	f	636
638	3750748848	512	t	636
639	3750748848	512	t	636
640	7814037168	512	f	636
647	3750748848	512	t	646
648	7814037168	512	f	646
649	7814037168	512	f	646
650	3750748848	512	t	646
651	7814037168	512	f	646
658	7814037168	512	f	657
659	7814037168	512	f	657
660	3750748848	512	t	657
661	3750748848	512	t	657
668	3750748848	512	t	667
669	7814037168	512	f	667
670	3750748848	512	t	667
671	7814037168	512	f	667
678	7814037168	512	f	677
679	3750748848	512	t	677
680	3750748848	512	t	677
681	7814037168	512	f	677
688	3750748848	512	t	687
689	7814037168	512	f	687
690	7814037168	512	f	687
691	3750748848	512	t	687
692	7814037168	512	f	687
699	7814037168	512	f	698
700	3750748848	512	t	698
701	3750748848	512	t	698
702	7814037168	512	f	698
708	7814037168	512	f	707
709	7814037168	512	f	707
710	3750748848	512	t	707
711	3750748848	512	t	707
717	3750748848	512	t	716
718	7814037168	512	f	716
719	3750748848	512	t	716
720	7814037168	512	f	716
726	3750748848	512	t	725
727	7814037168	512	f	725
728	3750748848	512	t	725
729	7814037168	512	f	725
735	7814037168	512	f	734
736	3750748848	512	t	734
737	3750748848	512	t	734
738	7814037168	512	f	734
744	7814037168	512	f	743
745	7814037168	512	f	743
746	3750748848	512	t	743
747	3750748848	512	t	743
753	7814037168	512	f	752
754	7814037168	512	f	752
755	3750748848	512	t	752
756	3750748848	512	t	752
763	3750748848	512	t	762
764	7814037168	512	f	762
765	3750748848	512	t	762
766	7814037168	512	f	762
773	7814037168	512	f	772
774	3750748848	512	t	772
775	3750748848	512	t	772
776	7814037168	512	f	772
794	7814037168	512	f	793
795	7814037168	512	f	793
796	3750748848	512	t	793
797	3750748848	512	t	793
803	3750748848	512	t	802
804	7814037168	512	f	802
805	3750748848	512	t	802
806	7814037168	512	f	802
812	7814037168	512	f	811
813	3750748848	512	t	811
814	3750748848	512	t	811
815	7814037168	512	f	811
851	3750748848	512	t	850
852	7814037168	512	f	850
853	7814037168	512	f	850
854	3750748848	512	t	850
855	7814037168	512	f	850
880	3750748848	512	t	879
881	7814037168	512	f	879
882	7814037168	512	f	879
883	3750748848	512	t	879
884	7814037168	512	f	879
896	3750748848	512	t	895
897	7814037168	512	f	895
898	7814037168	512	f	895
899	3750748848	512	t	895
900	7814037168	512	f	895
\.


--
-- Data for Name: distributed_virtual_portgroup; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.distributed_virtual_portgroup (id, dvportgroup_key, vxrailtraffictype, morefid, dvswitchid, name, portgroup_type, vlan_id) FROM stdin;
842	dvportgroup-24	MANAGEMENT	dvportgroup-24	848	Management Network-41452a2e-4417-401d-abb3-a69011a7230f	0	400
843	dvportgroup-25	MARVIN_MANAGEMENT	dvportgroup-25	848	VxRail Management-41452a2e-4417-401d-abb3-a69011a7230f	0	3939
844	dvportgroup-26	VMOTION	dvportgroup-26	848	vSphere vMotion-41452a2e-4417-401d-abb3-a69011a7230f	0	400
845	dvportgroup-27	VCSA	dvportgroup-27	848	vCenter Server Network-41452a2e-4417-401d-abb3-a69011a7230f	0	400
846	dvportgroup-28	VSAN	dvportgroup-28	848	Virtual SAN-41452a2e-4417-401d-abb3-a69011a7230f	0	400
847	dvportgroup-29	\N	dvportgroup-29	848	VM Network	0	400
\.


--
-- Name: distributed_virtual_portgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.distributed_virtual_portgroup_id_seq', 1, false);


--
-- Data for Name: distributed_virtual_switch; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.distributed_virtual_switch (id, uuid, vxraillegacyname, morefid) FROM stdin;
848	50 25 bd 28 7a 99 3f d2-91 63 3f e5 9a dc 03 ef	VMware HCIA Distributed Switch	dvs-22
\.


--
-- Name: distributed_virtual_switch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.distributed_virtual_switch_id_seq', 1, false);


--
-- Data for Name: dvs_uplink_port; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.dvs_uplink_port (id, name) FROM stdin;
840	uplink1
841	uplink2
\.


--
-- Name: dvs_uplink_port_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.dvs_uplink_port_id_seq', 1, false);


--
-- Data for Name: hardwareprofile; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.hardwareprofile (id, cpucores, cpumhz, memorysize) FROM stdin;
1	20	2600	524194
11	20	2600	524194
21	20	2600	524194
31	20	2600	524194
42	20	2600	524194
52	20	2600	524194
62	20	2600	524194
72	20	2600	524194
83	20	2600	524194
93	20	2600	524194
103	20	2600	524194
113	20	2600	524194
124	20	2600	524194
134	20	2600	524194
144	20	2600	524194
154	20	2600	524194
165	20	2600	524194
175	20	2600	524194
185	20	2600	524194
195	20	2600	524194
206	20	2600	524194
216	20	2600	524194
226	20	2600	524194
236	20	2600	524194
247	20	2600	524194
257	20	2600	524194
267	20	2600	524194
277	20	2600	524194
288	20	2600	524194
298	20	2600	524194
308	20	2600	524194
318	20	2600	524194
329	20	2600	524194
339	20	2600	524194
349	20	2600	524194
359	20	2600	524194
370	20	2600	524194
380	20	2600	524194
390	20	2600	524194
400	20	2600	524194
411	20	2600	524194
421	20	2600	524194
431	20	2600	524194
441	20	2600	524194
452	20	2600	524194
462	20	2600	524194
472	20	2600	524194
482	20	2600	524194
493	20	2600	524194
503	20	2600	524194
513	20	2600	524194
523	20	2600	524194
534	20	2600	524194
544	20	2600	524194
554	20	2600	524194
564	20	2600	524194
575	20	2600	524194
585	20	2600	524194
595	20	2600	524194
605	20	2600	524194
616	20	2600	524194
626	20	2600	524194
636	20	2600	524194
646	20	2600	524194
657	20	2600	524194
667	20	2600	524194
677	20	2600	524194
687	20	2600	524194
698	20	2600	524194
707	20	2600	524194
716	20	2600	524194
725	20	2600	524194
734	20	2600	524194
743	20	2600	524194
752	20	2600	524194
762	20	2600	524194
772	20	2600	524194
793	20	2600	524194
802	20	2600	524194
811	20	2600	524194
850	20	2600	524194
879	20	2600	524194
895	20	2600	524194
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.hibernate_sequence', 910, true);


--
-- Data for Name: host_config; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.host_config (id, applianceid, nodeposition, totalsupportednodes, management_account_id, rootpassword, management_network_id, vsan_network_id, vmotion_network_id, witness_network_id) FROM stdin;
\.


--
-- Name: host_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.host_config_id_seq', 1, false);


--
-- Data for Name: host_network_config; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.host_network_config (id, ip, hostname, netmask, gateway, vlan) FROM stdin;
\.


--
-- Name: host_network_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.host_network_config_id_seq', 1, false);


--
-- Data for Name: ipset; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.ipset (id, hostname, managementip, vmotionip, vsanip, witnessip) FROM stdin;
10	\N	\N	\N	\N	\N
20	\N	\N	\N	\N	\N
30	\N	\N	\N	\N	\N
41	\N	\N	\N	\N	\N
51	\N	\N	\N	\N	\N
61	\N	\N	\N	\N	\N
71	\N	\N	\N	\N	\N
82	\N	\N	\N	\N	\N
92	\N	\N	\N	\N	\N
102	\N	\N	\N	\N	\N
112	\N	\N	\N	\N	\N
123	\N	\N	\N	\N	\N
133	\N	\N	\N	\N	\N
143	\N	\N	\N	\N	\N
153	\N	\N	\N	\N	\N
164	\N	\N	\N	\N	\N
174	\N	\N	\N	\N	\N
184	\N	\N	\N	\N	\N
194	\N	\N	\N	\N	\N
205	\N	\N	\N	\N	\N
215	\N	\N	\N	\N	\N
225	\N	\N	\N	\N	\N
235	\N	\N	\N	\N	\N
246	\N	\N	\N	\N	\N
256	\N	\N	\N	\N	\N
266	\N	\N	\N	\N	\N
276	\N	\N	\N	\N	\N
287	\N	\N	\N	\N	\N
297	\N	\N	\N	\N	\N
307	\N	\N	\N	\N	\N
317	\N	\N	\N	\N	\N
328	\N	\N	\N	\N	\N
338	\N	\N	\N	\N	\N
348	\N	\N	\N	\N	\N
358	\N	\N	\N	\N	\N
369	\N	\N	\N	\N	\N
379	\N	\N	\N	\N	\N
389	\N	\N	\N	\N	\N
399	\N	\N	\N	\N	\N
410	\N	\N	\N	\N	\N
420	\N	\N	\N	\N	\N
430	\N	\N	\N	\N	\N
440	\N	\N	\N	\N	\N
451	\N	\N	\N	\N	\N
461	\N	\N	\N	\N	\N
471	\N	\N	\N	\N	\N
481	\N	\N	\N	\N	\N
492	\N	\N	\N	\N	\N
502	\N	\N	\N	\N	\N
512	\N	\N	\N	\N	\N
522	\N	\N	\N	\N	\N
533	\N	\N	\N	\N	\N
543	\N	\N	\N	\N	\N
553	\N	\N	\N	\N	\N
563	\N	\N	\N	\N	\N
574	\N	\N	\N	\N	\N
584	\N	\N	\N	\N	\N
594	\N	\N	\N	\N	\N
604	\N	\N	\N	\N	\N
615	\N	\N	\N	\N	\N
625	\N	\N	\N	\N	\N
635	\N	\N	\N	\N	\N
645	\N	\N	\N	\N	\N
656	\N	\N	\N	\N	\N
666	\N	\N	\N	\N	\N
676	\N	\N	\N	\N	\N
686	\N	\N	\N	\N	\N
697	\N	\N	\N	\N	\N
771	engdell4-02.localdomain.local	192.168.104.212	192.168.104.12	192.168.104.22	\N
781	engdell4-03.localdomain.local	192.168.104.213	192.168.104.13	192.168.104.23	\N
860	engdell4-04.localdomain.local	192.168.104.214	192.168.104.14	192.168.104.24	\N
761	engdell4-01.localdomain.local	192.168.104.211	192.168.104.11	192.168.104.21	\N
\.


--
-- Data for Name: job_context_objects; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.job_context_objects (id) FROM stdin;
\.


--
-- Data for Name: job_context_objects_host_config; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.job_context_objects_host_config (job_context_objects_id, host_config_id) FROM stdin;
\.


--
-- Data for Name: job_context_objects_hosts; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.job_context_objects_hosts (job_context_objects_id, host_applianceid, host_nodeposition, host_totalsupportednodes) FROM stdin;
\.


--
-- Data for Name: nicprofile; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.nicprofile (id, speedmb, hardwareprofile_id, uplink_port_id, device, nic_key) FROM stdin;
6	10000	1	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
7	10000	1	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
8	1000	1	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
9	1000	1	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
16	10000	11	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
17	10000	11	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
18	1000	11	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
19	1000	11	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
26	10000	21	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
27	10000	21	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
28	1000	21	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
29	1000	21	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
37	10000	31	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
38	10000	31	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
39	1000	31	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
40	1000	31	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
47	10000	42	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
48	10000	42	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
49	1000	42	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
50	1000	42	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
57	10000	52	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
58	10000	52	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
59	1000	52	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
60	1000	52	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
67	10000	62	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
68	10000	62	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
69	1000	62	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
70	1000	62	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
78	10000	72	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
79	10000	72	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
80	1000	72	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
81	1000	72	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
88	10000	83	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
89	10000	83	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
90	1000	83	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
91	1000	83	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
98	10000	93	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
99	10000	93	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
100	1000	93	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
101	1000	93	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
108	10000	103	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
109	10000	103	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
110	1000	103	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
111	1000	103	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
119	10000	113	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
120	10000	113	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
121	1000	113	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
122	1000	113	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
129	10000	124	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
130	10000	124	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
131	1000	124	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
132	1000	124	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
139	10000	134	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
140	10000	134	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
141	1000	134	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
142	1000	134	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
149	10000	144	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
150	10000	144	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
151	1000	144	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
152	1000	144	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
160	10000	154	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
161	10000	154	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
162	1000	154	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
163	1000	154	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
170	10000	165	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
171	10000	165	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
172	1000	165	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
173	1000	165	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
180	10000	175	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
181	10000	175	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
182	1000	175	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
183	1000	175	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
190	10000	185	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
191	10000	185	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
192	1000	185	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
193	1000	185	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
201	10000	195	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
202	10000	195	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
203	1000	195	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
204	1000	195	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
211	10000	206	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
212	10000	206	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
213	1000	206	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
214	1000	206	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
221	10000	216	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
222	10000	216	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
223	1000	216	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
224	1000	216	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
231	10000	226	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
232	10000	226	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
233	1000	226	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
234	1000	226	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
242	10000	236	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
243	10000	236	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
244	1000	236	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
245	1000	236	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
252	10000	247	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
253	10000	247	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
254	1000	247	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
255	1000	247	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
262	10000	257	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
263	10000	257	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
264	1000	257	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
265	1000	257	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
272	10000	267	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
273	10000	267	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
274	1000	267	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
275	1000	267	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
283	10000	277	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
284	10000	277	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
285	1000	277	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
286	1000	277	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
293	10000	288	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
294	10000	288	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
295	1000	288	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
296	1000	288	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
303	10000	298	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
304	10000	298	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
305	1000	298	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
306	1000	298	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
313	10000	308	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
314	10000	308	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
315	1000	308	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
316	1000	308	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
324	10000	318	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
325	10000	318	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
326	1000	318	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
327	1000	318	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
334	10000	329	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
335	10000	329	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
336	1000	329	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
337	1000	329	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
344	10000	339	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
345	10000	339	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
346	1000	339	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
347	1000	339	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
354	10000	349	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
355	10000	349	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
356	1000	349	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
357	1000	349	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
365	10000	359	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
366	10000	359	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
367	1000	359	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
368	1000	359	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
375	10000	370	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
376	10000	370	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
377	1000	370	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
378	1000	370	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
385	10000	380	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
386	10000	380	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
387	1000	380	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
388	1000	380	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
395	10000	390	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
396	10000	390	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
397	1000	390	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
398	1000	390	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
406	10000	400	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
407	10000	400	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
408	1000	400	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
409	1000	400	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
416	10000	411	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
417	10000	411	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
418	1000	411	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
419	1000	411	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
426	10000	421	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
427	10000	421	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
428	1000	421	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
429	1000	421	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
436	10000	431	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
437	10000	431	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
438	1000	431	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
439	1000	431	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
447	10000	441	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
448	10000	441	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
449	1000	441	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
450	1000	441	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
457	10000	452	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
458	10000	452	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
459	1000	452	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
460	1000	452	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
467	10000	462	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
468	10000	462	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
469	1000	462	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
470	1000	462	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
477	10000	472	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
478	10000	472	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
479	1000	472	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
480	1000	472	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
488	10000	482	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
489	10000	482	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
490	1000	482	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
491	1000	482	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
498	10000	493	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
499	10000	493	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
500	1000	493	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
501	1000	493	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
508	10000	503	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
509	10000	503	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
510	1000	503	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
511	1000	503	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
518	10000	513	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
519	10000	513	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
520	1000	513	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
521	1000	513	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
529	10000	523	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
530	10000	523	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
531	1000	523	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
532	1000	523	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
539	10000	534	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
540	10000	534	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
541	1000	534	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
542	1000	534	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
549	10000	544	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
550	10000	544	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
551	1000	544	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
552	1000	544	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
559	10000	554	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
560	10000	554	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
561	1000	554	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
562	1000	554	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
570	10000	564	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
571	10000	564	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
572	1000	564	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
573	1000	564	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
580	10000	575	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
581	10000	575	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
582	1000	575	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
583	1000	575	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
590	10000	585	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
591	10000	585	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
592	1000	585	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
593	1000	585	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
600	10000	595	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
601	10000	595	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
602	1000	595	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
603	1000	595	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
611	10000	605	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
612	10000	605	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
613	1000	605	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
614	1000	605	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
621	10000	616	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
622	10000	616	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
623	1000	616	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
624	1000	616	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
631	10000	626	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
632	10000	626	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
633	1000	626	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
634	1000	626	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
641	10000	636	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
642	10000	636	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
643	1000	636	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
644	1000	636	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
652	10000	646	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
653	10000	646	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
654	1000	646	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
655	1000	646	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
662	10000	657	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
663	10000	657	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
664	1000	657	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
665	1000	657	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
672	10000	667	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
673	10000	667	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
674	1000	667	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
675	1000	667	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
682	10000	677	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
683	10000	677	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
684	1000	677	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
685	1000	677	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
693	10000	687	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
694	10000	687	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
695	1000	687	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
696	1000	687	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
703	10000	698	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
704	10000	698	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
705	1000	698	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
706	1000	698	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
712	10000	707	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
713	10000	707	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
714	1000	707	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
715	1000	707	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
721	10000	716	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
722	10000	716	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
723	1000	716	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
724	1000	716	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
730	10000	725	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
731	10000	725	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
732	1000	725	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
733	1000	725	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
739	10000	734	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
740	10000	734	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
741	1000	734	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
742	1000	734	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
748	10000	743	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
749	10000	743	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
750	1000	743	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
751	1000	743	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
757	10000	752	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
758	10000	752	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
759	1000	752	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
760	1000	752	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
767	10000	762	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
768	10000	762	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
769	1000	762	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
770	1000	762	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
777	10000	772	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
778	10000	772	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
779	1000	772	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
780	1000	772	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
800	1000	793	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
801	1000	793	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
809	1000	802	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
810	1000	802	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
818	1000	811	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
819	1000	811	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
816	10000	811	840	vmnic0	key-vim.host.PhysicalNic-vmnic0
817	10000	811	841	vmnic1	key-vim.host.PhysicalNic-vmnic1
798	10000	793	840	vmnic0	key-vim.host.PhysicalNic-vmnic0
799	10000	793	841	vmnic1	key-vim.host.PhysicalNic-vmnic1
807	10000	802	840	vmnic0	key-vim.host.PhysicalNic-vmnic0
808	10000	802	841	vmnic1	key-vim.host.PhysicalNic-vmnic1
856	10000	850	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
857	10000	850	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
858	1000	850	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
859	1000	850	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
885	10000	879	\N	vmnic0	key-vim.host.PhysicalNic-vmnic0
886	10000	879	\N	vmnic1	key-vim.host.PhysicalNic-vmnic1
887	1000	879	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
888	1000	879	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
903	1000	895	\N	vmnic2	key-vim.host.PhysicalNic-vmnic2
904	1000	895	\N	vmnic3	key-vim.host.PhysicalNic-vmnic3
901	10000	895	840	vmnic0	key-vim.host.PhysicalNic-vmnic0
902	10000	895	841	vmnic1	key-vim.host.PhysicalNic-vmnic1
\.


--
-- Data for Name: portgroup_uplink_port_active; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.portgroup_uplink_port_active (portgroup_id, uplink_port_id) FROM stdin;
842	840
843	840
844	840
845	840
846	841
847	840
\.


--
-- Data for Name: portgroup_uplink_port_standby; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.portgroup_uplink_port_standby (portgroup_id, uplink_port_id) FROM stdin;
842	841
843	841
844	841
845	841
846	840
847	841
\.


--
-- Data for Name: schema_version; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.schema_version (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	initialize db	SQL	V1__initialize_db.sql	-1446881307	marvin	2018-12-06 12:19:02.225839	42	t
2	2	jobInstanceObjects	SQL	V2__jobInstanceObjects.sql	613492207	marvin	2018-12-06 12:19:02.316188	17	t
3	3	can cannot do	SQL	V3__can_cannot_do.sql	-618411712	marvin	2018-12-06 12:19:02.349479	31	t
4	4	hostConfigSpec	SQL	V4__hostConfigSpec.sql	229751578	marvin	2018-12-06 12:19:02.388907	65	t
5	5	vm model update	SQL	V5__vm_model_update.sql	2109833064	marvin	2018-12-06 12:19:02.465498	5	t
6	6	network model updates	SQL	V6__network_model_updates.sql	-70650775	marvin	2018-12-06 12:19:02.483207	20	t
7	7	cluster properties update	SQL	V7__cluster_properties_update.sql	-1548059648	marvin	2018-12-06 12:19:02.528448	6	t
8	8	vxrailhost properties update	SQL	V8__vxrailhost_properties_update.sql	-714850148	marvin	2018-12-06 12:19:02.54611	12	t
9	9	cluster properties update	SQL	V9__cluster_properties_update.sql	2086650532	marvin	2018-12-06 12:19:02.583391	7	t
10	10	witness network ipset host config update	SQL	V10__witness_network_ipset_host_config_update.sql	1333932189	marvin	2018-12-06 12:19:02.602227	11	t
11	11	switch properties spec	SQL	V11__switch_properties_spec.sql	-145816836	marvin	2018-12-06 12:19:02.625961	8	t
12	12	switch properties spec update	SQL	V12__switch_properties_spec_update.sql	1069540285	marvin	2018-12-06 12:19:02.642933	9	t
13	13	cluster properties update	SQL	V13__cluster_properties_update.sql	239420309	marvin	2018-12-06 12:19:02.662866	8	t
\.


--
-- Data for Name: switch_properties; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.switch_properties (id, vip, fabric_id, device_type, context_path, http_service, switch_username, switch_password, server_profile_id) FROM stdin;
\.


--
-- Name: switch_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.switch_properties_id_seq', 1, false);


--
-- Data for Name: virtual_machine; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.virtual_machine (id, uuid, system_vm_type, morefid, vm_name) FROM stdin;
836	564db96d-7467-49ab-1240-8da9959f75e3	VXRAIL_MANAGER	vm-15	VxRail Manager
837	564d77c7-530e-ea50-387e-15803f932754	PSC	vm-17	VMware vCenter Server Platform Services Controller
838	564d93bb-6161-7d84-9d1c-93bf5737e109	VCSA	vm-16	VMware vCenter Server Appliance
\.


--
-- Name: virtual_machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.virtual_machine_id_seq', 1, false);


--
-- Data for Name: vxrailhost; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.vxrailhost (applianceid, nodeposition, totalsupportednodes, assettag, biosuuid, clusteraffinity, configurationstate, discovereddate, evouuid, fallbackip, ip, model, morefid, build, version, number, prerecordedip, primaryip, primarynode, rsapublickey, sslthumbprint, vcuuid, hardwareprofile_id, ipset_id, vsanrepairtimeoutvalue) FROM stdin;
1914BC20000000	1	1	1914BC20000000-01-01	4c4c4544-0039-3110-8034-b1c04f424332	1	2	2018-12-06 14:01:17.522	564dfcce-8041-d9cf-c6b9-859f70b5855d	0.0.0.0	192.168.104.212	VxRail S470	host-18	\N	\N	1	\N	fe80::250:56ff:fe60:def1%eth1	f	AAAAB3NzaC1yc2EAAAADAQABAAABAQDlSTgS+KoJe61ZN2irIOQ1cTOrCfIQP2Mm5AzHftbfGl2nxzMr+qOfUM+HOsZXAYmqatdqVu+4mvGKE4s6AfCQNQMhkr8Ozo0+PA4HjZXC/WJ3NcnsmRrNU6Rp7RSu4EG9p/b3eW8oFDtweu4GQMS7P33gFl/ES/UmEQ7OPRf6eqCdfhXPRbWUv+uIpP1FnELYoRCr8zy+iRNOYo1h4eaO0qI4PtR0mqIh9hwsazwBZbhDoZDxKPExml08GsLV/lWI0kaGXT3COfFbYimwRJFRooM5BkrBubk4Yh/97hgvO2B9sBFgs5yXT8fbg01zOz11ztKp9TTCUUXwqvl7K8TL	E2:BC:30:BE:E7:9F:6F:DA:96:7A:58:EB:3A:42:EC:51:84:1A:A3:40	564dc52d-f602-e427-edba-646e4615ddc1	802	771	0
HLLFBD20000000	1	1	HLLFBD20000000-01-01	4c4c4544-004c-4c10-8046-c8c04f424432	1	2	2018-12-06 14:01:17.522	564d09ec-f7ef-60a5-90f8-0ca9987b8fa7	0.0.0.0	192.168.104.213	VxRail S470	host-20	\N	\N	2	\N	fe80::250:56ff:fe66:e0b5%eth1	f	AAAAB3NzaC1yc2EAAAADAQABAAABAQDKWbErdK3Ibu4wi+AqZvCpHkOAO4lQ5TYU/25cmsTnjBYaL8onVwJApYamVxsPboyljmJ2BvBcl5mpyXM76hw92FLLq7UTO+sHSUN8gzSm2dSeMfifQmpi3djBS4yeCyCcl1PxUE6BbvkPHPe2mPhdL8aa8HnMUtzf4bOq9m628+7SvrZbK/ZUE3SMaoHRMWefUtzV2kw9TpyBMra5VCiERvmP8qvYOjcHdVqrxP/QmHLf1jrGSJoBonUYj8TfjzLCjD87m0p15YspKeP0oZ6MW0Fx3FTx8mMQh0LzZQ5bNEHnW92JQ4aPzHB98emhO5WbxVjPWsrZFLumYTXrZOal	B2:13:7E:70:28:45:17:46:9A:73:E0:75:12:F1:80:02:47:5A:11:E8	564d31d3-ac72-c956-0230-a5dc4de549bc	811	781	0
18Z6BC20000000	1	1	18Z6BC20000000-01-01	4c4c4544-0038-5a10-8036-b1c04f424332	1	2	2018-12-06 16:10:04.533	564d759b-9d31-3ecb-1fbc-6b6a9c2d0f4a	0.0.0.0	192.168.104.214	VxRail S470	host-33	\N	\N	3	\N	fe80::250:56ff:fe66:3fd9%eth1	f	AAAAB3NzaC1yc2EAAAADAQABAAABAQC5AApFK5EV+c2B1teZ4CBvaf1zuQx01wSewwkqDpUEKl3lTZ74N9FlA/fC7lr042ylIG3bvqxBJDNJ8MiLErCfrvtR5qk8mScIhO4LDhlqe26xpKbFP7aXye2rrka3kMM6JgpglOjVRqrLtZxhsFuopirFAWB2PpvIDD3JTxlT/xMlbf/v4uRU7FCTiBCRIAwCFhGbVA76p9jJqIHaRpNW25Bnw0r6hzqGOIMMSVnFaFD8oTVGCEnC1vDJVqY+zTbS59Nk3zcFqowdkXC9qnSLS1pnfSwV+Qubinda47QO0fkA2H1BTP/X2u4QfDyxPzggzpy7lFHhS42/pFpgVyUp	49:7E:62:4C:AA:AA:2D:D9:92:E8:DB:D1:02:16:08:A6:36:A8:B1:9C	564d8223-7955-4983-243f-ef8806cd9b42	895	860	0
18Y4BC20000000	1	1	18Y4BC20000000-01-01	4c4c4544-0038-5910-8034-b1c04f424332	1	2	2018-12-06 14:01:17.522	564db96d-7467-49ab-1240-8da9959f75e3	0.0.0.0	192.168.104.211	VxRail S470	host-47	\N	\N	0	\N	fe80::250:56ff:fe6d:3385%eth1	t	AAAAB3NzaC1yc2EAAAADAQABAAABAQDEVGs04OaC6uFcsRKky4cMw15BdDCc6ajn2njSxpr+kb2vvXKq53jVOeztWEKPEMObIb75yj0ZPwCpRmKc2xR8PaMcXVTl+Vue4Ft6PIGSjWRBrVJ9wP2/NgGR63xXMWBLSfLVsvUxF4QkFMHZXE0+IBq2bDil1CBmvqdJi/yGivHePgyrhY+KyKo/UGWusloAhoocneDqmnojkDvc8jHUzU8CMcoe9lOd+hXOalzd1JS8gJkG5Dx8n2l9o3Mm5Fh6sJMdWfvfiRTs2LVgls2TaFoxyyL7YtLC9DrwuBZfd+Gbj7+AIlGBrdN8GcdisCw1lB+IS5sAR//+H834xV3j	C5:0C:EB:35:B9:F9:16:A1:20:EF:2A:A6:28:9D:7C:E2:5D:E3:36:C3	564d93bb-6161-7d84-9d1c-93bf5737e109	793	761	0
\.


--
-- Data for Name: witness_network; Type: TABLE DATA; Schema: public; Owner: marvin
--

COPY public.witness_network (id, management_ip, hostname, witness_ip, netmask, gateway) FROM stdin;
\.


--
-- Name: witness_network_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marvin
--

SELECT pg_catalog.setval('public.witness_network_id_seq', 1, false);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: cluster_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.cluster_properties
    ADD CONSTRAINT cluster_properties_pkey PRIMARY KEY (id);


--
-- Name: diskprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.diskprofile
    ADD CONSTRAINT diskprofile_pkey PRIMARY KEY (id);


--
-- Name: distributed_virtual_portgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.distributed_virtual_portgroup
    ADD CONSTRAINT distributed_virtual_portgroup_pkey PRIMARY KEY (id);


--
-- Name: distributed_virtual_switch_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.distributed_virtual_switch
    ADD CONSTRAINT distributed_virtual_switch_pkey PRIMARY KEY (id);


--
-- Name: dvs_uplink_port_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.dvs_uplink_port
    ADD CONSTRAINT dvs_uplink_port_pkey PRIMARY KEY (id);


--
-- Name: hardwareprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.hardwareprofile
    ADD CONSTRAINT hardwareprofile_pkey PRIMARY KEY (id);


--
-- Name: host_config_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.host_config
    ADD CONSTRAINT host_config_pkey PRIMARY KEY (id);


--
-- Name: host_network_config_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.host_network_config
    ADD CONSTRAINT host_network_config_pkey PRIMARY KEY (id);


--
-- Name: ipset_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.ipset
    ADD CONSTRAINT ipset_pkey PRIMARY KEY (id);


--
-- Name: job_context_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.job_context_objects
    ADD CONSTRAINT job_context_objects_pkey PRIMARY KEY (id);


--
-- Name: marvinidconstraint; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.vxrailhost
    ADD CONSTRAINT marvinidconstraint UNIQUE (applianceid, nodeposition, totalsupportednodes);


--
-- Name: morefidconstraint; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.vxrailhost
    ADD CONSTRAINT morefidconstraint UNIQUE (morefid);


--
-- Name: nicprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.nicprofile
    ADD CONSTRAINT nicprofile_pkey PRIMARY KEY (id);


--
-- Name: schema_version_pk; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.schema_version
    ADD CONSTRAINT schema_version_pk PRIMARY KEY (installed_rank);


--
-- Name: switch_properties_fabric_id_key; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.switch_properties
    ADD CONSTRAINT switch_properties_fabric_id_key UNIQUE (fabric_id);


--
-- Name: switch_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.switch_properties
    ADD CONSTRAINT switch_properties_pkey PRIMARY KEY (id);


--
-- Name: virtual_machine_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.virtual_machine
    ADD CONSTRAINT virtual_machine_pkey PRIMARY KEY (id);


--
-- Name: vxrailhost_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.vxrailhost
    ADD CONSTRAINT vxrailhost_pkey PRIMARY KEY (applianceid, nodeposition, totalsupportednodes);


--
-- Name: witness_network_pkey; Type: CONSTRAINT; Schema: public; Owner: marvin; Tablespace: 
--

ALTER TABLE ONLY public.witness_network
    ADD CONSTRAINT witness_network_pkey PRIMARY KEY (id);


--
-- Name: schema_version_s_idx; Type: INDEX; Schema: public; Owner: marvin; Tablespace: 
--

CREATE INDEX schema_version_s_idx ON public.schema_version USING btree (success);


--
-- Name: contexthostconfigconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.job_context_objects_host_config
    ADD CONSTRAINT contexthostconfigconstraint FOREIGN KEY (job_context_objects_id) REFERENCES public.job_context_objects(id);


--
-- Name: contexthostconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.job_context_objects_hosts
    ADD CONSTRAINT contexthostconstraint FOREIGN KEY (host_applianceid, host_nodeposition, host_totalsupportednodes) REFERENCES public.vxrailhost(applianceid, nodeposition, totalsupportednodes);


--
-- Name: contextidconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.job_context_objects_hosts
    ADD CONSTRAINT contextidconstraint FOREIGN KEY (job_context_objects_id) REFERENCES public.job_context_objects(id);


--
-- Name: hardwarediskprofileconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.diskprofile
    ADD CONSTRAINT hardwarediskprofileconstraint FOREIGN KEY (hardwareprofile_id) REFERENCES public.hardwareprofile(id);


--
-- Name: hardwarenicprofileconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.nicprofile
    ADD CONSTRAINT hardwarenicprofileconstraint FOREIGN KEY (hardwareprofile_id) REFERENCES public.hardwareprofile(id);


--
-- Name: hardwareprofilevxrailhostconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.vxrailhost
    ADD CONSTRAINT hardwareprofilevxrailhostconstraint FOREIGN KEY (hardwareprofile_id) REFERENCES public.hardwareprofile(id);


--
-- Name: hostconfigconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.job_context_objects_host_config
    ADD CONSTRAINT hostconfigconstraint FOREIGN KEY (host_config_id) REFERENCES public.host_config(id);


--
-- Name: hostconfigmanagementaccountconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.host_config
    ADD CONSTRAINT hostconfigmanagementaccountconstraint FOREIGN KEY (management_account_id) REFERENCES public.accounts(id);


--
-- Name: hostmanagementnetworkconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.host_config
    ADD CONSTRAINT hostmanagementnetworkconstraint FOREIGN KEY (management_network_id) REFERENCES public.host_network_config(id);


--
-- Name: hostvmotionnetworkconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.host_config
    ADD CONSTRAINT hostvmotionnetworkconstraint FOREIGN KEY (vmotion_network_id) REFERENCES public.host_network_config(id);


--
-- Name: hostvsannetworkconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.host_config
    ADD CONSTRAINT hostvsannetworkconstraint FOREIGN KEY (vsan_network_id) REFERENCES public.host_network_config(id);


--
-- Name: ipsetvxrailhostconstraint; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.vxrailhost
    ADD CONSTRAINT ipsetvxrailhostconstraint FOREIGN KEY (ipset_id) REFERENCES public.ipset(id);


--
-- Name: nicprofile_uplink_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.nicprofile
    ADD CONSTRAINT nicprofile_uplink_port_id_fkey FOREIGN KEY (uplink_port_id) REFERENCES public.dvs_uplink_port(id);


--
-- Name: portgroup_uplink_port_active_portgroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.portgroup_uplink_port_active
    ADD CONSTRAINT portgroup_uplink_port_active_portgroup_id_fkey FOREIGN KEY (portgroup_id) REFERENCES public.distributed_virtual_portgroup(id);


--
-- Name: portgroup_uplink_port_active_uplink_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.portgroup_uplink_port_active
    ADD CONSTRAINT portgroup_uplink_port_active_uplink_port_id_fkey FOREIGN KEY (uplink_port_id) REFERENCES public.dvs_uplink_port(id);


--
-- Name: portgroup_uplink_port_standby_portgroup_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.portgroup_uplink_port_standby
    ADD CONSTRAINT portgroup_uplink_port_standby_portgroup_id_fkey FOREIGN KEY (portgroup_id) REFERENCES public.distributed_virtual_portgroup(id);


--
-- Name: portgroup_uplink_port_standby_uplink_port_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: marvin
--

ALTER TABLE ONLY public.portgroup_uplink_port_standby
    ADD CONSTRAINT portgroup_uplink_port_standby_uplink_port_id_fkey FOREIGN KEY (uplink_port_id) REFERENCES public.dvs_uplink_port(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect mysticmanager

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appliance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.appliance (
    id character varying NOT NULL,
    psnt character varying NOT NULL,
    tla character varying,
    part_number character varying,
    model character varying,
    device_key character varying,
    health character varying,
    missing boolean,
    generation integer,
    cluster_id character varying NOT NULL
);


ALTER TABLE public.appliance OWNER TO postgres;

--
-- Name: board; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.board (
    node_sn character varying NOT NULL,
    sn character varying NOT NULL,
    part_number character varying,
    manufacturer character varying
);


ALTER TABLE public.board OWNER TO postgres;

--
-- Name: boot_device; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.boot_device (
    node_sn character varying NOT NULL,
    sn character varying NOT NULL,
    slot integer,
    device_model character varying,
    sata_type character varying,
    power_on_hours integer,
    power_cycle_count integer,
    max_erase_count integer,
    avr_erase_count integer,
    block_size character varying,
    capacity character varying,
    health character varying,
    status character varying DEFAULT 'NORMAL'::character varying NOT NULL,
    firmware_version character varying,
    file_system_path character varying,
    boot_device_type character varying DEFAULT 'BOSS'::character varying NOT NULL
);


ALTER TABLE public.boot_device OWNER TO postgres;

--
-- Name: chassis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.chassis (
    appliance_id character varying NOT NULL,
    sn character varying NOT NULL,
    part_number character varying,
    service_tag character varying,
    description character varying
);


ALTER TABLE public.chassis OWNER TO postgres;

--
-- Name: composite_upgrade; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.composite_upgrade (
    composite_upgrade_id integer NOT NULL,
    virtual_appliance_id integer NOT NULL,
    upgrde_bundle_profile character varying,
    upgrade_execution_parameters character varying,
    locale character varying,
    supressed_mode_before boolean,
    requestid character varying,
    upgradefilepath character varying
);


ALTER TABLE public.composite_upgrade OWNER TO postgres;

--
-- Name: configuration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.configuration (
    key character varying NOT NULL,
    category character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.configuration OWNER TO postgres;

--
-- Name: connect_home_message; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.connect_home_message (
    event_id integer NOT NULL,
    category character varying,
    message character varying,
    message_time timestamp with time zone
);


ALTER TABLE public.connect_home_message OWNER TO postgres;

--
-- Name: dimm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dimm (
    sn character varying NOT NULL,
    part_number character varying,
    manufacturer character varying,
    slot character varying,
    capacity character varying,
    bank character varying,
    speed character varying,
    datawidth character varying,
    node_sn character varying NOT NULL
);


ALTER TABLE public.dimm OWNER TO postgres;

--
-- Name: disk; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.disk (
    sn character varying NOT NULL,
    manufacturer character varying,
    model character varying,
    disk_type character varying,
    protocol character varying,
    max_capable_speed character varying,
    enclosure integer,
    slot integer,
    guid character varying,
    disk_state character varying,
    disk_led character varying,
    missing boolean,
    capacity character varying,
    node_sn character varying NOT NULL,
    write_endurance character varying,
    write_endurance_status character varying,
    firmware_revision character varying
);


ALTER TABLE public.disk OWNER TO postgres;

--
-- Name: esrs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.esrs (
    cluster_id character varying NOT NULL,
    site_id integer,
    powerlink_creds character varying,
    enable_failover_ftps boolean,
    enable_failover_email boolean,
    is_integrated boolean,
    status character varying
);


ALTER TABLE public.esrs OWNER TO postgres;

--
-- Name: esrs_contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.esrs_contact (
    id integer NOT NULL,
    secondary boolean,
    first_name character varying,
    last_name character varying,
    company character varying,
    email character varying,
    phone character varying,
    cluster_id character varying NOT NULL
);


ALTER TABLE public.esrs_contact OWNER TO postgres;

--
-- Name: esrs_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.esrs_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.esrs_contact_id_seq OWNER TO postgres;

--
-- Name: esrs_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.esrs_contact_id_seq OWNED BY public.esrs_contact.id;


--
-- Name: esrs_email; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.esrs_email (
    cluster_id character varying NOT NULL,
    server character varying,
    port integer,
    sender character varying,
    receivers character varying,
    notification_on_success boolean
);


ALTER TABLE public.esrs_email OWNER TO postgres;

--
-- Name: esrs_proxy; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.esrs_proxy (
    cluster_id character varying NOT NULL,
    server character varying,
    port integer,
    sender character varying,
    receivers character varying
);


ALTER TABLE public.esrs_proxy OWNER TO postgres;

--
-- Name: esx; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.esx (
    uuid character varying NOT NULL,
    software_profile character varying,
    node_sn character varying,
    cluster_id character varying NOT NULL
);


ALTER TABLE public.esx OWNER TO postgres;

--
-- Name: event_code; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.event_code (
    code character varying NOT NULL,
    severity character varying,
    message character varying,
    component character varying,
    connect_home boolean,
    kb_info character varying
);


ALTER TABLE public.event_code OWNER TO postgres;

--
-- Name: mystic_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.mystic_event (
    id integer NOT NULL,
    event_time timestamp with time zone,
    appliance_id character varying,
    node_psnt character varying,
    component_id character varying,
    esx_host character varying,
    params character varying,
    unread boolean,
    reported boolean,
    posted boolean,
    state character varying DEFAULT 'UNPROCESSED'::character varying,
    code character varying NOT NULL,
    sub_component character varying
);


ALTER TABLE public.mystic_event OWNER TO postgres;

--
-- Name: event_view; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.event_view AS
 SELECT mystic_event.code,
    mystic_event.id,
    mystic_event.event_time,
    mystic_event.appliance_id,
    mystic_event.node_psnt,
    mystic_event.component_id,
    mystic_event.esx_host,
    mystic_event.params,
    mystic_event.unread,
    mystic_event.reported,
    mystic_event.posted,
    mystic_event.state,
    mystic_event.sub_component,
    event_code.severity,
    event_code.message,
    event_code.component,
    event_code.connect_home,
    event_code.kb_info
   FROM (public.mystic_event
     JOIN public.event_code USING (code));


ALTER TABLE public.event_view OWNER TO postgres;

--
-- Name: evo_rail; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.evo_rail (
    cluster_id character varying NOT NULL
);


ALTER TABLE public.evo_rail OWNER TO postgres;

--
-- Name: instance_property; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.instance_property (
    id integer NOT NULL,
    prop_key character varying NOT NULL,
    prop_value character varying,
    user_configurable boolean,
    instance_id integer NOT NULL
);


ALTER TABLE public.instance_property OWNER TO postgres;

--
-- Name: instance_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instance_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instance_property_id_seq OWNER TO postgres;

--
-- Name: instance_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instance_property_id_seq OWNED BY public.instance_property.id;


--
-- Name: log_bundle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.log_bundle (
    id character varying NOT NULL,
    file_size bigint,
    types character varying,
    nodes character varying,
    file_absolute_path character varying,
    creation_time bigint,
    details character varying
);


ALTER TABLE public.log_bundle OWNER TO postgres;

--
-- Name: log_insight; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.log_insight (
    cluster_id character varying NOT NULL
);


ALTER TABLE public.log_insight OWNER TO postgres;

--
-- Name: management_account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.management_account (
    id integer NOT NULL,
    component character varying NOT NULL,
    component_id character varying,
    host character varying,
    username character varying,
    password character varying,
    status character varying
);


ALTER TABLE public.management_account OWNER TO postgres;

--
-- Name: management_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.management_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.management_account_id_seq OWNER TO postgres;

--
-- Name: management_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.management_account_id_seq OWNED BY public.management_account.id;


--
-- Name: market_appliance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.market_appliance (
    component character varying NOT NULL,
    title character varying,
    description character varying,
    learn_more character varying,
    icon character varying,
    category character varying,
    app_type character varying,
    total_size bigint,
    primary_link character varying,
    secondary_link character varying,
    current_version character varying,
    publish_date timestamp with time zone,
    instance_count integer,
    primary_checksum character varying,
    secondary_checksum character varying
);


ALTER TABLE public.market_appliance OWNER TO postgres;

--
-- Name: market_instance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.market_instance (
    id integer NOT NULL,
    vm_id character varying,
    vm_name character varying,
    current_version character varying,
    install_time timestamp with time zone,
    status character varying,
    ip character varying,
    vm_console character varying,
    vm_network character varying,
    component character varying NOT NULL
);


ALTER TABLE public.market_instance OWNER TO postgres;

--
-- Name: market_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.market_instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_instance_id_seq OWNER TO postgres;

--
-- Name: market_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.market_instance_id_seq OWNED BY public.market_instance.id;


--
-- Name: market_queue; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.market_queue (
    id integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE public.market_queue OWNER TO postgres;

--
-- Name: market_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.market_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.market_queue_id_seq OWNER TO postgres;

--
-- Name: market_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.market_queue_id_seq OWNED BY public.market_queue.id;


--
-- Name: mystic_cluster; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.mystic_cluster (
    cluster_id character varying NOT NULL,
    product_type character varying NOT NULL,
    device_type character varying NOT NULL,
    connected boolean,
    health_state character varying,
    operational_status character varying
);


ALTER TABLE public.mystic_cluster OWNER TO postgres;

--
-- Name: mystic_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mystic_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mystic_event_id_seq OWNER TO postgres;

--
-- Name: mystic_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mystic_event_id_seq OWNED BY public.mystic_event.id;


--
-- Name: mystic_manager; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.mystic_manager (
    cluster_id character varying NOT NULL
);


ALTER TABLE public.mystic_manager OWNER TO postgres;

--
-- Name: mystic_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.mystic_task (
    id integer NOT NULL,
    name character varying,
    target character varying,
    success boolean,
    begin_time timestamp with time zone,
    end_time timestamp with time zone,
    message character varying
);


ALTER TABLE public.mystic_task OWNER TO postgres;

--
-- Name: mystic_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mystic_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mystic_task_id_seq OWNER TO postgres;

--
-- Name: mystic_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mystic_task_id_seq OWNED BY public.mystic_task.id;


--
-- Name: nic; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.nic (
    mac character varying NOT NULL,
    link_status character varying,
    link_speed character varying,
    slot integer,
    node_sn character varying NOT NULL,
    firmware_family_version character varying
);


ALTER TABLE public.nic OWNER TO postgres;

--
-- Name: node; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.node (
    sn character varying NOT NULL,
    slot integer,
    part_number character varying,
    asset_tag character varying,
    name character varying,
    psnt character varying,
    manufacturer character varying,
    node_version character varying,
    bios_fw_revision character varying,
    bmc_fw_revision character varying,
    me_fw_revision character varying,
    diskctrl_fw_version character varying,
    expander_bp_fw_version character varying,
    non_expander_bp_fw_version character varying,
    boss_fw_version character varying,
    cpld_fw_version character varying,
    system_status_led character varying,
    health character varying,
    missing boolean,
    appliance_id character varying NOT NULL,
    tpm boolean,
    operational_status character varying
);


ALTER TABLE public.node OWNER TO postgres;

--
-- Name: node_level_version; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.node_level_version (
    id integer NOT NULL,
    node_sn character varying NOT NULL,
    component character varying NOT NULL,
    current_version character varying NOT NULL,
    baseline character varying,
    is_drifted boolean DEFAULT false,
    is_supported boolean DEFAULT true,
    incompatibilities character varying
);


ALTER TABLE public.node_level_version OWNER TO postgres;

--
-- Name: node_level_version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.node_level_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_level_version_id_seq OWNER TO postgres;

--
-- Name: node_level_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.node_level_version_id_seq OWNED BY public.node_level_version.id;


--
-- Name: operation_lock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.operation_lock (
    operation_type character varying NOT NULL,
    start_time timestamp with time zone
);


ALTER TABLE public.operation_lock OWNER TO postgres;

--
-- Name: operation_status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.operation_status (
    id character varying NOT NULL,
    owner character varying,
    state character varying,
    error character varying,
    progress integer,
    starttime bigint,
    endtime bigint,
    target character varying,
    step character varying,
    detail character varying,
    extension character varying
);


ALTER TABLE public.operation_status OWNER TO postgres;

--
-- Name: power_supply; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.power_supply (
    sn character varying NOT NULL,
    part_number character varying,
    revision_number character varying,
    name character varying,
    manufacturer character varying,
    slot integer,
    health character varying,
    missing boolean,
    appliance_id character varying NOT NULL
);


ALTER TABLE public.power_supply OWNER TO postgres;

--
-- Name: sata_dom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.sata_dom (
    node_sn character varying NOT NULL,
    sn character varying NOT NULL,
    device_model character varying,
    sata_type character varying,
    power_on_hours integer,
    power_cycle_count integer,
    max_erase_count integer,
    avr_erase_count integer,
    block_size character varying,
    capacity character varying,
    health character varying,
    firmware_version character varying
);


ALTER TABLE public.sata_dom OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.settings (
    id character varying NOT NULL,
    vcenter_ip character varying,
    psc_ip character varying,
    management_user character varying,
    management_password character varying,
    cluster_name character varying,
    init_status character varying,
    dhcp boolean,
    ip character varying,
    netmask character varying,
    gateway character varying,
    dns character varying,
    db_version integer,
    support_user character varying,
    support_password character varying,
    cluster_mor character varying,
    sso_tenant character varying,
    platform character varying DEFAULT 'VXRAIL'::character varying
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: syr_configuration; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.syr_configuration (
    event_id integer NOT NULL,
    filename character varying,
    content character varying
);


ALTER TABLE public.syr_configuration OWNER TO postgres;

--
-- Name: vcenter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.vcenter (
    cluster_id character varying NOT NULL,
    uuid character varying
);


ALTER TABLE public.vcenter OWNER TO postgres;

--
-- Name: virtual_appliance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.virtual_appliance (
    id integer NOT NULL,
    component character varying NOT NULL,
    component_id character varying,
    ip character varying,
    license character varying,
    current_version character varying,
    description character varying,
    install_time timestamp with time zone,
    upgrade_version character varying,
    upgrade_status character varying,
    upgrade_description character varying,
    upgrade_filepath character varying,
    upgrade_filepath_bkp character varying,
    upgrade_icon character varying,
    upgrade_publish_date timestamp with time zone,
    upgrade_type character varying,
    upgrade_title character varying,
    upgrade_additional_info character varying,
    cluster_id character varying NOT NULL,
    upgrade_status_response character varying,
    checksum character varying,
    baseline character varying,
    is_same_version boolean DEFAULT true,
    is_supported boolean DEFAULT true,
    is_drifted boolean DEFAULT false,
    incompatibilities character varying
);


ALTER TABLE public.virtual_appliance OWNER TO postgres;

--
-- Name: virtual_appliance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.virtual_appliance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtual_appliance_id_seq OWNER TO postgres;

--
-- Name: virtual_appliance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.virtual_appliance_id_seq OWNED BY public.virtual_appliance.id;


--
-- Name: virtual_infrastructure; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.virtual_infrastructure (
    id integer NOT NULL,
    component character varying NOT NULL,
    component_id character varying,
    ip character varying,
    license character varying,
    current_version character varying,
    upgrade_version character varying,
    upgrade_filepath character varying,
    cluster_id character varying NOT NULL
);


ALTER TABLE public.virtual_infrastructure OWNER TO postgres;

--
-- Name: virtual_infrastructure_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.virtual_infrastructure_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtual_infrastructure_id_seq OWNER TO postgres;

--
-- Name: virtual_infrastructure_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.virtual_infrastructure_id_seq OWNED BY public.virtual_infrastructure.id;


--
-- Name: vsan; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.vsan (
    uuid character varying NOT NULL,
    enabled boolean,
    policy character varying
);


ALTER TABLE public.vsan OWNER TO postgres;

--
-- Name: vsan_disk; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.vsan_disk (
    uuid character varying NOT NULL,
    device character varying,
    display_name character varying,
    is_ssd boolean NOT NULL,
    is_offline boolean,
    status character varying,
    disk_sn character varying,
    group_uuid character varying NOT NULL
);


ALTER TABLE public.vsan_disk OWNER TO postgres;

--
-- Name: vsan_disk_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.vsan_disk_group (
    uuid character varying NOT NULL,
    name character varying,
    group_state character varying,
    health character varying,
    esx_uuid character varying NOT NULL,
    vsan_uuid character varying NOT NULL
);


ALTER TABLE public.vsan_disk_group OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.esrs_contact ALTER COLUMN id SET DEFAULT nextval('public.esrs_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance_property ALTER COLUMN id SET DEFAULT nextval('public.instance_property_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.management_account ALTER COLUMN id SET DEFAULT nextval('public.management_account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_instance ALTER COLUMN id SET DEFAULT nextval('public.market_instance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_queue ALTER COLUMN id SET DEFAULT nextval('public.market_queue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mystic_event ALTER COLUMN id SET DEFAULT nextval('public.mystic_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mystic_task ALTER COLUMN id SET DEFAULT nextval('public.mystic_task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.node_level_version ALTER COLUMN id SET DEFAULT nextval('public.node_level_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virtual_appliance ALTER COLUMN id SET DEFAULT nextval('public.virtual_appliance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virtual_infrastructure ALTER COLUMN id SET DEFAULT nextval('public.virtual_infrastructure_id_seq'::regclass);


--
-- Data for Name: appliance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appliance (id, psnt, tla, part_number, model, device_key, health, missing, generation, cluster_id) FROM stdin;
18Y4BC20000000	18Y4BC20000000	\N	\N	VxRail S470	\N	Critical	f	3	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
HLLFBD20000000	HLLFBD20000000	\N	\N	VxRail S470	\N	Critical	f	3	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
1914BC20000000	1914BC20000000	\N	\N	VxRail S470	\N	Critical	f	3	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
18Z6BC20000000	18Z6BC20000000	\N	\N	VxRail S470	\N	Critical	f	3	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
\.


--
-- Data for Name: board; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.board (node_sn, sn, part_number, manufacturer) FROM stdin;
\.


--
-- Data for Name: boot_device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boot_device (node_sn, sn, slot, device_model, sata_type, power_on_hours, power_cycle_count, max_erase_count, avr_erase_count, block_size, capacity, health, status, firmware_version, file_system_path, boot_device_type) FROM stdin;
18Z6BC2	TW06GMMX482936230250	\N	SATADOM-SL 3ME	SSD	21786	6746	1480	1353	\N	59.63GB	97%	NORMAL	S140714	t10.ATA_____SATADOM2DSL_3ME__________________________TW06GMMX482936230250	SATA DOM
1914BC2	TW06GMMX482936230247	\N	SATADOM-SL 3ME	SSD	22466	1741	1286	1134	\N	59.63GB	98%	NORMAL	S140714	t10.ATA_____SATADOM2DSL_3ME__________________________TW06GMMX482936230247	SATA DOM
HLLFBD2	20160513AA1148100423	\N	SATADOM-ML 3SE	SSD	12423	575	710	619	\N	59.63GB	98%	NORMAL	S130710K	t10.ATA_____SATADOM2DML_3SE__________________________20160513AA1148100423	SATA DOM
18Y4BC2	20160408AA8511149010	\N	SATADOM-ML 3SE	SSD	19456	263	1271	1156	\N	59.63GB	98%	NORMAL	S130710K	t10.ATA_____SATADOM2DML_3SE00_________________________20160408AA8511149010	SATA DOM
\.


--
-- Data for Name: chassis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chassis (appliance_id, sn, part_number, service_tag, description) FROM stdin;
18Y4BC20000000	18Y4BC2	VxRail S470	18Y4BC2	Main System Chassis
HLLFBD20000000	HLLFBD2	VxRail S470	HLLFBD2	Main System Chassis
1914BC20000000	1914BC2	VxRail S470	1914BC2	Main System Chassis
18Z6BC20000000	18Z6BC2	VxRail S470	18Z6BC2	Main System Chassis
\.


--
-- Data for Name: composite_upgrade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_upgrade (composite_upgrade_id, virtual_appliance_id, upgrde_bundle_profile, upgrade_execution_parameters, locale, supressed_mode_before, requestid, upgradefilepath) FROM stdin;
\.


--
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuration (key, category, value) FROM stdin;
hclHealthCheckConfigured	hclHealthCheck	true
cluster	SuppressionService	false
esrs	SuppressionService	false
5240b1df-a89c-146f-f63c-8c1fcb58cd7f	queryCluster	2018-12-22 09:51:19
\.


--
-- Data for Name: connect_home_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connect_home_message (event_id, category, message, message_time) FROM stdin;
9	Configuration	\N	2018-12-06 14:45:06.906+00
12	Configuration	\N	2018-12-06 16:49:35.696+00
57	Configuration	\N	2018-12-10 13:44:05.076+00
62	Configuration	\N	2018-12-10 16:35:10.964+00
87	Configuration	\N	2018-12-12 17:32:39.376+00
92	Configuration	\N	2018-12-12 19:21:14.858+00
94	Configuration	\N	2018-12-12 20:35:41.096+00
100	Configuration	\N	2018-12-13 10:28:04.556+00
101	Configuration	\N	2018-12-13 13:37:14.096+00
103	Configuration	\N	2018-12-13 15:25:53.155+00
\.


--
-- Data for Name: dimm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dimm (sn, part_number, manufacturer, slot, capacity, bank, speed, datawidth, node_sn) FROM stdin;
\.


--
-- Data for Name: disk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disk (sn, manufacturer, model, disk_type, protocol, max_capable_speed, enclosure, slot, guid, disk_state, disk_led, missing, capacity, node_sn, write_endurance, write_endurance_status, firmware_revision) FROM stdin;
26E0A01FTG3D	TOSHIBA	PX04SRB192	SSD	SCSI	12 Gb/s	0	12	50000396dc8999c9	OK	Green:On	f	1.75TB	18Y4BC2	0	Healthy	AM04
Z4C01RL4	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	6	5000c50084c96b7f	OK	Green:On	f	3.64TB	18Y4BC2	\N	\N	MS05
Z4C03KAS	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	0	5000c500852f05a3	OK	Green:On	f	3.64TB	18Y4BC2	\N	\N	MS05
26G0A073TG3D	TOSHIBA	PX04SRB192	SSD	SCSI	12 Gb/s	0	13	50000396dc89bf79	OK	Green:On	f	1.75TB	18Y4BC2	0	Healthy	AM04
Z4C03LDR	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	6	5000c500852ea337	OK	Green:On	f	3.64TB	HLLFBD2	\N	\N	MS05
Z4C01QQA	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	0	5000c50084c9b137	OK	Green:On	f	3.64TB	HLLFBD2	\N	\N	MS05
26G0A04JTG3D	TOSHIBA	PX04SRB192	SSD	SCSI	12 Gb/s	0	13	50000396dc89be1d	OK	Green:On	f	1.75TB	HLLFBD2	0	Healthy	AM04
3750A0ZBTEYE	TOSHIBA	PX05SVB192Y	SSD	SCSI	12 Gb/s	0	12	50000397ac88d891	OK	Green:On	f	1.75TB	HLLFBD2	0	Healthy	AS03
Z4C01PDD	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	6	5000c50084ca175b	OK	Green:On	f	3.64TB	1914BC2	\N	\N	MS05
Z4C01PSL	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	0	5000c50084c9f6fb	OK	Green:On	f	3.64TB	1914BC2	\N	\N	MS05
26E0A00UTG3D	TOSHIBA	PX04SRB192	SSD	SCSI	12 Gb/s	0	13	50000396dc899911	OK	Green:On	f	1.75TB	1914BC2	0	Healthy	AM04
26G0A07BTG3D	TOSHIBA	PX04SRB192	SSD	SCSI	12 Gb/s	0	12	50000396dc89bf99	OK	Green:On	f	1.75TB	1914BC2	0	Healthy	AM04
Z4C01DBD	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	0	5000c50084c8fb77	OK	Green:On	f	3.64TB	18Z6BC2	\N	\N	MS05
Z4C01QKN	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	6	5000c50084c9b943	OK	Green:On	f	3.64TB	18Z6BC2	\N	\N	MS05
Z4C03LHB	SEAGATE	ST4000NM0005	HDD	SCSI	12 Gb/s	0	1	5000c500852ea017	OK	Green:On	f	3.64TB	18Z6BC2	\N	\N	MS05
26G0A07ZTG3D	TOSHIBA	PX04SRB192	SSD	SCSI	12 Gb/s	0	12	50000396dc89bffd	OK	Green:On	f	1.75TB	18Z6BC2	0	Healthy	AM04
26E0A01QTG3D	TOSHIBA	PX04SRB192	SSD	SCSI	12 Gb/s	0	13	50000396dc8999ed	OK	Green:On	f	1.75TB	18Z6BC2	0	Healthy	AM04
\.


--
-- Data for Name: esrs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.esrs (cluster_id, site_id, powerlink_creds, enable_failover_ftps, enable_failover_email, is_integrated, status) FROM stdin;
\.


--
-- Data for Name: esrs_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.esrs_contact (id, secondary, first_name, last_name, company, email, phone, cluster_id) FROM stdin;
\.


--
-- Name: esrs_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.esrs_contact_id_seq', 1, false);


--
-- Data for Name: esrs_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.esrs_email (cluster_id, server, port, sender, receivers, notification_on_success) FROM stdin;
\.


--
-- Data for Name: esrs_proxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.esrs_proxy (cluster_id, server, port, sender, receivers) FROM stdin;
\.


--
-- Data for Name: esx; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.esx (uuid, software_profile, node_sn, cluster_id) FROM stdin;
4c4c4544-004c-4c10-8046-c8c04f424432	 ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922	HLLFBD2	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
4c4c4544-0039-3110-8034-b1c04f424332	 ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922	1914BC2	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
4c4c4544-0038-5a10-8036-b1c04f424332	 ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922	18Z6BC2	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
4c4c4544-0038-5910-8034-b1c04f424332	 ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922	18Y4BC2	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
\.


--
-- Data for Name: event_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_code (code, severity, message, component, connect_home, kb_info) FROM stdin;
MYSTIC014000	1Error	Cluster health - Error	Cluster	t	198288,https://support.emc.com/kb/198288
MYSTIC018000	2Warning	Cluster health - Warning	Cluster	f	
MYSTIC010001	0Critical	Unable to Communicate to an ESX of ESXi Host	Node	t	198300,https://support.emc.com/kb/198300
MYSTIC014003	1Error	Host CPU usage - Red	Node	t	198305,https://support.emc.com/kb/198305
MYSTIC018003	2Warning	Host CPU usage - Yellow	Node	f	
MYSTIC014004	1Error	Host memory usage - Red	Node	t	198387,https://support.emc.com/kb/198387
MYSTIC018004	2Warning	Host memory usage - Yellow	Node	f	
MYSTIC014008	1Error	Datastore usage on disk - Red	Cluster	t	460607,https://support.emc.com/kb/460607
MYSTIC018008	2Warning	Datastore usage on disk - Yellow	Cluster	f	
MYSTIC010009	0Critical	License inventory monitoring	Cluster	t	198382,https://support.emc.com/kb/198382
MYSTIC01000C	0Critical	Host processor status	Node	t	198383,https://support.emc.com/kb/198383
MYSTIC01000D	0Critical	Host memory status	Node	t	198385,https://support.emc.com/kb/198385
MYSTIC01400E	1Error	Host hardware fan {0} status	Node	t	522854,https://support.emc.com/kb/522854
MYSTIC01000F	0Critical	Host hardware voltage	Node	t	469855,https://support.emc.com/kb/469855
MYSTIC010010	0Critical	Host hardware temperature status	Node	t	198286,https://support.emc.com/kb/198286
MYSTIC010011	0Critical	Host lost Power Supply	PowerSupply	t	198290,https://support.emc.com/kb/198290
MYSTIC010012	0Critical	Host hardware system board status	Node	t	198293,https://support.emc.com/kb/198293
MYSTIC014013	1Error	Host battery status	Node	t	198304,https://support.emc.com/kb/198304
MYSTIC014014	1Error	Status of other host hardware objects - Error	Node	t	198306,https://support.emc.com/kb/198306
MYSTIC018014	2Warning	Status of other host hardware objects - Warning	Node	t	198312,https://support.emc.com/kb/198312
MYSTIC014015	1Error	Host storage status - Error	Node	t	522853,https://support.emc.com/kb/522853
MYSTIC018015	2Warning	Host storage status - Warning	Node	f	
MYSTIC010016	0Critical	Host error	Node	t	198303,https://support.emc.com/kb/198303
MYSTIC014016	1Error	Host health - Error. An error was detected on this ESXi host. See detailed status in vCenter Server.	Node	t	198308,https://support.emc.com/kb/198308
MYSTIC018016	2Warning	Host health - Warning. A warning was detected on this ESXi host. See detailed status in vCenter Server.	Node	f	
MYSTIC010018	0Critical	Host connection failure	Node	t	198314,https://support.emc.com/kb/198314
MYSTIC010019	0Critical	Cannot connect to storage	Cluster	t	198319,https://support.emc.com/kb/198319
MYSTIC01001B	0Critical	Exit standby error	Node	t	198324,https://support.emc.com/kb/198324
MYSTIC01001C	0Critical	License error	Cluster	t	198325,https://support.emc.com/kb/198325
MYSTIC01401D	1Error	Health status changed alarm	Cluster	t	198326,https://support.emc.com/kb/198326
MYSTIC01001F	0Critical	Network connectivity lost	Node	t	198266,https://support.emc.com/kb/198266
MYSTIC014020	1Error	Network uplink redundancy lost	Node	t	198269,https://support.emc.com/kb/198269
MYSTIC010022	0Critical	VMkernel NIC not configured correctly	Node	t	198274,https://support.emc.com/kb/198274
MYSTIC014024	1Error	Host IPMI System Event Log status	Node	t	198277,https://support.emc.com/kb/198277
MYSTIC014025	1Error	Host Baseboard Management Controller status	Node	t	198278,https://support.emc.com/kb/198278
MYSTIC018026	2Warning	License user threshold monitoring	Cluster	t	198280,https://support.emc.com/kb/198280
MYSTIC014027	1Error	Thin-provisioned volume capacity threshold exceeded	Cluster	t	198282,https://support.emc.com/kb/198282
MYSTIC018028	2Warning	Datastore Capability Alarm	Cluster	t	
MYSTIC01402D	1Error	Insufficient vSphere HA failover resources	Cluster	t	522852,https://support.emc.com/kb/522852
MYSTIC01802E	2Warning	vSphere HA failover in progress	Cluster	f	
MYSTIC01402F	1Error	Cannot find vSphere HA master agent	Cluster	t	198271,https://support.emc.com/kb/198271
MYSTIC014030	1Error	vSphere HA host status	Node	t	198272,https://support.emc.com/kb/198272
MYSTIC014034	1Error	License Capacity Monitoring	Cluster	t	492899,https://support.emc.com/kb/492899
MYSTIC014035	1Error	The ESXi host license edition is not compatible with the vCenter Server license edition	Node	t	522850,https://support.emc.com/kb/522850
MYSTIC014037	1Error	vSphere Distributed Switch VLAN trunked status	Cluster	t	522849,https://support.emc.com/kb/522849
MYSTIC014038	1Error	vSphere Distributed Switch MTU matched status	Cluster	t	522848,https://support.emc.com/kb/522848
MYSTIC014039	1Error	vSphere Distributed Switch MTU supported status	Cluster	t	522847,https://support.emc.com/kb/522847
MYSTIC01403A	1Error	vSphere Distributed Switch teaming matched status	Cluster	t	522846,https://support.emc.com/kb/522846
MYSTIC01403E	1Error	Registration/unregistration of a VASA vendor provider on a vSAN host fails	Vsan	t	522845,https://support.emc.com/kb/522845
MYSTIC01403F	1Error	Host SSD capacity exceeds the licensed limit for vSAN	Vsan	t	522844,https://support.emc.com/kb/522844
MYSTIC014040	1Error	Expired vSAN license	Vsan	t	522843,https://support.emc.com/kb/522843
MYSTIC014042	1Error	Datastore Compliance Alarm	Cluster	t	522842,https://support.emc.com/kb/522842
MYSTIC014044	1Error	Service Control Agent Health Alarm	Cluster	t	522841,https://support.emc.com/kb/522841
MYSTIC014045	1Error	Identity Health Alarm	Cluster	t	522840,https://support.emc.com/kb/522840
MYSTIC014046	1Error	vSphere Client Health Alarm	Cluster	t	522839,https://support.emc.com/kb/522839
MYSTIC014047	1Error	ESXi Agent Manager Health Alarm	Cluster	t	522838,https://support.emc.com/kb/522838
MYSTIC014048	1Error	Message Bus Configuration Health Alarm	Cluster	t	522837,https://support.emc.com/kb/522837
MYSTIC014049	1Error	CIS License Health Alarm	Cluster	t	522734,https://support.emc.com/kb/522734
MYSTIC01404A	1Error	Appliance Management Health Alarm	Cluster	t	522738,https://support.emc.com/kb/522738
MYSTIC01404B	1Error	Inventory Health Alarm	Cluster	t	522743,https://support.emc.com/kb/522743
MYSTIC01404C	1Error	vCenter Server Health Alarm	Cluster	t	522749,https://support.emc.com/kb/522749
MYSTIC01404D	1Error	Data Service Health Alarm	Cluster	t	522763,https://support.emc.com/kb/522763
MYSTIC01404E	1Error	RBD Health Alarm	Cluster	t	522767,https://support.emc.com/kb/522767
MYSTIC01404F	1Error	vService Manager Health Alarm	Cluster	t	522769,https://support.emc.com/kb/522769
MYSTIC014050	1Error	Performance Charts Service Health Alarm	Cluster	t	522771,https://support.emc.com/kb/522771
MYSTIC014051	1Error	Content Library Service Health Alarm	Cluster	t	522776,https://support.emc.com/kb/522776
MYSTIC014052	1Error	Open Virtualization Format Service Health Alarm	Cluster	t	522779,https://support.emc.com/kb/522779
MYSTIC014053	1Error	Transfer Service Health Alarm	Cluster	t	522782,https://support.emc.com/kb/522782
MYSTIC014054	1Error	VMware vSphere ESXi Dump Collector Health Alarm	Cluster	t	522784,https://support.emc.com/kb/522784
MYSTIC014055	1Error	VMware vAPI Endpoint Service Health Alarm	Cluster	t	522787,https://support.emc.com/kb/522787
MYSTIC014056	1Error	VMware System and Hardware Health Manager Service Health Alarm	Cluster	t	522791,https://support.emc.com/kb/522791
MYSTIC014057	1Error	VMware vSphere Profile-Driven Storage Service Health Alarm	Cluster	t	522794,https://support.emc.com/kb/522794
MYSTIC014058	1Error	VMware Common Logging Service Health Alarm	Cluster	t	522798,https://support.emc.com/kb/522798
MYSTIC014059	1Error	VMware vFabric Postgres Service Health Alarm	Cluster	t	522800,https://support.emc.com/kb/522800
MYSTIC01405A	1Error	vCenter Host Certificate Management Mode	Cluster	t	522804,https://support.emc.com/kb/522804
MYSTIC01405B	1Error	ESXi Host Certificate Status	Cluster	t	522808,https://support.emc.com/kb/522808
MYSTIC01405C	1Error	Certificate Status	Cluster	t	522812,https://support.emc.com/kb/522812
MYSTIC01405D	1Error	VASA provider disconnected	Cluster	t	522736,https://support.emc.com/kb/522736
MYSTIC01405E	1Error	VASA provider certificate expiration alarm	Cluster	t	522774,https://support.emc.com/kb/522774
MYSTIC01405F	1Error	Virtual Machine network adapter reservation status	Cluster	t	522780,https://support.emc.com/kb/522780
MYSTIC014060	1Error	Errors occurred on the disk(s) of a vSAN host	Vsan	t	522786,https://support.emc.com/kb/522786
MYSTIC014061	1Error	Refreshing CA certificates and CRLs for a VASA provider failed	Cluster	t	522792,https://support.emc.com/kb/522792
MYSTIC014062	1Error	Object type storage alarm	Cluster	t	522796,https://support.emc.com/kb/522796
MYSTIC014063	1Error	Registration/unregistration of third-party IO filter storage providers fails on a host	Cluster	t	522802,https://support.emc.com/kb/522802
MYSTIC014064	1Error	vSphere APIs for IO Filtering (VAIO) Filter Management Operations	Cluster	t	522805,https://support.emc.com/kb/522805
MYSTIC014065	1Error	Expired vCenter Server license	Cluster	t	522810,https://support.emc.com/kb/522810
MYSTIC014066	1Error	Expired ESXi host license	Cluster	t	522814,https://support.emc.com/kb/522814
MYSTIC014067	1Error	Expired vCenter Server time-limited license	Cluster	t	522817,https://support.emc.com/kb/522817
MYSTIC014068	1Error	Expired ESXi host time-limited license	Cluster	t	522818,https://support.emc.com/kb/522818
MYSTIC014069	1Error	Expired vSAN time-limited license	Vsan	t	522820,https://support.emc.com/kb/522820
MYSTIC01406A	1Error	Virtual SAN Health Alarm 'Fault domain number check'	Vsan	t	522822,https://support.emc.com/kb/522822
MYSTIC01406B	1Error	Virtual SAN Health Alarm 'Hosts disconnected from vCenter Server'	Vsan	t	522823,https://support.emc.com/kb/522823
MYSTIC01406C	1Error	Virtual SAN Health Alarm 'SCSI controller is VMware certified'	Vsan	t	522824,https://support.emc.com/kb/522824
MYSTIC01806C	2Warning	Virtual SAN Health Alarm 'SCSI controller is VMware certified'	Vsan	f	\N
MYSTIC01406D	1Error	Virtual SAN Health Alarm 'Limits health'	Vsan	t	522827,https://support.emc.com/kb/522827
MYSTIC01406E	1Error	Virtual SAN Health Alarm 'Advanced Virtual SAN configuration in sync'	Vsan	t	522829,https://support.emc.com/kb/522829
MYSTIC01406F	1Error	Virtual SAN Health Alarm 'Hosts with Virtual SAN disabled'	Vsan	t	522831,https://support.emc.com/kb/522831
MYSTIC014070	1Error	Virtual SAN Health Alarm 'ESXi Virtual SAN Health service installation'	Vsan	t	522833,https://support.emc.com/kb/522833
MYSTIC014071	1Error	Virtual SAN Health Alarm 'Hosts without configured unicast agent'	Vsan	t	522765,https://support.emc.com/kb/522765
MYSTIC014072	1Error	Virtual SAN Health Alarm 'MTU check (ping with large packet size)'	Vsan	t	522772,https://support.emc.com/kb/522772
MYSTIC014073	1Error	Virtual SAN Health Alarm 'Witness host with non-existing fault domain'	Vsan	t	522777,https://support.emc.com/kb/522777
MYSTIC014074	1Error	Virtual SAN Health Alarm 'Component metadata health'	Vsan	t	522783,https://support.emc.com/kb/522783
MYSTIC014075	1Error	Virtual SAN Health Alarm 'Virtual SAN HCL DB up-to-date'	Vsan	t	522789,https://support.emc.com/kb/522789
MYSTIC018075	2Warning	Virtual SAN Health Alarm 'Virtual SAN HCL DB up-to-date'	Vsan	f	\N
MYSTIC014076	1Error	Virtual SAN Health Alarm 'Hosts with connectivity issues'	Vsan	t	522795,https://support.emc.com/kb/522795
MYSTIC014077	1Error	Virtual SAN Health Alarm 'Host issues retrieving hardware info'	Vsan	t	522801,https://support.emc.com/kb/522801
MYSTIC014078	1Error	Virtual SAN Health Alarm 'Virtual SAN Health Service up-to-date'	Vsan	t	522806,https://support.emc.com/kb/522806
MYSTIC014079	1Error	Virtual SAN Health Service Alarm for Overall Health Summary	Vsan	t	522811,https://support.emc.com/kb/522811
MYSTIC01407A	1Error	Virtual SAN Health Alarm 'All hosts have a Virtual SAN vmknic configured'	Vsan	t	522816,https://support.emc.com/kb/522816
MYSTIC01407B	1Error	Virtual SAN Health Alarm 'Congestion'	Vsan	t	522819,https://support.emc.com/kb/522819
MYSTIC01407C	1Error	Virtual SAN Health Alarm 'Stretched cluster health'	Vsan	t	522821,https://support.emc.com/kb/522821
MYSTIC01407D	1Error	Virtual SAN Health Alarm 'Controller is VMware certified for ESXi release'	Vsan	t	522825,https://support.emc.com/kb/522825
MYSTIC01807D	2Warning	Virtual SAN Health Alarm 'Controller is VMware certified for ESXi release'	Vsan	f	\N
MYSTIC01407E	1Error	Virtual SAN Health Alarm 'Current cluster situation'	Vsan	t	522826,https://support.emc.com/kb/522826
MYSTIC01407F	1Error	Virtual SAN Health Alarm 'Virtual SAN cluster partition'	Vsan	t	522828,https://support.emc.com/kb/522828
MYSTIC014080	1Error	Virtual SAN Health Alarm 'Data health'	Vsan	t	522830,https://support.emc.com/kb/522830
MYSTIC014081	1Error	Virtual SAN Health Alarm 'After 1 additional host failure'	Vsan	t	522832,https://support.emc.com/kb/522832
MYSTIC014082	1Error	Virtual SAN Health Alarm 'Software state health'	Vsan	t	522834,https://support.emc.com/kb/522834
MYSTIC014083	1Error	Virtual SAN Health Alarm 'Network health'	Vsan	t	522835,https://support.emc.com/kb/522835
MYSTIC014084	1Error	Virtual SAN Health Alarm 'All hosts have matching multicast settings'	Vsan	t	522836,https://support.emc.com/kb/522836
MYSTIC014085	1Error	Virtual SAN Health Alarm 'Active multicast connectivity check'	Vsan	t	522733,https://support.emc.com/kb/522733
MYSTIC014086	1Error	Virtual SAN Health Alarm 'Overall disks health'	Vsan	t	522735,https://support.emc.com/kb/522735
MYSTIC014087	1Error	Virtual SAN Health Alarm 'Stretched cluster without a witness host'	Vsan	t	522737,https://support.emc.com/kb/522737
MYSTIC014088	1Error	Virtual SAN Health Alarm 'All hosts have matching subnets'	Vsan	t	522739,https://support.emc.com/kb/522739
MYSTIC014089	1Error	Virtual SAN Health Alarm 'Basic (unicast) connectivity check (normal ping)'	Vsan	t	522740,https://support.emc.com/kb/522740
MYSTIC01408A	1Error	Virtual SAN Health Alarm 'Multicast assessment based on other checks'	Vsan	t	522741,https://support.emc.com/kb/522741
MYSTIC01408B	1Error	Virtual SAN Health Alarm 'Physical disk health retrieval issues'	Vsan	t	522744,https://support.emc.com/kb/522744
MYSTIC01408C	1Error	Virtual SAN Health Alarm 'Unexpected Virtual SAN cluster members'	Vsan	t	522745,https://support.emc.com/kb/522745
MYSTIC01408D	1Error	Virtual SAN Health Alarm 'Cluster health'	Vsan	t	522746,https://support.emc.com/kb/522746
MYSTIC01408E	1Error	Virtual SAN Health Alarm 'Memory pools (slabs)'	Vsan	t	522748,https://support.emc.com/kb/522748
MYSTIC01408F	1Error	Virtual SAN Health Alarm 'Virtual SAN CLOMD liveness'	Vsan	t	522750,https://support.emc.com/kb/522750
MYSTIC014090	1Error	Virtual SAN Health Alarm 'Metadata health'	Vsan	t	522751,https://support.emc.com/kb/522751
MYSTIC014091	1Error	Virtual SAN Health Alarm 'Virtual SAN object health'	Vsan	t	522753,https://support.emc.com/kb/522753
MYSTIC014092	1Error	Virtual SAN Health Alarm 'Virtual SAN HCL health'	Vsan	t	522754,https://support.emc.com/kb/522754
MYSTIC018092	2Warning	Virtual SAN Health Alarm 'Virtual SAN HCL health'	Vsan	f	\N
MYSTIC014093	1Error	Virtual SAN Health Alarm 'Physical disk health'	Vsan	t	522756,https://support.emc.com/kb/522756
MYSTIC014094	1Error	Virtual SAN Health Alarm 'Stretched cluster with no disk mapping witness host'	Vsan	t	522757,https://support.emc.com/kb/522757
MYSTIC014095	1Error	Virtual SAN Health Alarm 'Disk capacity'	Vsan	t	522758,https://support.emc.com/kb/522758
MYSTIC014096	1Error	Virtual SAN Health Alarm 'Witness host with invalid preferred fault domain'	Vsan	t	522759,https://support.emc.com/kb/522759
MYSTIC014097	1Error	Virtual SAN Health Alarm 'Witness host part of cluster'	Vsan	t	522761,https://support.emc.com/kb/522761
MYSTIC014098	1Error	Virtual SAN Health Alarm 'Witness host inside one of the fault domain'	Vsan	t	522762,https://support.emc.com/kb/522762
MYSTIC014099	1Error	Virtual SAN Health Alarm 'Cluster with multiple unicast agents'	Vsan	t	522815,https://support.emc.com/kb/522815
MYSTIC01409A	1Error	Virtual SAN Health Alarm 'Controller Driver'	Vsan	t	522813,https://support.emc.com/kb/522813
MYSTIC01409B	1Error	Virtual SAN Health Alarm 'Memory pools (heaps)'	Vsan	t	522809,https://support.emc.com/kb/522809
MYSTIC01409C	1Error	Virtual SAN Health Alarm 'Some hosts do not support stretched cluster'	Vsan	t	522807,https://support.emc.com/kb/522807
MYSTIC020001	0Critical	Hardware health changed - The remaining rated write endurance of the boot device {0} is lower than 5%	Node	t	198292,https://support.emc.com/kb/198292
MYSTIC024001	1Error	Hardware health changed - The remaining rated write endurance of the boot device {0} is lower than 20%	Node	t	198298,https://support.emc.com/kb/198298
MYSTIC028001	2Warning	Hardware health changed - The remaining rated write endurance of the boot device {0} is lower than 30%	Node	t	198302,https://support.emc.com/kb/198302
MYSTIC028006	2Warning	The remaining rated write endurance of disk {0} of node {1} is lower than {2}%	Disk	t	
MYSTIC02C006	3Info	The remaining rated write endurance of disk {0} of node {1} is lower than {2}%	Disk	t	
MYSTIC02C001	3Info	Hardware health changed - Boot Device {0}  wearing	Node	f	
VXR024005	1Error	Hardware health changed - Boot Device {0} is missing or in invalid state	Node	t	524969,https://support.emc.com/kb/524969
MYSTIC020002	0Critical	Hardware health changed - disk status	Disk	t	198313,https://support.emc.com/kb/198313
MYSTIC020003	0Critical	Hardware health changed - node status (system status LED amber)	Node	t	198316,https://support.emc.com/kb/198316
MYSTIC028005	2Warning	Hardware health changed - node status (system status LED amber)	Node	t	
MYSTIC024003	1Error	Hardware health changed - node status (system status LED amber blinking)	Node	t	198320,https://support.emc.com/kb/198320
MYSTIC028003	2Warning	Hardware health changed - node status (system status LED green blinking)	Node	f	
MYSTIC028004	2Warning	Mismatched Appliance TLA be detected	Node	f	
MYSTIC038001	2Warning	ESRS VE not activated	Esrs	f	
MYSTIC034002	1Error	ESRS VE activated but inaccessible	Esrs	f	522803,https://support.emc.com/kb/522803
MYSTIC034003	1Error	Authentication service temporarily unavailable	Esrs	f	522799,https://support.emc.com/kb/522799
MYSTIC034004	1Error	Failed to add device to ESRS VE	Esrs	f	522797,https://support.emc.com/kb/522797
MYSTIC034010	1Error	Failed to delete device from ESRS VE	Esrs	f	522793,https://support.emc.com/kb/522793
MYSTIC034005	1Error	Failed to send configuration to ESRS VE	Esrs	f	522790,https://support.emc.com/kb/522790
MYSTIC034006	1Error	Failed to send connect home to ESRS VE	Esrs	f	522788,https://support.emc.com/kb/522788
MYSTIC034007	1Error	Failed to upload attachment to ESRS VE	Esrs	f	522785,https://support.emc.com/kb/522785
MYSTIC034008	1Error	Failed to send heartbeat to ESRS VE for 100 times	Esrs	f	522781,https://support.emc.com/kb/522781
VXR034011	1Error	Failed to initial RSC	Esrs	t	525054,https://support.emc.com/kb/525054
VXR034012	1Error	Failed to enable RSC	Esrs	t	525056,https://support.emc.com/kb/525056
VXR038013	2Warning	ESRS rectification is needed for RSC	Esrs	f	525642,https://support.emc.com/kb/525642
MYSTIC036001	3Info	Failed to find backup external ESRS VE	Esrs	f	
MYSTIC038008	2Warning	Failed to send heartbeat to ESRS VE for 10 times	Esrs	f	
MYSTIC03C008	3Info	Failed to send heartbeat to ESRS VE	Esrs	f	
MYSTIC100001	0Critical	ESXi Host Inaccessible	Esx	t	198283,https://support.emc.com/kb/198283
MYSTIC100002	0Critical	vCenter Server Inaccessible	Vcenter	t	198285,https://support.emc.com/kb/198285
MYSTIC108003	2Warning	VxRail Manager Inaccessible	MysticManager	f	
MYSTIC100011	0Critical	VxRail Manager service down - Web UI	MysticManager	t	198311,https://support.emc.com/kb/198311
MYSTIC104012	1Error	VxRail Manager service down - Cluster Connector	MysticManager	t	198315,https://support.emc.com/kb/198315
MYSTIC104013	1Error	VxRail Manager service down - ESRS Connector	MysticManager	f	522778,https://support.emc.com/kb/522778
MYSTIC104014	1Error	VxRail Manager service down - eService Connector	MysticManager	t	198318,https://support.emc.com/kb/198318
MYSTIC110001	0Critical	Initialization failed	MysticManager	f	462919,https://support.emc.com/kb/462919
MYSTIC11C001	3Info	Initialization succeeded	MysticManager	f	
MYSTIC11B002	3Info	User login failed	MysticManager	f	522773,https://support.emc.com/kb/522773
MYSTIC11C002	3Info	User login succeeded	MysticManager	f	
MYSTIC11C003	3Info	User logout	MysticManager	f	
MYSTIC124001	1Error	vCenter license expiration reminder (<20 days)	MysticManager	t	198322,https://support.emc.com/kb/198322
MYSTIC120001	0Critical	vCenter license expiration alert (<5 days)	MysticManager	t	198289,https://support.emc.com/kb/198289
MYSTIC124002	1Error	Set node blue LED failed	MysticManager	f	522770,https://support.emc.com/kb/522770
MYSTIC12C002	3Info	Set node blue LED succeeded	MysticManager	f	
MYSTIC124003	1Error	Failed to query cluster info	MysticManager	t	521152,https://support.emc.com/kb/521152
MYSTIC12C003	3Info	Query cluster info	MysticManager	f	
MYSTIC124004	1Error	Set node blue LED blink failed	MysticManager	f	522768,https://support.emc.com/kb/522768
MYSTIC12C004	3Info	Set node blue LED blink succeeded	MysticManager	f	
MYSTIC124005	1Error	Set node blue LED off failed	MysticManager	f	522766,https://support.emc.com/kb/522766
MYSTIC12C005	3Info	Set node blue LED off succeeded	MysticManager	f	
MYSTIC124006	1Error	Set disk green LED failed	MysticManager	f	522764,https://support.emc.com/kb/522764
MYSTIC12C006	3Info	Set disk green LED succeeded	MysticManager	f	
MYSTIC124007	1Error	Set disk green LED blink failed	MysticManager	f	522760,https://support.emc.com/kb/522760
MYSTIC12C007	3Info	Set disk green LED blink succeeded	MysticManager	f	
MYSTIC124008	1Error	Set disk green LED off failed	MysticManager	f	522752,https://support.emc.com/kb/522752
MYSTIC12C008	3Info	Set disk green LED off succeeded	MysticManager	f	
MYSTIC134001	1Error	Connection to eService server	MysticManager	t	198310,https://support.emc.com/kb/198310
MYSTIC134002	1Error	Failed to get Advisories catalog	MysticManager	t	198317,https://support.emc.com/kb/198317
MYSTIC134003	1Error	Failed to get Download catalog	MysticManager	t	198321,https://support.emc.com/kb/198321
MYSTIC134004	1Error	Failed to download file from catalog	MysticManager	t	198323,https://support.emc.com/kb/198323
MYSTIC13C001	3Info	New version(s) ready	MysticManager	f	
MYSTIC1FC111	3Info	Upgrade start	Cluster	t	198279,https://support.emc.com/kb/198279
MYSTIC1FC112	3Info	Upgrade success	Cluster	t	198262,https://support.emc.com/kb/198262
MYSTIC1F4112	1Error	Upgrade failed	Cluster	t	198263,https://support.emc.com/kb/198263
MYSTIC1FC115	3Info	Upload start	Cluster	t	
MYSTIC1FC116	3Info	Upload success	Cluster	t	
MYSTIC1F4114	1Error	Upload failed	Cluster	t	522747,https://support.emc.com/kb/522747
MYSTIC1FC113	3Info	Start a web chat with EMC Support for assistance	Cluster	t	
MYSTIC1FC114	3Info	Call EMC Support for assistance	Cluster	t	
MYSTIC1000	3Info	Configuration file update	Esrs	f	198265,https://support.emc.com/kb/198265
MYSTIC1001	3Info	Configuration report for new install	Esrs	t	198267,https://support.emc.com/kb/198267
MYSTIC1002	3Info	Configuration report for scale out install	Esrs	t	198270,https://support.emc.com/kb/198270
MYSTICFFFE	3Info	Test call home to SYR/CSI	Esrs	t	198273,https://support.emc.com/kb/198273
MYSTIC20C001	3Info	Download market appliance	MarketAppliance	t	
MYSTIC20C002	3Info	Install market appliance	MarketAppliance	t	
MYSTIC10C111	3Info	VxRail Manager upgrade operation has started	Cluster	t	524426,https://support.emc.com/kb/524426
MYSTIC10C112	3Info	VxRail Manager upgrade operation was successful	Cluster	t	524427,https://support.emc.com/kb/524427
MYSTIC104112	1Error	VxRail Manager upgrade operation failed	Cluster	t	522742,https://support.emc.com/kb/522742
MYSTIC208001	2Warning	Purchase order file was not found for node {0}	Cluster	t	488461,https://support.emc.com/kb/488461
MYSTIC208002	2Warning	Purchase order file is incorrect or crashed for node {0}	Cluster	t	
MYSTIC208003	2Warning	The disks are possibly missing on node {0} based on purchase order file	Cluster	t	
MYSTIC008001	2Warning	The version is {0} (supported, reference version is {1} )	Cluster	f	
MYSTIC004002	1Error	The version is {0} (not supported). See KB500665	Cluster	f	500665,https://support.emc.com/kb/500665
MYSTIC004003	1Error	The version is {0} (incompatible with {1} ). See KB500666	Cluster	f	500666,https://support.emc.com/kb/500666
MYSTIC028002	2Warning	The version is {0} (supported, reference version is {1} )	Node	f	
MYSTIC024002	1Error	The version is {0} (not supported). See KB500665	Node	f	500665,https://support.emc.com/kb/500665
MYSTIC024004	1Error	The version is {0} (incompatible with {1} ). See KB500666	Node	f	500666,https://support.emc.com/kb/500666
MYSTIC008002	2Warning	Virtual Appliance process failed	MysticManager	f	
MYSTIC108004	2Warning	The proxy server is out of connection	MysticManager	f	198309,https://support.emc.com/kb/198309
MYSTIC108005	2Warning	Failed to refresh VxRail IP in iDrac	Node	f	
VXR104006	1Error	Failed to remove node	Cluster	f	\N
VXR104007	1Error	Failed to remove node due to pnst resetting	Cluster	f	\N
VXR10C008	3Info	Node is removed Successfully	Cluster	f	\N
MYSTIC01409D	1Error	Virtual SAN Health Alarm 'Controller firmware is VMware certified'	Vsan	t	
MYSTIC01809D	2Warning	Virtual SAN Health Alarm 'Controller firmware is VMware certified'	Vsan	f	
MYSTIC01409E	1Error	Virtual SAN Health Alarm 'Controller driver is VMware certified'	Vsan	t	
MYSTIC01809E	2Warning	Virtual SAN Health Alarm 'Controller driver is VMware certified'	Vsan	f	
MYSTIC01409F	1Error	Virtual SAN Health Alarm 'Controller disk group mode is VMware certified'	Vsan	t	
MYSTIC01809F	2Warning	Virtual SAN Health Alarm 'Controller disk group mode is VMware certified'	Vsan	f	
VXR500CTL40	0Critical	This is an iDRAC internal error : {0}	Node	t	524226,https://support.emc.com/kb/524226
VXR500CTL46	0Critical	This is an iDRAC internal error : {0}	Node	t	524227,https://support.emc.com/kb/524227
VXR500CTL47	0Critical	This is an iDRAC internal error : {0}	Node	t	524228,https://support.emc.com/kb/524228
VXR500UEFI0058	0Critical	This is an iDRAC internal error : {0}	Node	t	524229,https://support.emc.com/kb/524229
VXR500UEFI0086	0Critical	This is an iDRAC internal error : {0}	Node	t	524230,https://support.emc.com/kb/524230
VXR500UEFI0087	0Critical	This is an iDRAC internal error : {0}	Node	t	524231,https://support.emc.com/kb/524231
VXR500UEFI0088	0Critical	This is an iDRAC internal error : {0}	Node	t	524232,https://support.emc.com/kb/524232
VXR500UEFI0089	0Critical	This is an iDRAC internal error : {0}	Node	t	524233,https://support.emc.com/kb/524233
VXR500UEFI0090	0Critical	This is an iDRAC internal error : {0}	Node	t	524234,https://support.emc.com/kb/524234
VXR500UEFI0091	0Critical	This is an iDRAC internal error : {0}	Node	t	524235,https://support.emc.com/kb/524235
VXR500UEFI0092	0Critical	This is an iDRAC internal error : {0}	Node	t	524236,https://support.emc.com/kb/524236
VXR500UEFI0093	0Critical	This is an iDRAC internal error : {0}	Node	t	524237,https://support.emc.com/kb/524237
VXR500UEFI0094	0Critical	This is an iDRAC internal error : {0}	Node	t	524239,https://support.emc.com/kb/524239
VXR500UEFI0095	0Critical	This is an iDRAC internal error : {0}	Node	t	524240,https://support.emc.com/kb/524240
VXR500UEFI0098	0Critical	This is an iDRAC internal error : {0}	Node	t	524197,https://support.emc.com/kb/524197
VXR500UEFI0159	0Critical	This is an iDRAC internal error : {0}	Node	t	524198,https://support.emc.com/kb/524198
VXR500UEFI0160	0Critical	This is an iDRAC internal error : {0}	Node	t	524199,https://support.emc.com/kb/524199
VXR500UEFI0161	0Critical	This is an iDRAC internal error : {0}	Node	t	524200,https://support.emc.com/kb/524200
VXR500UEFI0162	0Critical	This is an iDRAC internal error : {0}	Node	t	524201,https://support.emc.com/kb/524201
VXR500UEFI0163	0Critical	This is an iDRAC internal error : {0}	Node	t	524202,https://support.emc.com/kb/524202
VXR500UEFI0164	0Critical	This is an iDRAC internal error : {0}	Node	t	524204,https://support.emc.com/kb/524204
VXR500UEFI0165	0Critical	This is an iDRAC internal error : {0}	Node	t	524206,https://support.emc.com/kb/524206
VXR500UEFI0166	0Critical	This is an iDRAC internal error : {0}	Node	t	524209,https://support.emc.com/kb/524209
VXR500UEFI0167	0Critical	This is an iDRAC internal error : {0}	Node	t	524212,https://support.emc.com/kb/524212
VXR500UEFI0168	0Critical	This is an iDRAC internal error : {0}	Node	t	524215,https://support.emc.com/kb/524215
VXR500UEFI0169	0Critical	This is an iDRAC internal error : {0}	Node	t	524218,https://support.emc.com/kb/524218
VXR500UEFI0170	0Critical	This is an iDRAC internal error : {0}	Node	t	524220,https://support.emc.com/kb/524220
VXR500UEFI0171	0Critical	This is an iDRAC internal error : {0}	Node	t	524221,https://support.emc.com/kb/524221
VXR500UEFI0172	0Critical	This is an iDRAC internal error : {0}	Node	t	524155,https://support.emc.com/kb/524155
VXR500UEFI0173	0Critical	This is an iDRAC internal error : {0}	Node	t	524159,https://support.emc.com/kb/524159
VXR500UEFI0174	0Critical	This is an iDRAC internal error : {0}	Node	t	524160,https://support.emc.com/kb/524160
VXR500UEFI0175	0Critical	This is an iDRAC internal error : {0}	Node	t	524162,https://support.emc.com/kb/524162
VXR500UEFI0176	0Critical	This is an iDRAC internal error : {0}	Node	t	524163,https://support.emc.com/kb/524163
VXR500UEFI0177	0Critical	This is an iDRAC internal error : {0}	Node	t	524165,https://support.emc.com/kb/524165
VXR500UEFI0185	0Critical	This is an iDRAC internal error : {0}	Node	t	524167,https://support.emc.com/kb/524167
VXR500UEFI0242	0Critical	This is an iDRAC internal error : {0}	Node	t	524168,https://support.emc.com/kb/524168
VXR500UEFI0278	0Critical	This is an iDRAC internal error : {0}	Node	t	524169,https://support.emc.com/kb/524169
VXR500UEFI0302	0Critical	This is an iDRAC internal error : {0}	Node	t	524171,https://support.emc.com/kb/524171
VXR500UEFI0303	0Critical	This is an iDRAC internal error : {0}	Node	t	524172,https://support.emc.com/kb/524172
VXR500UEFI0304	0Critical	This is an iDRAC internal error : {0}	Node	t	524175,https://support.emc.com/kb/524175
VXR500UEFI0339	0Critical	This is an iDRAC internal error : {0}	Node	t	524176,https://support.emc.com/kb/524176
VXR500UEFI0341	0Critical	This is an iDRAC internal error : {0}	Node	t	524173,https://support.emc.com/kb/524173
VXR500MEM0001	0Critical	This is an iDRAC internal error : {0}	Node	t	524178,https://support.emc.com/kb/524178
VXR500MEM0002	0Critical	This is an iDRAC internal error : {0}	Node	t	524180,https://support.emc.com/kb/524180
VXR500MEM0003	0Critical	This is an iDRAC internal error : {0}	Node	t	524181,https://support.emc.com/kb/524181
VXR500MEM0004	0Critical	This is an iDRAC internal error : {0}	Node	t	524182,https://support.emc.com/kb/524182
VXR500MEM0005	0Critical	This is an iDRAC internal error : {0}	Node	t	524183,https://support.emc.com/kb/524183
VXR500MEM0007	0Critical	This is an iDRAC internal error : {0}	Node	t	524185,https://support.emc.com/kb/524185
VXR500MEM0010	0Critical	This is an iDRAC internal error : {0}	Node	t	524186,https://support.emc.com/kb/524186
VXR500MEM0702	0Critical	This is an iDRAC internal error : {0}	Node	t	524188,https://support.emc.com/kb/524188
VXR500MEM1001	0Critical	This is an iDRAC internal error : {0}	Node	t	524190,https://support.emc.com/kb/524190
VXR500MEM1005	0Critical	This is an iDRAC internal error : {0}	Node	t	524191,https://support.emc.com/kb/524191
VXR500MEM1007	0Critical	This is an iDRAC internal error : {0}	Node	t	524192,https://support.emc.com/kb/524192
VXR500MEM1009	0Critical	This is an iDRAC internal error : {0}	Node	t	524194,https://support.emc.com/kb/524194
VXR500MEM1016	0Critical	This is an iDRAC internal error : {0}	Node	t	524156,https://support.emc.com/kb/524156
VXR500MEM1201	0Critical	This is an iDRAC internal error : {0}	Node	t	524157,https://support.emc.com/kb/524157
VXR500MEM1205	0Critical	This is an iDRAC internal error : {0}	Node	t	524158,https://support.emc.com/kb/524158
VXR500MEM1208	0Critical	This is an iDRAC internal error : {0}	Node	t	524161,https://support.emc.com/kb/524161
VXR500MEM1212	0Critical	This is an iDRAC internal error : {0}	Node	t	524164,https://support.emc.com/kb/524164
VXR500MEM7002	0Critical	This is an iDRAC internal error : {0}	Node	t	524184,https://support.emc.com/kb/524184
VXR500MEM8000	0Critical	This is an iDRAC internal error : {0}	Node	t	524187,https://support.emc.com/kb/524187
VXR500MEM8500	0Critical	This is an iDRAC internal error : {0}	Node	t	524189,https://support.emc.com/kb/524189
VXR500MEM8502	0Critical	This is an iDRAC internal error : {0}	Node	t	524193,https://support.emc.com/kb/524193
VXR500MEM9000	0Critical	This is an iDRAC internal error : {0}	Node	t	524195,https://support.emc.com/kb/524195
VXR500MEM9004	0Critical	This is an iDRAC internal error : {0}	Node	t	524211,https://support.emc.com/kb/524211
VXR500MEM9005	0Critical	This is an iDRAC internal error : {0}	Node	t	524214,https://support.emc.com/kb/524214
VXR500MEM9006	0Critical	This is an iDRAC internal error : {0}	Node	t	524214,https://support.emc.com/kb/524214
VXR500MEM9007	0Critical	This is an iDRAC internal error : {0}	Node	t	524166,https://support.emc.com/kb/524166
VXR500MEM9008	0Critical	This is an iDRAC internal error : {0}	Node	t	524170,https://support.emc.com/kb/524170
VXR500MEM9015	0Critical	This is an iDRAC internal error : {0}	Node	t	524174,https://support.emc.com/kb/524174
VXR500MEM9030	0Critical	This is an iDRAC internal error : {0}	Node	t	524177,https://support.emc.com/kb/524177
VXR500MEM9031	0Critical	This is an iDRAC internal error : {0}	Node	t	524179,https://support.emc.com/kb/524179
VXR500MEM9032	0Critical	This is an iDRAC internal error : {0}	Node	t	524203,https://support.emc.com/kb/524203
VXR500MEM9033	0Critical	This is an iDRAC internal error : {0}	Node	t	524205,https://support.emc.com/kb/524205
VXR500MEM9034	0Critical	This is an iDRAC internal error : {0}	Node	t	524207,https://support.emc.com/kb/524207
VXR500MEM9035	0Critical	This is an iDRAC internal error : {0}	Node	t	524208,https://support.emc.com/kb/524208
VXR500MEM9036	0Critical	This is an iDRAC internal error : {0}	Node	t	524210,https://support.emc.com/kb/524210
VXR500MEM9037	0Critical	This is an iDRAC internal error : {0}	Node	t	524213,https://support.emc.com/kb/524213
VXR500MEM9038	0Critical	This is an iDRAC internal error : {0}	Node	t	524216,https://support.emc.com/kb/524216
VXR500MEM9071	0Critical	This is an iDRAC internal error : {0}	Node	t	524219,https://support.emc.com/kb/524219
VXR500AMP0301	0Critical	This is an iDRAC internal error : {0}	Node	t	526933,https://support.emc.com/kb/526933
VXR500AMP0303	0Critical	This is an iDRAC internal error : {0}	Node	t	526934,https://support.emc.com/kb/526934
VXR500AMP0304	0Critical	This is an iDRAC internal error : {0}	Node	t	526935,https://support.emc.com/kb/526935
VXR500AMP0307	0Critical	This is an iDRAC internal error : {0}	Node	t	526936,https://support.emc.com/kb/526936
VXR500AMP0309	0Critical	This is an iDRAC internal error : {0}	Node	t	526937,https://support.emc.com/kb/526937
VXR500AMP0310	0Critical	This is an iDRAC internal error : {0}	Node	t	526938,https://support.emc.com/kb/526938
VXR500AMP0313	0Critical	This is an iDRAC internal error : {0}	Node	t	526939,https://support.emc.com/kb/526939
VXR500AMP0315	0Critical	This is an iDRAC internal error : {0}	Node	t	526940,https://support.emc.com/kb/526940
VXR500AMP0316	0Critical	This is an iDRAC internal error : {0}	Node	t	526941,https://support.emc.com/kb/526941
VXR500AMP0319	0Critical	This is an iDRAC internal error : {0}	Node	t	526942,https://support.emc.com/kb/526942
VXR500AMP0321	0Critical	This is an iDRAC internal error : {0}	Node	t	526943,https://support.emc.com/kb/526943
VXR500AMP0322	0Critical	This is an iDRAC internal error : {0}	Node	t	526944,https://support.emc.com/kb/526944
VXR500BAT0002	0Critical	This is an iDRAC internal error : {0}	Node	t	526951,https://support.emc.com/kb/526951
VXR500BAT0004	0Critical	This is an iDRAC internal error : {0}	Node	t	526952,https://support.emc.com/kb/526952
VXR500BAT0007	0Critical	This is an iDRAC internal error : {0}	Node	t	526954,https://support.emc.com/kb/526954
VXR500BAT0009	0Critical	This is an iDRAC internal error : {0}	Node	t	526955,https://support.emc.com/kb/526955
VXR500BAT0012	0Critical	This is an iDRAC internal error : {0}	Node	t	526956,https://support.emc.com/kb/526956
VXR500BAT0014	0Critical	This is an iDRAC internal error : {0}	Node	t	526957,https://support.emc.com/kb/526957
VXR500BAT0017	0Critical	This is an iDRAC internal error : {0}	Node	t	526958,https://support.emc.com/kb/526958
VXR500BAT0019	0Critical	This is an iDRAC internal error : {0}	Node	t	526960,https://support.emc.com/kb/526960
VXR500BAT1025	0Critical	This is an iDRAC internal error : {0}	Node	t	526961,https://support.emc.com/kb/526961
VXR500BAT1029	0Critical	This is an iDRAC internal error : {0}	Node	t	526962,https://support.emc.com/kb/526962
VXR500CBL0003	0Critical	This is an iDRAC internal error : {0}	Node	t	526963,https://support.emc.com/kb/526963
VXR500CPU0001	0Critical	This is an iDRAC internal error : {0}	Node	t	526964,https://support.emc.com/kb/526964
VXR500CPU0002	0Critical	This is an iDRAC internal error : {0}	Node	t	526968,https://support.emc.com/kb/526968
VXR500CPU0003	0Critical	This is an iDRAC internal error : {0}	Node	t	526969,https://support.emc.com/kb/526969
VXR500CPU0004	0Critical	This is an iDRAC internal error : {0}	Node	t	526970,https://support.emc.com/kb/526970
VXR500CPU0005	0Critical	This is an iDRAC internal error : {0}	Node	t	526971,https://support.emc.com/kb/526971
VXR500CPU0006	0Critical	This is an iDRAC internal error : {0}	Node	t	526972,https://support.emc.com/kb/526972
VXR500CPU0011	0Critical	This is an iDRAC internal error : {0}	Node	t	526973,https://support.emc.com/kb/526973
VXR500CPU0700	0Critical	This is an iDRAC internal error : {0}	Node	t	526974,https://support.emc.com/kb/526974
VXR500CPU0701	0Critical	This is an iDRAC internal error : {0}	Node	t	526975,https://support.emc.com/kb/526975
VXR500CPU0702	0Critical	This is an iDRAC internal error : {0}	Node	t	526976,https://support.emc.com/kb/526976
VXR500CPU0703	0Critical	This is an iDRAC internal error : {0}	Node	t	526977,https://support.emc.com/kb/526977
VXR500CPU0704	0Critical	This is an iDRAC internal error : {0}	Node	t	526978,https://support.emc.com/kb/526978
VXR500CPU0801	0Critical	This is an iDRAC internal error : {0}	Node	t	526979,https://support.emc.com/kb/526979
VXR500CPU0803	0Critical	This is an iDRAC internal error : {0}	Node	t	526980,https://support.emc.com/kb/526980
VXR500CPU0804	0Critical	This is an iDRAC internal error : {0}	Node	t	526981,https://support.emc.com/kb/526981
VXR500CPU0806	0Critical	This is an iDRAC internal error : {0}	Node	t	526982,https://support.emc.com/kb/526982
VXR500CPU0816	0Critical	This is an iDRAC internal error : {0}	Node	t	526983,https://support.emc.com/kb/526983
VXR500CPUA0023	0Critical	This is an iDRAC internal error : {0}	Node	t	526984,https://support.emc.com/kb/526984
VXR500CTL44	0Critical	This is an iDRAC internal error : {0}	Node	t	526985,https://support.emc.com/kb/526985
VXR500CTL56	0Critical	This is an iDRAC internal error : {0}	Node	t	526986,https://support.emc.com/kb/526986
VXR500CTL58	0Critical	This is an iDRAC internal error : {0}	Node	t	526987,https://support.emc.com/kb/526987
VXR500CTL59	0Critical	This is an iDRAC internal error : {0}	Node	t	526988,https://support.emc.com/kb/526988
VXR500CTL76	0Critical	This is an iDRAC internal error : {0}	Node	t	526989,https://support.emc.com/kb/526989
VXR500CTL90	0Critical	This is an iDRAC internal error : {0}	Node	t	526990,https://support.emc.com/kb/526990
VXR500CTL96	0Critical	This is an iDRAC internal error : {0}	Node	t	526991,https://support.emc.com/kb/526991
VXR500FAN0001	0Critical	This is an iDRAC internal error : {0}	Node	t	526992,https://support.emc.com/kb/526992
VXR500FAN0003	0Critical	This is an iDRAC internal error : {0}	Node	t	526993,https://support.emc.com/kb/526993
VXR500FAN0004	0Critical	This is an iDRAC internal error : {0}	Node	t	526994,https://support.emc.com/kb/526994
VXR500FAN0006	0Critical	This is an iDRAC internal error : {0}	Node	t	526995,https://support.emc.com/kb/526995
VXR500FAN0009	0Critical	This is an iDRAC internal error : {0}	Node	t	526996,https://support.emc.com/kb/526996
VXR500FAN1000	0Critical	This is an iDRAC internal error : {0}	Node	t	526997,https://support.emc.com/kb/526997
VXR500FAN1002	0Critical	This is an iDRAC internal error : {0}	Node	t	526998,https://support.emc.com/kb/526998
VXR500IOV107	0Critical	This is an iDRAC internal error : {0}	Node	t	526999,https://support.emc.com/kb/526999
VXR500LNK2700	0Critical	This is an iDRAC internal error : {0}	Node	t	527000,https://support.emc.com/kb/527000
VXR500PCI1302	0Critical	This is an iDRAC internal error : {0}	Node	t	527001,https://support.emc.com/kb/527001
VXR500PCI1304	0Critical	This is an iDRAC internal error : {0}	Node	t	527002,https://support.emc.com/kb/527002
VXR500PCI1306	0Critical	This is an iDRAC internal error : {0}	Node	t	527003,https://support.emc.com/kb/527003
VXR500PCI1308	0Critical	This is an iDRAC internal error : {0}	Node	t	527004,https://support.emc.com/kb/527004
VXR500PCI1310	0Critical	This is an iDRAC internal error : {0}	Node	t	527006,https://support.emc.com/kb/527006
VXR500PCI1314	0Critical	This is an iDRAC internal error : {0}	Node	t	527008,https://support.emc.com/kb/527008
VXR500PCI1316	0Critical	This is an iDRAC internal error : {0}	Node	t	527009,https://support.emc.com/kb/527009
VXR500PCI1318	0Critical	This is an iDRAC internal error : {0}	Node	t	527010,https://support.emc.com/kb/527010
VXR500PCI1320	0Critical	This is an iDRAC internal error : {0}	Node	t	527011,https://support.emc.com/kb/527011
VXR500PCI1342	0Critical	This is an iDRAC internal error : {0}	Node	t	527012,https://support.emc.com/kb/527012
VXR500PCI1344	0Critical	This is an iDRAC internal error : {0}	Node	t	527013,https://support.emc.com/kb/527013
VXR500PCI1346	0Critical	This is an iDRAC internal error : {0}	Node	t	527014,https://support.emc.com/kb/527014
VXR500PCI1348	0Critical	This is an iDRAC internal error : {0}	Node	t	527015,https://support.emc.com/kb/527015
VXR500PCI1350	0Critical	This is an iDRAC internal error : {0}	Node	t	527016,https://support.emc.com/kb/527016
VXR500PCI1354	0Critical	This is an iDRAC internal error : {0}	Node	t	527017,https://support.emc.com/kb/527017
VXR500PCI1356	0Critical	This is an iDRAC internal error : {0}	Node	t	527018,https://support.emc.com/kb/527018
VXR500PCI1358	0Critical	This is an iDRAC internal error : {0}	Node	t	527019,https://support.emc.com/kb/527019
VXR500PCI1360	0Critical	This is an iDRAC internal error : {0}	Node	t	527020,https://support.emc.com/kb/527020
VXR500PCI2000	0Critical	This is an iDRAC internal error : {0}	Node	t	527021,https://support.emc.com/kb/527021
VXR500PCI2002	0Critical	This is an iDRAC internal error : {0}	Node	t	527022,https://support.emc.com/kb/527022
VXR500PCI3000	0Critical	This is an iDRAC internal error : {0}	Node	t	527023,https://support.emc.com/kb/527023
VXR500PCI3002	0Critical	This is an iDRAC internal error : {0}	Node	t	527024,https://support.emc.com/kb/527024
VXR500PCI3004	0Critical	This is an iDRAC internal error : {0}	Node	t	527025,https://support.emc.com/kb/527025
VXR500PCI3006	0Critical	This is an iDRAC internal error : {0}	Node	t	527027,https://support.emc.com/kb/527027
VXR500PCI3016	0Critical	This is an iDRAC internal error : {0}	Node	t	527028,https://support.emc.com/kb/527028
VXR500PCI5004	0Critical	This is an iDRAC internal error : {0}	Node	t	527029,https://support.emc.com/kb/527029
VXR500PCI5005	0Critical	This is an iDRAC internal error : {0}	Node	t	527030,https://support.emc.com/kb/527030
VXR500PDR1001	0Critical	This is an iDRAC internal error : {0}	Node	t	527031,https://support.emc.com/kb/527031
VXR500PDR1016	0Critical	This is an iDRAC internal error : {0}	Node	t	527032,https://support.emc.com/kb/527032
VXR500PDR1024	0Critical	This is an iDRAC internal error : {0}	Node	t	527033,https://support.emc.com/kb/527033
VXR500PDR1101	0Critical	This is an iDRAC internal error : {0}	Node	t	527034,https://support.emc.com/kb/527034
VXR500PDR1116	0Critical	This is an iDRAC internal error : {0}	Node	t	527035,https://support.emc.com/kb/527035
VXR500PDR115	0Critical	This is an iDRAC internal error : {0}	Node	t	527036,https://support.emc.com/kb/527036
VXR500PDR117	0Critical	This is an iDRAC internal error : {0}	Node	t	527037,https://support.emc.com/kb/527037
VXR500PDR12	0Critical	This is an iDRAC internal error : {0}	Node	t	527038,https://support.emc.com/kb/527038
VXR500PDR13	0Critical	This is an iDRAC internal error : {0}	Node	t	527039,https://support.emc.com/kb/527039
VXR500PDR20	0Critical	This is an iDRAC internal error : {0}	Node	t	527040,https://support.emc.com/kb/527040
VXR500PDR29	0Critical	This is an iDRAC internal error : {0}	Node	t	527041,https://support.emc.com/kb/527041
VXR500PDR3	0Critical	This is an iDRAC internal error : {0}	Node	t	527042,https://support.emc.com/kb/527042
VXR500PDR44	0Critical	This is an iDRAC internal error : {0}	Node	t	527043,https://support.emc.com/kb/527043
VXR500PDR46	0Critical	This is an iDRAC internal error : {0}	Node	t	527044,https://support.emc.com/kb/527044
VXR500PDR47	0Critical	This is an iDRAC internal error : {0}	Node	t	527045,https://support.emc.com/kb/527045
VXR500PDR51	0Critical	This is an iDRAC internal error : {0}	Node	t	527046,https://support.emc.com/kb/527046
VXR500PDR57	0Critical	This is an iDRAC internal error : {0}	Node	t	527047,https://support.emc.com/kb/527047
VXR500PDR61	0Critical	This is an iDRAC internal error : {0}	Node	t	527048,https://support.emc.com/kb/527048
VXR500PDR62	0Critical	This is an iDRAC internal error : {0}	Node	t	527049,https://support.emc.com/kb/527049
VXR500PDR63	0Critical	This is an iDRAC internal error : {0}	Node	t	527050,https://support.emc.com/kb/527050
VXR500PDR64	0Critical	This is an iDRAC internal error : {0}	Node	t	527051,https://support.emc.com/kb/527051
VXR500PDR73	0Critical	This is an iDRAC internal error : {0}	Node	t	527052,https://support.emc.com/kb/527052
VXR500PDR85	0Critical	This is an iDRAC internal error : {0}	Node	t	527053,https://support.emc.com/kb/527053
VXR500PDR88	0Critical	This is an iDRAC internal error : {0}	Node	t	527054,https://support.emc.com/kb/527054
VXR500PST0128	0Critical	This is an iDRAC internal error : {0}	Node	t	527055,https://support.emc.com/kb/527055
VXR500PST0129	0Critical	This is an iDRAC internal error : {0}	Node	t	527056,https://support.emc.com/kb/527056
VXR500PST0130	0Critical	This is an iDRAC internal error : {0}	Node	t	527057,https://support.emc.com/kb/527057
VXR500PST0132	0Critical	This is an iDRAC internal error : {0}	Node	t	527058,https://support.emc.com/kb/527058
VXR500PST0133	0Critical	This is an iDRAC internal error : {0}	Node	t	527059,https://support.emc.com/kb/527059
VXR500PST0134	0Critical	This is an iDRAC internal error : {0}	Node	t	527060,https://support.emc.com/kb/527060
VXR500PST0135	0Critical	This is an iDRAC internal error : {0}	Node	t	527061,https://support.emc.com/kb/527061
VXR500PST0136	0Critical	This is an iDRAC internal error : {0}	Node	t	527062,https://support.emc.com/kb/527062
VXR500PST0137	0Critical	This is an iDRAC internal error : {0}	Node	t	527063,https://support.emc.com/kb/527063
VXR500PST0140	0Critical	This is an iDRAC internal error : {0}	Node	t	527064,https://support.emc.com/kb/527064
VXR500PST0141	0Critical	This is an iDRAC internal error : {0}	Node	t	527065,https://support.emc.com/kb/527065
VXR500PST0142	0Critical	This is an iDRAC internal error : {0}	Node	t	527066,https://support.emc.com/kb/527066
VXR500PST0143	0Critical	This is an iDRAC internal error : {0}	Node	t	527067,https://support.emc.com/kb/527067
VXR500PST0194	0Critical	This is an iDRAC internal error : {0}	Node	t	527068,https://support.emc.com/kb/527068
VXR500PST0195	0Critical	This is an iDRAC internal error : {0}	Node	t	527069,https://support.emc.com/kb/527069
VXR500PST0196	0Critical	This is an iDRAC internal error : {0}	Node	t	527070,https://support.emc.com/kb/527070
VXR500PST0254	0Critical	This is an iDRAC internal error : {0}	Node	t	527071,https://support.emc.com/kb/527071
VXR500PST0256	0Critical	This is an iDRAC internal error : {0}	Node	t	527072,https://support.emc.com/kb/527072
VXR500PSU0001	0Critical	This is an iDRAC internal error : {0}	Node	t	527073,https://support.emc.com/kb/527073
VXR500PSU0003	0Critical	This is an iDRAC internal error : {0}	Node	t	527074,https://support.emc.com/kb/527074
VXR500PSU0004	0Critical	This is an iDRAC internal error : {0}	Node	t	527075,https://support.emc.com/kb/527075
VXR500PSU0006	0Critical	This is an iDRAC internal error : {0}	Node	t	527076,https://support.emc.com/kb/527076
VXR500PSU0031	0Critical	This is an iDRAC internal error : {0}	Node	t	527077,https://support.emc.com/kb/527077
VXR500PSU0033	0Critical	This is an iDRAC internal error : {0}	Node	t	527078,https://support.emc.com/kb/527078
VXR500PSU0034	0Critical	This is an iDRAC internal error : {0}	Node	t	527079,https://support.emc.com/kb/527079
VXR500PSU0035	0Critical	This is an iDRAC internal error : {0}	Node	t	527080,https://support.emc.com/kb/527080
VXR500PSU0036	0Critical	This is an iDRAC internal error : {0}	Node	t	527081,https://support.emc.com/kb/527081
VXR500PSU0037	0Critical	This is an iDRAC internal error : {0}	Node	t	527082,https://support.emc.com/kb/527082
VXR500PSU0039	0Critical	This is an iDRAC internal error : {0}	Node	t	527083,https://support.emc.com/kb/527083
VXR500PSU0040	0Critical	This is an iDRAC internal error : {0}	Node	t	527084,https://support.emc.com/kb/527084
VXR500PSU0041	0Critical	This is an iDRAC internal error : {0}	Node	t	527086,https://support.emc.com/kb/527086
VXR500PSU0042	0Critical	This is an iDRAC internal error : {0}	Node	t	527087,https://support.emc.com/kb/527087
VXR500PSU0043	0Critical	This is an iDRAC internal error : {0}	Node	t	527088,https://support.emc.com/kb/527088
VXR500PSU0076	0Critical	This is an iDRAC internal error : {0}	Node	t	527089,https://support.emc.com/kb/527089
VXR500PSU0077	0Critical	This is an iDRAC internal error : {0}	Node	t	527090,https://support.emc.com/kb/527090
VXR500PSU0078	0Critical	This is an iDRAC internal error : {0}	Node	t	527091,https://support.emc.com/kb/527091
VXR500PSU0080	0Critical	This is an iDRAC internal error : {0}	Node	t	527092,https://support.emc.com/kb/527092
VXR500PSU1001	0Critical	This is an iDRAC internal error : {0}	Node	t	527093,https://support.emc.com/kb/527093
VXR500PSU1002	0Critical	This is an iDRAC internal error : {0}	Node	t	527094,https://support.emc.com/kb/527094
VXR500PSU1007	0Critical	This is an iDRAC internal error : {0}	Node	t	527095,https://support.emc.com/kb/527095
VXR500PSU1010	0Critical	This is an iDRAC internal error : {0}	Node	t	527096,https://support.emc.com/kb/527096
VXR500PSUA0016	0Critical	This is an iDRAC internal error : {0}	Node	t	527097,https://support.emc.com/kb/527097
VXR500PWR1006	0Critical	This is an iDRAC internal error : {0}	Node	t	527098,https://support.emc.com/kb/527098
VXR500PWR1008	0Critical	This is an iDRAC internal error : {0}	Node	t	527099,https://support.emc.com/kb/527099
VXR500PWR8680	0Critical	This is an iDRAC internal error : {0}	Node	t	527100,https://support.emc.com/kb/527100
VXR500PWR8681	0Critical	This is an iDRAC internal error : {0}	Node	t	527101,https://support.emc.com/kb/527101
VXR500PWR8682	0Critical	This is an iDRAC internal error : {0}	Node	t	527102,https://support.emc.com/kb/527102
VXR500RDU0002	0Critical	This is an iDRAC internal error : {0}	Node	t	527103,https://support.emc.com/kb/527103
VXR500RDU0005	0Critical	This is an iDRAC internal error : {0}	Node	t	527104,https://support.emc.com/kb/527104
VXR500RDU0012	0Critical	This is an iDRAC internal error : {0}	Node	t	527105,https://support.emc.com/kb/527105
VXR500RDU0015	0Critical	This is an iDRAC internal error : {0}	Node	t	527106,https://support.emc.com/kb/527106
VXR500RDU0031	0Critical	This is an iDRAC internal error : {0}	Node	t	527107,https://support.emc.com/kb/527107
VXR500STOR10	0Critical	This is an iDRAC internal error : {0}	Node	t	527108,https://support.emc.com/kb/527108
VXR500STOR14	0Critical	This is an iDRAC internal error : {0}	Node	t	527109,https://support.emc.com/kb/527109
VXR500SWC4012	0Critical	This is an iDRAC internal error : {0}	Node	t	527110,https://support.emc.com/kb/527110
VXR500TMP0101	0Critical	This is an iDRAC internal error : {0}	Node	t	527111,https://support.emc.com/kb/527111
VXR500TMP0103	0Critical	This is an iDRAC internal error : {0}	Node	t	527112,https://support.emc.com/kb/527112
VXR500TMP0104	0Critical	This is an iDRAC internal error : {0}	Node	t	527113,https://support.emc.com/kb/527113
VXR500TMP0107	0Critical	This is an iDRAC internal error : {0}	Node	t	527114,https://support.emc.com/kb/527114
VXR500TMP0109	0Critical	This is an iDRAC internal error : {0}	Node	t	527115,https://support.emc.com/kb/527115
VXR500TMP0110	0Critical	This is an iDRAC internal error : {0}	Node	t	527116,https://support.emc.com/kb/527116
VXR500TMP0113	0Critical	This is an iDRAC internal error : {0}	Node	t	527117,https://support.emc.com/kb/527117
VXR500TMP0115	0Critical	This is an iDRAC internal error : {0}	Node	t	527118,https://support.emc.com/kb/527118
VXR500TMP0116	0Critical	This is an iDRAC internal error : {0}	Node	t	527119,https://support.emc.com/kb/527119
VXR500TMP0119	0Critical	This is an iDRAC internal error : {0}	Node	t	527120,https://support.emc.com/kb/527120
VXR500TMP0121	0Critical	This is an iDRAC internal error : {0}	Node	t	527121,https://support.emc.com/kb/527121
VXR500TMP0122	0Critical	This is an iDRAC internal error : {0}	Node	t	527122,https://support.emc.com/kb/527122
VXR500TMP0125	0Critical	This is an iDRAC internal error : {0}	Node	t	527123,https://support.emc.com/kb/527123
VXR500TMP0127	0Critical	This is an iDRAC internal error : {0}	Node	t	527124,https://support.emc.com/kb/527124
VXR500TMP0128	0Critical	This is an iDRAC internal error : {0}	Node	t	527125,https://support.emc.com/kb/527125
VXR500TMP0131	0Critical	This is an iDRAC internal error : {0}	Node	t	527127,https://support.emc.com/kb/527127
VXR500TMP0133	0Critical	This is an iDRAC internal error : {0}	Node	t	527128,https://support.emc.com/kb/527128
VXR500TMP0134	0Critical	This is an iDRAC internal error : {0}	Node	t	527129,https://support.emc.com/kb/527129
VXR500TMP0136	0Critical	This is an iDRAC internal error : {0}	Node	t	527130,https://support.emc.com/kb/527130
VXR500TMP0201	0Critical	This is an iDRAC internal error : {0}	Node	t	527131,https://support.emc.com/kb/527131
VXR500TMP0203	0Critical	This is an iDRAC internal error : {0}	Node	t	527132,https://support.emc.com/kb/527132
VXR500TMP0204	0Critical	This is an iDRAC internal error : {0}	Node	t	527133,https://support.emc.com/kb/527133
VXR500TMP1002	0Critical	This is an iDRAC internal error : {0}	Node	t	527134,https://support.emc.com/kb/527134
VXR500TMP1003	0Critical	This is an iDRAC internal error : {0}	Node	t	527135,https://support.emc.com/kb/527135
VXR500TMP7	0Critical	This is an iDRAC internal error : {0}	Node	t	527137,https://support.emc.com/kb/527137
VXR500TMPS0102	0Critical	This is an iDRAC internal error : {0}	Node	t	527138,https://support.emc.com/kb/527138
VXR500TMPS0103	0Critical	This is an iDRAC internal error : {0}	Node	t	527139,https://support.emc.com/kb/527139
VXR500VDR1	0Critical	This is an iDRAC internal error : {0}	Node	t	527141,https://support.emc.com/kb/527141
VXR500VDR16	0Critical	This is an iDRAC internal error : {0}	Node	t	527142,https://support.emc.com/kb/527142
VXR500VDR17	0Critical	This is an iDRAC internal error : {0}	Node	t	527143,https://support.emc.com/kb/527143
VXR500VDR18	0Critical	This is an iDRAC internal error : {0}	Node	t	527144,https://support.emc.com/kb/527144
VXR500VDR19	0Critical	This is an iDRAC internal error : {0}	Node	t	527145,https://support.emc.com/kb/527145
VXR500VDR20	0Critical	This is an iDRAC internal error : {0}	Node	t	527146,https://support.emc.com/kb/527146
VXR500VDR34	0Critical	This is an iDRAC internal error : {0}	Node	t	527147,https://support.emc.com/kb/527147
VXR500VDR49	0Critical	This is an iDRAC internal error : {0}	Node	t	527148,https://support.emc.com/kb/527148
VXR500VDR50	0Critical	This is an iDRAC internal error : {0}	Node	t	527149,https://support.emc.com/kb/527149
VXR500VDR55	0Critical	This is an iDRAC internal error : {0}	Node	t	527150,https://support.emc.com/kb/527150
VXR500VDR58	0Critical	This is an iDRAC internal error : {0}	Node	t	527151,https://support.emc.com/kb/527151
VXR500VDR7	0Critical	This is an iDRAC internal error : {0}	Node	t	527152,https://support.emc.com/kb/527152
VXR500VDR91	0Critical	This is an iDRAC internal error : {0}	Node	t	527153,https://support.emc.com/kb/527153
VXR500VDR92	0Critical	This is an iDRAC internal error : {0}	Node	t	527154,https://support.emc.com/kb/527154
VXR500VLT0104	0Critical	This is an iDRAC internal error : {0}	Node	t	527155,https://support.emc.com/kb/527155
VXR500VLT0201	0Critical	This is an iDRAC internal error : {0}	Node	t	527156,https://support.emc.com/kb/527156
VXR500VLT0203	0Critical	This is an iDRAC internal error : {0}	Node	t	527157,https://support.emc.com/kb/527157
VXR500VLT0204	0Critical	This is an iDRAC internal error : {0}	Node	t	527158,https://support.emc.com/kb/527158
VXR500VLT0207	0Critical	This is an iDRAC internal error : {0}	Node	t	527159,https://support.emc.com/kb/527159
VXR500VLT0209	0Critical	This is an iDRAC internal error : {0}	Node	t	527160,https://support.emc.com/kb/527160
VXR500VLT0210	0Critical	This is an iDRAC internal error : {0}	Node	t	527161,https://support.emc.com/kb/527161
VXR500VLT0213	0Critical	This is an iDRAC internal error : {0}	Node	t	527162,https://support.emc.com/kb/527162
VXR500VLT0215	0Critical	This is an iDRAC internal error : {0}	Node	t	527163,https://support.emc.com/kb/527163
VXR500VLT0216	0Critical	This is an iDRAC internal error : {0}	Node	t	527164,https://support.emc.com/kb/527164
VXR500VLT0219	0Critical	This is an iDRAC internal error : {0}	Node	t	527165,https://support.emc.com/kb/527165
VXR500VLT0221	0Critical	This is an iDRAC internal error : {0}	Node	t	527166,https://support.emc.com/kb/527166
VXR500VLT0222	0Critical	This is an iDRAC internal error : {0}	Node	t	527167,https://support.emc.com/kb/527167
VXR500VLT0225	0Critical	This is an iDRAC internal error : {0}	Node	t	527168,https://support.emc.com/kb/527168
VXR500VLT0227	0Critical	This is an iDRAC internal error : {0}	Node	t	527169,https://support.emc.com/kb/527169
VXR500VLT0228	0Critical	This is an iDRAC internal error : {0}	Node	t	527170,https://support.emc.com/kb/527170
VXR500VLT0231	0Critical	This is an iDRAC internal error : {0}	Node	t	527171,https://support.emc.com/kb/527171
VXR500VLT0233	0Critical	This is an iDRAC internal error : {0}	Node	t	527172,https://support.emc.com/kb/527172
VXR500VLT0234	0Critical	This is an iDRAC internal error : {0}	Node	t	527173,https://support.emc.com/kb/527173
VXR500VLT0301	0Critical	This is an iDRAC internal error : {0}	Node	t	527174,https://support.emc.com/kb/527174
VXR500VLT0303	0Critical	This is an iDRAC internal error : {0}	Node	t	527175,https://support.emc.com/kb/527175
VXR500VLT0304	0Critical	This is an iDRAC internal error : {0}	Node	t	527176,https://support.emc.com/kb/527176
VXR508MEM0000	2Warning	This is an iDRAC internal warning : {0}	Node	f	524433,https://support.emc.com/kb/524433
VXR508MEM0009	2Warning	This is an iDRAC internal warning : {0}	Node	f	524434,https://support.emc.com/kb/524434
VXR508MEM0022	2Warning	This is an iDRAC internal warning : {0}	Node	f	524435,https://support.emc.com/kb/524435
VXR508MEM0701	2Warning	This is an iDRAC internal warning : {0}	Node	f	524436,https://support.emc.com/kb/524436
VXR508MEM1003	2Warning	This is an iDRAC internal warning : {0}	Node	f	524437,https://support.emc.com/kb/524437
VXR508MEM1012	2Warning	This is an iDRAC internal warning : {0}	Node	f	524438,https://support.emc.com/kb/524438
VXR508MEM1202	2Warning	This is an iDRAC internal warning : {0}	Node	f	524439,https://support.emc.com/kb/524439
VXR508MEM8501	2Warning	This is an iDRAC internal warning : {0}	Node	f	524440,https://support.emc.com/kb/524440
VXR508MEM9002	2Warning	This is an iDRAC internal warning : {0}	Node	f	524441,https://support.emc.com/kb/524441
VXR508MEM9003	2Warning	This is an iDRAC internal warning : {0}	Node	f	524442,https://support.emc.com/kb/524442
VXR508MEM9009	2Warning	This is an iDRAC internal warning : {0}	Node	f	524443,https://support.emc.com/kb/524443
VXR508MEM9011	2Warning	This is an iDRAC internal warning : {0}	Node	f	524444,https://support.emc.com/kb/524444
VXR508MEM9013	2Warning	This is an iDRAC internal warning : {0}	Node	f	524471,https://support.emc.com/kb/524471
VXR508MEM9014	2Warning	This is an iDRAC internal warning : {0}	Node	f	524472,https://support.emc.com/kb/524472
VXR508MEM9016	2Warning	This is an iDRAC internal warning : {0}	Node	f	524473,https://support.emc.com/kb/524473
VXR508AMP0300	2Warning	This is an iDRAC internal warning : {0}	Node	f	527177,https://support.emc.com/kb/527177
VXR508AMP0302	2Warning	This is an iDRAC internal warning : {0}	Node	f	527179,https://support.emc.com/kb/527179
VXR508AMP0306	2Warning	This is an iDRAC internal warning : {0}	Node	f	527180,https://support.emc.com/kb/527180
VXR508AMP0308	2Warning	This is an iDRAC internal warning : {0}	Node	f	527181,https://support.emc.com/kb/527181
VXR508AMP0312	2Warning	This is an iDRAC internal warning : {0}	Node	f	527182,https://support.emc.com/kb/527182
VXR508AMP0314	2Warning	This is an iDRAC internal warning : {0}	Node	f	527183,https://support.emc.com/kb/527183
VXR508AMP0318	2Warning	This is an iDRAC internal warning : {0}	Node	f	527184,https://support.emc.com/kb/527184
VXR508AMP0320	2Warning	This is an iDRAC internal warning : {0}	Node	f	527185,https://support.emc.com/kb/527185
VXR508BAT0005	2Warning	This is an iDRAC internal warning : {0}	Node	f	527186,https://support.emc.com/kb/527186
VXR508BAT0010	2Warning	This is an iDRAC internal warning : {0}	Node	f	527187,https://support.emc.com/kb/527187
VXR508BAT0015	2Warning	This is an iDRAC internal warning : {0}	Node	f	527188,https://support.emc.com/kb/527188
VXR508BAT1000	2Warning	This is an iDRAC internal warning : {0}	Node	f	527189,https://support.emc.com/kb/527189
VXR508BAT1004	2Warning	This is an iDRAC internal warning : {0}	Node	f	527190,https://support.emc.com/kb/527190
VXR508BAT1008	2Warning	This is an iDRAC internal warning : {0}	Node	f	527191,https://support.emc.com/kb/527191
VXR508BAT1010	2Warning	This is an iDRAC internal warning : {0}	Node	f	527192,https://support.emc.com/kb/527192
VXR508BAT1013	2Warning	This is an iDRAC internal warning : {0}	Node	f	527193,https://support.emc.com/kb/527193
VXR508BAT1018	2Warning	This is an iDRAC internal warning : {0}	Node	f	527194,https://support.emc.com/kb/527194
VXR508BAT1021	2Warning	This is an iDRAC internal warning : {0}	Node	f	527196,https://support.emc.com/kb/527196
VXR508BAT1024	2Warning	This is an iDRAC internal warning : {0}	Node	f	527197,https://support.emc.com/kb/527197
VXR508BAT1028	2Warning	This is an iDRAC internal warning : {0}	Node	f	527198,https://support.emc.com/kb/527198
VXR508BAT1031	2Warning	This is an iDRAC internal warning : {0}	Node	f	527199,https://support.emc.com/kb/527199
VXR508BAT1033	2Warning	This is an iDRAC internal warning : {0}	Node	f	527200,https://support.emc.com/kb/527200
VXR508CPU0008	2Warning	This is an iDRAC internal warning : {0}	Node	f	527201,https://support.emc.com/kb/527201
VXR508CPU0010	2Warning	This is an iDRAC internal warning : {0}	Node	f	527202,https://support.emc.com/kb/527202
VXR508CPU0012	2Warning	This is an iDRAC internal warning : {0}	Node	f	527203,https://support.emc.com/kb/527203
VXR508CPU0025	2Warning	This is an iDRAC internal warning : {0}	Node	f	527204,https://support.emc.com/kb/527204
VXR508CPU0802	2Warning	This is an iDRAC internal warning : {0}	Node	f	527205,https://support.emc.com/kb/527205
VXR508CPU0805	2Warning	This is an iDRAC internal warning : {0}	Node	f	527206,https://support.emc.com/kb/527206
VXR508CTL41	2Warning	This is an iDRAC internal warning : {0}	Node	f	527207,https://support.emc.com/kb/527207
VXR508CTL45	2Warning	This is an iDRAC internal warning : {0}	Node	f	527208,https://support.emc.com/kb/527208
VXR508CTL49	2Warning	This is an iDRAC internal warning : {0}	Node	f	527209,https://support.emc.com/kb/527209
VXR508CTL5	2Warning	This is an iDRAC internal warning : {0}	Node	f	527210,https://support.emc.com/kb/527210
VXR508CTL50	2Warning	This is an iDRAC internal warning : {0}	Node	f	527211,https://support.emc.com/kb/527211
VXR508CTL51	2Warning	This is an iDRAC internal warning : {0}	Node	f	527212,https://support.emc.com/kb/527212
VXR508CTL55	2Warning	This is an iDRAC internal warning : {0}	Node	f	527213,https://support.emc.com/kb/527213
VXR508CTL6	2Warning	This is an iDRAC internal warning : {0}	Node	f	527215,https://support.emc.com/kb/527215
VXR508CTL61	2Warning	This is an iDRAC internal warning : {0}	Node	f	527216,https://support.emc.com/kb/527216
VXR508CTL63	2Warning	This is an iDRAC internal warning : {0}	Node	f	527217,https://support.emc.com/kb/527217
VXR508CTL7	2Warning	This is an iDRAC internal warning : {0}	Node	f	527218,https://support.emc.com/kb/527218
VXR508CTL72	2Warning	This is an iDRAC internal warning : {0}	Node	f	527220,https://support.emc.com/kb/527220
VXR508CTL74	2Warning	This is an iDRAC internal warning : {0}	Node	f	527221,https://support.emc.com/kb/527221
VXR508CTL75	2Warning	This is an iDRAC internal warning : {0}	Node	f	527222,https://support.emc.com/kb/527222
VXR508CTL79	2Warning	This is an iDRAC internal warning : {0}	Node	f	527223,https://support.emc.com/kb/527223
VXR508CTL8	2Warning	This is an iDRAC internal warning : {0}	Node	f	527224,https://support.emc.com/kb/527224
VXR508CTL80	2Warning	This is an iDRAC internal warning : {0}	Node	f	527225,https://support.emc.com/kb/527225
VXR508CTL83	2Warning	This is an iDRAC internal warning : {0}	Node	f	527226,https://support.emc.com/kb/527226
VXR508CTL84	2Warning	This is an iDRAC internal warning : {0}	Node	f	527227,https://support.emc.com/kb/527227
VXR508CTL85	2Warning	This is an iDRAC internal warning : {0}	Node	f	527228,https://support.emc.com/kb/527228
VXR508CTL87	2Warning	This is an iDRAC internal warning : {0}	Node	f	527229,https://support.emc.com/kb/527229
VXR508CTL88	2Warning	This is an iDRAC internal warning : {0}	Node	f	527230,https://support.emc.com/kb/527230
VXR508CTL89	2Warning	This is an iDRAC internal warning : {0}	Node	f	527231,https://support.emc.com/kb/527231
VXR508CTL9	2Warning	This is an iDRAC internal warning : {0}	Node	f	527232,https://support.emc.com/kb/527232
VXR508CTL91	2Warning	This is an iDRAC internal warning : {0}	Node	f	527233,https://support.emc.com/kb/527233
VXR508CTL92	2Warning	This is an iDRAC internal warning : {0}	Node	f	527234,https://support.emc.com/kb/527234
VXR508CTL95	2Warning	This is an iDRAC internal warning : {0}	Node	f	527235,https://support.emc.com/kb/527235
VXR508FAN0000	2Warning	This is an iDRAC internal warning : {0}	Node	f	527236,https://support.emc.com/kb/527236
VXR508FAN0002	2Warning	This is an iDRAC internal warning : {0}	Node	f	527237,https://support.emc.com/kb/527237
VXR508FAN0010	2Warning	This is an iDRAC internal warning : {0}	Node	f	527238,https://support.emc.com/kb/527238
VXR508FC102	2Warning	This is an iDRAC internal warning : {0}	Node	f	527239,https://support.emc.com/kb/527239
VXR508IOV105	2Warning	This is an iDRAC internal warning : {0}	Node	f	527240,https://support.emc.com/kb/527240
VXR508IOV106	2Warning	This is an iDRAC internal warning : {0}	Node	f	527241,https://support.emc.com/kb/527241
VXR508IOV108	2Warning	This is an iDRAC internal warning : {0}	Node	f	527242,https://support.emc.com/kb/527242
VXR508IOV116	2Warning	This is an iDRAC internal warning : {0}	Node	f	527244,https://support.emc.com/kb/527244
VXR508LNK8500	2Warning	This is an iDRAC internal warning : {0}	Node	f	527245,https://support.emc.com/kb/527245
VXR508MEM1206	2Warning	This is an iDRAC internal warning : {0}	Node	f	527246,https://support.emc.com/kb/527246
VXR508MEM1214	2Warning	This is an iDRAC internal warning : {0}	Node	f	527247,https://support.emc.com/kb/527247
VXR508NIC100	2Warning	This is an iDRAC internal warning : {0}	Node	f	527248,https://support.emc.com/kb/527248
VXR508PCI1322	2Warning	This is an iDRAC internal warning : {0}	Node	f	527249,https://support.emc.com/kb/527249
VXR508PCI1362	2Warning	This is an iDRAC internal warning : {0}	Node	f	527250,https://support.emc.com/kb/527250
VXR508PCI3008	2Warning	This is an iDRAC internal warning : {0}	Node	f	527251,https://support.emc.com/kb/527251
VXR508PCI3010	2Warning	This is an iDRAC internal warning : {0}	Node	f	527252,https://support.emc.com/kb/527252
VXR508PCI3012	2Warning	This is an iDRAC internal warning : {0}	Node	f	527253,https://support.emc.com/kb/527253
VXR508PCI3014	2Warning	This is an iDRAC internal warning : {0}	Node	f	527254,https://support.emc.com/kb/527254
VXR508PCI3019	2Warning	This is an iDRAC internal warning : {0}	Node	f	527255,https://support.emc.com/kb/527255
VXR508PDR1	2Warning	This is an iDRAC internal warning : {0}	Node	f	527256,https://support.emc.com/kb/527256
VXR508PDR100	2Warning	This is an iDRAC internal warning : {0}	Node	f	527257,https://support.emc.com/kb/527257
VXR508PDR1002	2Warning	This is an iDRAC internal warning : {0}	Node	f	527258,https://support.emc.com/kb/527258
VXR508PDR101	2Warning	This is an iDRAC internal warning : {0}	Node	f	527259,https://support.emc.com/kb/527259
VXR508PDR1102	2Warning	This is an iDRAC internal warning : {0}	Node	f	527260,https://support.emc.com/kb/527260
VXR508PDR112	2Warning	This is an iDRAC internal warning : {0}	Node	f	527261,https://support.emc.com/kb/527261
VXR508PDR113	2Warning	This is an iDRAC internal warning : {0}	Node	f	527262,https://support.emc.com/kb/527262
VXR508PDR116	2Warning	This is an iDRAC internal warning : {0}	Node	f	527263,https://support.emc.com/kb/527263
VXR508PDR16	2Warning	This is an iDRAC internal warning : {0}	Node	f	527264,https://support.emc.com/kb/527264
VXR508PDR19	2Warning	This is an iDRAC internal warning : {0}	Node	f	527265,https://support.emc.com/kb/527265
VXR508PDR2	2Warning	This is an iDRAC internal warning : {0}	Node	f	527266,https://support.emc.com/kb/527266
VXR508PDR21	2Warning	This is an iDRAC internal warning : {0}	Node	f	527267,https://support.emc.com/kb/527267
VXR508PDR22	2Warning	This is an iDRAC internal warning : {0}	Node	f	527268,https://support.emc.com/kb/527268
VXR508PDR23	2Warning	This is an iDRAC internal warning : {0}	Node	f	527269,https://support.emc.com/kb/527269
VXR508PDR24	2Warning	This is an iDRAC internal warning : {0}	Node	f	527270,https://support.emc.com/kb/527270
VXR508PDR30	2Warning	This is an iDRAC internal warning : {0}	Node	f	527271,https://support.emc.com/kb/527271
VXR508PDR32	2Warning	This is an iDRAC internal warning : {0}	Node	f	527272,https://support.emc.com/kb/527272
VXR508PDR35	2Warning	This is an iDRAC internal warning : {0}	Node	f	527275,https://support.emc.com/kb/527275
VXR508PDR36	2Warning	This is an iDRAC internal warning : {0}	Node	f	527276,https://support.emc.com/kb/527276
VXR508PDR37	2Warning	This is an iDRAC internal warning : {0}	Node	f	527277,https://support.emc.com/kb/527277
VXR508PDR49	2Warning	This is an iDRAC internal warning : {0}	Node	f	527278,https://support.emc.com/kb/527278
VXR508PDR5	2Warning	This is an iDRAC internal warning : {0}	Node	f	527279,https://support.emc.com/kb/527279
VXR508PDR50	2Warning	This is an iDRAC internal warning : {0}	Node	f	527280,https://support.emc.com/kb/527280
VXR508PDR52	2Warning	This is an iDRAC internal warning : {0}	Node	f	527281,https://support.emc.com/kb/527281
VXR508PDR55	2Warning	This is an iDRAC internal warning : {0}	Node	f	527283,https://support.emc.com/kb/527283
VXR508PDR56	2Warning	This is an iDRAC internal warning : {0}	Node	f	527284,https://support.emc.com/kb/527284
VXR508PDR58	2Warning	This is an iDRAC internal warning : {0}	Node	f	527285,https://support.emc.com/kb/527285
VXR508PDR6	2Warning	This is an iDRAC internal warning : {0}	Node	f	527286,https://support.emc.com/kb/527286
VXR508PDR60	2Warning	This is an iDRAC internal warning : {0}	Node	f	527287,https://support.emc.com/kb/527287
VXR508PDR67	2Warning	This is an iDRAC internal warning : {0}	Node	f	527288,https://support.emc.com/kb/527288
VXR508PDR69	2Warning	This is an iDRAC internal warning : {0}	Node	f	527289,https://support.emc.com/kb/527289
VXR508PDR7	2Warning	This is an iDRAC internal warning : {0}	Node	f	527290,https://support.emc.com/kb/527290
VXR508PDR75	2Warning	This is an iDRAC internal warning : {0}	Node	f	527291,https://support.emc.com/kb/527291
VXR508PDR76	2Warning	This is an iDRAC internal warning : {0}	Node	f	527292,https://support.emc.com/kb/527292
VXR508PDR86	2Warning	This is an iDRAC internal warning : {0}	Node	f	527293,https://support.emc.com/kb/527293
VXR508PDR95	2Warning	This is an iDRAC internal warning : {0}	Node	f	527294,https://support.emc.com/kb/527294
VXR508PDR98	2Warning	This is an iDRAC internal warning : {0}	Node	f	527296,https://support.emc.com/kb/527296
VXR508PFM0002	2Warning	This is an iDRAC internal warning : {0}	Node	f	527297,https://support.emc.com/kb/527297
VXR508PSU0002	2Warning	This is an iDRAC internal warning : {0}	Node	f	527298,https://support.emc.com/kb/527298
VXR508PSU0005	2Warning	This is an iDRAC internal warning : {0}	Node	f	527299,https://support.emc.com/kb/527299
VXR508PSU0032	2Warning	This is an iDRAC internal warning : {0}	Node	f	527300,https://support.emc.com/kb/527300
VXR508PSU0044	2Warning	This is an iDRAC internal warning : {0}	Node	f	527301,https://support.emc.com/kb/527301
VXR508PSU0091	2Warning	This is an iDRAC internal warning : {0}	Node	f	527302,https://support.emc.com/kb/527302
VXR508PSU1000	2Warning	This is an iDRAC internal warning : {0}	Node	f	527303,https://support.emc.com/kb/527303
VXR508PSU1003	2Warning	This is an iDRAC internal warning : {0}	Node	f	527304,https://support.emc.com/kb/527304
VXR508PWR1001	2Warning	This is an iDRAC internal warning : {0}	Node	f	527305,https://support.emc.com/kb/527305
VXR508PWR1002	2Warning	This is an iDRAC internal warning : {0}	Node	f	527307,https://support.emc.com/kb/527307
VXR508PWR1003	2Warning	This is an iDRAC internal warning : {0}	Node	f	527308,https://support.emc.com/kb/527308
VXR508PWR1004	2Warning	This is an iDRAC internal warning : {0}	Node	f	527309,https://support.emc.com/kb/527309
VXR508PWR1005	2Warning	This is an iDRAC internal warning : {0}	Node	f	527318,https://support.emc.com/kb/527318
VXR508PWR1007	2Warning	This is an iDRAC internal warning : {0}	Node	f	527319,https://support.emc.com/kb/527319
VXR508PWR8557	2Warning	This is an iDRAC internal warning : {0}	Node	f	527320,https://support.emc.com/kb/527320
VXR508RDU0003	2Warning	This is an iDRAC internal warning : {0}	Node	f	527321,https://support.emc.com/kb/527321
VXR508RDU0013	2Warning	This is an iDRAC internal warning : {0}	Node	f	527322,https://support.emc.com/kb/527322
VXR508RDU0017	2Warning	This is an iDRAC internal warning : {0}	Node	f	527323,https://support.emc.com/kb/527323
VXR508RDU0018	2Warning	This is an iDRAC internal warning : {0}	Node	f	527324,https://support.emc.com/kb/527324
VXR508RDU0032	2Warning	This is an iDRAC internal warning : {0}	Node	f	527325,https://support.emc.com/kb/527325
VXR508STOR1	2Warning	This is an iDRAC internal warning : {0}	Node	f	527326,https://support.emc.com/kb/527326
VXR508STOR13	2Warning	This is an iDRAC internal warning : {0}	Node	f	527327,https://support.emc.com/kb/527327
VXR508STOR17	2Warning	This is an iDRAC internal warning : {0}	Node	f	527328,https://support.emc.com/kb/527328
VXR508STOR18	2Warning	This is an iDRAC internal warning : {0}	Node	f	527329,https://support.emc.com/kb/527329
VXR508STOR5	2Warning	This is an iDRAC internal warning : {0}	Node	f	527330,https://support.emc.com/kb/527330
VXR508STOR8	2Warning	This is an iDRAC internal warning : {0}	Node	f	527331,https://support.emc.com/kb/527331
VXR508STOR9	2Warning	This is an iDRAC internal warning : {0}	Node	f	527332,https://support.emc.com/kb/527332
VXR508SWC4004	2Warning	This is an iDRAC internal warning : {0}	Node	f	527333,https://support.emc.com/kb/527333
VXR508SWC4006	2Warning	This is an iDRAC internal warning : {0}	Node	f	527334,https://support.emc.com/kb/527334
VXR508SWC4008	2Warning	This is an iDRAC internal warning : {0}	Node	f	527335,https://support.emc.com/kb/527335
VXR508TMP0100	2Warning	This is an iDRAC internal warning : {0}	Node	f	527336,https://support.emc.com/kb/527336
VXR508TMP0102	2Warning	This is an iDRAC internal warning : {0}	Node	f	527337,https://support.emc.com/kb/527337
VXR508TMP0106	2Warning	This is an iDRAC internal warning : {0}	Node	f	527338,https://support.emc.com/kb/527338
VXR508TMP0108	2Warning	This is an iDRAC internal warning : {0}	Node	f	527339,https://support.emc.com/kb/527339
VXR508TMP0112	2Warning	This is an iDRAC internal warning : {0}	Node	f	527340,https://support.emc.com/kb/527340
VXR508TMP0114	2Warning	This is an iDRAC internal warning : {0}	Node	f	527341,https://support.emc.com/kb/527341
VXR508TMP0118	2Warning	This is an iDRAC internal warning : {0}	Node	f	527342,https://support.emc.com/kb/527342
VXR508TMP0120	2Warning	This is an iDRAC internal warning : {0}	Node	f	527343,https://support.emc.com/kb/527343
VXR508TMP0124	2Warning	This is an iDRAC internal warning : {0}	Node	f	527344,https://support.emc.com/kb/527344
VXR508TMP0126	2Warning	This is an iDRAC internal warning : {0}	Node	f	527345,https://support.emc.com/kb/527345
VXR508TMP0130	2Warning	This is an iDRAC internal warning : {0}	Node	f	527346,https://support.emc.com/kb/527346
VXR508TMP0132	2Warning	This is an iDRAC internal warning : {0}	Node	f	527347,https://support.emc.com/kb/527347
VXR508TMP0200	2Warning	This is an iDRAC internal warning : {0}	Node	f	527348,https://support.emc.com/kb/527348
VXR508TMP0202	2Warning	This is an iDRAC internal warning : {0}	Node	f	527349,https://support.emc.com/kb/527349
VXR508TMP1000	2Warning	This is an iDRAC internal warning : {0}	Node	f	527350,https://support.emc.com/kb/527350
VXR508TMP1001	2Warning	This is an iDRAC internal warning : {0}	Node	f	527351,https://support.emc.com/kb/527351
VXR508TMPS0100	2Warning	This is an iDRAC internal warning : {0}	Node	f	527352,https://support.emc.com/kb/527352
VXR508TMPS0101	2Warning	This is an iDRAC internal warning : {0}	Node	f	527353,https://support.emc.com/kb/527353
VXR508VDR100	2Warning	This is an iDRAC internal warning : {0}	Node	f	527354,https://support.emc.com/kb/527354
VXR508VDR31	2Warning	This is an iDRAC internal warning : {0}	Node	f	527355,https://support.emc.com/kb/527355
VXR508VDR52	2Warning	This is an iDRAC internal warning : {0}	Node	f	527356,https://support.emc.com/kb/527356
VXR508VDR53	2Warning	This is an iDRAC internal warning : {0}	Node	f	527357,https://support.emc.com/kb/527357
VXR508VDR54	2Warning	This is an iDRAC internal warning : {0}	Node	f	527358,https://support.emc.com/kb/527358
VXR508VDR8	2Warning	This is an iDRAC internal warning : {0}	Node	f	527359,https://support.emc.com/kb/527359
VXR508VDR99	2Warning	This is an iDRAC internal warning : {0}	Node	f	527360,https://support.emc.com/kb/527360
VXR508VLT0200	2Warning	This is an iDRAC internal warning : {0}	Node	f	527361,https://support.emc.com/kb/527361
VXR508VLT0202	2Warning	This is an iDRAC internal warning : {0}	Node	f	527362,https://support.emc.com/kb/527362
VXR508VLT0206	2Warning	This is an iDRAC internal warning : {0}	Node	f	527363,https://support.emc.com/kb/527363
VXR508VLT0208	2Warning	This is an iDRAC internal warning : {0}	Node	f	527364,https://support.emc.com/kb/527364
VXR508VLT0212	2Warning	This is an iDRAC internal warning : {0}	Node	f	527365,https://support.emc.com/kb/527365
VXR508VLT0214	2Warning	This is an iDRAC internal warning : {0}	Node	f	527366,https://support.emc.com/kb/527366
VXR508VLT0218	2Warning	This is an iDRAC internal warning : {0}	Node	f	527367,https://support.emc.com/kb/527367
VXR508VLT0220	2Warning	This is an iDRAC internal warning : {0}	Node	f	527368,https://support.emc.com/kb/527368
VXR508VLT0224	2Warning	This is an iDRAC internal warning : {0}	Node	f	527369,https://support.emc.com/kb/527369
VXR508VLT0226	2Warning	This is an iDRAC internal warning : {0}	Node	f	527370,https://support.emc.com/kb/527370
VXR508VLT0230	2Warning	This is an iDRAC internal warning : {0}	Node	f	527371,https://support.emc.com/kb/527371
VXR508VLT0232	2Warning	This is an iDRAC internal warning : {0}	Node	f	527372,https://support.emc.com/kb/527372
VXR508VLT0300	2Warning	This is an iDRAC internal warning : {0}	Node	f	527374,https://support.emc.com/kb/527374
VXR508VLT0302	2Warning	This is an iDRAC internal warning : {0}	Node	f	527375,https://support.emc.com/kb/527375
VXR50CCPU0000	3Info	This is an iDRAC internal info : {0}	Node	f	527376,https://support.emc.com/kb/527376
VXR230001	0Critical	Proactive health Check Failed - report ID : critical	MysticManager	t	521650,https://support.emc.com/kb/521650
VXR234001	1Error	Proactive health Check got errors - report ID : error	MysticManager	t	521650,https://support.emc.com/kb/521650
VXR23C001	3Info	Proactive health Check Passed - report ID : info	MysticManager	f	521650,https://support.emc.com/kb/521650
VXR23C012	3Info	Node {0} upgrade operation has started	Node	t	524428,https://support.emc.com/kb/524428
VXR23C013	3Info	Node {0} upgrade operation was successful	Node	t	524429,https://support.emc.com/kb/524429
VXR230011	0Critical	Node {0} upgrade operation failed	Node	t	524430,https://support.emc.com/kb/524430
VXR038014	2Warning	Failed to upgrade internal ESRS. Detail reason: {0}	Esrs	t	525681,https://support.emc.com/kb/525681
VXR104201	1Error	 Failed to change ESXi hostname	Node	t	
VXR104202	1Error	 Failed to change ESXi management IP	Node	t	
\.


--
-- Data for Name: evo_rail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evo_rail (cluster_id) FROM stdin;
5240b1df-a89c-146f-f63c-8c1fcb58cd7f
\.


--
-- Data for Name: instance_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instance_property (id, prop_key, prop_value, user_configurable, instance_id) FROM stdin;
\.


--
-- Name: instance_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instance_property_id_seq', 1, false);


--
-- Data for Name: log_bundle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_bundle (id, file_size, types, nodes, file_absolute_path, creation_time, details) FROM stdin;
\.


--
-- Data for Name: log_insight; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_insight (cluster_id) FROM stdin;
\.


--
-- Data for Name: management_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.management_account (id, component, component_id, host, username, password, status) FROM stdin;
1	PSC	\N	192.168.104.202	vcmanager@localos	c2e051d098f852816e82f6ceb975402f	OK
3	ESXi	\N	engdell4-02.localdomain.local	esxmanager	a664f3824d818ae68586c862d359417e	OK
4	ESXi	\N	engdell4-03.localdomain.local	esxmanager	a664f3824d818ae68586c862d359417e	OK
5	ESXi	\N	engdell4-04.localdomain.local	esxmanager	a664f3824d818ae68586c862d359417e	OK
2	ESXi	\N	engdell4-01.localdomain.local	esxmanager	a664f3824d818ae68586c862d359417e	OK
\.


--
-- Name: management_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.management_account_id_seq', 5, true);


--
-- Data for Name: market_appliance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.market_appliance (component, title, description, learn_more, icon, category, app_type, total_size, primary_link, secondary_link, current_version, publish_date, instance_count, primary_checksum, secondary_checksum) FROM stdin;
\.


--
-- Data for Name: market_instance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.market_instance (id, vm_id, vm_name, current_version, install_time, status, ip, vm_console, vm_network, component) FROM stdin;
\.


--
-- Name: market_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.market_instance_id_seq', 1, false);


--
-- Data for Name: market_queue; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.market_queue (id, instance_id) FROM stdin;
\.


--
-- Name: market_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.market_queue_id_seq', 1, false);


--
-- Data for Name: mystic_cluster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mystic_cluster (cluster_id, product_type, device_type, connected, health_state, operational_status) FROM stdin;
5240b1df-a89c-146f-f63c-8c1fcb58cd7f	VSPEXPLUS	VSPEXBLUE	t	Critical	ok
\.


--
-- Data for Name: mystic_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mystic_event (id, event_time, appliance_id, node_psnt, component_id, esx_host, params, unread, reported, posted, state, code, sub_component) FROM stdin;
22	2018-12-06 19:10:54.26+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
2	2018-12-06 14:43:59.302+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC11C001	\N
21	2018-12-06 19:10:53.084+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
20	2018-12-06 19:10:51.495+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
19	2018-12-06 19:10:50.322+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
4	2018-12-06 14:44:15.578+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	f	FALSE_POSITIVE	MYSTIC010011	\N
6	2018-12-06 14:44:21.771+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	f	FALSE_POSITIVE	MYSTIC010011	\N
8	2018-12-06 14:44:27.948+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	f	FALSE_POSITIVE	MYSTIC010011	\N
9	2018-12-06 14:45:06.906+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
7	2018-12-06 14:44:21.821+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC018016	\N
5	2018-12-06 14:44:15.638+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC018016	\N
3	2018-12-06 14:44:09.422+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC018016	\N
1	2018-12-06 14:40:58.832+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
23	2018-12-07 00:12:36.603294+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
11	2018-12-06 16:25:26.236+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	f	FALSE_POSITIVE	MYSTIC010011	\N
10	2018-12-06 16:25:20.117+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC018016	\N
12	2018-12-06 16:49:35.696+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
124	2018-12-15 00:16:10.97006+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
13	2018-12-06 17:32:27.21+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
140	2018-12-16 19:04:32.918+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
17	2018-12-06 18:36:10.446+00	18Z6BC20000000	\N	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
16	2018-12-06 18:35:53.445+00	HLLFBD20000000	\N	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
15	2018-12-06 18:34:48.439+00	1914BC20000000	\N	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
18	2018-12-06 18:34:42.438+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC014014	\N
14	2018-12-06 18:34:42.438+00	18Y4BC20000000	\N	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
141	2018-12-16 20:21:24.336+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
146	2018-12-17 00:16:11.281083+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
24	2018-12-07 14:43:56.255+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
25	2018-12-07 17:32:54.212+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
151	2018-12-17 19:04:38.59+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
152	2018-12-17 20:24:28.873+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
153	2018-12-18 00:16:06.41121+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
157	2018-12-18 00:21:28.188+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
156	2018-12-18 00:21:27.039+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
155	2018-12-18 00:21:25.904+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
154	2018-12-18 00:21:24.741+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
158	2018-12-18 15:07:43.664+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
29	2018-12-07 18:36:53.013+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
28	2018-12-07 18:36:51.867+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
27	2018-12-07 18:36:50.755+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
26	2018-12-07 18:36:49.611+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
45	2018-12-09 00:12:35.873868+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
51	2018-12-09 18:42:08.147+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
50	2018-12-09 18:42:06.876+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
49	2018-12-09 18:42:05.761+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
48	2018-12-09 18:42:04.611+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
125	2018-12-15 15:02:36.757+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
55	2018-12-09 20:48:03.096+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
54	2018-12-09 20:48:01.954+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
53	2018-12-09 20:48:00.824+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
52	2018-12-09 20:47:59.664+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
56	2018-12-10 00:12:38.325831+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
57	2018-12-10 13:44:05.076+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
59	2018-12-10 14:09:33.282+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01new.localdomain.local	\N	f	f	f	TRUE_POSITIVE	MYSTIC018016	\N
60	2018-12-10 14:39:01.727+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	\N	\N	f	f	t	TRUE_POSITIVE	VXR104202	\N
61	2018-12-10 14:52:14.045+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
145	2018-12-16 23:47:12.821+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
144	2018-12-16 23:47:11.653+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
62	2018-12-10 16:35:10.964+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
143	2018-12-16 23:47:10.518+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
142	2018-12-16 23:47:09.368+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
147	2018-12-17 15:07:42.913+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
58	2018-12-10 13:59:47.754+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	\N	\N	f	f	t	TRUE_POSITIVE	VXR104201	\N
150	2018-12-17 18:58:26.824+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
149	2018-12-17 18:58:25.671+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
148	2018-12-17 18:58:24.55+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
161	2018-12-18 19:00:21.953+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
160	2018-12-18 19:00:20.808+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
159	2018-12-18 19:00:19.684+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
162	2018-12-18 19:06:33.864+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
33	2018-12-07 19:42:02.941+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
32	2018-12-07 19:42:01.794+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
31	2018-12-07 19:42:00.653+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
30	2018-12-07 19:41:59.518+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
34	2018-12-08 00:12:39.127421+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
35	2018-12-08 14:46:23.859+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
128	2018-12-15 18:56:59.503+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
36	2018-12-08 17:35:18.815+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
127	2018-12-15 18:56:58.339+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
126	2018-12-15 18:56:57.203+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
40	2018-12-08 18:39:24.389+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
39	2018-12-08 18:39:23.231+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
38	2018-12-08 18:39:22.115+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
37	2018-12-08 18:39:20.99+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
129	2018-12-15 19:02:04.208+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
130	2018-12-15 20:19:20.579+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
44	2018-12-08 20:15:07.213+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
43	2018-12-08 20:15:06.068+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
42	2018-12-08 20:15:04.904+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
41	2018-12-08 20:15:03.741+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
46	2018-12-09 14:50:59.934+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
47	2018-12-09 17:37:37.493+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
134	2018-12-15 23:15:04.806+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
133	2018-12-15 23:15:03.648+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
132	2018-12-15 23:15:02.514+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
131	2018-12-15 23:15:01.371+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
136	2018-12-16 15:05:41.36+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
139	2018-12-16 18:58:21.191+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
138	2018-12-16 18:58:20.038+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
137	2018-12-16 18:58:18.922+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
87	2018-12-12 17:32:39.376+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
86	2018-12-12 14:53:17.06+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
85	2018-12-12 00:19:31.243971+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
84	2018-12-11 21:27:10.955+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
83	2018-12-11 21:27:09.68+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
82	2018-12-11 21:27:08.533+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
81	2018-12-11 21:23:54.251+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
80	2018-12-11 20:13:01.027+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
79	2018-12-11 18:46:24.492+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
78	2018-12-11 18:46:23.33+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
77	2018-12-11 18:46:22.198+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
76	2018-12-11 17:59:58.01+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
75	2018-12-11 14:52:58.334+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
74	2018-12-11 00:19:29.435644+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
73	2018-12-10 20:51:49.458+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
72	2018-12-10 20:51:48.271+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
71	2018-12-10 20:51:47.116+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
70	2018-12-10 20:48:37.716+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
69	2018-12-10 20:11:40.746+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC014014	\N
68	2018-12-10 20:11:40.746+00	18Y4BC20000000	\N	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
67	2018-12-10 18:44:56.57+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
66	2018-12-10 18:44:55.405+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
65	2018-12-10 18:44:54.237+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
64	2018-12-10 18:44:53.09+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
63	2018-12-10 17:58:29.602+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
88	2018-12-12 18:01:22.84+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
94	2018-12-12 20:35:41.096+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
91	2018-12-12 18:49:31.747+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
90	2018-12-12 18:49:30.487+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
89	2018-12-12 18:49:29.308+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
104	2018-12-13 18:52:15.102+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
92	2018-12-12 19:21:14.858+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
101	2018-12-13 13:37:14.096+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
93	2018-12-12 20:14:12.171+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
102	2018-12-13 14:57:48.632+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
98	2018-12-12 21:47:39.391+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
97	2018-12-12 21:47:38.216+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
96	2018-12-12 21:47:37.022+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
95	2018-12-12 21:47:35.831+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
99	2018-12-13 00:14:04.75436+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
100	2018-12-13 10:28:04.556+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
103	2018-12-13 15:25:53.155+00	\N	\N	\N	\N	\N	f	t	t	TRUE_POSITIVE	MYSTIC1000	\N
106	2018-12-13 18:52:17.416+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
105	2018-12-13 18:52:16.246+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
107	2018-12-13 18:58:35.656+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
108	2018-12-13 20:15:14.594+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
112	2018-12-13 22:08:48.862+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
111	2018-12-13 22:08:47.716+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
110	2018-12-13 22:08:46.582+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
109	2018-12-13 22:08:45.425+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
113	2018-12-14 00:16:11.090047+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
114	2018-12-14 15:00:03.275+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
117	2018-12-14 18:54:00.445+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
116	2018-12-14 18:53:59.175+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
115	2018-12-14 18:53:58.037+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
118	2018-12-14 19:00:20.124+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
119	2018-12-14 20:19:18.012+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
123	2018-12-14 22:41:46.57+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
122	2018-12-14 22:41:45.389+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
121	2018-12-14 22:41:44.217+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
120	2018-12-14 22:41:43.077+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
135	2018-12-16 00:16:13.957604+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
163	2018-12-18 20:26:52.536+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
164	2018-12-19 00:16:13.841273+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
168	2018-12-19 00:54:03.389+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
167	2018-12-19 00:54:02.244+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
166	2018-12-19 00:54:01.076+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
165	2018-12-19 00:53:59.93+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
169	2018-12-19 15:10:18.117+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
172	2018-12-19 19:00:27.692+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
171	2018-12-19 19:00:26.434+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
170	2018-12-19 19:00:25.305+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
173	2018-12-19 19:06:44.53+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
174	2018-12-19 20:29:37.134+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
175	2018-12-20 00:16:10.098172+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
179	2018-12-20 01:27:57.84+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
178	2018-12-20 01:27:56.685+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
177	2018-12-20 01:27:55.503+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
176	2018-12-20 01:27:54.361+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
180	2018-12-20 15:10:21.724+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
181	2018-12-20 15:29:15.603+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC134001	\N
184	2018-12-20 19:00:38.452+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
183	2018-12-20 19:00:37.294+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
182	2018-12-20 19:00:36.169+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
185	2018-12-20 19:06:53.173+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
186	2018-12-20 20:30:04.506+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
187	2018-12-21 00:16:10.854749+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
191	2018-12-21 02:02:08.893+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
190	2018-12-21 02:02:07.747+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
189	2018-12-21 02:02:06.616+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
188	2018-12-21 02:02:05.474+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
192	2018-12-21 15:13:02.147+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC12C003	\N
195	2018-12-21 19:00:45.432+00	18Z6BC20000000	18Z6BC20000000	PH1629861N00CG	engdell4-04.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
194	2018-12-21 19:00:44.283+00	1914BC20000000	1914BC20000000	PH1629861N00DH	engdell4-02.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
193	2018-12-21 19:00:43.163+00	HLLFBD20000000	HLLFBD20000000	PH1629861N00BP	engdell4-03.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
196	2018-12-21 19:06:57.225+00	\N	\N	\N	\N	\N	f	f	t	TRUE_POSITIVE	MYSTIC014000	\N
197	2018-12-21 20:31:43.041+00	18Y4BC20000000	18Y4BC20000000	PH1629861N00C2	engdell4-01.localdomain.local	\N	t	f	t	TRUE_POSITIVE	MYSTIC010011	\N
198	2018-12-22 00:16:11.585615+00	\N	\N	\N	\N	\N	t	f	t	TRUE_POSITIVE	VXR23C001	\N
202	2018-12-22 02:34:46.234+00	18Z6BC20000000	18Z6BC20000000	18Z6BC2	engdell4-04.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
201	2018-12-22 02:34:45.084+00	1914BC20000000	1914BC20000000	1914BC2	engdell4-02.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
200	2018-12-22 02:34:43.912+00	HLLFBD20000000	HLLFBD20000000	HLLFBD2	engdell4-03.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
199	2018-12-22 02:34:42.76+00	18Y4BC20000000	18Y4BC20000000	18Y4BC2	engdell4-01.localdomain.local	\N	f	f	t	TRUE_POSITIVE	MYSTIC014016	\N
\.


--
-- Name: mystic_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mystic_event_id_seq', 202, true);


--
-- Data for Name: mystic_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mystic_manager (cluster_id) FROM stdin;
5240b1df-a89c-146f-f63c-8c1fcb58cd7f
\.


--
-- Data for Name: mystic_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mystic_task (id, name, target, success, begin_time, end_time, message) FROM stdin;
\.


--
-- Name: mystic_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mystic_task_id_seq', 1, false);


--
-- Data for Name: nic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nic (mac, link_status, link_speed, slot, node_sn, firmware_family_version) FROM stdin;
EC:F4:BB:F0:DE:78	Up	10 Gbps	1	18Y4BC2	18.8.9
EC:F4:BB:F0:DE:7A	Up	10 Gbps	2	18Y4BC2	18.8.9
EC:F4:BB:F0:DE:7C	Up	1000 Mbps	3	18Y4BC2	18.8.9
EC:F4:BB:F0:DE:7D	Up	1000 Mbps	4	18Y4BC2	18.8.9
EC:F4:BB:F0:E4:78	Up	10 Gbps	1	HLLFBD2	18.8.9
EC:F4:BB:F0:E4:7A	Up	10 Gbps	2	HLLFBD2	18.8.9
EC:F4:BB:F0:E4:7C	Up	1000 Mbps	3	HLLFBD2	18.8.9
EC:F4:BB:F0:E4:7D	Up	1000 Mbps	4	HLLFBD2	18.8.9
EC:F4:BB:F0:E7:C0	Up	10 Gbps	1	1914BC2	18.8.9
EC:F4:BB:F0:E7:C2	Up	10 Gbps	2	1914BC2	18.8.9
EC:F4:BB:F0:E7:C4	Up	1000 Mbps	3	1914BC2	18.8.9
EC:F4:BB:F0:E7:C5	Up	1000 Mbps	4	1914BC2	18.8.9
EC:F4:BB:F0:E4:70	Up	10 Gbps	1	18Z6BC2	18.8.9
EC:F4:BB:F0:E4:72	Up	10 Gbps	2	18Z6BC2	18.8.9
EC:F4:BB:F0:E4:74	Up	1000 Mbps	3	18Z6BC2	18.8.9
EC:F4:BB:F0:E4:75	Up	1000 Mbps	4	18Z6BC2	18.8.9
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.node (sn, slot, part_number, asset_tag, name, psnt, manufacturer, node_version, bios_fw_revision, bmc_fw_revision, me_fw_revision, diskctrl_fw_version, expander_bp_fw_version, non_expander_bp_fw_version, boss_fw_version, cpld_fw_version, system_status_led, health, missing, appliance_id, tpm, operational_status) FROM stdin;
18Z6BC2	1	\N	\N	engdell4-04	18Z6BC20000000	Dell Inc.	\N	2.8.0	2.61.60.60	\N	16.17.00.03	3.03	2.25	\N	1.0.1		Error	f	18Z6BC20000000	f	NORMAL
1914BC2	1	\N	\N	engdell4-02	1914BC20000000	Dell Inc.	\N	2.8.0	2.61.60.60	\N	16.17.00.03	3.03	2.25	\N	1.0.1		Error	f	1914BC20000000	f	NORMAL
HLLFBD2	1	\N	\N	engdell4-03	HLLFBD20000000	Dell Inc.	\N	2.8.0	2.61.60.60	\N	16.17.00.03	3.03	2.25	\N	1.0.1		Error	f	HLLFBD20000000	f	NORMAL
18Y4BC2	1	\N	\N	engdell4-01	18Y4BC20000000	Dell Inc.	\N	2.8.0	2.61.60.60	\N	16.17.00.03	3.03	2.25	\N	1.0.1		Error	f	18Y4BC20000000	f	NORMAL
\.


--
-- Data for Name: node_level_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.node_level_version (id, node_sn, component, current_version, baseline, is_drifted, is_supported, incompatibilities) FROM stdin;
1	18Y4BC2	VMware ESXi	6.7.0-10764712	6.7.0-10764712	f	t	
2	18Y4BC2	VxRail VIB	4.7.100-11125601	4.7.100-11125601	f	t	
3	18Y4BC2	Dell PtAgent	1.8.3-8	1.8.3-8	f	t	
4	18Y4BC2	HBA Driver	17.00.01.00-1OEM.670.0.0.8169922	17.00.01.00-1OEM.670.0.0.8169922	f	t	
5	18Y4BC2	NIC Driver igbn	1.4.7-1OEM.670.0.0.8169922	1.4.7-1OEM.670.0.0.8169922	f	t	
6	18Y4BC2	NIC Driver ixgben	1.7.10-1OEM.670.0.0.8169922	1.7.10-1OEM.670.0.0.8169922	f	t	
7	HLLFBD2	VMware ESXi	6.7.0-10764712	6.7.0-10764712	f	t	
8	HLLFBD2	VxRail VIB	4.7.100-11125601	4.7.100-11125601	f	t	
11	HLLFBD2	NIC Driver igbn	1.4.7-1OEM.670.0.0.8169922	1.4.7-1OEM.670.0.0.8169922	f	t	
12	HLLFBD2	NIC Driver i40en	1.7.11-1OEM.670.0.0.8169922	1.7.11-1OEM.670.0.0.8169922	f	t	
13	HLLFBD2	NIC Driver ixgben	1.7.10-1OEM.670.0.0.8169922	1.7.10-1OEM.670.0.0.8169922	f	t	
14	1914BC2	VMware ESXi	6.7.0-10764712	6.7.0-10764712	f	t	
17	1914BC2	HBA Driver	17.00.01.00-1OEM.670.0.0.8169922	17.00.01.00-1OEM.670.0.0.8169922	f	t	
18	1914BC2	NIC Driver igbn	1.4.7-1OEM.670.0.0.8169922	1.4.7-1OEM.670.0.0.8169922	f	t	
19	1914BC2	NIC Driver ixgben	1.7.10-1OEM.670.0.0.8169922	1.7.10-1OEM.670.0.0.8169922	f	t	
20	18Z6BC2	VMware ESXi	6.7.0-10764712	6.7.0-10764712	f	t	
21	18Z6BC2	VxRail VIB	4.7.100-11125601	4.7.100-11125601	f	t	
22	18Z6BC2	Dell PtAgent	1.8.3-8	1.8.3-8	f	t	
23	18Z6BC2	HBA Driver	17.00.01.00-1OEM.670.0.0.8169922	17.00.01.00-1OEM.670.0.0.8169922	f	t	
24	18Z6BC2	NIC Driver igbn	1.4.7-1OEM.670.0.0.8169922	1.4.7-1OEM.670.0.0.8169922	f	t	
25	18Z6BC2	NIC Driver ixgben	1.7.10-1OEM.670.0.0.8169922	1.7.10-1OEM.670.0.0.8169922	f	t	
26	HLLFBD2	HBA Driver	17.00.01.00-1OEM.670.0.0.8169922	17.00.01.00-1OEM.670.0.0.8169922	f	t	
9	HLLFBD2	Dell PtAgent	1.8.3-8	1.8.3-8	f	t	
27	1914BC2	Dell PtAgent	1.8.3-8	1.8.3-8	f	t	
15	1914BC2	VxRail VIB	4.7.100-11125601	4.7.100-11125601	f	t	
\.


--
-- Name: node_level_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.node_level_version_id_seq', 27, true);


--
-- Data for Name: operation_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation_lock (operation_type, start_time) FROM stdin;
\.


--
-- Data for Name: operation_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.operation_status (id, owner, state, error, progress, starttime, endtime, target, step, detail, extension) FROM stdin;
SBI_7	ChangeEsxiHostname	ABANDONED	\N	100	1544449985510	\N	\N	HostMaintenanceStatePrechecker	\N	{"objectClass":"com.emc.mystic.manager.operation.core.ProcedureProgress","objectString":"{\\"detailedProgress\\":[{\\"step\\":\\"HostnameChangeConditionPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VcAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"bundle\\":\\"Day2OperationMessage\\",\\"key\\":\\"PrecheckVsanHealthNotReady\\",\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"FAILED\\",\\"errorCode\\":\\"PrecheckVsanHealthNotReady\\",\\"placeHolderValues\\":[],\\"estimation\\":1},{\\"step\\":\\"VxMmonitorMutePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostNumberPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"DrsCapabilityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostShouldNotInAnyUserDirectoryPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceStatePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1}],\\"requestParameters\\":{\\"serial_number\\":\\"18Y4BC2\\",\\"moref_id\\":null,\\"hostname\\":\\"engdell4-01new.localdomain.local\\",\\"original_hostname\\":\\"engdell4-01.localdomain.local\\",\\"management_network\\":null,\\"esxi_root_user\\":{\\"username\\":\\"root\\",\\"password\\":null},\\"vc_admin_user\\":{\\"username\\":\\"administrator@vsphere.local\\",\\"password\\":null}},\\"overallState\\":\\"PRECHECK_FAIL\\",\\"overallKb\\":null}"}
SBI_8	ChangeEsxiHostname	COMPLETED	\N	100	1544450277709	\N	\N	VsanHealthPostchecker	\N	{"objectClass":"com.emc.mystic.manager.operation.core.ProcedureProgress","objectString":"{\\"detailedProgress\\":[{\\"step\\":\\"HostnameChangeConditionPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VcAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxMmonitorMutePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostNumberPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"DrsCapabilityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostShouldNotInAnyUserDirectoryPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceStatePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostnameValidator\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostnameResolveValidator\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxmHealthMonitorDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceEnterStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":40},{\\"step\\":\\"HostSshServiceEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostLeaveFromClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostnameUpdateAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostSslThumbprintGenerationAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostdRestartAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostVpxaRestartAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostJoinToClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20},{\\"step\\":\\"HostConnectToDvsAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostSshServiceDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceExitStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20},{\\"step\\":\\"VxmHealthMonitorEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPostchecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20}],\\"requestParameters\\":{\\"serial_number\\":\\"18Y4BC2\\",\\"moref_id\\":null,\\"hostname\\":\\"engdell4-01new.localdomain.local\\",\\"original_hostname\\":\\"engdell4-01.localdomain.local\\",\\"management_network\\":null,\\"esxi_root_user\\":{\\"username\\":\\"root\\",\\"password\\":null},\\"vc_admin_user\\":{\\"username\\":\\"administrator@vsphere.local\\",\\"password\\":null}},\\"overallState\\":\\"COMPLETED\\",\\"overallKb\\":null}"}
SBI_9	ChangeEsxiHostname	COMPLETED	\N	100	1544451018015	\N	\N	VsanHealthPostchecker	\N	{"objectClass":"com.emc.mystic.manager.operation.core.ProcedureProgress","objectString":"{\\"detailedProgress\\":[{\\"step\\":\\"HostnameChangeConditionPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VcAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxMmonitorMutePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostNumberPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"DrsCapabilityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostShouldNotInAnyUserDirectoryPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceStatePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostnameValidator\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostnameResolveValidator\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxmHealthMonitorDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceEnterStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":40},{\\"step\\":\\"HostSshServiceEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostLeaveFromClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostnameUpdateAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostSslThumbprintGenerationAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostHostdRestartAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostVpxaRestartAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostJoinToClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20},{\\"step\\":\\"HostConnectToDvsAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostSshServiceDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceExitStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20},{\\"step\\":\\"VxmHealthMonitorEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPostchecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20}],\\"requestParameters\\":{\\"serial_number\\":\\"18Y4BC2\\",\\"moref_id\\":null,\\"hostname\\":\\"engdell4-01.localdomain.local\\",\\"original_hostname\\":\\"engdell4-01new.localdomain.local\\",\\"management_network\\":null,\\"esxi_root_user\\":{\\"username\\":\\"root\\",\\"password\\":null},\\"vc_admin_user\\":{\\"username\\":\\"administrator@vsphere.local\\",\\"password\\":null}},\\"overallState\\":\\"COMPLETED\\",\\"overallKb\\":null}"}
SBI_10	ChangeEsxiIp	COMPLETED	\N	100	1544451926588	\N	\N	VsanHealthPostchecker	\N	{"objectClass":"com.emc.mystic.manager.operation.core.ProcedureProgress","objectString":"{\\"detailedProgress\\":[{\\"step\\":\\"HostIpChangeConditionPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VcAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxMmonitorMutePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostNumberPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"DrsCapabilityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostShouldNotInAnyUserDirectoryPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceStatePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostManagementIpValidator\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxmHealthMonitorDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceEnterStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":40},{\\"step\\":\\"HostSshServiceEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostLeaveFromClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostManagementIpResolveAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostManagementIpUpdateAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostJoinToClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostConnectToDvsAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostSshServiceDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceExitStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20},{\\"step\\":\\"VxmHealthMonitorEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPostchecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20}],\\"requestParameters\\":{\\"serial_number\\":\\"18Y4BC2\\",\\"moref_id\\":null,\\"hostname\\":null,\\"original_hostname\\":\\"engdell4-01.localdomain.local\\",\\"management_network\\":{\\"ipv4\\":\\"192.168.104.215\\",\\"netmask\\":null,\\"gateway\\":null},\\"esxi_root_user\\":{\\"username\\":\\"root\\",\\"password\\":null},\\"vc_admin_user\\":{\\"username\\":\\"administrator@vsphere.local\\",\\"password\\":null}},\\"overallState\\":\\"COMPLETED\\",\\"overallKb\\":null}"}
SBI_11	ChangeEsxiIp	COMPLETED	\N	100	1544452455101	\N	\N	VsanHealthPostchecker	\N	{"objectClass":"com.emc.mystic.manager.operation.core.ProcedureProgress","objectString":"{\\"detailedProgress\\":[{\\"step\\":\\"HostIpChangeConditionPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VcAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostAccountConnectivityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxMmonitorMutePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostNumberPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"DrsCapabilityPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostShouldNotInAnyUserDirectoryPrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceStatePrechecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostManagementIpValidator\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostOperationStatusStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VxmHealthMonitorDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceEnterStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":40},{\\"step\\":\\"HostSshServiceEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostLeaveFromClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostManagementIpResolveAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostManagementIpUpdateAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostJoinToClusterAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostConnectToDvsAction\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostSshServiceDisableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"HostMaintenanceExitStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20},{\\"step\\":\\"VxmHealthMonitorEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"ClusterHaCapabilityEnableStateUpdater\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":1},{\\"step\\":\\"VsanHealthPostchecker\\",\\"stepDesc\\":{\\"__LocalizableMessage__\\":true},\\"description\\":{\\"__LocalizableMessage__\\":true},\\"exitCode\\":\\"COMPLETED\\",\\"estimation\\":20}],\\"requestParameters\\":{\\"serial_number\\":\\"18Y4BC2\\",\\"moref_id\\":null,\\"hostname\\":null,\\"original_hostname\\":\\"engdell4-01.localdomain.local\\",\\"management_network\\":{\\"ipv4\\":\\"192.168.104.211\\",\\"netmask\\":null,\\"gateway\\":null},\\"esxi_root_user\\":{\\"username\\":\\"root\\",\\"password\\":null},\\"vc_admin_user\\":{\\"username\\":\\"administrator@vsphere.local\\",\\"password\\":null}},\\"overallState\\":\\"COMPLETED\\",\\"overallKb\\":null}"}
\.


--
-- Data for Name: power_supply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.power_supply (sn, part_number, revision_number, name, manufacturer, slot, health, missing, appliance_id) FROM stdin;
PH1629861N00CF	00XW8WA01	00.11.3F	Power Supply 1	Dell	1	Healthy	f	18Y4BC20000000
PH1629861N00C2	00XW8WA01	00.11.3F	Power Supply 2	Dell	2	Critical	t	18Y4BC20000000
PH1629861N00FG	00XW8WA01	00.11.3F	Power Supply 1	Dell	1	Healthy	f	HLLFBD20000000
PH1629861N00BP	00XW8WA01	00.11.3F	Power Supply 2	Dell	2	Critical	t	HLLFBD20000000
PH1629861N00BR	00XW8WA01	00.11.3F	Power Supply 1	Dell	1	Healthy	f	1914BC20000000
PH1629861N00DH	00XW8WA01	00.11.3F	Power Supply 2	Dell	2	Critical	t	1914BC20000000
CN7161557105CD	0953MXA00	00.24.41	Power Supply 1	Dell	1	Healthy	f	18Z6BC20000000
PH1629861N00CG	00XW8WA01	00.11.3F	Power Supply 2	Dell	2	Critical	t	18Z6BC20000000
\.


--
-- Data for Name: sata_dom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sata_dom (node_sn, sn, device_model, sata_type, power_on_hours, power_cycle_count, max_erase_count, avr_erase_count, block_size, capacity, health, firmware_version) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, vcenter_ip, psc_ip, management_user, management_password, cluster_name, init_status, dhcp, ip, netmask, gateway, dns, db_version, support_user, support_password, cluster_mor, sso_tenant, platform) FROM stdin;
MysticManager	192.168.104.201	192.168.104.202	vcmanager@localos	c2e051d098f852816e82f6ceb975402f	\N	Initialized	t	192.168.104.203	255.255.255.0	192.168.104.156	192.168.104.156	37	\N	\N	domain-c8	vsphere.local	VXRAIL
\.


--
-- Data for Name: syr_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.syr_configuration (event_id, filename, content) FROM stdin;
9	VXRAIL_1544107506906_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-06Z</Date><Time>14:45:06.788Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile></SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile></SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile></SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList></Cluster></MYSTICSYR>
12	VXRAIL_1544114975696_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-06Z</Date><Time>16:49:34.996Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34631260831744</FreeCapacity><UsedCapacity>1375748489216</UsedCapacity><ProvisionedCapacity>1375748489216</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
57	VXRAIL_1544449445076_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-10Z</Date><Time>13:44:04.879Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34601649045504</FreeCapacity><UsedCapacity>1405360275456</UsedCapacity><ProvisionedCapacity>1439250251776</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
62	VXRAIL_1544459710964_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-10Z</Date><Time>16:35:10.689Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34600751464448</FreeCapacity><UsedCapacity>1406257856512</UsedCapacity><ProvisionedCapacity>1433986400256</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
87	VXRAIL_1544635959376_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-12Z</Date><Time>17:32:39.084Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34599048577024</FreeCapacity><UsedCapacity>1407960743936</UsedCapacity><ProvisionedCapacity>1435689287680</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
92	VXRAIL_1544642474858_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-12Z</Date><Time>19:21:14.607Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34597983223808</FreeCapacity><UsedCapacity>1409026097152</UsedCapacity><ProvisionedCapacity>1436754640896</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
94	VXRAIL_1544646941096_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-12Z</Date><Time>20:35:40.598Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34596896899072</FreeCapacity><UsedCapacity>1410112421888</UsedCapacity><ProvisionedCapacity>1437840965632</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
100	VXRAIL_1544696884556_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-13Z</Date><Time>10:28:04.386Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34596896899072</FreeCapacity><UsedCapacity>1410112421888</UsedCapacity><ProvisionedCapacity>1437840965632</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
101	VXRAIL_1544708234096_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-13Z</Date><Time>13:37:13.686Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34596896899072</FreeCapacity><UsedCapacity>1410112421888</UsedCapacity><ProvisionedCapacity>1437840965632</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
103	VXRAIL_1544714753156_Config.xml	<?xml version="1.0" encoding="UTF-8" standalone="yes"?><MYSTICSYR><CSISiteID>0</CSISiteID><Date>2018-12-13Z</Date><Time>15:25:52.803Z</Time><Version><ProductVersion>4.7.100-11125602</ProductVersion><MysticManagerVersion>4.7.100-11125601</MysticManagerVersion><vCenterVersion>6.7.0 build-10244857</vCenterVersion><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>1914BC20000000</PSNT><NodeList><Node><SerialNumber>1914BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><BIOSFWRevison>2.8.0</BIOSFWRevison><BMCFWRevision>2.61.60.60</BMCFWRevision><ESXVersion>6.7.0 build-10764712</ESXVersion></Node></NodeList></Appliance></ApplianceList></Version><License><vCenterLicense>4H4KJ-DZ11N-N82Y8-013UH-0XUMP</vCenterLicense><VSANLicense>00000-00000-00000-00000-00000</VSANLicense><ESXLicense>00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 00000-00000-00000-00000-00000 </ESXLicense><vCenterLicenseType>Standard</vCenterLicenseType><VSANLicenseType>Evaluation</VSANLicenseType><ESXLicenseType>Evaluation Evaluation Evaluation Evaluation </ESXLicenseType></License><Cluster><ClusterID>5240b1df-a89c-146f-f63c-8c1fcb58cd7f</ClusterID><connected>true</connected><operational-status>ok</operational-status><health-state>Critical</health-state><ApplianceList><Appliance><PSNT>18Y4BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Y4BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00CF</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00C2</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Y4BC2</SerialNumber><Name>engdell4-01</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01FTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01RL4</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03KAS</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A073TG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>HLLFBD20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>HLLFBD2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00FG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00BP</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>HLLFBD2</SerialNumber><Name>engdell4-03</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LDR</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QQA</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A04JTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX05SVB192Y</Model><SerialNumber>3750A0ZBTEYE</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>1914BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>1914BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>PH1629861N00BR</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00DH</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>1914BC2</SerialNumber><Name>engdell4-02</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PDD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01PSL</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A00UTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07BTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance><Appliance><PSNT>18Z6BC20000000</PSNT><Model>VxRail S470</Model><Chassis><SerialNumber>18Z6BC2</SerialNumber><PartNumber>VxRail S470</PartNumber><Description>Main System Chassis</Description><PowerSupplyList><PowerSupply><Name>Power Supply 1</Name><SerialNumber>CN7161557105CD</SerialNumber><PartNumber>0953MXA00</PartNumber><RevisionNumber>00.24.41</RevisionNumber><Description></Description><Slot>1</Slot></PowerSupply><PowerSupply><Name>Power Supply 2</Name><SerialNumber>PH1629861N00CG</SerialNumber><PartNumber>00XW8WA01</PartNumber><RevisionNumber>00.11.3F</RevisionNumber><Description></Description><Slot>2</Slot></PowerSupply></PowerSupplyList><NodeList><Node><SerialNumber>18Z6BC2</SerialNumber><Name>engdell4-04</Name><Manufacturer>Dell Inc.</Manufacturer><Description></Description><SoftwareProfile> ata-libata-92 3.00.9.2-16vmw.670.0.0.8169922, ata-pata-amd 0.3.10-3vmw.670.0.0.8169922, ata-pata-atiixp 0.4.6-4vmw.670.0.0.8169922, ata-pata-cmd64x 0.2.5-3vmw.670.0.0.8169922, ata-pata-hpt3x2n 0.3.4-3vmw.670.0.0.8169922, ata-pata-pdc2027x 1.0-3vmw.670.0.0.8169922, ata-pata-serverworks 0.4.3-3vmw.670.0.0.8169922, ata-pata-sil680 0.4.8-3vmw.670.0.0.8169922, ata-pata-via 0.3.3-2vmw.670.0.0.8169922, block-cciss 3.6.14-10vmw.670.0.0.8169922, bnxtnet 212.0.119.0-1OEM.670.0.0.8169922, bnxtroce 212.0.114.0-1OEM.670.0.0.8169922, brcmfcoe 11.4.1078.5-11vmw.670.1.28.10302608, char-random 1.0-3vmw.670.0.0.8169922, cpu-microcode 6.7.0-1.28.10302608, dcism 3.3.0.ESXi6-1290, dellptagent 1.8.3-8, ehci-ehci-hcd 1.0-4vmw.670.0.0.8169922, elx-esx-libelxima.so 11.4.1184.0-0.0.8169922, elxiscsi 11.4.1174.0-2vmw.670.0.0.8169922, elxnet 11.4.1095.0-5vmw.670.1.28.10302608, esx-base 6.7.0-1.31.10764712, esx-dvfilter-generic-fastpath 6.7.0-0.0.8169922, esx-ui 1.30.0-9946814, esx-update 6.7.0-1.31.10764712, esx-xserver 6.7.0-0.0.8169922, hid-hid 1.0-3vmw.670.0.0.8169922, i40en 1.7.11-1OEM.670.0.0.8169922, iavmd 1.2.0.1011-2vmw.670.0.0.8169922, igbn 1.4.7-1OEM.670.0.0.8169922, ima-qla4xxx 2.02.18-1vmw.670.0.0.8169922, ipmi-ipmi-devintf 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-msghandler 39.1-5vmw.670.1.28.10302608, ipmi-ipmi-si-drv 39.1-5vmw.670.1.28.10302608, iser 1.0.0.0-1vmw.670.1.28.10302608, ixgben 1.7.10-1OEM.670.0.0.8169922, lpfc 11.4.33.3-11vmw.670.1.28.10302608, lpnic 11.4.59.0-1vmw.670.0.0.8169922, lsi-mr3 7.702.13.00-5vmw.670.1.28.10302608, lsi-msgpt2 20.00.04.00-5vmw.670.1.28.10302608, lsi-msgpt3 17.00.01.00-1OEM.670.0.0.8169922, lsi-msgpt35 03.00.01.00-12vmw.670.1.28.10302608, lsu-hp-hpsa-plugin 2.0.0-16vmw.670.1.28.10302608, lsu-intel-vmd-plugin 1.0.0-2vmw.670.1.28.10302608, lsu-lsi-lsi-mr3-plugin 1.0.0-13vmw.670.1.28.10302608, lsu-lsi-megaraid-sas-plugin 1.0.0-9vmw.670.0.0.8169922, lsu-lsi-mpt2sas-plugin 2.0.0-7vmw.670.0.0.8169922, lsu-smartpqi-plugin 1.0.0-3vmw.670.1.28.10302608, misc-cnic-register 1.78.75.v60.7-1vmw.670.0.0.8169922, misc-drivers 6.7.0-0.0.8169922, mtip32xx-native 3.9.8-1vmw.670.1.28.10302608, native-misc-drivers 6.7.0-0.0.8169922, ne1000 0.8.4-1vmw.670.1.28.10302608, nenic 1.0.21.0-1vmw.670.1.28.10302608, net-bnx2 2.2.4f.v60.10-2vmw.670.0.0.8169922, net-bnx2x 1.78.80.v60.12-2vmw.670.0.0.8169922, net-cdc-ether 1.0-3vmw.670.0.0.8169922, net-cnic 1.78.76.v60.13-2vmw.670.0.0.8169922, net-e1000 8.0.3.1-5vmw.670.0.0.8169922, net-e1000e 3.2.2.1-2vmw.670.0.0.8169922, net-enic 2.1.2.38-2vmw.670.0.0.8169922, net-fcoe 1.0.29.9.3-7vmw.670.0.0.8169922, net-forcedeth 0.61-2vmw.670.0.0.8169922, net-igb 5.0.5.1.1-5vmw.670.0.0.8169922, net-ixgbe 3.7.13.7.14iov-20vmw.670.0.0.8169922, net-libfcoe-92 1.0.24.9.4-8vmw.670.0.0.8169922, net-mlx4-core 1.9.7.0-1vmw.670.0.0.8169922, net-mlx4-en 1.9.7.0-1vmw.670.0.0.8169922, net-nx-nic 5.0.621-5vmw.670.0.0.8169922, net-tg3 3.131d.v60.4-2vmw.670.0.0.8169922, net-usbnet 1.0-3vmw.670.0.0.8169922, net-vmxnet3 1.1.3.0-3vmw.670.0.0.8169922, nfnic 4.0.0.14-0vmw.670.1.28.10302608, nhpsa 2.0.22-3vmw.670.1.28.10302608, nmlx4-core 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-en 3.17.9.12-1vmw.670.0.0.8169922, nmlx4-rdma 3.17.9.12-1vmw.670.0.0.8169922, nmlx5-core 4.17.9.12-1vmw.670.0.0.8169922, nmlx5-rdma 4.17.9.12-1vmw.670.0.0.8169922, ntg3 4.1.3.2-1vmw.670.1.28.10302608, nvme 1.2.2.17-1vmw.670.1.28.10302608, nvmxnet3 2.0.0.29-1vmw.670.1.28.10302608, nvmxnet3-ens 2.0.0.21-1vmw.670.0.0.8169922, ohci-usb-ohci 1.0-3vmw.670.0.0.8169922, platform-service 4.7.100-11125601, pvscsi 0.1-2vmw.670.0.0.8169922, qcnic 1.0.2.0.4-1vmw.670.0.0.8169922, qedentv 2.0.6.4-10vmw.670.1.28.10302608, qfle3 1.0.50.11-9vmw.670.0.0.8169922, qfle3f 1.0.25.0.2-14vmw.670.0.0.8169922, qfle3i 1.0.2.3.9-3vmw.670.0.0.8169922, qflge 1.1.0.11-1vmw.670.0.0.8169922, qlnativefc 3.0.1.0-5vmw.670.0.0.8169922, rste 2.0.2.0088-7vmw.670.0.0.8169922, sata-ahci 3.0-26vmw.670.0.0.8169922, sata-ata-piix 2.12-10vmw.670.0.0.8169922, sata-sata-nv 3.5-4vmw.670.0.0.8169922, sata-sata-promise 2.12-3vmw.670.0.0.8169922, sata-sata-sil 2.3-4vmw.670.0.0.8169922, sata-sata-sil24 1.1-1vmw.670.0.0.8169922, sata-sata-svw 2.3-3vmw.670.0.0.8169922, scsi-aacraid 1.1.5.1-9vmw.670.0.0.8169922, scsi-adp94xx 1.0.8.12-6vmw.670.0.0.8169922, scsi-aic79xx 3.1-6vmw.670.0.0.8169922, scsi-bnx2fc 1.78.78.v60.8-1vmw.670.0.0.8169922, scsi-bnx2i 2.78.76.v60.8-1vmw.670.0.0.8169922, scsi-fnic 1.5.0.45-3vmw.670.0.0.8169922, scsi-hpsa 6.0.0.84-3vmw.670.0.0.8169922, scsi-ips 7.12.05-4vmw.670.0.0.8169922, scsi-iscsi-linux-92 1.0.0.2-3vmw.670.0.0.8169922, scsi-libfc-92 1.0.40.9.3-5vmw.670.0.0.8169922, scsi-megaraid-mbox 2.20.5.1-6vmw.670.0.0.8169922, scsi-megaraid-sas 6.603.55.00-2vmw.670.0.0.8169922, scsi-megaraid2 2.00.4-9vmw.670.0.0.8169922, scsi-mpt2sas 19.00.00.00-2vmw.670.0.0.8169922, scsi-mptsas 4.23.01.00-10vmw.670.0.0.8169922, scsi-mptspi 4.23.01.00-10vmw.670.0.0.8169922, scsi-qla4xxx 5.01.03.2-7vmw.670.0.0.8169922, shim-iscsi-linux-9-2-1-0 6.7.0-0.0.8169922, shim-iscsi-linux-9-2-2-0 6.7.0-0.0.8169922, shim-libata-9-2-1-0 6.7.0-0.0.8169922, shim-libata-9-2-2-0 6.7.0-0.0.8169922, shim-libfc-9-2-1-0 6.7.0-0.0.8169922, shim-libfc-9-2-2-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-1-0 6.7.0-0.0.8169922, shim-libfcoe-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-1-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-2-0 6.7.0-0.0.8169922, shim-vmklinux-9-2-3-0 6.7.0-0.0.8169922, smartpqi 1.0.1.553-12vmw.670.1.28.10302608, tools-light 10.3.2.9925305-10176879, uhci-usb-uhci 1.0-3vmw.670.0.0.8169922, usb-storage-usb-storage 1.0-3vmw.670.0.0.8169922, usbcore-usb 1.0-3vmw.670.0.0.8169922, vmkata 0.1-1vmw.670.0.0.8169922, vmkfcoe 1.0.0.1-1vmw.670.1.28.10302608, vmkplexer-vmkplexer 6.7.0-0.0.8169922, vmkusb 0.1-1vmw.670.1.28.10302608, vmw-ahci 1.2.3-1vmw.670.1.28.10302608, vmware-esx-esxcli-nvme-plugin 1.2.0.34-1.28.10302608, vmware-fdm 6.7.0-10244745, vmware-marvin 4.7.100-11125601, vsan 6.7.0-1.31.10720746, vsanhealth 6.7.0-1.31.10720754, xhci-xhci 1.0-3vmw.670.0.0.8169922</SoftwareProfile><Slot>1</Slot><DiskList><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01DBD</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>0</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C01QKN</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>6</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>ST4000NM0005</Model><SerialNumber>Z4C03LHB</SerialNumber><Type>HDD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>1</Slot><Manufacturer>SEAGATE</Manufacturer></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26G0A07ZTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>12</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk><Disk><Model>PX04SRB192</Model><SerialNumber>26E0A01QTG3D</SerialNumber><Type>SSD</Type><Protocol>SCSI</Protocol><Enclosure>0</Enclosure><Slot>13</Slot><Manufacturer>TOSHIBA</Manufacturer><WriteEndurance>0</WriteEndurance><writeEnduranceStatus>Healthy</writeEnduranceStatus></Disk></DiskList></Node></NodeList></Chassis></Appliance></ApplianceList><DatastoreList><Datastore><DatastoreName>HLLFBD20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>VxRail-Virtual-SAN-Datastore-41452a2e-4417-401d-abb3-a69011a7230f</DatastoreName><TotalCapacity>36007009320960</TotalCapacity><FreeCapacity>34596028678144</FreeCapacity><UsedCapacity>1410980642816</UsedCapacity><ProvisionedCapacity>1438709186560</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Y4BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>1914BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore><Datastore><DatastoreName>18Z6BC20000000-01-01-service-datastore1</DatastoreName><TotalCapacity>55834574848</TotalCapacity><FreeCapacity>38749077504</FreeCapacity><UsedCapacity>17085497344</UsedCapacity><ProvisionedCapacity>17085497344</ProvisionedCapacity></Datastore></DatastoreList></Cluster></MYSTICSYR>
\.


--
-- Data for Name: vcenter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vcenter (cluster_id, uuid) FROM stdin;
5240b1df-a89c-146f-f63c-8c1fcb58cd7f	9c4786f6-fb0f-4307-90ec-31480902706f
\.


--
-- Data for Name: virtual_appliance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.virtual_appliance (id, component, component_id, ip, license, current_version, description, install_time, upgrade_version, upgrade_status, upgrade_description, upgrade_filepath, upgrade_filepath_bkp, upgrade_icon, upgrade_publish_date, upgrade_type, upgrade_title, upgrade_additional_info, cluster_id, upgrade_status_response, checksum, baseline, is_same_version, is_supported, is_drifted, incompatibilities) FROM stdin;
1	VXRAIL	VXRAIL_SYSTEM	\N	\N	4.7.100-11125602	\N	2018-12-06 14:44:09.319+00	\N	LATEST	A hyper-converged infrastructure appliance that combines VMware compute, networking and storage into one single system for ease of deployment and management.	\N	\N	images/app/app_vc.png	\N	\N	VxRail	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f		\N	\N	t	t	f	\N
2	Vcenter	\N	\N	\N	6.7.0-10244857	\N	2018-12-06 14:44:09.324+00	\N	LATEST	Centralized visibility, proactive management and extensibility for VMware vSphere from a single console VMware vCenter Server provides a centralized platform for managing your VMware vSphere environments, so you can automate and deliver a virtual infrastructure with confidence.	\N	\N	images/app/app_mystic.png	\N	\N	VMware vCenter Server Appliance	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f	\N	\N	6.7.0-10244857	t	t	f	
3	MysticManager	\N	192.168.104.203	\N	4.7.100-11125601	\N	2018-12-06 14:44:09.357+00	\N	LATEST	The management component that orchestrates the deployment and management of VxRail system.	\N	\N	images/app/app_vc.png	\N	\N	VxRail Manager	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f	\N	\N	4.7.100-11125601	t	t	f	
4	Esx	\N	\N	\N	6.7.0-10764712	\N	2018-12-06 14:44:09.381+00	\N	LATEST	VMware ESXi is the industry-leading, purpose-built bare-metal hypervisor. ESXi installs directly onto your physical server enabling it to be partitioned into multiple logical servers referred to as virtual machines.	\N	\N	images/app/app_esxi.png	\N	\N	VMware ESXi	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f	\N	\N	6.7.0-10764712	t	t	f	\N
6	DellPTAgent	\N	\N	\N	1.8.3-8	\N	2018-12-06 14:44:09.384+00	\N	LATEST	Dell PTAgent installed on ESXi	\N	\N	images/app/app_dellptagent.png	\N	\N	Dell PTAgent	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f	\N	\N	1.8.3-8	t	t	f	\N
5	VxRailVib	\N	\N	\N	4.7.100-11125601	\N	2018-12-06 14:44:09.384+00	\N	LATEST	VxRail Manager agent installed on ESXi.	\N	\N	images/app/app_evo.png	\N	\N	VxRail Manager VIB	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f	\N	\N	4.7.100-11125601	t	t	f	\N
\.


--
-- Name: virtual_appliance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.virtual_appliance_id_seq', 6, true);


--
-- Data for Name: virtual_infrastructure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.virtual_infrastructure (id, component, component_id, ip, license, current_version, upgrade_version, upgrade_filepath, cluster_id) FROM stdin;
2	Vcenter	\N	192.168.104.201	ed827d6951f6f89d48ae87ed5b707597e8c3d00d90d17d895c904013ea5bc761	6.7.0 build-10244857	\N	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
4	Esx	4c4c4544-004c-4c10-8046-c8c04f424432	engdell4-03.localdomain.local	0ffea4a655f0c4b98fd09505b5b0bc47788a81529e41e3b9867d68af840476db	6.7.0 build-10764712	\N	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
5	Esx	4c4c4544-0039-3110-8034-b1c04f424332	engdell4-02.localdomain.local	0ffea4a655f0c4b98fd09505b5b0bc47788a81529e41e3b9867d68af840476db	6.7.0 build-10764712	\N	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
6	Vsan	\N	\N	0ffea4a655f0c4b98fd09505b5b0bc47788a81529e41e3b9867d68af840476db	\N	\N	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
7	Esx	4c4c4544-0038-5a10-8036-b1c04f424332	engdell4-04.localdomain.local	0ffea4a655f0c4b98fd09505b5b0bc47788a81529e41e3b9867d68af840476db	6.7.0 build-10764712	\N	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
1	EvoRail	\N	192.168.104.203	\N	4.7.100-SNAPSHOT	\N	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
3	Esx	4c4c4544-0038-5910-8034-b1c04f424332	engdell4-01.localdomain.local	0ffea4a655f0c4b98fd09505b5b0bc47788a81529e41e3b9867d68af840476db	6.7.0 build-10764712	\N	\N	5240b1df-a89c-146f-f63c-8c1fcb58cd7f
\.


--
-- Name: virtual_infrastructure_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.virtual_infrastructure_id_seq', 7, true);


--
-- Data for Name: vsan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vsan (uuid, enabled, policy) FROM stdin;
5240b1df-a89c-146f-f63c-8c1fcb58cd7f	t	\N
\.


--
-- Data for Name: vsan_disk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vsan_disk (uuid, device, display_name, is_ssd, is_offline, status, disk_sn, group_uuid) FROM stdin;
\.


--
-- Data for Name: vsan_disk_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vsan_disk_group (uuid, name, group_state, health, esx_uuid, vsan_uuid) FROM stdin;
\.


--
-- Name: appliance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.appliance
    ADD CONSTRAINT appliance_pkey PRIMARY KEY (id);


--
-- Name: board_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.board
    ADD CONSTRAINT board_pkey PRIMARY KEY (node_sn);


--
-- Name: boot_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.boot_device
    ADD CONSTRAINT boot_device_pkey PRIMARY KEY (sn);


--
-- Name: chassis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.chassis
    ADD CONSTRAINT chassis_pkey PRIMARY KEY (appliance_id);


--
-- Name: composite_upgrade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.composite_upgrade
    ADD CONSTRAINT composite_upgrade_pkey PRIMARY KEY (composite_upgrade_id);


--
-- Name: configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (key, category);


--
-- Name: connect_home_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.connect_home_message
    ADD CONSTRAINT connect_home_message_pkey PRIMARY KEY (event_id);


--
-- Name: dimm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dimm
    ADD CONSTRAINT dimm_pkey PRIMARY KEY (sn);


--
-- Name: disk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.disk
    ADD CONSTRAINT disk_pkey PRIMARY KEY (sn);


--
-- Name: esrs_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.esrs_contact
    ADD CONSTRAINT esrs_contact_pkey PRIMARY KEY (id);


--
-- Name: esrs_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.esrs_email
    ADD CONSTRAINT esrs_email_pkey PRIMARY KEY (cluster_id);


--
-- Name: esrs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.esrs
    ADD CONSTRAINT esrs_pkey PRIMARY KEY (cluster_id);


--
-- Name: esrs_proxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.esrs_proxy
    ADD CONSTRAINT esrs_proxy_pkey PRIMARY KEY (cluster_id);


--
-- Name: esx_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.esx
    ADD CONSTRAINT esx_pkey PRIMARY KEY (uuid);


--
-- Name: event_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.event_code
    ADD CONSTRAINT event_code_pkey PRIMARY KEY (code);


--
-- Name: evo_rail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.evo_rail
    ADD CONSTRAINT evo_rail_pkey PRIMARY KEY (cluster_id);


--
-- Name: instance_property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.instance_property
    ADD CONSTRAINT instance_property_pkey PRIMARY KEY (id);


--
-- Name: log_bundle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.log_bundle
    ADD CONSTRAINT log_bundle_pkey PRIMARY KEY (id);


--
-- Name: log_insight_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.log_insight
    ADD CONSTRAINT log_insight_pkey PRIMARY KEY (cluster_id);


--
-- Name: management_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.management_account
    ADD CONSTRAINT management_account_pkey PRIMARY KEY (id);


--
-- Name: market_appliance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.market_appliance
    ADD CONSTRAINT market_appliance_pkey PRIMARY KEY (component);


--
-- Name: market_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.market_instance
    ADD CONSTRAINT market_instance_pkey PRIMARY KEY (id);


--
-- Name: market_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.market_queue
    ADD CONSTRAINT market_queue_pkey PRIMARY KEY (id);


--
-- Name: mystic_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.mystic_cluster
    ADD CONSTRAINT mystic_cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: mystic_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.mystic_event
    ADD CONSTRAINT mystic_event_pkey PRIMARY KEY (id);


--
-- Name: mystic_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.mystic_manager
    ADD CONSTRAINT mystic_manager_pkey PRIMARY KEY (cluster_id);


--
-- Name: mystic_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.mystic_task
    ADD CONSTRAINT mystic_task_pkey PRIMARY KEY (id);


--
-- Name: nic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.nic
    ADD CONSTRAINT nic_pkey PRIMARY KEY (mac);


--
-- Name: node_level_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.node_level_version
    ADD CONSTRAINT node_level_version_pkey PRIMARY KEY (id);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT node_pkey PRIMARY KEY (sn);


--
-- Name: operation_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.operation_lock
    ADD CONSTRAINT operation_lock_pkey PRIMARY KEY (operation_type);


--
-- Name: operation_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.operation_status
    ADD CONSTRAINT operation_status_pkey PRIMARY KEY (id);


--
-- Name: power_supply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.power_supply
    ADD CONSTRAINT power_supply_pkey PRIMARY KEY (sn);


--
-- Name: sata_dom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.sata_dom
    ADD CONSTRAINT sata_dom_pkey PRIMARY KEY (node_sn);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: syr_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.syr_configuration
    ADD CONSTRAINT syr_configuration_pkey PRIMARY KEY (event_id);


--
-- Name: vcenter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.vcenter
    ADD CONSTRAINT vcenter_pkey PRIMARY KEY (cluster_id);


--
-- Name: virtual_appliance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.virtual_appliance
    ADD CONSTRAINT virtual_appliance_pkey PRIMARY KEY (id);


--
-- Name: virtual_infrastructure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.virtual_infrastructure
    ADD CONSTRAINT virtual_infrastructure_pkey PRIMARY KEY (id);


--
-- Name: vsan_disk_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.vsan_disk_group
    ADD CONSTRAINT vsan_disk_group_pkey PRIMARY KEY (uuid);


--
-- Name: vsan_disk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.vsan_disk
    ADD CONSTRAINT vsan_disk_pkey PRIMARY KEY (uuid);


--
-- Name: vsan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.vsan
    ADD CONSTRAINT vsan_pkey PRIMARY KEY (uuid);


--
-- Name: appliance_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appliance
    ADD CONSTRAINT appliance_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.mystic_cluster(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: board_node_sn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.board
    ADD CONSTRAINT board_node_sn_fkey FOREIGN KEY (node_sn) REFERENCES public.node(sn) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: boot_device_node_sn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boot_device
    ADD CONSTRAINT boot_device_node_sn_fkey FOREIGN KEY (node_sn) REFERENCES public.node(sn) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: chassis_appliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chassis
    ADD CONSTRAINT chassis_appliance_id_fkey FOREIGN KEY (appliance_id) REFERENCES public.appliance(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: connect_home_message_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connect_home_message
    ADD CONSTRAINT connect_home_message_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.mystic_event(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: dimm_node_sn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimm
    ADD CONSTRAINT dimm_node_sn_fkey FOREIGN KEY (node_sn) REFERENCES public.node(sn) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: disk_node_sn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disk
    ADD CONSTRAINT disk_node_sn_fkey FOREIGN KEY (node_sn) REFERENCES public.node(sn) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: esrs_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.esrs
    ADD CONSTRAINT esrs_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.mystic_cluster(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: esrs_contact_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.esrs_contact
    ADD CONSTRAINT esrs_contact_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.esrs(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: esrs_email_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.esrs_email
    ADD CONSTRAINT esrs_email_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.esrs(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: esrs_proxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.esrs_proxy
    ADD CONSTRAINT esrs_proxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.esrs(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: esx_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.esx
    ADD CONSTRAINT esx_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.vcenter(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: evo_rail_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evo_rail
    ADD CONSTRAINT evo_rail_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.mystic_cluster(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: instance_property_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instance_property
    ADD CONSTRAINT instance_property_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.market_instance(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: log_insight_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_insight
    ADD CONSTRAINT log_insight_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.evo_rail(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: market_instance_component_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_instance
    ADD CONSTRAINT market_instance_component_fkey FOREIGN KEY (component) REFERENCES public.market_appliance(component) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: market_queue_instance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.market_queue
    ADD CONSTRAINT market_queue_instance_id_fkey FOREIGN KEY (instance_id) REFERENCES public.market_instance(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: mystic_event_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mystic_event
    ADD CONSTRAINT mystic_event_code_fkey FOREIGN KEY (code) REFERENCES public.event_code(code) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: mystic_manager_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mystic_manager
    ADD CONSTRAINT mystic_manager_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.mystic_cluster(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: nic_node_sn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nic
    ADD CONSTRAINT nic_node_sn_fkey FOREIGN KEY (node_sn) REFERENCES public.node(sn) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: node_appliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT node_appliance_id_fkey FOREIGN KEY (appliance_id) REFERENCES public.appliance(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: node_sn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.node_level_version
    ADD CONSTRAINT node_sn_fkey FOREIGN KEY (node_sn) REFERENCES public.node(sn) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: power_supply_appliance_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.power_supply
    ADD CONSTRAINT power_supply_appliance_id_fkey FOREIGN KEY (appliance_id) REFERENCES public.appliance(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: sata_dom_node_sn_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sata_dom
    ADD CONSTRAINT sata_dom_node_sn_fkey FOREIGN KEY (node_sn) REFERENCES public.node(sn) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: syr_configuration_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.syr_configuration
    ADD CONSTRAINT syr_configuration_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.connect_home_message(event_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: vcenter_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vcenter
    ADD CONSTRAINT vcenter_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.evo_rail(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: virtual_appliance_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virtual_appliance
    ADD CONSTRAINT virtual_appliance_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.mystic_cluster(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: virtual_infrastructure_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.virtual_infrastructure
    ADD CONSTRAINT virtual_infrastructure_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.mystic_cluster(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: vsan_disk_group_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vsan_disk
    ADD CONSTRAINT vsan_disk_group_uuid_fkey FOREIGN KEY (group_uuid) REFERENCES public.vsan_disk_group(uuid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: vsan_disk_group_vsan_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vsan_disk_group
    ADD CONSTRAINT vsan_disk_group_vsan_uuid_fkey FOREIGN KEY (vsan_uuid) REFERENCES public.vsan(uuid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: vsan_uuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vsan
    ADD CONSTRAINT vsan_uuid_fkey FOREIGN KEY (uuid) REFERENCES public.evo_rail(cluster_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect spring_batch

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: batch_job_execution; Type: TABLE; Schema: public; Owner: batch; Tablespace: 
--

CREATE TABLE public.batch_job_execution (
    job_execution_id bigint NOT NULL,
    version bigint,
    job_instance_id bigint NOT NULL,
    create_time timestamp without time zone NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    status character varying(10),
    exit_code character varying(2500),
    exit_message character varying(2500),
    last_updated timestamp without time zone,
    job_configuration_location character varying(2500)
);


ALTER TABLE public.batch_job_execution OWNER TO batch;

--
-- Name: batch_job_execution_context; Type: TABLE; Schema: public; Owner: batch; Tablespace: 
--

CREATE TABLE public.batch_job_execution_context (
    job_execution_id bigint NOT NULL,
    short_context character varying(2500) NOT NULL,
    serialized_context text
);


ALTER TABLE public.batch_job_execution_context OWNER TO batch;

--
-- Name: batch_job_execution_params; Type: TABLE; Schema: public; Owner: batch; Tablespace: 
--

CREATE TABLE public.batch_job_execution_params (
    job_execution_id bigint NOT NULL,
    type_cd character varying(6) NOT NULL,
    key_name character varying(100) NOT NULL,
    string_val character varying(250),
    date_val timestamp without time zone,
    long_val bigint,
    double_val double precision,
    identifying character(1) NOT NULL
);


ALTER TABLE public.batch_job_execution_params OWNER TO batch;

--
-- Name: batch_job_execution_seq; Type: SEQUENCE; Schema: public; Owner: batch
--

CREATE SEQUENCE public.batch_job_execution_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batch_job_execution_seq OWNER TO batch;

--
-- Name: batch_job_instance; Type: TABLE; Schema: public; Owner: batch; Tablespace: 
--

CREATE TABLE public.batch_job_instance (
    job_instance_id bigint NOT NULL,
    version bigint,
    job_name character varying(100) NOT NULL,
    job_key character varying(32) NOT NULL
);


ALTER TABLE public.batch_job_instance OWNER TO batch;

--
-- Name: batch_job_seq; Type: SEQUENCE; Schema: public; Owner: batch
--

CREATE SEQUENCE public.batch_job_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batch_job_seq OWNER TO batch;

--
-- Name: batch_step_execution; Type: TABLE; Schema: public; Owner: batch; Tablespace: 
--

CREATE TABLE public.batch_step_execution (
    step_execution_id bigint NOT NULL,
    version bigint NOT NULL,
    step_name character varying(100) NOT NULL,
    job_execution_id bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    status character varying(10),
    commit_count bigint,
    read_count bigint,
    filter_count bigint,
    write_count bigint,
    read_skip_count bigint,
    write_skip_count bigint,
    process_skip_count bigint,
    rollback_count bigint,
    exit_code character varying(2500),
    exit_message character varying(2500),
    last_updated timestamp without time zone
);


ALTER TABLE public.batch_step_execution OWNER TO batch;

--
-- Name: batch_step_execution_context; Type: TABLE; Schema: public; Owner: batch; Tablespace: 
--

CREATE TABLE public.batch_step_execution_context (
    step_execution_id bigint NOT NULL,
    short_context character varying(2500) NOT NULL,
    serialized_context text
);


ALTER TABLE public.batch_step_execution_context OWNER TO batch;

--
-- Name: batch_step_execution_seq; Type: SEQUENCE; Schema: public; Owner: batch
--

CREATE SEQUENCE public.batch_step_execution_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.batch_step_execution_seq OWNER TO batch;

--
-- Data for Name: batch_job_execution; Type: TABLE DATA; Schema: public; Owner: batch
--

COPY public.batch_job_execution (job_execution_id, version, job_instance_id, create_time, start_time, end_time, status, exit_code, exit_message, last_updated, job_configuration_location) FROM stdin;
1	2	1	2018-12-06 14:08:24.089	2018-12-06 14:08:24.115	2018-12-06 14:43:59.444	COMPLETED	COMPLETED		2018-12-06 14:43:59.538	\N
9	2	8	2018-12-10 14:05:49.943	2018-12-10 14:05:49.96	2018-12-10 14:06:41.02	COMPLETED	COMPLETED		2018-12-10 14:06:41.034	\N
2	3	2	2018-12-06 16:08:28.649	2018-12-06 16:08:28.657	2018-12-06 16:08:31.616	FAILED	FAILED		2018-12-06 16:08:31.627	\N
3	3	3	2018-12-06 16:08:55.488	2018-12-06 16:08:55.493	2018-12-06 16:08:57.908	FAILED	FAILED		2018-12-06 16:08:57.916	\N
10	2	9	2018-12-10 14:10:18.001	2018-12-10 14:10:18.015	2018-12-10 14:11:49.83	COMPLETED	COMPLETED		2018-12-10 14:11:49.849	\N
4	3	4	2018-12-06 16:09:21.41	2018-12-06 16:09:21.415	2018-12-06 16:10:15.702	FAILED	FAILED		2018-12-06 16:10:15.711	\N
11	2	10	2018-12-10 14:25:26.572	2018-12-10 14:25:26.588	2018-12-10 14:26:01.566	FAILED	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException: The IP 192.168.104.211 resolved for hostname engdell4-01.localdomain.local is not same as expected\n\tat com.emc.mystic.manager.operation.action.HostManagementIpResolveAction.config(HostManagementIpResolveAction.java:64)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 14:26:01.593	\N
5	3	5	2018-12-06 16:11:19.825	2018-12-06 16:11:19.828	2018-12-06 16:12:46.104	COMPLETED	COMPLETED		2018-12-06 16:12:46.118	\N
6	3	6	2018-12-06 16:13:05.778	2018-12-06 16:13:05.783	2018-12-06 16:22:16.206	COMPLETED	COMPLETED		2018-12-06 16:22:16.296	\N
7	3	7	2018-12-10 13:53:05.47	2018-12-10 13:53:05.51	2018-12-10 13:53:26.755	ABANDONED	PRECHECK_FAIL	com.emc.mystic.manager.operation.core.exception.PrecheckException\n\tat com.emc.mystic.manager.operation.core.tasklets.PrecheckTasklet.handleExceptions(PrecheckTasklet.java:16)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:90)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 13:57:57.671	\N
8	2	8	2018-12-10 13:57:57.698	2018-12-10 13:57:57.709	2018-12-10 13:59:47.734	FAILED	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.addHostToVc(HostJoinToClusterAction.java:121)\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.config(HostJoinToClusterAction.java:77)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 13:59:47.775	\N
12	2	10	2018-12-10 14:31:14.093	2018-12-10 14:31:14.109	2018-12-10 14:32:14.57	COMPLETED	COMPLETED		2018-12-10 14:32:14.593	\N
13	2	11	2018-12-10 14:34:15.092	2018-12-10 14:34:15.101	2018-12-10 14:34:51.573	FAILED	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException: The IP 192.168.104.215 resolved for hostname engdell4-01.localdomain.local is not same as expected\n\tat com.emc.mystic.manager.operation.action.HostManagementIpResolveAction.config(HostManagementIpResolveAction.java:64)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 14:34:51.583	\N
14	2	11	2018-12-10 14:36:53.73	2018-12-10 14:36:53.752	2018-12-10 14:39:01.718	FAILED	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.addHostToVc(HostJoinToClusterAction.java:121)\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.config(HostJoinToClusterAction.java:77)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 14:39:01.76	\N
15	2	11	2018-12-10 14:40:33.275	2018-12-10 14:40:33.293	2018-12-10 14:41:25.377	COMPLETED	COMPLETED		2018-12-10 14:41:25.389	\N
\.


--
-- Data for Name: batch_job_execution_context; Type: TABLE DATA; Schema: public; Owner: batch
--

COPY public.batch_job_execution_context (job_execution_id, short_context, serialized_context) FROM stdin;
7	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_HOSTNAME_CHANGE","startTime":"2018-12-10 13:53:05.445 UTC"}}}]}	\N
8	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_HOSTNAME_CHANGE","startTime":"2018-12-10 13:57:57.688 UTC"}}}]}	\N
1	{"map":[{"entry":{"string":["stage","clean_up"]}}]}	\N
10	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_HOSTNAME_CHANGE","startTime":"2018-12-10 14:10:17.971 UTC"}}}]}	\N
11	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_MANAGEMENT_IP_CHANGE","startTime":"2018-12-10 14:25:26.560 UTC"}}}]}	\N
9	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_HOSTNAME_CHANGE","startTime":"2018-12-10 14:05:49.893 UTC"}}}]}	\N
12	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_MANAGEMENT_IP_CHANGE","startTime":"2018-12-10 14:31:14.75 UTC"}}}]}	\N
13	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_MANAGEMENT_IP_CHANGE","startTime":"2018-12-10 14:34:15.76 UTC"}}}]}	\N
14	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_MANAGEMENT_IP_CHANGE","startTime":"2018-12-10 14:36:53.698 UTC"}}}]}	\N
15	{"map":[{"entry":{"string":"OperationLock","com.emc.mystic.manager.commons.db.bean.OperationLock":{"operationType":"ESXI_MANAGEMENT_IP_CHANGE","startTime":"2018-12-10 14:40:33.259 UTC"}}}]}	\N
4	{"map":[{"entry":[{"string":"result","map":[{"entry":[{"string":["normalValidationFieldErrors","{}"]},{"string":["thoroughValidationFieldWarnings","{}"]},{"string":["normalValidationFieldWarnings","{}"]},{"string":["thoroughValidationFieldErrors","{\\"accounts.nonHostAccounts.vcAdministratorAccount\\":[{\\"localizableMessage\\":{\\"bundle\\":\\"ExpansionValidation\\",\\"key\\":\\"config.validation.expansion.login.vc\\",\\"__LocalizableMessage__\\":true},\\"__LocalizableMessageWithParams__\\":true}]}"]}]}]},{"string":["stage","validation_host"]},{"string":"context","com.vce.commons.validation.ConfigurationValidationResults":{"normalValidationFieldErrors":[""],"thoroughValidationFieldErrors":[{"entry":{"string":"accounts.nonHostAccounts.vcAdministratorAccount","java.util.Arrays$ArrayList":[{"a":[{"@class":"com.vce.commons.localization.LocalizableMessageWithParams-array","com.vce.commons.localization.LocalizableMessageWithParams":{"localizableMessage":{"bundle":"ExpansionValidation","key":"config.validation.expansion.login.vc","localized":false},"params":[""],"localized":false}}]}]}}],"normalValidationFieldWarnings":[""],"thoroughValidationFieldWarnings":[""],"invalidFields":[{"string":["accounts.nonHostAccounts","accounts.nonHostAccounts.vcAdministratorAccount","accounts"]}],"extendError":false,"cursoryValidationPass":true}}]}]}	\N
5	{"map":[{"entry":[{"string":"result","map":[""]},{"string":["stage","validation_host"]},{"string":"context","com.vce.commons.validation.ConfigurationValidationResults":{"normalValidationFieldErrors":[""],"thoroughValidationFieldErrors":[""],"normalValidationFieldWarnings":[""],"thoroughValidationFieldWarnings":[""],"invalidFields":[""],"extendError":false,"cursoryValidationPass":true}}]}]}	\N
6	{"map":[{"entry":{"string":["stage","clean_up"]}}]}	\N
2	{"map":[{"entry":[{"string":"result","map":[{"entry":[{"string":["normalValidationFieldErrors","{\\"accounts.hostAccounts.separatedAccounts.0.managementAccount.username\\":[{\\"localizableMessage\\":{\\"bundle\\":\\"ExpansionValidation\\",\\"key\\":\\"config.validation.standalone.esxi.username.invalid\\",\\"__LocalizableMessage__\\":true},\\"params\\":[{\\"bundle\\":\\"ExpansionValidation\\",\\"key\\":\\"administrator@vsphere.local\\",\\"__LocalizableMessage__\\":true}],\\"__LocalizableMessageWithParams__\\":true}]}"]},{"string":["thoroughValidationFieldWarnings","{}"]},{"string":["normalValidationFieldWarnings","{}"]},{"string":["thoroughValidationFieldErrors","{}"]}]}]},{"string":["stage","validation_host"]},{"string":"context","com.vce.commons.validation.ConfigurationValidationResults":{"normalValidationFieldErrors":[{"entry":{"string":"accounts.hostAccounts.separatedAccounts.0.managementAccount.username","list":[{"com.vce.commons.localization.LocalizableMessageWithParams":{"localizableMessage":{"bundle":"ExpansionValidation","key":"config.validation.standalone.esxi.username.invalid","localized":false},"params":[{"com.vce.commons.localization.LocalizableMessage":{"bundle":"ExpansionValidation","key":"administrator@vsphere.local","localized":false}}],"localized":false}}]}}],"thoroughValidationFieldErrors":[""],"normalValidationFieldWarnings":[""],"thoroughValidationFieldWarnings":[""],"invalidFields":[{"string":["accounts.hostAccounts","accounts.hostAccounts.separatedAccounts.0.managementAccount.username","accounts.hostAccounts.separatedAccounts.0.managementAccount","accounts.hostAccounts.separatedAccounts.0","accounts","accounts.hostAccounts.separatedAccounts"]}],"extendError":false,"cursoryValidationPass":false}}]}]}	\N
3	{"map":[{"entry":[{"string":"result","map":[{"entry":[{"string":["normalValidationFieldErrors","{\\"accounts.hostAccounts.separatedAccounts.0.managementAccount.password\\":[{\\"localizableMessage\\":{\\"bundle\\":\\"ExpansionValidation\\",\\"key\\":\\"config.validation.standalone.password.esxi.complex\\",\\"__LocalizableMessage__\\":true},\\"__LocalizableMessageWithParams__\\":true}]}"]},{"string":["thoroughValidationFieldWarnings","{}"]},{"string":["normalValidationFieldWarnings","{}"]},{"string":["thoroughValidationFieldErrors","{}"]}]}]},{"string":["stage","validation_host"]},{"string":"context","com.vce.commons.validation.ConfigurationValidationResults":{"normalValidationFieldErrors":[{"entry":{"string":"accounts.hostAccounts.separatedAccounts.0.managementAccount.password","list":[{"com.vce.commons.localization.LocalizableMessageWithParams":{"localizableMessage":{"bundle":"ExpansionValidation","key":"config.validation.standalone.password.esxi.complex","localized":false},"params":[""],"localized":false}}]}}],"thoroughValidationFieldErrors":[""],"normalValidationFieldWarnings":[""],"thoroughValidationFieldWarnings":[""],"invalidFields":[{"string":["accounts.hostAccounts","accounts.hostAccounts.separatedAccounts.0.managementAccount","accounts.hostAccounts.separatedAccounts.0.managementAccount.password","accounts.hostAccounts.separatedAccounts.0","accounts","accounts.hostAccounts.separatedAccounts"]}],"extendError":false,"cursoryValidationPass":false}}]}]}	\N
\.


--
-- Data for Name: batch_job_execution_params; Type: TABLE DATA; Schema: public; Owner: batch
--

COPY public.batch_job_execution_params (job_execution_id, type_cd, key_name, string_val, date_val, long_val, double_val, identifying) FROM stdin;
1	STRING	vCenter.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
1	STRING	processName	standaloneConfigurationJob	1970-01-01 00:00:00	0	0	Y
1	STRING	vCenter.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
1	STRING	vCenter.ip	192.168.104.201	1970-01-01 00:00:00	0	0	Y
1	STRING	psc.ip	192.168.104.202	1970-01-01 00:00:00	0	0	Y
1	STRING	vc.dvs.name	VMware HCIA Distributed Switch	1970-01-01 00:00:00	0	0	Y
1	STRING	nic.profile	TWO_HIGH_SPEED	1970-01-01 00:00:00	0	0	Y
1	LONG	context.id		1970-01-01 00:00:00	820	0	Y
2	STRING	processName	expansionValidationJob	1970-01-01 00:00:00	0	0	Y
2	LONG	context.id		1970-01-01 00:00:00	861	0	Y
3	STRING	processName	expansionValidationJob	1970-01-01 00:00:00	0	0	Y
3	LONG	context.id		1970-01-01 00:00:00	867	0	Y
4	STRING	processName	expansionValidationJob	1970-01-01 00:00:00	0	0	Y
4	LONG	context.id		1970-01-01 00:00:00	873	0	Y
5	STRING	processName	expansionValidationJob	1970-01-01 00:00:00	0	0	Y
5	LONG	context.id		1970-01-01 00:00:00	889	0	Y
6	STRING	vCenter.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
6	STRING	vCenter.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
6	STRING	vCenter.ip	192.168.104.201	1970-01-01 00:00:00	0	0	Y
6	STRING	psc.ip	192.168.104.202	1970-01-01 00:00:00	0	0	Y
6	STRING	nic.profile	TWO_HIGH_SPEED	1970-01-01 00:00:00	0	0	Y
6	STRING	host.id	18Z6BC20000000-01-01	1970-01-01 00:00:00	0	0	Y
6	STRING	processName	expansionConfigurationJob	1970-01-01 00:00:00	0	0	Y
6	LONG	context.id		1970-01-01 00:00:00	905	0	Y
6	LONG	is.replacement		1970-01-01 00:00:00	0	0	Y
6	STRING	node.model	VxRail S470	1970-01-01 00:00:00	0	0	Y
6	STRING	appliance.id	18Z6BC20000000	1970-01-01 00:00:00	0	0	Y
7	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
7	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
7	STRING	hostname	engdell4-01new.localdomain.local	1970-01-01 00:00:00	0	0	Y
7	STRING	moref_id	host-10	1970-01-01 00:00:00	0	0	Y
7	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
7	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
7	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
8	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
8	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
8	STRING	hostname	engdell4-01new.localdomain.local	1970-01-01 00:00:00	0	0	Y
8	STRING	moref_id	host-10	1970-01-01 00:00:00	0	0	Y
8	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
8	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
8	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
8	LONG	run.id		1970-01-01 00:00:00	1	0	Y
9	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
9	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
9	STRING	hostname	engdell4-01new.localdomain.local	1970-01-01 00:00:00	0	0	Y
9	STRING	moref_id	host-10	1970-01-01 00:00:00	0	0	Y
9	LONG	run.id		1970-01-01 00:00:00	1	0	Y
9	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
9	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
9	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
10	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
10	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
10	STRING	hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
10	STRING	moref_id	host-41	1970-01-01 00:00:00	0	0	Y
10	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
10	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
10	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
10	LONG	run.id		1970-01-01 00:00:00	2	0	Y
11	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
11	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
11	STRING	moref_id	host-43	1970-01-01 00:00:00	0	0	Y
11	STRING	hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
11	STRING	management_network.ipv4	192.168.104.215	1970-01-01 00:00:00	0	0	Y
11	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
11	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
11	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
11	STRING	origin_hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
12	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
12	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
12	STRING	moref_id	host-43	1970-01-01 00:00:00	0	0	Y
12	STRING	hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
12	STRING	management_network.ipv4	192.168.104.215	1970-01-01 00:00:00	0	0	Y
12	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
12	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
12	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
12	STRING	origin_hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
13	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
13	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
13	STRING	moref_id	host-45	1970-01-01 00:00:00	0	0	Y
13	STRING	hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
13	STRING	management_network.ipv4	192.168.104.211	1970-01-01 00:00:00	0	0	Y
13	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
13	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
13	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
13	STRING	origin_hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
13	LONG	run.id		1970-01-01 00:00:00	1	0	Y
14	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
14	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
14	STRING	moref_id	host-45	1970-01-01 00:00:00	0	0	Y
14	STRING	hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
14	LONG	run.id		1970-01-01 00:00:00	1	0	Y
14	STRING	management_network.ipv4	192.168.104.211	1970-01-01 00:00:00	0	0	Y
14	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
14	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
14	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
14	STRING	origin_hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
15	STRING	esxi_root_user.username	root	1970-01-01 00:00:00	0	0	Y
15	STRING	vc_admin_user.username	administrator@vsphere.local	1970-01-01 00:00:00	0	0	Y
15	STRING	moref_id	host-45	1970-01-01 00:00:00	0	0	Y
15	STRING	hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
15	LONG	run.id		1970-01-01 00:00:00	1	0	Y
15	STRING	management_network.ipv4	192.168.104.211	1970-01-01 00:00:00	0	0	Y
15	STRING	vc_admin_user.password	c2e051d098f852816e82f6ceb975402f	1970-01-01 00:00:00	0	0	Y
15	STRING	serial_number	18Y4BC2	1970-01-01 00:00:00	0	0	Y
15	STRING	esxi_root_user.password	a664f3824d818ae68586c862d359417e	1970-01-01 00:00:00	0	0	Y
15	STRING	origin_hostname	engdell4-01.localdomain.local	1970-01-01 00:00:00	0	0	Y
\.


--
-- Name: batch_job_execution_seq; Type: SEQUENCE SET; Schema: public; Owner: batch
--

SELECT pg_catalog.setval('public.batch_job_execution_seq', 15, true);


--
-- Data for Name: batch_job_instance; Type: TABLE DATA; Schema: public; Owner: batch
--

COPY public.batch_job_instance (job_instance_id, version, job_name, job_key) FROM stdin;
1	0	standaloneConfigurationJob	65659a1c1f245a8b6b2fa59eb6fb006f
2	0	expansionValidationJob	87fc15b3676258ba7827538fb206c274
3	0	expansionValidationJob	4789a2338da082cdb4d9b541eab754fc
4	0	expansionValidationJob	de0687b33b549da9e11a9a389dfae261
5	0	expansionValidationJob	c4af644b8f2957dae36f2a921b25222b
6	0	expansionConfigurationJob	5f7f8b1390e2097015f0a4d48cc1fc3f
7	0	ChangeEsxiHostname	6528451ef7767ebb76d4d969025038c1
8	0	ChangeEsxiHostname	ce200f80efddcbe5a5383fde20cae724
9	0	ChangeEsxiHostname	ffc1838107017d8bda00220f4eb1f616
10	0	ChangeEsxiIp	04737f48a774691e58a5dccde3803350
11	0	ChangeEsxiIp	836249a514e79020757ca5942d93ac02
\.


--
-- Name: batch_job_seq; Type: SEQUENCE SET; Schema: public; Owner: batch
--

SELECT pg_catalog.setval('public.batch_job_seq', 11, true);


--
-- Data for Name: batch_step_execution; Type: TABLE DATA; Schema: public; Owner: batch
--

COPY public.batch_step_execution (step_execution_id, version, step_name, job_execution_id, start_time, end_time, status, commit_count, read_count, filter_count, write_count, read_skip_count, write_skip_count, process_skip_count, rollback_count, exit_code, exit_message, last_updated) FROM stdin;
1	3	disableElectionConfigurationStep	1	2018-12-06 14:08:24.144	2018-12-06 14:08:32.069	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:08:32.069
10	3	evoPasswordConfigurationStep	1	2018-12-06 14:10:10.322	2018-12-06 14:10:12.344	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:12.344
2	3	powerOnLogInsightVMConfigurationStep	1	2018-12-06 14:08:32.076	2018-12-06 14:08:32.14	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:08:32.14
3	3	storeVirtualMachinesConfigurationStep	1	2018-12-06 14:08:32.146	2018-12-06 14:08:33.96	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:08:33.968
38	3	freeStandbyNicsConfigurationStep	1	2018-12-06 14:31:07.864	2018-12-06 14:31:09.581	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:09.581
11	3	trackHostsConfigurationStep	1	2018-12-06 14:10:12.35	2018-12-06 14:10:15.386	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:15.386
4	3	createNetworkModelsConfigurationStep	1	2018-12-06 14:08:33.983	2018-12-06 14:08:35.815	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:08:35.815
5	3	linkNetworkModelsConfigurationStep	1	2018-12-06 14:08:35.823	2018-12-06 14:08:35.874	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:08:35.874
12	3	hostsManagementNetworkConfigurationStep	1	2018-12-06 14:10:15.399	2018-12-06 14:10:26.539	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:26.539
6	3	enableAutostartVxRailManagerConfigurationStep	1	2018-12-06 14:08:35.881	2018-12-06 14:08:37.488	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:08:37.488
129	3	timeSkewSyncValidationStep	4	2018-12-06 16:09:21.419	2018-12-06 16:09:23.47	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.47
39	3	dvsNicAssignmentConfigurationStep	1	2018-12-06 14:31:09.587	2018-12-06 14:31:20.724	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:20.724
7	3	destroyVMDGVsanConfigurationStep	1	2018-12-06 14:08:37.496	2018-12-06 14:10:07.239	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:07.239
8	3	removeUnusedSystemVMConfigurationStep	1	2018-12-06 14:10:07.245	2018-12-06 14:10:08.286	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:08.286
40	3	vdsPortgroupConfigurationStep	1	2018-12-06 14:31:20.732	2018-12-06 14:31:32.895	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:32.895
9	3	initRSCConfigurationStep	1	2018-12-06 14:10:08.292	2018-12-06 14:10:10.316	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:10.316
155	3	timeSkewSyncValidationStep	5	2018-12-06 16:11:19.833	2018-12-06 16:11:21.906	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:21.907
13	3	hostsTimeConfigurationStep	1	2018-12-06 14:10:26.547	2018-12-06 14:10:40.803	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:40.803
130	3	hostNetworkValidationStep	4	2018-12-06 16:09:23.481	2018-12-06 16:09:23.501	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.501
14	3	evoHostnameConfigurationStep	1	2018-12-06 14:10:40.814	2018-12-06 14:10:40.951	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:40.952
41	3	hostsInfrastructureNetworkConfigurationStep	1	2018-12-06 14:31:32.905	2018-12-06 14:31:43.094	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:43.094
15	3	evoTimeConfigurationStep	1	2018-12-06 14:10:40.84	2018-12-06 14:10:49.876	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:10:49.877
42	3	vmsInfrastructureNetworkConfigurationStep	1	2018-12-06 14:31:43.101	2018-12-06 14:31:45.195	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:45.195
131	3	netmaskValidationStep	4	2018-12-06 16:09:23.506	2018-12-06 16:09:23.512	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.512
185	3	vCenterConnectionStep	6	2018-12-06 16:13:10.688	2018-12-06 16:13:10.695	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:13:10.695
156	3	hostNetworkValidationStep	5	2018-12-06 16:11:21.912	2018-12-06 16:11:21.935	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:21.935
132	3	overlapValidationStep	4	2018-12-06 16:09:23.517	2018-12-06 16:09:23.522	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.522
157	3	netmaskValidationStep	5	2018-12-06 16:11:21.94	2018-12-06 16:11:21.946	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:21.946
218	3	cleanUPConfigurationStep	6	2018-12-06 16:22:16.169	2018-12-06 16:22:16.204	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:22:16.204
186	3	unregisterHostsConfigurationStep	6	2018-12-06 16:13:10.7	2018-12-06 16:13:10.728	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:13:10.728
255	3	ActionTasklet__13	10	2018-12-10 14:11:10.959	2018-12-10 14:11:18.587	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:11:18.587
187	3	destroyVMDGVsanConfigurationStep	6	2018-12-06 16:13:10.733	2018-12-06 16:14:10.103	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:10.103
258	3	PostcheckTasklet	10	2018-12-10 14:11:43.85	2018-12-10 14:11:49.827	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:11:49.827
256	3	ActionTasklet__14	10	2018-12-10 14:11:18.597	2018-12-10 14:11:18.626	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:11:18.626
43	3	hostsRemoveVSSConfigurationStep	1	2018-12-06 14:31:45.202	2018-12-06 14:31:45.593	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:45.593
16	3	firstBootPSCVMConfigurationStep	1	2018-12-06 14:10:49.887	2018-12-06 14:17:00.656	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:17:00.656
133	3	customizedHostsIpAvailabilityCursoryValidationStep	4	2018-12-06 16:09:23.527	2018-12-06 16:09:23.532	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.532
17	3	firstBootVCSAVMConfigurationStep	1	2018-12-06 14:17:00.669	2018-12-06 14:30:17.282	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:17.282
44	3	nicReassignmentConfigurationStep	1	2018-12-06 14:31:45.6	2018-12-06 14:31:56.708	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:56.708
18	3	evoDNSSetResolverConfigurationStep	1	2018-12-06 14:30:17.296	2018-12-06 14:30:18.316	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:18.316
50	3	hostsVsanNetworkingConfigurationStep	1	2018-12-06 14:33:39.341	2018-12-06 14:33:40.692	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:33:40.693
19	3	certificateTrustConfigurationStep	1	2018-12-06 14:30:18.322	2018-12-06 14:30:18.515	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:18.515
45	3	regenerateVSANNetworkConfigurationStep	1	2018-12-06 14:31:56.715	2018-12-06 14:31:59.83	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:59.83
20	3	markVCSADeployedConfigurationStep	1	2018-12-06 14:30:18.521	2018-12-06 14:30:18.533	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:18.534
158	3	overlapValidationStep	5	2018-12-06 16:11:21.951	2018-12-06 16:11:21.957	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:21.957
21	3	vCenterConnectionStep	1	2018-12-06 14:30:18.54	2018-12-06 14:30:18.56	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:18.56
46	3	hostsDNSConfigurationStep	1	2018-12-06 14:31:59.837	2018-12-06 14:32:00.097	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:32:00.097
22	3	changePTAgentRestIPConfigurationStep	1	2018-12-06 14:30:18.566	2018-12-06 14:30:19.133	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:19.133
51	3	witnessTrafficConnectivityConfigurationStep	1	2018-12-06 14:33:40.699	2018-12-06 14:33:40.713	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:33:40.715
47	3	hostsRestartLoudmouthConfigurationStep	1	2018-12-06 14:32:00.103	2018-12-06 14:32:17.66	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:32:17.66
134	3	customizedHostnameValidationStep	4	2018-12-06 16:09:23.537	2018-12-06 16:09:23.543	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.544
23	3	vcsaProxyConfigurationStep	1	2018-12-06 14:30:19.14	2018-12-06 14:30:23.256	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:23.256
25	3	vxRailSyslogConfigurationStep	1	2018-12-06 14:30:19.164	2018-12-06 14:30:23.28	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:23.28
48	3	restartPTAgentConfigurationStep	1	2018-12-06 14:32:17.667	2018-12-06 14:33:33.038	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:33:33.038
24	3	loginsightConfigurationStep	1	2018-12-06 14:30:19.142	2018-12-06 14:30:23.294	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:23.294
49	3	licensingConfigurationStep	1	2018-12-06 14:33:33.046	2018-12-06 14:33:39.327	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:33:39.328
135	3	passwordConfigurationValidationValidationStep	4	2018-12-06 16:09:23.549	2018-12-06 16:09:23.554	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.554
52	3	hostsWitnessNetworkingConfigurationStep	1	2018-12-06 14:33:40.724	2018-12-06 14:33:40.734	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:33:40.735
159	3	customizedHostsIpAvailabilityCursoryValidationStep	5	2018-12-06 16:11:21.962	2018-12-06 16:11:21.974	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:21.974
53	3	hostsVsanPolicyConfigurationStep	1	2018-12-06 14:33:40.741	2018-12-06 14:33:43.776	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:33:43.776
136	3	esxiUsernameValidationValidationStep	4	2018-12-06 16:09:23.559	2018-12-06 16:09:23.565	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.565
257	3	ActionTasklet__15	10	2018-12-10 14:11:18.634	2018-12-10 14:11:43.839	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:11:43.839
188	3	enterMaintenanceModeConfigurationStep	6	2018-12-06 16:14:10.109	2018-12-06 16:14:13.342	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:13.342
137	3	esxiPasswordValidationValidationStep	4	2018-12-06 16:09:23.57	2018-12-06 16:09:23.575	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:23.575
160	3	customizedHostnameValidationStep	5	2018-12-06 16:11:21.981	2018-12-06 16:11:21.987	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:21.987
189	3	hostsManagementNetworkConfigurationStep	6	2018-12-06 16:14:13.347	2018-12-06 16:14:17.882	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:17.882
259	3	PrecheckTasklet	11	2018-12-10 14:25:26.61	2018-12-10 14:25:41.877	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:25:41.877
74	3	mysticInitConfigurationStep	1	2018-12-06 14:40:16.672	2018-12-06 14:43:59.36	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:43:59.361
28	3	evoRestartLoudmouthConfigurationStep	1	2018-12-06 14:30:23.304	2018-12-06 14:30:31.358	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:31.359
54	3	createMultiDGConfigurationStep	1	2018-12-06 14:33:43.783	2018-12-06 14:38:03.653	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:03.654
63	3	enableDRSConfigurationStep	1	2018-12-06 14:38:15.869	2018-12-06 14:38:15.887	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:15.887
71	3	dismissAlarmConfigurationStep	1	2018-12-06 14:40:15.576	2018-12-06 14:40:16.596	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:40:16.596
64	3	createVxRailPluginForVcConfigurationStep	1	2018-12-06 14:38:15.896	2018-12-06 14:38:16.248	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:16.248
84	3	esxiUsernameValidationValidationStep	2	2018-12-06 16:08:31.111	2018-12-06 16:08:31.168	FAILED	1	0	0	0	0	0	0	0	FAILED		2018-12-06 16:08:31.168
65	3	hostsPasswordConfigurationStep	1	2018-12-06 14:38:16.264	2018-12-06 14:38:50.852	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:50.853
72	3	ovfConfigurationStep	1	2018-12-06 14:40:16.603	2018-12-06 14:40:16.613	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:40:16.614
66	3	marvinLoudmouthRegistrationConfigurationStep	1	2018-12-06 14:38:50.86	2018-12-06 14:38:51.764	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:51.764
161	3	passwordConfigurationValidationValidationStep	5	2018-12-06 16:11:21.994	2018-12-06 16:11:22.001	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:22.001
67	3	hostHAConfigurationStep	1	2018-12-06 14:38:51.774	2018-12-06 14:40:09.69	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:40:09.69
85	3	esxiPasswordValidationValidationStep	2	2018-12-06 16:08:31.174	2018-12-06 16:08:31.194	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:31.194
68	3	disableVCandPSCPasswordExpirationConfigurationStep	1	2018-12-06 14:40:09.698	2018-12-06 14:40:15.08	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:40:15.08
138	3	updateHardwareProfileValidationStep	4	2018-12-06 16:09:23.58	2018-12-06 16:09:25.611	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:25.611
69	3	hostAdjustSystemParamsConfigurationStep	1	2018-12-06 14:40:15.088	2018-12-06 14:40:15.098	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:40:15.098
86	3	updateHardwareProfileValidationStep	2	2018-12-06 16:08:31.2	2018-12-06 16:08:31.215	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.215
70	3	disableHostSecurityServiceConfigurationStep	1	2018-12-06 14:40:15.106	2018-12-06 14:40:15.568	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:40:15.568
73	3	ovfVMWConfigurationStep	1	2018-12-06 14:40:16.621	2018-12-06 14:40:16.662	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:40:16.662
260	3	ValidationTasklet	11	2018-12-10 14:25:41.888	2018-12-10 14:25:44.921	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:25:44.922
139	3	hostsIpAvailabilityValidationStep	4	2018-12-06 16:09:25.616	2018-12-06 16:09:28.636	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:28.636
87	3	hostsIpAvailabilityValidationStep	2	2018-12-06 16:08:31.221	2018-12-06 16:08:31.237	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.237
162	3	esxiUsernameValidationValidationStep	5	2018-12-06 16:11:22.006	2018-12-06 16:11:22.013	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:22.013
88	3	customizedHostsIpAvailabilityValidationStep	2	2018-12-06 16:08:31.243	2018-12-06 16:08:31.258	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:31.258
140	3	customizedHostsIpAvailabilityValidationStep	4	2018-12-06 16:09:28.641	2018-12-06 16:09:28.646	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:09:28.647
89	3	vlanLiveValidationStep	2	2018-12-06 16:08:31.265	2018-12-06 16:08:31.283	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.283
190	3	changePTAgentRestIPConfigurationStep	6	2018-12-06 16:14:17.887	2018-12-06 16:14:18.149	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:18.149
141	3	vlanLiveValidationStep	4	2018-12-06 16:09:28.652	2018-12-06 16:10:10.345	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:10.345
163	3	esxiPasswordValidationValidationStep	5	2018-12-06 16:11:22.018	2018-12-06 16:11:22.025	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:22.025
164	3	updateHardwareProfileValidationStep	5	2018-12-06 16:11:22.03	2018-12-06 16:11:24.021	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:24.021
191	3	hostsTimeConfigurationStep	6	2018-12-06 16:14:18.154	2018-12-06 16:14:23.384	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:23.384
261	3	ActionTasklet	11	2018-12-10 14:25:44.928	2018-12-10 14:25:44.963	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:25:44.963
192	3	hostsSyslogConfigurationStep	6	2018-12-06 16:14:23.389	2018-12-06 16:14:23.402	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:23.402
27	3	vcsaSyslogConfigurationStep	1	2018-12-06 14:30:23.285	2018-12-06 14:30:23.32	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:23.32
82	3	customizedHostnameValidationStep	2	2018-12-06 16:08:31.042	2018-12-06 16:08:31.073	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:31.073
55	3	convertToStretchedClusterConfigurationStep	1	2018-12-06 14:38:03.661	2018-12-06 14:38:03.692	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:03.692
142	3	esxiAccountsValidationValidationStep	4	2018-12-06 16:10:10.351	2018-12-06 16:10:14.16	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:14.16
75	3	cleanUPConfigurationStep	1	2018-12-06 14:43:59.368	2018-12-06 14:43:59.421	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:43:59.421
76	3	finishedStandaloneConfigurationStep	1	2018-12-06 14:43:59.428	2018-12-06 14:43:59.442	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:43:59.442
143	3	loginConfigurationValidationValidationStep	4	2018-12-06 16:10:14.165	2018-12-06 16:10:14.389	FAILED	1	0	0	0	0	0	0	0	FAILED		2018-12-06 16:10:14.39
77	3	timeSkewSyncValidationStep	2	2018-12-06 16:08:28.667	2018-12-06 16:08:30.844	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:30.844
165	3	hostsIpAvailabilityValidationStep	5	2018-12-06 16:11:24.026	2018-12-06 16:11:35.044	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:35.044
78	3	hostNetworkValidationStep	2	2018-12-06 16:08:30.859	2018-12-06 16:08:30.917	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:30.918
144	3	vcUserPermissionLiveValidationTaskletValidationStep	4	2018-12-06 16:10:14.398	2018-12-06 16:10:14.424	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:14.424
79	3	netmaskValidationStep	2	2018-12-06 16:08:30.925	2018-12-06 16:08:30.955	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:30.955
219	2	PrecheckTasklet	7	2018-12-10 13:53:05.618	2018-12-10 13:53:26.739	FAILED	0	0	0	0	0	0	0	1	PRECHECK_FAIL	com.emc.mystic.manager.operation.core.exception.PrecheckException\n\tat com.emc.mystic.manager.operation.core.tasklets.PrecheckTasklet.handleExceptions(PrecheckTasklet.java:16)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:90)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 13:53:26.74
262	3	ActionTasklet__1	11	2018-12-10 14:25:44.97	2018-12-10 14:25:50.598	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:25:50.598
80	3	overlapValidationStep	2	2018-12-06 16:08:30.962	2018-12-06 16:08:30.999	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:30.999
145	3	timeConfigurationLiveValidationValidationStep	4	2018-12-06 16:10:14.436	2018-12-06 16:10:14.475	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:14.475
81	3	customizedHostsIpAvailabilityCursoryValidationStep	2	2018-12-06 16:08:31.008	2018-12-06 16:08:31.034	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:31.034
166	3	customizedHostsIpAvailabilityValidationStep	5	2018-12-06 16:11:35.051	2018-12-06 16:11:35.064	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:11:35.064
146	3	multiDGConfigurationValidationValidationStep	4	2018-12-06 16:10:14.481	2018-12-06 16:10:14.488	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:14.488
83	3	passwordConfigurationValidationValidationStep	2	2018-12-06 16:08:31.079	2018-12-06 16:08:31.102	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:31.102
193	3	hostsRegistrationConfigurationStep	6	2018-12-06 16:14:23.407	2018-12-06 16:14:50.479	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:50.479
147	3	matchingDiskTypeConfigurationValidationTaskletValidationStep	4	2018-12-06 16:10:14.494	2018-12-06 16:10:14.5	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:14.5
167	3	vlanLiveValidationStep	5	2018-12-06 16:11:35.069	2018-12-06 16:12:16.754	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:16.754
148	3	dnsHostnamesLiveValidationTaskletValidationStep	4	2018-12-06 16:10:14.506	2018-12-06 16:10:15.541	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:15.542
168	3	esxiAccountsValidationValidationStep	5	2018-12-06 16:12:16.759	2018-12-06 16:12:20.498	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:20.498
194	3	hostsLicenseVerificationConfigurationStep	6	2018-12-06 16:14:50.484	2018-12-06 16:14:50.697	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:50.697
169	3	loginConfigurationValidationValidationStep	5	2018-12-06 16:12:20.506	2018-12-06 16:12:22.558	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:22.558
195	3	hostsHostnamesNetworkConfigurationStep	6	2018-12-06 16:14:50.702	2018-12-06 16:14:51.452	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:51.452
26	3	hostsSyslogConfigurationStep	1	2018-12-06 14:30:19.169	2018-12-06 14:30:23.308	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:23.308
37	3	dvsHostRegistrationConfigurationStep	1	2018-12-06 14:31:05.291	2018-12-06 14:31:07.857	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:07.857
29	3	vcsaADConfigurationStep	1	2018-12-06 14:30:23.332	2018-12-06 14:30:23.345	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:23.345
30	3	managementAccountConfigurationStep	1	2018-12-06 14:30:23.352	2018-12-06 14:30:27.803	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:27.803
56	3	storagePolicyConfigurationStep	1	2018-12-06 14:38:03.702	2018-12-06 14:38:04.954	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:04.954
31	3	datacenterConfigurationStep	1	2018-12-06 14:30:27.818	2018-12-06 14:30:33.123	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:30:33.123
149	3	customizeModeDNSHostnamesLiveValidationValidationStep	4	2018-12-06 16:10:15.547	2018-12-06 16:10:15.553	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:15.553
32	3	hostsRegistrationConfigurationStep	1	2018-12-06 14:30:33.13	2018-12-06 14:31:03.585	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:03.585
57	3	vmStorageConfigurationStep	1	2018-12-06 14:38:04.962	2018-12-06 14:38:10.593	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:10.593
33	3	hostsHostnamesNetworkConfigurationStep	1	2018-12-06 14:31:03.595	2018-12-06 14:31:04.069	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:04.069
196	3	dvsHostRegistrationConfigurationStep	6	2018-12-06 16:14:51.457	2018-12-06 16:14:53.021	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:53.021
34	3	createVDSConfigurationStep	1	2018-12-06 14:31:04.075	2018-12-06 14:31:04.667	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:04.667
170	3	vcUserPermissionLiveValidationTaskletValidationStep	5	2018-12-06 16:12:22.563	2018-12-06 16:12:25.203	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:25.203
58	3	vcPrepareDatastoreConfigurationStep	1	2018-12-06 14:38:10.601	2018-12-06 14:38:10.642	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:10.643
35	3	trafficResourcesConfigurationStep	1	2018-12-06 14:31:04.676	2018-12-06 14:31:05.239	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:05.239
150	3	hostVersionCompatibilityLiveValidationValidationStep	4	2018-12-06 16:10:15.559	2018-12-06 16:10:15.57	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:15.57
36	3	enableNiocConfigurationStep	1	2018-12-06 14:31:05.246	2018-12-06 14:31:05.285	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:31:05.285
59	3	vcsaGuestOpsAliasConfigurationStep	1	2018-12-06 14:38:10.669	2018-12-06 14:38:10.85	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:10.85
151	3	externalVCCapacityLimitLiveValidationValidationStep	4	2018-12-06 16:10:15.583	2018-12-06 16:10:15.6	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:15.6
60	3	autostartVCConfigurationStep	1	2018-12-06 14:38:10.859	2018-12-06 14:38:15.295	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:15.295
61	3	autostartLogInsightConfigurationStep	1	2018-12-06 14:38:15.304	2018-12-06 14:38:15.319	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:15.319
171	3	timeConfigurationLiveValidationValidationStep	5	2018-12-06 16:12:25.208	2018-12-06 16:12:25.233	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:25.233
62	3	enableEVCConfigurationStep	1	2018-12-06 14:38:15.328	2018-12-06 14:38:15.858	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 14:38:15.858
152	3	expansionLimitConfigurationValidationValidationStep	4	2018-12-06 16:10:15.606	2018-12-06 16:10:15.63	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:15.63
220	3	PrecheckTasklet	8	2018-12-10 13:57:57.732	2018-12-10 13:58:14.361	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:14.361
153	3	expansionDiscoveredHostConfigurationValidationValidationStep	4	2018-12-06 16:10:15.636	2018-12-06 16:10:15.661	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:15.661
197	3	freeStandbyNicsConfigurationStep	6	2018-12-06 16:14:53.027	2018-12-06 16:14:54.319	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:14:54.319
172	3	multiDGConfigurationValidationValidationStep	5	2018-12-06 16:12:25.238	2018-12-06 16:12:34.469	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:34.469
173	3	matchingDiskTypeConfigurationValidationTaskletValidationStep	5	2018-12-06 16:12:34.477	2018-12-06 16:12:38.424	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:38.424
198	3	dvsNicAssignmentConfigurationStep	6	2018-12-06 16:14:54.326	2018-12-06 16:15:05.42	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:05.42
221	3	ValidationTasklet	8	2018-12-10 13:58:14.383	2018-12-10 13:58:15.467	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:15.468
263	3	ActionTasklet__2	11	2018-12-10 14:25:50.606	2018-12-10 14:25:50.632	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:25:50.632
264	3	ActionTasklet__3	11	2018-12-10 14:25:50.642	2018-12-10 14:25:53.196	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:25:53.196
90	3	esxiAccountsValidationValidationStep	2	2018-12-06 16:08:31.29	2018-12-06 16:08:31.306	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.306
154	3	physicalLinkLiveValidationValidationStep	4	2018-12-06 16:10:15.667	2018-12-06 16:10:15.699	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:10:15.7
91	3	loginConfigurationValidationValidationStep	2	2018-12-06 16:08:31.312	2018-12-06 16:08:31.326	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.326
199	3	hostsInfrastructureNetworkConfigurationStep	6	2018-12-06 16:15:05.426	2018-12-06 16:15:12.445	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:12.445
174	3	dnsHostnamesLiveValidationTaskletValidationStep	5	2018-12-06 16:12:38.429	2018-12-06 16:12:39.449	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:39.449
92	3	vcUserPermissionLiveValidationTaskletValidationStep	2	2018-12-06 16:08:31.332	2018-12-06 16:08:31.362	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.362
93	3	timeConfigurationLiveValidationValidationStep	2	2018-12-06 16:08:31.368	2018-12-06 16:08:31.385	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.385
222	3	ActionTasklet	8	2018-12-10 13:58:15.476	2018-12-10 13:58:15.536	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:15.536
175	3	customizeModeDNSHostnamesLiveValidationValidationStep	5	2018-12-06 16:12:39.456	2018-12-06 16:12:39.471	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:39.471
94	3	multiDGConfigurationValidationValidationStep	2	2018-12-06 16:08:31.391	2018-12-06 16:08:31.409	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.409
95	3	matchingDiskTypeConfigurationValidationTaskletValidationStep	2	2018-12-06 16:08:31.416	2018-12-06 16:08:31.437	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.437
200	3	hostsVsanNetworkingConfigurationStep	6	2018-12-06 16:15:12.456	2018-12-06 16:15:13.727	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:13.727
176	3	hostVersionCompatibilityLiveValidationValidationStep	5	2018-12-06 16:12:39.477	2018-12-06 16:12:43.139	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:43.139
96	3	dnsHostnamesLiveValidationTaskletValidationStep	2	2018-12-06 16:08:31.443	2018-12-06 16:08:31.461	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.461
97	3	customizeModeDNSHostnamesLiveValidationValidationStep	2	2018-12-06 16:08:31.467	2018-12-06 16:08:31.487	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:31.487
177	3	externalVCCapacityLimitLiveValidationValidationStep	5	2018-12-06 16:12:43.144	2018-12-06 16:12:43.156	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:43.156
98	3	hostVersionCompatibilityLiveValidationValidationStep	2	2018-12-06 16:08:31.493	2018-12-06 16:08:31.511	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.511
201	3	hostsWitnessNetworkingConfigurationStep	6	2018-12-06 16:15:13.732	2018-12-06 16:15:13.741	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:13.741
178	3	expansionLimitConfigurationValidationValidationStep	5	2018-12-06 16:12:43.177	2018-12-06 16:12:43.194	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:43.194
223	3	ActionTasklet__1	8	2018-12-10 13:58:15.55	2018-12-10 13:58:20.717	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:20.717
179	3	expansionDiscoveredHostConfigurationValidationValidationStep	5	2018-12-06 16:12:43.201	2018-12-06 16:12:46.083	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:46.083
202	3	witnessTrafficConnectivityConfigurationStep	6	2018-12-06 16:15:13.746	2018-12-06 16:15:13.755	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:13.755
265	3	ActionTasklet__4	11	2018-12-10 14:25:53.204	2018-12-10 14:25:53.43	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:25:53.43
203	3	hostsVsanPolicyConfigurationStep	6	2018-12-06 16:15:13.76	2018-12-06 16:15:15.813	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:15.813
224	3	ActionTasklet__2	8	2018-12-10 13:58:20.732	2018-12-10 13:58:20.773	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:20.773
225	3	ActionTasklet__3	8	2018-12-10 13:58:20.791	2018-12-10 13:58:51.87	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:51.87
266	3	ActionTasklet__5	11	2018-12-10 14:25:53.439	2018-12-10 14:26:00.516	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:26:00.516
226	3	ActionTasklet__4	8	2018-12-10 13:58:51.886	2018-12-10 13:58:52.07	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:52.07
284	3	ActionTasklet__5	13	2018-12-10 14:34:43.464	2018-12-10 14:34:50.532	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:50.532
99	3	externalVCCapacityLimitLiveValidationValidationStep	2	2018-12-06 16:08:31.517	2018-12-06 16:08:31.54	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:31.54
180	3	physicalLinkLiveValidationValidationStep	5	2018-12-06 16:12:46.089	2018-12-06 16:12:46.102	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:12:46.102
204	3	hostsRemoveVSSConfigurationStep	6	2018-12-06 16:15:15.819	2018-12-06 16:15:16.891	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:16.891
100	3	expansionLimitConfigurationValidationValidationStep	2	2018-12-06 16:08:31.549	2018-12-06 16:08:31.565	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.565
101	3	expansionDiscoveredHostConfigurationValidationValidationStep	2	2018-12-06 16:08:31.571	2018-12-06 16:08:31.59	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.59
267	2	ActionTasklet__6	11	2018-12-10 14:26:00.526	2018-12-10 14:26:01.563	FAILED	0	0	0	0	0	0	0	1	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException: The IP 192.168.104.211 resolved for hostname engdell4-01.localdomain.local is not same as expected\n\tat com.emc.mystic.manager.operation.action.HostManagementIpResolveAction.config(HostManagementIpResolveAction.java:64)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 14:26:01.563
205	3	nicReassignmentConfigurationStep	6	2018-12-06 16:15:16.901	2018-12-06 16:15:27.979	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:27.979
102	3	physicalLinkLiveValidationValidationStep	2	2018-12-06 16:08:31.596	2018-12-06 16:08:31.611	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:31.611
227	3	ActionTasklet__5	8	2018-12-10 13:58:52.083	2018-12-10 13:58:59.165	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:58:59.165
103	3	timeSkewSyncValidationStep	3	2018-12-06 16:08:55.501	2018-12-06 16:08:57.544	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.545
206	3	hostsDNSConfigurationStep	6	2018-12-06 16:15:27.984	2018-12-06 16:15:28.062	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:28.063
104	3	hostNetworkValidationStep	3	2018-12-06 16:08:57.551	2018-12-06 16:08:57.57	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.57
105	3	netmaskValidationStep	3	2018-12-06 16:08:57.575	2018-12-06 16:08:57.591	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.591
207	3	hostsRestartLoudmouthConfigurationStep	6	2018-12-06 16:15:28.068	2018-12-06 16:15:36.551	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:15:36.551
106	3	overlapValidationStep	3	2018-12-06 16:08:57.596	2018-12-06 16:08:57.603	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.603
228	3	ActionTasklet__6	8	2018-12-10 13:58:59.179	2018-12-10 13:59:01.386	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:59:01.387
107	3	customizedHostsIpAvailabilityCursoryValidationStep	3	2018-12-06 16:08:57.608	2018-12-06 16:08:57.615	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.615
208	3	restartPTAgentConfigurationStep	6	2018-12-06 16:15:36.556	2018-12-06 16:16:54.503	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:16:54.503
268	3	ActionTasklet__6	12	2018-12-10 14:31:14.164	2018-12-10 14:31:15.192	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:31:15.192
229	3	ActionTasklet__7	8	2018-12-10 13:59:01.407	2018-12-10 13:59:02.414	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:59:02.415
230	3	ActionTasklet__8	8	2018-12-10 13:59:02.428	2018-12-10 13:59:11.71	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:59:11.71
269	3	ActionTasklet__7	12	2018-12-10 14:31:15.199	2018-12-10 14:31:18.359	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:31:18.359
231	3	ActionTasklet__9	8	2018-12-10 13:59:11.728	2018-12-10 13:59:12.364	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 13:59:12.364
232	2	ActionTasklet__10	8	2018-12-10 13:59:12.372	2018-12-10 13:59:47.729	FAILED	0	0	0	0	0	0	0	1	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.addHostToVc(HostJoinToClusterAction.java:121)\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.config(HostJoinToClusterAction.java:77)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 13:59:47.729
108	3	customizedHostnameValidationStep	3	2018-12-06 16:08:57.621	2018-12-06 16:08:57.627	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.628
109	3	passwordConfigurationValidationValidationStep	3	2018-12-06 16:08:57.633	2018-12-06 16:08:57.638	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.638
184	3	disableElectionConfigurationStep	6	2018-12-06 16:13:06.958	2018-12-06 16:13:10.683	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:13:10.683
181	3	suppressClusterMonitoringConfigurationStep	6	2018-12-06 16:13:05.796	2018-12-06 16:13:05.882	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:13:05.882
110	3	esxiUsernameValidationValidationStep	3	2018-12-06 16:08:57.643	2018-12-06 16:08:57.649	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.649
111	3	esxiPasswordValidationValidationStep	3	2018-12-06 16:08:57.654	2018-12-06 16:08:57.661	FAILED	1	0	0	0	0	0	0	0	FAILED		2018-12-06 16:08:57.661
182	3	trackHostsConfigurationStep	6	2018-12-06 16:13:05.892	2018-12-06 16:13:06.919	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:13:06.919
112	3	updateHardwareProfileValidationStep	3	2018-12-06 16:08:57.676	2018-12-06 16:08:57.686	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.686
270	3	ActionTasklet__8	12	2018-12-10 14:31:18.37	2018-12-10 14:31:27.943	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:31:27.944
113	3	hostsIpAvailabilityValidationStep	3	2018-12-06 16:08:57.692	2018-12-06 16:08:57.704	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.704
209	3	createMultiDGConfigurationStep	6	2018-12-06 16:16:54.509	2018-12-06 16:20:04.242	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:20:04.242
183	3	linkNetworkModelsConfigurationStep	6	2018-12-06 16:13:06.924	2018-12-06 16:13:06.951	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:13:06.951
114	3	customizedHostsIpAvailabilityValidationStep	3	2018-12-06 16:08:57.712	2018-12-06 16:08:57.722	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.722
233	3	ActionTasklet__10	9	2018-12-10 14:05:50.082	2018-12-10 14:05:59.86	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:05:59.86
115	3	vlanLiveValidationStep	3	2018-12-06 16:08:57.728	2018-12-06 16:08:57.734	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.734
116	3	esxiAccountsValidationValidationStep	3	2018-12-06 16:08:57.74	2018-12-06 16:08:57.749	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.749
210	3	hostsPasswordConfigurationStep	6	2018-12-06 16:20:04.251	2018-12-06 16:20:16.461	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:20:16.462
117	3	loginConfigurationValidationValidationStep	3	2018-12-06 16:08:57.755	2018-12-06 16:08:57.761	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.761
234	3	ActionTasklet__11	9	2018-12-10 14:05:59.878	2018-12-10 14:06:01.806	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:06:01.806
211	3	exitMaintenanceModeConfigurationStep	6	2018-12-06 16:20:16.467	2018-12-06 16:20:16.51	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:20:16.51
212	3	faultDomainsReconfigConfigurationStep	6	2018-12-06 16:20:16.515	2018-12-06 16:20:16.529	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:20:16.53
271	3	ActionTasklet__9	12	2018-12-10 14:31:27.952	2018-12-10 14:31:29.805	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:31:29.806
235	3	ActionTasklet__12	9	2018-12-10 14:06:01.815	2018-12-10 14:06:02.039	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:06:02.04
213	3	hostHAConfigurationStep	6	2018-12-06 16:20:16.534	2018-12-06 16:21:18.227	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:21:18.227
236	3	ActionTasklet__13	9	2018-12-10 14:06:02.049	2018-12-10 14:06:10.113	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:06:10.113
272	3	ActionTasklet__10	12	2018-12-10 14:31:29.814	2018-12-10 14:31:30.052	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:31:30.052
237	3	ActionTasklet__14	9	2018-12-10 14:06:10.125	2018-12-10 14:06:10.165	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:06:10.165
273	3	ActionTasklet__11	12	2018-12-10 14:31:30.058	2018-12-10 14:31:39.162	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:31:39.162
118	3	vcUserPermissionLiveValidationTaskletValidationStep	3	2018-12-06 16:08:57.767	2018-12-06 16:08:57.782	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.782
214	3	disableHostSecurityServiceConfigurationStep	6	2018-12-06 16:21:18.232	2018-12-06 16:21:18.427	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:21:18.427
119	3	timeConfigurationLiveValidationValidationStep	3	2018-12-06 16:08:57.788	2018-12-06 16:08:57.797	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.797
243	3	ActionTasklet__1	10	2018-12-10 14:10:31.688	2018-12-10 14:10:36.807	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:36.807
217	3	mysticExpansionConfigurationStep	6	2018-12-06 16:21:19.464	2018-12-06 16:22:16.162	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:22:16.162
120	3	multiDGConfigurationValidationValidationStep	3	2018-12-06 16:08:57.806	2018-12-06 16:08:57.812	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.812
215	3	hostAdjustSystemParamsConfigurationStep	6	2018-12-06 16:21:18.437	2018-12-06 16:21:18.444	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:21:18.445
121	3	matchingDiskTypeConfigurationValidationTaskletValidationStep	3	2018-12-06 16:08:57.817	2018-12-06 16:08:57.826	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.826
122	3	dnsHostnamesLiveValidationTaskletValidationStep	3	2018-12-06 16:08:57.832	2018-12-06 16:08:57.837	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.838
216	3	dismissAlarmConfigurationStep	6	2018-12-06 16:21:18.449	2018-12-06 16:21:19.459	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:21:19.459
123	3	customizeModeDNSHostnamesLiveValidationValidationStep	3	2018-12-06 16:08:57.844	2018-12-06 16:08:57.849	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.849
238	3	ActionTasklet__15	9	2018-12-10 14:06:10.177	2018-12-10 14:06:35.902	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:06:35.903
124	3	hostVersionCompatibilityLiveValidationValidationStep	3	2018-12-06 16:08:57.855	2018-12-06 16:08:57.861	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.861
274	3	ActionTasklet__12	12	2018-12-10 14:31:39.17	2018-12-10 14:31:39.196	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:31:39.196
125	3	externalVCCapacityLimitLiveValidationValidationStep	3	2018-12-06 16:08:57.866	2018-12-06 16:08:57.872	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-06 16:08:57.872
239	3	PostcheckTasklet	9	2018-12-10 14:06:35.913	2018-12-10 14:06:41.015	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:06:41.015
126	3	expansionLimitConfigurationValidationValidationStep	3	2018-12-06 16:08:57.878	2018-12-06 16:08:57.883	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.883
240	3	PrecheckTasklet	10	2018-12-10 14:10:18.038	2018-12-10 14:10:30.577	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:30.577
275	3	ActionTasklet__13	12	2018-12-10 14:31:39.212	2018-12-10 14:32:06.444	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:32:06.444
241	3	ValidationTasklet	10	2018-12-10 14:10:30.586	2018-12-10 14:10:31.635	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:31.636
242	3	ActionTasklet	10	2018-12-10 14:10:31.645	2018-12-10 14:10:31.677	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:31.677
276	3	PostcheckTasklet	12	2018-12-10 14:32:06.454	2018-12-10 14:32:14.567	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:32:14.567
285	2	ActionTasklet__6	13	2018-12-10 14:34:50.544	2018-12-10 14:34:51.571	FAILED	0	0	0	0	0	0	0	1	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException: The IP 192.168.104.215 resolved for hostname engdell4-01.localdomain.local is not same as expected\n\tat com.emc.mystic.manager.operation.action.HostManagementIpResolveAction.config(HostManagementIpResolveAction.java:64)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 14:34:51.571
244	3	ActionTasklet__2	10	2018-12-10 14:10:36.82	2018-12-10 14:10:36.854	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:36.854
127	3	expansionDiscoveredHostConfigurationValidationValidationStep	3	2018-12-06 16:08:57.889	2018-12-06 16:08:57.894	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.894
128	3	physicalLinkLiveValidationValidationStep	3	2018-12-06 16:08:57.9	2018-12-06 16:08:57.906	UNKNOWN	1	0	0	0	0	0	0	0	UNKNOWN		2018-12-06 16:08:57.906
245	3	ActionTasklet__3	10	2018-12-10 14:10:36.864	2018-12-10 14:10:39.927	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:39.927
277	3	PrecheckTasklet	13	2018-12-10 14:34:15.112	2018-12-10 14:34:31.402	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:31.402
246	3	ActionTasklet__4	10	2018-12-10 14:10:39.935	2018-12-10 14:10:40.165	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:40.165
247	3	ActionTasklet__5	10	2018-12-10 14:10:40.172	2018-12-10 14:10:47.246	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:47.247
278	3	ValidationTasklet	13	2018-12-10 14:34:31.413	2018-12-10 14:34:34.436	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:34.436
248	3	ActionTasklet__6	10	2018-12-10 14:10:47.253	2018-12-10 14:10:49.448	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:49.448
249	3	ActionTasklet__7	10	2018-12-10 14:10:49.458	2018-12-10 14:10:50.595	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:50.595
279	3	ActionTasklet	13	2018-12-10 14:34:34.443	2018-12-10 14:34:34.471	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:34.471
250	3	ActionTasklet__8	10	2018-12-10 14:10:50.619	2018-12-10 14:10:58.662	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:58.663
251	3	ActionTasklet__9	10	2018-12-10 14:10:58.672	2018-12-10 14:10:59.281	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:10:59.282
280	3	ActionTasklet__1	13	2018-12-10 14:34:34.484	2018-12-10 14:34:39.606	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:39.606
252	3	ActionTasklet__10	10	2018-12-10 14:10:59.29	2018-12-10 14:11:08.831	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:11:08.831
253	3	ActionTasklet__11	10	2018-12-10 14:11:08.838	2018-12-10 14:11:10.705	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:11:10.705
281	3	ActionTasklet__2	13	2018-12-10 14:34:39.615	2018-12-10 14:34:39.637	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:39.638
254	3	ActionTasklet__12	10	2018-12-10 14:11:10.712	2018-12-10 14:11:10.952	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:11:10.952
282	3	ActionTasklet__3	13	2018-12-10 14:34:39.647	2018-12-10 14:34:43.221	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:43.221
283	3	ActionTasklet__4	13	2018-12-10 14:34:43.23	2018-12-10 14:34:43.455	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:34:43.455
286	3	ActionTasklet__6	14	2018-12-10 14:36:53.806	2018-12-10 14:36:54.836	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:36:54.836
287	3	ActionTasklet__7	14	2018-12-10 14:36:54.848	2018-12-10 14:36:57.942	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:36:57.943
288	2	ActionTasklet__8	14	2018-12-10 14:36:57.951	2018-12-10 14:39:01.713	FAILED	0	0	0	0	0	0	0	1	CONFIG_FAIL	com.emc.mystic.manager.operation.core.exception.ActionException\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.addHostToVc(HostJoinToClusterAction.java:121)\n\tat com.emc.mystic.manager.operation.action.HostJoinToClusterAction.config(HostJoinToClusterAction.java:77)\n\tat com.emc.mystic.manager.operation.core.component.Action.execute(Action.java:21)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:69)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet$1.doWithRetry(AbstractProcessTasklet.java:66)\n\tat org.springframework.retry.support.RetryTemplate.doExecute(RetryTemplate.java:263)\n\tat org.springframework.retry.support.RetryTemplate.execute(RetryTemplate.java:154)\n\tat com.emc.mystic.manager.operation.core.tasklets.AbstractProcessTasklet.execute(AbstractProcessTasklet.java:66)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:406)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$ChunkTransactionCallback.doInTransaction(TaskletStep.java:330)\n\tat org.springframework.transaction.support.TransactionTemplate.execute(TransactionTemplate.java:133)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep$2.doInChunkContext(TaskletStep.java:271)\n\tat org.springframework.batch.core.scope.context.StepContextRepeatCallback.doInIteration(StepContextRepeatCallback.java:81)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.getNextResult(RepeatTemplate.java:374)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.executeInternal(RepeatTemplate.java:215)\n\tat org.springframework.batch.repeat.support.RepeatTemplate.iterate(RepeatTemplate.java:144)\n\tat org.springframework.batch.core.step.tasklet.TaskletStep.doExecute(TaskletStep.java:257)\n\tat org.springframework.batch.core.step.AbstractStep.execute(AbstractStep.java:200)\n\tat org.springframework.batch.core.job.SimpleStepHandler.handleStep(SimpleStepHandler.java:148)\n\tat org.springframework.batch.core.job.AbstractJob.handleStep(AbstractJob.java:392)\n\tat org.springframework.batch.core.job.SimpleJob.doExecute(SimpleJob.java:135)\n\tat org.springframework.batch.core.job.AbstractJob.execute(AbstractJob.java:306)\n\tat com.vce.commons.core.batch.SensitiveJobLauncher$1.run(SensitiveJobLauncher.java:125)\n\tat java.lang.Thread.run(Thread.java:748)\n	2018-12-10 14:39:01.714
289	3	ActionTasklet__8	15	2018-12-10 14:40:33.346	2018-12-10 14:40:42.855	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:40:42.855
290	3	ActionTasklet__9	15	2018-12-10 14:40:42.876	2018-12-10 14:40:44.729	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:40:44.729
291	3	ActionTasklet__10	15	2018-12-10 14:40:44.737	2018-12-10 14:40:44.956	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:40:44.957
292	3	ActionTasklet__11	15	2018-12-10 14:40:44.964	2018-12-10 14:40:52.702	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:40:52.702
293	3	ActionTasklet__12	15	2018-12-10 14:40:52.712	2018-12-10 14:40:52.737	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:40:52.737
294	3	ActionTasklet__13	15	2018-12-10 14:40:52.747	2018-12-10 14:41:16.964	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:41:16.964
295	3	PostcheckTasklet	15	2018-12-10 14:41:16.983	2018-12-10 14:41:25.368	COMPLETED	1	0	0	0	0	0	0	0	COMPLETED		2018-12-10 14:41:25.368
\.


--
-- Data for Name: batch_step_execution_context; Type: TABLE DATA; Schema: public; Owner: batch
--

COPY public.batch_step_execution_context (step_execution_id, short_context, serialized_context) FROM stdin;
7	{"map":[{"entry":[{"string":["logUUID","f3bcc062-e7c9-40ee-8247-b094adc78571"]},{"string":["messageKey","config.action.standalone.vmdgvsan.destroy"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
1	{"map":[{"entry":[{"string":["logUUID","91fb5688-b4f4-4ce0-a976-83a71ff50886"]},{"string":["messageKey","config.action.standalone.disable.election"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
2	{"map":[{"entry":[{"string":["logUUID","80e76793-c76c-4dbe-8d23-fe1ee7fe6a47"]},{"string":["messageKey","config.action.standalone.loginsight.poweron"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
8	{"map":[{"entry":[{"string":["logUUID","bb2fb1a2-aff8-4350-ba53-3098540f9ef5"]},{"string":["messageKey","config.action.standalone.remove.unused.system.vm"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
3	{"map":[{"entry":[{"string":["logUUID","f98ef849-29b9-47f6-907d-285d52b570b7"]},{"string":["messageKey","config.action.standalone.store.virtual.machines"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
38	{"map":[{"entry":[{"string":["logUUID","955f2293-43fd-43b4-a2b0-4158ffa1d659"]},{"string":["messageKey","config.action.shared.hosts.free.standby.nics"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
4	{"map":[{"entry":[{"string":["logUUID","1922b595-2c79-42e1-986d-66b2e00ceae6"]},{"string":["messageKey","config.action.standalone.store.network.model"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
9	{"map":[{"entry":[{"string":["logUUID","b034505c-a9de-4d40-8e38-5ea29c9ed5ba"]},{"string":["messageKey","config.action.standalone.esrs.rsc"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
5	{"map":[{"entry":[{"string":["logUUID","383981dd-6fad-40a1-a8fa-a3799ec4d106"]},{"string":["messageKey","config.action.shared.network.models.link"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
6	{"map":[{"entry":[{"string":["logUUID","fb30a67d-b2d5-4b89-a94c-b1e55d9a1368"]},{"string":["messageKey","config.action.standalone.vxrailManager.autostart"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
129	{"map":[{"entry":[{"string":["logUUID","83a2af89-69d7-4af1-985a-9753cfa9ae32"]},{"string":["messageKey","config.action.expansion.validation.host.time.sync"]},{"string":["stage","validation_time"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeSkewSyncValidationTasklet$$EnhancerBySpringCGLIB$$1628a306"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
39	{"map":[{"entry":[{"string":["logUUID","c6344e06-710c-4308-adf8-22bf6d53e668"]},{"string":["messageKey","config.action.shared.vds.host.register"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
10	{"map":[{"entry":[{"string":["logUUID","b2c7b764-920a-411b-828d-36f06f948093"]},{"string":["messageKey","config.action.standalone.evo.password"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
11	{"map":[{"entry":[{"string":["logUUID","7242c837-f89e-4b8f-9250-7d4788dfbb6b"]},{"string":["messageKey","config.action.standalone.hosts.discovery"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
155	{"map":[{"entry":[{"string":["logUUID","1f407166-086a-4a2a-ab79-404adb7dc28a"]},{"string":["messageKey","config.action.expansion.validation.host.time.sync"]},{"string":["stage","validation_time"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeSkewSyncValidationTasklet$$EnhancerBySpringCGLIB$$1628a306"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
40	{"map":[{"entry":[{"string":["logUUID","4ed23d9a-d06b-4e24-ab93-f5edac2e0231"]},{"string":["messageKey","config.action.standalone.vc.dvs.portgroup"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
185	{"map":[{"entry":[{"string":["logUUID","94dfed18-3523-4b67-a64d-c00a5f54953f"]},{"string":["messageKey","config.action.standalone.vc.vcconnection"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
218	{"map":[{"entry":[{"string":["logUUID","b410a5b7-d558-47ec-88c6-fa4bb46cd5df"]},{"string":["messageKey","config.action.shared.finalize"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
258	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PostcheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
130	{"map":[{"entry":[{"string":["logUUID","4d8f5727-79f0-4587-bfde-a26a786a9587"]},{"string":["messageKey","config.action.expansion.validation.host.network.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostNetworkValidationTasklet$$EnhancerBySpringCGLIB$$74bb8df4"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
12	{"map":[{"entry":[{"string":["logUUID","64400a58-77ca-41c6-b0db-7610d2eb584c"]},{"string":["messageKey","config.action.shared.hosts.network.management"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
41	{"map":[{"entry":[{"string":["logUUID","e5c2cbc1-709a-4b0b-9db0-5a6cb53f907b"]},{"string":["messageKey","config.action.shared.hosts.network.infrastructure"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
13	{"map":[{"entry":[{"string":["logUUID","ef6c2619-643e-470c-9af3-5ecd665a6d33"]},{"string":["messageKey","config.action.shared.hosts.time"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
15	{"map":[{"entry":[{"string":["logUUID","b4a22ef2-ed9a-4a3b-94c6-08e6b2309276"]},{"string":["messageKey","config.action.standalone.evo.time"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
42	{"map":[{"entry":[{"string":["logUUID","2144e77c-2e30-486f-9115-3e22e0ad8403"]},{"string":["messageKey","config.action.standalone.hosts.network.vcsa"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
16	{"map":[{"entry":[{"string":["logUUID","c75f61f9-4e0e-4e4b-8785-85152c4871a3"]},{"string":["messageKey","config.action.standalone.psc.firstboot"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
156	{"map":[{"entry":[{"string":["logUUID","bebb7288-0619-46d5-bea9-2db52222a841"]},{"string":["messageKey","config.action.expansion.validation.host.network.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostNetworkValidationTasklet$$EnhancerBySpringCGLIB$$74bb8df4"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
131	{"map":[{"entry":[{"string":["logUUID","e44c953c-82a1-43c2-a6ff-29e6fdca6264"]},{"string":["messageKey","config.action.expansion.validation.netmask.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.NetmaskValidationTasklet$$EnhancerBySpringCGLIB$$1f0a8771"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
43	{"map":[{"entry":[{"string":["logUUID","106c34e4-118e-45f7-99f8-29e024813700"]},{"string":["messageKey","config.action.shared.hosts.remove.vss"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
44	{"map":[{"entry":[{"string":["logUUID","e8719318-2035-449b-bd35-4bf1d0dec3ef"]},{"string":["messageKey","config.action.shared.hosts.reassign.nics"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
132	{"map":[{"entry":[{"string":["logUUID","6aca60af-a756-4122-9942-2fa0776c236d"]},{"string":["messageKey","config.action.expansion.validation.overlap.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.OverlapValidationTasklet$$EnhancerBySpringCGLIB$$80545573"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
45	{"map":[{"entry":[{"string":["logUUID","33d9a1e5-a5af-4fae-83e5-f92c37ffac63"]},{"string":["messageKey","config.action.shared.hosts.cluster"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
186	{"map":[{"entry":[{"string":["logUUID","71a9ec3e-60ae-4d52-860f-b350dfaf12d1"]},{"string":["messageKey","config.action.expansion.hosts.unregister"]},{"string":["stage","host_registration"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
157	{"map":[{"entry":[{"string":["logUUID","82440c09-9e2b-484f-98dd-e26619091a69"]},{"string":["messageKey","config.action.expansion.validation.netmask.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.NetmaskValidationTasklet$$EnhancerBySpringCGLIB$$1f0a8771"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
187	{"map":[{"entry":[{"string":["logUUID","29316b5c-d50f-4cbb-9772-5fb1d39520bb"]},{"string":["messageKey","config.action.standalone.vmdgvsan.destroy"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
219	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PrecheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
259	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PrecheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
220	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PrecheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
14	{"map":[{"entry":[{"string":["logUUID","ec482b6b-9f2d-49e2-b847-f7b6a58e6693"]},{"string":["messageKey","config.action.standalone.evo.hostname"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
46	{"map":[{"entry":[{"string":["logUUID","f5317020-9164-4125-9361-d8f4fee78bbc"]},{"string":["messageKey","config.action.shared.hosts.dns"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
17	{"map":[{"entry":[{"string":["logUUID","ee046284-48dc-41d8-a58b-0cd1fa2c80a8"]},{"string":["messageKey","config.action.standalone.cloudvm.firstboot"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
133	{"map":[{"entry":[{"string":["logUUID","3259756b-e733-4940-b101-2ec0a6718e68"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityCursoryValidationTasklet$$EnhancerBySpringCGLIB$$9467a661"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
18	{"map":[{"entry":[{"string":["logUUID","f9ae1c99-a6bd-4fde-bfa8-23e9900c1bde"]},{"string":["messageKey","config.action.standalone.vc.dns"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
50	{"map":[{"entry":[{"string":["logUUID","6b015ea5-cc5d-4399-abe1-d97e8fb0165b"]},{"string":["messageKey","config.action.shared.hosts.vsan.networking"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
47	{"map":[{"entry":[{"string":["logUUID","4c80e92a-1261-433a-9121-4d51714d321b"]},{"string":["messageKey","config.action.shared.hosts.loudmouth.restart"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
19	{"map":[{"entry":[{"string":["logUUID","f4d93b1b-294a-4855-a4e3-4d8c8ba8d90e"]},{"string":["messageKey","config.action.standalone.cloudvm.firstboot"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
20	{"map":[{"entry":[{"string":["logUUID","1cb300b3-8cb0-44be-94c6-c42c2b7b1256"]},{"string":["messageKey","config.action.standalone.cloudvm.firstboot"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
48	{"map":[{"entry":[{"string":["logUUID","bc645d09-15ac-4b02-87e2-217fd9bab2ce"]},{"string":["messageKey","config.action.shared.hosts.ptagent.service.restart"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
21	{"map":[{"entry":[{"string":["logUUID","e894e172-ed7b-4025-82b6-398d2d6799d5"]},{"string":["messageKey","config.action.standalone.vc.vcconnection"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
158	{"map":[{"entry":[{"string":["logUUID","20fe803f-62f4-4782-85d6-1b6245dd7104"]},{"string":["messageKey","config.action.expansion.validation.overlap.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.OverlapValidationTasklet$$EnhancerBySpringCGLIB$$80545573"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
22	{"map":[{"entry":[{"string":["logUUID","33a5d8f1-19ed-4aee-9a80-f4e05b31c8f8"]},{"string":["messageKey","config.action.shared.hosts.ptagent.restip.change"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
134	{"map":[{"entry":[{"string":["logUUID","2d44c33d-36a9-44ae-9dcc-1a9192c550a2"]},{"string":["messageKey","config.action.expansion.validation.host.name"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostnameValidationTasklet$$EnhancerBySpringCGLIB$$e9359064"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
49	{"map":[{"entry":[{"string":["logUUID","fccc2f00-f8d9-4f4d-a749-7bb7839434ab"]},{"string":["messageKey","config.action.standalone.vc.licensing"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
135	{"map":[{"entry":[{"string":["logUUID","6833a83e-aaba-459f-84fd-04e487f05c47"]},{"string":["messageKey","config.action.expansion.validation.accounts.basic"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PasswordConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$fdb0f35f"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
188	{"map":[{"entry":[{"string":["logUUID","4a07b005-a629-4794-9fd1-638bddfa6e68"]},{"string":["messageKey","config.action.expansion.hosts.maintenance.enter"]},{"string":["stage","host_registration"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
221	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ValidationTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
260	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ValidationTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
51	{"map":[{"entry":[{"string":["logUUID","cd0f7516-2160-4f87-bd8d-8299bf813a55"]},{"string":["messageKey","config.action.standalone.vc.witness.traffic.connectivity"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
25	{"map":[{"entry":[{"string":["logUUID","c551d6ef-2dc9-4fdc-acdc-f4bfd4c2a8ae"]},{"string":["messageKey","config.action.standalone.vxrail.syslog"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
61	{"map":[{"entry":[{"string":["logUUID","78f5717a-ad86-4c14-b5aa-c130699d29f3"]},{"string":["messageKey","config.action.standalone.loginsight.autostart"]},{"string":["stage","cluster_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
24	{"map":[{"entry":[{"string":["logUUID","b763b153-5610-4ea4-9641-7bd85c787fd9"]},{"string":["messageKey","config.action.standalone.loginsight"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
52	{"map":[{"entry":[{"string":["logUUID","9a76492b-b10f-4870-8595-38817e21e212"]},{"string":["messageKey","config.action.shared.hosts.witness.networking"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
26	{"map":[{"entry":[{"string":["logUUID","f8fbfb70-14f0-43a0-acf0-ffee6a5d4af4"]},{"string":["messageKey","config.action.shared.hosts.syslog"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
159	{"map":[{"entry":[{"string":["logUUID","b008da2c-924a-4c25-ab21-1a75808b4c79"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityCursoryValidationTasklet$$EnhancerBySpringCGLIB$$9467a661"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
29	{"map":[{"entry":[{"string":["logUUID","af84d213-a207-42d0-970c-6840a7e92f0e"]},{"string":["messageKey","config.action.standalone.vc.ad"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
53	{"map":[{"entry":[{"string":["logUUID","13f72ec5-8718-4664-b111-d7e076f4b10d"]},{"string":["messageKey","config.action.shared.hosts.vsan.policies"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
30	{"map":[{"entry":[{"string":["logUUID","89df3fb2-a2f3-4b94-b19c-9f0508ba2fca"]},{"string":["messageKey","config.action.standalone.vc.account.management"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
136	{"map":[{"entry":[{"string":["logUUID","ced11cb3-63e9-46c8-9493-1c006cf2feda"]},{"string":["messageKey","config.action.expansion.validation.esxi.username"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiUsernameValidationTasklet$$EnhancerBySpringCGLIB$$50734943"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
54	{"map":[{"entry":[{"string":["logUUID","c4a5d90b-c9ad-405e-9ff3-ff24dd63b28c"]},{"string":["messageKey","config.action.standalone.vc.dg"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
28	{"map":[{"entry":[{"string":["logUUID","1c6dbe41-1a52-45c0-b2d9-686d692620d8"]},{"string":["messageKey","config.action.standalone.evo.loudmouth.restart"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
60	{"map":[{"entry":[{"string":["logUUID","28157066-721b-4460-87b5-97b65677ac2a"]},{"string":["messageKey","config.action.standalone.vc.autostart"]},{"string":["stage","cluster_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
62	{"map":[{"entry":[{"string":["logUUID","aa205f27-c06e-4e62-ab8d-f05ff87202b4"]},{"string":["messageKey","config.action.shared.evc"]},{"string":["stage","cluster_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
189	{"map":[{"entry":[{"string":["logUUID","1c55a6e4-968c-4af2-8b31-bc784e64b018"]},{"string":["messageKey","config.action.shared.hosts.network.management"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
137	{"map":[{"entry":[{"string":["logUUID","cda39744-55c4-4f19-8a79-142dceb676f4"]},{"string":["messageKey","config.action.expansion.validation.esxi.password"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiPasswordValidationTasklet$$EnhancerBySpringCGLIB$$1acffede"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
160	{"map":[{"entry":[{"string":["logUUID","83ccf30c-71df-4599-bf75-aaa19d8449ed"]},{"string":["messageKey","config.action.expansion.validation.host.name"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostnameValidationTasklet$$EnhancerBySpringCGLIB$$e9359064"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
222	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
23	{"map":[{"entry":[{"string":["logUUID","d7e59b29-e6a6-4272-8e7c-565831618268"]},{"string":["messageKey","config.action.standalone.vc.proxy"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
27	{"map":[{"entry":[{"string":["logUUID","4dc02fe2-4ef8-4f8f-b5aa-98790beabc62"]},{"string":["messageKey","config.action.standalone.vc.syslog"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
55	{"map":[{"entry":[{"string":["logUUID","7e8afdc0-5cc7-45fe-9e68-a52de104d52e"]},{"string":["messageKey","config.action.standalone.vc.stretchedcluster"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
63	{"map":[{"entry":[{"string":["logUUID","93ff672a-f964-4324-ac65-c4022e659010"]},{"string":["messageKey","config.action.standalone.vc.drs"]},{"string":["stage","cluster_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
68	{"map":[{"entry":[{"string":["logUUID","f6b562a8-4e30-44e3-9ecc-522fc672834b"]},{"string":["messageKey","config.action.standalone.cloudvm.password.expiration"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
64	{"map":[{"entry":[{"string":["logUUID","c6c56026-7e94-487d-9440-027f2069b286"]},{"string":["messageKey","config.action.standalone.vc.vxrail.plugin"]},{"string":["stage","cloud_vm"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
138	{"map":[{"entry":[{"string":["logUUID","7249e508-a507-4aca-9241-90c87fa2320c"]},{"string":["messageKey","config.action.expansion.update.hardware.profile"]},{"string":["stage","update_hardware_profile"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.UpdateHardwareProfileTasklet$$EnhancerBySpringCGLIB$$11a4597b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
65	{"map":[{"entry":[{"string":["logUUID","bdbaa393-77a4-4dbb-9ba9-6059e71fc4dd"]},{"string":["messageKey","config.action.shared.hosts.password"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
69	{"map":[{"entry":[{"string":["logUUID","ed62ee2a-10ae-422e-a0c9-38fb02a58597"]},{"string":["messageKey","config.action.standalone.hosts.system.parameters.readjustment"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
66	{"map":[{"entry":[{"string":["logUUID","4f900ea4-1b9e-4e8b-93b9-cf2ecd3998f1"]},{"string":["messageKey","config.action.standalone.vc.mdns"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
161	{"map":[{"entry":[{"string":["logUUID","3a0d17b4-516f-4553-8278-4b0b6a563020"]},{"string":["messageKey","config.action.expansion.validation.accounts.basic"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PasswordConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$fdb0f35f"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
67	{"map":[{"entry":[{"string":["logUUID","f258e2a7-7e23-4881-b86e-2a8803ca6d65"]},{"string":["messageKey","config.action.shared.hosts.enable.ha"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
139	{"map":[{"entry":[{"string":["logUUID","e1aed9d0-7f34-4b89-b776-d40a7c982b69"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$2226c98e"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
70	{"map":[{"entry":[{"string":["logUUID","85037f22-7075-4110-91f3-502c77968b73"]},{"string":["messageKey","config.action.shared.hosts.disable.security.service"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
190	{"map":[{"entry":[{"string":["logUUID","fd4bbd3b-4077-4257-9ea4-749cc7552456"]},{"string":["messageKey","config.action.shared.hosts.ptagent.restip.change"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
162	{"map":[{"entry":[{"string":["logUUID","876b8412-3fe6-4b59-9d1d-3a67048fb8fb"]},{"string":["messageKey","config.action.expansion.validation.esxi.username"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiUsernameValidationTasklet$$EnhancerBySpringCGLIB$$50734943"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
223	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
191	{"map":[{"entry":[{"string":["logUUID","2db64295-1ae8-468f-b64a-aefa87fdf2c9"]},{"string":["messageKey","config.action.shared.hosts.time"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
261	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
31	{"map":[{"entry":[{"string":["logUUID","e32e9649-13a2-4f00-aa54-5dbbca0ab676"]},{"string":["messageKey","config.action.standalone.vc.datacenter"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
37	{"map":[{"entry":[{"string":["logUUID","45d5a557-8bfa-44e1-9bbf-f0c52048ae41"]},{"string":["messageKey","config.action.shared.vds.host.register"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
32	{"map":[{"entry":[{"string":["logUUID","df4b5fa4-7c47-403c-834a-73e1b3cc6b50"]},{"string":["messageKey","config.action.shared.hosts.register"]},{"string":["stage","host_registration"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
33	{"map":[{"entry":[{"string":["logUUID","765bca8e-a7bd-4568-ba4a-338d8751762c"]},{"string":["messageKey","config.action.shared.hosts.network.hostname"]},{"string":["stage","host_registration"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
140	{"map":[{"entry":[{"string":["logUUID","f239b858-2ef2-4abb-81d8-cfcf116fa472"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$cc8ffce"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
56	{"map":[{"entry":[{"string":["logUUID","acb936f1-17b8-4348-9725-2462fc8c529a"]},{"string":["messageKey","config.action.standalone.vc.spbm"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
34	{"map":[{"entry":[{"string":["logUUID","3e5536b5-e3c8-40e9-9b19-c7703cdd2b52"]},{"string":["messageKey","config.action.standalone.vc.dvs"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
75	{"map":[{"entry":[{"string":["logUUID","94f10c52-b263-4aca-bb31-5690ca8fae05"]},{"string":["messageKey","config.action.shared.finalize"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
35	{"map":[{"entry":[{"string":["logUUID","6e7ee956-a23b-4e43-8b92-e6b039b862b6"]},{"string":["messageKey","config.action.standalone.vc.traffic.resource"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
57	{"map":[{"entry":[{"string":["logUUID","3b5fc604-edd7-4c09-9648-039476bb51cf"]},{"string":["messageKey","config.action.standalone.vc.spbm"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
36	{"map":[{"entry":[{"string":["logUUID","132cd8fb-bdd7-4bbd-94b5-e06cd2aa7e71"]},{"string":["messageKey","config.action.standalone.vc.enable.nioc"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
59	{"map":[{"entry":[{"string":["logUUID","8275adee-9714-4d55-9c03-04bf3e70288b"]},{"string":["messageKey","config.action.standalone.vc.account.management.alias"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
58	{"map":[{"entry":[{"string":["logUUID","57c4b597-2e50-4b90-8e71-7e12f94c60a5"]},{"string":["messageKey","config.action.standalone.vc.datastore"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
76	{"map":[{"entry":[{"string":["logUUID","ac6cfc14-904e-4a3d-bcc1-e7a8a71db5d9"]},{"string":["messageKey","config.action.standalone.finish"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
141	{"map":[{"entry":[{"string":["logUUID","47c26916-9573-4e28-ba09-503174441a59"]},{"string":["messageKey","config.action.expansion.validation.vlan.live"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionVlanLiveValidationTasklet$$EnhancerBySpringCGLIB$$b4d810cc"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
224	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
77	{"map":[{"entry":[{"string":["logUUID","a4b8067f-be21-433b-9675-985b269bcb58"]},{"string":["messageKey","config.action.expansion.validation.host.time.sync"]},{"string":["stage","validation_time"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeSkewSyncValidationTasklet$$EnhancerBySpringCGLIB$$1628a306"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
163	{"map":[{"entry":[{"string":["logUUID","1b16b19c-327c-4291-884e-45c38c2ad00a"]},{"string":["messageKey","config.action.expansion.validation.esxi.password"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiPasswordValidationTasklet$$EnhancerBySpringCGLIB$$1acffede"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
192	{"map":[{"entry":[{"string":["logUUID","078dd065-3baf-4d60-a9a2-c88b1c2b11ce"]},{"string":["messageKey","config.action.shared.hosts.syslog"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
262	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
71	{"map":[{"entry":[{"string":["logUUID","c8c2c606-5440-401b-b62b-0ecfe61dece4"]},{"string":["messageKey","config.action.shared.hosts.reset.alarm"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
72	{"map":[{"entry":[{"string":["logUUID","efd40f38-cc96-4804-a0b1-782c7f9cc6de"]},{"string":["messageKey","config.action.standalone.ovf"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
142	{"map":[{"entry":[{"string":["logUUID","916127a5-4b72-4638-993d-c918c60937ef"]},{"string":["messageKey","config.action.expansion.validation.esxi.accounts"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ESXiAccountsValidationTasklet$$EnhancerBySpringCGLIB$$d2b6b033"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
73	{"map":[{"entry":[{"string":["logUUID","bd3c76a2-f519-4a70-ac5c-fd7d191f4145"]},{"string":["messageKey","config.action.standalone.vmw.ovf"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
164	{"map":[{"entry":[{"string":["logUUID","22210cef-b8f7-41c7-8bf7-babd56a2301d"]},{"string":["messageKey","config.action.expansion.update.hardware.profile"]},{"string":["stage","update_hardware_profile"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.UpdateHardwareProfileTasklet$$EnhancerBySpringCGLIB$$11a4597b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
74	{"map":[{"entry":[{"string":["logUUID","824859fd-1d19-4c76-ad27-e9dfe78213d7"]},{"string":["messageKey","config.action.standalone.mystic"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
143	{"map":[{"entry":[{"string":["logUUID","f8afef18-ceea-4a92-b0c8-fb8abf0a44dd"]},{"string":["messageKey","config.action.expansion.validation.vc.user.login"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.LoginConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$355b8d0b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
225	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
144	{"map":[{"entry":[{"string":["logUUID","6a7ce18b-3b95-42ee-a353-8efa2d231a61"]},{"string":["messageKey","config.action.expansion.validation.vc.user.permission"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.VCUserPermissionLiveValidationTasklet$$EnhancerBySpringCGLIB$$3746f25"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
193	{"map":[{"entry":[{"string":["logUUID","e9b8243f-2b2b-4b93-9d3f-aee123a7f6f4"]},{"string":["messageKey","config.action.shared.hosts.register"]},{"string":["stage","host_registration"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
165	{"map":[{"entry":[{"string":["logUUID","5238eb8f-89f7-46b2-a6cf-55e5c995de6a"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$2226c98e"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
145	{"map":[{"entry":[{"string":["logUUID","af2f2514-7ea0-4a41-9601-64207ccd1851"]},{"string":["messageKey","config.action.expansion.validation.time.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeConfigurationLiveValidationTasklet$$EnhancerBySpringCGLIB$$7bd4ce85"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
166	{"map":[{"entry":[{"string":["logUUID","f882bfcb-02f2-4b30-8153-78e8330c42fa"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$cc8ffce"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
194	{"map":[{"entry":[{"string":["logUUID","3c94f2ee-b822-4121-aa72-81c6a4c40fad"]},{"string":["messageKey","config.action.expansion.hosts.license.verify"]},{"string":["stage","host_registration"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
263	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
226	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
227	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
264	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
78	{"map":[{"entry":[{"string":["logUUID","e338e2c2-4c0e-4756-9a76-f2cd37a8cfd3"]},{"string":["messageKey","config.action.expansion.validation.host.network.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostNetworkValidationTasklet$$EnhancerBySpringCGLIB$$74bb8df4"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
146	{"map":[{"entry":[{"string":["logUUID","998576a1-9c7b-4511-ba50-0fdf00c7c07c"]},{"string":["messageKey","config.action.expansion.validation.multi.dg"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MultiDGConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$d67dacde"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
79	{"map":[{"entry":[{"string":["logUUID","89fd9879-f58a-495a-b0ad-b42ee56af61a"]},{"string":["messageKey","config.action.expansion.validation.netmask.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.NetmaskValidationTasklet$$EnhancerBySpringCGLIB$$1f0a8771"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
195	{"map":[{"entry":[{"string":["logUUID","cc1b7ff9-8e47-4aa5-98b4-b30d17c48907"]},{"string":["messageKey","config.action.shared.hosts.network.hostname"]},{"string":["stage","host_registration"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
80	{"map":[{"entry":[{"string":["logUUID","d48c1279-e587-4ae2-96ac-553b3cd975ba"]},{"string":["messageKey","config.action.expansion.validation.overlap.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.OverlapValidationTasklet$$EnhancerBySpringCGLIB$$80545573"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
147	{"map":[{"entry":[{"string":["logUUID","7f6625aa-c998-4ba7-8a4e-623c02c9cbb9"]},{"string":["messageKey","config.action.expansion.validation.disk.type"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MatchingDiskTypeConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$937e53d8"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
81	{"map":[{"entry":[{"string":["logUUID","93dcf238-a85d-487d-beb7-239babfcc0ce"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityCursoryValidationTasklet$$EnhancerBySpringCGLIB$$9467a661"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
167	{"map":[{"entry":[{"string":["logUUID","d62b3425-ee63-404b-a65f-0a59c1ffc14c"]},{"string":["messageKey","config.action.expansion.validation.vlan.live"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionVlanLiveValidationTasklet$$EnhancerBySpringCGLIB$$b4d810cc"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
82	{"map":[{"entry":[{"string":["logUUID","f18194f0-903e-4f06-afaa-add3b594185b"]},{"string":["messageKey","config.action.expansion.validation.host.name"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostnameValidationTasklet$$EnhancerBySpringCGLIB$$e9359064"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
148	{"map":[{"entry":[{"string":["logUUID","c239d071-25c3-4deb-b83d-160d182d82b1"]},{"string":["messageKey","config.action.expansion.validation.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.DNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$be1d0115"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
228	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
149	{"map":[{"entry":[{"string":["logUUID","b13a6fa3-f010-4062-8a69-e152ae5dae2b"]},{"string":["messageKey","config.action.expansion.validation.customize.mode.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedDNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$a28cdb94"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
168	{"map":[{"entry":[{"string":["logUUID","e0ff893e-acbf-40d2-88fe-5271b86d3595"]},{"string":["messageKey","config.action.expansion.validation.esxi.accounts"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ESXiAccountsValidationTasklet$$EnhancerBySpringCGLIB$$d2b6b033"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
196	{"map":[{"entry":[{"string":["logUUID","80aa3a39-da7f-4319-b296-2c5ba45c4e0b"]},{"string":["messageKey","config.action.shared.vds.host.register"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
265	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
229	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
230	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
83	{"map":[{"entry":[{"string":["logUUID","987839e7-2666-461b-8b1c-71d1443fb222"]},{"string":["messageKey","config.action.expansion.validation.accounts.basic"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PasswordConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$fdb0f35f"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
84	{"map":[{"entry":[{"string":["logUUID","100b97d0-a26b-4901-86ac-f165336290c7"]},{"string":["messageKey","config.action.expansion.validation.esxi.username"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiUsernameValidationTasklet$$EnhancerBySpringCGLIB$$50734943"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
150	{"map":[{"entry":[{"string":["logUUID","ae299246-0893-4424-8332-178750c24c1f"]},{"string":["messageKey","config.action.expansion.validation.host.version.compatibility.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostVersionCompatibilityLiveValidationTasklet$$EnhancerBySpringCGLIB$$109f882c"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
85	{"map":[{"entry":[{"string":["logUUID","fb1ec2bd-071d-4b5f-b7b1-1140c7de10b1"]},{"string":["messageKey","config.action.expansion.validation.esxi.password"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiPasswordValidationTasklet$$EnhancerBySpringCGLIB$$1acffede"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
169	{"map":[{"entry":[{"string":["logUUID","1f95492c-a59f-47a8-8c64-72eca8b86305"]},{"string":["messageKey","config.action.expansion.validation.vc.user.login"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.LoginConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$355b8d0b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
86	{"map":[{"entry":[{"string":["logUUID","7e2084da-d438-4c06-bb81-6387f16c967e"]},{"string":["messageKey","config.action.expansion.update.hardware.profile"]},{"string":["stage","update_hardware_profile"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.UpdateHardwareProfileTasklet$$EnhancerBySpringCGLIB$$11a4597b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
151	{"map":[{"entry":[{"string":["logUUID","48db3fb5-c722-4396-ab6f-c644dbcaeb8e"]},{"string":["messageKey","config.action.expansion.validation.vc.capacity.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExternalVCCapacityLimitLiveValidationTasklet$$EnhancerBySpringCGLIB$$6c6b96a5"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
87	{"map":[{"entry":[{"string":["logUUID","f7ce2e81-8fcc-4e5d-8082-d7d3cdc1dc9b"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$2226c98e"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
197	{"map":[{"entry":[{"string":["logUUID","04ac9a07-b0a7-4c01-bda9-4943f5cb1958"]},{"string":["messageKey","config.action.shared.hosts.free.standby.nics"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
152	{"map":[{"entry":[{"string":["logUUID","39d72252-2979-4634-ae70-879a3b4f508a"]},{"string":["messageKey","config.action.expansion.validation.host.number.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionLimitConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$81556cc0"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
170	{"map":[{"entry":[{"string":["logUUID","25bbb902-0310-40b8-b96b-a066155344b2"]},{"string":["messageKey","config.action.expansion.validation.vc.user.permission"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.VCUserPermissionLiveValidationTasklet$$EnhancerBySpringCGLIB$$3746f25"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
266	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
171	{"map":[{"entry":[{"string":["logUUID","a3895353-8534-48cb-905f-41fa3ca584be"]},{"string":["messageKey","config.action.expansion.validation.time.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeConfigurationLiveValidationTasklet$$EnhancerBySpringCGLIB$$7bd4ce85"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
198	{"map":[{"entry":[{"string":["logUUID","8d7e4415-2671-48db-b452-59b8cb19e7e2"]},{"string":["messageKey","config.action.shared.vds.host.register"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
231	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
232	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
267	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
88	{"map":[{"entry":[{"string":["logUUID","adeec96c-1f49-4233-b066-1ac7408097ec"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$cc8ffce"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
153	{"map":[{"entry":[{"string":["logUUID","29cc10f9-c21f-4808-a29b-69e67da884b9"]},{"string":["messageKey","config.action.expansion.validation.host.discovered"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionDiscoveredHostConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$808f8d91"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
89	{"map":[{"entry":[{"string":["logUUID","eed7abe1-a6b7-4682-87f9-574b5a0e5f45"]},{"string":["messageKey","config.action.expansion.validation.vlan.live"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionVlanLiveValidationTasklet$$EnhancerBySpringCGLIB$$b4d810cc"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
199	{"map":[{"entry":[{"string":["logUUID","3ddc3c02-86ad-47b6-b99e-18aafb236ab8"]},{"string":["messageKey","config.action.shared.hosts.network.infrastructure"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
90	{"map":[{"entry":[{"string":["logUUID","51e0211b-2aeb-4d35-8b9f-bbc0d3298c2c"]},{"string":["messageKey","config.action.expansion.validation.esxi.accounts"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ESXiAccountsValidationTasklet$$EnhancerBySpringCGLIB$$d2b6b033"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
154	{"map":[{"entry":[{"string":["logUUID","f4d9055e-235f-45ec-9859-3b3435ac9916"]},{"string":["messageKey","config.action.expansion.validation.physical.link.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PhysicalLinkLiveValidationTasklet$$EnhancerBySpringCGLIB$$4ee74db"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
172	{"map":[{"entry":[{"string":["logUUID","bf71d596-9e43-4768-b694-6d5e0e3f4a7e"]},{"string":["messageKey","config.action.expansion.validation.multi.dg"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MultiDGConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$d67dacde"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
91	{"map":[{"entry":[{"string":["logUUID","d4c6ee88-6658-47f1-9612-205a84446d50"]},{"string":["messageKey","config.action.expansion.validation.vc.user.login"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.LoginConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$355b8d0b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
92	{"map":[{"entry":[{"string":["logUUID","701c7ddd-503c-4d3c-aabd-8a2ac3cc7386"]},{"string":["messageKey","config.action.expansion.validation.vc.user.permission"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.VCUserPermissionLiveValidationTasklet$$EnhancerBySpringCGLIB$$3746f25"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
173	{"map":[{"entry":[{"string":["logUUID","a19449b5-8b6f-47a5-bdc3-b80a1fd39849"]},{"string":["messageKey","config.action.expansion.validation.disk.type"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MatchingDiskTypeConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$937e53d8"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
93	{"map":[{"entry":[{"string":["logUUID","f46f8198-b774-43b7-a11f-0632f1dc52fc"]},{"string":["messageKey","config.action.expansion.validation.time.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeConfigurationLiveValidationTasklet$$EnhancerBySpringCGLIB$$7bd4ce85"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
200	{"map":[{"entry":[{"string":["logUUID","a64c32e9-e64e-427f-857a-9dfcc7a0476b"]},{"string":["messageKey","config.action.shared.hosts.vsan.networking"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
268	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
233	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
201	{"map":[{"entry":[{"string":["logUUID","da972a2e-2d77-4c04-bc03-be88ba7bae76"]},{"string":["messageKey","config.action.shared.hosts.witness.networking"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
234	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
269	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
174	{"map":[{"entry":[{"string":["logUUID","d5ee7d39-9137-41ab-ac7d-147945394582"]},{"string":["messageKey","config.action.expansion.validation.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.DNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$be1d0115"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
94	{"map":[{"entry":[{"string":["logUUID","fbd41a9c-f2a0-4aa6-9e45-8e14c8d8ce4b"]},{"string":["messageKey","config.action.expansion.validation.multi.dg"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MultiDGConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$d67dacde"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
95	{"map":[{"entry":[{"string":["logUUID","a8c7adc0-55b6-4c2f-bd4c-bea4bc8fe6d3"]},{"string":["messageKey","config.action.expansion.validation.disk.type"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MatchingDiskTypeConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$937e53d8"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
202	{"map":[{"entry":[{"string":["logUUID","66fc0932-ae02-4783-b3d2-0ba1cb56ad4d"]},{"string":["messageKey","config.action.standalone.vc.witness.traffic.connectivity"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
175	{"map":[{"entry":[{"string":["logUUID","2b007bd3-614c-40d9-a38e-ef9919185648"]},{"string":["messageKey","config.action.expansion.validation.customize.mode.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedDNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$a28cdb94"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
96	{"map":[{"entry":[{"string":["logUUID","9fe6b004-dac0-4afc-a5f2-dac19c2534dd"]},{"string":["messageKey","config.action.expansion.validation.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.DNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$be1d0115"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
97	{"map":[{"entry":[{"string":["logUUID","077581a6-3eec-4b6f-ac9c-e0af94d07297"]},{"string":["messageKey","config.action.expansion.validation.customize.mode.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedDNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$a28cdb94"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
176	{"map":[{"entry":[{"string":["logUUID","3270306a-fc4e-425c-90ac-f90d1edfa615"]},{"string":["messageKey","config.action.expansion.validation.host.version.compatibility.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostVersionCompatibilityLiveValidationTasklet$$EnhancerBySpringCGLIB$$109f882c"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
98	{"map":[{"entry":[{"string":["logUUID","6f44d025-7321-4970-b61e-d342756a176a"]},{"string":["messageKey","config.action.expansion.validation.host.version.compatibility.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostVersionCompatibilityLiveValidationTasklet$$EnhancerBySpringCGLIB$$109f882c"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
203	{"map":[{"entry":[{"string":["logUUID","f1db86b0-6d1a-4dda-8ccb-f0eedc4b55f6"]},{"string":["messageKey","config.action.shared.hosts.vsan.policies"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
177	{"map":[{"entry":[{"string":["logUUID","e1006bf7-d21b-4d73-a70d-b04e117065c4"]},{"string":["messageKey","config.action.expansion.validation.vc.capacity.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExternalVCCapacityLimitLiveValidationTasklet$$EnhancerBySpringCGLIB$$6c6b96a5"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
235	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
204	{"map":[{"entry":[{"string":["logUUID","ce3f7bae-013f-4eb5-b825-c2c84687abfe"]},{"string":["messageKey","config.action.shared.hosts.remove.vss"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
270	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
236	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
237	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
271	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
99	{"map":[{"entry":[{"string":["logUUID","aa440712-d689-41dd-845e-683e9824e0d4"]},{"string":["messageKey","config.action.expansion.validation.vc.capacity.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExternalVCCapacityLimitLiveValidationTasklet$$EnhancerBySpringCGLIB$$6c6b96a5"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
178	{"map":[{"entry":[{"string":["logUUID","ade892c9-890c-4c00-acb7-ef80321911b3"]},{"string":["messageKey","config.action.expansion.validation.host.number.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionLimitConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$81556cc0"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
100	{"map":[{"entry":[{"string":["logUUID","fc5d60ac-4e52-4be8-99dc-f2933956f139"]},{"string":["messageKey","config.action.expansion.validation.host.number.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionLimitConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$81556cc0"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
205	{"map":[{"entry":[{"string":["logUUID","71f4fd03-71f6-4b4c-9461-f539523c5fdd"]},{"string":["messageKey","config.action.shared.hosts.reassign.nics"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
101	{"map":[{"entry":[{"string":["logUUID","f4dd8d11-7fb4-41fc-8d52-023077218dcb"]},{"string":["messageKey","config.action.expansion.validation.host.discovered"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionDiscoveredHostConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$808f8d91"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
179	{"map":[{"entry":[{"string":["logUUID","3fafb241-e7bc-4c1d-8b14-9094fb7ad757"]},{"string":["messageKey","config.action.expansion.validation.host.discovered"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionDiscoveredHostConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$808f8d91"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
102	{"map":[{"entry":[{"string":["logUUID","ae216f3a-b867-4899-a245-fb727d6d49c6"]},{"string":["messageKey","config.action.expansion.validation.physical.link.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PhysicalLinkLiveValidationTasklet$$EnhancerBySpringCGLIB$$4ee74db"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
103	{"map":[{"entry":[{"string":["logUUID","b94face8-647b-4305-8b86-f43393f05b04"]},{"string":["messageKey","config.action.expansion.validation.host.time.sync"]},{"string":["stage","validation_time"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeSkewSyncValidationTasklet$$EnhancerBySpringCGLIB$$1628a306"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
180	{"map":[{"entry":[{"string":["logUUID","dfacdc0e-3c5e-4b71-a150-b448da700646"]},{"string":["messageKey","config.action.expansion.validation.physical.link.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PhysicalLinkLiveValidationTasklet$$EnhancerBySpringCGLIB$$4ee74db"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
206	{"map":[{"entry":[{"string":["logUUID","9e024d10-aba2-49b9-90a7-21c34536a5fb"]},{"string":["messageKey","config.action.shared.hosts.dns"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
238	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
207	{"map":[{"entry":[{"string":["logUUID","43200acb-638b-49c2-9ecd-4838d14c9d7f"]},{"string":["messageKey","config.action.shared.hosts.loudmouth.restart"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
272	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
239	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PostcheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
240	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PrecheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
273	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
104	{"map":[{"entry":[{"string":["logUUID","ac4b41b2-ab65-43dd-ba55-89fba48d22af"]},{"string":["messageKey","config.action.expansion.validation.host.network.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostNetworkValidationTasklet$$EnhancerBySpringCGLIB$$74bb8df4"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
241	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ValidationTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
184	{"map":[{"entry":[{"string":["logUUID","e803f064-9465-451b-aae9-ff2ef82e50cd"]},{"string":["messageKey","config.action.standalone.disable.election"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
105	{"map":[{"entry":[{"string":["logUUID","e360540d-f3a8-4e9c-8af7-bb453a049ed6"]},{"string":["messageKey","config.action.expansion.validation.netmask.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.NetmaskValidationTasklet$$EnhancerBySpringCGLIB$$1f0a8771"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
181	{"map":[{"entry":[{"string":["logUUID","1110e85e-38fd-4aa9-9c14-91992a7d41c4"]},{"string":["messageKey","config.action.expansion.cluster.suppress"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
106	{"map":[{"entry":[{"string":["logUUID","50d35494-1f10-4c8b-8163-9e246612adaf"]},{"string":["messageKey","config.action.expansion.validation.overlap.config"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.OverlapValidationTasklet$$EnhancerBySpringCGLIB$$80545573"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
208	{"map":[{"entry":[{"string":["logUUID","a93dadc7-1910-425f-9384-4ec692978d07"]},{"string":["messageKey","config.action.shared.hosts.ptagent.service.restart"]},{"string":["stage","host_network"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
107	{"map":[{"entry":[{"string":["logUUID","d8687659-ce1f-4eed-8a82-1c2f54890431"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityCursoryValidationTasklet$$EnhancerBySpringCGLIB$$9467a661"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
182	{"map":[{"entry":[{"string":["logUUID","2570b108-676d-4fcf-b9d1-b23b525efee8"]},{"string":["messageKey","config.action.standalone.hosts.discovery"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
108	{"map":[{"entry":[{"string":["logUUID","dac994ca-fe29-4d7b-ab05-43a1d31fb549"]},{"string":["messageKey","config.action.expansion.validation.host.name"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostnameValidationTasklet$$EnhancerBySpringCGLIB$$e9359064"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
274	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
183	{"map":[{"entry":[{"string":["logUUID","7f2ec028-8645-4279-b195-074255a5e246"]},{"string":["messageKey","config.action.shared.network.models.link"]},{"string":["stage","bootstrap"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
209	{"map":[{"entry":[{"string":["logUUID","39a39e7b-8c01-403b-be6f-2d046b42c2a5"]},{"string":["messageKey","config.action.standalone.vc.dg"]},{"string":["stage","host_cluster"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
242	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
210	{"map":[{"entry":[{"string":["logUUID","962f338b-e109-4af8-8902-0da2ef3271a9"]},{"string":["messageKey","config.action.shared.hosts.password"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
243	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
275	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
244	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
276	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PostcheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
109	{"map":[{"entry":[{"string":["logUUID","94b6482c-3dd7-454e-9e16-e6a23a79c245"]},{"string":["messageKey","config.action.expansion.validation.accounts.basic"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PasswordConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$fdb0f35f"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
211	{"map":[{"entry":[{"string":["logUUID","218d800e-e6d8-4569-bd27-1770efed307e"]},{"string":["messageKey","config.action.expansion.hosts.maintenance.exit"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
110	{"map":[{"entry":[{"string":["logUUID","32a3a88b-9ba8-44c0-8f73-7121ec224f1b"]},{"string":["messageKey","config.action.expansion.validation.esxi.username"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiUsernameValidationTasklet$$EnhancerBySpringCGLIB$$50734943"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
111	{"map":[{"entry":[{"string":["logUUID","bdac60f2-ddd4-4a77-8a02-0956e3048661"]},{"string":["messageKey","config.action.expansion.validation.esxi.password"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.EsxiPasswordValidationTasklet$$EnhancerBySpringCGLIB$$1acffede"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
245	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
212	{"map":[{"entry":[{"string":["logUUID","7dfba324-d6fe-48c5-b7a0-cc13dc48d8df"]},{"string":["messageKey","config.action.standalone.fault.domains.reconfig"]},{"string":["stage","cluster_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
112	{"map":[{"entry":[{"string":["logUUID","97d02278-6d0c-484b-a707-2927576073af"]},{"string":["messageKey","config.action.expansion.update.hardware.profile"]},{"string":["stage","update_hardware_profile"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.UpdateHardwareProfileTasklet$$EnhancerBySpringCGLIB$$11a4597b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
113	{"map":[{"entry":[{"string":["logUUID","5c133efc-2ce5-4cc3-97bf-df07da04d809"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$2226c98e"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
213	{"map":[{"entry":[{"string":["logUUID","2a003d1a-d7ee-4f01-af26-d25f19964d5b"]},{"string":["messageKey","config.action.shared.hosts.enable.ha"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
246	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
214	{"map":[{"entry":[{"string":["logUUID","6670a3d6-fce6-40e3-a4f2-fac6db70422f"]},{"string":["messageKey","config.action.shared.hosts.disable.security.service"]},{"string":["stage","host_final"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
215	{"map":[{"entry":[{"string":["logUUID","a824c84f-0f39-491f-88b0-94142aeb162d"]},{"string":["messageKey","config.action.standalone.hosts.system.parameters.readjustment"]},{"string":["stage","preparations"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
277	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PrecheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
247	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
248	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
278	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ValidationTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
249	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
279	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
114	{"map":[{"entry":[{"string":["logUUID","3a7d804e-4f7d-4c30-bdbc-7098f09672e5"]},{"string":["messageKey","config.action.expansion.validation.hosts.ip.availability"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedHostsIpAvailabilityValidationTasklet$$EnhancerBySpringCGLIB$$cc8ffce"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
253	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
115	{"map":[{"entry":[{"string":["logUUID","261329fe-12e9-4a21-aa95-7631cc53b218"]},{"string":["messageKey","config.action.expansion.validation.vlan.live"]},{"string":["stage","validation_network"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionVlanLiveValidationTasklet$$EnhancerBySpringCGLIB$$b4d810cc"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
216	{"map":[{"entry":[{"string":["logUUID","83641220-9a3b-41ae-a3a6-7b9e70d24dc3"]},{"string":["messageKey","config.action.shared.hosts.reset.alarm"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
116	{"map":[{"entry":[{"string":["logUUID","344ac2b3-bd4e-4da0-b468-5581e15aa1c0"]},{"string":["messageKey","config.action.expansion.validation.esxi.accounts"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ESXiAccountsValidationTasklet$$EnhancerBySpringCGLIB$$d2b6b033"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
217	{"map":[{"entry":[{"string":["logUUID","e31fa261-07b3-4a65-bca2-3cd7851545c8"]},{"string":["messageKey","config.action.expansion.hosts.mystic"]},{"string":["stage","clean_up"]},{"string":["batch.taskletType","com.sun.proxy.$Proxy109"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
117	{"map":[{"entry":[{"string":["logUUID","d428d3ee-164b-420d-8b0a-1f8862ff4c4c"]},{"string":["messageKey","config.action.expansion.validation.vc.user.login"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.LoginConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$355b8d0b"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
118	{"map":[{"entry":[{"string":["logUUID","1640c714-101e-4ec1-8e04-0d783835a4ad"]},{"string":["messageKey","config.action.expansion.validation.vc.user.permission"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.VCUserPermissionLiveValidationTasklet$$EnhancerBySpringCGLIB$$3746f25"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
250	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
119	{"map":[{"entry":[{"string":["logUUID","7d9e2ce8-0ec7-40b7-aa9b-1922c4a3c615"]},{"string":["messageKey","config.action.expansion.validation.time.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.TimeConfigurationLiveValidationTasklet$$EnhancerBySpringCGLIB$$7bd4ce85"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
280	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
251	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
252	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
281	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
254	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
282	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
283	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
120	{"map":[{"entry":[{"string":["logUUID","f9f5952c-3a2e-446f-9098-66dd778ccc7c"]},{"string":["messageKey","config.action.expansion.validation.multi.dg"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MultiDGConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$d67dacde"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
255	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
121	{"map":[{"entry":[{"string":["logUUID","fc59edf9-bf9e-4724-8fce-9a4e1d2636d2"]},{"string":["messageKey","config.action.expansion.validation.disk.type"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.MatchingDiskTypeConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$937e53d8"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
257	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
122	{"map":[{"entry":[{"string":["logUUID","7cdf86a0-5f80-4512-ad0e-6104a41d5ea0"]},{"string":["messageKey","config.action.expansion.validation.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.DNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$be1d0115"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
256	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
123	{"map":[{"entry":[{"string":["logUUID","fa5eb616-939b-41a3-ac42-031caaec26c7"]},{"string":["messageKey","config.action.expansion.validation.customize.mode.dns.hostname.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.CustomizedDNSHostnamesLiveValidationTasklet$$EnhancerBySpringCGLIB$$a28cdb94"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
124	{"map":[{"entry":[{"string":["logUUID","bf3a04f1-061f-4a3d-a4f5-4fbaf584e835"]},{"string":["messageKey","config.action.expansion.validation.host.version.compatibility.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.HostVersionCompatibilityLiveValidationTasklet$$EnhancerBySpringCGLIB$$109f882c"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
284	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
285	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
286	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
287	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
288	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
125	{"map":[{"entry":[{"string":["logUUID","7fdde578-cfa5-4c3d-84da-8d33e8698188"]},{"string":["messageKey","config.action.expansion.validation.vc.capacity.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExternalVCCapacityLimitLiveValidationTasklet$$EnhancerBySpringCGLIB$$6c6b96a5"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
289	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
126	{"map":[{"entry":[{"string":["logUUID","88d97913-26d1-4514-a327-131cce448eaa"]},{"string":["messageKey","config.action.expansion.validation.host.number.limit"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionLimitConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$81556cc0"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
127	{"map":[{"entry":[{"string":["logUUID","cc87572a-13d4-456d-a105-2b32924b3717"]},{"string":["messageKey","config.action.expansion.validation.host.discovered"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.ExpansionDiscoveredHostConfigurationValidationTasklet$$EnhancerBySpringCGLIB$$808f8d91"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
290	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
128	{"map":[{"entry":[{"string":["logUUID","ca721bb7-9c63-499f-b514-c744ad82dfa1"]},{"string":["messageKey","config.action.expansion.validation.physical.link.live"]},{"string":["stage","validation_host"]},{"string":["batch.taskletType","com.vmware.marvin.v2.batch.tasklet.impl.validation.PhysicalLinkLiveValidationTasklet$$EnhancerBySpringCGLIB$$4ee74db"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
291	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
292	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
293	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
294	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.ActionTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
295	{"map":[{"entry":[{"string":["batch.taskletType","com.emc.mystic.manager.operation.core.tasklets.PostcheckTasklet"]},{"string":["batch.stepType","org.springframework.batch.core.step.tasklet.TaskletStep"]}]}]}	\N
\.


--
-- Name: batch_step_execution_seq; Type: SEQUENCE SET; Schema: public; Owner: batch
--

SELECT pg_catalog.setval('public.batch_step_execution_seq', 295, true);


--
-- Name: batch_job_execution_context_pkey; Type: CONSTRAINT; Schema: public; Owner: batch; Tablespace: 
--

ALTER TABLE ONLY public.batch_job_execution_context
    ADD CONSTRAINT batch_job_execution_context_pkey PRIMARY KEY (job_execution_id);


--
-- Name: batch_job_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: batch; Tablespace: 
--

ALTER TABLE ONLY public.batch_job_execution
    ADD CONSTRAINT batch_job_execution_pkey PRIMARY KEY (job_execution_id);


--
-- Name: batch_job_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: batch; Tablespace: 
--

ALTER TABLE ONLY public.batch_job_instance
    ADD CONSTRAINT batch_job_instance_pkey PRIMARY KEY (job_instance_id);


--
-- Name: batch_step_execution_context_pkey; Type: CONSTRAINT; Schema: public; Owner: batch; Tablespace: 
--

ALTER TABLE ONLY public.batch_step_execution_context
    ADD CONSTRAINT batch_step_execution_context_pkey PRIMARY KEY (step_execution_id);


--
-- Name: batch_step_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: batch; Tablespace: 
--

ALTER TABLE ONLY public.batch_step_execution
    ADD CONSTRAINT batch_step_execution_pkey PRIMARY KEY (step_execution_id);


--
-- Name: job_inst_un; Type: CONSTRAINT; Schema: public; Owner: batch; Tablespace: 
--

ALTER TABLE ONLY public.batch_job_instance
    ADD CONSTRAINT job_inst_un UNIQUE (job_name, job_key);


--
-- Name: job_exec_ctx_fk; Type: FK CONSTRAINT; Schema: public; Owner: batch
--

ALTER TABLE ONLY public.batch_job_execution_context
    ADD CONSTRAINT job_exec_ctx_fk FOREIGN KEY (job_execution_id) REFERENCES public.batch_job_execution(job_execution_id);


--
-- Name: job_exec_params_fk; Type: FK CONSTRAINT; Schema: public; Owner: batch
--

ALTER TABLE ONLY public.batch_job_execution_params
    ADD CONSTRAINT job_exec_params_fk FOREIGN KEY (job_execution_id) REFERENCES public.batch_job_execution(job_execution_id);


--
-- Name: job_exec_step_fk; Type: FK CONSTRAINT; Schema: public; Owner: batch
--

ALTER TABLE ONLY public.batch_step_execution
    ADD CONSTRAINT job_exec_step_fk FOREIGN KEY (job_execution_id) REFERENCES public.batch_job_execution(job_execution_id);


--
-- Name: job_inst_exec_fk; Type: FK CONSTRAINT; Schema: public; Owner: batch
--

ALTER TABLE ONLY public.batch_job_execution
    ADD CONSTRAINT job_inst_exec_fk FOREIGN KEY (job_instance_id) REFERENCES public.batch_job_instance(job_instance_id);


--
-- Name: step_exec_ctx_fk; Type: FK CONSTRAINT; Schema: public; Owner: batch
--

ALTER TABLE ONLY public.batch_step_execution_context
    ADD CONSTRAINT step_exec_ctx_fk FOREIGN KEY (step_execution_id) REFERENCES public.batch_step_execution(step_execution_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

