USE [master]
GO
/****** Object:  Database [ChessDB]    Script Date: 6/8/2021 5:45:21 p. m. ******/
CREATE DATABASE [ChessDB];
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChessDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChessDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ChessDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ChessDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ChessDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ChessDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ChessDB] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ChessDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ChessDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ChessDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ChessDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ChessDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ChessDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ChessDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ChessDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ChessDB] SET  ENABLE_BROKER
GO
ALTER DATABASE [ChessDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ChessDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ChessDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ChessDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ChessDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ChessDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ChessDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ChessDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ChessDB] SET  MULTI_USER
GO
ALTER DATABASE [ChessDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ChessDB] SET DB_CHAINING OFF
GO
ALTER DATABASE [ChessDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [ChessDB] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [ChessDB] SET DELAYED_DURABILITY = DISABLED
GO
USE [ChessDB]
GO
/****** Object:  User [EUDY]    Script Date: 6/8/2021 5:45:21 p. m. ******/
CREATE USER [EUDY] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](40) NULL,
	[direccion] [nvarchar](70) NULL,
	[Idsexo] [int] NULL,
	[IdPuesto] [int] NULL,
	[Departamento] [nvarchar](60) NULL,
	[Apellido] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntradaDeLeche]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntradaDeLeche](
	[IdEntrada] [int] IDENTITY(1,1) NOT NULL,
	[IdSuplidor] [int] NULL,
	[IdRecolector] [int] NULL,
	[CantidadBotellas] [decimal](10, 2) NULL,
	[IdEstado] [int] NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED
(
	[IdEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoDeLeche]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoDeLeche](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](60) NULL,
PRIMARY KEY CLUSTERED
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenElementos]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenElementos](
	[IdOrdenElemento] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[MontoTotal] [money] NULL,
	[Fecha] [date] NULL,
	[Descuento] [money] NULL,
PRIMARY KEY CLUSTERED
(
	[IdOrdenElemento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[IdOrden] [int] IDENTITY(1,1) NOT NULL,
	[FechaOrden] [date] NULL,
PRIMARY KEY CLUSTERED
(
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[ProductoNombre] [nvarchar](70) NULL,
	[Descripcion] [nvarchar](75) NULL,
	[Precio] [money] NULL,
PRIMARY KEY CLUSTERED
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[IdPuestos] [int] IDENTITY(1,1) NOT NULL,
	[nombrePuesto] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[IdPuestos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sexo]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sexo](
	[Idsexo] [int] IDENTITY(1,1) NOT NULL,
	[sexDescripcion] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED
(
	[Idsexo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suplidor]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suplidor](
	[IdSuplidor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](40) NULL,
	[Direccion] [nvarchar](60) NULL,
	[NumeroTel] [varchar](20) NULL,
PRIMARY KEY CLUSTERED
(
	[IdSuplidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NULL,
	[Contraseña] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([IdPuesto])
REFERENCES [dbo].[Puestos] ([IdPuestos])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([Idsexo])
REFERENCES [dbo].[Sexo] ([Idsexo])
GO
ALTER TABLE [dbo].[EntradaDeLeche]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[EstadoDeLeche] ([IdEstado])
GO
ALTER TABLE [dbo].[EntradaDeLeche]  WITH CHECK ADD FOREIGN KEY([IdRecolector])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[EntradaDeLeche]  WITH CHECK ADD FOREIGN KEY([IdSuplidor])
REFERENCES [dbo].[suplidor] ([IdSuplidor])
GO
ALTER TABLE [dbo].[OrdenElementos]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
/****** Object:  StoredProcedure [dbo].[ActualizarSuplidor]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarSuplidor]
    @IdSuplidor INT,
    @Nombre VARCHAR(50),
    @Apellidos VARCHAR(40),
    @Direccion VARCHAR(50),
    @NumeroTel VARCHAR(19)
AS
BEGIN
    UPDATE dbo.suplidor SET Nombre = @Nombre, Apellidos = @Apellidos, Direccion = @Direccion, NumeroTel = @NumeroTel
WHERE IdSuplidor = @IdSuplidor
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarSuplidor]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarSuplidor]
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(60),
    @Direccion VARCHAR(50),
    @NumeroTel VARCHAR(50)
AS
BEGIN
    -- body of the stored procedure
    INSERT INTO dbo.suplidor (Nombre, Apellidos, Direccion, NumeroTel)
    VALUES (@Nombre, @Apellido, @Direccion, @NumeroTel)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmpleado]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[InsertEmpleado]
    @Nombre VARCHAR(50),
	@Apellido varchar(50),
    @Direccion VARCHAR(60),
    @Sexo INT,
    @Puesto INT,
    @Departmento VARCHAR(50)
AS
BEGIN
    -- body of the stored procedure
    INSERT INTO dbo.Empleados (nombre, direccion, Idsexo, IdPuesto, Departamento, Apellido)
    VALUES (@Nombre, @Direccion, @Sexo, @Puesto, @Departmento, @Apellido)
END
GO
/****** Object:  StoredProcedure [dbo].[ListaEstadosDeLeche]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaEstadosDeLeche]
AS
BEGIN
select * FROM dbo.EstadoDeLeche
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarEmpleados]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarEmpleados]
    @IdEmpleado INT,
    @Nombre VARCHAR(50),
	@Apellido varchar(50),
    @Direccion VARCHAR(60),
    @Sexo INT,
    @Puesto INT,
    @Departmento VARCHAR(50)
AS
BEGIN
UPDATE dbo.Empleados SET nombre = @Nombre, Apellido = @Apellido, direccion = @Direccion, Idsexo = @Sexo,IdPuesto = @Puesto, Departamento = @Departmento
WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteProductById]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_DeleteProductById]
    @IdProducto INT
AS
BEGIN
    -- body of the stored procedure
    DELETE dbo.Productos
    WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EditarEntrada]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EditarEntrada]
    @IdEntrada int,
    @IdSuplidor INT,
    @IdRcolector INT,
    @CantidadEnBotellas INT,
    @IdEstado INT,
    @Fecha DATE
AS
BEGIN
UPDATE dbo.EntradaDeLeche SET IdSuplidor = @IdSuplidor,IdRecolector = @IdRcolector, CantidadBotellas = @CantidadEnBotellas, IdEstado = @IdEstado, Fecha = @Fecha
WHERE IdEntrada = @IdEntrada
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarEmpleado]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarEmpleado]
    @IdEmpleado INT
AS
BEGIN
    delete dbo.Empleados
    WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarEntrada]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarEntrada]
@IdEntrada INT
AS
BEGIN
DELETE dbo.EntradaDeLeche
WHERE IdEntrada = @IdEntrada
END
GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarSuplidor]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarSuplidor]
    @IdSuplidor INT
AS
BEGIN
    delete dbo.suplidor
WHERE IdSuplidor = @IdSuplidor
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarEntrada]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarEntrada]
    @IdSuplidor INT,
    @IdRecolector INT,
    @Cantidad decimal(10,3),
    @IdEstado INT,
    @fecha DATE
AS
BEGIN

    INSERT INTO dbo.EntradaDeLeche (IdSuplidor, IdRecolector, CantidadBotellas, IdEstado, Fecha)
    VALUES (@IdSuplidor, @IdRecolector, @Cantidad, @IdEstado, @fecha)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertProductos]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_InsertProductos]
    @NombreProducto NVARCHAR(70),
    @Descripcion VARCHAR(75),
    @Precio MONEY
AS
BEGIN
    INSERT INTO dbo.Productos (ProductoNombre, Descripcion, Precio)
    VALUES (@NombreProducto, @Descripcion, @Precio)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListaEstados]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaEstados]

AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM dbo.EstadoDeLeche
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ListaPuestos]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaPuestos]
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM dbo.Puestos
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SeleccionarAllEntradas]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_SeleccionarAllEntradas]

AS
BEGIN
    -- body of the stored procedure
    SELECT e.IdEntrada,CONCAT(s.Nombre, s.Apellidos) as NombreSuplidor, empe.nombre AS Recolector , e.CantidadBotellas, esta.Descripcion as EstadoDeLeche, e.Fecha FROM dbo.EntradaDeLeche e
    JOIN suplidor s on s.IdSuplidor = e.IdSuplidor
    JOIN Empleados empe on empe.IdEmpleado = e.IdRecolector
    JOIN EstadoDeLeche esta ON esta.IdEstado = e.IdEstado

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SeleccionarTodosLosEmpleados]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SeleccionarTodosLosEmpleados]
AS
BEGIN
    SELECT e.IdEmpleado, e.Nombre, e.Apellido, e.Direccion, s.sexDescripcion as Sexo, p.nombrePuesto AS Puesto , e.Departamento
    FROM dbo.Empleados e
        INNER JOIN Sexo s ON s.Idsexo = e.Idsexo
        INNER JOIN Puestos p on p.IdPuestos = e.IdPuesto
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SeleccionarTodosLosSuplidores]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SeleccionarTodosLosSuplidores]
AS
BEGIN
    SELECT s.IdSuplidor, Nombre AS Nombre, s.Apellidos, s.Direccion, s.NumeroTel
    FROM dbo.suplidor s
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectAllProducts]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_SelectAllProducts]
-- add more stored procedure parameters here
AS
BEGIN
    -- body of the stored procedure
    SELECT p.IdProducto AS IDProducto, p.ProductoNombre AS Nombre_Producto, p.Descripcion, Precio  FROM dbo.Productos p
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectLoginUser]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectLoginUser]
  @NombreUser VARCHAR(50),
  @Contraseña VARCHAR(50)
AS
BEGIN
    -- body of the stored procedure
    SELECT u.NombreUsuario, u.Contraseña FROM  dbo.Usuario u
    WHERE u.Contraseña = @Contraseña AND u.NombreUsuario =@NombreUser
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateProducto]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE [dbo].[SP_UpdateProducto]
    @IdProducto INT,
    @NombreProducto NVARCHAR(70),
    @Descripcion VARCHAR(75),
    @Precio MONEY
AS
BEGIN
    UPDATE dbo.Productos
    SET ProductoNombre = @NombreProducto,
        Descripcion = @Descripcion,
        Precio = @Precio
    WHERE IdProducto = @IdProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ValoreMienbrosComoSuplidores]    Script Date: 6/8/2021 5:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_ValoreMienbrosComoSuplidores]
as
SELECT IdSuplidor,  Nombre +' '+ Apellidos as Nombres from dbo.suplidor
GO
USE [master]
GO
ALTER DATABASE [ChessDB] SET  READ_WRITE
GO
