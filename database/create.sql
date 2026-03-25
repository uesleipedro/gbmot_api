-- Database: postgres

-- DROP DATABASE IF EXISTS postgres;

CREATE DATABASE postgres
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE postgres
    IS 'default administrative connection database';
    
-- SCHEMA: odonto

-- DROP SCHEMA IF EXISTS odonto ;

CREATE SCHEMA IF NOT EXISTS odonto
    AUTHORIZATION admin;

GRANT ALL ON SCHEMA odonto TO admin;

-- Table: odonto.access_levels

-- DROP TABLE IF EXISTS odonto.access_levels;

CREATE TABLE IF NOT EXISTS odonto.access_levels
(
    access_level_id integer NOT NULL DEFAULT nextval('odonto.access_levels_access_level_id_seq'::regclass),
    level_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    id_empresa integer,
    acessa_todas_agendas boolean,
    acessa_financeiro_paciente boolean,
    CONSTRAINT access_levels_pkey PRIMARY KEY (access_level_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.access_levels
    OWNER to admin;
    
-- Table: odonto.access_levels_screen

-- DROP TABLE IF EXISTS odonto.access_levels_screen;

CREATE TABLE IF NOT EXISTS odonto.access_levels_screen
(
    id_access_levels_screen integer NOT NULL DEFAULT nextval('odonto.access_levels_screen_id_access_levels_screen_seq'::regclass),
    id_access_levels integer NOT NULL,
    id_screen integer NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT access_levels_screen_pkey PRIMARY KEY (id_access_levels_screen)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.access_levels_screen
    OWNER to admin;
    
-- Table: odonto.agenda

-- DROP TABLE IF EXISTS odonto.agenda;

CREATE TABLE IF NOT EXISTS odonto.agenda
(
    id_agenda integer NOT NULL DEFAULT nextval('odonto.agenda_id_agenda_seq1'::regclass),
    id_empresa integer,
    id_paciente integer,
    id_profissional integer,
    start timestamp without time zone,
    "end" timestamp without time zone,
    obs text COLLATE pg_catalog."default",
    id_metodo_pagamento integer,
    total_pagamento_servico double precision,
    desconto double precision,
    status integer,
    descricao character varying COLLATE pg_catalog."default",
    dia_inteiro boolean,
    CONSTRAINT id_agenda PRIMARY KEY (id_agenda)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.agenda
    OWNER to admin;

GRANT ALL ON TABLE odonto.agenda TO admin;

-- Table: odonto.anamnese
-- Database: postgres


COMMENT ON DATABASE postgres
    IS 'default administrative connection database';
    
-- SCHEMA: odonto

-- DROP SCHEMA IF EXISTS odonto ;

CREATE SCHEMA IF NOT EXISTS odonto
    AUTHORIZATION admin;

GRANT ALL ON SCHEMA odonto TO admin;

-- Table: odonto.access_levels

-- DROP TABLE IF EXISTS odonto.access_levels;

CREATE TABLE IF NOT EXISTS odonto.access_levels
(
    access_level_id serial,
    level_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    id_empresa integer,
    acessa_todas_agendas boolean,
    acessa_financeiro_paciente boolean,
    CONSTRAINT access_levels_pkey PRIMARY KEY (access_level_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.access_levels
    OWNER to admin;
    
-- Table: odonto.access_levels_screen

-- DROP TABLE IF EXISTS odonto.access_levels_screen;

CREATE TABLE IF NOT EXISTS odonto.access_levels_screen
(
    id_access_levels_screen serial,
    id_access_levels integer NOT NULL,
    id_screen integer NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT access_levels_screen_pkey PRIMARY KEY (id_access_levels_screen)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.access_levels_screen
    OWNER to admin;
    
-- Table: odonto.agenda

-- DROP TABLE IF EXISTS odonto.agenda;

CREATE TABLE IF NOT EXISTS odonto.agenda
(
    id_agenda serial,
    id_empresa integer,
    id_paciente integer,
    id_profissional integer,
    start timestamp without time zone,
    "end" timestamp without time zone,
    obs text COLLATE pg_catalog."default",
    id_metodo_pagamento integer,
    total_pagamento_servico double precision,
    desconto double precision,
    status integer,
    descricao character varying COLLATE pg_catalog."default",
    dia_inteiro boolean,
    CONSTRAINT id_agenda PRIMARY KEY (id_agenda)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.agenda
    OWNER to admin;

GRANT ALL ON TABLE odonto.agenda TO admin;

-- Table: odonto.anamnese

-- DROP TABLE IF EXISTS odonto.anamnese;

CREATE TABLE IF NOT EXISTS odonto.anamnese
(
    id_anamnese serial,
    id_paciente integer,
    doenca boolean,
    descricao_doenca character varying(100) COLLATE pg_catalog."default",
    gravidez boolean,
    mes_gravidez integer,
    uso_medicacao boolean,
    descricao_medicacoes text COLLATE pg_catalog."default",
    nome_medico_assistente character varying(100) COLLATE pg_catalog."default",
    telefone_medico_assistente character varying(20) COLLATE pg_catalog."default",
    alergia boolean,
    descricao_alergia character varying(244) COLLATE pg_catalog."default",
    fuma boolean,
    bebe boolean,
    pratica_exercicio boolean,
    ja_foi_operado boolean,
    descricao_operacao text COLLATE pg_catalog."default",
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
    descricao_outra character varying(100) COLLATE pg_catalog."default",
    problema_cicatrizacao boolean,
    tratamento_medico boolean,
    historico_familiar_doenca boolean,
    descricao_historico_familiar_doenca character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.anamnese
    OWNER to admin;
    

CREATE TABLE IF NOT EXISTS odonto.forma_pagamento
(
    id_forma_pagamento serial,
    descricao character varying COLLATE pg_catalog."default",
    CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id_forma_pagamento)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.forma_pagamento
    OWNER to admin;
    

-- Table: odonto.contas_receber

-- DROP TABLE IF EXISTS odonto.contas_receber;

CREATE TABLE IF NOT EXISTS odonto.contas_receber
(
    id_pagamento integer,
    nr_parcela integer,
    valor double precision,
    dt_vencimento date,
    status character varying COLLATE pg_catalog."default",
    id_paciente integer,
    id_empresa integer,
    dt_recebimento date,
    expire_boleto_at date,
    link_boleto character varying COLLATE pg_catalog."default",
    charge_id integer,
    forma_pagamento integer,
    qtd_parcelas integer,
    link_carnet character varying COLLATE pg_catalog."default",
    carnet_id integer,
    CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento)
        REFERENCES odonto.forma_pagamento (id_forma_pagamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.contas_receber
    OWNER to admin;
    
-- Table: odonto.dentes

-- DROP TABLE IF EXISTS odonto.dentes;

CREATE TABLE IF NOT EXISTS odonto.dentes
(
    numero_dente character varying COLLATE pg_catalog."default" NOT NULL,
    descricao character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT dentes_pkey PRIMARY KEY (numero_dente)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dentes
    OWNER to admin;
    

-- Table: odonto.empresa

-- DROP TABLE IF EXISTS odonto.empresa;

CREATE TABLE IF NOT EXISTS odonto.empresa
(
    id_empresa serial,
    razao_social character varying COLLATE pg_catalog."default",
    nome_fantasia character varying COLLATE pg_catalog."default",
    cnpj_cpf character varying(14) COLLATE pg_catalog."default",
    telefone character varying COLLATE pg_catalog."default",
    logo character varying COLLATE pg_catalog."default",
    endereco character varying COLLATE pg_catalog."default",
    cep character varying COLLATE pg_catalog."default",
    logradouro character varying COLLATE pg_catalog."default",
    bairro character varying COLLATE pg_catalog."default",
    cidade character varying COLLATE pg_catalog."default",
    uf character(2) COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    celular character varying COLLATE pg_catalog."default",
    numero character varying COLLATE pg_catalog."default",
    CONSTRAINT pk_id_empresa PRIMARY KEY (id_empresa),
    CONSTRAINT constraint_name UNIQUE (cnpj_cpf)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.empresa
    OWNER to admin;

GRANT ALL ON TABLE odonto.empresa TO admin;


   
   
-- Table: odonto.dynamic_field

-- DROP TABLE IF EXISTS odonto.dynamic_field;

CREATE TABLE IF NOT EXISTS odonto.dynamic_field
(
    id_dynamic_field serial,
    form_id integer NOT NULL,
    field_name character varying COLLATE pg_catalog."default" NOT NULL,
    type character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT dynamic_field_pkey PRIMARY KEY (id_dynamic_field),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dynamic_field
    OWNER to admin;
    
   
   
-- Table: odonto.dynamic_form

-- DROP TABLE IF EXISTS odonto.dynamic_form;

CREATE TABLE IF NOT EXISTS odonto.dynamic_form
(
    id_form serial,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT dynamic_form_pkey PRIMARY KEY (id_form),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dynamic_form
    OWNER to admin;
    
   
   
-- Table: odonto.efi_credential

-- DROP TABLE IF EXISTS odonto.efi_credential;

CREATE TABLE IF NOT EXISTS odonto.efi_credential
(
    id_credential serial,
    id_empresa integer,
    client_id character varying COLLATE pg_catalog."default",
    client_secret character varying COLLATE pg_catalog."default",
    certificate_path character varying COLLATE pg_catalog."default",
    iv_client_id character varying COLLATE pg_catalog."default",
    iv_client_secret character varying COLLATE pg_catalog."default",
    sandbox boolean,
    CONSTRAINT efi_credential_pkey PRIMARY KEY (id_credential),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.efi_credential
    OWNER to admin;
    

-- Table: odonto.user

-- DROP TABLE IF EXISTS odonto."user";

CREATE TABLE IF NOT EXISTS odonto."user"
(
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default",
    id_empresa integer,
    senha character varying(255) COLLATE pg_catalog."default",
    id_user serial,
    access_levels integer,
    token_to_reset_password character varying(10) COLLATE pg_catalog."default",
    schedule_color character varying COLLATE pg_catalog."default",
    status boolean,
    CONSTRAINT pk_email PRIMARY KEY (email),
    CONSTRAINT user_id_user_key UNIQUE (id_user),
    CONSTRAINT fk_access_level_id FOREIGN KEY (access_levels)
        REFERENCES odonto.access_levels (access_level_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto."user"
    OWNER to admin;

GRANT ALL ON TABLE odonto."user" TO admin;



   
   


-- Table: odonto.evolucoes

-- DROP TABLE IF EXISTS odonto.evolucoes;

CREATE TABLE IF NOT EXISTS odonto.evolucoes
(
    id_evolucao serial,
    id_paciente integer NOT NULL,
    texto text COLLATE pg_catalog."default" NOT NULL,
    id_profissional integer NOT NULL,
    id_empresa integer NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT evolucoes_pkey PRIMARY KEY (id_evolucao),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_id_profissional FOREIGN KEY (id_profissional)
        REFERENCES odonto."user" (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.evolucoes
    OWNER to admin;
    
   
   
-- Table: odonto.faces_dente

-- DROP TABLE IF EXISTS odonto.faces_dente;

CREATE TABLE IF NOT EXISTS odonto.faces_dente
(
    dente character varying COLLATE pg_catalog."default" NOT NULL,
    face character(1) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.faces_dente
    OWNER to admin;
    
   
   
-- Table: odonto.form_dynamic_data

-- DROP TABLE IF EXISTS odonto.form_dynamic_data;

CREATE TABLE IF NOT EXISTS odonto.form_dynamic_data
(
    id_form_dynamic_data serial,
    form_id integer,
    data jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT form_dynamic_data_pkey PRIMARY KEY (id_form_dynamic_data),
    CONSTRAINT "UNIQUE_ID" UNIQUE (form_id),
    CONSTRAINT form_dynamic_data_form_id_fkey FOREIGN KEY (form_id)
        REFERENCES odonto.dynamic_form (id_form) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.form_dynamic_data
    OWNER to admin;
    
   
   
-- Table: odonto.forma_pagamento

-- DROP TABLE IF EXISTS odonto.forma_pagamento;

   
   
-- Table: odonto.orcamento

-- DROP TABLE IF EXISTS odonto.orcamento;

CREATE TABLE IF NOT EXISTS odonto.orcamento
(
    id_orcamento serial,
    id_empresa integer,
    id_profissional integer,
    id_paciente integer,
    preco double precision,
    date date,
    status character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.orcamento
    OWNER to admin;
    
   
   
-- Table: odonto.paciente

-- DROP TABLE IF EXISTS odonto.paciente;

CREATE TABLE IF NOT EXISTS odonto.paciente
(
    id_paciente serial,
    nome character varying(100) COLLATE pg_catalog."default",
    cpf character varying(11) COLLATE pg_catalog."default",
    telefone_fixo character varying(100) COLLATE pg_catalog."default",
    telefone_movel character varying(100) COLLATE pg_catalog."default",
    dt_nascimento date,
    rg character varying(30) COLLATE pg_catalog."default",
    sexo character(1) COLLATE pg_catalog."default",
    estado_civil character varying(15) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default",
    plano_saude character varying(100) COLLATE pg_catalog."default",
    numero_carteirinha character varying(100) COLLATE pg_catalog."default",
    nome_responsavel character varying(100) COLLATE pg_catalog."default",
    telefone_responsavel character varying(100) COLLATE pg_catalog."default",
    email_responsavel character varying(100) COLLATE pg_catalog."default",
    id_empresa integer,
    inserted_at date
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.paciente
    OWNER to admin;

GRANT ALL ON TABLE odonto.paciente TO admin;



-- Table: odonto.pagamento

-- DROP TABLE IF EXISTS odonto.pagamento;

CREATE TABLE IF NOT EXISTS odonto.pagamento
(
    id_pagamento serial,
    id_orcamento integer,
    tipo_desconto character varying COLLATE pg_catalog."default",
    valor_desconto double precision,
    quantidade_parcelas integer,
    data_primeiro_vencimento date,
    entrada double precision,
    data_pagamento date,
    id_empresa integer,
    valor_total double precision,
    status character varying COLLATE pg_catalog."default",
    id_paciente integer,
    forma_pagamento integer,
    CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento)
        REFERENCES odonto.forma_pagamento (id_forma_pagamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.pagamento
    OWNER to admin;
    
   
   
-- Table: odonto.procedimento

-- DROP TABLE IF EXISTS odonto.procedimento;

CREATE TABLE IF NOT EXISTS odonto.procedimento
(
    id_procedimento serial,
    dente character varying COLLATE pg_catalog."default",
    estado character varying(13) COLLATE pg_catalog."default",
    observacao text COLLATE pg_catalog."default",
    id_profissional integer,
    face_dente character varying COLLATE pg_catalog."default",
    adicionado date,
    preco double precision,
    id_procedimento_list integer,
    id_paciente integer,
    orcado boolean,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento
    OWNER to admin;

GRANT ALL ON TABLE odonto.procedimento TO admin;



-- Table: odonto.procedimento_list

-- DROP TABLE IF EXISTS odonto.procedimento_list;

CREATE TABLE IF NOT EXISTS odonto.procedimento_list
(
    id_procedimento serial,
    descricao character varying COLLATE pg_catalog."default",
    categoria character varying COLLATE pg_catalog."default",
    preco double precision,
    ativo boolean,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_list
    OWNER to admin;

GRANT ALL ON TABLE odonto.procedimento_list TO admin;



-- Table: odonto.procedimento_orcamento

-- DROP TABLE IF EXISTS odonto.procedimento_orcamento;

CREATE TABLE IF NOT EXISTS odonto.procedimento_orcamento
(
    id_orcamento integer NOT NULL,
    id_procedimento integer,
    preco double precision,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_orcamento
    OWNER to admin;
    
   
   
-- Table: odonto.procedimento_pre

-- DROP TABLE IF EXISTS odonto.procedimento_pre;

CREATE TABLE IF NOT EXISTS odonto.procedimento_pre
(
    id_procedimento serial,
    descricao character varying COLLATE pg_catalog."default",
    preco real,
    ativo boolean,
    categoria character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_pre
    OWNER to postgres;

GRANT ALL ON TABLE odonto.procedimento_pre TO postgres;



-- Table: odonto.screen

-- DROP TABLE IF EXISTS odonto.screen;

CREATE TABLE IF NOT EXISTS odonto.screen
(
    id_screen serial,
    path character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT screen_pkey PRIMARY KEY (id_screen)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.screen
    OWNER to admin;
    
   
   

-- Table: odonto.wpp_sessions

-- DROP TABLE IF EXISTS odonto.wpp_sessions;

CREATE TABLE IF NOT EXISTS odonto.wpp_sessions
(
    id_session serial,
    id_empresa integer,
    id_user integer,
    session_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    session_data text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT wpp_sessions_pkey PRIMARY KEY (id_session),
    CONSTRAINT wpp_sessions_session_name_key UNIQUE (session_name),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_id_user FOREIGN KEY (id_user)
        REFERENCES odonto."user" (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.wpp_sessions
    OWNER to admin;
-- DROP TABLE IF EXISTS odonto.anamnese;

CREATE TABLE IF NOT EXISTS odonto.anamnese
(
    id_anamnese integer NOT NULL DEFAULT nextval('odonto.anamnese_id_anamnese_seq'::regclass),
    id_paciente integer,
    doenca boolean,
    descricao_doenca character varying(100) COLLATE pg_catalog."default",
    gravidez boolean,
    mes_gravidez integer,
    uso_medicacao boolean,
    descricao_medicacoes text COLLATE pg_catalog."default",
    nome_medico_assistente character varying(100) COLLATE pg_catalog."default",
    telefone_medico_assistente character varying(20) COLLATE pg_catalog."default",
    alergia boolean,
    descricao_alergia character varying(244) COLLATE pg_catalog."default",
    fuma boolean,
    bebe boolean,
    pratica_exercicio boolean,
    ja_foi_operado boolean,
    descricao_operacao text COLLATE pg_catalog."default",
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
    descricao_outra character varying(100) COLLATE pg_catalog."default",
    problema_cicatrizacao boolean,
    tratamento_medico boolean,
    historico_familiar_doenca boolean,
    descricao_historico_familiar_doenca character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.anamnese
    OWNER to admin;
    
-- Table: odonto.contas_receber

-- DROP TABLE IF EXISTS odonto.contas_receber;

CREATE TABLE IF NOT EXISTS odonto.contas_receber
(
    id_pagamento integer,
    nr_parcela integer,
    valor double precision,
    dt_vencimento date,
    status character varying COLLATE pg_catalog."default",
    id_paciente integer,
    id_empresa integer,
    dt_recebimento date,
    expire_boleto_at date,
    link_boleto character varying COLLATE pg_catalog."default",
    charge_id integer,
    forma_pagamento integer,
    qtd_parcelas integer,
    link_carnet character varying COLLATE pg_catalog."default",
    carnet_id integer,
    CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento)
        REFERENCES odonto.forma_pagamento (id_forma_pagamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.contas_receber
    OWNER to admin;
    
-- Table: odonto.dentes

-- DROP TABLE IF EXISTS odonto.dentes;

CREATE TABLE IF NOT EXISTS odonto.dentes
(
    numero_dente character varying COLLATE pg_catalog."default" NOT NULL,
    descricao character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT dentes_pkey PRIMARY KEY (numero_dente)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dentes
    OWNER to admin;
    
   
   
-- Table: odonto.dynamic_field

-- DROP TABLE IF EXISTS odonto.dynamic_field;

CREATE TABLE IF NOT EXISTS odonto.dynamic_field
(
    id_dynamic_field integer NOT NULL DEFAULT nextval('odonto.dynamic_field_id_dynamic_field_seq'::regclass),
    form_id integer NOT NULL,
    field_name character varying COLLATE pg_catalog."default" NOT NULL,
    type character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT dynamic_field_pkey PRIMARY KEY (id_dynamic_field),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dynamic_field
    OWNER to admin;
    
   
   
-- Table: odonto.dynamic_form

-- DROP TABLE IF EXISTS odonto.dynamic_form;

CREATE TABLE IF NOT EXISTS odonto.dynamic_form
(
    id_form integer NOT NULL DEFAULT nextval('odonto.dynamic_form_id_form_seq'::regclass),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT dynamic_form_pkey PRIMARY KEY (id_form),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dynamic_form
    OWNER to admin;
    
   
   
-- Table: odonto.efi_credential

-- DROP TABLE IF EXISTS odonto.efi_credential;

CREATE TABLE IF NOT EXISTS odonto.efi_credential
(
    id_credential integer NOT NULL DEFAULT nextval('odonto.efi_credential_id_credential_seq'::regclass),
    id_empresa integer,
    client_id character varying COLLATE pg_catalog."default",
    client_secret character varying COLLATE pg_catalog."default",
    certificate_path character varying COLLATE pg_catalog."default",
    iv_client_id character varying COLLATE pg_catalog."default",
    iv_client_secret character varying COLLATE pg_catalog."default",
    sandbox boolean,
    CONSTRAINT efi_credential_pkey PRIMARY KEY (id_credential),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.efi_credential
    OWNER to admin;
    
   
   
-- Table: odonto.empresa

-- DROP TABLE IF EXISTS odonto.empresa;

CREATE TABLE IF NOT EXISTS odonto.empresa
(
    id_empresa integer NOT NULL DEFAULT nextval('odonto.empresa_id_empresa_seq1'::regclass),
    razao_social character varying COLLATE pg_catalog."default",
    nome_fantasia character varying COLLATE pg_catalog."default",
    cnpj_cpf character varying(14) COLLATE pg_catalog."default",
    telefone character varying COLLATE pg_catalog."default",
    logo character varying COLLATE pg_catalog."default",
    endereco character varying COLLATE pg_catalog."default",
    cep character varying COLLATE pg_catalog."default",
    logradouro character varying COLLATE pg_catalog."default",
    bairro character varying COLLATE pg_catalog."default",
    cidade character varying COLLATE pg_catalog."default",
    uf character(2) COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    celular character varying COLLATE pg_catalog."default",
    numero character varying COLLATE pg_catalog."default",
    CONSTRAINT pk_id_empresa PRIMARY KEY (id_empresa),
    CONSTRAINT constraint_name UNIQUE (cnpj_cpf)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.empresa
    OWNER to admin;

GRANT ALL ON TABLE odonto.empresa TO admin;



-- Table: odonto.evolucoes

-- DROP TABLE IF EXISTS odonto.evolucoes;

CREATE TABLE IF NOT EXISTS odonto.evolucoes
(
    id_evolucao integer NOT NULL DEFAULT nextval('odonto.evolucoes_id_evolucao_seq'::regclass),
    id_paciente integer NOT NULL,
    texto text COLLATE pg_catalog."default" NOT NULL,
    id_profissional integer NOT NULL,
    id_empresa integer NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT evolucoes_pkey PRIMARY KEY (id_evolucao),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_id_profissional FOREIGN KEY (id_profissional)
        REFERENCES odonto."user" (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.evolucoes
    OWNER to admin;
    
   
   
-- Table: odonto.faces_dente

-- DROP TABLE IF EXISTS odonto.faces_dente;

CREATE TABLE IF NOT EXISTS odonto.faces_dente
(
    dente character varying COLLATE pg_catalog."default" NOT NULL,
    face character(1) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.faces_dente
    OWNER to admin;
    
   
   
-- Table: odonto.form_dynamic_data

-- DROP TABLE IF EXISTS odonto.form_dynamic_data;

CREATE TABLE IF NOT EXISTS odonto.form_dynamic_data
(
    id_form_dynamic_data integer NOT NULL DEFAULT nextval('odonto.form_dynamic_data_id_form_dynamic_data_seq'::regclass),
    form_id integer,
    data jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT form_dynamic_data_pkey PRIMARY KEY (id_form_dynamic_data),
    CONSTRAINT "UNIQUE_ID" UNIQUE (form_id),
    CONSTRAINT form_dynamic_data_form_id_fkey FOREIGN KEY (form_id)
        REFERENCES odonto.dynamic_form (id_form) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.form_dynamic_data
    OWNER to admin;
    
   
   
-- Table: odonto.forma_pagamento

-- DROP TABLE IF EXISTS odonto.forma_pagamento;

CREATE TABLE IF NOT EXISTS odonto.forma_pagamento
(
    id_forma_pagamento integer NOT NULL DEFAULT nextval('odonto.forma_pagamento_id_forma_pagamento_seq'::regclass),
    descricao character varying COLLATE pg_catalog."default",
    CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id_forma_pagamento)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.forma_pagamento
    OWNER to admin;
    
   
   
-- Table: odonto.orcamento

-- DROP TABLE IF EXISTS odonto.orcamento;

CREATE TABLE IF NOT EXISTS odonto.orcamento
(
    id_orcamento integer NOT NULL DEFAULT nextval('odonto.orcamento_id_orcamento_seq'::regclass),
    id_empresa integer,
    id_profissional integer,
    id_paciente integer,
    preco double precision,
    date date,
    status character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.orcamento
    OWNER to admin;
    
   
   
-- Table: odonto.paciente

-- DROP TABLE IF EXISTS odonto.paciente;

CREATE TABLE IF NOT EXISTS odonto.paciente
(
    id_paciente integer NOT NULL DEFAULT nextval('odonto.paciente_id_paciente_seq1'::regclass),
    nome character varying(100) COLLATE pg_catalog."default",
    cpf character varying(11) COLLATE pg_catalog."default",
    telefone_fixo character varying(100) COLLATE pg_catalog."default",
    telefone_movel character varying(100) COLLATE pg_catalog."default",
    dt_nascimento date,
    rg character varying(30) COLLATE pg_catalog."default",
    sexo character(1) COLLATE pg_catalog."default",
    estado_civil character varying(15) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default",
    plano_saude character varying(100) COLLATE pg_catalog."default",
    numero_carteirinha character varying(100) COLLATE pg_catalog."default",
    nome_responsavel character varying(100) COLLATE pg_catalog."default",
    telefone_responsavel character varying(100) COLLATE pg_catalog."default",
    email_responsavel character varying(100) COLLATE pg_catalog."default",
    id_empresa integer,
    inserted_at date
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.paciente
    OWNER to admin;

GRANT ALL ON TABLE odonto.paciente TO admin;



-- Table: odonto.pagamento

-- DROP TABLE IF EXISTS odonto.pagamento;

CREATE TABLE IF NOT EXISTS odonto.pagamento
(
    id_pagamento integer NOT NULL DEFAULT nextval('odonto.pagamento_id_pagamento_seq'::regclass),
    id_orcamento integer,
    tipo_desconto character varying COLLATE pg_catalog."default",
    valor_desconto double precision,
    quantidade_parcelas integer,
    data_primeiro_vencimento date,
    entrada double precision,
    data_pagamento date,
    id_empresa integer,
    valor_total double precision,
    status character varying COLLATE pg_catalog."default",
    id_paciente integer,
    forma_pagamento integer,
    CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento)
        REFERENCES odonto.forma_pagamento (id_forma_pagamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.pagamento
    OWNER to admin;
    
   
   
-- Table: odonto.procedimento

-- DROP TABLE IF EXISTS odonto.procedimento;

CREATE TABLE IF NOT EXISTS odonto.procedimento
(
    id_procedimento integer NOT NULL DEFAULT nextval('odonto.newtable_id_procedimento_seq'::regclass),
    dente character varying COLLATE pg_catalog."default",
    estado character varying(13) COLLATE pg_catalog."default",
    observacao text COLLATE pg_catalog."default",
    id_profissional integer,
    face_dente character varying COLLATE pg_catalog."default",
    adicionado date,
    preco double precision,
    id_procedimento_list integer,
    id_paciente integer,
    orcado boolean,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento
    OWNER to admin;

GRANT ALL ON TABLE odonto.procedimento TO admin;



-- Table: odonto.procedimento_list

-- DROP TABLE IF EXISTS odonto.procedimento_list;

CREATE TABLE IF NOT EXISTS odonto.procedimento_list
(
    id_procedimento integer NOT NULL DEFAULT nextval('odonto.procedimento_list_id_procedimento_seq1'::regclass),
    descricao character varying COLLATE pg_catalog."default",
    categoria character varying COLLATE pg_catalog."default",
    preco double precision,
    ativo boolean,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_list
    OWNER to admin;

GRANT ALL ON TABLE odonto.procedimento_list TO admin;



-- Table: odonto.procedimento_orcamento

-- DROP TABLE IF EXISTS odonto.procedimento_orcamento;

CREATE TABLE IF NOT EXISTS odonto.procedimento_orcamento
(
    id_orcamento integer NOT NULL,
    id_procedimento integer,
    preco double precision,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_orcamento
    OWNER to admin;
    
   
   
-- Table: odonto.procedimento_pre

-- DROP TABLE IF EXISTS odonto.procedimento_pre;

CREATE TABLE IF NOT EXISTS odonto.procedimento_pre
(
    id_procedimento integer NOT NULL DEFAULT nextval('odonto.procedimento_pre_id_procedimento_seq1'::regclass),
    descricao character varying COLLATE pg_catalog."default",
    preco real,
    ativo boolean,
    categoria character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_pre
    OWNER to postgres;

GRANT ALL ON TABLE odonto.procedimento_pre TO postgres;



-- Table: odonto.screen

-- DROP TABLE IF EXISTS odonto.screen;

CREATE TABLE IF NOT EXISTS odonto.screen
(
    id_screen integer NOT NULL DEFAULT nextval('odonto.screen_id_screen_seq'::regclass),
    path character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT screen_pkey PRIMARY KEY (id_screen)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.screen
    OWNER to admin;
    
   
   
-- Table: odonto.user

-- DROP TABLE IF EXISTS odonto."user";

CREATE TABLE IF NOT EXISTS odonto."user"
(
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default",
    id_empresa integer,
    senha character varying(255) COLLATE pg_catalog."default",
    id_user integer NOT NULL DEFAULT nextval('odonto.user_id_user_seq'::regclass),
    access_levels integer,
    token_to_reset_password character varying(10) COLLATE pg_catalog."default",
    schedule_color character varying COLLATE pg_catalog."default",
    status boolean,
    CONSTRAINT pk_email PRIMARY KEY (email),
    CONSTRAINT user_id_user_key UNIQUE (id_user),
    CONSTRAINT fk_access_level_id FOREIGN KEY (access_levels)
        REFERENCES odonto.access_levels (access_level_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto."user"
    OWNER to admin;

GRANT ALL ON TABLE odonto."user" TO admin;



-- Table: odonto.wpp_sessions

-- DROP TABLE IF EXISTS odonto.wpp_sessions;

CREATE TABLE IF NOT EXISTS odonto.wpp_sessions
(
    id_session integer NOT NULL DEFAULT nextval('odonto.wpp_sessions_id_session_seq'::regclass),
    id_empresa integer,
    id_user integer,
    session_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    session_data text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT wpp_sessions_pkey PRIMARY KEY (id_session),
    CONSTRAINT wpp_sessions_session_name_key UNIQUE (session_name),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_id_user FOREIGN KEY (id_user)
        REFERENCES odonto."user" (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.wpp_sessions
    OWNER to admin;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  -- CORRETO
  -- Database: postgres


COMMENT ON DATABASE postgres
    IS 'default administrative connection database';
    
-- SCHEMA: odonto

-- DROP SCHEMA IF EXISTS odonto ;

CREATE SCHEMA IF NOT EXISTS odonto
    AUTHORIZATION admin;

GRANT ALL ON SCHEMA odonto TO admin;

-- Table: odonto.access_levels

-- DROP TABLE IF EXISTS odonto.access_levels;

CREATE TABLE IF NOT EXISTS odonto.access_levels
(
    access_level_id serial,
    level_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    id_empresa integer,
    acessa_todas_agendas boolean,
    acessa_financeiro_paciente boolean,
    CONSTRAINT access_levels_pkey PRIMARY KEY (access_level_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.access_levels
    OWNER to admin;
    
-- Table: odonto.access_levels_screen

-- DROP TABLE IF EXISTS odonto.access_levels_screen;

CREATE TABLE IF NOT EXISTS odonto.access_levels_screen
(
    id_access_levels_screen serial,
    id_access_levels integer NOT NULL,
    id_screen integer NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT access_levels_screen_pkey PRIMARY KEY (id_access_levels_screen)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.access_levels_screen
    OWNER to admin;
    
-- Table: odonto.agenda

-- DROP TABLE IF EXISTS odonto.agenda;

CREATE TABLE IF NOT EXISTS odonto.agenda
(
    id_agenda serial,
    id_empresa integer,
    id_paciente integer,
    id_profissional integer,
    start timestamp without time zone,
    "end" timestamp without time zone,
    obs text COLLATE pg_catalog."default",
    id_metodo_pagamento integer,
    total_pagamento_servico double precision,
    desconto double precision,
    status integer,
    descricao character varying COLLATE pg_catalog."default",
    dia_inteiro boolean,
    CONSTRAINT id_agenda PRIMARY KEY (id_agenda)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.agenda
    OWNER to admin;

GRANT ALL ON TABLE odonto.agenda TO admin;

-- Table: odonto.anamnese

-- DROP TABLE IF EXISTS odonto.anamnese;

CREATE TABLE IF NOT EXISTS odonto.anamnese
(
    id_anamnese serial,
    id_paciente integer,
    doenca boolean,
    descricao_doenca character varying(100) COLLATE pg_catalog."default",
    gravidez boolean,
    mes_gravidez integer,
    uso_medicacao boolean,
    descricao_medicacoes text COLLATE pg_catalog."default",
    nome_medico_assistente character varying(100) COLLATE pg_catalog."default",
    telefone_medico_assistente character varying(20) COLLATE pg_catalog."default",
    alergia boolean,
    descricao_alergia character varying(244) COLLATE pg_catalog."default",
    fuma boolean,
    bebe boolean,
    pratica_exercicio boolean,
    ja_foi_operado boolean,
    descricao_operacao text COLLATE pg_catalog."default",
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
    descricao_outra character varying(100) COLLATE pg_catalog."default",
    problema_cicatrizacao boolean,
    tratamento_medico boolean,
    historico_familiar_doenca boolean,
    descricao_historico_familiar_doenca character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.anamnese
    OWNER to admin;
    

CREATE TABLE IF NOT EXISTS odonto.forma_pagamento
(
    id_forma_pagamento serial,
    descricao character varying COLLATE pg_catalog."default",
    CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id_forma_pagamento)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.forma_pagamento
    OWNER to admin;
    

-- Table: odonto.contas_receber

-- DROP TABLE IF EXISTS odonto.contas_receber;

CREATE TABLE IF NOT EXISTS odonto.contas_receber
(
    id_pagamento integer,
    nr_parcela integer,
    valor double precision,
    dt_vencimento date,
    status character varying COLLATE pg_catalog."default",
    id_paciente integer,
    id_empresa integer,
    dt_recebimento date,
    expire_boleto_at date,
    link_boleto character varying COLLATE pg_catalog."default",
    charge_id integer,
    forma_pagamento integer,
    qtd_parcelas integer,
    link_carnet character varying COLLATE pg_catalog."default",
    carnet_id integer,
    CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento)
        REFERENCES odonto.forma_pagamento (id_forma_pagamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.contas_receber
    OWNER to admin;
    
-- Table: odonto.dentes

-- DROP TABLE IF EXISTS odonto.dentes;

CREATE TABLE IF NOT EXISTS odonto.dentes
(
    numero_dente character varying COLLATE pg_catalog."default" NOT NULL,
    descricao character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT dentes_pkey PRIMARY KEY (numero_dente)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dentes
    OWNER to admin;
    

-- Table: odonto.empresa

-- DROP TABLE IF EXISTS odonto.empresa;

CREATE TABLE IF NOT EXISTS odonto.empresa
(
    id_empresa serial,
    razao_social character varying COLLATE pg_catalog."default",
    nome_fantasia character varying COLLATE pg_catalog."default",
    cnpj_cpf character varying(14) COLLATE pg_catalog."default",
    telefone character varying COLLATE pg_catalog."default",
    logo character varying COLLATE pg_catalog."default",
    endereco character varying COLLATE pg_catalog."default",
    cep character varying COLLATE pg_catalog."default",
    logradouro character varying COLLATE pg_catalog."default",
    bairro character varying COLLATE pg_catalog."default",
    cidade character varying COLLATE pg_catalog."default",
    uf character(2) COLLATE pg_catalog."default",
    email character varying COLLATE pg_catalog."default",
    celular character varying COLLATE pg_catalog."default",
    numero character varying COLLATE pg_catalog."default",
    CONSTRAINT pk_id_empresa PRIMARY KEY (id_empresa),
    CONSTRAINT constraint_name UNIQUE (cnpj_cpf)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.empresa
    OWNER to admin;

GRANT ALL ON TABLE odonto.empresa TO admin;


   
   
-- Table: odonto.dynamic_field

-- DROP TABLE IF EXISTS odonto.dynamic_field;

CREATE TABLE IF NOT EXISTS odonto.dynamic_field
(
    id_dynamic_field serial,
    form_id integer NOT NULL,
    field_name character varying COLLATE pg_catalog."default" NOT NULL,
    type character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT dynamic_field_pkey PRIMARY KEY (id_dynamic_field),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dynamic_field
    OWNER to admin;
    
   
   
-- Table: odonto.dynamic_form

-- DROP TABLE IF EXISTS odonto.dynamic_form;

CREATE TABLE IF NOT EXISTS odonto.dynamic_form
(
    id_form serial,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT dynamic_form_pkey PRIMARY KEY (id_form),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.dynamic_form
    OWNER to admin;
    
   
   
-- Table: odonto.efi_credential

-- DROP TABLE IF EXISTS odonto.efi_credential;

CREATE TABLE IF NOT EXISTS odonto.efi_credential
(
    id_credential serial,
    id_empresa integer,
    client_id character varying COLLATE pg_catalog."default",
    client_secret character varying COLLATE pg_catalog."default",
    certificate_path character varying COLLATE pg_catalog."default",
    iv_client_id character varying COLLATE pg_catalog."default",
    iv_client_secret character varying COLLATE pg_catalog."default",
    sandbox boolean,
    CONSTRAINT efi_credential_pkey PRIMARY KEY (id_credential),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.efi_credential
    OWNER to admin;
    

-- Table: odonto.user

-- DROP TABLE IF EXISTS odonto."user";

CREATE TABLE IF NOT EXISTS odonto."user"
(
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    nome character varying(100) COLLATE pg_catalog."default",
    id_empresa integer,
    senha character varying(255) COLLATE pg_catalog."default",
    id_user serial,
    access_levels integer,
    token_to_reset_password character varying(10) COLLATE pg_catalog."default",
    schedule_color character varying COLLATE pg_catalog."default",
    status boolean,
    CONSTRAINT pk_email PRIMARY KEY (email),
    CONSTRAINT user_id_user_key UNIQUE (id_user),
    CONSTRAINT fk_access_level_id FOREIGN KEY (access_levels)
        REFERENCES odonto.access_levels (access_level_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto."user"
    OWNER to admin;

GRANT ALL ON TABLE odonto."user" TO admin;



   
   


-- Table: odonto.evolucoes

-- DROP TABLE IF EXISTS odonto.evolucoes;

CREATE TABLE IF NOT EXISTS odonto.evolucoes
(
    id_evolucao serial,
    id_paciente integer NOT NULL,
    texto text COLLATE pg_catalog."default" NOT NULL,
    id_profissional integer NOT NULL,
    id_empresa integer NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT evolucoes_pkey PRIMARY KEY (id_evolucao),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_id_profissional FOREIGN KEY (id_profissional)
        REFERENCES odonto."user" (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.evolucoes
    OWNER to admin;
    
   
   
-- Table: odonto.faces_dente

-- DROP TABLE IF EXISTS odonto.faces_dente;

CREATE TABLE IF NOT EXISTS odonto.faces_dente
(
    dente character varying COLLATE pg_catalog."default" NOT NULL,
    face character(1) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.faces_dente
    OWNER to admin;
    
   
   
-- Table: odonto.form_dynamic_data

-- DROP TABLE IF EXISTS odonto.form_dynamic_data;

CREATE TABLE IF NOT EXISTS odonto.form_dynamic_data
(
    id_form_dynamic_data serial,
    form_id integer,
    data jsonb NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_empresa integer,
    CONSTRAINT form_dynamic_data_pkey PRIMARY KEY (id_form_dynamic_data),
    CONSTRAINT "UNIQUE_ID" UNIQUE (form_id),
    CONSTRAINT form_dynamic_data_form_id_fkey FOREIGN KEY (form_id)
        REFERENCES odonto.dynamic_form (id_form) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.form_dynamic_data
    OWNER to admin;
    
   
   
-- Table: odonto.forma_pagamento

-- DROP TABLE IF EXISTS odonto.forma_pagamento;

   
   
-- Table: odonto.orcamento

-- DROP TABLE IF EXISTS odonto.orcamento;

CREATE TABLE IF NOT EXISTS odonto.orcamento
(
    id_orcamento serial,
    id_empresa integer,
    id_profissional integer,
    id_paciente integer,
    preco double precision,
    date date,
    status character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.orcamento
    OWNER to admin;
    
   
   
-- Table: odonto.paciente

-- DROP TABLE IF EXISTS odonto.paciente;

CREATE TABLE IF NOT EXISTS odonto.paciente
(
    id_paciente serial,
    nome character varying(100) COLLATE pg_catalog."default",
    cpf character varying(11) COLLATE pg_catalog."default",
    telefone_fixo character varying(100) COLLATE pg_catalog."default",
    telefone_movel character varying(100) COLLATE pg_catalog."default",
    dt_nascimento date,
    rg character varying(30) COLLATE pg_catalog."default",
    sexo character(1) COLLATE pg_catalog."default",
    estado_civil character varying(15) COLLATE pg_catalog."default",
    email character varying(100) COLLATE pg_catalog."default",
    plano_saude character varying(100) COLLATE pg_catalog."default",
    numero_carteirinha character varying(100) COLLATE pg_catalog."default",
    nome_responsavel character varying(100) COLLATE pg_catalog."default",
    telefone_responsavel character varying(100) COLLATE pg_catalog."default",
    email_responsavel character varying(100) COLLATE pg_catalog."default",
    id_empresa integer,
    inserted_at date
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.paciente
    OWNER to admin;

GRANT ALL ON TABLE odonto.paciente TO admin;



-- Table: odonto.pagamento

-- DROP TABLE IF EXISTS odonto.pagamento;

CREATE TABLE IF NOT EXISTS odonto.pagamento
(
    id_pagamento serial,
    id_orcamento integer,
    tipo_desconto character varying COLLATE pg_catalog."default",
    valor_desconto double precision,
    quantidade_parcelas integer,
    data_primeiro_vencimento date,
    entrada double precision,
    data_pagamento date,
    id_empresa integer,
    valor_total double precision,
    status character varying COLLATE pg_catalog."default",
    id_paciente integer,
    forma_pagamento integer,
    CONSTRAINT fk_forma_pagamento FOREIGN KEY (forma_pagamento)
        REFERENCES odonto.forma_pagamento (id_forma_pagamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.pagamento
    OWNER to admin;
    
   
   
-- Table: odonto.procedimento

-- DROP TABLE IF EXISTS odonto.procedimento;

CREATE TABLE IF NOT EXISTS odonto.procedimento
(
    id_procedimento serial,
    dente character varying COLLATE pg_catalog."default",
    estado character varying(13) COLLATE pg_catalog."default",
    observacao text COLLATE pg_catalog."default",
    id_profissional integer,
    face_dente character varying COLLATE pg_catalog."default",
    adicionado date,
    preco double precision,
    id_procedimento_list integer,
    id_paciente integer,
    orcado boolean,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento
    OWNER to admin;

GRANT ALL ON TABLE odonto.procedimento TO admin;



-- Table: odonto.procedimento_list

-- DROP TABLE IF EXISTS odonto.procedimento_list;

CREATE TABLE IF NOT EXISTS odonto.procedimento_list
(
    id_procedimento serial,
    descricao character varying COLLATE pg_catalog."default",
    categoria character varying COLLATE pg_catalog."default",
    preco double precision,
    ativo boolean,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_list
    OWNER to admin;

GRANT ALL ON TABLE odonto.procedimento_list TO admin;



-- Table: odonto.procedimento_orcamento

-- DROP TABLE IF EXISTS odonto.procedimento_orcamento;

CREATE TABLE IF NOT EXISTS odonto.procedimento_orcamento
(
    id_orcamento integer NOT NULL,
    id_procedimento integer,
    preco double precision,
    id_empresa integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_orcamento
    OWNER to admin;
    
   
   
-- Table: odonto.procedimento_pre

-- DROP TABLE IF EXISTS odonto.procedimento_pre;

CREATE TABLE IF NOT EXISTS odonto.procedimento_pre
(
    id_procedimento serial,
    descricao character varying COLLATE pg_catalog."default",
    preco real,
    ativo boolean,
    categoria character varying COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.procedimento_pre
    OWNER to postgres;

GRANT ALL ON TABLE odonto.procedimento_pre TO postgres;



-- Table: odonto.screen

-- DROP TABLE IF EXISTS odonto.screen;

CREATE TABLE IF NOT EXISTS odonto.screen
(
    id_screen serial,
    path character varying(100) COLLATE pg_catalog."default" NOT NULL,
    id_empresa integer NOT NULL,
    CONSTRAINT screen_pkey PRIMARY KEY (id_screen)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.screen
    OWNER to admin;
    
   
   

-- Table: odonto.wpp_sessions

-- DROP TABLE IF EXISTS odonto.wpp_sessions;

CREATE TABLE IF NOT EXISTS odonto.wpp_sessions
(
    id_session serial,
    id_empresa integer,
    id_user integer,
    session_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    session_data text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT wpp_sessions_pkey PRIMARY KEY (id_session),
    CONSTRAINT wpp_sessions_session_name_key UNIQUE (session_name),
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa)
        REFERENCES odonto.empresa (id_empresa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_id_user FOREIGN KEY (id_user)
        REFERENCES odonto."user" (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS odonto.wpp_sessions
    OWNER to admin;