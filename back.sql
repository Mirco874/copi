PGDMP     :    6                {            employeescontrol    14.5    14.5 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17619    employeescontrol    DATABASE     n   CREATE DATABASE employeescontrol WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Bolivia.1252';
     DROP DATABASE employeescontrol;
                postgres    false                        2615    17621    controll    SCHEMA        CREATE SCHEMA controll;
    DROP SCHEMA controll;
                postgres    false            �            1259    17646    rol    TABLE     `   CREATE TABLE controll.rol (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE controll.rol;
       controll         heap    postgres    false    4            �            1259    17645 
   rol_id_seq    SEQUENCE     �   CREATE SEQUENCE controll.rol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE controll.rol_id_seq;
       controll          postgres    false    4    215                       0    0 
   rol_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE controll.rol_id_seq OWNED BY controll.rol.id;
          controll          postgres    false    214            �            1259    17623    user    TABLE       CREATE TABLE controll."user" (
    id integer NOT NULL,
    id_rol integer NOT NULL,
    email character varying(60),
    password character varying(100),
    name character varying(100),
    last_name character varying(100),
    birth_date date,
    address character varying(100),
    phone character varying(30),
    created_by character varying(30),
    created_date timestamp without time zone,
    updated_by character varying,
    updated_date timestamp without time zone,
    identity_card character varying(10)
);
    DROP TABLE controll."user";
       controll         heap    postgres    false    4            �            1259    17622    user_id_seq    SEQUENCE     �   CREATE SEQUENCE controll.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE controll.user_id_seq;
       controll          postgres    false    211    4                       0    0    user_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE controll.user_id_seq OWNED BY controll."user".id;
          controll          postgres    false    210            �            1259    17672    vaccination_record    TABLE     `  CREATE TABLE controll.vaccination_record (
    id integer NOT NULL,
    id_user integer NOT NULL,
    id_vaccine integer,
    vaccination_date date,
    doses integer DEFAULT 0 NOT NULL,
    created_by character varying(30),
    created_date timestamp without time zone,
    updated_by character varying(30),
    updated_date time without time zone
);
 (   DROP TABLE controll.vaccination_record;
       controll         heap    postgres    false    4            �            1259    17671    vaccination_record_id_seq    SEQUENCE     �   CREATE SEQUENCE controll.vaccination_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE controll.vaccination_record_id_seq;
       controll          postgres    false    217    4                       0    0    vaccination_record_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE controll.vaccination_record_id_seq OWNED BY controll.vaccination_record.id;
          controll          postgres    false    216            �            1259    17639    vaccine    TABLE     d   CREATE TABLE controll.vaccine (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);
    DROP TABLE controll.vaccine;
       controll         heap    postgres    false    4            �            1259    17638    vaccine_id_seq    SEQUENCE     �   CREATE SEQUENCE controll.vaccine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE controll.vaccine_id_seq;
       controll          postgres    false    4    213                       0    0    vaccine_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE controll.vaccine_id_seq OWNED BY controll.vaccine.id;
          controll          postgres    false    212            n           2604    17649    rol id    DEFAULT     d   ALTER TABLE ONLY controll.rol ALTER COLUMN id SET DEFAULT nextval('controll.rol_id_seq'::regclass);
 7   ALTER TABLE controll.rol ALTER COLUMN id DROP DEFAULT;
       controll          postgres    false    215    214    215            l           2604    17626    user id    DEFAULT     h   ALTER TABLE ONLY controll."user" ALTER COLUMN id SET DEFAULT nextval('controll.user_id_seq'::regclass);
 :   ALTER TABLE controll."user" ALTER COLUMN id DROP DEFAULT;
       controll          postgres    false    211    210    211            o           2604    17675    vaccination_record id    DEFAULT     �   ALTER TABLE ONLY controll.vaccination_record ALTER COLUMN id SET DEFAULT nextval('controll.vaccination_record_id_seq'::regclass);
 F   ALTER TABLE controll.vaccination_record ALTER COLUMN id DROP DEFAULT;
       controll          postgres    false    216    217    217            m           2604    17642 
   vaccine id    DEFAULT     l   ALTER TABLE ONLY controll.vaccine ALTER COLUMN id SET DEFAULT nextval('controll.vaccine_id_seq'::regclass);
 ;   ALTER TABLE controll.vaccine ALTER COLUMN id DROP DEFAULT;
       controll          postgres    false    212    213    213                      0    17646    rol 
   TABLE DATA           )   COPY controll.rol (id, name) FROM stdin;
    controll          postgres    false    215   U+                 0    17623    user 
   TABLE DATA           �   COPY controll."user" (id, id_rol, email, password, name, last_name, birth_date, address, phone, created_by, created_date, updated_by, updated_date, identity_card) FROM stdin;
    controll          postgres    false    211   �+                 0    17672    vaccination_record 
   TABLE DATA           �   COPY controll.vaccination_record (id, id_user, id_vaccine, vaccination_date, doses, created_by, created_date, updated_by, updated_date) FROM stdin;
    controll          postgres    false    217   l-                 0    17639    vaccine 
   TABLE DATA           -   COPY controll.vaccine (id, name) FROM stdin;
    controll          postgres    false    213   �-                  0    0 
   rol_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('controll.rol_id_seq', 1, true);
          controll          postgres    false    214                       0    0    user_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('controll.user_id_seq', 14, true);
          controll          postgres    false    210                       0    0    vaccination_record_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('controll.vaccination_record_id_seq', 1, true);
          controll          postgres    false    216                        0    0    vaccine_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('controll.vaccine_id_seq', 3, true);
          controll          postgres    false    212            r           2606    17667    user email_unique_constraint 
   CONSTRAINT     \   ALTER TABLE ONLY controll."user"
    ADD CONSTRAINT email_unique_constraint UNIQUE (email);
 J   ALTER TABLE ONLY controll."user" DROP CONSTRAINT email_unique_constraint;
       controll            postgres    false    211            u           2606    17665 $   user identity_card_unique_constraint 
   CONSTRAINT     l   ALTER TABLE ONLY controll."user"
    ADD CONSTRAINT identity_card_unique_constraint UNIQUE (identity_card);
 R   ALTER TABLE ONLY controll."user" DROP CONSTRAINT identity_card_unique_constraint;
       controll            postgres    false    211            {           2606    17651    rol rol_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY controll.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY controll.rol DROP CONSTRAINT rol_pkey;
       controll            postgres    false    215            w           2606    17669    user user_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY controll."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY controll."user" DROP CONSTRAINT user_pkey;
       controll            postgres    false    211            }           2606    17678 *   vaccination_record vaccination_record_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY controll.vaccination_record
    ADD CONSTRAINT vaccination_record_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY controll.vaccination_record DROP CONSTRAINT vaccination_record_pkey;
       controll            postgres    false    217            y           2606    17644    vaccine vaccine_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY controll.vaccine
    ADD CONSTRAINT vaccine_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY controll.vaccine DROP CONSTRAINT vaccine_pkey;
       controll            postgres    false    213            s           1259    17657    fki_user_rol    INDEX     C   CREATE INDEX fki_user_rol ON controll."user" USING btree (id_rol);
 "   DROP INDEX controll.fki_user_rol;
       controll            postgres    false    211                       2606    17679 #   vaccination_record register_vaccine    FK CONSTRAINT     �   ALTER TABLE ONLY controll.vaccination_record
    ADD CONSTRAINT register_vaccine FOREIGN KEY (id_vaccine) REFERENCES controll.vaccine(id);
 O   ALTER TABLE ONLY controll.vaccination_record DROP CONSTRAINT register_vaccine;
       controll          postgres    false    3193    213    217            ~           2606    17652    user user_rol    FK CONSTRAINT     y   ALTER TABLE ONLY controll."user"
    ADD CONSTRAINT user_rol FOREIGN KEY (id_rol) REFERENCES controll.rol(id) NOT VALID;
 ;   ALTER TABLE ONLY controll."user" DROP CONSTRAINT user_rol;
       controll          postgres    false    211    215    3195                   x�3�LL����2�L�-�ɯLM����� X��         �  x����r�0��>p��]ɖm�TL	-��$L.
 �X��$�V�>B^��@���V$�����F�x����Ŋ�̜�j���huz�q���}_>���ep�Ӥ�{V�L(�p�%�d�Y�K�v��T9��)�aƈ� �Z<˄�\�/�a݁�EYΔ�l��]p|�X6u\�1�E�2)�8q�ͤB�R>ʗߪV��� zT�x��|��X譥�DM���y�C���#�s��Nfr.���d!ja,ʪů�o���n�m�[��(e5�O�Aä�-�z��gۥ����#�L�u�TVM�vɥ��F���R[��Џ��v����!����x��;1��b��߄ݭ���2����6CU�/�"^�X�O���b`��	\�s��I���7�M)u�h�>A���P�?G��`��4]w�Uf����~��+��������5'�i�fv�;�e�լ��9ڝ�i�_��8�         %   x�3�44�4�4����50�50�4��#�=... z�         :   x�3�.(-����2�t,.)J�J�KMN�2�HˬJ-�2�����+��S��\1z\\\ �^N     