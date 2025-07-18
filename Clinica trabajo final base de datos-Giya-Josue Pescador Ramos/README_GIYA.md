
# GIYA - Sistema de Gestión de Ventas

**GIYA** es un sistema web desarrollado en **ASP.NET Web Forms** (.NET Framework 4.7.2), diseñado para gestionar operaciones de ventas, compras, usuarios y productos, conectándose a una base de datos MySQL.

---

## 🧩 Estructura del Proyecto

- **Frontend**: ASP.NET Web Forms (páginas `.aspx`)
- **Backend**: C# (.NET Framework 4.7.2)
- **Base de Datos**: MySQL
- **ORM**: Dapper
- **Arquitectura**: Patrón Repositorio genérico

---

## 📁 Componentes principales

### 🗃 Tablas del sistema

- **Usuario**
- **Producto**
- **Proveedor**
- **Venta**
- **Compra**
- **Detalle_de_venta**
- **Detalle_de_compra**
- **Producto_Proveedor**
- **Stock_Producto**

### 🧱 Funcionalidades

- Registro y autenticación de usuarios
- CRUD de productos, proveedores y ventas
- Gestión de compras y stock
- Vistas dinámicas con `GridView`
- Validaciones de datos y control de acceso
- Repositorio genérico para operaciones en base de datos

---

## 🔌 Configuración de la base de datos

El sistema requiere una base de datos MySQL llamada `giya`.

### Estructura básica de ejemplo (Producto):

```sql
CREATE TABLE producto (
  idProducto INT PRIMARY KEY AUTO_INCREMENT,
  idProveedor INT,
  nombreProducto VARCHAR(100),
  descripcion TEXT,
  precioCompra DECIMAL(10,2),
  precioVenta DECIMAL(10,2),
  stock INT
);
```

> Se recomienda usar **DBeaver** o **MySQL Workbench** para importar o administrar los datos.

---

## 📦 Instalación y ejecución

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tu-usuario/giya.git
   ```

2. Abre la solución `giyaz.sln` en Visual Studio 2019 o superior.

3. Configura la cadena de conexión en `Web.config`:
   ```xml
   <connectionStrings>
     <add name="MyConnection" connectionString="Server=localhost;Database=giya;Uid=tu_usuario;Pwd=tu_contraseña;" providerName="MySql.Data.MySqlClient"/>
   </connectionStrings>
   ```

4. Ejecuta el proyecto (`F5` o "Iniciar depuración").

---

## 🔍 Recomendaciones

- Asegúrate de tener **MySQL Server** y el conector **MySQL for .NET** instalado.
- Usa controladores como `MySql.Data` o `MySqlConnector` en el archivo de referencias.
- Mantén el patrón repositorio para desacoplar la lógica de acceso a datos.

---

## 🧑‍💻 Autor

Proyecto desarrollado por **Josue Pescador Ramos**, con fines académicos y de práctica en bases de datos, ASP.NET y patrones de diseño.

---

## 📝 Licencia

Este proyecto se puede utilizar libremente con fines educativos. Para uso comercial, por favor contactar al autor.
