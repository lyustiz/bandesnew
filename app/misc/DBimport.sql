SELECT 'id_'||table_name||' integer NOT NULL DEFAULT nextval(''pagos.ingreso_id_ingreso_seq''::regclass),' --seleccionamos solo la columna del nombre de la tabla
FROM information_schema.tables --seleccionamos la información del esquema 
WHERE table_schema='public' --las tablas se encuentran en el esquema publico
AND table_type='BASE TABLE'
and substring(table_name from 1 for 1) <> '_';

SELECT 'id_'||table_name||' integer NOT NULL DEFAULT nextval(''pagos.ingreso_id_ingreso_seq''::regclass),' --seleccionamos solo la columna del nombre de la tabla
FROM information_schema.tables --seleccionamos la información del esquema 
WHERE table_schema='public' --las tablas se encuentran en el esquema publico
AND table_type='BASE TABLE'
and substring(table_name from 1 for 1) <> '_';

CREATE SEQUENCE cuenta_usuario_id_cuenta_usuario_seq; 
CREATE SEQUENCE boveda_historial_transito_id_boveda_historial_transito_seq;
CREATE SEQUENCE traspaso_efectivo_caja_id_traspaso_efectivo_caja_seq; 
CREATE SEQUENCE traspaso_efectivo_id_traspaso_efectivo_seq; 
CREATE SEQUENCE solicitud_accion_id_solicitud_accion_seq; 
CREATE SEQUENCE ruta_cartaporte_id_ruta_cartaporte_seq; 
CREATE SEQUENCE razon_id_razon_seq; 
CREATE SEQUENCE punto_efectivo_id_punto_efectivo_seq; 
CREATE SEQUENCE operacion_id_operacion_seq; 
CREATE SEQUENCE tipo_efectivo_id_tipo_efectivo_seq; 
CREATE SEQUENCE efectivo_id_efectivo_seq; 
CREATE SEQUENCE traspaso_bloque_id_traspaso_bloque_seq; 
CREATE SEQUENCE solicitud_traspaso_id_solicitud_traspaso_seq; 
CREATE SEQUENCE solicitud_ruta_id_solicitud_ruta_seq; 
CREATE SEQUENCE solicitud_envase_efectivo_id_solicitud_envase_efectivo_seq; 
CREATE SEQUENCE solicitud_envase_id_solicitud_envase_seq; 
CREATE SEQUENCE solicitud_cartaporte_id_solicitud_cartaporte_seq; 
CREATE SEQUENCE diferencia_id_diferencia_seq; 
CREATE SEQUENCE diferenciac_id_diferenciac_seq; 
CREATE SEQUENCE deuda_transito_id_deuda_transito_seq; 
CREATE SEQUENCE cuenta_id_cuenta_seq; 
CREATE SEQUENCE cartaporte_punto_id_cartaporte_punto_seq; 
CREATE SEQUENCE cartaporte_id_cartaporte_seq; 
CREATE SEQUENCE boveda_historial_id_boveda_historial_seq; 
CREATE SEQUENCE boveda_efectivo_pendiente_id_boveda_efectivo_pendiente_seq; 
CREATE SEQUENCE bloque_id_bloque_seq; 
CREATE SEQUENCE arqueo_punto_id_arqueo_punto_seq; 
CREATE SEQUENCE acta_envase_id_acta_envase_seq; 
CREATE SEQUENCE traspaso_cartaporte_id_traspaso_cartaporte_seq; 
CREATE SEQUENCE traspaso_caja_id_traspaso_caja_seq; 
CREATE SEQUENCE traspaso_id_traspaso_seq; 
CREATE SEQUENCE supervisor_id_supervisor_seq; 
CREATE SEQUENCE solicitud_servicio_id_solicitud_servicio_seq; 
CREATE SEQUENCE solicitud_id_solicitud_seq; 
CREATE SEQUENCE servicio_id_servicio_seq; 
CREATE SEQUENCE ruta_id_ruta_seq; 
CREATE SEQUENCE rubro_id_rubro_seq; 
CREATE SEQUENCE punto_id_punto_seq; 
CREATE SEQUENCE placa_id_placa_seq; 
CREATE SEQUENCE origen_id_origen_seq; 
CREATE SEQUENCE oficial_id_oficial_seq; 
CREATE SEQUENCE modulo_id_modulo_seq; 
CREATE SEQUENCE envase_efectivo_id_envase_efectivo_seq; 
CREATE SEQUENCE envase_arqueo_id_envase_arqueo_seq; 
CREATE SEQUENCE envase_id_envase_seq; 
CREATE SEQUENCE diferenciae_id_diferenciae_seq; 
CREATE SEQUENCE deuda_id_deuda_seq; 
CREATE SEQUENCE deposito_id_deposito_seq; 
CREATE SEQUENCE cuenta_numero_id_cuenta_numero_seq; 
CREATE SEQUENCE cuenta_efectivo_id_cuenta_efectivo_seq; 
CREATE SEQUENCE concepto_id_concepto_seq; 
CREATE SEQUENCE cliente_id_cliente_seq; 
CREATE SEQUENCE cajetin_id_cajetin_seq; 
CREATE SEQUENCE caja_historial_id_caja_historial_seq; 
CREATE SEQUENCE caja_efectivo_id_caja_efectivo_seq; 
CREATE SEQUENCE caja_id_caja_seq; 
CREATE SEQUENCE boveda_historial_efectivo_id_boveda_historial_efectivo_seq; 
CREATE SEQUENCE boveda_historial_cuenta_id_boveda_historial_cuenta_seq; 
CREATE SEQUENCE boveda_efectivo_id_boveda_efectivo_seq; 
CREATE SEQUENCE boveda_id_boveda_seq; 
CREATE SEQUENCE bloque_efectivo_id_bloque_efectivo_seq; 
CREATE SEQUENCE banco_id_banco_seq; 
CREATE SEQUENCE arqueo_id_arqueo_seq; 
CREATE SEQUENCE acta_ruta_id_acta_ruta_seq; 
CREATE SEQUENCE acta_envase_efectivo_id_acta_envase_efectivo_seq; 
CREATE SEQUENCE acta_cartaporte_id_acta_cartaporte_seq; 
CREATE SEQUENCE acta_id_acta_seq; 

CREATE TABLE acta(
    id_acta integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_razon integer NOT NULL,
    id_origen integer NOT NULL,
    id_boveda integer NOT NULL,
    nu_cartaporte varchar(13) NULL,
    mo_cartaporte numeric(18, 3) NULL,
    fe_cartaporte timestamp without time zone NULL,
    nu_plomo varchar(50) NULL,
    fe_ruta timestamp without time zone NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta PRIMARY KEY (id_acta)
);

CREATE TABLE acta_cartaporte(
    id_acta_cartaporte integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_cartaporte varchar(13) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_cartaporte PRIMARY KEY (id_acta)
) ;

CREATE TABLE acta_envase(
    id_acta_envase integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_envase integer NOT NULL,
    nu_plomo varchar(20) NULL,
    bo_abierto boolean NOT NULL,
    fe_abierto timestamp without time zone NULL,
    id_usuario_ab varchar(30) NULL,
    id_cartaporte varchar(13) NOT NULL,
    bo_defectuoso boolean NOT NULL,
    mo_envase numeric(18, 3) NULL,
    id_acta integer NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_envase PRIMARY KEY (id_acta_envase)
 );

CREATE TABLE acta_envase_efectivo(
    id_acta_envase_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_envase integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_efectivo numeric(18, 3) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_envase_efectivo PRIMARY KEY (id_acta_envase_efectivo)
);

CREATE TABLE acta_ruta(
    id_acta_ruta integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_acta integer NOT NULL,
    id_ruta integer NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_acta_ruta PRIMARY KEY (id_acta_ruta)
);

CREATE TABLE arqueo(
    id_arqueo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_cuenta integer NOT NULL,
    id_boveda integer NOT NULL,
    mo_arqueo numeric(18, 3) NOT NULL,
    id_usu_cierre varchar(30) NULL,
    bo_cerrado boolean NOT NULL,
    bo_sistema boolean NOT NULL,
    id_bolsa varchar(13) NULL,
    id_rubro integer NULL,
    ca_envase integer NULL,
    nu_plomo varchar(50) NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_arqueo PRIMARY KEY (id_arqueo)
);


CREATE TABLE arqueo_punto(
    id_arqueo_punto integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_arqueo varchar(13) NOT NULL,
    id_punto integer NOT NULL,
    id_tipo integer NOT NULL,
    fe_arqueo timestamp without time zone NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_arqueo_punto PRIMARY KEY (id_arqueo_punto)
);
--id_arqueo ,	id_punto ,	Tipo 

CREATE TABLE banco(
    id_banco integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_banco varchar(50) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_banco PRIMARY KEY (id_banco)
);

CREATE TABLE bloque(
    id_bloque integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda varchar(50) NOT NULL,
    bo_abierto boolean NOT NULL,
    id_usuario_ab varchar(50) NULL,
    id_cartaporte varchar(13) NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_bloque PRIMARY KEY (id_bloque )
);


CREATE TABLE bloque_efectivo(
    id_bloque_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_bloque varchar(50) NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_efectivo numeric(18, 3) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_bloque_efectivo PRIMARY KEY (id_bloque_efectivo)
);


CREATE TABLE boveda(
    id_boveda integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_boveda varchar(50) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda PRIMARY KEY (id_boveda)
);



CREATE TABLE boveda_efectivo(
    id_boveda_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_efectivo numeric(18, 3) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_efectivo PRIMARY KEY (id_boveda_efectivo)
);


CREATE TABLE boveda_efectivo_pendiente(
    id_boveda_efectivo_pendiente integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda integer NOT NULL,
    mo_pendiente numeric(18, 3) NOT NULL,
    tx_descripcion varchar(50) NOT NULL,
    tx_observacion varchar(200),
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_efectivo_pendiente PRIMARY KEY (id_boveda_efectivo_pendiente)
 );

--movimientos boveda
CREATE TABLE boveda_historial(
    id_boveda_historial integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda integer NOT NULL,
    fe_abierto timestamp without time zone NOT NULL,
    id_usuario_ab varchar(30) NOT NULL,
    fe_cierre timestamp without time zone NULL,
    id_usu_cierre varchar(30) NULL,
    mo_inicial numeric(18, 3) NOT NULL,
    mo_transito numeric(18, 3) NULL,
    mo_sin_procesar numeric(18, 3) NULL,
    mo_deuda_estaciones numeric(18, 3) NULL,
    mo_deuda numeric(18, 3) NULL,
    mo_pagar numeric(18, 3) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial_1 PRIMARY KEY (id_boveda_historial)
);

--moviientos cuenta
CREATE TABLE boveda_historial_cuenta(
    id_boveda_historial_cuenta integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda integer NOT NULL,
    tx_descripcion varchar(100) NOT NULL,
    id_tipo integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial_cuenta PRIMARY KEY (id_boveda_historial_cuenta)
);

--moviientos cuenta piezs7monto
CREATE TABLE boveda_historial_efectivo(
    id_boveda_historial_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial_efectivo PRIMARY KEY (id_boveda_historial_efectivo)
);

--moviminto entrada salida
CREATE TABLE boveda_historial_transito(
    id_boveda_historial_transito integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda integer NOT NULL,
    tx_descripcion varchar(100) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_boveda_historial_transito_1 PRIMARY KEY (id_boveda_historial_transito)
);

CREATE TABLE caja(
    id_caja integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_caja varchar(50) NOT NULL,
    id_tipo_caja integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_caja PRIMARY KEY (id_caja)
);

CREATE TABLE caja_efectivo(
    id_caja_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_caja integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_caja_efectivo PRIMARY KEY (id_caja_efectivo) 
);

CREATE TABLE caja_historial(
    id_caja_historial integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_caja integer NOT NULL,
    fe_abierto timestamp without time zone NOT NULL,
    id_usuario_ab varchar(30) NOT NULL,
    fe_cierre timestamp without time zone NULL,
    id_usu_cierre varchar(30) NULL,
    mo_inicial numeric(18, 3) NOT NULL,
    mo_transito numeric(18, 3) NULL,
    mo_procesar numeric(18, 3) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_caja_historial PRIMARY KEY (id_caja_historial)
);


CREATE TABLE cajetin(
    id_cajetin integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_cajetin varchar(15) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cajetin PRIMARY KEY (id_cajetin)
);

CREATE TABLE cartaporte(
    id_cartaporte integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_cuenta integer NOT NULL,
    id_boveda integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    fe_cierre timestamp without time zone NULL,
    id_usu_cierre varchar(30) NULL,
    bo_cerrado boolean NOT NULL,
    bo_sistema boolean NOT NULL,
    id_bolsa varchar(13) NULL,
    id_rubro integer NULL,
    id_boveda_creado integer NULL,
    ca_envase integer NULL,
    nu_plomo varchar(50) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cartaporte PRIMARY KEY (id_cartaporte) 
);

CREATE TABLE cartaporte_punto(
    id_cartaporte_punto integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_cartaporte varchar(13) NOT NULL,
    id_punto integer NOT NULL,
    id_tipo integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cartaporte_punto PRIMARY KEY (id_cartaporte_punto)
); 

CREATE TABLE cliente(
    id_cliente integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_cliente varchar(100) NOT NULL,
    tx_direccion varchar(250) NULL,
    tx_telefono varchar(30) NULL,
    tx_email varchar(60) NULL,
    co_rif varchar(20) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE concepto(
    id_concepto integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_concepto varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_concepto PRIMARY KEY (id_concepto)
);


CREATE TABLE cuenta(
    id_cuenta integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nu_cuenta varchar(50) NULL,
    id_cliente char(10) NOT NULL,
    mo_saldo numeric(18, 3) NOT NULL,
    id_ultima_trans integer NOT NULL,
    id_boveda integer NOT NULL,
    id_tipo_cuenta integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_Cuenta PRIMARY KEY (id_cuenta) 
 );

CREATE TABLE cuenta_efectivo(
    id_cuenta_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_cuenta integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cuenta_efectivo PRIMARY KEY (id_cuenta_efectivo)
); 

CREATE TABLE cuenta_numero(
    id_cuenta_numero integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nu_cuenta varchar(50) NOT NULL,
    id_banco integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cuenta_numero PRIMARY KEY (id_cuenta_numero)
);



CREATE TABLE cuenta_usuario(
    id_cuenta_usuario integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_cuenta integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_cuenta_usuario PRIMARY KEY (id_cuenta_usuario)
);


CREATE TABLE deposito(
    id_deposito integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    fe_deposito timestamp without time zone NOT NULL,
    tx_contacto varchar(50) NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    nu_deposito varchar(50) NULL,
    id_concepto integer NULL,
    id_cuenta integer NOT NULL,
    id_cuenta_numero integer NULL,
    id_banco integer NULL,
    id_transpaso integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_deposito PRIMARY KEY (id_deposito)
);


CREATE TABLE deuda(
    id_deuda integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    fe_deuda timestamp without time zone NOT NULL,
    id_punto integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    mo_transaccion numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_deuda PRIMARY KEY (id_deuda )
);

CREATE TABLE deuda_transito(
    id_deuda_transito integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    aa_deuda varchar(4) NOT NULL,
    mm_deuda varchar(2) NOT NULL,
    mo_deuda numeric(18, 3) NOT NULL,
    id_boveda integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_deuda_transito PRIMARY KEY (id_deuda_transito)
);

CREATE TABLE diferencia(
    id_diferencia integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    fe_diferencia timestamp without time zone NOT NULL,
    id_punto integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    mo_transaccion numeric(18, 3) NOT NULL,
    tx_descripcion varchar(200) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_diferencia PRIMARY KEY (id_diferencia)
) ;


CREATE TABLE diferenciac(
    id_diferenciac integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    mo_declarado numeric(18, 3) NULL,
    mo_total numeric(18, 3) NULL,
    nu_carnet varchar(50) NULL,
    ca_relacionada integer NULL,
    co_remision varchar(50) NULL,
    tx_supervisor varchar(50) NULL,
    --id_cartaporte varchar(13) NOT NULL,
    mo_sobrante numeric(18, 3) NULL,
    mo_faltante numeric(18, 3) NULL,
    bo_activo boolean NOT NULL,
    id_punto integer NULL,
    id_boveda integer NULL,
    --cartaportes varchar(200) NULL,
    fe_cartaporte timestamp without time zone NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_diferenciac PRIMARY KEY (id_diferenciac)
);



CREATE TABLE diferenciae(
    id_diferenciae integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    fe_diferenciaE timestamp without time zone NULL,
    id_punto integer NULL,
    mo_total numeric(18, 3) NULL,
    mo_transaccion numeric(18, 3) NULL,
    tx_descripcion varchar(200) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
CONSTRAINT pk_diferenciaC PRIMARY KEY (id_diferenciae)
);

CREATE TABLE efectivo(
    id_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_tipo_efectivo integer NOT NULL,
    mo_denominacion numeric(18, 3) NOT NULL,
    tx_imagen varchar(100) NOT NULL,
    bo_activo boolean NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_efectivo PRIMARY KEY (id_efectivo)
) ;

CREATE TABLE tipo_efectivo(
    id_tipo_efectivo integer NOT NULL,
    nb_tipo_efectivo varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_tipo_efectivo PRIMARY KEY (id_tipo_efectivo)
) ;


CREATE TABLE envase(
    id_envase integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nu_plomo varchar(20) NULL,
    bo_abierto boolean NOT NULL,
    fe_abierto timestamp without time zone NULL,
    id_usuario_ab varchar(30) NULL,
    id_cartaporte varchar(13) NOT NULL,
    bo_defectuoso boolean NOT NULL,
    mo_total numeric(18, 3) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_envase PRIMARY KEY (id_envase)
) ;

CREATE TABLE envase_arqueo(
    id_envase_arqueo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    id_cajetin integer NOT NULL,
    id_modulo integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_envase_arqueo PRIMARY KEY (id_envase_arqueo)
) ;

CREATE TABLE envase_efectivo(
    id_envase_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_envase integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_envase_efectivo PRIMARY KEY (id_envase_efectivo)
) ;

CREATE TABLE modulo(
    id_modulo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_modulo varchar(15) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_modulo PRIMARY KEY (id_modulo)
) ;

CREATE TABLE oficial(
    id_oficial integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_oficial varchar(50) NOT NULL,
    nu_cedula varchar(12) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_oficial PRIMARY KEY (id_oficial)
) ;


CREATE TABLE operacion(
    id_operacion integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_operacion varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_operacion PRIMARY KEY (id_operacion )
) ;

CREATE TABLE origen(
    id_origen integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_origen varchar(30) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_origen PRIMARY KEY (	id_origen )
) ;


CREATE TABLE placa(
    id_placa integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    co_placa varchar(500) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_placa PRIMARY KEY (id_placa)
) ;


--refactorizar
CREATE TABLE _plomo(
    id_plomo varchar(50) NOT NULL,
    id_diferencia integer NOT NULL,
    D0010 integer NULL,
    D0050 integer NULL,
    D0100 integer NULL,
    D0125 integer NULL,
    D0250 integer NULL,
    D0500 integer NULL,
    D10 integer NULL,
    D100 integer NULL,
    D1000 integer NULL,
    D2 integer NULL,
    D20 integer NULL,
    D5 integer NULL,
    D50 integer NULL,
    F0010 integer NULL,
    F0050 integer NULL,
    F0100 integer NULL,
    F0125 integer NULL,
    F0250 integer NULL,
    F0500 integer NULL,
    F10 integer NULL,
    F100 integer NULL,
    F1000 integer NULL,
    F2 integer NULL,
    F20 integer NULL,
    F5 integer NULL,
    F50 integer NULL
); 

--refactorizar
CREATE TABLE _plomo_diferencia(
    id_plomo varchar(50) NOT NULL,
    id_cartaporte varchar(13) NULL,
    D0010 integer NULL,
    D0050 integer NULL,
    D0100 integer NULL,
    D0125 integer NULL,
    D0250 integer NULL,
    D0500 integer NULL,
    D10 integer NULL,
    D100 integer NULL,
    D1000 integer NULL,
    D2 integer NULL,
    D20 integer NULL,
    D5 integer NULL,
    D50 integer NULL,
    F0010 integer NULL,
    F0050 integer NULL,
    F0100 integer NULL,
    F0125 integer NULL,
    F0250 integer NULL,
    F0500 integer NULL,
    F10 integer NULL,
    F100 integer NULL,
    F1000 integer NULL,
    F2 integer NULL,
    F20 integer NULL,
    F5 integer NULL,
    F50 integer NULL,
    supervisor varchar(50) NULL
);


CREATE TABLE _precinto(
    id_precinto integer  NOT NULL,
    co_precinto varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_precinto PRIMARY KEY (id_precinto)
); 


--ubicaciones / tipo Ubicacon
CREATE TABLE punto(
    id_punto integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nu_punto integer NULL,
    nb_punto varchar(250) NOT NULL,
    tx_ireccion text NOT NULL,
    tx_telefono numeric(18, 0) NULL,
    tx_telefono2 numeric(18, 0) NULL,
    tx_telefono3 numeric(18, 0) NULL,
    tx_contacto varchar(250) NULL,
    id_cuenta integer NOT NULL,
    id_rubro integer NULL,
    nu_orden integer NULL,
    co_cajero varchar(50) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_punto PRIMARY KEY (id_punto)
) ;

CREATE TABLE punto_efectivo(
    id_punto_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_punto integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    fe_revision timestamp without time zone NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_punto_efectivo PRIMARY KEY (id_punto_efectivo)
) ;


CREATE TABLE razon(
    id_razon integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_razon varchar(200) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_razon PRIMARY KEY (id_razon)
) ;


CREATE TABLE rubro(
    id_rubro integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_rubro varchar(250) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_rubro PRIMARY KEY (id_rubro)
) ;



CREATE TABLE ruta(
    id_ruta integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_ruta varchar(50) NOT NULL,
    fe_ruta timestamp without time zone NOT NULL,
    tx_turno varchar(2) NOT NULL,
    id_oficial_val varchar(50) NULL,
    id_auxiliar_val varchar(50) NULL,
    id_guardia_cust varchar(50) NULL,
    id_oficial_val2 varchar(50) NULL,
    id_unidad varchar(50) NULL,
    ca_carteras integer NULL,
    ca_cambio integer NULL,
    ca_km_salida numeric(18, 2) NULL,
    ca_km_llegada numeric(18, 2) NULL,
    ca_ks_total numeric(18, 2) NULL,
    bo_cierre boolean NULL,
    bo_recibida boolean NULL,
    bo_despacho boolean NULL,
    id_usu_creado timestamp without time zone NOT NULL,
    id_usu_cierre varchar(30) NULL,
    id_usu_despacho varchar(30) NULL,
    id_usu_recibo varchar(30) NULL,
    fe_cierre timestamp without time zone NULL,
    fe_despacho timestamp without time zone NULL,
    fe_recibo timestamp without time zone NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_ruta PRIMARY KEY (id_ruta)
) ;

CREATE TABLE ruta_cartaporte(
    id_ruta_cartaporte integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_ruta integer NOT NULL,
    id_cartaporte varchar(13) NOT NULL,
    id_tipo integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_ruta_cartaporte PRIMARY KEY (id_ruta_cartaporte)
) ;

CREATE TABLE servicio(
    id_servicio integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_servicio varchar(100) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_servicio PRIMARY KEY (id_servicio)
) ;

CREATE TABLE solicitud(
    id_solicitud integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_tipo_solicitud integer NOT NULL,
    id_cuenta integer NOT NULL,
    id_cliente integer NOT NULL,
    id_consignador integer NOT NULL,
    id_consignatario integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    id_operacion integer NULL,
    bo_aprobado boolean NULL,
    id_boveda integer NULL,
    id_rubro integer NULL,
    id_tipo varchar(50) NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud PRIMARY KEY (id_solicitud)
);




CREATE TABLE solicitud_accion(
    id_solicitud_accion integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NULL,
    id_tipo integer NULL,
    nu_orden integer NULL,
    id_usu_cierre varchar(50) NULL,
    fe_cierre timestamp without time zone NULL,
    id_boveda integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
CONSTRAINT pk_solicitud_accion PRIMARY KEY (id_solicitud_accion)
);


CREATE TABLE solicitud_cartaporte(
    id_solicitud_cartaporte integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NOT NULL,
    id_cartaporte varchar(13) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_cartaporte PRIMARY KEY (id_solicitud_cartaporte )
);


CREATE TABLE solicitud_envase(
    id_solicitud_envase integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_envase integer  NOT NULL,
    id_solicitud integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_envase PRIMARY KEY (id_solicitud_envase )
) ;


CREATE TABLE solicitud_envase_efectivo(
    id_solicitud_envase_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_envase integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_envase_efectivo PRIMARY KEY (	id_solicitud_envase_efectivo)
) ;

CREATE TABLE _solicitud_envases(
    Cantidad integer NOT NULL,
    id_solicitud nchar(10) NOT NULL,
    mo_total numeric(18, 3) NOT NULL
) ;

CREATE TABLE _solicitud_operacion(
    id_operacion integer NOT NULL,
    id_solicitud integer NOT NULL
) ;

CREATE TABLE _solicitud_deposito(
    id_solicitud integer NOT NULL,
    id_deposito integer NOT NULL
) ;

CREATE TABLE _solicitud_efectivo(
    id_solicitud integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    ca_piezas integer NOT NULL,
    mo_ numeric(18, 3) NOT NULL,
 CONSTRAINT pk_solicitud_efectivo PRIMARY KEY (	id_solicitud )
 ) ;


CREATE TABLE solicitud_ruta(
    id_solicitud_ruta integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NOT NULL,
    id_ruta integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_ruta PRIMARY KEY (	id_solicitud_ruta )
) ;

CREATE TABLE solicitud_servicio(
    id_solicitud_servicio integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_tipo integer NOT NULL,
    id_servicio integer NOT NULL,
    id_solicitud integer NOT NULL,
    id_operador integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_servicio PRIMARY KEY (	id_solicitud_servicio )
) ;

CREATE TABLE solicitud_traspaso(
    id_solicitud_traspaso integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_solicitud integer NOT NULL,
    id_transpaso integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_solicitud_traspaso PRIMARY KEY (	id_solicitud_traspaso)
) ;

CREATE TABLE supervisor(
    id_supervisor integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    nb_supervisor varchar(50) NULL,
    co_pass varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_supervisor PRIMARY KEY (	id_supervisor )
);

CREATE TABLE traspaso(
    id_traspaso integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_boveda_emisor integer NOT NULL,
    id_boveda_receptor integer NOT NULL,
    id_usu_emisor integer NOT NULL,
    id_usu_receptor integer NOT NULL,
    fe_emisor timestamp without time zone NOT NULL,
    fe_receptor timestamp without time zone NULL,
    bo_recibido boolean NOT NULL,
    nu_deposito integer NULL,
    id_tipo integer NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso PRIMARY KEY (id_transpaso)
);

CREATE TABLE traspaso_bloque(
    id_traspaso_bloque integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_bloque varchar(50) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_bloque PRIMARY KEY (id_traspaso_bloque)
);


CREATE TABLE _traspaso_bolsa(
    id_transpaso integer NOT NULL,
    id_bolsa varchar(50) NOT NULL,
 CONSTRAINT pk_traspaso_bolsa PRIMARY KEY (id_transpaso)
);

CREATE TABLE traspaso_caja(
    id_traspaso_caja integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer  NOT NULL,
    id_caja integer NOT NULL,
    id_boveda integer NOT NULL,
    id_usu_emisor varchar(30) NOT NULL,
    fe_emisor timestamp without time zone NOT NULL,
    id_usu_receptor varchar(30) NULL,
    fe_receptor timestamp without time zone NULL,
    bo_recibido boolean NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_caja PRIMARY KEY (id_transpaso )
) ;


CREATE TABLE traspaso_cartaporte(
    id_traspaso_cartaporte integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_cartaporte varchar(13) NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_cartaporte PRIMARY KEY (id_traspaso_cartaporte)
) ;

CREATE TABLE traspaso_efectivo(
    id_traspaso_efectivo integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    ca_piezas integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_efectivo PRIMARY KEY (id_traspaso_efectivo)
) ;

CREATE TABLE traspaso_efectivo_caja(
    id_traspaso_efectivo_caja integer NOT NULL DEFAULT nextval('pagos.ingreso_id_ingreso_seq'::regclass),
    id_transpaso integer NOT NULL,
    id_efectivo varchar(5) NOT NULL,
    mo_total numeric(18, 3) NOT NULL,
    ca_piezas integer NOT NULL,
    tx_observacion varchar(200) NULL,
    id_usuario integer NOT NULL,
    id_status integer NOT NULL,
    fe_creado timestamp without time zone,
    fe_actualizado timestamp without time zone,
 CONSTRAINT pk_traspaso_efectivo_caja PRIMARY KEY (id_traspaso_efectivo_caja )
) ;

/*

CREATE VIEW vw_cartaporte
AS
SELECT     cartaporte.id_boveda, cartaporte.id_rubro, Rubro.Definicion, Cuenta.nb_ AS Cuenta, Cuenta.id_cuenta, 
                      Cuenta.nb_ AS Cuentanb_, cartaporte.id_cartaporte, ConsignadorR.id_punto AS id_consignador, Consignador.nb_ AS Consignador, 
                      ConsignadorR.fe_ AS Consignadorfe_, ConsignatarioR.id_punto AS id_consignatario, Consignatario.nb_ AS Consignatario, 
                      ConsignatarioR.fe_ AS Consignatariofe_, cartaporte.mo_, cartaporte.fe_creado, cartaporte.id_usu_cierre, 
                      cartaporte.fe_Creado, cartaporte.fe_cierre, cartaporte.bo_cerrado, cartaporte.ca_envase, cartaporte.nu_plomo AS plomo,
                          (SELECT     COUNT(DISTINCT id_envase) AS Expr1
                            FROM          envase
                            WHERE      (id_cartaporte = cartaporte.id_cartaporte)) AS envases,
                          (SELECT     TOP (1) nu_plomo
                            FROM          envase AS envase_2
                            WHERE      (id_cartaporte = cartaporte.id_cartaporte)) AS nu_plomo,
                          (SELECT     SUM(produccion.envase_efectivo.mo_) AS Expr1
                            FROM          envase_efectivo INNER JOIN
                                                   envase AS envase_1 ON envase_efectivo.id_envase = envase_1.id_envase
                            WHERE      (envase_1.id_cartaporte = cartaporte.id_cartaporte)) AS mo_Real
FROM         cartaporte INNER JOIN
                      Rubro ON Rubro.id_rubro = cartaporte.id_rubro INNER JOIN
                      Cuenta ON cartaporte.id_cuenta = Cuenta.id_cuenta INNER JOIN
                      cartaporte_punto AS ConsignadorR ON cartaporte.id_cartaporte = ConsignadorR.id_cartaporte AND ConsignadorR.Tipo = 1 INNER JOIN
                      punto AS Consignador ON ConsignadorR.id_punto = Consignador.id_punto INNER JOIN
                      cartaporte_punto AS ConsignatarioR ON cartaporte.id_cartaporte = ConsignatarioR.id_cartaporte AND ConsignatarioR.Tipo = 2 INNER JOIN
                      punto AS Consignatario ON ConsignatarioR.id_punto = Consignatario.id_punto






CREATE VIEW vw_cartaporte_bloque
AS
SELECT     cartaporte.id_boveda, cartaporte.id_rubro, Rubro.Definicion, Cuenta.nb_ AS Cuenta, Cuenta.id_cuenta, 
                      Cuenta.nb_ AS Cuentanb_, cartaporte.id_cartaporte, ConsignadorR.id_punto AS id_consignador, Consignador.nb_ AS Consignador, 
                      ConsignadorR.fe_ AS Consignadorfe_, ConsignatarioR.id_punto AS id_consignatario, Consignatario.nb_ AS Consignatario, 
                      ConsignatarioR.fe_ AS Consignatariofe_, cartaporte.mo_, cartaporte.fe_creado, cartaporte.id_usu_cierre, 
                      cartaporte.fe_Creado, cartaporte.fe_cierre, cartaporte.bo_cerrado,
                          (SELECT     COUNT(DISTINCT id_bloque) AS ExprB
                            FROM          bloque
                            WHERE      (id_cartaporte = cartaporte.id_cartaporte)) AS bloques,
                          (SELECT     COUNT(DISTINCT id_envase) AS Expr1
                            FROM          envase
                            WHERE      (id_cartaporte = cartaporte.id_cartaporte)) AS envases,
                          (SELECT     TOP (1) nu_plomo
                            FROM          envase AS envase_2
                            WHERE      (id_cartaporte = cartaporte.id_cartaporte)) AS nu_plomo,
                          (SELECT     SUM(produccion.envase_efectivo.mo_) AS Expr1
                            FROM          envase_efectivo INNER JOIN
                                                   envase AS envase_1 ON envase_efectivo.id_envase = envase_1.id_envase
                            WHERE      (envase_1.id_cartaporte = cartaporte.id_cartaporte)) AS mo_Real
FROM         cartaporte INNER JOIN
                      bloque AS bloque_1 ON bloque_1.id_cartaporte = cartaporte.id_cartaporte INNER JOIN
                      Rubro ON Rubro.id_rubro = cartaporte.id_rubro INNER JOIN
                      Cuenta ON cartaporte.id_cuenta = Cuenta.id_cuenta INNER JOIN
                      cartaporte_punto AS ConsignadorR ON cartaporte.id_cartaporte = ConsignadorR.id_cartaporte AND ConsignadorR.Tipo = 1 INNER JOIN
                      punto AS Consignador ON ConsignadorR.id_punto = Consignador.id_punto INNER JOIN
                      cartaporte_punto AS ConsignatarioR ON cartaporte.id_cartaporte = ConsignatarioR.id_cartaporte AND ConsignatarioR.Tipo = 2 INNER JOIN
                      punto AS Consignatario ON ConsignatarioR.id_punto = Consignatario.id_punto







CREATE VIEW vw_Differencias
AS
SELECT punto.nb_ AS Estacion,
       (SELECT TOP 1 mo_
       FROM   diferencia
       WHERE  diferencia.id_punto = punto.id_punto
       ORDER BY id_diferencia DESC) AS mo_,
       punto.id_punto
FROM   biblia
JOIN   punto
ON     biblia.id_punto = punto.id_punto
GROUP  BY punto.nb_,
       punto.id_punto







CREATE VIEW vw_efectivo
AS
SELECT boveda_efectivo.id_boveda, 
       boveda_efectivo.id_efectivo, 
       boveda_efectivo.ca_piezas AS PiezasTotal, 
       boveda_efectivo.mo_ AS mo_Total,
       efectivo.id_tipo_efectivo, 
       efectivo.Denominacion, 
       efectivo.ImagePath, 
       efectivo.EstaActivo,
       SUM(ISNULL(traspaso_efectivo.Piezas,0)) AS Piezomprometidas,
       SUM(ISNULL(traspaso_efectivo.mo_,0)) AS mo_Comprometido,
       boveda_efectivo.ca_piezas  -  SUM(ISNULL(traspaso_efectivo.Piezas,0)) AS PiezasDisponibles, 
       boveda_efectivo.mo_ - SUM(ISNULL(traspaso_efectivo.mo_,0))AS mo_Disponible
FROM   boveda_efectivo
JOIN   efectivo
ON     boveda_efectivo.id_efectivo	= efectivo.id_efectivo	
LEFT   JOIN traspaso
ON     boveda_efectivo.id_boveda = traspaso.bovedaEmisorID 
AND    traspaso.Recibido = 0
LEFT   JOIN   traspaso_efectivo
ON     traspaso_efectivo.id_efectivo = boveda_efectivo.id_efectivo
AND    traspaso.id_transpaso = traspaso_efectivo.id_transpaso
GROUP  BY boveda_efectivo.id_boveda, 
          boveda_efectivo.id_efectivo, 
          boveda_efectivo.Piezas, 
          boveda_efectivo.mo_,
          efectivo.id_tipo_efectivo, 
          efectivo.Denominacion, 
          efectivo.ImagePath, 
          efectivo.EstaActivo






CREATE VIEW vw_efectivocaja
AS
SELECT     caja_efectivo.id_caja, caja_efectivo.id_efectivo, caja_efectivo.ca_piezas AS PiezasTotal, caja_efectivo.mo_ AS mo_Total, 
                      efectivo.id_tipo_efectivo, efectivo.Denominacion, efectivo.ImagePath, efectivo.EstaActivo, SUM(ISNULL(produccion.traspaso_efectivo_caja.Piezas, 0)) 
                      AS Piezomprometidas, SUM(ISNULL(produccion.traspaso_efectivo_caja.mo_, 0)) AS mo_Comprometido, 
                      caja_efectivo.ca_piezas - SUM(ISNULL(produccion.traspaso_efectivo_caja.Piezas, 0)) AS PiezasDisponibles, 
                      caja_efectivo.mo_ - SUM(ISNULL(produccion.traspaso_efectivo_caja.mo_, 0)) AS mo_Disponible
FROM         caja_efectivo INNER JOIN
                      efectivo ON caja_efectivo.id_efectivo = efectivo.id_efectivo LEFT OUTER JOIN
                      traspaso_caja ON caja_efectivo.id_caja = traspaso_caja.cajaEmisorID AND traspaso_caja.Recibido = 0 LEFT OUTER JOIN
                      traspaso_efectivo_caja ON traspaso_efectivo_caja.id_efectivo = caja_efectivo.id_efectivo AND 
                      traspaso_caja.id_transpaso = traspaso_efectivo_caja.id_transpaso
GROUP BY caja_efectivo.id_caja, caja_efectivo.id_efectivo, caja_efectivo.Piezas, caja_efectivo.mo_, efectivo.id_tipo_efectivo, 
                      efectivo.Denominacion, efectivo.ImagePath, efectivo.EstaActivo


ALTER TABLE acta_envase ADD  CONSTRAINT DF_acta_envase_nu_plomo  DEFAULT ('N/A') FOR nu_plomo

ALTER TABLE acta_envase ADD  CONSTRAINT DF_acta_envase_bo_abierto  DEFAULT ((0)) FOR bo_abierto

ALTER TABLE acta_envase ADD  CONSTRAINT DF_acta_envase_bo_defectuoso  DEFAULT ((0)) FOR bo_defectuoso

ALTER TABLE arqueo ADD  CONSTRAINT DF_arqueo_bo_cerrado  DEFAULT ((0)) FOR bo_cerrado

ALTER TABLE arqueo ADD  CONSTRAINT DF_arqueo_bo_sistema  DEFAULT ((0)) FOR bo_sistema

ALTER TABLE arqueo ADD  CONSTRAINT DF_arqueo_id_rubro  DEFAULT ((1)) FOR id_rubro

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_0_10  DEFAULT ((0)) FOR LUN_0_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_0_50  DEFAULT ((0)) FOR LUN_0_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_1  DEFAULT ((0)) FOR LUN_1

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_0_101  DEFAULT ((0)) FOR MAR_0_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_0_501  DEFAULT ((0)) FOR MAR_0_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_11  DEFAULT ((0)) FOR MAR_1

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_0_101  DEFAULT ((0)) FOR MIE_0_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_0_501  DEFAULT ((0)) FOR MIE_0_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_11  DEFAULT ((0)) FOR MIE_1

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_0_101  DEFAULT ((0)) FOR JUE_0_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_0_501  DEFAULT ((0)) FOR JUE_0_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_11  DEFAULT ((0)) FOR JUE_1

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_0_101  DEFAULT ((0)) FOR VIE_0_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_0_501  DEFAULT ((0)) FOR VIE_0_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_11  DEFAULT ((0)) FOR VIE_1

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_0_101  DEFAULT ((0)) FOR SAB_0_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_0_501  DEFAULT ((0)) FOR SAB_0_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_11  DEFAULT ((0)) FOR SAB_1

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_0_102  DEFAULT ((0)) FOR DOM_0_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_0_502  DEFAULT ((0)) FOR DOM_0_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_12  DEFAULT ((0)) FOR DOM_1

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_Tipo  DEFAULT ('Metro') FOR Tipo

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_Lun_5  DEFAULT ((0)) FOR LUN_5

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_2  DEFAULT ((0)) FOR LUN_2

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_5  DEFAULT ((0)) FOR MAR_5

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_2  DEFAULT ((0)) FOR MAR_2

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_5  DEFAULT ((0)) FOR MIE_5

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_2  DEFAULT ((0)) FOR MIE_2

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_5  DEFAULT ((0)) FOR JUE_5

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_2  DEFAULT ((0)) FOR JUE_2

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_5  DEFAULT ((0)) FOR VIE_5

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_2  DEFAULT ((0)) FOR VIE_2

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_5  DEFAULT ((0)) FOR SAB_5

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_2  DEFAULT ((0)) FOR SAB_2

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_5  DEFAULT ((0)) FOR DOM_5

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_2  DEFAULT ((0)) FOR DOM_2

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_CONO_ANTERIOR  DEFAULT ((1)) FOR CONO_ANTERIOR

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_10  DEFAULT ((0)) FOR LUN_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_50  DEFAULT ((0)) FOR LUN_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_100  DEFAULT ((0)) FOR LUN_100

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_10  DEFAULT ((0)) FOR MAR_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_50  DEFAULT ((0)) FOR MAR_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_100  DEFAULT ((0)) FOR MAR_100

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_10  DEFAULT ((0)) FOR MIE_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_50  DEFAULT ((0)) FOR MIE_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_100  DEFAULT ((0)) FOR MIE_100

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_10  DEFAULT ((0)) FOR JUE_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_50  DEFAULT ((0)) FOR JUE_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_100  DEFAULT ((0)) FOR JUE_100

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_10  DEFAULT ((0)) FOR VIE_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_50  DEFAULT ((0)) FOR VIE_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_100  DEFAULT ((0)) FOR VIE_100

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_10  DEFAULT ((0)) FOR SAB_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_50  DEFAULT ((0)) FOR SAB_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_100  DEFAULT ((0)) FOR SAB_100

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_10  DEFAULT ((0)) FOR DOM_10

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_50  DEFAULT ((0)) FOR DOM_50

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_100  DEFAULT ((0)) FOR DOM_100

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_500  DEFAULT ((0)) FOR LUN_500

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_1000  DEFAULT ((0)) FOR LUN_1000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_2000  DEFAULT ((0)) FOR LUN_2000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_5000  DEFAULT ((0)) FOR LUN_5000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_10000  DEFAULT ((0)) FOR LUN_10000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_LUN_20000  DEFAULT ((0)) FOR LUN_20000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_500  DEFAULT ((0)) FOR MAR_500

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_1000  DEFAULT ((0)) FOR MAR_1000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_2000  DEFAULT ((0)) FOR MAR_2000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_5000  DEFAULT ((0)) FOR MAR_5000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_10000  DEFAULT ((0)) FOR MAR_10000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MAR_20000  DEFAULT ((0)) FOR MAR_20000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_500  DEFAULT ((0)) FOR MIE_500

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_1000  DEFAULT ((0)) FOR MIE_1000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_2000  DEFAULT ((0)) FOR MIE_2000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_5000  DEFAULT ((0)) FOR MIE_5000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_10000  DEFAULT ((0)) FOR MIE_10000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_MIE_20000  DEFAULT ((0)) FOR MIE_20000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_500  DEFAULT ((0)) FOR JUE_500

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_1000  DEFAULT ((0)) FOR JUE_1000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_2000  DEFAULT ((0)) FOR JUE_2000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_5000  DEFAULT ((0)) FOR JUE_5000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_10000  DEFAULT ((0)) FOR JUE_10000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_JUE_20000  DEFAULT ((0)) FOR JUE_20000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_500  DEFAULT ((0)) FOR VIE_500

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_1000  DEFAULT ((0)) FOR VIE_1000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_2000  DEFAULT ((0)) FOR VIE_2000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_5000  DEFAULT ((0)) FOR VIE_5000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_10000  DEFAULT ((0)) FOR VIE_10000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_VIE_20000  DEFAULT ((0)) FOR VIE_20000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_500  DEFAULT ((0)) FOR SAB_500

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_1000  DEFAULT ((0)) FOR SAB_1000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_2000  DEFAULT ((0)) FOR SAB_2000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_5000  DEFAULT ((0)) FOR SAB_5000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_10000  DEFAULT ((0)) FOR SAB_10000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_SAB_20000  DEFAULT ((0)) FOR SAB_20000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_500  DEFAULT ((0)) FOR DOM_500

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_1000  DEFAULT ((0)) FOR DOM_1000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_2000  DEFAULT ((0)) FOR DOM_2000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_5000  DEFAULT ((0)) FOR DOM_5000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_10000  DEFAULT ((0)) FOR DOM_10000

ALTER TABLE biblia ADD  CONSTRAINT DF_biblia_DOM_20000  DEFAULT ((0)) FOR DOM_20000

ALTER TABLE bloque ADD  CONSTRAINT DF_bloque_bo_abierto  DEFAULT ((0)) FOR bo_abierto

ALTER TABLE boveda_efectivo_pendiente ADD  CONSTRAINT DF_boveda_efectivo_pendiente_fe_Ultima  DEFAULT (getdate()) FOR fe_Ultima

ALTER TABLE boveda_historial ADD  CONSTRAINT DF_boveda_historial_deuda  DEFAULT ((0)) FOR deuda

ALTER TABLE boveda_historial ADD  CONSTRAINT DF_boveda_historial_PorPagar  DEFAULT ((0)) FOR PorPagar

ALTER TABLE cartaporte ADD  CONSTRAINT DF_cartaporte_bo_cerrado  DEFAULT ((0)) FOR bo_cerrado

ALTER TABLE cartaporte ADD  CONSTRAINT DF_cartaporte_bo_sistema  DEFAULT ((0)) FOR bo_sistema

ALTER TABLE cartaporte ADD  CONSTRAINT DF_cartaporte_id_rubro  DEFAULT ((1)) FOR id_rubro

ALTER TABLE Cuenta ADD  CONSTRAINT DF_Cuenta_Activo  DEFAULT ((0)) FOR Activo

ALTER TABLE deposito ADD  CONSTRAINT DF_deposito_Cnu_ID  DEFAULT ((1)) FOR Cnu_ID

ALTER TABLE deposito ADD  CONSTRAINT DF_deposito_id_banco  DEFAULT ((1)) FOR id_banco

ALTER TABLE diferenciaC ADD  CONSTRAINT DF_diferenciaC_Activo  DEFAULT ((0)) FOR Activo

ALTER TABLE efectivo ADD  CONSTRAINT DF_efectivo_EstaActivo  DEFAULT ((1)) FOR EstaActivo

ALTER TABLE envase ADD  CONSTRAINT DF_envase_nu_plomo  DEFAULT ('N/A') FOR nu_plomo

ALTER TABLE envase ADD  CONSTRAINT DF_envase_bo_abierto  DEFAULT ((0)) FOR bo_abierto

ALTER TABLE envase ADD  CONSTRAINT DF_envase_bo_defectuoso  DEFAULT ((0)) FOR bo_defectuoso

ALTER TABLE envase_arqueo ADD  CONSTRAINT DF_envase_arqueo_bo_abierto  DEFAULT ((0)) FOR bo_abierto

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D0010  DEFAULT ((0)) FOR D0010

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D0050  DEFAULT ((0)) FOR D0050

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D0100  DEFAULT ((0)) FOR D0100

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D0125  DEFAULT ((0)) FOR D0125

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D0250  DEFAULT ((0)) FOR D0250

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D0500  DEFAULT ((0)) FOR D0500

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D10  DEFAULT ((0)) FOR D10

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D100  DEFAULT ((0)) FOR D100

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D1000  DEFAULT ((0)) FOR D1000

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D2  DEFAULT ((0)) FOR D2

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D20  DEFAULT ((0)) FOR D20

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D5  DEFAULT ((0)) FOR D5

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_D50  DEFAULT ((0)) FOR D50

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F0010  DEFAULT ((0)) FOR F0010

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F0050  DEFAULT ((0)) FOR F0050

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F0100  DEFAULT ((0)) FOR F0100

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F0125  DEFAULT ((0)) FOR F0125

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F0250  DEFAULT ((0)) FOR F0250

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F0500  DEFAULT ((0)) FOR F0500

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F10  DEFAULT ((0)) FOR F10

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F100  DEFAULT ((0)) FOR F100

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F1000  DEFAULT ((0)) FOR F1000

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F2  DEFAULT ((0)) FOR F2

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F20  DEFAULT ((0)) FOR F20

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F5  DEFAULT ((0)) FOR F5

ALTER TABLE nu_plomo ADD  CONSTRAINT DF_plomo_F50  DEFAULT ((0)) FOR F50

ALTER TABLE ruta ADD  CONSTRAINT DF_ruta_bo_cerrado  DEFAULT ((0)) FOR Cerrada

ALTER TABLE ruta ADD  CONSTRAINT DF_ruta_Despachada  DEFAULT ((0)) FOR Despachada

ALTER TABLE ruta ADD  CONSTRAINT DF_ruta_Recibida  DEFAULT ((0)) FOR Recibida

ALTER TABLE traspaso ADD  CONSTRAINT DF_traspaso_Recibido  DEFAULT ((0)) FOR Recibido

ALTER TABLE traspaso ADD  CONSTRAINT DF_traspaso_Tipo  DEFAULT ((0)) FOR Tipo

ALTER TABLE traspaso_caja ADD  CONSTRAINT DF_traspaso_caja_Recibido  DEFAULT ((0)) FOR Recibido

ALTER TABLE arqueo_punto  WITH CHECK ADD  CONSTRAINT FK_arqueo_punto_arqueo FOREIGN KEY(id_arqueo)
REFERENCES arqueo (id_arqueo)
ON UPDATE CADE
ON DELETE CADE

ALTER TABLE arqueo_punto CHECK CONSTRAINT FK_arqueo_punto_arqueo

ALTER TABLE arqueo_punto  WITH CHECK ADD  CONSTRAINT FK_arqueo_punto_punto FOREIGN KEY(id_punto)
REFERENCES punto (id_punto)

ALTER TABLE arqueo_punto CHECK CONSTRAINT FK_arqueo_punto_punto

ALTER TABLE bloque_efectivo  WITH CHECK ADD  CONSTRAINT FK_bloque_efectivo_bloque FOREIGN KEY(id_bloque)
REFERENCES bloque (id_bloque)
ON DELETE CADE

ALTER TABLE bloque_efectivo CHECK CONSTRAINT FK_bloque_efectivo_bloque

ALTER TABLE bloque_efectivo  WITH CHECK ADD  CONSTRAINT FK_bloque_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE bloque_efectivo CHECK CONSTRAINT FK_bloque_efectivo_efectivo

ALTER TABLE boveda_efectivo  WITH CHECK ADD  CONSTRAINT FK_boveda_efectivo_boveda FOREIGN KEY(id_boveda)
REFERENCES boveda (id_boveda)

ALTER TABLE boveda_efectivo CHECK CONSTRAINT FK_boveda_efectivo_boveda

ALTER TABLE boveda_efectivo  WITH CHECK ADD  CONSTRAINT FK_boveda_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE boveda_efectivo CHECK CONSTRAINT FK_boveda_efectivo_efectivo

ALTER TABLE caja_efectivo  WITH CHECK ADD  CONSTRAINT FK_caja_efectivo_caja FOREIGN KEY(id_caja)
REFERENCES caja (id_caja)

ALTER TABLE caja_efectivo CHECK CONSTRAINT FK_caja_efectivo_caja

ALTER TABLE caja_efectivo  WITH CHECK ADD  CONSTRAINT FK_caja_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE caja_efectivo CHECK CONSTRAINT FK_caja_efectivo_efectivo

ALTER TABLE caja_Historial  WITH CHECK ADD  CONSTRAINT FK_caja_Historial_caja FOREIGN KEY(id_caja)
REFERENCES caja (id_caja)

ALTER TABLE caja_Historial CHECK CONSTRAINT FK_caja_Historial_caja

ALTER TABLE cartaporte_punto  WITH CHECK ADD  CONSTRAINT FK_cartaporte_punto_cartaporte FOREIGN KEY(id_cartaporte)
REFERENCES cartaporte (id_cartaporte)
ON UPDATE CADE
ON DELETE CADE

ALTER TABLE cartaporte_punto CHECK CONSTRAINT FK_cartaporte_punto_cartaporte

ALTER TABLE cartaporte_punto  WITH CHECK ADD  CONSTRAINT FK_cartaporte_punto_punto FOREIGN KEY(id_punto)
REFERENCES punto (id_punto)

ALTER TABLE cartaporte_punto CHECK CONSTRAINT FK_cartaporte_punto_punto

ALTER TABLE Cuenta  WITH CHECK ADD  CONSTRAINT FK_Cuenta_boveda FOREIGN KEY(id_boveda)
REFERENCES boveda (id_boveda)

ALTER TABLE Cuenta CHECK CONSTRAINT FK_Cuenta_boveda

ALTER TABLE Cuenta_efectivo  WITH CHECK ADD  CONSTRAINT FK_Cuenta_efectivo_Cuenta FOREIGN KEY(id_cuenta)
REFERENCES Cuenta (id_cuenta)
ON UPDATE CADE
ON DELETE CADE

ALTER TABLE Cuenta_efectivo CHECK CONSTRAINT FK_Cuenta_efectivo_Cuenta

ALTER TABLE Cuenta_efectivo  WITH CHECK ADD  CONSTRAINT FK_Cuenta_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE Cuenta_efectivo CHECK CONSTRAINT FK_Cuenta_efectivo_efectivo

ALTER TABLE deuda  WITH CHECK ADD  CONSTRAINT FK_deuda_punto FOREIGN KEY(id_punto)
REFERENCES punto (id_punto)

ALTER TABLE deuda CHECK CONSTRAINT FK_deuda_punto

ALTER TABLE diferencia  WITH CHECK ADD  CONSTRAINT FK_diferencia_punto FOREIGN KEY(id_punto)
REFERENCES punto (id_punto)

ALTER TABLE diferencia CHECK CONSTRAINT FK_diferencia_punto

ALTER TABLE efectivo  WITH CHECK ADD  CONSTRAINT FK_efectivo_tipo_efectivo FOREIGN KEY(id_tipo_efectivo)
REFERENCES tipo_efectivo (id_tipo_efectivo)

ALTER TABLE efectivo CHECK CONSTRAINT FK_efectivo_tipo_efectivo

ALTER TABLE envase  WITH CHECK ADD  CONSTRAINT FK_envase_cartaporte FOREIGN KEY(id_cartaporte)
REFERENCES cartaporte (id_cartaporte)
ON UPDATE CADE
ON DELETE CADE

ALTER TABLE envase CHECK CONSTRAINT FK_envase_cartaporte

ALTER TABLE envase_arqueo_efectivo  WITH CHECK ADD  CONSTRAINT FK_envase_arqueo_efectivo_Cajetin FOREIGN KEY(id_cajetin)
REFERENCES Cajetin (ID)

ALTER TABLE envase_arqueo_efectivo CHECK CONSTRAINT FK_envase_arqueo_efectivo_Cajetin

ALTER TABLE envase_arqueo_efectivo  WITH CHECK ADD  CONSTRAINT FK_envase_arqueo_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE envase_arqueo_efectivo CHECK CONSTRAINT FK_envase_arqueo_efectivo_efectivo

ALTER TABLE envase_arqueo_efectivo  WITH CHECK ADD  CONSTRAINT FK_envase_arqueo_efectivo_envase FOREIGN KEY(envase_id_arqueo)
REFERENCES envase_arqueo (envase_id_arqueo)
ON DELETE CADE

ALTER TABLE envase_arqueo_efectivo CHECK CONSTRAINT FK_envase_arqueo_efectivo_envase

ALTER TABLE envase_arqueo_efectivo  WITH CHECK ADD  CONSTRAINT FK_envase_arqueo_efectivo_modulo FOREIGN KEY(id_modulo)
REFERENCES modulo (ID)

ALTER TABLE envase_arqueo_efectivo CHECK CONSTRAINT FK_envase_arqueo_efectivo_modulo

ALTER TABLE envase_efectivo  WITH CHECK ADD  CONSTRAINT FK_envase_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE envase_efectivo CHECK CONSTRAINT FK_envase_efectivo_efectivo

ALTER TABLE envase_efectivo  WITH CHECK ADD  CONSTRAINT FK_envase_efectivo_envase FOREIGN KEY(id_envase)
REFERENCES envase (id_envase)
ON DELETE CADE

ALTER TABLE envase_efectivo CHECK CONSTRAINT FK_envase_efectivo_envase

ALTER TABLE nu_plomo  WITH CHECK ADD  CONSTRAINT FK_plomo_diferenciaC FOREIGN KEY(id_diferencia)
REFERENCES diferenciaC (id_diferencia)

ALTER TABLE nu_plomo CHECK CONSTRAINT FK_plomo_diferenciaC

ALTER TABLE ruta_cartaporte  WITH CHECK ADD  CONSTRAINT FK_ruta_cartaporte_cartaporte FOREIGN KEY(id_cartaporte)
REFERENCES cartaporte (id_cartaporte)
ON DELETE CADE

ALTER TABLE ruta_cartaporte CHECK CONSTRAINT FK_ruta_cartaporte_cartaporte

ALTER TABLE ruta_cartaporte  WITH CHECK ADD  CONSTRAINT FK_ruta_cartaporte_ruta FOREIGN KEY(id_ruta)
REFERENCES ruta (id_ruta)
ON DELETE CADE

ALTER TABLE ruta_cartaporte CHECK CONSTRAINT FK_ruta_cartaporte_ruta

ALTER TABLE solicitud  WITH CHECK ADD  CONSTRAINT FK_solicitud_boveda FOREIGN KEY(id_boveda)
REFERENCES boveda (id_boveda)

ALTER TABLE solicitud CHECK CONSTRAINT FK_solicitud_boveda

ALTER TABLE solicitud_efectivo  WITH CHECK ADD  CONSTRAINT FK_solicitud_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE solicitud_efectivo CHECK CONSTRAINT FK_solicitud_efectivo_efectivo

ALTER TABLE solicitud_efectivo  WITH CHECK ADD  CONSTRAINT FK_solicitud_efectivo_solicitud FOREIGN KEY(id_solicitud)
REFERENCES solicitud (id_solicitud)
ON DELETE CADE

ALTER TABLE solicitud_efectivo CHECK CONSTRAINT FK_solicitud_efectivo_solicitud

ALTER TABLE solicitud_envase  WITH CHECK ADD  CONSTRAINT FK_solicitud_envase_solicitud FOREIGN KEY(id_solicitud)
REFERENCES solicitud (id_solicitud)
ON DELETE CADE

ALTER TABLE solicitud_envase CHECK CONSTRAINT FK_solicitud_envase_solicitud

ALTER TABLE solicitud_envase_efectivo  WITH CHECK ADD  CONSTRAINT FK_solicitud_envase_efectivo_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE solicitud_envase_efectivo CHECK CONSTRAINT FK_solicitud_envase_efectivo_efectivo

ALTER TABLE solicitud_envase_efectivo  WITH CHECK ADD  CONSTRAINT FK_solicitud_envase_efectivo_solicitud_envase FOREIGN KEY(id_envase)
REFERENCES solicitud_envase (id_envase)
ON DELETE CADE

ALTER TABLE solicitud_envase_efectivo CHECK CONSTRAINT FK_solicitud_envase_efectivo_solicitud_envase

ALTER TABLE solicitud_operacion  WITH CHECK ADD  CONSTRAINT FK_solicitud_operacion_operacion FOREIGN KEY(id_operacion)
REFERENCES operacion (id_operacion)

ALTER TABLE solicitud_operacion CHECK CONSTRAINT FK_solicitud_operacion_operacion

ALTER TABLE solicitud_operacion  WITH CHECK ADD  CONSTRAINT FK_solicitud_operacion_solicitud FOREIGN KEY(id_solicitud)
REFERENCES solicitud (id_solicitud)
ON DELETE CADE

ALTER TABLE solicitud_operacion CHECK CONSTRAINT FK_solicitud_operacion_solicitud

ALTER TABLE traspaso_bloque  WITH CHECK ADD  CONSTRAINT FK_traspaso_bloque_bloque FOREIGN KEY(id_bloque)
REFERENCES bloque (id_bloque)
ON DELETE CADE

ALTER TABLE traspaso_bloque CHECK CONSTRAINT FK_traspaso_bloque_bloque

ALTER TABLE traspaso_bloque  WITH CHECK ADD  CONSTRAINT FK_traspaso_bloque_traspaso FOREIGN KEY(id_transpaso)
REFERENCES traspaso (id_transpaso)
ON DELETE CADE

ALTER TABLE traspaso_bloque CHECK CONSTRAINT FK_traspaso_bloque_traspaso

ALTER TABLE traspaso_Bolsa  WITH CHECK ADD  CONSTRAINT FK_traspaso_Bolsa_traspaso FOREIGN KEY(id_transpaso)
REFERENCES traspaso (id_transpaso)
ON DELETE CADE

ALTER TABLE traspaso_Bolsa CHECK CONSTRAINT FK_traspaso_Bolsa_traspaso

ALTER TABLE traspaso_cartaporte  WITH CHECK ADD  CONSTRAINT FK_traspaso_cartaporte_cartaporte FOREIGN KEY(id_cartaporte)
REFERENCES cartaporte (id_cartaporte)
ON DELETE CADE

ALTER TABLE traspaso_cartaporte CHECK CONSTRAINT FK_traspaso_cartaporte_cartaporte

ALTER TABLE traspaso_cartaporte  WITH CHECK ADD  CONSTRAINT FK_traspaso_cartaporte_traspaso FOREIGN KEY(id_transpaso)
REFERENCES traspaso (id_transpaso)
ON DELETE CADE

ALTER TABLE traspaso_cartaporte CHECK CONSTRAINT FK_traspaso_cartaporte_traspaso

ALTER TABLE traspaso_efectivo  WITH CHECK ADD  CONSTRAINT FK_traspaso_efectivo_traspaso FOREIGN KEY(id_transpaso)
REFERENCES traspaso (id_transpaso)
ON DELETE CADE

ALTER TABLE traspaso_efectivo CHECK CONSTRAINT FK_traspaso_efectivo_traspaso

ALTER TABLE traspaso_efectivo_caja  WITH CHECK ADD  CONSTRAINT FK_traspaso_efectivo_caja_efectivo FOREIGN KEY(id_efectivo)
REFERENCES efectivo (id_efectivo)

ALTER TABLE traspaso_efectivo_caja CHECK CONSTRAINT FK_traspaso_efectivo_caja_efectivo

ALTER TABLE traspaso_efectivo_caja  WITH CHECK ADD  CONSTRAINT FK_traspaso_efectivo_caja_traspaso_caja FOREIGN KEY(id_transpaso)
REFERENCES traspaso_caja (id_transpaso)
ON DELETE CADE

ALTER TABLE traspaso_efectivo_caja CHECK CONSTRAINT FK_traspaso_efectivo_caja_traspaso_caja

--refactorizar
CREATE TABLE biblia(
    id_punto integer NOT NULL,
    LUN_0_10 integer NOT NULL,
    LUN_0_50 integer NOT NULL,
    LUN_1 integer NOT NULL,
    MAR_0_10 integer NOT NULL,
    MAR_0_50 integer NOT NULL,
    MAR_1 integer NOT NULL,
    MIE_0_10 integer NOT NULL,
    MIE_0_50 integer NOT NULL,
    MIE_1 integer NOT NULL,
    JUE_0_10 integer NOT NULL,
    JUE_0_50 integer NOT NULL,
    JUE_1 integer NOT NULL,
    VIE_0_10 integer NOT NULL,
    VIE_0_50 integer NOT NULL,
    VIE_1 integer NOT NULL,
    SAB_0_10 integer NOT NULL,
    SAB_0_50 integer NOT NULL,
    SAB_1 integer NOT NULL,
    DOM_0_10 integer NOT NULL,
    DOM_0_50 integer NOT NULL,
    DOM_1 integer NOT NULL,
    ruta varchar(15) NOT NULL,
    Tipo varchar(10) NOT NULL,
    Secuencia integer NULL,
    LUN_5 integer NOT NULL,
    LUN_2 integer NOT NULL,
    MAR_5 integer NOT NULL,
    MAR_2 integer NOT NULL,
    MIE_5 integer NOT NULL,
    MIE_2 integer NOT NULL,
    JUE_5 integer NOT NULL,
    JUE_2 integer NOT NULL,
    VIE_5 integer NOT NULL,
    VIE_2 integer NOT NULL,
    SAB_5 integer NOT NULL,
    SAB_2 integer NOT NULL,
    DOM_5 integer NOT NULL,
    DOM_2 integer NOT NULL,
    CONO_ANTERIOR nvarchar(50) NOT NULL,
    LUN_10 integer NOT NULL,
    LUN_50 integer NOT NULL,
    LUN_100 integer NOT NULL,
    MAR_10 integer NOT NULL,
    MAR_50 integer NOT NULL,
    MAR_100 integer NOT NULL,
    MIE_10 integer NOT NULL,
    MIE_50 integer NOT NULL,
    MIE_100 integer NOT NULL,
    JUE_10 integer NOT NULL,
    JUE_50 integer NOT NULL,
    JUE_100 integer NOT NULL,
    VIE_10 integer NOT NULL,
    VIE_50 integer NOT NULL,
    VIE_100 integer NOT NULL,
    SAB_10 integer NOT NULL,
    SAB_50 integer NOT NULL,
    SAB_100 integer NOT NULL,
    DOM_10 integer NOT NULL,
    DOM_50 integer NOT NULL,
    DOM_100 integer NOT NULL,
    LUN_500 integer NOT NULL,
    LUN_1000 integer NOT NULL,
    LUN_2000 integer NOT NULL,
    LUN_5000 integer NOT NULL,
    LUN_10000 integer NOT NULL,
    LUN_20000 integer NOT NULL,
    MAR_500 integer NOT NULL,
    MAR_1000 integer NOT NULL,
    MAR_2000 integer NOT NULL,
    MAR_5000 integer NOT NULL,
    MAR_10000 integer NOT NULL,
    MAR_20000 integer NOT NULL,
    MIE_500 integer NOT NULL,
    MIE_1000 integer NOT NULL,
    MIE_2000 integer NOT NULL,
    MIE_5000 integer NOT NULL,
    MIE_10000 integer NOT NULL,
    MIE_20000 integer NOT NULL,
    JUE_500 integer NOT NULL,
    JUE_1000 integer NOT NULL,
    JUE_2000 integer NOT NULL,
    JUE_5000 integer NOT NULL,
    JUE_10000 integer NOT NULL,
    JUE_20000 integer NOT NULL,
    VIE_500 integer NOT NULL,
    VIE_1000 integer NOT NULL,
    VIE_2000 integer NOT NULL,
    VIE_5000 integer NOT NULL,
    VIE_10000 integer NOT NULL,
    VIE_20000 integer NOT NULL,
    SAB_500 integer NOT NULL,
    SAB_1000 integer NOT NULL,
    SAB_2000 integer NOT NULL,
    SAB_5000 integer NOT NULL,
    SAB_10000 integer NOT NULL,
    SAB_20000 integer NOT NULL,
    DOM_500 integer NOT NULL,
    DOM_1000 integer NOT NULL,
    DOM_2000 integer NOT NULL,
    DOM_5000 integer NOT NULL,
    DOM_10000 integer NOT NULL,
    DOM_20000 integer NOT NULL,
 CONSTRAINT pk_biblia_1 PRIMARY KEY (id_punto)/*