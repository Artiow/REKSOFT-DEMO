PGDMP     +                    v            reksoft    9.5.12    10.3 q    	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    19364    demo    SCHEMA        CREATE SCHEMA demo;
    DROP SCHEMA demo;
             artiow    false            �            1259    19432 	   album_seq    SEQUENCE     p   CREATE SEQUENCE demo.album_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.album_seq;
       demo       artiow    false    7            �            1259    19532    album    TABLE     $  CREATE TABLE demo.album (
    id integer DEFAULT nextval('demo.album_seq'::regclass) NOT NULL,
    label_id integer NOT NULL,
    singer_id integer NOT NULL,
    name character varying(45) NOT NULL,
    picture_id integer,
    release date NOT NULL,
    description character varying(255)
);
    DROP TABLE demo.album;
       demo         artiow    false    184    7            �            1259    19565    album_genres    TABLE     a   CREATE TABLE demo.album_genres (
    album_id integer NOT NULL,
    genre_id integer NOT NULL
);
    DROP TABLE demo.album_genres;
       demo         artiow    false    7            �            1259    19434    composition_seq    SEQUENCE     v   CREATE SEQUENCE demo.composition_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE demo.composition_seq;
       demo       artiow    false    7            �            1259    19554    composition    TABLE       CREATE TABLE demo.composition (
    id integer DEFAULT nextval('demo.composition_seq'::regclass) NOT NULL,
    album_id integer NOT NULL,
    album_pos integer NOT NULL,
    name character varying(45) NOT NULL,
    duration time without time zone NOT NULL
);
    DROP TABLE demo.composition;
       demo         artiow    false    185    7            �            1259    19612    current_basket    TABLE     �   CREATE TABLE demo.current_basket (
    user_id integer NOT NULL,
    media_id integer NOT NULL,
    media_count integer DEFAULT 1 NOT NULL
);
     DROP TABLE demo.current_basket;
       demo         artiow    false    7            �            1259    19430 	   genre_seq    SEQUENCE     p   CREATE SEQUENCE demo.genre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.genre_seq;
       demo       artiow    false    7            �            1259    19462    genre    TABLE     �   CREATE TABLE demo.genre (
    id integer DEFAULT nextval('demo.genre_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL
);
    DROP TABLE demo.genre;
       demo         artiow    false    183    7            �            1259    19514    label    TABLE     ^   CREATE TABLE demo.label (
    id integer NOT NULL,
    name character varying(45) NOT NULL
);
    DROP TABLE demo.label;
       demo         artiow    false    7            �            1259    19446    label_id_seq    SEQUENCE     s   CREATE SEQUENCE demo.label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE demo.label_id_seq;
       demo       artiow    false    7            �            1259    19452    label_id_seq1    SEQUENCE     t   CREATE SEQUENCE demo.label_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE demo.label_id_seq1;
       demo       artiow    false    7            �            1259    19512    label_id_seq2    SEQUENCE     t   CREATE SEQUENCE demo.label_id_seq2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE demo.label_id_seq2;
       demo       artiow    false    7    205            	           0    0    label_id_seq2    SEQUENCE OWNED BY     :   ALTER SEQUENCE demo.label_id_seq2 OWNED BY demo.label.id;
            demo       artiow    false    204            �            1259    19436 	   media_seq    SEQUENCE     p   CREATE SEQUENCE demo.media_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.media_seq;
       demo       artiow    false    7            �            1259    19580    media    TABLE     �   CREATE TABLE demo.media (
    id integer DEFAULT nextval('demo.media_seq'::regclass) NOT NULL,
    type_id integer NOT NULL,
    album_id integer NOT NULL,
    price integer NOT NULL
);
    DROP TABLE demo.media;
       demo         artiow    false    186    7            �            1259    19596    media_order    TABLE     �   CREATE TABLE demo.media_order (
    media_id integer NOT NULL,
    order_id integer NOT NULL,
    count integer DEFAULT 1 NOT NULL,
    total_price integer NOT NULL
);
    DROP TABLE demo.media_order;
       demo         artiow    false    7            �            1259    19438    media_type_seq    SEQUENCE     u   CREATE SEQUENCE demo.media_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE demo.media_type_seq;
       demo       artiow    false    7            �            1259    19468 
   media_type    TABLE     �   CREATE TABLE demo.media_type (
    id integer DEFAULT nextval('demo.media_type_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL,
    description character varying(90)
);
    DROP TABLE demo.media_type;
       demo         artiow    false    187    7            �            1259    19440 	   order_seq    SEQUENCE     p   CREATE SEQUENCE demo.order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.order_seq;
       demo       artiow    false    7            �            1259    19480    order    TABLE     �   CREATE TABLE demo."order" (
    id integer DEFAULT nextval('demo.order_seq'::regclass) NOT NULL,
    status_id integer NOT NULL,
    address character varying(90) NOT NULL,
    ordered timestamp without time zone NOT NULL
);
    DROP TABLE demo."order";
       demo         artiow    false    188    7            �            1259    19442    order_status_seq    SEQUENCE     w   CREATE SEQUENCE demo.order_status_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE demo.order_status_seq;
       demo       artiow    false    7            �            1259    19474    order_status    TABLE     �   CREATE TABLE demo.order_status (
    id integer DEFAULT nextval('demo.order_status_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL,
    description character varying(90)
);
    DROP TABLE demo.order_status;
       demo         artiow    false    189    7            �            1259    19493    picture    TABLE     �   CREATE TABLE demo.picture (
    id integer NOT NULL,
    url character varying(90) NOT NULL,
    name character varying(45) NOT NULL,
    size integer NOT NULL,
    uploaded timestamp without time zone NOT NULL
);
    DROP TABLE demo.picture;
       demo         artiow    false    7            �            1259    19444    picture_id_seq    SEQUENCE     u   CREATE SEQUENCE demo.picture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE demo.picture_id_seq;
       demo       artiow    false    7            �            1259    19450    picture_id_seq1    SEQUENCE     v   CREATE SEQUENCE demo.picture_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE demo.picture_id_seq1;
       demo       artiow    false    7            �            1259    19491    picture_id_seq2    SEQUENCE     v   CREATE SEQUENCE demo.picture_id_seq2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE demo.picture_id_seq2;
       demo       artiow    false    202    7            	           0    0    picture_id_seq2    SEQUENCE OWNED BY     >   ALTER SEQUENCE demo.picture_id_seq2 OWNED BY demo.picture.id;
            demo       artiow    false    201            �            1259    19524    singer    TABLE     _   CREATE TABLE demo.singer (
    id integer NOT NULL,
    name character varying(45) NOT NULL
);
    DROP TABLE demo.singer;
       demo         artiow    false    7            �            1259    19448    singer_id_seq    SEQUENCE     t   CREATE SEQUENCE demo.singer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE demo.singer_id_seq;
       demo       artiow    false    7            �            1259    19454    singer_id_seq1    SEQUENCE     u   CREATE SEQUENCE demo.singer_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE demo.singer_id_seq1;
       demo       artiow    false    7            �            1259    19522    singer_id_seq2    SEQUENCE     u   CREATE SEQUENCE demo.singer_id_seq2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE demo.singer_id_seq2;
       demo       artiow    false    7    207            	           0    0    singer_id_seq2    SEQUENCE OWNED BY     <   ALTER SEQUENCE demo.singer_id_seq2 OWNED BY demo.singer.id;
            demo       artiow    false    206            �            1259    19428    user_seq    SEQUENCE     o   CREATE SEQUENCE demo.user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE demo.user_seq;
       demo       artiow    false    7            �            1259    19501    user    TABLE     �  CREATE TABLE demo."user" (
    id integer DEFAULT nextval('demo.user_seq'::regclass) NOT NULL,
    login character varying(45) NOT NULL,
    password character varying(90) NOT NULL,
    name character varying(45) NOT NULL,
    surname character varying(45) NOT NULL,
    phone character varying(16) NOT NULL,
    address character varying(90) NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE demo."user";
       demo         artiow    false    182    7            �            1259    19426    user_role_seq    SEQUENCE     t   CREATE SEQUENCE demo.user_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE demo.user_role_seq;
       demo       artiow    false    7            �            1259    19456 	   user_role    TABLE     �   CREATE TABLE demo.user_role (
    id integer DEFAULT nextval('demo.user_role_seq'::regclass) NOT NULL,
    name character varying(45) NOT NULL,
    code character varying(45) NOT NULL,
    description character varying(90)
);
    DROP TABLE demo.user_role;
       demo         artiow    false    181    7            B           2604    19517    label id    DEFAULT     a   ALTER TABLE ONLY demo.label ALTER COLUMN id SET DEFAULT nextval('demo.label_id_seq2'::regclass);
 5   ALTER TABLE demo.label ALTER COLUMN id DROP DEFAULT;
       demo       artiow    false    204    205    205            @           2604    19496 
   picture id    DEFAULT     e   ALTER TABLE ONLY demo.picture ALTER COLUMN id SET DEFAULT nextval('demo.picture_id_seq2'::regclass);
 7   ALTER TABLE demo.picture ALTER COLUMN id DROP DEFAULT;
       demo       artiow    false    202    201    202            C           2604    19527 	   singer id    DEFAULT     c   ALTER TABLE ONLY demo.singer ALTER COLUMN id SET DEFAULT nextval('demo.singer_id_seq2'::regclass);
 6   ALTER TABLE demo.singer ALTER COLUMN id DROP DEFAULT;
       demo       artiow    false    207    206    207            
	          0    19532    album 
   TABLE DATA               ^   COPY demo.album (id, label_id, singer_id, name, picture_id, release, description) FROM stdin;
    demo       artiow    false    208   y       	          0    19565    album_genres 
   TABLE DATA               8   COPY demo.album_genres (album_id, genre_id) FROM stdin;
    demo       artiow    false    210   ay       	          0    19554    composition 
   TABLE DATA               L   COPY demo.composition (id, album_id, album_pos, name, duration) FROM stdin;
    demo       artiow    false    209   ~y       	          0    19612    current_basket 
   TABLE DATA               F   COPY demo.current_basket (user_id, media_id, media_count) FROM stdin;
    demo       artiow    false    213   �y       �          0    19462    genre 
   TABLE DATA               -   COPY demo.genre (id, name, code) FROM stdin;
    demo       artiow    false    197   �y       	          0    19514    label 
   TABLE DATA               '   COPY demo.label (id, name) FROM stdin;
    demo       artiow    false    205   �y       	          0    19580    media 
   TABLE DATA               ;   COPY demo.media (id, type_id, album_id, price) FROM stdin;
    demo       artiow    false    211   z       	          0    19596    media_order 
   TABLE DATA               K   COPY demo.media_order (media_id, order_id, count, total_price) FROM stdin;
    demo       artiow    false    212   Pz        	          0    19468 
   media_type 
   TABLE DATA               ?   COPY demo.media_type (id, name, code, description) FROM stdin;
    demo       artiow    false    198   mz       	          0    19480    order 
   TABLE DATA               @   COPY demo."order" (id, status_id, address, ordered) FROM stdin;
    demo       artiow    false    200   �z       	          0    19474    order_status 
   TABLE DATA               A   COPY demo.order_status (id, name, code, description) FROM stdin;
    demo       artiow    false    199   �z       	          0    19493    picture 
   TABLE DATA               >   COPY demo.picture (id, url, name, size, uploaded) FROM stdin;
    demo       artiow    false    202   �z       		          0    19524    singer 
   TABLE DATA               (   COPY demo.singer (id, name) FROM stdin;
    demo       artiow    false    207   �z       	          0    19501    user 
   TABLE DATA               [   COPY demo."user" (id, login, password, name, surname, phone, address, role_id) FROM stdin;
    demo       artiow    false    203   F{       �          0    19456 	   user_role 
   TABLE DATA               >   COPY demo.user_role (id, name, code, description) FROM stdin;
    demo       artiow    false    196   c{       	           0    0 	   album_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.album_seq', 1, false);
            demo       artiow    false    184            	           0    0    composition_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('demo.composition_seq', 1, false);
            demo       artiow    false    185            	           0    0 	   genre_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.genre_seq', 1, false);
            demo       artiow    false    183            	           0    0    label_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('demo.label_id_seq', 1, false);
            demo       artiow    false    191            	           0    0    label_id_seq1    SEQUENCE SET     :   SELECT pg_catalog.setval('demo.label_id_seq1', 1, false);
            demo       artiow    false    194            	           0    0    label_id_seq2    SEQUENCE SET     :   SELECT pg_catalog.setval('demo.label_id_seq2', 1, false);
            demo       artiow    false    204            	           0    0 	   media_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.media_seq', 1, false);
            demo       artiow    false    186            	           0    0    media_type_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('demo.media_type_seq', 1, false);
            demo       artiow    false    187             	           0    0 	   order_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('demo.order_seq', 1, false);
            demo       artiow    false    188            !	           0    0    order_status_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('demo.order_status_seq', 1, false);
            demo       artiow    false    189            "	           0    0    picture_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('demo.picture_id_seq', 1, false);
            demo       artiow    false    190            #	           0    0    picture_id_seq1    SEQUENCE SET     <   SELECT pg_catalog.setval('demo.picture_id_seq1', 1, false);
            demo       artiow    false    193            $	           0    0    picture_id_seq2    SEQUENCE SET     <   SELECT pg_catalog.setval('demo.picture_id_seq2', 1, false);
            demo       artiow    false    201            %	           0    0    singer_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('demo.singer_id_seq', 1, false);
            demo       artiow    false    192            &	           0    0    singer_id_seq1    SEQUENCE SET     ;   SELECT pg_catalog.setval('demo.singer_id_seq1', 1, false);
            demo       artiow    false    195            '	           0    0    singer_id_seq2    SEQUENCE SET     ;   SELECT pg_catalog.setval('demo.singer_id_seq2', 1, false);
            demo       artiow    false    206            (	           0    0    user_role_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('demo.user_role_seq', 1, false);
            demo       artiow    false    181            )	           0    0    user_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('demo.user_seq', 1, false);
            demo       artiow    false    182            g           2606    19569 .   album_genres album_genres_album_id_genre_id_pk 
   CONSTRAINT     z   ALTER TABLE ONLY demo.album_genres
    ADD CONSTRAINT album_genres_album_id_genre_id_pk PRIMARY KEY (album_id, genre_id);
 V   ALTER TABLE ONLY demo.album_genres DROP CONSTRAINT album_genres_album_id_genre_id_pk;
       demo         artiow    false    210    210            c           2606    19537    album album_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_pkey;
       demo         artiow    false    208            e           2606    19559    composition composition_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY demo.composition
    ADD CONSTRAINT composition_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY demo.composition DROP CONSTRAINT composition_pkey;
       demo         artiow    false    209            n           2606    19617 1   current_basket current_basket_user_id_media_id_pk 
   CONSTRAINT     |   ALTER TABLE ONLY demo.current_basket
    ADD CONSTRAINT current_basket_user_id_media_id_pk PRIMARY KEY (user_id, media_id);
 Y   ALTER TABLE ONLY demo.current_basket DROP CONSTRAINT current_basket_user_id_media_id_pk;
       demo         artiow    false    213    213            L           2606    19467    genre genre_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.genre DROP CONSTRAINT genre_pkey;
       demo         artiow    false    197            \           2606    19519    label label_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.label DROP CONSTRAINT label_pkey;
       demo         artiow    false    205            l           2606    19601 ,   media_order media_order_media_id_order_id_pk 
   CONSTRAINT     x   ALTER TABLE ONLY demo.media_order
    ADD CONSTRAINT media_order_media_id_order_id_pk PRIMARY KEY (media_id, order_id);
 T   ALTER TABLE ONLY demo.media_order DROP CONSTRAINT media_order_media_id_order_id_pk;
       demo         artiow    false    212    212            i           2606    19585    media media_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo.media DROP CONSTRAINT media_pkey;
       demo         artiow    false    211            N           2606    19473    media_type media_type_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY demo.media_type
    ADD CONSTRAINT media_type_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY demo.media_type DROP CONSTRAINT media_type_pkey;
       demo         artiow    false    198            R           2606    19485    order order_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY demo."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY demo."order" DROP CONSTRAINT order_pkey;
       demo         artiow    false    200            P           2606    19479    order_status order_status_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY demo.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY demo.order_status DROP CONSTRAINT order_status_pkey;
       demo         artiow    false    199            U           2606    19498    picture picture_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY demo.picture
    ADD CONSTRAINT picture_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY demo.picture DROP CONSTRAINT picture_pkey;
       demo         artiow    false    202            `           2606    19529    singer singer_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY demo.singer
    ADD CONSTRAINT singer_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY demo.singer DROP CONSTRAINT singer_pkey;
       demo         artiow    false    207            X           2606    19506    user user_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY demo."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY demo."user" DROP CONSTRAINT user_pkey;
       demo         artiow    false    203            J           2606    19461    user_role user_role_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY demo.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY demo.user_role DROP CONSTRAINT user_role_pkey;
       demo         artiow    false    196            a           1259    19553    album_picture_id_uindex    INDEX     T   CREATE UNIQUE INDEX album_picture_id_uindex ON demo.album USING btree (picture_id);
 )   DROP INDEX demo.album_picture_id_uindex;
       demo         artiow    false    208            Y           1259    19520    label_id_uindex    INDEX     D   CREATE UNIQUE INDEX label_id_uindex ON demo.label USING btree (id);
 !   DROP INDEX demo.label_id_uindex;
       demo         artiow    false    205            Z           1259    19521    label_name_uindex    INDEX     H   CREATE UNIQUE INDEX label_name_uindex ON demo.label USING btree (name);
 #   DROP INDEX demo.label_name_uindex;
       demo         artiow    false    205            j           1259    19629    media_type_id_album_id_uindex    INDEX     a   CREATE UNIQUE INDEX media_type_id_album_id_uindex ON demo.media USING btree (type_id, album_id);
 /   DROP INDEX demo.media_type_id_album_id_uindex;
       demo         artiow    false    211    211            S           1259    19499    picture_id_uindex    INDEX     H   CREATE UNIQUE INDEX picture_id_uindex ON demo.picture USING btree (id);
 #   DROP INDEX demo.picture_id_uindex;
       demo         artiow    false    202            V           1259    19500    picture_url_uindex    INDEX     J   CREATE UNIQUE INDEX picture_url_uindex ON demo.picture USING btree (url);
 $   DROP INDEX demo.picture_url_uindex;
       demo         artiow    false    202            ]           1259    19530    singer_id_uindex    INDEX     F   CREATE UNIQUE INDEX singer_id_uindex ON demo.singer USING btree (id);
 "   DROP INDEX demo.singer_id_uindex;
       demo         artiow    false    207            ^           1259    19531    singer_name_uindex    INDEX     J   CREATE UNIQUE INDEX singer_name_uindex ON demo.singer USING btree (name);
 $   DROP INDEX demo.singer_name_uindex;
       demo         artiow    false    207            u           2606    19570 '   album_genres album_genres_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.album_genres
    ADD CONSTRAINT album_genres_album_id_fkey FOREIGN KEY (album_id) REFERENCES demo.album(id);
 O   ALTER TABLE ONLY demo.album_genres DROP CONSTRAINT album_genres_album_id_fkey;
       demo       artiow    false    210    208    2147            v           2606    19575 '   album_genres album_genres_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.album_genres
    ADD CONSTRAINT album_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES demo.genre(id);
 O   ALTER TABLE ONLY demo.album_genres DROP CONSTRAINT album_genres_genre_id_fkey;
       demo       artiow    false    197    2124    210            q           2606    19538    album album_label_id_fk    FK CONSTRAINT     s   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_label_id_fk FOREIGN KEY (label_id) REFERENCES demo.label(id);
 ?   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_label_id_fk;
       demo       artiow    false    205    2140    208            s           2606    19548    album album_picture_id_fk    FK CONSTRAINT     y   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_picture_id_fk FOREIGN KEY (picture_id) REFERENCES demo.picture(id);
 A   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_picture_id_fk;
       demo       artiow    false    208    2133    202            r           2606    19543    album album_singer_id_fk    FK CONSTRAINT     v   ALTER TABLE ONLY demo.album
    ADD CONSTRAINT album_singer_id_fk FOREIGN KEY (singer_id) REFERENCES demo.singer(id);
 @   ALTER TABLE ONLY demo.album DROP CONSTRAINT album_singer_id_fk;
       demo       artiow    false    2144    208    207            t           2606    19560 %   composition composition_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.composition
    ADD CONSTRAINT composition_album_id_fkey FOREIGN KEY (album_id) REFERENCES demo.album(id);
 M   ALTER TABLE ONLY demo.composition DROP CONSTRAINT composition_album_id_fkey;
       demo       artiow    false    2147    208    209            |           2606    19623 +   current_basket current_basket_media_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.current_basket
    ADD CONSTRAINT current_basket_media_id_fkey FOREIGN KEY (media_id) REFERENCES demo.media(id);
 S   ALTER TABLE ONLY demo.current_basket DROP CONSTRAINT current_basket_media_id_fkey;
       demo       artiow    false    211    213    2153            {           2606    19618 *   current_basket current_basket_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.current_basket
    ADD CONSTRAINT current_basket_user_id_fkey FOREIGN KEY (user_id) REFERENCES demo."user"(id);
 R   ALTER TABLE ONLY demo.current_basket DROP CONSTRAINT current_basket_user_id_fkey;
       demo       artiow    false    213    2136    203            x           2606    19591    media media_album_id_fk    FK CONSTRAINT     s   ALTER TABLE ONLY demo.media
    ADD CONSTRAINT media_album_id_fk FOREIGN KEY (album_id) REFERENCES demo.album(id);
 ?   ALTER TABLE ONLY demo.media DROP CONSTRAINT media_album_id_fk;
       demo       artiow    false    2147    208    211            y           2606    19602 %   media_order media_order_media_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.media_order
    ADD CONSTRAINT media_order_media_id_fkey FOREIGN KEY (media_id) REFERENCES demo.media(id);
 M   ALTER TABLE ONLY demo.media_order DROP CONSTRAINT media_order_media_id_fkey;
       demo       artiow    false    2153    211    212            z           2606    19607 %   media_order media_order_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo.media_order
    ADD CONSTRAINT media_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES demo."order"(id);
 M   ALTER TABLE ONLY demo.media_order DROP CONSTRAINT media_order_order_id_fkey;
       demo       artiow    false    212    2130    200            w           2606    19586    media media_type_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY demo.media
    ADD CONSTRAINT media_type_id_fkey FOREIGN KEY (type_id) REFERENCES demo.media_type(id);
 @   ALTER TABLE ONLY demo.media DROP CONSTRAINT media_type_id_fkey;
       demo       artiow    false    2126    211    198            o           2606    19486    order order_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY demo."order"
    ADD CONSTRAINT order_status_id_fkey FOREIGN KEY (status_id) REFERENCES demo.order_status(id);
 D   ALTER TABLE ONLY demo."order" DROP CONSTRAINT order_status_id_fkey;
       demo       artiow    false    200    199    2128            p           2606    19507    user user_user_role_id_fk    FK CONSTRAINT     z   ALTER TABLE ONLY demo."user"
    ADD CONSTRAINT user_user_role_id_fk FOREIGN KEY (role_id) REFERENCES demo.user_role(id);
 C   ALTER TABLE ONLY demo."user" DROP CONSTRAINT user_user_role_id_fk;
       demo       artiow    false    196    203    2122            
	   J   x�3�4B����Ԓ�Ĥ�T�?N#CS]C 򸌀
�8�s���J��
�
���Ɯ��99��1z\\\ ���      	      x������ � �      	      x������ � �      	      x������ � �      �      x������ � �      	   8   x�3�t��/O-Rp�,�QJM�/J)�2�t�LWNN,�T���+.I-*����� |w�      	   #   x�3�4AS.# ��42���Ԁ+F��� eO+      	      x������ � �       	   %   x�3�tv�LN�
�����%
.��ٚ\1z\\\ }b�      	      x������ � �      	      x������ � �      	      x������ � �      		   =   x�3��/�/�,�T���,N�2���IQp/J��2��̫T��/��KWH,*)����� ��5      	      x������ � �      �      x������ � �     