------------------------- BLOQUE 1
CREATE SEQUENCE sec_persona_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_tipoidentificacion_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_tipopersona_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_rol_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_estado_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_usuario_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_notificacion_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_rolpersona_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_producto_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_categoriaproducto_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_pedido_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_detallespedido_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_metodopago_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

CREATE SEQUENCE sec_factura_id START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

------------------------- BLOQUE 2

CREATE TABLE "persona" (
  "id_persona" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_persona_id_persona')),
  "primer_nombre" varchar(50),
  "segundo_nombre" varchar(50),
  "primer_apellido" varchar(50),
  "segundo_apellido" varchar(50),
  "id_tipo_identificacion" bigint,
  "numero_identificacion" varchar(20),
  "telefono" varchar(15),
  "celular" varchar(20),
  "direccion" varchar(200),
  "correo_electronico" varchar(120),
  "tipo_persona" bigint,
  "fecha_nacimiento" date,
  "genero" "enum(MASCULINO,FEMENINO)",
  "razon_social" varchar(120),
  "nombre_comercial" varchar(150),
  "fecha_constitucion" date,
  "representante_legal" bigint,
  "usuario_creacion" varchar(20),
  "fecha_creacion" datetime,
  "usuario_modificacion" varchar(20),
  "fecha_modificacion" datetime
);

CREATE TABLE "tipo_identificacion" (
  "id_tipo_identificacion" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_tipo_identificacion_id_tipo_identificacion')),
  "tipo_identificacion" varchar(20),
  "codigo" varchar(4),
  "descripcion" varchar(100)
);

CREATE TABLE "tipo_persona" (
  "id_tipo_persona" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_tipo_persona_id_tipo_persona')),
  "tipo_persona" varchar(20),
  "codigo" varchar(4),
  "descripcion" varchar(100)
);

CREATE TABLE "rol" (
  "id_rol" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_rol_id_rol')),
  "rol" varchar(20),
  "codigo" varchar(4),
  "descripcion" varchar(100)
);

CREATE TABLE "estado" (
  "id_estado" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_estado_id_estado')),
  "estado" varchar(30),
  "codigo" varchar(4),
  "descripcion" varchar(100)
);

CREATE TABLE "usuario" (
  "id_usuario" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_usuario_id_usuario')),
  "id_persona" bigint,
  "nombre_usuario" varchar(20) UNIQUE NOT NULL,
  "contrasena_hash" varchar(50) NOT NULL,
  "estado" bigint,
  "ultimo_acceso" datetime,
  "intentos_fallidos" bigint DEFAULT 0,
  "usuario_creacion" varchar(20),
  "fecha_creacion" datetime,
  "usuario_modificacion" varchar(20),
  "fecha_modificacion" datetime
);

CREATE TABLE "notificacion" (
  "id_notificacion" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_notificacion_id_notificacion')),
  "id_usuario" bigint,
  "mensaje" varchar(500),
  "usuario_creacion" varchar(20),
  "fecha_creacion" datetime,
  "usuario_modificacion" varchar(20),
  "fecha_modificacion" datetime
);

CREATE TABLE "rol_persona" (
  "id_rol_persona" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_rol_persona_id_rol_persona')),
  "id_persona" bigint,
  "id_rol" bigint,
  "usuario_creacion" varchar(20),
  "fecha_creacion" datetime,
  "usuario_modificacion" varchar(20),
  "fecha_modificacion" datetime
);

CREATE TABLE "producto" (
  "id_producto" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_producto_id_producto')),
  "id_emprendedor" bigint,
  "nombre" varchar(150),
  "descripcion" varchar(250),
  "precio" numeric(10,2),
  "estado" bigint,
  "fecha_publicacion" datetime,
  "stock" bigint,
  "imagen_url" text,
  "id_categoria" bigint,
  "usuario_creacion" varchar(20),
  "fecha_creacion" datetime,
  "usuario_modificacion" varchar(20),
  "fecha_modificacion" datetime
);

CREATE TABLE "categoria_producto" (
  "id_categoria" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_categoria_producto_id_categoria')),
  "nombre" varchar(30),
  "descripcion" varchar(100)
);

CREATE TABLE "pedido" (
  "id_pedido" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_pedido_id_pedido')),
  "id_cliente" bigint,
  "fecha_pedido" datetime,
  "total_pedido" numeric(10,2),
  "estado" bigint,
  "usuario_creacion" varchar(20),
  "fecha_creacion" datetime,
  "usuario_modificacion" varchar(20),
  "fecha_modificacion" datetime
);

CREATE TABLE "detalle_pedido" (
  "id_detalle_pedido" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_detalles_pedido_id_detalle_pedido')),
  "id_pedido" bigint,
  "id_producto" bigint,
  "cantidad_productos" bigint,
  "usuario_creacion" varchar(20),
  "fecha_creacion" datetime,
  "usuario_modificacion" varchar(20),
  "fecha_modificacion" datetime
);

CREATE TABLE "metodo_pago" (
  "id_metodo_pago" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_metodo_pago_id_metodo_pago')),
  "nombre_metodo" varchar(100),
  "codigo" varchar(4),
  "detalles" varchar(30)
);

CREATE TABLE "factura" (
  "id_factura" bigint PRIMARY KEY NOT NULL DEFAULT (nextval('sec_factura_id_factura')),
  "id_pedido" bigint,
  "metodo_pago" bigint,
  "fecha" datetime,
  "total" numeric(10,2),
  "estado_factura" bigint
);

----------------- BLOQUE 3

CREATE UNIQUE INDEX ON "persona" ("id_tipo_identificacion", "numero_identificacion");

ALTER TABLE "persona" ADD FOREIGN KEY ("id_tipo_identificacion") REFERENCES "tipo_identificacion" ("id_tipo_identificacion");

ALTER TABLE "persona" ADD FOREIGN KEY ("tipo_persona") REFERENCES "tipo_persona" ("id_tipo_persona");

ALTER TABLE "persona" ADD FOREIGN KEY ("representante_legal") REFERENCES "persona" ("id_persona");

ALTER TABLE "usuario" ADD FOREIGN KEY ("id_persona") REFERENCES "persona" ("id_persona");

ALTER TABLE "usuario" ADD FOREIGN KEY ("estado") REFERENCES "estado" ("id_estado");

ALTER TABLE "notificacion" ADD FOREIGN KEY ("id_usuario") REFERENCES "usuario" ("id_usuario");

ALTER TABLE "rol_persona" ADD FOREIGN KEY ("id_persona") REFERENCES "persona" ("id_persona");

ALTER TABLE "rol_persona" ADD FOREIGN KEY ("id_rol") REFERENCES "rol" ("id_rol");

ALTER TABLE "producto" ADD FOREIGN KEY ("id_emprendedor") REFERENCES "persona" ("id_persona");

ALTER TABLE "producto" ADD FOREIGN KEY ("estado") REFERENCES "estado" ("id_estado");

ALTER TABLE "producto" ADD FOREIGN KEY ("id_categoria") REFERENCES "categoria_producto" ("id_categoria");

ALTER TABLE "pedido" ADD FOREIGN KEY ("id_cliente") REFERENCES "usuario" ("id_usuario");

ALTER TABLE "pedido" ADD FOREIGN KEY ("estado") REFERENCES "estado" ("id_estado");

ALTER TABLE "detalle_pedido" ADD FOREIGN KEY ("id_pedido") REFERENCES "pedido" ("id_pedido");

ALTER TABLE "detalle_pedido" ADD FOREIGN KEY ("id_producto") REFERENCES "producto" ("id_producto");

ALTER TABLE "factura" ADD FOREIGN KEY ("id_pedido") REFERENCES "pedido" ("id_pedido");

ALTER TABLE "factura" ADD FOREIGN KEY ("metodo_pago") REFERENCES "metodo_pago" ("id_metodo_pago");

ALTER TABLE "factura" ADD FOREIGN KEY ("estado_factura") REFERENCES "estado" ("id_estado");

