toc.dat                                                                                             0000600 0004000 0002000 00000032041 14563337461 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       %                |            dashboardmanagerdemo    14.10 (Homebrew)    16.0 ,    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         @           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         A           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         B           1262    78713    dashboardmanagerdemo    DATABASE     v   CREATE DATABASE dashboardmanagerdemo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
 $   DROP DATABASE dashboardmanagerdemo;
                postgres    false                     2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                tuic    false         C           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   tuic    false    4         Ñ            1259    78714    component_charts    TABLE     ¤   CREATE TABLE public.component_charts (
    index character varying NOT NULL,
    color character(7)[],
    types character varying[],
    unit character varying
);
 $   DROP TABLE public.component_charts;
       public         heap 
   igorho2000    false    4         Ò            1259    78719    component_maps    TABLE     !  CREATE TABLE public.component_maps (
    title character varying NOT NULL,
    type character varying NOT NULL,
    size character varying,
    icon character varying,
    paint json,
    property json,
    index character varying,
    id integer NOT NULL,
    source character varying
);
 "   DROP TABLE public.component_maps;
       public         heap 
   igorho2000    false    4         Ó            1259    78724    component_maps_id_seq    SEQUENCE        CREATE SEQUENCE public.component_maps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.component_maps_id_seq;
       public       
   igorho2000    false    4    210         D           0    0    component_maps_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.component_maps_id_seq OWNED BY public.component_maps.id;
          public       
   igorho2000    false    211         Ô            1259    78725 
   components    TABLE       CREATE TABLE public.components (
    index character varying NOT NULL,
    name character varying NOT NULL,
    history_config json,
    map_filter json,
    update_freq integer,
    update_freq_unit character varying,
    source character varying,
    short_desc text,
    long_desc text,
    use_case text,
    links text[],
    contributors text[],
    tags text[],
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    query_type character varying,
    query_chart text,
    query_history text,
    id integer NOT NULL,
    time_from character varying,
    time_to character varying,
    map_config_ids integer[]
);
    DROP TABLE public.components;
       public         heap 
   igorho2000    false    4         Õ            1259    78730    components_new_id_seq    SEQUENCE        CREATE SEQUENCE public.components_new_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.components_new_id_seq;
       public       
   igorho2000    false    4    212         E           0    0    components_new_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.components_new_id_seq OWNED BY public.components.id;
          public       
   igorho2000    false    213         Ö            1259    78731    dashboard_groups    TABLE     i   CREATE TABLE public.dashboard_groups (
    dashboard_id bigint NOT NULL,
    group_id bigint NOT NULL
);
 $   DROP TABLE public.dashboard_groups;
       public         heap 
   igorho2000    false    4         ×            1259    78734 
   dashboards    TABLE       CREATE TABLE public.dashboards (
    name character varying NOT NULL,
    components bigint[],
    icon character varying NOT NULL,
    updated_at timestamp with time zone,
    created_at timestamp with time zone,
    id integer NOT NULL,
    index character varying
);
    DROP TABLE public.dashboards;
       public         heap 
   igorho2000    false    4         Ø            1259    78739    dashboards_id_seq    SEQUENCE        CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.dashboards_id_seq;
       public       
   igorho2000    false    215    4         F           0    0    dashboards_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;
          public       
   igorho2000    false    216         Ù            1259    78756    groups    TABLE     S   CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying
);
    DROP TABLE public.groups;
       public         heap 
   igorho2000    false    4         Ú            1259    78761    groups_id_seq    SEQUENCE     v   CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public       
   igorho2000    false    4    217         G           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public       
   igorho2000    false    218                    2604    78790    component_maps id    DEFAULT     v   ALTER TABLE ONLY public.component_maps ALTER COLUMN id SET DEFAULT nextval('public.component_maps_id_seq'::regclass);
 @   ALTER TABLE public.component_maps ALTER COLUMN id DROP DEFAULT;
       public       
   igorho2000    false    211    210                    2604    78791    components id    DEFAULT     r   ALTER TABLE ONLY public.components ALTER COLUMN id SET DEFAULT nextval('public.components_new_id_seq'::regclass);
 <   ALTER TABLE public.components ALTER COLUMN id DROP DEFAULT;
       public       
   igorho2000    false    213    212                    2604    78792    dashboards id    DEFAULT     n   ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);
 <   ALTER TABLE public.dashboards ALTER COLUMN id DROP DEFAULT;
       public       
   igorho2000    false    216    215                    2604    78794 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public       
   igorho2000    false    218    217         3          0    78714    component_charts 
   TABLE DATA           E   COPY public.component_charts (index, color, types, unit) FROM stdin;
    public       
   igorho2000    false    209       3635.dat 4          0    78719    component_maps 
   TABLE DATA           e   COPY public.component_maps (title, type, size, icon, paint, property, index, id, source) FROM stdin;
    public       
   igorho2000    false    210       3636.dat 6          0    78725 
   components 
   TABLE DATA             COPY public.components (index, name, history_config, map_filter, update_freq, update_freq_unit, source, short_desc, long_desc, use_case, links, contributors, tags, created_at, updated_at, query_type, query_chart, query_history, id, time_from, time_to, map_config_ids) FROM stdin;
    public       
   igorho2000    false    212       3638.dat 8          0    78731    dashboard_groups 
   TABLE DATA           B   COPY public.dashboard_groups (dashboard_id, group_id) FROM stdin;
    public       
   igorho2000    false    214       3640.dat 9          0    78734 
   dashboards 
   TABLE DATA           _   COPY public.dashboards (name, components, icon, updated_at, created_at, id, index) FROM stdin;
    public       
   igorho2000    false    215       3641.dat ;          0    78756    groups 
   TABLE DATA           *   COPY public.groups (id, name) FROM stdin;
    public       
   igorho2000    false    217       3643.dat H           0    0    component_maps_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.component_maps_id_seq', 90, true);
          public       
   igorho2000    false    211         I           0    0    components_new_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.components_new_id_seq', 68, true);
          public       
   igorho2000    false    213         J           0    0    dashboards_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.dashboards_id_seq', 71, true);
          public       
   igorho2000    false    216         K           0    0    groups_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.groups_id_seq', 41, true);
          public       
   igorho2000    false    218                    2606    78799 "   component_maps component_maps_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.component_maps
    ADD CONSTRAINT component_maps_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.component_maps DROP CONSTRAINT component_maps_pkey;
       public         
   igorho2000    false    210                    2606    78801    components components_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.components DROP CONSTRAINT components_pkey;
       public         
   igorho2000    false    212                    2606    78803 &   dashboard_groups dashboard_groups_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT dashboard_groups_pkey PRIMARY KEY (group_id, dashboard_id);
 P   ALTER TABLE ONLY public.dashboard_groups DROP CONSTRAINT dashboard_groups_pkey;
       public         
   igorho2000    false    214    214                     2606    78805    dashboards dashboards_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.dashboards DROP CONSTRAINT dashboards_pkey;
       public         
   igorho2000    false    215         ¤           2606    78815    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public         
   igorho2000    false    217         ¢           2606    78817    dashboards index 
   CONSTRAINT     \   ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT index UNIQUE (index) INCLUDE (index);
 :   ALTER TABLE ONLY public.dashboards DROP CONSTRAINT index;
       public         
   igorho2000    false    215                    2606    78829 *   component_charts new_component_charts_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.component_charts
    ADD CONSTRAINT new_component_charts_pkey PRIMARY KEY (index);
 T   ALTER TABLE ONLY public.component_charts DROP CONSTRAINT new_component_charts_pkey;
       public         
   igorho2000    false    209         ¥           2606    78832    components component_charts    FK CONSTRAINT        ALTER TABLE ONLY public.components
    ADD CONSTRAINT component_charts FOREIGN KEY (index) REFERENCES public.component_charts(index) NOT VALID;
 E   ALTER TABLE ONLY public.components DROP CONSTRAINT component_charts;
       public       
   igorho2000    false    209    3480    212         ¦           2606    78837 .   dashboard_groups fk_dashboard_groups_dashboard    FK CONSTRAINT     ¡   ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT fk_dashboard_groups_dashboard FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) NOT VALID;
 X   ALTER TABLE ONLY public.dashboard_groups DROP CONSTRAINT fk_dashboard_groups_dashboard;
       public       
   igorho2000    false    215    3488    214         §           2606    78842 *   dashboard_groups fk_dashboard_groups_group    FK CONSTRAINT        ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT fk_dashboard_groups_group FOREIGN KEY (group_id) REFERENCES public.groups(id) NOT VALID;
 T   ALTER TABLE ONLY public.dashboard_groups DROP CONSTRAINT fk_dashboard_groups_group;
       public       
   igorho2000    false    3492    214    217                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       3635.dat                                                                                            0000600 0004000 0002000 00000000653 14563337461 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        pump_status	{#ff9800}	{GuageChart,BarPercentChart}	ç«
welfare_institutions	{#F65658,#F49F36,#F5C860,#9AC17C,#4CB495,#569C9A,#60819C,#2F8AB1}	{BarChart,DonutChart}	é
building_unsued	{#d16ae2,#655fad}	{MapLegend}	è
patrol_criminalcase	{#FD5696,#00A9E0}	{TimelineSeparateChart,TimelineStackedChart,ColumnLineChart}	ä»¶
welfare_population	{#2e999b,#80e3d4,#1f9b85,#a5ece0}	{ColumnChart,BarPercentChart,DistrictChart}	äºº
\.


                                                                                     3636.dat                                                                                            0000600 0004000 0002000 00000004470 14563337461 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        æ½æ°´ç«	circle	big	\N	{"circle-color":["match",["get","all_pumb_lights"],"+","#ff9800","#00B2FF"]}	[{"key":"station_name","name":"ç«å"},{"key":"all_pumb_lights","name":"ç¸½æ½æ°´çæ"},{"key":"warning_level","name":"ç®åè­¦æå¼"},{"key":"start_pumping_level","name":"æ½æ°´èµ·å§å¼"},{"key":"door_num","name":"æ°´éæ¸ç®"},{"key":"pumb_num","name":"æ½æ°´æ©æ¸ç®"},{"key":"river_basin","name":"æµå"},{"key":"rec_time","name":"è¨éæé"}]	patrol_rain_floodgate	50	geojson
éç½®å¸æå¬æå°	fill	\N	\N	{"fill-color":"#d16ae2","fill-opacity":0.7}	[{"key":"10712åå°_1_åå°æ¬å±¬æå½¢","name":"åå°æ¬å±¬æå½¢"},{"key":"10712åå°_1_ç®¡çæ©é","name":"ç®¡çæ©é"}]	building_unsued_land	42	geojson
ä¸æ°´é	circle	big	\N	{"circle-color": ["interpolate", ["linear"], ["to-number", ["get", "ground_far"]], -100, "#F92623", 0.51, "#81bcf5"]}	[{"key": "station_no", "name": "NO"}, {"key": "station_name", "name": "ç«å"}, {"key": "ground_far", "name": "è·å°é¢é«[å¬å°º]"}, {"key": "level_out", "name": "æ°´ä½é«[å¬å°º]"}, {"key": "rec_time", "name": "ç´éæé"}]	patrol_rain_sewer	60	geojson
ç¤¾ç¦æ©æ§	circle	big	\N	{"circle-color": ["match", ["get", "main_type"], "éé«®ææå", "#F49F36", "èº«éæ©æ§", "#F65658", "åç«¥èå°å¹´æå", "#F5C860", "ç¤¾åæåãNPO", "#9AC17C", "å©¦å¥³æå", "#4CB495", "è²§å°å±æ©å®¶åº­æå", "#569C9A", "ä¿è­·æ§æå", "#60819C", "#2F8AB1"]}	[{"key": "main_type", "name": "ä¸»è¦é¡å¥"}, {"key": "sub_type", "name": "æ¬¡è¦åé¡"}, {"key": "name", "name": "åç¨±"}, {"key": "address", "name": "å°å"}]	socl_welfare_organization_plc	64	geojson
éç½®å¸æ(å¬ç¨)å»ºç©	circle	big	\N	{"circle-color":"#655fad"}	[{"key":"éç","name":"éç"},{"key":"æ¿å±ç¾æ³","name":"æ¿å±ç¾æ³"},{"key":"ç®åå·è¡æå½¢","name":"ç®åå·è¡æå½¢"},{"key":"éç½®æ¨å±¤_éç½®æ¨å±¤/è©²å»ºç©ç¸½æ¨å±¤","name":"éç½®æ¨å±¤/ç¸½æ¨å±¤"},{"key":"éç½®é¢ç©ã¡","name":"éç½®é¢ç©ã¡"},{"key":"åºå°ç®¡çæ©é","name":"åºå°ç®¡çæ©é"},{"key":"å»ºç©ç®¡çæ©é","name":"å»ºç©ç®¡çæ©é"},{"key":"åä½¿ç¨ç¨é","name":"åä½¿ç¨ç¨é"},{"key":"åºå°æææ¬äºº","name":"åºå°æææ¬äºº"},{"key":"å»ºç©æ¨ç¤º","name":"å»ºç©æ¨ç¤º"},{"key":"å»ºç¯å®ææ¥æ","name":"å»ºç¯å®ææ¥æ"}]	building_unsued_public	43	geojson
\.


                                                                                                                                                                                                        3638.dat                                                                                            0000600 0004000 0002000 00000010614 14563337461 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        welfare_population	ç¤¾ç¦äººå£	\N	\N	\N	\N	ç¤¾æå±	é¡¯ç¤ºç¤¾æç¦å©äººå£ï¼èº«éãä½æ¶ãä¸­ä½æ¶ãä½æ¶èº«éï¼çæ¯ä¾	é¡¯ç¤ºç¤¾æç¦å©äººå£ï¼èº«éãä½æ¶ãä¸­ä½æ¶ãä½æ¶èº«éï¼çæ¯ä¾ï¼è³æä¾æºçºå°åå¸ç¤¾æå±å§é¨è³æï¼æ¯æ15èæ´æ°ã	ç¤¾ç¦äººå£æ¯ä¾çè³æè½è®æåäºè§£å°åå¸ç¤¾æç¦å©çéæ±è®åï¼å¾èè¦åæ´è²¼è¿æ°ç¾éæ±çç¤¾æç¦å©æªæ½ã	{}	{tuic}	{}	2023-12-20 13:56:00+08	2024-01-09 11:32:59.233032+08	three_d	SELECT x_axis, y_axis, data FROM (SELECT district AS x_axis, 'ä½æ¶' AS y_axis, is_low_income AS data FROM app_calcu_monthly_socl_welfare_people_ppl UNION ALL SELECT district AS x_axis, 'ä¸­ä½æ¶' AS y_axis, is_low_middle_income AS data FROM app_calcu_monthly_socl_welfare_people_ppl UNION ALL SELECT district AS x_axis, 'èº«éè£å©' AS y_axis, is_disabled_allowance AS data FROM app_calcu_monthly_socl_welfare_people_ppl UNION ALL SELECT district AS x_axis, 'èº«é' AS y_axis, is_disabled AS data FROM app_calcu_monthly_socl_welfare_people_ppl) AS combined_data WHERE x_axis != 'e' ORDER BY ARRAY_POSITION(ARRAY['åæå', 'å£«æå', 'å§æ¹å', 'åæ¸¯å', 'æ¾å±±å', 'ä¿¡ç¾©å', 'ä¸­å±±å', 'å¤§åå', 'ä¸­æ­£å', 'è¬è¯å', 'å¤§å®å', 'æå±±å']::varchar[], combined_data.x_axis), ARRAY_POSITION(ARRAY['ä½æ¶', 'ä¸­ä½æ¶', 'èº«éè£å©', 'èº«é'], combined_data.y_axis);	\N	90	static	\N	{}
welfare_institutions	ç¤¾ç¦æ©æ§	\N	{"mode": "byParam", "byParam": {"xParam": "main_type"}}	\N	\N	ç¤¾æå±	é¡¯ç¤ºç¤¾æç¦å©æ©æ§é»ä½åæ©æ§é¡å	é¡¯ç¤ºç¤¾æç¦å©æ©æ§é»ä½åæ©æ§é¡åï¼è³æä¾æºçºå°åå¸ç¤¾æå±å§é¨è³æï¼æ¯æ15æ¥æ´æ°ã	æ ¹ææ©æ§ç©ºéçåä½ææ³ï¼æª¢è¦ç¤¾æç¦å©æ©æ§æ¯å¦åå»åå¸ï¼åææ´åå¸æåå°ãç¤¾æä½å®ç­æ½å¨å¯ä½¿ç¨ä¹ç©ºéï¼ä»¥ç æ¬å¢è¨­ä½ç½®èé¡åçæ¹æ¡ã	{https://data.taipei/dataset/detail?id=cabdf272-e0ec-4e4e-9136-f4b8596f35d9}	{tuic}	{}	2023-12-20 13:56:00+08	2023-12-20 13:56:00+08	two_d	select main_type as x_axis,count(*) as data from socl_welfare_organization_plc group by main_type order by data desc	\N	82	static	\N	{64}
patrol_criminalcase	åäºçµ±è¨	\N	\N	1	month	è­¦å¯å±	é¡¯ç¤ºè¿å©å¹´æ¯æçåæ¡çµ±è¨è³è¨	é¡¯ç¤ºè¿å©å¹´æ¯æçåæ¡çµ±è¨è³è¨ï¼è³æä¾æºçºå°åå¸ä¸»è¨èéæ¾è³æï¼æ¯ææ´æ°ã	èç±ææ¡å°åå¸åäºæ¡ä»¶è¿2å¹´ççµ±è¨è³è¨ï¼æåå¯ä»¥ç­è§£æ¡ä»¶çå¢æ¸è¶¨å¢åç¸éç¹å¾µï¼æå©æ¼å¶å®æ´ææçæ²»å®ç­ç¥ã	{https://data.taipei/dataset/detail?id=dc7e246a-a88e-42f8-8cd6-9739209af774}	{tuic}	{}	2023-12-20 13:56:00+08	2024-01-17 14:53:41.810511+08	time	WITH date_range AS (\n  SELECT\n    '%s'::timestamp with time zone AS start_time,\n    '%s'::timestamp with time zone AS end_time\n)\nSELECT "å¹´æå¥" as x_axis, 'ç¼çä»¶æ¸' as y_axis, "ç¼çä»¶æ¸[ä»¶]" as data FROM public.patrol_criminal_case \nWHERE å¹´æå¥ BETWEEN  (SELECT start_time FROM date_range) AND (SELECT end_time FROM date_range)\nUNION ALL\nSELECT "å¹´æå¥" as x_axis, 'ç ´ç²ä»¶æ¸' as y_axis, "ç ´ç²ä»¶æ¸/ç¸½è¨[ä»¶]" as data FROM public.patrol_criminal_case\nWHERE å¹´æå¥ BETWEEN  (SELECT start_time FROM date_range) AND (SELECT end_time FROM date_range)	\N	7	year_ago	now	{}
building_unsued	éç½®å¸æè²¡ç¢	\N	{"mode":"byLayer"}	\N	\N	è²¡æ¿å±	\N	\N	\N	{}	{tuic}	\N	2023-12-20 13:56:00+08	2024-01-11 14:01:02.392686+08	map_legend	select 'éç½®å¸æå¬æå°' as name, count(*) as value, 'fill' as type from building_unsued_land\nunion all\nselect 'éç½®å¸æ(å¬ç¨)å»ºç©' as name, count(*) as value, 'circle' as type from building_unsued_public	\N	30	static	\N	{42,43}
pump_status	æ½æ°´ç«çæ	\N	{"mode":"byParam","byParam":{"yParam":"all_pumb_lights"}}	10	minute	å·¥åå±æ°´å©è	é¡¯ç¤ºç¶åå¨å¸éåçæ½æ°´ç«æ¸é	é¡¯ç¤ºç¶åå¨å¸éåçæ½æ°´ç«æ¸éï¼è³æä¾æºçºå·¥åå±æ°´å©èå§é¨è³æï¼æ¯ååéæ´æ°ã	èæ®ç¶æ¥å¤©æ°£åãæ°´ä½ç£æ¸¬ãçµä»¶çè³æï¼ä¾æ¢è¨æ½æ°´ç«çéä½çæ³èæ°´ä½ç°å¸¸ä¹éçéè¯æ§ã	{}	{tuic}	{}	2023-12-20 13:56:00+08	2024-01-25 17:36:14.565347+08	percent	select 'ååæ½æ°´ç«' as x_axis, y_axis, data from \n(\nselect 'ååä¸­' as y_axis, count(*) as data from patrol_rain_floodgate where all_pumb_lights = '+'\nunion all\nselect 'æªåå' as y_axis, count(*) as data from patrol_rain_floodgate where all_pumb_lights != '+'\n) as parsed_data	\N	43	current	\N	{50}
\.


                                                                                                                    3640.dat                                                                                            0000600 0004000 0002000 00000000016 14563337461 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1
13	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  3641.dat                                                                                            0000600 0004000 0002000 00000000333 14563337461 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        åè³è³è¨	{30}	public	2024-01-11 17:32:32.465099+08	2024-01-11 17:32:32.465099+08	13	map-layers
ç¯ä¾çµä»¶	{7,43,82,90}	bug_report	2024-01-24 17:12:29.419499+08	2023-12-27 14:11:56.841132+08	1	demo-components
\.


                                                                                                                                                                                                                                                                                                     3643.dat                                                                                            0000600 0004000 0002000 00000000031 14563337461 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	public
2	employee
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000026206 14563337461 0015406 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Homebrew)
-- Dumped by pg_dump version 16.0

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

DROP DATABASE dashboardmanagerdemo;
--
-- Name: dashboardmanagerdemo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dashboardmanagerdemo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE dashboardmanagerdemo OWNER TO postgres;

\connect dashboardmanagerdemo

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: tuic
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO tuic;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: component_charts; Type: TABLE; Schema: public; Owner: igorho2000
--

CREATE TABLE public.component_charts (
    index character varying NOT NULL,
    color character(7)[],
    types character varying[],
    unit character varying
);


ALTER TABLE public.component_charts OWNER TO igorho2000;

--
-- Name: component_maps; Type: TABLE; Schema: public; Owner: igorho2000
--

CREATE TABLE public.component_maps (
    title character varying NOT NULL,
    type character varying NOT NULL,
    size character varying,
    icon character varying,
    paint json,
    property json,
    index character varying,
    id integer NOT NULL,
    source character varying
);


ALTER TABLE public.component_maps OWNER TO igorho2000;

--
-- Name: component_maps_id_seq; Type: SEQUENCE; Schema: public; Owner: igorho2000
--

CREATE SEQUENCE public.component_maps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.component_maps_id_seq OWNER TO igorho2000;

--
-- Name: component_maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: igorho2000
--

ALTER SEQUENCE public.component_maps_id_seq OWNED BY public.component_maps.id;


--
-- Name: components; Type: TABLE; Schema: public; Owner: igorho2000
--

CREATE TABLE public.components (
    index character varying NOT NULL,
    name character varying NOT NULL,
    history_config json,
    map_filter json,
    update_freq integer,
    update_freq_unit character varying,
    source character varying,
    short_desc text,
    long_desc text,
    use_case text,
    links text[],
    contributors text[],
    tags text[],
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    query_type character varying,
    query_chart text,
    query_history text,
    id integer NOT NULL,
    time_from character varying,
    time_to character varying,
    map_config_ids integer[]
);


ALTER TABLE public.components OWNER TO igorho2000;

--
-- Name: components_new_id_seq; Type: SEQUENCE; Schema: public; Owner: igorho2000
--

CREATE SEQUENCE public.components_new_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_new_id_seq OWNER TO igorho2000;

--
-- Name: components_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: igorho2000
--

ALTER SEQUENCE public.components_new_id_seq OWNED BY public.components.id;


--
-- Name: dashboard_groups; Type: TABLE; Schema: public; Owner: igorho2000
--

CREATE TABLE public.dashboard_groups (
    dashboard_id bigint NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.dashboard_groups OWNER TO igorho2000;

--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: igorho2000
--

CREATE TABLE public.dashboards (
    name character varying NOT NULL,
    components bigint[],
    icon character varying NOT NULL,
    updated_at timestamp with time zone,
    created_at timestamp with time zone,
    id integer NOT NULL,
    index character varying
);


ALTER TABLE public.dashboards OWNER TO igorho2000;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: igorho2000
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboards_id_seq OWNER TO igorho2000;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: igorho2000
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: igorho2000
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying
);


ALTER TABLE public.groups OWNER TO igorho2000;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: igorho2000
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO igorho2000;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: igorho2000
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: component_maps id; Type: DEFAULT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.component_maps ALTER COLUMN id SET DEFAULT nextval('public.component_maps_id_seq'::regclass);


--
-- Name: components id; Type: DEFAULT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.components ALTER COLUMN id SET DEFAULT nextval('public.components_new_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Data for Name: component_charts; Type: TABLE DATA; Schema: public; Owner: igorho2000
--

COPY public.component_charts (index, color, types, unit) FROM stdin;
\.
COPY public.component_charts (index, color, types, unit) FROM '$$PATH$$/3635.dat';

--
-- Data for Name: component_maps; Type: TABLE DATA; Schema: public; Owner: igorho2000
--

COPY public.component_maps (title, type, size, icon, paint, property, index, id, source) FROM stdin;
\.
COPY public.component_maps (title, type, size, icon, paint, property, index, id, source) FROM '$$PATH$$/3636.dat';

--
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: igorho2000
--

COPY public.components (index, name, history_config, map_filter, update_freq, update_freq_unit, source, short_desc, long_desc, use_case, links, contributors, tags, created_at, updated_at, query_type, query_chart, query_history, id, time_from, time_to, map_config_ids) FROM stdin;
\.
COPY public.components (index, name, history_config, map_filter, update_freq, update_freq_unit, source, short_desc, long_desc, use_case, links, contributors, tags, created_at, updated_at, query_type, query_chart, query_history, id, time_from, time_to, map_config_ids) FROM '$$PATH$$/3638.dat';

--
-- Data for Name: dashboard_groups; Type: TABLE DATA; Schema: public; Owner: igorho2000
--

COPY public.dashboard_groups (dashboard_id, group_id) FROM stdin;
\.
COPY public.dashboard_groups (dashboard_id, group_id) FROM '$$PATH$$/3640.dat';

--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: igorho2000
--

COPY public.dashboards (name, components, icon, updated_at, created_at, id, index) FROM stdin;
\.
COPY public.dashboards (name, components, icon, updated_at, created_at, id, index) FROM '$$PATH$$/3641.dat';

--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: igorho2000
--

COPY public.groups (id, name) FROM stdin;
\.
COPY public.groups (id, name) FROM '$$PATH$$/3643.dat';

--
-- Name: component_maps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: igorho2000
--

SELECT pg_catalog.setval('public.component_maps_id_seq', 90, true);


--
-- Name: components_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: igorho2000
--

SELECT pg_catalog.setval('public.components_new_id_seq', 68, true);


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: igorho2000
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 71, true);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: igorho2000
--

SELECT pg_catalog.setval('public.groups_id_seq', 41, true);


--
-- Name: component_maps component_maps_pkey; Type: CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.component_maps
    ADD CONSTRAINT component_maps_pkey PRIMARY KEY (id);


--
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- Name: dashboard_groups dashboard_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT dashboard_groups_pkey PRIMARY KEY (group_id, dashboard_id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: dashboards index; Type: CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT index UNIQUE (index) INCLUDE (index);


--
-- Name: component_charts new_component_charts_pkey; Type: CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.component_charts
    ADD CONSTRAINT new_component_charts_pkey PRIMARY KEY (index);


--
-- Name: components component_charts; Type: FK CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT component_charts FOREIGN KEY (index) REFERENCES public.component_charts(index) NOT VALID;


--
-- Name: dashboard_groups fk_dashboard_groups_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT fk_dashboard_groups_dashboard FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) NOT VALID;


--
-- Name: dashboard_groups fk_dashboard_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: igorho2000
--

ALTER TABLE ONLY public.dashboard_groups
    ADD CONSTRAINT fk_dashboard_groups_group FOREIGN KEY (group_id) REFERENCES public.groups(id) NOT VALID;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: tuic
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          