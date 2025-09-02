Table persona {
  id_persona bigint [pk, default: `nextval('sec_persona_id_persona')`, not null]
  primer_nombre varchar(50)
  segundo_nombre varchar(50)
  primer_apellido varchar(50)
  segundo_apellido varchar(50)
  id_tipo_identificacion bigint [ref: > tipo_identificacion.id_tipo_identificacion]
  numero_identificacion varchar(20)
  telefono varchar(15)
  celular varchar(20)
  direccion varchar(200)
  correo_electronico varchar(120)
  tipo_persona bigint [ref: > tipo_persona.id_tipo_persona]
  fecha_nacimiento date
  genero enum('MASCULINO', 'FEMENINO')
  razon_social varchar(120)
  nombre_comercial varchar(150)
  fecha_constitucion date
  representante_legal bigint [ref: > persona.id_persona]
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
  indexes {
    (id_tipo_identificacion, numero_identificacion) [unique]
  }
}

Table tipo_identificacion {
  id_tipo_identificacion bigint [pk, default: `nextval('sec_tipo_identificacion_id_tipo_identificacion')`, not null]
  tipo_identificacion varchar(20)
  codigo varchar(4)
  descripcion varchar(100)
}

Table tipo_persona {
  id_tipo_persona bigint [pk, default: `nextval('sec_tipo_persona_id_tipo_persona')`, not null]
  tipo_persona varchar(20)
  codigo varchar(4)
  descripcion varchar(100)
}

Table rol {
  id_rol bigint [pk, default: `nextval('sec_rol_id_rol')`, not null]
  rol varchar(20)
  codigo varchar(4)
  descripcion varchar(100)
}

Table estado {
  id_estado bigint [pk, default: `nextval('sec_estado_id_estado')`, not null]
  estado varchar(30)
  codigo varchar(4)
  descripcion varchar(100)
}

Table usuario {
  id_usuario bigint [pk, default: `nextval('sec_usuario_id_usuario')`, not null]
  id_persona bigint [ref: > persona.id_persona]
  nombre_usuario varchar(20) [unique, not null]
  contrasena_hash varchar(50) [not null]
  estado bigint [ref: > estado.id_estado]
  ultimo_acceso datetime
  intentos_fallidos bigint [default: 0]
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
}

Table notificacion {
  id_notificacion bigint [pk, default: `nextval('sec_notificacion_id_notificacion')`, not null]
  id_usuario bigint [ref: > usuario.id_usuario]
  mensaje varchar(500)
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
}

Table rol_persona {
  id_rol_persona bigint [pk, default: `nextval('sec_rol_persona_id_rol_persona')`, not null]
  id_persona bigint [ref: > persona.id_persona]
  id_rol bigint [ref: > rol.id_rol]
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
}

Table producto {
  id_producto bigint [pk, default: `nextval('sec_producto_id_producto')`, not null]
  id_emprendedor bigint [ref: > persona.id_persona]
  nombre varchar(150)
  descripcion varchar(250)
  precio numeric(10, 2)
  estado bigint [ref: > estado.id_estado]
  fecha_publicacion datetime
  stock bigint
  imagen_url text
  id_categoria bigint [ref: > categoria_producto.id_categoria]
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
}

Table categoria_producto {
  id_categoria bigint [pk, default: `nextval('sec_categoria_producto_id_categoria')`, not null]
  nombre varchar(30)
  descripcion varchar(100)
}

Table pedido {
  id_pedido bigint [pk, default: `nextval('sec_pedido_id_pedido')`, not null]
  id_cliente bigint [ref: > usuario.id_usuario]
  fecha_pedido datetime
  total_pedido numeric(10, 2)
  estado bigint [ref: > estado.id_estado]
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
}

Table detalle_pedido {
  id_detalle_pedido bigint [pk, default: `nextval('sec_detalles_pedido_id_detalle_pedido')`, not null]
  id_pedido bigint [ref: > pedido.id_pedido]
  id_producto bigint [ref: > producto.id_producto]
  cantidad_productos bigint
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
}

Table metodo_pago {
  id_metodo_pago bigint [pk, default: `nextval('sec_metodo_pago_id_metodo_pago')`, not null]
  nombre_metodo varchar(100)
  codigo varchar(4)
  detalles varchar(30)
}

Table factura {
  id_factura bigint [pk, default: `nextval('sec_factura_id_factura')`, not null]
  id_pedido bigint [ref: > pedido.id_pedido]
  metodo_pago bigint [ref: > metodo_pago.id_metodo_pago]
  fecha datetime
  total numeric(10, 2)
  estado_factura bigint [ref: > estado.id_estado]
}

Table persona_hist {
  id_persona bigint
  primer_nombre varchar(50)
  segundo_nombre varchar(50)
  primer_apellido varchar(50)
  segundo_apellido varchar(50)
  id_tipo_identificacion bigint
  numero_identificacion varchar(20)
  telefono varchar(15)
  celular varchar(20)
  direccion varchar(200)
  correo_electronico varchar(120)
  tipo_persona bigint
  fecha_nacimiento date
  genero enum('MASCULINO', 'FEMENINO')
  razon_social varchar(120)
  nombre_comercial varchar(150)
  fecha_constitucion date
  representante_legal bigint
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
  fecha_historica datetime
  accion enum('INSERT', 'UPDATE', 'DELETE')
  usuario_accion varchar(20)
}

Table usuario_hist {
  id_usuario bigint
  id_persona bigint
  nombre_usuario varchar(20)
  contrasena_hash varchar(50)
  estado bigint
  ultimo_acceso datetime
  intentos_fallidos bigint
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
  fecha_historica datetime
  accion enum('INSERT', 'UPDATE', 'DELETE')
  usuario_accion varchar(20)
}

Table producto_hist {
  id_producto bigint
  id_emprendedor bigint
  nombre varchar(150)
  descripcion varchar(250)
  precio numeric(10, 2)
  estado bigint
  fecha_publicacion datetime
  stock bigint
  imagen_url text
  id_categoria bigint
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
  fecha_historica datetime
  accion enum('INSERT', 'UPDATE', 'DELETE')
  usuario_accion varchar(20)
}

Table pedido_hist {
  id_pedido bigint
  id_cliente bigint
  fecha_pedido datetime
  total_pedido numeric(10, 2)
  estado bigint
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
  fecha_historica datetime
  accion enum('INSERT', 'UPDATE', 'DELETE')
  usuario_accion varchar(20)
}

Table factura_hist {
  id_factura bigint
  id_pedido bigint
  metodo_pago bigint
  fecha datetime
  total numeric(10, 2)
  estado_factura bigint
  fecha_historica datetime
  accion enum('INSERT', 'UPDATE', 'DELETE')
  usuario_accion varchar(20)
}

Table detalle_pedido_hist {
  id_detalle_pedido bigint
  id_pedido bigint
  id_producto bigint
  cantidad_productos bigint
  usuario_creacion varchar(20)
  fecha_creacion datetime
  usuario_modificacion varchar(20)
  fecha_modificacion datetime
  fecha_historica datetime
  accion enum('INSERT', 'UPDATE', 'DELETE')
  usuario_accion varchar(20)
}





