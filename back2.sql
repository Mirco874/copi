PGDMP     +    7                {            employeescontrol    14.5    14.5 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17619    employeescontrol    DATABASE     n   CREATE DATABASE employeescontrol WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Bolivia.1252';
     DROP DATABASE employeescontrol;
                postgres    false                        2615    17621    control    SCHEMA        CREATE SCHEMA control;
    DROP SCHEMA control;
                postgres    false            �            1259    17646    rol    TABLE     _   CREATE TABLE control.rol (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE control.rol;
       control         heap    postgres    false    4            �            1259    17645 
   rol_id_seq    SEQUENCE     �   CREATE SEQUENCE control.rol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE control.rol_id_seq;
       control          postgres    false    4    215                       0    0 
   rol_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE control.rol_id_seq OWNED BY control.rol.id;
          control          postgres    false    214            �            1259    17623    user    TABLE     
  CREATE TABLE control."user" (
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
    DROP TABLE control."user";
       control         heap    postgres    false    4            �            1259    17622    user_id_seq    SEQUENCE     �   CREATE SEQUENCE control.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE control.user_id_seq;
       control          postgres    false    211    4                       0    0    user_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE control.user_id_seq OWNED BY control."user".id;
          control          postgres    false    210            �            1259    17672    vaccination_record    TABLE     _  CREATE TABLE control.vaccination_record (
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
 '   DROP TABLE control.vaccination_record;
       control         heap    postgres    false    4            �            1259    17671    vaccination_record_id_seq    SEQUENCE     �   CREATE SEQUENCE control.vaccination_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE control.vaccination_record_id_seq;
       control          postgres    false    217    4                       0    0    vaccination_record_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE control.vaccination_record_id_seq OWNED BY control.vaccination_record.id;
          control          postgres    false    216            �            1259    17639    vaccine    TABLE     c   CREATE TABLE control.vaccine (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);
    DROP TABLE control.vaccine;
       control         heap    postgres    false    4            �            1259    17638    vaccine_id_seq    SEQUENCE     �   CREATE SEQUENCE control.vaccine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE control.vaccine_id_seq;
       control          postgres    false    4    213                       0    0    vaccine_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE control.vaccine_id_seq OWNED BY control.vaccine.id;
          control          postgres    false    212            n           2604    17649    rol id    DEFAULT     b   ALTER TABLE ONLY control.rol ALTER COLUMN id SET DEFAULT nextval('control.rol_id_seq'::regclass);
 6   ALTER TABLE control.rol ALTER COLUMN id DROP DEFAULT;
       control          postgres    false    215    214    215            l           2604    17626    user id    DEFAULT     f   ALTER TABLE ONLY control."user" ALTER COLUMN id SET DEFAULT nextval('control.user_id_seq'::regclass);
 9   ALTER TABLE control."user" ALTER COLUMN id DROP DEFAULT;
       control          postgres    false    211    210    211            o           2604    17675    vaccination_record id    DEFAULT     �   ALTER TABLE ONLY control.vaccination_record ALTER COLUMN id SET DEFAULT nextval('control.vaccination_record_id_seq'::regclass);
 E   ALTER TABLE control.vaccination_record ALTER COLUMN id DROP DEFAULT;
       control          postgres    false    216    217    217            m           2604    17642 
   vaccine id    DEFAULT     j   ALTER TABLE ONLY control.vaccine ALTER COLUMN id SET DEFAULT nextval('control.vaccine_id_seq'::regclass);
 :   ALTER TABLE control.vaccine ALTER COLUMN id DROP DEFAULT;
       control          postgres    false    212    213    213                      0    17646    rol 
   TABLE DATA           (   COPY control.rol (id, name) FROM stdin;
    control          postgres    false    215   �*                 0    17623    user 
   TABLE DATA           �   COPY control."user" (id, id_rol, email, password, name, last_name, birth_date, address, phone, created_by, created_date, updated_by, updated_date, identity_card) FROM stdin;
    control          postgres    false    211   !+                 0    17672    vaccination_record 
   TABLE DATA           �   COPY control.vaccination_record (id, id_user, id_vaccine, vaccination_date, doses, created_by, created_date, updated_by, updated_date) FROM stdin;
    control          postgres    false    217   -                 0    17639    vaccine 
   TABLE DATA           ,   COPY control.vaccine (id, name) FROM stdin;
    control          postgres    false    213   =-                  0    0 
   rol_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('control.rol_id_seq', 1, true);
          control          postgres    false    214                       0    0    user_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('control.user_id_seq', 14, true);
          control          postgres    false    210                       0    0    vaccination_record_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('control.vaccination_record_id_seq', 1, true);
          control          postgres    false    216                        0    0    vaccine_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('control.vaccine_id_seq', 3, true);
          control          postgres    false    212            r           2606    17667    user email_unique_constraint 
   CONSTRAINT     [   ALTER TABLE ONLY control."user"
    ADD CONSTRAINT email_unique_constraint UNIQUE (email);
 I   ALTER TABLE ONLY control."user" DROP CONSTRAINT email_unique_constraint;
       control            postgres    false    211            u           2606    17665 $   user identity_card_unique_constraint 
   CONSTRAINT     k   ALTER TABLE ONLY control."user"
    ADD CONSTRAINT identity_card_unique_constraint UNIQUE (identity_card);
 Q   ALTER TABLE ONLY control."user" DROP CONSTRAINT identity_card_unique_constraint;
       control            postgres    false    211            {           2606    17651    rol rol_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY control.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY control.rol DROP CONSTRAINT rol_pkey;
       control            postgres    false    215            w           2606    17669    user user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY control."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY control."user" DROP CONSTRAINT user_pkey;
       control            postgres    false    211            }           2606    17678 *   vaccination_record vaccination_record_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY control.vaccination_record
    ADD CONSTRAINT vaccination_record_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY control.vaccination_record DROP CONSTRAINT vaccination_record_pkey;
       control            postgres    false    217            y           2606    17644    vaccine vaccine_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY control.vaccine
    ADD CONSTRAINT vaccine_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY control.vaccine DROP CONSTRAINT vaccine_pkey;
       control            postgres    false    213            s           1259    17657    fki_user_rol    INDEX     B   CREATE INDEX fki_user_rol ON control."user" USING btree (id_rol);
 !   DROP INDEX control.fki_user_rol;
       control            postgres    false    211                       2606    17679 #   vaccination_record register_vaccine    FK CONSTRAINT     �   ALTER TABLE ONLY control.vaccination_record
    ADD CONSTRAINT register_vaccine FOREIGN KEY (id_vaccine) REFERENCES control.vaccine(id);
 N   ALTER TABLE ONLY control.vaccination_record DROP CONSTRAINT register_vaccine;
       control          postgres    false    3193    213    217            ~           2606    17652    user user_rol    FK CONSTRAINT     w   ALTER TABLE ONLY control."user"
    ADD CONSTRAINT user_rol FOREIGN KEY (id_rol) REFERENCES control.rol(id) NOT VALID;
 :   ALTER TABLE ONLY control."user" DROP CONSTRAINT user_rol;
       control          postgres    false    211    215    3195                   x�3�LL����2�L�-�ɯLM����� X��         �  x����r�0��>p��]ɖm�TL	-��$L.
 �X��$�V�>B^��@���V$�����F�x����Ŋ�̜�j���huz�q���}_>���ep�Ӥ�{V�L(�p�%�d�Y�K�v��T9��)�aƈ� �Z<˄�\�/�a݁�EYΔ�l��]p|�X6u\�1�E�2)�8q�ͤB�R>ʗߪV��� zT�x��|��X譥�DM���y�C���#�s��Nfr.���d!ja,ʪů�o���n�m�[��(e5�O�Aä�-�z��gۥ����#�L�u�TVM�vɥ��F���R[��Џ��v����!����x��;1��b��߄ݭ���2����6CU�/�"^�X�O���b`��	\�s��I���7�M)u�h�>A���P�?G��`��4]w�Uf����~��+��������5'�i�fv�;�e�լ��9ڝ�i�_��8�         %   x�3�44�4�4����50�50�4��#�=... z�         :   x�3�.(-����2�t,.)J�J�KMN�2�HˬJ-�2�����+��S��\1z\\\ �^N     