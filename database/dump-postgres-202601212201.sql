--
-- PostgreSQL database dump
--

\restrict iItPRkQ277Cd1e4E2umgpTajKsWQCjLkCFBM98DBb41jTHVcTgRZgaYEUjOkEEs

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-21 22:01:15 -03

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
-- TOC entry 7 (class 2615 OID 19276)
-- Name: odonto; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA odonto;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 19278)
-- Name: access_levels; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.access_levels (
    access_level_id integer NOT NULL,
    level_name character varying(50) NOT NULL,
    description text,
    id_empresa integer,
    acessa_todas_agendas boolean,
    acessa_financeiro_paciente boolean
);


--
-- TOC entry 219 (class 1259 OID 19277)
-- Name: access_levels_access_level_id_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.access_levels_access_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 219
-- Name: access_levels_access_level_id_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.access_levels_access_level_id_seq OWNED BY odonto.access_levels.access_level_id;


--
-- TOC entry 222 (class 1259 OID 19287)
-- Name: access_levels_screen; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.access_levels_screen (
    id_access_levels_screen integer NOT NULL,
    id_access_levels integer NOT NULL,
    id_screen integer NOT NULL,
    id_empresa integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 19286)
-- Name: access_levels_screen_id_access_levels_screen_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.access_levels_screen_id_access_levels_screen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 221
-- Name: access_levels_screen_id_access_levels_screen_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.access_levels_screen_id_access_levels_screen_seq OWNED BY odonto.access_levels_screen.id_access_levels_screen;


--
-- TOC entry 224 (class 1259 OID 19294)
-- Name: agenda; Type: TABLE; Schema: odonto; Owner: -
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
    id_orcamento integer
);


--
-- TOC entry 223 (class 1259 OID 19293)
-- Name: agenda_id_agenda_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.agenda_id_agenda_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 223
-- Name: agenda_id_agenda_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.agenda_id_agenda_seq OWNED BY odonto.agenda.id_agenda;


--
-- TOC entry 226 (class 1259 OID 19303)
-- Name: anamnese; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 225 (class 1259 OID 19302)
-- Name: anamnese_id_anamnese_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.anamnese_id_anamnese_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 225
-- Name: anamnese_id_anamnese_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.anamnese_id_anamnese_seq OWNED BY odonto.anamnese.id_anamnese;


--
-- TOC entry 265 (class 1259 OID 19573)
-- Name: contas_pagar; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.contas_pagar (
    id_contas_pagar integer NOT NULL,
    descricao character varying,
    fornecedor character varying,
    dt_emissao date,
    dt_vencimento date,
    valor_total double precision,
    status character varying,
    id_forma_pagamento integer,
    nr_documento character varying,
    obs text,
    dt_pagamento date,
    id_categoria integer,
    id_centro_custo integer,
    id_user integer,
    id_empresa integer
);


--
-- TOC entry 264 (class 1259 OID 19572)
-- Name: contas_pagar_id_contas_pagar_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.contas_pagar_id_contas_pagar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 264
-- Name: contas_pagar_id_contas_pagar_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.contas_pagar_id_contas_pagar_seq OWNED BY odonto.contas_pagar.id_contas_pagar;


--
-- TOC entry 229 (class 1259 OID 19318)
-- Name: contas_receber; Type: TABLE; Schema: odonto; Owner: -
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
    forma_pagamento integer,
    qtd_parcelas integer,
    link_carnet character varying,
    carnet_id integer,
    descricao character varying,
    categoria_despesa integer,
    obs text,
    id_contas_receber integer NOT NULL,
    created_at timestamp without time zone
);


--
-- TOC entry 266 (class 1259 OID 19579)
-- Name: contas_receber_id_contas_receber_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.contas_receber_id_contas_receber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 266
-- Name: contas_receber_id_contas_receber_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.contas_receber_id_contas_receber_seq OWNED BY odonto.contas_receber.id_contas_receber;


--
-- TOC entry 230 (class 1259 OID 19328)
-- Name: dentes; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.dentes (
    numero_dente character varying NOT NULL,
    descricao character varying(50)
);


--
-- TOC entry 234 (class 1259 OID 19347)
-- Name: dynamic_field; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.dynamic_field (
    id_dynamic_field integer NOT NULL,
    form_id integer NOT NULL,
    field_name character varying NOT NULL,
    type character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer
);


--
-- TOC entry 233 (class 1259 OID 19346)
-- Name: dynamic_field_id_dynamic_field_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.dynamic_field_id_dynamic_field_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 233
-- Name: dynamic_field_id_dynamic_field_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.dynamic_field_id_dynamic_field_seq OWNED BY odonto.dynamic_field.id_dynamic_field;


--
-- TOC entry 236 (class 1259 OID 19362)
-- Name: dynamic_form; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.dynamic_form (
    id_form integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    id_paciente integer
);


--
-- TOC entry 235 (class 1259 OID 19361)
-- Name: dynamic_form_id_form_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.dynamic_form_id_form_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 235
-- Name: dynamic_form_id_form_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.dynamic_form_id_form_seq OWNED BY odonto.dynamic_form.id_form;


--
-- TOC entry 238 (class 1259 OID 19377)
-- Name: efi_credential; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 237 (class 1259 OID 19376)
-- Name: efi_credential_id_credential_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.efi_credential_id_credential_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 237
-- Name: efi_credential_id_credential_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.efi_credential_id_credential_seq OWNED BY odonto.efi_credential.id_credential;


--
-- TOC entry 232 (class 1259 OID 19336)
-- Name: empresa; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 231 (class 1259 OID 19335)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 231
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.empresa_id_empresa_seq OWNED BY odonto.empresa.id_empresa;


--
-- TOC entry 242 (class 1259 OID 19407)
-- Name: evolucoes; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.evolucoes (
    id_evolucao integer NOT NULL,
    id_paciente integer NOT NULL,
    texto text NOT NULL,
    id_profissional integer NOT NULL,
    id_empresa integer NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 19406)
-- Name: evolucoes_id_evolucao_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.evolucoes_id_evolucao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 241
-- Name: evolucoes_id_evolucao_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.evolucoes_id_evolucao_seq OWNED BY odonto.evolucoes.id_evolucao;


--
-- TOC entry 243 (class 1259 OID 19425)
-- Name: faces_dente; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.faces_dente (
    dente character varying NOT NULL,
    face character(1)
);


--
-- TOC entry 245 (class 1259 OID 19431)
-- Name: form_dynamic_data; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.form_dynamic_data (
    id_form_dynamic_data integer NOT NULL,
    form_id integer,
    data jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer
);


--
-- TOC entry 244 (class 1259 OID 19430)
-- Name: form_dynamic_data_id_form_dynamic_data_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.form_dynamic_data_id_form_dynamic_data_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 244
-- Name: form_dynamic_data_id_form_dynamic_data_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.form_dynamic_data_id_form_dynamic_data_seq OWNED BY odonto.form_dynamic_data.id_form_dynamic_data;


--
-- TOC entry 228 (class 1259 OID 19310)
-- Name: forma_pagamento; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.forma_pagamento (
    id_forma_pagamento integer NOT NULL,
    descricao character varying
);


--
-- TOC entry 227 (class 1259 OID 19309)
-- Name: forma_pagamento_id_forma_pagamento_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.forma_pagamento_id_forma_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 227
-- Name: forma_pagamento_id_forma_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.forma_pagamento_id_forma_pagamento_seq OWNED BY odonto.forma_pagamento.id_forma_pagamento;


--
-- TOC entry 247 (class 1259 OID 19453)
-- Name: orcamento; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 246 (class 1259 OID 19452)
-- Name: orcamento_id_orcamento_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.orcamento_id_orcamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 246
-- Name: orcamento_id_orcamento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.orcamento_id_orcamento_seq OWNED BY odonto.orcamento.id_orcamento;


--
-- TOC entry 249 (class 1259 OID 19460)
-- Name: paciente; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 263 (class 1259 OID 19531)
-- Name: paciente_endereco; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 248 (class 1259 OID 19459)
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 248
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.paciente_id_paciente_seq OWNED BY odonto.paciente.id_paciente;


--
-- TOC entry 251 (class 1259 OID 19467)
-- Name: pagamento; Type: TABLE; Schema: odonto; Owner: -
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
    forma_pagamento integer
);


--
-- TOC entry 250 (class 1259 OID 19466)
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.pagamento_id_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 250
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.pagamento_id_pagamento_seq OWNED BY odonto.pagamento.id_pagamento;


--
-- TOC entry 253 (class 1259 OID 19479)
-- Name: procedimento; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 252 (class 1259 OID 19478)
-- Name: procedimento_id_procedimento_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.procedimento_id_procedimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 252
-- Name: procedimento_id_procedimento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.procedimento_id_procedimento_seq OWNED BY odonto.procedimento.id_procedimento;


--
-- TOC entry 255 (class 1259 OID 19486)
-- Name: procedimento_list; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.procedimento_list (
    id_procedimento integer NOT NULL,
    descricao character varying,
    categoria character varying,
    preco double precision,
    ativo boolean,
    id_empresa integer
);


--
-- TOC entry 254 (class 1259 OID 19485)
-- Name: procedimento_list_id_procedimento_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.procedimento_list_id_procedimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 254
-- Name: procedimento_list_id_procedimento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.procedimento_list_id_procedimento_seq OWNED BY odonto.procedimento_list.id_procedimento;


--
-- TOC entry 256 (class 1259 OID 19492)
-- Name: procedimento_orcamento; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.procedimento_orcamento (
    id_orcamento integer NOT NULL,
    id_procedimento integer NOT NULL,
    preco double precision,
    id_empresa integer
);


--
-- TOC entry 258 (class 1259 OID 19496)
-- Name: procedimento_pre; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.procedimento_pre (
    id_procedimento integer NOT NULL,
    descricao character varying,
    preco real,
    ativo boolean,
    categoria character varying
);


--
-- TOC entry 257 (class 1259 OID 19495)
-- Name: procedimento_pre_id_procedimento_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.procedimento_pre_id_procedimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 257
-- Name: procedimento_pre_id_procedimento_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.procedimento_pre_id_procedimento_seq OWNED BY odonto.procedimento_pre.id_procedimento;


--
-- TOC entry 260 (class 1259 OID 19503)
-- Name: screen; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.screen (
    id_screen integer NOT NULL,
    path character varying(100) NOT NULL,
    id_empresa integer NOT NULL
);


--
-- TOC entry 259 (class 1259 OID 19502)
-- Name: screen_id_screen_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.screen_id_screen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 259
-- Name: screen_id_screen_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.screen_id_screen_seq OWNED BY odonto.screen.id_screen;


--
-- TOC entry 240 (class 1259 OID 19391)
-- Name: user; Type: TABLE; Schema: odonto; Owner: -
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


--
-- TOC entry 239 (class 1259 OID 19390)
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 239
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.user_id_user_seq OWNED BY odonto."user".id_user;


--
-- TOC entry 262 (class 1259 OID 19510)
-- Name: wpp_sessions; Type: TABLE; Schema: odonto; Owner: -
--

CREATE TABLE odonto.wpp_sessions (
    id_session integer NOT NULL,
    id_empresa integer,
    id_user integer,
    session_name character varying(255) NOT NULL,
    session_data text NOT NULL
);


--
-- TOC entry 261 (class 1259 OID 19509)
-- Name: wpp_sessions_id_session_seq; Type: SEQUENCE; Schema: odonto; Owner: -
--

CREATE SEQUENCE odonto.wpp_sessions_id_session_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 261
-- Name: wpp_sessions_id_session_seq; Type: SEQUENCE OWNED BY; Schema: odonto; Owner: -
--

ALTER SEQUENCE odonto.wpp_sessions_id_session_seq OWNED BY odonto.wpp_sessions.id_session;


--
-- TOC entry 3333 (class 2604 OID 19281)
-- Name: access_levels access_level_id; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.access_levels ALTER COLUMN access_level_id SET DEFAULT nextval('odonto.access_levels_access_level_id_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 19290)
-- Name: access_levels_screen id_access_levels_screen; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.access_levels_screen ALTER COLUMN id_access_levels_screen SET DEFAULT nextval('odonto.access_levels_screen_id_access_levels_screen_seq'::regclass);


--
-- TOC entry 3335 (class 2604 OID 19297)
-- Name: agenda id_agenda; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.agenda ALTER COLUMN id_agenda SET DEFAULT nextval('odonto.agenda_id_agenda_seq'::regclass);


--
-- TOC entry 3336 (class 2604 OID 19306)
-- Name: anamnese id_anamnese; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.anamnese ALTER COLUMN id_anamnese SET DEFAULT nextval('odonto.anamnese_id_anamnese_seq'::regclass);


--
-- TOC entry 3357 (class 2604 OID 19576)
-- Name: contas_pagar id_contas_pagar; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.contas_pagar ALTER COLUMN id_contas_pagar SET DEFAULT nextval('odonto.contas_pagar_id_contas_pagar_seq'::regclass);


--
-- TOC entry 3338 (class 2604 OID 19580)
-- Name: contas_receber id_contas_receber; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.contas_receber ALTER COLUMN id_contas_receber SET DEFAULT nextval('odonto.contas_receber_id_contas_receber_seq'::regclass);


--
-- TOC entry 3340 (class 2604 OID 19350)
-- Name: dynamic_field id_dynamic_field; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dynamic_field ALTER COLUMN id_dynamic_field SET DEFAULT nextval('odonto.dynamic_field_id_dynamic_field_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 19365)
-- Name: dynamic_form id_form; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dynamic_form ALTER COLUMN id_form SET DEFAULT nextval('odonto.dynamic_form_id_form_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 19380)
-- Name: efi_credential id_credential; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.efi_credential ALTER COLUMN id_credential SET DEFAULT nextval('odonto.efi_credential_id_credential_seq'::regclass);


--
-- TOC entry 3339 (class 2604 OID 19339)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('odonto.empresa_id_empresa_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 19410)
-- Name: evolucoes id_evolucao; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.evolucoes ALTER COLUMN id_evolucao SET DEFAULT nextval('odonto.evolucoes_id_evolucao_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 19434)
-- Name: form_dynamic_data id_form_dynamic_data; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.form_dynamic_data ALTER COLUMN id_form_dynamic_data SET DEFAULT nextval('odonto.form_dynamic_data_id_form_dynamic_data_seq'::regclass);


--
-- TOC entry 3337 (class 2604 OID 19313)
-- Name: forma_pagamento id_forma_pagamento; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.forma_pagamento ALTER COLUMN id_forma_pagamento SET DEFAULT nextval('odonto.forma_pagamento_id_forma_pagamento_seq'::regclass);


--
-- TOC entry 3349 (class 2604 OID 19456)
-- Name: orcamento id_orcamento; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.orcamento ALTER COLUMN id_orcamento SET DEFAULT nextval('odonto.orcamento_id_orcamento_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 19463)
-- Name: paciente id_paciente; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('odonto.paciente_id_paciente_seq'::regclass);


--
-- TOC entry 3351 (class 2604 OID 19470)
-- Name: pagamento id_pagamento; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.pagamento ALTER COLUMN id_pagamento SET DEFAULT nextval('odonto.pagamento_id_pagamento_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 19482)
-- Name: procedimento id_procedimento; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.procedimento ALTER COLUMN id_procedimento SET DEFAULT nextval('odonto.procedimento_id_procedimento_seq'::regclass);


--
-- TOC entry 3353 (class 2604 OID 19489)
-- Name: procedimento_list id_procedimento; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.procedimento_list ALTER COLUMN id_procedimento SET DEFAULT nextval('odonto.procedimento_list_id_procedimento_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 19499)
-- Name: procedimento_pre id_procedimento; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.procedimento_pre ALTER COLUMN id_procedimento SET DEFAULT nextval('odonto.procedimento_pre_id_procedimento_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 19506)
-- Name: screen id_screen; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.screen ALTER COLUMN id_screen SET DEFAULT nextval('odonto.screen_id_screen_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 19394)
-- Name: user id_user; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto."user" ALTER COLUMN id_user SET DEFAULT nextval('odonto.user_id_user_seq'::regclass);


--
-- TOC entry 3356 (class 2604 OID 19513)
-- Name: wpp_sessions id_session; Type: DEFAULT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.wpp_sessions ALTER COLUMN id_session SET DEFAULT nextval('odonto.wpp_sessions_id_session_seq'::regclass);


--
-- TOC entry 3562 (class 0 OID 19278)
-- Dependencies: 220
-- Data for Name: access_levels; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.access_levels (access_level_id, level_name, description, id_empresa, acessa_todas_agendas, acessa_financeiro_paciente) FROM stdin;
2	Atendente	Atendente da clinica	1	t	f
3	Teste	Teste	1	t	t
1	Admin	Admin	1	t	t
\.


--
-- TOC entry 3564 (class 0 OID 19287)
-- Dependencies: 222
-- Data for Name: access_levels_screen; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.access_levels_screen (id_access_levels_screen, id_access_levels, id_screen, id_empresa) FROM stdin;
1	2	1	1
8	3	1	1
9	3	3	1
10	3	2	1
15	1	4	1
16	1	1	1
17	1	3	1
18	1	2	1
19	1	5	1
\.


--
-- TOC entry 3566 (class 0 OID 19294)
-- Dependencies: 224
-- Data for Name: agenda; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.agenda (id_agenda, id_empresa, id_paciente, id_profissional, start, "end", obs, id_metodo_pagamento, total_pagamento_servico, desconto, status, descricao, dia_inteiro, id_orcamento) FROM stdin;
\.


--
-- TOC entry 3568 (class 0 OID 19303)
-- Dependencies: 226
-- Data for Name: anamnese; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.anamnese (id_anamnese, id_paciente, doenca, descricao_doenca, gravidez, mes_gravidez, uso_medicacao, descricao_medicacoes, nome_medico_assistente, telefone_medico_assistente, alergia, descricao_alergia, fuma, bebe, pratica_exercicio, ja_foi_operado, descricao_operacao, problema_anestesia, problema_hemorragia, doenca_reumatica, problema_cardiaco, problema_renal, problema_gastrico, problema_alergico, problemas_articulares_reumatismo, diabetes, hipertensao, outra, descricao_outra, problema_cicatrizacao, tratamento_medico, historico_familiar_doenca, descricao_historico_familiar_doenca) FROM stdin;
\.


--
-- TOC entry 3607 (class 0 OID 19573)
-- Dependencies: 265
-- Data for Name: contas_pagar; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.contas_pagar (id_contas_pagar, descricao, fornecedor, dt_emissao, dt_vencimento, valor_total, status, id_forma_pagamento, nr_documento, obs, dt_pagamento, id_categoria, id_centro_custo, id_user, id_empresa) FROM stdin;
\.


--
-- TOC entry 3571 (class 0 OID 19318)
-- Dependencies: 229
-- Data for Name: contas_receber; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.contas_receber (id_pagamento, nr_parcela, valor, dt_vencimento, status, id_paciente, id_empresa, dt_recebimento, expire_boleto_at, link_boleto, charge_id, forma_pagamento, qtd_parcelas, link_carnet, carnet_id, descricao, categoria_despesa, obs, id_contas_receber, created_at) FROM stdin;
\N	1	250	2026-01-20	Pendente	\N	1	\N	\N	\N	\N	1	1	\N	\N	Impressão panfletos	\N	teste	12	\N
\N	1	250	2026-01-21	Pago	\N	1	\N	\N	\N	\N	2	1	\N	\N	Atendimento Esquecido	\N	Esqueci de lançar	13	\N
13	1	600	2026-01-20	Pago	16	1	2026-01-21	\N	\N	\N	1	1	\N	\N	Pagamento referente ao orçamento #78	\N	\N	11	\N
\.


--
-- TOC entry 3572 (class 0 OID 19328)
-- Dependencies: 230
-- Data for Name: dentes; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.dentes (numero_dente, descricao) FROM stdin;
\.


--
-- TOC entry 3576 (class 0 OID 19347)
-- Dependencies: 234
-- Data for Name: dynamic_field; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.dynamic_field (id_dynamic_field, form_id, field_name, type, created_at, id_empresa) FROM stdin;
15	2	Pergunta descritiva2	text	2026-01-13 13:57:07.458416+00	1
16	2	Pergunta binária2	boolean	2026-01-13 13:57:07.458416+00	1
17	1	Fuma?	boolean	2026-01-22 00:54:51.451674+00	1
18	1	Bebe?	boolean	2026-01-22 00:54:51.451674+00	1
19	1	Faz uso de algum medicamento?	boolean	2026-01-22 00:54:51.451674+00	1
\.


--
-- TOC entry 3578 (class 0 OID 19362)
-- Dependencies: 236
-- Data for Name: dynamic_form; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.dynamic_form (id_form, name, created_at, id_empresa, id_paciente) FROM stdin;
1	Micropigmentação	2025-12-28 22:21:18.753887+00	1	\N
\.


--
-- TOC entry 3580 (class 0 OID 19377)
-- Dependencies: 238
-- Data for Name: efi_credential; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.efi_credential (id_credential, id_empresa, client_id, client_secret, certificate_path, iv_client_id, iv_client_secret, sandbox) FROM stdin;
1	1	kEp9fnt5gLHFoPVCQGqlEQ==	vEAkW7eIDAu4iT7DieGnvA==	C:\\fakepath\\BibliotecaElfica.torrent	PtogPjc23mbwJrWU8M+E0g==	+Z7wUbh6XBx+ojCh7HkLug==	\N
\.


--
-- TOC entry 3574 (class 0 OID 19336)
-- Dependencies: 232
-- Data for Name: empresa; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.empresa (id_empresa, razao_social, nome_fantasia, cnpj_cpf, telefone, logo, endereco, cep, logradouro, bairro, cidade, uf, email, celular, numero, localidade) FROM stdin;
1	Admin	Admin	01514037000109	6134793030	\N	\N	72745-013	Quadra 45 Conjunto K	Vila São José (Brazlândia)	\N	DF	email@empresa.com	61982613265	35	Brasília
\.


--
-- TOC entry 3584 (class 0 OID 19407)
-- Dependencies: 242
-- Data for Name: evolucoes; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.evolucoes (id_evolucao, id_paciente, texto, id_profissional, id_empresa, updated_at) FROM stdin;
1	15	Teste 1	2	1	2025-12-28 22:56:04.71977
2	15	Teste 2	2	1	2025-12-28 22:56:16.005705
4	16	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum	3	1	2026-01-20 22:17:42.421447
6	16	testsetet estse	3	1	2026-01-20 22:31:29.507037
7	16	asdfg	3	1	2026-01-20 22:33:07.757265
\.


--
-- TOC entry 3585 (class 0 OID 19425)
-- Dependencies: 243
-- Data for Name: faces_dente; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.faces_dente (dente, face) FROM stdin;
\.


--
-- TOC entry 3587 (class 0 OID 19431)
-- Dependencies: 245
-- Data for Name: form_dynamic_data; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.form_dynamic_data (id_form_dynamic_data, form_id, data, created_at, id_empresa) FROM stdin;
\.


--
-- TOC entry 3570 (class 0 OID 19310)
-- Dependencies: 228
-- Data for Name: forma_pagamento; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.forma_pagamento (id_forma_pagamento, descricao) FROM stdin;
2	PIX
1	Dinheiro
3	Crédito
4	Débito
5	Boleto
\.


--
-- TOC entry 3589 (class 0 OID 19453)
-- Dependencies: 247
-- Data for Name: orcamento; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.orcamento (id_orcamento, id_empresa, id_profissional, id_paciente, preco, date, status, id_agenda) FROM stdin;
78	1	2	16	600	2026-01-20	finalizado	\N
\.


--
-- TOC entry 3591 (class 0 OID 19460)
-- Dependencies: 249
-- Data for Name: paciente; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.paciente (id_paciente, nome, cpf, telefone_fixo, telefone_movel, dt_nascimento, rg, sexo, estado_civil, email, plano_saude, numero_carteirinha, nome_responsavel, telefone_responsavel, email_responsavel, id_empresa, inserted_at, cpf_responsavel, paciente_endereco) FROM stdin;
15	Aline Patrícia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2025-12-28	\N	\N
16	Darth Vader	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	2026-01-07	\N	\N
17	Luke Skywalker	43062101032	6134793089	61982603961	1991-06-04	12345	m	s	luke@gmail.com	Plano CBMDF	54321	Pai do Luke	6198888888	responsavel.luke@gmail.com	1	2026-01-07	16335186047	\N
\.


--
-- TOC entry 3605 (class 0 OID 19531)
-- Dependencies: 263
-- Data for Name: paciente_endereco; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.paciente_endereco (id_paciente_endereco, id_paciente, cep, uf, localidade, logradouro, numero, bairro, municipio, complemento, id_empresa) FROM stdin;
\N	14	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	15	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	16	\N	\N	\N	\N	\N	\N	\N	\N	1
\N	17	72745013	DF	Brasília	Quadra 45 Conjunto K	35	Vila São José (Brazlândia)	Brazândia	Complemendo do endereço	1
\.


--
-- TOC entry 3593 (class 0 OID 19467)
-- Dependencies: 251
-- Data for Name: pagamento; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.pagamento (id_pagamento, id_orcamento, tipo_desconto, valor_desconto, quantidade_parcelas, data_primeiro_vencimento, entrada, data_pagamento, id_empresa, valor_total, status, id_paciente, forma_pagamento) FROM stdin;
1	52	real	0	3	2026-01-09	1	\N	1	489.9	Aberto	16	4
2	54	real	0	3	2026-01-09	1	\N	1	239.9	Aberto	16	1
3	55	real	0.1	3	2026-01-09	1	\N	1	589.9	Aberto	16	1
4	56	real	0.1	1	2026-01-09	1	\N	1	839.9	Aberto	16	1
5	57	real	0.1	4	2026-01-09	1	\N	1	839.9	Aberto	17	1
6	58	real	0.1	1	2026-01-09	1	\N	1	589.9	Aberto	17	1
7	59	real	0.1	2	2026-01-09	1	\N	1	839.9	Aberto	16	1
8	60	real	0.1	2	2026-01-09	1	\N	1	839.9	Aberto	16	1
9	61	real	0.1	2	2026-01-09	1	\N	1	839.9	Aberto	17	1
10	62	real	0.1	2	2026-01-12	1	\N	1	600	Aberto	16	2
11	66	real	1	1	2026-01-20	1	\N	1	839.9	Aberto	15	1
12	77	porcentagem	0.1	1	2026-01-20	1	\N	1	600	Aberto	16	1
13	78	real	0	1	2026-01-20	\N	\N	1	600	Aberto	16	1
\.


--
-- TOC entry 3595 (class 0 OID 19479)
-- Dependencies: 253
-- Data for Name: procedimento; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.procedimento (id_procedimento, dente, estado, observacao, id_profissional, face_dente, adicionado, preco, id_procedimento_list, id_paciente, orcado, id_empresa) FROM stdin;
\.


--
-- TOC entry 3597 (class 0 OID 19486)
-- Dependencies: 255
-- Data for Name: procedimento_list; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.procedimento_list (id_procedimento, descricao, categoria, preco, ativo, id_empresa) FROM stdin;
1	Limpeza de pele	Estética	250	t	1
2	Micropigmentação	Estética	239.9	t	1
3	Depilação	Estética	350	t	1
\.


--
-- TOC entry 3598 (class 0 OID 19492)
-- Dependencies: 256
-- Data for Name: procedimento_orcamento; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.procedimento_orcamento (id_orcamento, id_procedimento, preco, id_empresa) FROM stdin;
78	1	250	1
78	3	350	1
\.


--
-- TOC entry 3600 (class 0 OID 19496)
-- Dependencies: 258
-- Data for Name: procedimento_pre; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.procedimento_pre (id_procedimento, descricao, preco, ativo, categoria) FROM stdin;
\.


--
-- TOC entry 3602 (class 0 OID 19503)
-- Dependencies: 260
-- Data for Name: screen; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.screen (id_screen, path, id_empresa) FROM stdin;
1	/agenda	1
2	/paciente	1
3	/financeiro	1
4	/opcoes	1
5	/fichaClinica	1
\.


--
-- TOC entry 3582 (class 0 OID 19391)
-- Dependencies: 240
-- Data for Name: user; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto."user" (email, nome, id_empresa, senha, id_user, access_levels, token_to_reset_password, schedule_color, status) FROM stdin;
ielseu@hotmail.com	Ueslei	1	$2a$08$JfUG1nHTAkKj7hmVB9ovceO35iFvURrPXELMRsYS3wlel4cXfFvy6	3	2	\N	\N	t
admin	Admin	1	$2a$08$8.XJ8N2zp/s1jYPl/qspxe6PgXry7VZLhSZOuJQAx/.S03HjGioSS	2	1	\N	\N	t
\.


--
-- TOC entry 3604 (class 0 OID 19510)
-- Dependencies: 262
-- Data for Name: wpp_sessions; Type: TABLE DATA; Schema: odonto; Owner: -
--

COPY odonto.wpp_sessions (id_session, id_empresa, id_user, session_name, session_data) FROM stdin;
\.


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 219
-- Name: access_levels_access_level_id_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.access_levels_access_level_id_seq', 3, true);


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 221
-- Name: access_levels_screen_id_access_levels_screen_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.access_levels_screen_id_access_levels_screen_seq', 19, true);


--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 223
-- Name: agenda_id_agenda_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.agenda_id_agenda_seq', 72, true);


--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 225
-- Name: anamnese_id_anamnese_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.anamnese_id_anamnese_seq', 1, false);


--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 264
-- Name: contas_pagar_id_contas_pagar_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.contas_pagar_id_contas_pagar_seq', 1, true);


--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 266
-- Name: contas_receber_id_contas_receber_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.contas_receber_id_contas_receber_seq', 13, true);


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 233
-- Name: dynamic_field_id_dynamic_field_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.dynamic_field_id_dynamic_field_seq', 19, true);


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 235
-- Name: dynamic_form_id_form_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.dynamic_form_id_form_seq', 2, true);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 237
-- Name: efi_credential_id_credential_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.efi_credential_id_credential_seq', 1, true);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 231
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.empresa_id_empresa_seq', 1, true);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 241
-- Name: evolucoes_id_evolucao_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.evolucoes_id_evolucao_seq', 7, true);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 244
-- Name: form_dynamic_data_id_form_dynamic_data_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.form_dynamic_data_id_form_dynamic_data_seq', 1, false);


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 227
-- Name: forma_pagamento_id_forma_pagamento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.forma_pagamento_id_forma_pagamento_seq', 5, true);


--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 246
-- Name: orcamento_id_orcamento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.orcamento_id_orcamento_seq', 78, true);


--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 248
-- Name: paciente_id_paciente_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.paciente_id_paciente_seq', 17, true);


--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 250
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.pagamento_id_pagamento_seq', 13, true);


--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 252
-- Name: procedimento_id_procedimento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.procedimento_id_procedimento_seq', 1, true);


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 254
-- Name: procedimento_list_id_procedimento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.procedimento_list_id_procedimento_seq', 4, true);


--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 257
-- Name: procedimento_pre_id_procedimento_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.procedimento_pre_id_procedimento_seq', 1, false);


--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 259
-- Name: screen_id_screen_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.screen_id_screen_seq', 5, true);


--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 239
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.user_id_user_seq', 3, true);


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 261
-- Name: wpp_sessions_id_session_seq; Type: SEQUENCE SET; Schema: odonto; Owner: -
--

SELECT pg_catalog.setval('odonto.wpp_sessions_id_session_seq', 1, false);


--
-- TOC entry 3385 (class 2606 OID 19441)
-- Name: form_dynamic_data UNIQUE_ID; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.form_dynamic_data
    ADD CONSTRAINT "UNIQUE_ID" UNIQUE (form_id);


--
-- TOC entry 3359 (class 2606 OID 19285)
-- Name: access_levels access_levels_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.access_levels
    ADD CONSTRAINT access_levels_pkey PRIMARY KEY (access_level_id);


--
-- TOC entry 3361 (class 2606 OID 19292)
-- Name: access_levels_screen access_levels_screen_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.access_levels_screen
    ADD CONSTRAINT access_levels_screen_pkey PRIMARY KEY (id_access_levels_screen);


--
-- TOC entry 3369 (class 2606 OID 19345)
-- Name: empresa constraint_name; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.empresa
    ADD CONSTRAINT constraint_name UNIQUE (cnpj_cpf);


--
-- TOC entry 3367 (class 2606 OID 19334)
-- Name: dentes dentes_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dentes
    ADD CONSTRAINT dentes_pkey PRIMARY KEY (numero_dente);


--
-- TOC entry 3373 (class 2606 OID 19355)
-- Name: dynamic_field dynamic_field_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dynamic_field
    ADD CONSTRAINT dynamic_field_pkey PRIMARY KEY (id_dynamic_field);


--
-- TOC entry 3375 (class 2606 OID 19370)
-- Name: dynamic_form dynamic_form_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dynamic_form
    ADD CONSTRAINT dynamic_form_pkey PRIMARY KEY (id_form);


--
-- TOC entry 3377 (class 2606 OID 19384)
-- Name: efi_credential efi_credential_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.efi_credential
    ADD CONSTRAINT efi_credential_pkey PRIMARY KEY (id_credential);


--
-- TOC entry 3383 (class 2606 OID 19414)
-- Name: evolucoes evolucoes_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.evolucoes
    ADD CONSTRAINT evolucoes_pkey PRIMARY KEY (id_evolucao);


--
-- TOC entry 3387 (class 2606 OID 19439)
-- Name: form_dynamic_data form_dynamic_data_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.form_dynamic_data
    ADD CONSTRAINT form_dynamic_data_pkey PRIMARY KEY (id_form_dynamic_data);


--
-- TOC entry 3365 (class 2606 OID 19317)
-- Name: forma_pagamento forma_pagamento_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.forma_pagamento
    ADD CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id_forma_pagamento);


--
-- TOC entry 3363 (class 2606 OID 19301)
-- Name: agenda id_agenda; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.agenda
    ADD CONSTRAINT id_agenda PRIMARY KEY (id_agenda);


--
-- TOC entry 3389 (class 2606 OID 19539)
-- Name: orcamento orcamento_pk; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.orcamento
    ADD CONSTRAINT orcamento_pk PRIMARY KEY (id_orcamento);


--
-- TOC entry 3391 (class 2606 OID 19587)
-- Name: paciente paciente_pk; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.paciente
    ADD CONSTRAINT paciente_pk PRIMARY KEY (id_paciente);


--
-- TOC entry 3379 (class 2606 OID 19398)
-- Name: user pk_email; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto."user"
    ADD CONSTRAINT pk_email PRIMARY KEY (email);


--
-- TOC entry 3371 (class 2606 OID 19343)
-- Name: empresa pk_id_empresa; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.empresa
    ADD CONSTRAINT pk_id_empresa PRIMARY KEY (id_empresa);


--
-- TOC entry 3393 (class 2606 OID 19551)
-- Name: procedimento_orcamento procedimento_orcamento_pk; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.procedimento_orcamento
    ADD CONSTRAINT procedimento_orcamento_pk PRIMARY KEY (id_orcamento, id_procedimento);


--
-- TOC entry 3395 (class 2606 OID 19508)
-- Name: screen screen_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.screen
    ADD CONSTRAINT screen_pkey PRIMARY KEY (id_screen);


--
-- TOC entry 3381 (class 2606 OID 19400)
-- Name: user user_id_user_key; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto."user"
    ADD CONSTRAINT user_id_user_key UNIQUE (id_user);


--
-- TOC entry 3397 (class 2606 OID 19517)
-- Name: wpp_sessions wpp_sessions_pkey; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT wpp_sessions_pkey PRIMARY KEY (id_session);


--
-- TOC entry 3399 (class 2606 OID 19519)
-- Name: wpp_sessions wpp_sessions_session_name_key; Type: CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT wpp_sessions_session_name_key UNIQUE (session_name);


--
-- TOC entry 3400 (class 2606 OID 19562)
-- Name: agenda agenda_orcamento_fk; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.agenda
    ADD CONSTRAINT agenda_orcamento_fk FOREIGN KEY (id_orcamento) REFERENCES odonto.orcamento(id_orcamento);


--
-- TOC entry 3403 (class 2606 OID 19588)
-- Name: dynamic_form dynamic_form_paciente_fk; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dynamic_form
    ADD CONSTRAINT dynamic_form_paciente_fk FOREIGN KEY (id_paciente) REFERENCES odonto.paciente(id_paciente);


--
-- TOC entry 3406 (class 2606 OID 19401)
-- Name: user fk_access_level_id; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto."user"
    ADD CONSTRAINT fk_access_level_id FOREIGN KEY (access_levels) REFERENCES odonto.access_levels(access_level_id);


--
-- TOC entry 3401 (class 2606 OID 19323)
-- Name: contas_receber fk_forma_pagamento; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.contas_receber
    ADD CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento) REFERENCES odonto.forma_pagamento(id_forma_pagamento);


--
-- TOC entry 3412 (class 2606 OID 19473)
-- Name: pagamento fk_forma_pagamento; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.pagamento
    ADD CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento) REFERENCES odonto.forma_pagamento(id_forma_pagamento);


--
-- TOC entry 3402 (class 2606 OID 19356)
-- Name: dynamic_field fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dynamic_field
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- TOC entry 3404 (class 2606 OID 19371)
-- Name: dynamic_form fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.dynamic_form
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- TOC entry 3405 (class 2606 OID 19385)
-- Name: efi_credential fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.efi_credential
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- TOC entry 3407 (class 2606 OID 19415)
-- Name: evolucoes fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.evolucoes
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- TOC entry 3414 (class 2606 OID 19520)
-- Name: wpp_sessions fk_id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- TOC entry 3408 (class 2606 OID 19420)
-- Name: evolucoes fk_id_profissional; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.evolucoes
    ADD CONSTRAINT fk_id_profissional FOREIGN KEY (id_profissional) REFERENCES odonto."user"(id_user);


--
-- TOC entry 3415 (class 2606 OID 19525)
-- Name: wpp_sessions fk_id_user; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.wpp_sessions
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES odonto."user"(id_user);


--
-- TOC entry 3409 (class 2606 OID 19442)
-- Name: form_dynamic_data form_dynamic_data_form_id_fkey; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.form_dynamic_data
    ADD CONSTRAINT form_dynamic_data_form_id_fkey FOREIGN KEY (form_id) REFERENCES odonto.dynamic_form(id_form) ON DELETE CASCADE;


--
-- TOC entry 3410 (class 2606 OID 19447)
-- Name: form_dynamic_data id_empresa; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.form_dynamic_data
    ADD CONSTRAINT id_empresa FOREIGN KEY (id_empresa) REFERENCES odonto.empresa(id_empresa);


--
-- TOC entry 3411 (class 2606 OID 19567)
-- Name: orcamento orcamento_agenda_fk; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.orcamento
    ADD CONSTRAINT orcamento_agenda_fk FOREIGN KEY (id_agenda) REFERENCES odonto.agenda(id_agenda) ON DELETE CASCADE;


--
-- TOC entry 3413 (class 2606 OID 19552)
-- Name: procedimento_orcamento procedimento_orcamento_orcamento_fk; Type: FK CONSTRAINT; Schema: odonto; Owner: -
--

ALTER TABLE ONLY odonto.procedimento_orcamento
    ADD CONSTRAINT procedimento_orcamento_orcamento_fk FOREIGN KEY (id_orcamento) REFERENCES odonto.orcamento(id_orcamento) ON DELETE CASCADE;


-- Completed on 2026-01-21 22:01:15 -03

--
-- PostgreSQL database dump complete
--

\unrestrict iItPRkQ277Cd1e4E2umgpTajKsWQCjLkCFBM98DBb41jTHVcTgRZgaYEUjOkEEs

