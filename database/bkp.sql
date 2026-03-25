--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:r8+9f1sEv7aK8sHS8TgXaQ==$rSyuQM8ri436rVpfl3v6/dxx0TjaY2R7VdHJsYH74qA=:T00riaCDWT98rtRoYk4qtz63bE6l6zq+wpIPwaklSVA=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "admin" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: admin; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE admin WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE admin OWNER TO admin;

\connect admin

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: empresa_1; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA empresa_1;


ALTER SCHEMA empresa_1 OWNER TO admin;

--
-- Name: odonto; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA odonto;


ALTER SCHEMA odonto OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_levels; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.access_levels (
    access_level_id integer NOT NULL,
    level_name character varying(50) NOT NULL,
    description text,
    id_empresa integer,
    acessa_todas_agendas boolean,
    acessa_financeiro_paciente boolean
);


ALTER TABLE odonto.access_levels OWNER TO admin;

--
-- Name: access_levels_access_level_id_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.access_levels_access_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.access_levels_access_level_id_seq OWNER TO admin;

--
-- Name: access_levels_access_level_id_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.access_levels_access_level_id_seq OWNED BY odonto.access_levels.access_level_id;


--
-- Name: access_levels_screen; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.access_levels_screen (
    id_access_levels_screen integer NOT NULL,
    id_access_levels integer NOT NULL,
    id_screen integer NOT NULL,
    id_empresa integer NOT NULL
);


ALTER TABLE odonto.access_levels_screen OWNER TO admin;

--
-- Name: access_levels_screen_id_access_levels_screen_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.access_levels_screen_id_access_levels_screen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.access_levels_screen_id_access_levels_screen_seq OWNER TO admin;

--
-- Name: access_levels_screen_id_access_levels_screen_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.access_levels_screen_id_access_levels_screen_seq OWNED BY odonto.access_levels_screen.id_access_levels_screen;


--
-- Name: agenda; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.agenda (
    id_agenda integer NOT NULL,
    id_empresa integer,
    id_paciente integer,
    id_profissional integer,
    start timestamp without time zone,
    "end" timestamp without time zone,
    obs text,
    id_metodo_pagamento integer,
    total_pagamento_servico double precision,
    desconto double precision,
    status integer,
    descricao character varying,
    dia_inteiro boolean,
    id_orcamento integer,
    telefone character varying
);


ALTER TABLE odonto.agenda OWNER TO admin;

--
-- Name: agenda_config; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.agenda_config (
    id_agenda_config integer NOT NULL,
    id_empresa integer NOT NULL,
    horario_funcionamento_inicio time without time zone,
    horario_funcionamento_fim time without time zone,
    intervalo_minimo_slots time without time zone
);


ALTER TABLE odonto.agenda_config OWNER TO admin;

--
-- Name: agenda_id_agenda_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.agenda_id_agenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.agenda_id_agenda_seq OWNER TO admin;

--
-- Name: agenda_id_agenda_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.agenda_id_agenda_seq OWNED BY odonto.agenda.id_agenda;


--
-- Name: agendaconfig_id_agenda_config_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.agendaconfig_id_agenda_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.agendaconfig_id_agenda_config_seq OWNER TO admin;

--
-- Name: agendaconfig_id_agenda_config_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.agendaconfig_id_agenda_config_seq OWNED BY odonto.agenda_config.id_agenda_config;


--
-- Name: anamnese; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.anamnese (
    id_anamnese integer NOT NULL,
    id_paciente integer,
    doenca boolean,
    descricao_doenca character varying(100),
    gravidez boolean,
    mes_gravidez integer,
    uso_medicacao boolean,
    descricao_medicacoes text,
    nome_medico_assistente character varying(100),
    telefone_medico_assistente character varying(20),
    alergia boolean,
    descricao_alergia character varying(244),
    fuma boolean,
    bebe boolean,
    pratica_exercicio boolean,
    ja_foi_operado boolean,
    descricao_operacao text,
    problema_anestesia boolean,
    problema_hemorragia boolean,
    doenca_reumatica boolean,
    problema_cardiaco boolean,
    problema_renal boolean,
    problema_gastrico boolean,
    problema_alergico boolean,
    problemas_articulares_reumatismo boolean,
    diabetes boolean,
    hipertensao boolean,
    outra boolean,
    descricao_outra character varying(100),
    problema_cicatrizacao boolean,
    tratamento_medico boolean,
    historico_familiar_doenca boolean,
    descricao_historico_familiar_doenca character varying
);


ALTER TABLE odonto.anamnese OWNER TO admin;

--
-- Name: anamnese_id_anamnese_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.anamnese_id_anamnese_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.anamnese_id_anamnese_seq OWNER TO admin;

--
-- Name: anamnese_id_anamnese_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.anamnese_id_anamnese_seq OWNED BY odonto.anamnese.id_anamnese;


--
-- Name: categoria_financeira; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.categoria_financeira (
    id_categoria_financeira integer NOT NULL,
    nome_categoria character varying,
    status character varying,
    id_empresa integer
);


ALTER TABLE odonto.categoria_financeira OWNER TO admin;

--
-- Name: categoria_despesa_id_categoria_despesa_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.categoria_despesa_id_categoria_despesa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.categoria_despesa_id_categoria_despesa_seq OWNER TO admin;

--
-- Name: categoria_despesa_id_categoria_despesa_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.categoria_despesa_id_categoria_despesa_seq OWNED BY odonto.categoria_financeira.id_categoria_financeira;


--
-- Name: contas_pagar; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.contas_pagar (
    id_contas_pagar integer NOT NULL,
    descricao character varying,
    fornecedor character varying,
    dt_emissao date,
    dt_vencimento date,
    valor double precision,
    status character varying,
    id_forma_pagamento integer,
    nr_documento character varying,
    obs text,
    dt_pagamento date,
    id_categoria integer,
    id_centro_custo integer,
    id_user integer,
    id_empresa integer,
    id_fornecedor integer,
    created_at timestamp without time zone DEFAULT now(),
    valor_total double precision
);


ALTER TABLE odonto.contas_pagar OWNER TO admin;

--
-- Name: contas_pagar_id_contas_pagar_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.contas_pagar_id_contas_pagar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.contas_pagar_id_contas_pagar_seq OWNER TO admin;

--
-- Name: contas_pagar_id_contas_pagar_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.contas_pagar_id_contas_pagar_seq OWNED BY odonto.contas_pagar.id_contas_pagar;


--
-- Name: contas_receber; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.contas_receber (
    id_pagamento integer,
    nr_parcela integer,
    valor double precision,
    dt_vencimento date,
    status character varying,
    id_paciente integer,
    id_empresa integer,
    dt_recebimento date,
    expire_boleto_at date,
    link_boleto character varying,
    charge_id integer,
    id_forma_pagamento integer,
    qtd_parcelas integer,
    link_carnet character varying,
    carnet_id integer,
    descricao character varying,
    id_categoria integer,
    obs text,
    id_contas_receber integer NOT NULL,
    created_at timestamp without time zone,
    dt_emissao date
);


ALTER TABLE odonto.contas_receber OWNER TO admin;

--
-- Name: contas_receber_id_contas_receber_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.contas_receber_id_contas_receber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.contas_receber_id_contas_receber_seq OWNER TO admin;

--
-- Name: contas_receber_id_contas_receber_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.contas_receber_id_contas_receber_seq OWNED BY odonto.contas_receber.id_contas_receber;


--
-- Name: dentes; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.dentes (
    numero_dente character varying NOT NULL,
    descricao character varying(50)
);


ALTER TABLE odonto.dentes OWNER TO admin;

--
-- Name: dynamic_field; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.dynamic_field (
    id_dynamic_field integer NOT NULL,
    form_id integer NOT NULL,
    field_name character varying NOT NULL,
    type character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer
);


ALTER TABLE odonto.dynamic_field OWNER TO admin;

--
-- Name: dynamic_field_id_dynamic_field_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.dynamic_field_id_dynamic_field_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.dynamic_field_id_dynamic_field_seq OWNER TO admin;

--
-- Name: dynamic_field_id_dynamic_field_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.dynamic_field_id_dynamic_field_seq OWNED BY odonto.dynamic_field.id_dynamic_field;


--
-- Name: dynamic_form; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.dynamic_form (
    id_form integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    id_paciente integer
);


ALTER TABLE odonto.dynamic_form OWNER TO admin;

--
-- Name: dynamic_form_id_form_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.dynamic_form_id_form_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.dynamic_form_id_form_seq OWNER TO admin;

--
-- Name: dynamic_form_id_form_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.dynamic_form_id_form_seq OWNED BY odonto.dynamic_form.id_form;


--
-- Name: efi_credential; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.efi_credential (
    id_credential integer NOT NULL,
    id_empresa integer,
    client_id character varying,
    client_secret character varying,
    certificate_path character varying,
    iv_client_id character varying,
    iv_client_secret character varying,
    sandbox boolean
);


ALTER TABLE odonto.efi_credential OWNER TO admin;

--
-- Name: efi_credential_id_credential_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.efi_credential_id_credential_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.efi_credential_id_credential_seq OWNER TO admin;

--
-- Name: efi_credential_id_credential_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.efi_credential_id_credential_seq OWNED BY odonto.efi_credential.id_credential;


--
-- Name: empresa; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.empresa (
    id_empresa integer NOT NULL,
    razao_social character varying,
    nome_fantasia character varying,
    cnpj_cpf character varying(14),
    telefone character varying,
    logo character varying,
    endereco character varying,
    cep character varying,
    logradouro character varying,
    bairro character varying,
    cidade character varying,
    uf character(2),
    email character varying,
    celular character varying,
    numero character varying,
    localidade character varying
);


ALTER TABLE odonto.empresa OWNER TO admin;

--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.empresa_id_empresa_seq OWNER TO admin;

--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.empresa_id_empresa_seq OWNED BY odonto.empresa.id_empresa;


--
-- Name: evolucoes; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.evolucoes (
    id_evolucao integer NOT NULL,
    id_paciente integer NOT NULL,
    texto text NOT NULL,
    id_profissional integer NOT NULL,
    id_empresa integer NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE odonto.evolucoes OWNER TO admin;

--
-- Name: evolucoes_id_evolucao_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.evolucoes_id_evolucao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.evolucoes_id_evolucao_seq OWNER TO admin;

--
-- Name: evolucoes_id_evolucao_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.evolucoes_id_evolucao_seq OWNED BY odonto.evolucoes.id_evolucao;


--
-- Name: faces_dente; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.faces_dente (
    dente character varying NOT NULL,
    face character(1)
);


ALTER TABLE odonto.faces_dente OWNER TO admin;

--
-- Name: form_dynamic_data; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.form_dynamic_data (
    id_form_dynamic_data integer NOT NULL,
    form_id integer,
    data jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    id_paciente integer
);


ALTER TABLE odonto.form_dynamic_data OWNER TO admin;

--
-- Name: form_dynamic_data_id_form_dynamic_data_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.form_dynamic_data_id_form_dynamic_data_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.form_dynamic_data_id_form_dynamic_data_seq OWNER TO admin;

--
-- Name: form_dynamic_data_id_form_dynamic_data_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.form_dynamic_data_id_form_dynamic_data_seq OWNED BY odonto.form_dynamic_data.id_form_dynamic_data;


--
-- Name: forma_pagamento; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.forma_pagamento (
    id_forma_pagamento integer NOT NULL,
    descricao character varying
);


ALTER TABLE odonto.forma_pagamento OWNER TO admin;

--
-- Name: forma_pagamento_id_forma_pagamento_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.forma_pagamento_id_forma_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.forma_pagamento_id_forma_pagamento_seq OWNER TO admin;

--
-- Name: forma_pagamento_id_forma_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.forma_pagamento_id_forma_pagamento_seq OWNED BY odonto.forma_pagamento.id_forma_pagamento;


--
-- Name: orcamento; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.orcamento (
    id_orcamento integer NOT NULL,
    id_empresa integer,
    id_profissional integer,
    id_paciente integer,
    preco double precision,
    date date,
    status character varying,
    id_agenda integer
);


ALTER TABLE odonto.orcamento OWNER TO admin;

--
-- Name: orcamento_id_orcamento_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.orcamento_id_orcamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.orcamento_id_orcamento_seq OWNER TO admin;

--
-- Name: orcamento_id_orcamento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.orcamento_id_orcamento_seq OWNED BY odonto.orcamento.id_orcamento;


--
-- Name: paciente; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.paciente (
    id_paciente integer NOT NULL,
    nome character varying(100),
    cpf character varying(11),
    telefone_fixo character varying(100),
    telefone_movel character varying(100),
    dt_nascimento date,
    rg character varying(30),
    sexo character(1),
    estado_civil character varying(15),
    email character varying(100),
    plano_saude character varying(100),
    numero_carteirinha character varying(100),
    nome_responsavel character varying(100),
    telefone_responsavel character varying(100),
    email_responsavel character varying(100),
    id_empresa integer,
    inserted_at date,
    cpf_responsavel character varying,
    paciente_endereco integer
);


ALTER TABLE odonto.paciente OWNER TO admin;

--
-- Name: paciente_endereco; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.paciente_endereco (
    id_paciente_endereco character varying,
    id_paciente integer,
    cep character varying,
    uf character varying,
    localidade character varying,
    logradouro character varying,
    numero character varying,
    bairro character varying,
    municipio character varying,
    complemento character varying,
    id_empresa integer
);


ALTER TABLE odonto.paciente_endereco OWNER TO admin;

--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.paciente_id_paciente_seq OWNER TO admin;

--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.paciente_id_paciente_seq OWNED BY odonto.paciente.id_paciente;


--
-- Name: pagamento; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.pagamento (
    id_pagamento integer NOT NULL,
    id_orcamento integer,
    tipo_desconto character varying,
    valor_desconto double precision,
    quantidade_parcelas integer,
    data_primeiro_vencimento date,
    entrada double precision,
    data_pagamento date,
    id_empresa integer,
    valor_total double precision,
    status character varying,
    id_paciente integer,
    id_forma_pagamento integer
);


ALTER TABLE odonto.pagamento OWNER TO admin;

--
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.pagamento_id_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.pagamento_id_pagamento_seq OWNER TO admin;

--
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.pagamento_id_pagamento_seq OWNED BY odonto.pagamento.id_pagamento;


--
-- Name: procedimento; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.procedimento (
    id_procedimento integer NOT NULL,
    dente character varying,
    estado character varying(13),
    observacao text,
    id_profissional integer,
    face_dente character varying,
    adicionado date,
    preco double precision,
    id_procedimento_list integer,
    id_paciente integer,
    orcado boolean,
    id_empresa integer
);


ALTER TABLE odonto.procedimento OWNER TO admin;

--
-- Name: procedimento_id_procedimento_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.procedimento_id_procedimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.procedimento_id_procedimento_seq OWNER TO admin;

--
-- Name: procedimento_id_procedimento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.procedimento_id_procedimento_seq OWNED BY odonto.procedimento.id_procedimento;


--
-- Name: procedimento_list; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.procedimento_list (
    id_procedimento integer NOT NULL,
    descricao character varying,
    categoria character varying,
    preco double precision,
    ativo boolean,
    id_empresa integer,
    tempo_duracao integer
);


ALTER TABLE odonto.procedimento_list OWNER TO admin;

--
-- Name: procedimento_list_id_procedimento_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.procedimento_list_id_procedimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.procedimento_list_id_procedimento_seq OWNER TO admin;

--
-- Name: procedimento_list_id_procedimento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.procedimento_list_id_procedimento_seq OWNED BY odonto.procedimento_list.id_procedimento;


--
-- Name: procedimento_orcamento; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.procedimento_orcamento (
    id_orcamento integer NOT NULL,
    id_procedimento integer NOT NULL,
    preco double precision,
    id_empresa integer
);


ALTER TABLE odonto.procedimento_orcamento OWNER TO admin;

--
-- Name: procedimento_pre; Type: TABLE; Schema: odonto; Owner: postgres
--

CREATE TABLE odonto.procedimento_pre (
    id_procedimento integer NOT NULL,
    descricao character varying,
    preco real,
    ativo boolean,
    categoria character varying
);


ALTER TABLE odonto.procedimento_pre OWNER TO postgres;

--
-- Name: procedimento_pre_id_procedimento_seq; Type: SEQUENCE; Schema: odonto; Owner: postgres
--

CREATE SEQUENCE odonto.procedimento_pre_id_procedimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.procedimento_pre_id_procedimento_seq OWNER TO postgres;

--
-- Name: procedimento_pre_id_procedimento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: postgres
--

ALTER SEQUENCE odonto.procedimento_pre_id_procedimento_seq OWNED BY odonto.procedimento_pre.id_procedimento;


--
-- Name: screen; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.screen (
    id_screen integer NOT NULL,
    path character varying(100) NOT NULL,
    id_empresa integer NOT NULL
);


ALTER TABLE odonto.screen OWNER TO admin;

--
-- Name: screen_id_screen_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.screen_id_screen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.screen_id_screen_seq OWNER TO admin;

--
-- Name: screen_id_screen_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.screen_id_screen_seq OWNED BY odonto.screen.id_screen;


--
-- Name: user; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto."user" (
    email character varying(100) NOT NULL,
    nome character varying(100),
    id_empresa integer,
    senha character varying(255),
    id_user integer NOT NULL,
    access_levels integer,
    token_to_reset_password character varying(10),
    schedule_color character varying,
    status boolean
);


ALTER TABLE odonto."user" OWNER TO admin;

--
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.user_id_user_seq OWNER TO admin;

--
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.user_id_user_seq OWNED BY odonto."user".id_user;


--
-- Name: wpp_sessions; Type: TABLE; Schema: odonto; Owner: admin
--

CREATE TABLE odonto.wpp_sessions (
    id_session integer NOT NULL,
    id_empresa integer,
    id_user integer,
    session_name character varying(255) NOT NULL,
    session_data text NOT NULL
);


ALTER TABLE odonto.wpp_sessions OWNER TO admin;

--
-- Name: wpp_sessions_id_session_seq; Type: SEQUENCE; Schema: odonto; Owner: admin
--

CREATE SEQUENCE odonto.wpp_sessions_id_session_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE odonto.wpp_sessions_id_session_seq OWNER TO admin;

--
-- Name: wpp_sessions_id_session_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: admin
--

ALTER SEQUENCE odonto.wpp_sessions_id_session_seq OWNED BY odonto.wpp_sessions.id_session;


--
-- Name: access_levels access_level_id; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.access_levels ALTER COLUMN access_level_id SET DEFAULT nextval('odonto.access_levels_access_level_id_seq'::regclass);


--
-- Name: access_levels_screen id_access_levels_screen; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.access_levels_screen ALTER COLUMN id_access_levels_screen SET DEFAULT nextval('odonto.access_levels_screen_id_access_levels_screen_seq'::regclass);


--
-- Name: agenda id_agenda; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.agenda ALTER COLUMN id_agenda SET DEFAULT nextval('odonto.agenda_id_agenda_seq'::regclass);


--
-- Name: agenda_config id_agenda_config; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.agenda_config ALTER COLUMN id_agenda_config SET DEFAULT nextval('odonto.agendaconfig_id_agenda_config_seq'::regclass);


--
-- Name: anamnese id_anamnese; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.anamnese ALTER COLUMN id_anamnese SET DEFAULT nextval('odonto.anamnese_id_anamnese_seq'::regclass);


--
-- Name: categoria_financeira id_categoria_financeira; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.categoria_financeira ALTER COLUMN id_categoria_financeira SET DEFAULT nextval('odonto.categoria_despesa_id_categoria_despesa_seq'::regclass);


--
-- Name: contas_pagar id_contas_pagar; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.contas_pagar ALTER COLUMN id_contas_pagar SET DEFAULT nextval('odonto.contas_pagar_id_contas_pagar_seq'::regclass);


--
-- Name: contas_receber id_contas_receber; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.contas_receber ALTER COLUMN id_contas_receber SET DEFAULT nextval('odonto.contas_receber_id_contas_receber_seq'::regclass);


--
-- Name: dynamic_field id_dynamic_field; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dynamic_field ALTER COLUMN id_dynamic_field SET DEFAULT nextval('odonto.dynamic_field_id_dynamic_field_seq'::regclass);


--
-- Name: dynamic_form id_form; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dynamic_form ALTER COLUMN id_form SET DEFAULT nextval('odonto.dynamic_form_id_form_seq'::regclass);


--
-- Name: efi_credential id_credential; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.efi_credential ALTER COLUMN id_credential SET DEFAULT nextval('odonto.efi_credential_id_credential_seq'::regclass);


--
-- Name: empresa id_empresa; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('odonto.empresa_id_empresa_seq'::regclass);


--
-- Name: evolucoes id_evolucao; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.evolucoes ALTER COLUMN id_evolucao SET DEFAULT nextval('odonto.evolucoes_id_evolucao_seq'::regclass);


--
-- Name: form_dynamic_data id_form_dynamic_data; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.form_dynamic_data ALTER COLUMN id_form_dynamic_data SET DEFAULT nextval('odonto.form_dynamic_data_id_form_dynamic_data_seq'::regclass);


--
-- Name: forma_pagamento id_forma_pagamento; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.forma_pagamento ALTER COLUMN id_forma_pagamento SET DEFAULT nextval('odonto.forma_pagamento_id_forma_pagamento_seq'::regclass);


--
-- Name: orcamento id_orcamento; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.orcamento ALTER COLUMN id_orcamento SET DEFAULT nextval('odonto.orcamento_id_orcamento_seq'::regclass);


--
-- Name: paciente id_paciente; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('odonto.paciente_id_paciente_seq'::regclass);


--
-- Name: pagamento id_pagamento; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.pagamento ALTER COLUMN id_pagamento SET DEFAULT nextval('odonto.pagamento_id_pagamento_seq'::regclass);


--
-- Name: procedimento id_procedimento; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.procedimento ALTER COLUMN id_procedimento SET DEFAULT nextval('odonto.procedimento_id_procedimento_seq'::regclass);


--
-- Name: procedimento_list id_procedimento; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.procedimento_list ALTER COLUMN id_procedimento SET DEFAULT nextval('odonto.procedimento_list_id_procedimento_seq'::regclass);


--
-- Name: procedimento_pre id_procedimento; Type: DEFAULT; Schema: odonto; Owner: postgres
--

ALTER TABLE ONLY odonto.procedimento_pre ALTER COLUMN id_procedimento SET DEFAULT nextval('odonto.procedimento_pre_id_procedimento_seq'::regclass);


--
-- Name: screen id_screen; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.screen ALTER COLUMN id_screen SET DEFAULT nextval('odonto.screen_id_screen_seq'::regclass);


--
-- Name: user id_user; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto."user" ALTER COLUMN id_user SET DEFAULT nextval('odonto.user_id_user_seq'::regclass);


--
-- Name: wpp_sessions id_session; Type: DEFAULT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.wpp_sessions ALTER COLUMN id_session SET DEFAULT nextval('odonto.wpp_sessions_id_session_seq'::regclass);


--
-- Data for Name: access_levels; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.access_levels (access_level_id, level_name, description, id_empresa, acessa_todas_agendas, acessa_financeiro_paciente) FROM stdin;
2	Atendente	Atendente da clinica	1	t	f
1	Admin	Admin	1	t	t
\.


--
-- Data for Name: access_levels_screen; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.access_levels_screen (id_access_levels_screen, id_access_levels, id_screen, id_empresa) FROM stdin;
1	2	1	1
15	1	4	1
16	1	1	1
17	1	3	1
18	1	2	1
19	1	5	1
21	3	1	1
22	3	3	1
23	4	1	1
\.


--
-- Data for Name: agenda; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.agenda (id_agenda, id_empresa, id_paciente, id_profissional, start, "end", obs, id_metodo_pagamento, total_pagamento_servico, desconto, status, descricao, dia_inteiro, id_orcamento, telefone) FROM stdin;
174	1	0	6	2026-02-19 13:30:00	2026-02-19 14:00:00	\N	\N	\N	\N	3	Auto agendamento	f	209	61988552231
175	1	0	6	2026-02-19 13:30:00	2026-02-19 14:00:00	\N	\N	\N	\N	3	Auto agendamento	f	210	61988552231
201	1	17	3	2026-02-24 09:00:00	2026-02-24 09:30:00	\N	\N	\N	\N	3	Auto agendamento	f	241	61982603961
191	1	15	3	2026-02-23 07:00:00	2026-02-23 15:00:00	teste	\N	\N	\N	1	\N	\N	231	\N
154	1	16	3	2026-02-05 08:00:00	2026-02-05 08:30:00	teste	\N	\N	\N	2	\N	\N	186	\N
155	1	15	3	2026-02-05 08:30:00	2026-02-05 09:00:00	teste	\N	\N	\N	1	test	\N	188	\N
156	1	17	6	2026-02-07 08:00:00	2026-02-07 08:30:00	Nome informado: Luke Skywalker - Telefone informado: 61982603961	\N	\N	\N	3	Auto agendamento	f	191	61982603961
157	1	1	6	2026-02-07 09:00:00	2026-02-07 09:30:00	Nome informado: Pedro Silva - Telefone informado: 61982603962	\N	\N	\N	3	Auto agendamento	f	192	61982603962
202	1	22	3	2026-02-24 09:30:00	2026-02-24 10:00:00	\N	\N	\N	\N	3	Auto agendamento	f	242	61982603962
158	1	1	6	2026-02-07 10:00:00	2026-02-07 10:30:00	Nome informado: Marcelo Damaceno - Telefone informado: 61982603963	\N	\N	\N	1	Auto agendamento	\N	193	61982603963
162	1	17	6	2026-02-07 08:30:00	2026-02-07 09:00:00	Nome informado: Luke Skywalker - Telefone informado: 61982603961	\N	\N	\N	3	Auto agendamento	f	197	61982603961
163	1	17	6	2026-02-07 09:30:00	2026-02-07 10:00:00	Nome informado: Luke Skywalker - Telefone informado: 61982603961	\N	\N	\N	3	Auto agendamento	f	198	61982603961
164	1	15	3	2026-02-06 10:00:00	2026-02-06 10:30:00	tsegsdfg	\N	\N	\N	3	\N	f	199	\N
165	1	17	6	2026-02-07 11:00:00	2026-02-07 11:30:00	Nome informado: Luke Skywalker - Telefone informado: 61982603961	\N	\N	\N	3	Auto agendamento	f	200	61982603961
181	1	17	6	2026-02-19 12:30:00	2026-02-19 13:00:00	\N	\N	\N	\N	3	Auto agendamento	f	216	61982603961
182	1	17	6	2026-02-19 13:00:00	2026-02-19 13:30:00	\N	\N	\N	\N	3	Auto agendamento	f	217	61982603961
166	1	15	3	2026-02-10 08:00:00	2026-02-10 11:30:00	tesat	\N	\N	\N	1	teste	\N	201	\N
167	1	1	6	2026-02-10 11:30:00	2026-02-10 12:30:00	Nome informado: undefined - Telefone informado: undefined	\N	\N	\N	3	Auto agendamento	f	202	\N
168	1	15	\N	2026-02-19 07:30:00	2026-02-19 12:30:00	\N	\N	\N	\N	3	\N	f	203	\N
203	1	17	3	2026-02-25 08:00:00	2026-02-25 08:30:00	\N	\N	\N	\N	3	Auto agendamento	f	243	61982603961
183	1	21	6	2026-02-19 14:00:00	2026-02-19 14:30:00	\N	\N	\N	\N	3	Auto agendamento	f	218	61999999999
204	1	17	3	2026-02-25 08:30:00	2026-02-25 10:30:00	\N	\N	\N	\N	3	Auto agendamento	f	244	61982603961
184	1	22	6	2026-02-19 14:30:00	2026-02-19 15:00:00	\N	\N	\N	\N	3	Auto agendamento	f	219	61982603962
185	1	17	6	2026-02-20 08:00:00	2026-02-20 08:30:00	\N	\N	\N	\N	1	Auto agendamento	\N	220	61982603961
186	1	17	6	2026-02-21 08:00:00	2026-02-21 08:30:00	\N	\N	\N	\N	3	Auto agendamento	f	225	61982603961
187	1	15	2	2026-02-21 08:30:00	2026-02-21 09:00:00	\N	\N	\N	\N	3	\N	f	227	\N
188	1	15	2	2026-02-21 09:30:00	2026-02-21 10:00:00	\N	\N	\N	\N	1	\N	f	228	\N
189	1	17	6	2026-02-21 09:00:00	2026-02-21 09:30:00	\N	\N	\N	\N	3	Auto agendamento	f	229	61982603961
190	1	15	2	2026-02-21 08:00:00	2026-02-21 08:30:00	test	\N	\N	\N	3	\N	f	230	\N
192	\N	15	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	232	\N
205	1	17	2	2026-02-25 08:00:00	2026-02-25 08:30:00	\N	\N	\N	\N	3	Auto agendamento	f	245	61982603961
194	1	15	3	2026-02-23 15:00:00	2026-02-23 15:30:00	\N	\N	\N	\N	1	\N	\N	234	\N
195	1	16	3	2026-02-23 15:30:00	2026-02-23 17:00:00	\N	\N	\N	\N	1	\N	\N	235	\N
196	1	15	3	2026-02-23 17:00:00	2026-02-23 18:00:00	\N	\N	\N	\N	1	\N	\N	236	\N
197	1	15	2	2026-02-23 08:00:00	2026-02-23 08:30:00	\N	\N	\N	\N	1	\N	\N	237	\N
198	1	15	3	2026-02-24 08:00:00	2026-02-24 08:30:00	\N	\N	\N	\N	1	\N	\N	238	\N
199	1	15	3	2026-02-24 08:30:00	2026-02-24 09:00:00	\N	\N	\N	\N	1	\N	\N	239	\N
200	1	15	2	2026-02-24 08:00:00	2026-02-24 08:30:00	\N	\N	\N	\N	1	\N	\N	240	\N
206	1	15	3	2026-02-25 10:30:00	2026-02-25 13:00:00	\N	\N	\N	\N	1	\N	\N	246	\N
\.


--
-- Data for Name: agenda_config; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.agenda_config (id_agenda_config, id_empresa, horario_funcionamento_inicio, horario_funcionamento_fim, intervalo_minimo_slots) FROM stdin;
1	1	08:00:00	18:00:00	00:30:00
\.


--
-- Data for Name: anamnese; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.anamnese (id_anamnese, id_paciente, doenca, descricao_doenca, gravidez, mes_gravidez, uso_medicacao, descricao_medicacoes, nome_medico_assistente, telefone_medico_assistente, alergia, descricao_alergia, fuma, bebe, pratica_exercicio, ja_foi_operado, descricao_operacao, problema_anestesia, problema_hemorragia, doenca_reumatica, problema_cardiaco, problema_renal, problema_gastrico, problema_alergico, problemas_articulares_reumatismo, diabetes, hipertensao, outra, descricao_outra, problema_cicatrizacao, tratamento_medico, historico_familiar_doenca, descricao_historico_familiar_doenca) FROM stdin;
\.


--
-- Data for Name: categoria_financeira; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.categoria_financeira (id_categoria_financeira, nome_categoria, status, id_empresa) FROM stdin;
1	Venda	Ativo	1
2	Salário	Ativo	1
8	Compra insumos	Ativo	1
\.


--
-- Data for Name: contas_pagar; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.contas_pagar (id_contas_pagar, descricao, fornecedor, dt_emissao, dt_vencimento, valor, status, id_forma_pagamento, nr_documento, obs, dt_pagamento, id_categoria, id_centro_custo, id_user, id_empresa, id_fornecedor, created_at, valor_total) FROM stdin;
5	Teste Despesa	\N	2026-02-07	\N	1566.23	pendente	1	\N	\N	\N	8	\N	\N	1	\N	2026-02-07 01:25:04.355616	\N
6	AAAAA	\N	2026-02-07	\N	156.55	pendente	1	\N	\N	\N	8	\N	\N	1	\N	2026-02-07 01:26:23.512394	\N
8	Compra Agulhas	\N	2026-02-07	\N	152.26	pendente	3	\N	\N	\N	1	\N	\N	1	\N	2026-02-07 02:33:16.880229	\N
9	Compra produtos	\N	2026-02-03	\N	145.25	pendente	1	\N	\N	\N	1	\N	\N	1	\N	2026-02-07 02:38:16.899981	\N
2	Salário Funcionário	\N	2026-02-06	2026-03-06	300	liquidado	1	\N	\N	\N	1	\N	\N	1	\N	2026-02-06 00:00:00	\N
7	CCCC	\N	2026-02-07	\N	1500.55	liquidado	1	\N	\N	\N	1	\N	\N	1	\N	2026-02-07 02:11:41.830062	\N
\.


--
-- Data for Name: contas_receber; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.contas_receber (id_pagamento, nr_parcela, valor, dt_vencimento, status, id_paciente, id_empresa, dt_recebimento, expire_boleto_at, link_boleto, charge_id, id_forma_pagamento, qtd_parcelas, link_carnet, carnet_id, descricao, id_categoria, obs, id_contas_receber, created_at, dt_emissao) FROM stdin;
30	1	350	2026-02-20	liquidado	15	1	2026-02-21	\N	\N	\N	1	1	\N	\N	Pagamento referente ao orçamento #222	\N	\N	35	2026-02-20 13:58:40.004699	\N
33	1	125	2026-02-21	pendente	15	1	\N	\N	\N	\N	1	2	\N	\N	Pagamento referente ao orçamento #226	\N	\N	40	2026-02-21 17:18:36.339808	\N
33	2	125	2026-03-21	pendente	15	1	\N	\N	\N	\N	1	2	\N	\N	Pagamento referente ao orçamento #226	\N	\N	41	2026-02-21 17:18:36.617848	\N
29	1	250	2026-02-20	liquidado	15	1	2026-02-21	\N	\N	\N	1	1	\N	\N	Pagamento referente ao orçamento #221	\N	\N	34	2026-02-20 13:57:46.609328	\N
32	2	266.6666666666667	2026-03-21	liquidado	15	1	2026-02-21	\N	\N	\N	1	3	\N	\N	Pagamento referente ao orçamento #224	\N	\N	38	2026-02-21 13:28:24.406019	\N
23	1	550	2026-02-06	Pago	16	1	\N	\N	\N	\N	2	1	\N	\N	Pagamento referente ao orçamento #186	\N	\N	27	2026-02-06 02:00:20.535174	\N
\N	\N	154.3	\N	liquidado	\N	1	\N	\N	\N	\N	1	\N	\N	\N	Outro Teste	8	\N	32	2026-02-07 01:10:00.142184	\N
27	1	250	2026-02-06	liquidado	15	1	2026-02-20	\N	\N	\N	2	1	\N	\N	Pagamento referente ao orçamento #190	\N	\N	28	2026-02-06 23:56:15.076378	\N
28	1	450	2026-02-07	pendente	15	1	\N	\N	\N	\N	1	1	\N	\N	Pagamento referente ao orçamento #199	\N	\N	33	2026-02-07 21:20:22.393567	\N
31	1	250	2026-02-20	liquidado	15	1	2026-02-20	\N	\N	\N	1	1	\N	\N	Pagamento referente ao orçamento #223	\N	\N	36	2026-02-20 14:26:11.560693	\N
\N	\N	1620.39	\N	liquidado	\N	1	\N	\N	\N	\N	2	\N	\N	\N	Salário Funcionário	1	\N	30	2026-02-07 01:06:41.950503	\N
\N	\N	565	\N	liquidado	\N	1	\N	\N	\N	\N	1	\N	\N	\N	Rendimentos LCI	8	\N	31	2026-02-07 01:09:07.879437	\N
32	3	266.6666666666667	2026-04-21	pendente	15	1	\N	\N	\N	\N	1	3	\N	\N	Pagamento referente ao orçamento #224	\N	\N	39	2026-02-21 13:28:24.426621	\N
32	1	266.6666666666667	2026-02-21	liquidado	15	1	2026-02-21	\N	\N	\N	1	3	\N	\N	Pagamento referente ao orçamento #224	\N	\N	37	2026-02-21 13:28:24.375819	\N
\.


--
-- Data for Name: dentes; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.dentes (numero_dente, descricao) FROM stdin;
\.


--
-- Data for Name: dynamic_field; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.dynamic_field (id_dynamic_field, form_id, field_name, type, created_at, id_empresa) FROM stdin;
15	2	Pergunta descritiva2	text	2026-01-13 13:57:07.458416+00	1
16	2	Pergunta binária2	boolean	2026-01-13 13:57:07.458416+00	1
20	3	teste	text	2026-01-27 21:37:13.122715+00	1
21	4	teste	boolean	2026-01-27 21:37:24.247021+00	1
22	5	Tem alergia	boolean	2026-01-28 13:08:23.945273+00	1
23	5	Rémedio de uso contónuo?	boolean	2026-01-28 13:08:23.945273+00	1
24	5	Qual remédio	text	2026-01-28 13:08:23.945273+00	1
25	1	Fuma?	boolean	2026-02-07 03:52:42.427342+00	1
26	1	Bebe?	boolean	2026-02-07 03:52:42.427342+00	1
27	1	Faz uso de algum medicamento?	boolean	2026-02-07 03:52:42.427342+00	1
\.


--
-- Data for Name: dynamic_form; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.dynamic_form (id_form, name, created_at, id_empresa, id_paciente) FROM stdin;
3	teste	2026-01-27 21:37:13.122715+00	1	\N
5	Depilação a laser	2026-01-28 13:08:23.945273+00	1	\N
1	Micropigmentação	2025-12-28 22:21:18.753887+00	1	\N
\.


--
-- Data for Name: efi_credential; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.efi_credential (id_credential, id_empresa, client_id, client_secret, certificate_path, iv_client_id, iv_client_secret, sandbox) FROM stdin;
1	1	kEp9fnt5gLHFoPVCQGqlEQ==	vEAkW7eIDAu4iT7DieGnvA==	C:\\fakepath\\BibliotecaElfica.torrent	PtogPjc23mbwJrWU8M+E0g==	+Z7wUbh6XBx+ojCh7HkLug==	\N
\.


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.empresa (id_empresa, razao_social, nome_fantasia, cnpj_cpf, telefone, logo, endereco, cep, logradouro, bairro, cidade, uf, email, celular, numero, localidade) FROM stdin;
1	Admin	Admin	01514037000109	6134793030	\N	\N	72745-013	Quadra 45 Conjunto K	Vila São José (Brazlândia)	\N	DF	email@empresa.com	61982613265	35	Brasília
\.


--
-- Data for Name: evolucoes; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.evolucoes (id_evolucao, id_paciente, texto, id_profissional, id_empresa, updated_at) FROM stdin;
1	15	Teste 1	2	1	2025-12-28 22:56:04.71977
2	15	Teste 2	2	1	2025-12-28 22:56:16.005705
4	16	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	3	1	2026-01-20 22:17:42.421447
6	16	testsetet estse	3	1	2026-01-20 22:31:29.507037
7	16	asdfg	3	1	2026-01-20 22:33:07.757265
8	15	Manutenção realizada com o protudo tal	3	1	2026-01-24 13:39:53.191607
9	15	Limpeza de pele com o produto tal	3	1	2026-01-25 00:57:43.515986
10	15	Utilizei o protudo tal	3	1	2026-01-28 12:49:22.958043
\.


--
-- Data for Name: faces_dente; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.faces_dente (dente, face) FROM stdin;
\.


--
-- Data for Name: form_dynamic_data; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.form_dynamic_data (id_form_dynamic_data, form_id, data, created_at, id_empresa, id_paciente) FROM stdin;
4	1	{"Bebe?": false, "Fuma?": true, "Faz uso de algum medicamento?": true}	2026-02-06 00:42:34.045027	1	15
5	3	{"teste": "teste"}	2026-02-06 00:43:20.135031	1	15
6	5	{"Tem alergia": true, "Qual remédio": "tal remédio", "Rémedio de uso contónuo?": true}	2026-02-06 00:43:31.005097	1	15
10	1	{"Bebe?": true, "Fuma?": true}	2026-02-06 00:49:02.900226	1	16
11	3	{"teste": "teste 2"}	2026-02-06 00:49:09.915201	1	16
12	5	{"Tem alergia": true, "Qual remédio": "depil", "Rémedio de uso contónuo?": true}	2026-02-06 00:49:19.770271	1	16
\.


--
-- Data for Name: forma_pagamento; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.forma_pagamento (id_forma_pagamento, descricao) FROM stdin;
2	PIX
1	Dinheiro
3	Crédito
4	Débito
5	Boleto
\.


--
-- Data for Name: orcamento; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.orcamento (id_orcamento, id_empresa, id_profissional, id_paciente, preco, date, status, id_agenda) FROM stdin;
238	1	3	15	250	2026-02-24	Pendente	198
239	1	3	15	250	2026-02-24	Pendente	199
240	1	2	15	250	2026-02-24	Pendente	200
241	1	3	17	250	2026-02-24	Pendente	201
231	1	3	15	250	2026-02-24	1	191
242	1	3	22	250	2026-02-24	Pendente	202
243	1	3	17	250	2026-02-25	Pendente	203
244	1	3	17	350	2026-02-25	Pendente	204
245	1	2	17	250	2026-02-25	Pendente	205
246	1	3	15	600	2026-02-25	Pendente	206
186	1	3	16	550	2026-02-06	2	154
118	1	2	0	239.9	2026-01-27	1	\N
119	1	3	0	600	2026-01-27	1	\N
120	1	3	0	600	2026-01-27	1	\N
121	1	3	0	600	2026-01-27	3	\N
190	1	3	15	250	2026-02-06	1	\N
123	\N	2	\N	600	2026-01-27	\N	\N
124	\N	3	\N	600	2026-01-27	3	\N
126	\N	3	\N	600	2026-01-27	3	\N
191	1	6	17	250	2026-02-07	Pendente	156
192	1	6	1	250	2026-02-07	Pendente	157
193	1	6	1	250	2026-02-07	1	158
197	1	6	17	250	2026-02-07	Pendente	162
198	1	6	17	250	2026-02-07	Pendente	163
199	1	3	15	450	2026-02-07	1	164
200	1	6	17	250	2026-02-07	Pendente	165
125	1	3	15	250	2026-01-28	1	\N
128	1	3	15	600	2026-01-28	1	\N
201	1	3	15	450	2026-02-10	1	166
202	1	6	1	200	2026-02-10	Pendente	167
203	1	\N	15	600	2026-02-19	Pendente	168
209	1	6	0	250	2026-02-19	Pendente	174
210	1	6	0	250	2026-02-19	Pendente	175
216	1	6	17	250	2026-02-19	Pendente	181
217	1	6	17	250	2026-02-19	Pendente	182
218	1	6	21	250	2026-02-19	Pendente	183
219	1	6	22	250	2026-02-19	Pendente	184
220	1	6	17	250	2026-02-20	1	185
221	1	3	15	250	2026-02-20	1	\N
222	1	3	15	350	2026-02-20	1	\N
223	1	3	15	250	2026-02-20	1	\N
224	1	3	15	800	2026-02-21	1	\N
225	1	6	17	250	2026-02-21	Pendente	186
226	1	2	15	250	2026-02-21	1	\N
227	1	2	15	250	2026-02-21	Pendente	187
228	1	2	15	250	2026-02-21	Pendente	188
229	1	6	17	250	2026-02-21	Pendente	189
230	1	2	15	250	2026-02-21	Pendente	190
232	\N	3	15	250	2026-02-24	Pendente	192
234	1	3	15	250	2026-02-24	Pendente	194
235	1	3	16	450	2026-02-24	Pendente	195
236	1	3	15	200	2026-02-24	Pendente	196
237	1	2	15	250	2026-02-24	Pendente	197
\.


--
-- Data for Name: paciente; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.paciente (id_paciente, nome, cpf, telefone_fixo, telefone_movel, dt_nascimento, rg, sexo, estado_civil, email, plano_saude, numero_carteirinha, nome_responsavel, telefone_responsavel, email_responsavel, id_empresa, inserted_at, cpf_responsavel, paciente_endereco) FROM stdin;
17	Luke Skywalker	43062101032	6134793089	61982603961	1991-06-04	12345	m	s	luke@gmail.com	Plano CBMDF	54321	Pai do Luke	6198888888	responsavel.luke@gmail.com	1	2026-01-07	16335186047	\N
16	Darth Vader	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2026-01-07	\N	\N
1	Não Informado	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	Maximilian	\N	\N	61999999999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2026-02-19	\N	\N
22	Diego Carrara	\N	\N	61982603962	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2026-02-19	\N	\N
15	Aline Patrícia	\N	\N	61998551125	1991-06-04	\N	f	\N	\N	\N	\N	\N	\N	\N	1	2025-12-28	\N	\N
\.


--
-- Data for Name: paciente_endereco; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.paciente_endereco (id_paciente_endereco, id_paciente, cep, uf, localidade, logradouro, numero, bairro, municipio, complemento, id_empresa) FROM stdin;
\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	17	72745013	DF	Brasília	Quadra 45 Conjunto K	35	Vila São José (Brazlândia)	Brazândia	Complemendo do endereço	1
\N	18	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	16	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	19	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	20	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	21	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	22	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	15	\N	\N	\N	\N	\N	\N	\N	\N	1
\.


--
-- Data for Name: pagamento; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.pagamento (id_pagamento, id_orcamento, tipo_desconto, valor_desconto, quantidade_parcelas, data_primeiro_vencimento, entrada, data_pagamento, id_empresa, valor_total, status, id_paciente, id_forma_pagamento) FROM stdin;
16	85	real	0	2	2026-01-24	\N	\N	1	589.9	Aberto	16	1
17	79	real	0	1	2026-01-24	\N	\N	1	489.9	Aberto	15	1
18	125	porcentagem	0.1	2	2026-01-28	0.5	\N	1	250	Aberto	15	1
19	128	real	0	1	2026-01-28	\N	\N	1	600	Aberto	15	3
20	130	real	0	1	2026-01-28	\N	\N	1	600	Aberto	15	1
21	160	real	0	1	2026-02-06	\N	\N	1	250	Aberto	15	1
22	173	real	0	1	2026-02-06	\N	\N	1	350	Aberto	17	2
23	186	real	0	1	2026-02-06	\N	\N	1	550	Aberto	16	2
27	190	real	0	1	2026-02-06	\N	\N	1	250	Aberto	15	2
28	199	real	0	1	2026-02-07	\N	\N	1	450	Aberto	15	1
29	221	real	0	1	2026-02-20	\N	\N	1	250	Aberto	15	1
30	222	real	0	1	2026-02-20	\N	\N	1	350	Aberto	15	1
31	223	real	0	1	2026-02-20	\N	\N	1	250	Aberto	15	1
32	224	real	0	3	2026-02-21	\N	\N	1	800	Aberto	15	1
33	226	real	0	2	2026-02-21	\N	\N	1	250	Aberto	15	1
\.


--
-- Data for Name: procedimento; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.procedimento (id_procedimento, dente, estado, observacao, id_profissional, face_dente, adicionado, preco, id_procedimento_list, id_paciente, orcado, id_empresa) FROM stdin;
\.


--
-- Data for Name: procedimento_list; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.procedimento_list (id_procedimento, descricao, categoria, preco, ativo, id_empresa, tempo_duracao) FROM stdin;
6	Limpeza de Pele	Estética	250	t	1	30
7	Micropigmentação	Estética	350	t	1	120
8	Depilação Laser	Estética	200	t	1	60
\.


--
-- Data for Name: procedimento_orcamento; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.procedimento_orcamento (id_orcamento, id_procedimento, preco, id_empresa) FROM stdin;
128	1	250	1
128	3	350	1
125	1	250	1
186	7	350	1
186	8	200	1
190	6	250	1
191	6	250	1
192	6	250	1
193	6	250	1
197	6	250	1
198	6	250	1
199	6	250	1
199	8	200	1
200	6	250	1
201	6	250	1
201	8	200	1
202	8	200	1
203	6	250	1
203	7	350	1
118	2	239.9	1
119	1	250	1
119	3	350	1
120	1	250	1
120	3	350	1
121	1	250	1
121	3	350	1
123	1	250	\N
123	3	350	\N
124	1	250	\N
124	3	350	\N
126	1	250	\N
126	3	350	\N
209	6	250	1
210	6	250	1
216	6	250	1
217	6	250	1
218	6	250	1
219	6	250	1
220	6	250	1
221	6	250	1
222	7	350	1
223	6	250	1
224	6	250	1
224	7	350	1
224	8	200	1
225	6	250	1
226	6	250	1
227	6	250	1
228	6	250	1
229	6	250	1
230	6	250	1
232	6	250	\N
234	6	250	1
235	6	250	1
235	8	200	1
236	8	200	1
237	6	250	1
238	6	250	1
239	6	250	1
240	6	250	1
241	6	250	1
231	6	250	1
242	6	250	1
243	6	250	1
244	7	350	1
245	6	250	1
246	6	250	1
246	7	350	1
\.


--
-- Data for Name: procedimento_pre; Type: TABLE DATA; Schema: odonto; Owner: postgres
--

COPY odonto.procedimento_pre (id_procedimento, descricao, preco, ativo, categoria) FROM stdin;
\.


--
-- Data for Name: screen; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.screen (id_screen, path, id_empresa) FROM stdin;
1	/agenda	1
2	/paciente	1
3	/financeiro	1
4	/opcoes	1
5	/fichaClinica	1
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto."user" (email, nome, id_empresa, senha, id_user, access_levels, token_to_reset_password, schedule_color, status) FROM stdin;
ielseu@hotmail.com	Ueslei	1	$2a$08$JfUG1nHTAkKj7hmVB9ovceO35iFvURrPXELMRsYS3wlel4cXfFvy6	3	2	\N	\N	t
admin	Admin	1	$2a$08$8.XJ8N2zp/s1jYPl/qspxe6PgXry7VZLhSZOuJQAx/.S03HjGioSS	2	1	\N	\N	t
\.


--
-- Data for Name: wpp_sessions; Type: TABLE DATA; Schema: odonto; Owner: admin
--

COPY odonto.wpp_sessions (id_session, id_empresa, id_user, session_name, session_data) FROM stdin;
\.


--
-- Name: access_levels_access_level_id_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.access_levels_access_level_id_seq', 4, true);


--
-- Name: access_levels_screen_id_access_levels_screen_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.access_levels_screen_id_access_levels_screen_seq', 23, true);


--
-- Name: agenda_id_agenda_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.agenda_id_agenda_seq', 206, true);


--
-- Name: agendaconfig_id_agenda_config_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.agendaconfig_id_agenda_config_seq', 1, true);


--
-- Name: anamnese_id_anamnese_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.anamnese_id_anamnese_seq', 1, false);


--
-- Name: categoria_despesa_id_categoria_despesa_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.categoria_despesa_id_categoria_despesa_seq', 23, true);


--
-- Name: contas_pagar_id_contas_pagar_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.contas_pagar_id_contas_pagar_seq', 9, true);


--
-- Name: contas_receber_id_contas_receber_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.contas_receber_id_contas_receber_seq', 41, true);


--
-- Name: dynamic_field_id_dynamic_field_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.dynamic_field_id_dynamic_field_seq', 27, true);


--
-- Name: dynamic_form_id_form_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.dynamic_form_id_form_seq', 5, true);


--
-- Name: efi_credential_id_credential_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.efi_credential_id_credential_seq', 1, true);


--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.empresa_id_empresa_seq', 1, true);


--
-- Name: evolucoes_id_evolucao_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.evolucoes_id_evolucao_seq', 10, true);


--
-- Name: form_dynamic_data_id_form_dynamic_data_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.form_dynamic_data_id_form_dynamic_data_seq', 12, true);


--
-- Name: forma_pagamento_id_forma_pagamento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.forma_pagamento_id_forma_pagamento_seq', 5, true);


--
-- Name: orcamento_id_orcamento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.orcamento_id_orcamento_seq', 246, true);


--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.paciente_id_paciente_seq', 22, true);


--
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.pagamento_id_pagamento_seq', 33, true);


--
-- Name: procedimento_id_procedimento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.procedimento_id_procedimento_seq', 1, true);


--
-- Name: procedimento_list_id_procedimento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.procedimento_list_id_procedimento_seq', 8, true);


--
-- Name: procedimento_pre_id_procedimento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: postgres
--

SELECT pg_catalog.setval('odonto.procedimento_pre_id_procedimento_seq', 1, false);


--
-- Name: screen_id_screen_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.screen_id_screen_seq', 5, true);


--
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.user_id_user_seq', 7, true);


--
-- Name: wpp_sessions_id_session_seq; Type: SEQUENCE SET; Schema: odonto; Owner: admin
--

SELECT pg_catalog.setval('odonto.wpp_sessions_id_session_seq', 1, false);


--
-- Name: access_levels access_levels_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.access_levels
    ADD CONSTRAINT access_levels_pkey PRIMARY KEY (access_level_id);


--
-- Name: access_levels_screen access_levels_screen_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.access_levels_screen
    ADD CONSTRAINT access_levels_screen_pkey PRIMARY KEY (id_access_levels_screen);


--
-- Name: agenda_config agendaconfig_pk; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.agenda_config
    ADD CONSTRAINT agendaconfig_pk PRIMARY KEY (id_agenda_config);


--
-- Name: categoria_financeira categoria_financeira_pk; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.categoria_financeira
    ADD CONSTRAINT categoria_financeira_pk PRIMARY KEY (id_categoria_financeira);


--
-- Name: empresa constraint_name; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.empresa
    ADD CONSTRAINT constraint_name UNIQUE (cnpj_cpf);


--
-- Name: dentes dentes_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dentes
    ADD CONSTRAINT dentes_pkey PRIMARY KEY (numero_dente);


--
-- Name: dynamic_field dynamic_field_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dynamic_field
    ADD CONSTRAINT dynamic_field_pkey PRIMARY KEY (id_dynamic_field);


--
-- Name: dynamic_form dynamic_form_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dynamic_form
    ADD CONSTRAINT dynamic_form_pkey PRIMARY KEY (id_form);


--
-- Name: efi_credential efi_credential_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.efi_credential
    ADD CONSTRAINT efi_credential_pkey PRIMARY KEY (id_credential);


--
-- Name: evolucoes evolucoes_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.evolucoes
    ADD CONSTRAINT evolucoes_pkey PRIMARY KEY (id_evolucao);


--
-- Name: form_dynamic_data form_dynamic_data_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.form_dynamic_data
    ADD CONSTRAINT form_dynamic_data_pkey PRIMARY KEY (id_form_dynamic_data);


--
-- Name: forma_pagamento forma_pagamento_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.forma_pagamento
    ADD CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id_forma_pagamento);


--
-- Name: agenda id_agenda; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.agenda
    ADD CONSTRAINT id_agenda PRIMARY KEY (id_agenda);


--
-- Name: orcamento orcamento_pk; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.orcamento
    ADD CONSTRAINT orcamento_pk PRIMARY KEY (id_orcamento);


--
-- Name: paciente paciente_pk; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.paciente
    ADD CONSTRAINT paciente_pk PRIMARY KEY (id_paciente);


--
-- Name: user pk_email; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto."user"
    ADD CONSTRAINT pk_email PRIMARY KEY (email);


--
-- Name: empresa pk_id_empresa; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.empresa
    ADD CONSTRAINT pk_id_empresa PRIMARY KEY (id_empresa);


--
-- Name: procedimento_orcamento procedimento_orcamento_pk; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.procedimento_orcamento
    ADD CONSTRAINT procedimento_orcamento_pk PRIMARY KEY (id_orcamento, id_procedimento);


--
-- Name: screen screen_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.screen
    ADD CONSTRAINT screen_pkey PRIMARY KEY (id_screen);


--
-- Name: user user_id_user_key; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto."user"
    ADD CONSTRAINT user_id_user_key UNIQUE (id_user);


--
-- Name: wpp_sessions wpp_sessions_pkey; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT wpp_sessions_pkey PRIMARY KEY (id_session);


--
-- Name: wpp_sessions wpp_sessions_session_name_key; Type: CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT wpp_sessions_session_name_key UNIQUE (session_name);


--
-- Name: dynamic_form dynamic_form_paciente_fk; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dynamic_form
    ADD CONSTRAINT dynamic_form_paciente_fk FOREIGN KEY (id_paciente) REFERENCES odonto.paciente(id_paciente);


--
-- Name: user fk_access_level_id; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto."user"
    ADD CONSTRAINT fk_access_level_id FOREIGN KEY (access_levels) REFERENCES odonto.access_levels(access_level_id);


--
-- Name: contas_receber fk_forma_pagamento; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.contas_receber
    ADD CONSTRAINT fk_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES odonto.forma_pagamento(id_forma_pagamento);


--
-- Name: pagamento fk_forma_pagamento; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.pagamento
    ADD CONSTRAINT fk_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES odonto.forma_pagamento(id_forma_pagamento);


--
-- Name: dynamic_field fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dynamic_field
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- Name: dynamic_form fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.dynamic_form
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- Name: efi_credential fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.efi_credential
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- Name: evolucoes fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.evolucoes
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- Name: wpp_sessions fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- Name: evolucoes fk_id_profissional; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.evolucoes
    ADD CONSTRAINT fk_id_profissional FOREIGN KEY (id_profissional) REFERENCES odonto."user"(id_user);


--
-- Name: wpp_sessions fk_id_user; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES odonto."user"(id_user);


--
-- Name: orcamento fk_orcamento_agenda ; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.orcamento
    ADD CONSTRAINT "fk_orcamento_agenda " FOREIGN KEY (id_agenda) REFERENCES odonto.agenda(id_agenda) ON DELETE CASCADE;


--
-- Name: form_dynamic_data form_dynamic_data_form_id_fkey; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.form_dynamic_data
    ADD CONSTRAINT form_dynamic_data_form_id_fkey FOREIGN KEY (form_id) REFERENCES odonto.dynamic_form(id_form) ON DELETE CASCADE;


--
-- Name: form_dynamic_data id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.form_dynamic_data
    ADD CONSTRAINT id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- Name: procedimento_orcamento procedimento_orcamento_orcamento_fk; Type: FK CONSTRAINT; Schema: odonto; Owner: admin
--

ALTER TABLE ONLY odonto.procedimento_orcamento
    ADD CONSTRAINT procedimento_orcamento_orcamento_fk FOREIGN KEY (id_orcamento) REFERENCES odonto.orcamento(id_orcamento) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

