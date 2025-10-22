-- =====================================================
-- TRIGGERS DE AUDITORÍA PARA TABLAS PRINCIPALES
-- Basados en el patrón de triggers de triggers_ddl.sql
-- =====================================================

-- =====================================================
-- FUNCIÓN PARA MANEJAR EL HISTORIAL DE PERSONA
-- =====================================================
CREATE OR REPLACE FUNCTION public.fn_persona_hist() RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO public.persona_hist (
      id_persona, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
      id_tipo_identificacion, numero_identificacion, telefono, celular, direccion,
      correo_electronico, tipo_persona, fecha_nacimiento, genero, razon_social,
      nombre_comercial, fecha_constitucion, representante_legal, usuario_creacion,
      fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      NEW.id_persona, NEW.primer_nombre, NEW.segundo_nombre, NEW.primer_apellido, NEW.segundo_apellido,
      NEW.id_tipo_identificacion, NEW.numero_identificacion, NEW.telefono, NEW.celular, NEW.direccion,
      NEW.correo_electronico, NEW.tipo_persona, NEW.fecha_nacimiento, NEW.genero, NEW.razon_social,
      NEW.nombre_comercial, NEW.fecha_constitucion, NEW.representante_legal, NEW.usuario_creacion,
      NEW.fecha_creacion, NEW.usuario_modificacion, NEW.fecha_modificacion, NOW(), 'INSERT', COALESCE(NEW.usuario_creacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO public.persona_hist (
      id_persona, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
      id_tipo_identificacion, numero_identificacion, telefono, celular, direccion,
      correo_electronico, tipo_persona, fecha_nacimiento, genero, razon_social,
      nombre_comercial, fecha_constitucion, representante_legal, usuario_creacion,
      fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_persona, OLD.primer_nombre, OLD.segundo_nombre, OLD.primer_apellido, OLD.segundo_apellido,
      OLD.id_tipo_identificacion, OLD.numero_identificacion, OLD.telefono, OLD.celular, OLD.direccion,
      OLD.correo_electronico, OLD.tipo_persona, OLD.fecha_nacimiento, OLD.genero, OLD.razon_social,
      OLD.nombre_comercial, OLD.fecha_constitucion, OLD.representante_legal, OLD.usuario_creacion,
      OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'UPDATE', COALESCE(NEW.usuario_modificacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO public.persona_hist (
      id_persona, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido,
      id_tipo_identificacion, numero_identificacion, telefono, celular, direccion,
      correo_electronico, tipo_persona, fecha_nacimiento, genero, razon_social,
      nombre_comercial, fecha_constitucion, representante_legal, usuario_creacion,
      fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_persona, OLD.primer_nombre, OLD.segundo_nombre, OLD.primer_apellido, OLD.segundo_apellido,
      OLD.id_tipo_identificacion, OLD.numero_identificacion, OLD.telefono, OLD.celular, OLD.direccion,
      OLD.correo_electronico, OLD.tipo_persona, OLD.fecha_nacimiento, OLD.genero, OLD.razon_social,
      OLD.nombre_comercial, OLD.fecha_constitucion, OLD.representante_legal, OLD.usuario_creacion,
      OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'DELETE', USER
    );
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS tr_persona_hist ON public.persona;
CREATE TRIGGER tr_persona_hist
AFTER INSERT OR UPDATE OR DELETE ON public.persona
FOR EACH ROW EXECUTE FUNCTION public.fn_persona_hist();

-- =====================================================
-- FUNCIÓN PARA MANEJAR EL HISTORIAL DE USUARIO
-- =====================================================
CREATE OR REPLACE FUNCTION public.fn_usuario_hist() RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO public.usuario_hist (
      id_usuario, id_persona, nombre_usuario, contrasena_hash, estado, ultimo_acceso, intentos_fallidos,
      usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      NEW.id_usuario, NEW.id_persona, NEW.nombre_usuario, NEW.contrasena_hash, NEW.estado, NEW.ultimo_acceso, NEW.intentos_fallidos,
      NEW.usuario_creacion, NEW.fecha_creacion, NEW.usuario_modificacion, NEW.fecha_modificacion, NOW(), 'INSERT', COALESCE(NEW.usuario_creacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO public.usuario_hist (
      id_usuario, id_persona, nombre_usuario, contrasena_hash, estado, ultimo_acceso, intentos_fallidos,
      usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_usuario, OLD.id_persona, OLD.nombre_usuario, OLD.contrasena_hash, OLD.estado, OLD.ultimo_acceso, OLD.intentos_fallidos,
      OLD.usuario_creacion, OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'UPDATE', COALESCE(NEW.usuario_modificacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO public.usuario_hist (
      id_usuario, id_persona, nombre_usuario, contrasena_hash, estado, ultimo_acceso, intentos_fallidos,
      usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_usuario, OLD.id_persona, OLD.nombre_usuario, OLD.contrasena_hash, OLD.estado, OLD.ultimo_acceso, OLD.intentos_fallidos,
      OLD.usuario_creacion, OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'DELETE', USER
    );
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS tr_usuario_hist ON public.usuario;
CREATE TRIGGER tr_usuario_hist
AFTER INSERT OR UPDATE OR DELETE ON public.usuario
FOR EACH ROW EXECUTE FUNCTION public.fn_usuario_hist();

-- =====================================================
-- FUNCIÓN PARA MANEJAR EL HISTORIAL DE PRODUCTO
-- =====================================================
CREATE OR REPLACE FUNCTION public.fn_producto_hist() RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO public.producto_hist (
      id_producto, id_emprendedor, nombre, descripcion, precio, estado, fecha_publicacion, stock, imagen_url, id_categoria,
      usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      NEW.id_producto, NEW.id_emprendedor, NEW.nombre, NEW.descripcion, NEW.precio, NEW.estado, NEW.fecha_publicacion, NEW.stock, NEW.imagen_url, NEW.id_categoria,
      NEW.usuario_creacion, NEW.fecha_creacion, NEW.usuario_modificacion, NEW.fecha_modificacion, NOW(), 'INSERT', COALESCE(NEW.usuario_creacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO public.producto_hist (
      id_producto, id_emprendedor, nombre, descripcion, precio, estado, fecha_publicacion, stock, imagen_url, id_categoria,
      usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_producto, OLD.id_emprendedor, OLD.nombre, OLD.descripcion, OLD.precio, OLD.estado, OLD.fecha_publicacion, OLD.stock, OLD.imagen_url, OLD.id_categoria,
      OLD.usuario_creacion, OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'UPDATE', COALESCE(NEW.usuario_modificacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO public.producto_hist (
      id_producto, id_emprendedor, nombre, descripcion, precio, estado, fecha_publicacion, stock, imagen_url, id_categoria,
      usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_producto, OLD.id_emprendedor, OLD.nombre, OLD.descripcion, OLD.precio, OLD.estado, OLD.fecha_publicacion, OLD.stock, OLD.imagen_url, OLD.id_categoria,
      OLD.usuario_creacion, OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'DELETE', USER
    );
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS tr_producto_hist ON public.producto;
CREATE TRIGGER tr_producto_hist
AFTER INSERT OR UPDATE OR DELETE ON public.producto
FOR EACH ROW EXECUTE FUNCTION public.fn_producto_hist();

-- =====================================================
-- FUNCIÓN PARA MANEJAR EL HISTORIAL DE PEDIDO
-- =====================================================
CREATE OR REPLACE FUNCTION public.fn_pedido_hist() RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO public.pedido_hist (
      id_pedido, id_cliente, fecha_pedido, total_pedido, estado, usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      NEW.id_pedido, NEW.id_cliente, NEW.fecha_pedido, NEW.total_pedido, NEW.estado, NEW.usuario_creacion, NEW.fecha_creacion, NEW.usuario_modificacion, NEW.fecha_modificacion, NOW(), 'INSERT', COALESCE(NEW.usuario_creacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO public.pedido_hist (
      id_pedido, id_cliente, fecha_pedido, total_pedido, estado, usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_pedido, OLD.id_cliente, OLD.fecha_pedido, OLD.total_pedido, OLD.estado, OLD.usuario_creacion, OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'UPDATE', COALESCE(NEW.usuario_modificacion, USER)
    );
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO public.pedido_hist (
      id_pedido, id_cliente, fecha_pedido, total_pedido, estado, usuario_creacion, fecha_creacion, usuario_modificacion, fecha_modificacion, fecha_historica, accion, usuario_accion
    ) VALUES (
      OLD.id_pedido, OLD.id_cliente, OLD.fecha_pedido, OLD.total_pedido, OLD.estado, OLD.usuario_creacion, OLD.fecha_creacion, OLD.usuario_modificacion, OLD.fecha_modificacion, NOW(), 'DELETE', USER
    );
    RETURN OLD;
  END IF;
  RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS tr_pedido_hist ON public.pedido;
CREATE TRIGGER tr_pedido_hist
AFTER INSERT OR UPDATE OR DELETE ON public.pedido
FOR EACH ROW EXECUTE FUNCTION public.fn_pedido_hist();

-- =====================================================
-- FIN DE TRIGGERS DE AUDITORÍA
