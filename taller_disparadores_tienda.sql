-- Taller 2 

------------------------------------------------------------- TALLER 2 PL / SQL -------------------------------------------------------------------

-- PUNTO 1 (Creación propia auxiliado por Gemini)

CREATE OR REPLACE TRIGGER corregir_factura
BEFORE INSERT ON ITEMVENTA
FOR EACH ROW
DECLARE
    v_inventario NUMBER;
    v_precio_producto NUMBER;
BEGIN
    -- Obtener inventario y precio del producto
    SELECT i.CANTIDAD, p.PRECIO
    INTO v_inventario, v_precio_producto
    FROM INVENTARIOALMACEN i
    JOIN PRODUCTO p ON i.PRODUCTO_IDPRODUCTO = p.IDPRODUCTO
    WHERE i.ALMACEN_IDALMACEN = (
        SELECT ALMACEN_IDALMACEN
        FROM VENTA
        JOIN EMPLEADO ON VENTA.EMPLEADO_IDEMPLEADO = EMPLEADO.IDEMPLEADO
        WHERE VENTA.NUMERO = :NEW.VENTA_NUMERO
    )
    AND i.PRODUCTO_IDPRODUCTO = :NEW.PRODUCTO_IDPRODUCTO;

    -- Verificar inventario y calcular descuento (si es necesario)
    IF v_inventario < :NEW.cantidad THEN
        -- Lógica para calcular el descuento (no especificada en el trigger original)

        -- Actualizar venta
        UPDATE VENTA
        SET ESTADO = '0',
            TOTALVENTA = TOTALVENTA - (:NEW.CANTIDAD * v_precio_producto) -- Aplicar descuento si es necesario
        WHERE NUMERO = :NEW.VENTA_NUMERO;

        DBMS_OUTPUT.PUT_LINE('Inventario insuficiente. Venta anulada y descuento aplicado.');
    ELSIF v_inventario >= :NEW.cantidad THEN
        -- Realizar alguna acción si el inventario es suficiente (no especificada en el trigger original)
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Manejar el caso en que el producto no existe en el inventario
        DBMS_OUTPUT.PUT_LINE('El producto no existe en el inventario.');
        RAISE; -- Propagar la excepción para cancelar la inserción
END;
/

