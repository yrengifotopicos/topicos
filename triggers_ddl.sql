-- =====================================================
-- FUNCIÓN PARA MANEJAR EL HISTORIAL DE FACTURA
-- para manejar los historico se crea una funcion que sigue
-- el historico de la tabla y un triguer que es el encargado 
-- de ejecutar la funcion
-- =====================================================
CREATE
OR REPLACE FUNCTION public.fn_factura_hist() RETURNS TRIGGER LANGUAGE plpgsql AS $ $ BEGIN -- Insertar en la tabla histórica según el tipo de operación
IF TG_OP = 'INSERT' THEN -- Para INSERT: registrar los valores nuevos
INSERT INTO
  public.factura_hist (
    id_factura,
    id_pedido,
    metodo_pago,
    fecha,
    total,
    estado_factura,
    fecha_historica,
    accion,
    usuario_accion
  )
VALUES
  (
    NEW.id_factura,
    NEW.id_pedido,
    NEW.metodo_pago,
    NEW.fecha,
    NEW.total,
    NEW.estado_factura,
    NOW(),
    'INSERT' :: public."accion_hist_enum",
    USER
  );

RETURN NEW;

ELSIF TG_OP = 'UPDATE' THEN -- Para UPDATE: registrar los valores anteriores (OLD)
INSERT INTO
  public.factura_hist (
    id_factura,
    id_pedido,
    metodo_pago,
    fecha,
    total,
    estado_factura,
    fecha_historica,
    accion,
    usuario_accion
  )
VALUES
  (
    OLD.id_factura,
    OLD.id_pedido,
    OLD.metodo_pago,
    OLD.fecha,
    OLD.total,
    OLD.estado_factura,
    NOW(),
    'UPDATE' :: public."accion_hist_enum",
    USER
  );

RETURN NEW;

ELSIF TG_OP = 'DELETE' THEN -- Para DELETE: registrar los valores que se están eliminando (OLD)
INSERT INTO
  public.factura_hist (
    id_factura,
    id_pedido,
    metodo_pago,
    fecha,
    total,
    estado_factura,
    fecha_historica,
    accion,
    usuario_accion
  )
VALUES
  (
    OLD.id_factura,
    OLD.id_pedido,
    OLD.metodo_pago,
    OLD.fecha,
    OLD.total,
    OLD.estado_factura,
    NOW(),
    'DELETE' :: public."accion_hist_enum",
    USER
  );

RETURN OLD;

END IF;

RETURN NULL;

END;

$ $;

-- =====================================================
-- TRIGGER PARA LA TABLA FACTURA
-- =====================================================
-- Eliminar el trigger si ya existe
DROP TRIGGER IF EXISTS tr_factura_hist ON public.factura;

-- Crear el trigger
CREATE TRIGGER tr_factura_hist
AFTER
INSERT
  OR
UPDATE
  OR DELETE ON public.factura FOR EACH ROW EXECUTE FUNCTION public.fn_factura_hist();

-- =====================================================
-- FUNCIÓN PARA MANEJAR EL HISTORIAL DE DETALLE_PEDIDO
-- =====================================================
CREATE
OR REPLACE FUNCTION public.fn_detalle_pedido_hist() RETURNS TRIGGER AS $ $ BEGIN -- Insertar en la tabla histórica según el tipo de operación
IF TG_OP = 'INSERT' THEN -- Para INSERT: registrar los valores nuevos
INSERT INTO
  public.detalle_pedido_hist (
    id_detalle_pedido,
    id_pedido,
    id_producto,
    cantidad_productos,
    usuario_creacion,
    fecha_creacion,
    usuario_modificacion,
    fecha_modificacion,
    fecha_historica,
    accion,
    usuario_accion
  )
VALUES
  (
    NEW.id_detalle_pedido,
    NEW.id_pedido,
    NEW.id_producto,
    NEW.cantidad_productos,
    NEW.usuario_creacion,
    NEW.fecha_creacion,
    NEW.usuario_modificacion,
    NEW.fecha_modificacion,
    NOW(),
    'INSERT' :: public."accion_hist_enum",
    COALESCE(NEW.usuario_creacion, USER)
  );

RETURN NEW;

ELSIF TG_OP = 'UPDATE' THEN -- Para UPDATE: registrar los valores anteriores (OLD)
INSERT INTO
  public.detalle_pedido_hist (
    id_detalle_pedido,
    id_pedido,
    id_producto,
    cantidad_productos,
    usuario_creacion,
    fecha_creacion,
    usuario_modificacion,
    fecha_modificacion,
    fecha_historica,
    accion,
    usuario_accion
  )
VALUES
  (
    OLD.id_detalle_pedido,
    OLD.id_pedido,
    OLD.id_producto,
    OLD.cantidad_productos,
    OLD.usuario_creacion,
    OLD.fecha_creacion,
    OLD.usuario_modificacion,
    OLD.fecha_modificacion,
    NOW(),
    'UPDATE' :: public."accion_hist_enum",
    COALESCE(NEW.usuario_modificacion, USER)
  );

RETURN NEW;

ELSIF TG_OP = 'DELETE' THEN -- Para DELETE: registrar los valores que se están eliminando (OLD)
INSERT INTO
  public.detalle_pedido_hist (
    id_detalle_pedido,
    id_pedido,
    id_producto,
    cantidad_productos,
    usuario_creacion,
    fecha_creacion,
    usuario_modificacion,
    fecha_modificacion,
    fecha_historica,
    accion,
    usuario_accion
  )
VALUES
  (
    OLD.id_detalle_pedido,
    OLD.id_pedido,
    OLD.id_producto,
    OLD.cantidad_productos,
    OLD.usuario_creacion,
    OLD.fecha_creacion,
    OLD.usuario_modificacion,
    OLD.fecha_modificacion,
    NOW(),
    'DELETE' :: public."accion_hist_enum",
    USER
  );

RETURN OLD;

END IF;

RETURN NULL;

END;

$ $ LANGUAGE plpgsql;

-- =====================================================
-- TRIGGER PARA LA TABLA DETALLE_PEDIDO
-- =====================================================
-- Eliminar el trigger si ya existe
DROP TRIGGER IF EXISTS tr_detalle_pedido_hist ON public.detalle_pedido;

CREATE TRIGGER tr_detalle_pedido_hist
AFTER
INSERT
  OR
UPDATE
  OR DELETE ON public.detalle_pedido FOR EACH ROW EXECUTE FUNCTION public.fn_detalle_pedido_hist();


-- =====================================================
-- TABLA DE PRUEBA Y AUDITORÍA
-- =====================================================
CREATE TABLE IF NOT EXISTS public.test_tabla (
  id serial PRIMARY KEY,
  descripcion varchar(100),
  fecha_creacion timestamp DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.test_tabla_audit (
  audit_id serial PRIMARY KEY,
  id integer,
  descripcion varchar(100),
  fecha_creacion timestamp,
  accion varchar(10),
  fecha_auditoria timestamp DEFAULT now()
);

-- =====================================================
-- FUNCIÓN DE AUDITORÍA PARA test_tabla
-- =====================================================
CREATE OR REPLACE FUNCTION public.fn_test_tabla_audit() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO public.test_tabla_audit (id, descripcion, fecha_creacion, accion)
    VALUES (NEW.id, NEW.descripcion, NEW.fecha_creacion, 'INSERT');
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO public.test_tabla_audit (id, descripcion, fecha_creacion, accion)
    VALUES (NEW.id, NEW.descripcion, NEW.fecha_creacion, 'UPDATE');
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO public.test_tabla_audit (id, descripcion, fecha_creacion, accion)
    VALUES (OLD.id, OLD.descripcion, OLD.fecha_creacion, 'DELETE');
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- TRIGGER PARA test_tabla
-- =====================================================
DROP TRIGGER IF EXISTS tr_test_tabla_audit ON public.test_tabla;
CREATE TRIGGER tr_test_tabla_audit
AFTER INSERT OR UPDATE OR DELETE ON public.test_tabla
FOR EACH ROW EXECUTE FUNCTION public.fn_test_tabla_audit();