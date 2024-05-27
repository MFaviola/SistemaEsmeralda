USE [master]
GO
/****** Object:  Database [dbSistemaEsmeralda]    Script Date: 27/5/2024 10:19:18 ******/
CREATE DATABASE [dbSistemaEsmeralda]
GO
USE [dbSistemaEsmeralda]
GO

/****** Object:  Schema [Acce]    Script Date: 27/5/2024 10:19:19 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Gral]    Script Date: 27/5/2024 10:19:19 ******/
CREATE SCHEMA [Gral]
GO
/****** Object:  Schema [Rest]    Script Date: 27/5/2024 10:19:19 ******/
CREATE SCHEMA [Rest]
GO
/****** Object:  Schema [Vent]    Script Date: 27/5/2024 10:19:19 ******/
CREATE SCHEMA [Vent]
GO
/****** Object:  Table [Gral].[tbImpuestos]    Script Date: 27/5/2024 10:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbImpuestos](
	[Impu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Impu_Impuesto] [decimal](18, 0) NULL,
	[Impu_UsuarioCreacion] [int] NULL,
	[Impu_FechaCreacion] [datetime] NULL,
	[Impu_UsuarioModificacion] [int] NULL,
	[Impu_FechaModificacion] [datetime] NULL,
	[Impu_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Impu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Rest].[VW_Productos_Mostrar]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [Acce].[tbRoles]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRoles](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Rol] [varchar](60) NOT NULL,
	[Role_UsuarioCreacion] [int] NULL,
	[Role_FechaCreacion] [datetime] NULL,
	[Role_UsuarioModificacion] [int] NULL,
	[Role_FechaModificacion] [datetime] NULL,
	[Role_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_Roles]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Roles]
AS
SELECT * FROM Acce.tbRoles
GO
/****** Object:  Table [Vent].[tbJoyas]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbJoyas](
	[Joya_Id] [int] IDENTITY(1,1) NOT NULL,
	[Joya_Nombre] [varchar](60) NOT NULL,
	[Joya_PrecioCompra] [numeric](8, 2) NOT NULL,
	[Joya_PrecioVenta] [numeric](8, 2) NOT NULL,
	[Joya_PrecioMayor] [numeric](8, 2) NOT NULL,
	[Joya_Imagen] [varchar](max) NOT NULL,
	[Prov_Id] [int] NOT NULL,
	[Mate_Id] [int] NOT NULL,
	[Cate_Id] [int] NOT NULL,
	[Joya_UsuarioCreacion] [int] NULL,
	[Joya_FechaCreacion] [datetime] NULL,
	[Joya_UsuarioModificacion] [int] NULL,
	[Joya_FechaModificacion] [datetime] NULL,
	[Joya_Estado] [bit] NULL,
	[Joya_Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Joya_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbFactura]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbFactura](
	[Fact_Id] [int] IDENTITY(1,1) NOT NULL,
	[Clie_Id] [int] NOT NULL,
	[Empl_Id] [int] NOT NULL,
	[Mepa_Id] [int] NOT NULL,
	[Fact_UsuarioCreacion] [int] NULL,
	[Fact_FechaCreacion] [datetime] NULL,
	[Fact_UsuarioModificacion] [int] NULL,
	[Fact_FechaModificacion] [datetime] NULL,
	[Fact_Estado] [bit] NULL,
	[Fact_Finalizado] [bit] NULL,
	[Fact_FechaFinalizado] [datetime] NULL,
	[Sucu_Id] [int] NULL,
	[Fact_Cambio] [numeric](8, 2) NULL,
	[Fact_Pago] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Fact_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbFacturaDetalles]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbFacturaDetalles](
	[FaxD_Id] [int] IDENTITY(1,1) NOT NULL,
	[FaxD_Dif] [bit] NULL,
	[Prod_Id] [int] NULL,
	[FaxD_Cantidad] [int] NULL,
	[Fact_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FaxD_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Vent].[v_Dash_JoyasMes]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [Vent].[v_Dash_JoyasMes] as
SELECT        TOP (5) J.Joya_Nombre AS NombreProducto, SUM(D.FaxD_Cantidad) AS TotalVendido, D.FaxD_Cantidad * J.Joya_PrecioVenta AS Total
FROM            Vent.tbFacturaDetalles AS D INNER JOIN
                         Vent.tbFactura AS F ON D.Fact_Id = F.Fact_Id INNER JOIN
                         Vent.tbJoyas AS J ON D.Prod_Id = J.Joya_Id
						 where [Fact_Finalizado] = 0
GROUP BY J.Joya_Nombre, D.FaxD_Cantidad * J.Joya_PrecioVenta
GO
/****** Object:  Table [Vent].[tbMaquillajes]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbMaquillajes](
	[Maqu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Maqu_Nombre] [varchar](60) NOT NULL,
	[Maqu_PrecioCompra] [numeric](8, 2) NOT NULL,
	[Maqu_PrecioVenta] [numeric](8, 2) NOT NULL,
	[Maqu_PrecioMayor] [numeric](8, 2) NOT NULL,
	[Maqu_Imagen] [varchar](max) NOT NULL,
	[Prov_Id] [int] NOT NULL,
	[Marc_Id] [int] NOT NULL,
	[Maqu_UsuarioCreacion] [int] NULL,
	[Maqu_FechaCreacion] [datetime] NULL,
	[Maqu_UsuarioModificacion] [int] NULL,
	[Maqu_FechaModificacion] [datetime] NULL,
	[Maqu_Estado] [bit] NULL,
	[Maqu_Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Maqu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [Vent].[v_Dash_MaquillajeMes]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [Vent].[v_Dash_MaquillajeMes] as 
SELECT        TOP (5) M.Maqu_Nombre AS NombreProducto, SUM(D.FaxD_Cantidad) AS TotalVendido, D.FaxD_Cantidad * M.Maqu_PrecioVenta AS Total
FROM            Vent.tbFacturaDetalles AS D INNER JOIN
                         Vent.tbFactura AS F ON D.Fact_Id = F.Fact_Id INNER JOIN
                         Vent.tbMaquillajes AS M ON D.Prod_Id = M.Maqu_Id
WHERE        (D.FaxD_Dif = 0) and [Fact_Finalizado] = 0
GROUP BY M.Maqu_Nombre, D.FaxD_Cantidad * M.Maqu_PrecioVenta
GO
/****** Object:  View [dbo].[VW_VentasTotales]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[VW_VentasTotales]
AS
WITH Preliminary AS (
    SELECT
        fd.FaxD_Dif,
        CASE 
            WHEN fd.FaxD_Dif = 1 THEN j.Joya_Nombre 
            ELSE m.Maqu_Nombre 
        END AS Prod_Nombre,
        fd.FaxD_Cantidad,
        CASE 
            WHEN fd.FaxD_Dif = 1 THEN 'Joyas' 
            ELSE 'Maquillajes' 
        END AS Categoria,
        j.Joya_PrecioMayor,
        j.Joya_PrecioVenta,
        m.Maqu_PrecioMayor,
        m.Maqu_PrecioVenta,
        f.Fact_FechaFinalizado
    FROM
        [Vent].[tbFacturaDetalles] fd
    JOIN
        [Vent].[tbFactura] f ON fd.Fact_Id = f.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.Prod_Id = j.Joya_Id AND fd.FaxD_Dif = 1
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.Prod_Id = m.Maqu_Id AND fd.FaxD_Dif = 0
    WHERE
        f.Fact_Finalizado = 0
),
Aggregated AS (
    SELECT
        Prod_Nombre,
        Categoria,
        SUM(FaxD_Cantidad) AS Total_Cantidad,
        MAX(Joya_PrecioMayor) AS Max_Joya_PrecioMayor,
        MAX(Joya_PrecioVenta) AS Max_Joya_PrecioVenta,
        MAX(Maqu_PrecioMayor) AS Max_Maqu_PrecioMayor,
        MAX(Maqu_PrecioVenta) AS Max_Maqu_PrecioVenta,
        YEAR(Fact_FechaFinalizado) AS Año,
        MONTH(Fact_FechaFinalizado) AS Mes
    FROM Preliminary
    GROUP BY
        Prod_Nombre,
        Categoria,
        YEAR(Fact_FechaFinalizado),
        MONTH(Fact_FechaFinalizado)
),
Final AS (
    SELECT
        Prod_Nombre AS Producto,
        Total_Cantidad AS Cantidad,
        CASE
            WHEN Total_Cantidad >= 6 THEN 
                CASE
                    WHEN Categoria = 'Joyas' THEN Max_Joya_PrecioMayor
                    ELSE Max_Maqu_PrecioMayor
                END
            ELSE 
                CASE
                    WHEN Categoria = 'Joyas' THEN Max_Joya_PrecioVenta
                    ELSE Max_Maqu_PrecioVenta
                END
        END AS Precio_Unitario,
        Categoria,
        Año,
        Mes
    FROM
        Aggregated
)
SELECT
    Producto,
    Cantidad,
    Precio_Unitario,
    (Cantidad * Precio_Unitario) AS Total,
    Categoria,
    Año,
    Mes
FROM
    Final;
GO
/****** Object:  View [dbo].[VW_VentasMayoristas]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_VentasMayoristas]
AS
	 WITH Pricing AS (
    SELECT
        fd.FaxD_Dif,
        fd.Prod_Id,
        fd.Fact_Id,
        CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_Nombre ELSE m.Maqu_Nombre END AS Prod_Nombre,
        fd.FaxD_Cantidad,
        CASE WHEN fd.FaxD_Dif = 1 THEN 'Joyas' ELSE 'Maquillajes' END AS Categoria,
        CASE 
            WHEN fd.FaxD_Cantidad > 5 AND fd.FaxD_Dif = 1 AND j.Joya_PrecioMayor IS NOT NULL THEN j.Joya_PrecioMayor
            WHEN fd.FaxD_Cantidad <= 5 AND fd.FaxD_Dif = 1 AND j.Joya_PrecioVenta IS NOT NULL THEN j.Joya_PrecioVenta
            WHEN fd.FaxD_Cantidad > 5 AND fd.FaxD_Dif = 0 AND m.Maqu_PrecioMayor IS NOT NULL THEN m.Maqu_PrecioMayor
            ELSE m.Maqu_PrecioVenta
        END AS Price,
        f.Fact_FechaFinalizado
    FROM
        Vent.tbFacturaDetalles AS fd
    INNER JOIN
        Vent.tbFactura AS f ON fd.Fact_Id = f.Fact_Id
    LEFT OUTER JOIN
        Vent.tbJoyas AS j ON fd.Prod_Id = j.Joya_Id AND fd.FaxD_Dif = 1
    LEFT OUTER JOIN
        Vent.tbMaquillajes AS m ON fd.Prod_Id = m.Maqu_Id AND fd.FaxD_Dif = 0
    WHERE
        f.Fact_Finalizado = 0
),
Consolidated AS (
    SELECT
        Fact_Id,
        Prod_Nombre,
        Categoria,
        SUM(FaxD_Cantidad) AS Total_Cantidad,
        MAX(Price) AS Prod_Precio,
        YEAR(Fact_FechaFinalizado) AS Año,
        MONTH(Fact_FechaFinalizado) AS Mes,
        FORMAT(Fact_FechaFinalizado, 'yyyy-MM-dd') AS Fact_FechaFinalizado
    FROM
        Pricing
    GROUP BY
        Fact_Id, Prod_Nombre, Categoria, YEAR(Fact_FechaFinalizado), MONTH(Fact_FechaFinalizado), Fact_FechaFinalizado
)
SELECT
    Fact_Id,
    Prod_Nombre AS Producto,
    Total_Cantidad AS Cantidad,
    Prod_Precio AS Precio_Unitario,
    Total_Cantidad * Prod_Precio AS Total,
    Categoria,
    Año,
    Fact_FechaFinalizado
FROM
    Consolidated;
GO
/****** Object:  Table [Acce].[tbPantallas]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallas](
	[Pant_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pant_Descripcion] [varchar](60) NOT NULL,
	[Pant_UsuarioCreacion] [int] NULL,
	[Pant_FechaCreacion] [datetime] NULL,
	[Pant_UsuarioModificacion] [int] NULL,
	[Pant_FechaModificacion] [datetime] NULL,
	[Pant_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbPantallasPorRoles]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallasPorRoles](
	[Paxr_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Id] [int] NULL,
	[Pant_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Paxr_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbUsuarios]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbUsuarios](
	[Usua_Id] [int] IDENTITY(1,1) NOT NULL,
	[Usua_Usuario] [varchar](max) NOT NULL,
	[Usua_Contraseña] [varchar](max) NOT NULL,
	[Usua_Administrador] [bit] NOT NULL,
	[Empl_Id] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
	[Usua_UsuarioCreacion] [int] NULL,
	[Usua_FechaCreacion] [datetime] NULL,
	[Usua_UsuarioModificacion] [int] NULL,
	[Usua_FechaModificacion] [datetime] NULL,
	[Usua_Estado] [bit] NULL,
	[Usua_Codigo] [varchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Usua_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[Id] [nchar](10) NOT NULL,
	[nombe] [nchar](10) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbCargos]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbCargos](
	[Carg_Id] [int] IDENTITY(1,1) NOT NULL,
	[Carg_Cargo] [varchar](60) NOT NULL,
	[Carg_UsuarioCreacion] [int] NOT NULL,
	[Carg_FechaCreacion] [datetime] NOT NULL,
	[Carg_UsuarioModificacion] [int] NULL,
	[Carg_FechaModificacion] [datetime] NULL,
	[Carg_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Carg_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbCategorias]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbCategorias](
	[Cate_Id] [int] IDENTITY(1,1) NOT NULL,
	[Cate_Categoria] [varchar](60) NULL,
	[Cate_UsuarioCreacion] [int] NULL,
	[Cate_FechaCreacion] [datetime] NULL,
	[Cate_UsuarioModificacion] [int] NULL,
	[Cate_FechaModificacion] [datetime] NULL,
	[Cate_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Cate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbClientes]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbClientes](
	[Clie_Id] [int] IDENTITY(1,1) NOT NULL,
	[Clie_Nombre] [varchar](60) NOT NULL,
	[Clie_Apellido] [varchar](60) NOT NULL,
	[Clie_FechaNac] [datetime] NOT NULL,
	[Clie_Sexo] [char](1) NOT NULL,
	[Muni_Codigo] [varchar](4) NOT NULL,
	[Esta_Id] [int] NOT NULL,
	[Clie_UsuarioCreacion] [int] NULL,
	[Clie_FechaCreacion] [datetime] NULL,
	[Clie_UsuarioModificacion] [int] NULL,
	[Clie_FechaModificacion] [datetime] NULL,
	[Clie_Estado] [bit] NULL,
	[Clie_DNI] [varchar](13) NULL,
PRIMARY KEY CLUSTERED 
(
	[Clie_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbDepartamentos]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbDepartamentos](
	[Depa_Codigo] [varchar](2) NOT NULL,
	[Depa_Departamento] [varchar](60) NOT NULL,
	[Depa_UsuarioCreacion] [int] NOT NULL,
	[Depa_FechaCreacion] [datetime] NOT NULL,
	[Depa_UsuarioModificacion] [int] NULL,
	[Depa_FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Depa_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEmpleados]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEmpleados](
	[Empl_Id] [int] IDENTITY(1,1) NOT NULL,
	[Empl_Nombre] [varchar](30) NOT NULL,
	[Empl_Apellido] [varchar](30) NOT NULL,
	[Empl_Sexo] [char](1) NOT NULL,
	[Empl_FechaNac] [datetime] NOT NULL,
	[Muni_Codigo] [varchar](4) NOT NULL,
	[Esta_Id] [int] NOT NULL,
	[Carg_Id] [int] NOT NULL,
	[Empl_UsuarioCreacion] [int] NULL,
	[Empl_FechaCreacion] [datetime] NULL,
	[Empl_UsuarioModificacion] [int] NULL,
	[Empl_FechaModificacion] [datetime] NULL,
	[Empl_Estado] [bit] NULL,
	[Empl_Correo] [varchar](max) NULL,
	[Empl_DNI] [varchar](13) NULL,
	[Sucu_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Empl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEstadosCiviles]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEstadosCiviles](
	[Esta_Id] [int] IDENTITY(1,1) NOT NULL,
	[Esta_EstadoCivil] [varchar](60) NOT NULL,
	[Esta_UsuarioCreacion] [int] NULL,
	[Esta_FechaCreacion] [datetime] NULL,
	[Esta_UsuarioModificacion] [int] NULL,
	[Esta_FechaModificacion] [datetime] NULL,
	[Esta_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Esta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMarcas]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMarcas](
	[Marc_Id] [int] IDENTITY(1,1) NOT NULL,
	[Marc_Marca] [varchar](60) NOT NULL,
	[Marc_UsuarioCreacion] [int] NULL,
	[Marc_FechaCreacion] [datetime] NULL,
	[Marc_UsuarioModificacion] [int] NULL,
	[Marc_FechaModificacion] [datetime] NULL,
	[Marc_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Marc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMateriales]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMateriales](
	[Mate_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mate_Material] [varchar](60) NOT NULL,
	[Mate_UsuarioCreacion] [int] NULL,
	[Mate_FechaCreacion] [datetime] NULL,
	[Mate_UsuarioModificacion] [int] NULL,
	[Mate_FechaModificacion] [datetime] NULL,
	[Mate_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMetodosPago]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMetodosPago](
	[Mepa_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mepa_Metodo] [varchar](60) NOT NULL,
	[Mepa_UsuarioCreacion] [int] NULL,
	[Mepa_FechaCreacion] [datetime] NULL,
	[Mepa_UsuarioModificacion] [int] NULL,
	[Mepa_FechaModificacion] [datetime] NULL,
	[Mepa_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mepa_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMunicipios]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMunicipios](
	[Muni_Codigo] [varchar](4) NOT NULL,
	[Muni_Municipio] [varchar](60) NOT NULL,
	[Depa_Codigo] [varchar](2) NOT NULL,
	[Muni_UsuarioCreacion] [int] NULL,
	[Muni_FechaCreacion] [datetime] NULL,
	[Muni_UsuarioModificacion] [int] NULL,
	[Muni_FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Muni_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbProductosPorSucurales]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbProductosPorSucurales](
	[Prxs_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prxs_Dif] [bit] NULL,
	[Prod_Id] [int] NULL,
	[Prsx_Stock] [int] NULL,
	[Sucu_Id] [int] NULL,
	[Pren_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Prxs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbProveedores]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbProveedores](
	[Prov_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prov_Proveedor] [varchar](60) NOT NULL,
	[Prov_Telefono] [varchar](8) NOT NULL,
	[Muni_Codigo] [varchar](4) NOT NULL,
	[Prov_UsuarioCreacion] [int] NOT NULL,
	[Prov_FechaCreacion] [datetime] NOT NULL,
	[Prov_UsuarioModificacion] [int] NULL,
	[Prov_FechaModificacion] [datetime] NULL,
	[Prov_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Prov_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbSucursales]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbSucursales](
	[Sucu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sucu_Nombre] [varchar](60) NULL,
	[Muni_Codigo] [varchar](4) NULL,
	[Sucu_UsuarioCreacion] [int] NULL,
	[Sucu_FechaCreacion] [datetime] NULL,
	[Sucu_UsuarioModificacion] [int] NULL,
	[Sucu_FechaModificacion] [datetime] NULL,
	[Sucu_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sucu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbCajas]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbCajas](
	[caja_Id] [int] IDENTITY(1,1) NOT NULL,
	[caja_UsuarioApertura] [int] NULL,
	[caja_FechaApertura] [datetime] NULL,
	[caja_UsuarioCierre] [int] NULL,
	[caja_FechaCierre] [datetime] NULL,
	[caja_MontoInicial] [numeric](9, 2) NULL,
	[caja_MontoFinal] [numeric](9, 2) NULL,
	[caja_MontoSistema] [numeric](9, 2) NULL,
	[Sucu_Id] [int] NULL,
	[caja_Observacion] [varchar](max) NULL,
	[caja_Finalizado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[caja_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbFacturaCompraDetalle]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbFacturaCompraDetalle](
	[FaCD_Id] [int] IDENTITY(1,1) NOT NULL,
	[FaCE_Id] [int] NULL,
	[FaCD_Dif] [bit] NULL,
	[Prod_Id] [int] NULL,
	[FaCD_Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FaCD_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbFacturaCompraEncabezado]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbFacturaCompraEncabezado](
	[FaCE_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prov_Id] [int] NULL,
	[Mepa_Id] [int] NULL,
	[FaCE_fechafinalizacion] [datetime] NULL,
	[FeCE_UsuarioCreacion] [int] NULL,
	[FaCE_FechaCreacion] [datetime] NULL,
	[FaCE_UsuarioModificacion] [int] NULL,
	[FaCE_FechaModificacion] [datetime] NULL,
	[FaCE_Etado] [bit] NULL,
	[FaCE_Finalizada] [bit] NULL,
	[Sucu_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FaCE_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbPreciosBitacora]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbPreciosBitacora](
	[Prec_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prec_Nombre] [varchar](60) NULL,
	[Prec_PrecioCompra] [numeric](8, 2) NULL,
	[Prec_PrecioVenta] [numeric](8, 2) NULL,
	[Prec_PrecioMayor] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Prec_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbProductosPorSucursalesEncabezados]    Script Date: 27/5/2024 10:19:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbProductosPorSucursalesEncabezados](
	[Pren_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sucu_Id] [int] NULL,
	[Pren_UsuarioCreacion] [int] NULL,
	[Pren_FechaCreacion] [datetime] NULL,
	[Pren_UsuarioModificacion] [int] NULL,
	[Pren_FechaModificacion] [datetime] NULL,
	[Pren_Finalizado] [bit] NULL,
	[Pren_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pren_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Acce].[tbPantallas] ON 

INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (1, N'Usuarios', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (2, N'Roles', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (3, N'Cargos', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (4, N'Categorias', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (5, N'Clientes', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (6, N'Departamentos', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (7, N'Estados Civiles', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (9, N'Marcas', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (10, N'Materiales', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (12, N'Municipios', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (13, N'Proveedores', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (14, N'Sucursales', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (15, N'Facturas', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (16, N'Joyas', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (17, N'Maquillajes', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (18, N'Facturas de Compra', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (19, N'Reportes', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (20, N'Control de stock', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (21, N'Ventas por empleado', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (22, N'Ventas por mes', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (23, N'Productos vendidos', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (24, N'Ventas Anuales', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (25, N'Ventas mayoristas', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (26, N'Mesuales', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (27, N'Anuales', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (28, N'Empleados', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (29, N'Sucursales', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (30, N'Reporte de caja', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (31, N'Transferencias', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (32, N'Ventas por pago', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (33, N'Abrir Caja', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_UsuarioCreacion], [Pant_FechaCreacion], [Pant_UsuarioModificacion], [Pant_FechaModificacion], [Pant_Estado]) VALUES (34, N'Cerrar caja', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbPantallas] OFF
GO
SET IDENTITY_INSERT [Acce].[tbPantallasPorRoles] ON 

INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (46, 9, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (47, 9, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (48, 9, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (49, 9, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (50, 9, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (51, 9, 8)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (52, 9, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (53, 9, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (54, 9, 11)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (55, 9, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (56, 9, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (65, 0, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (66, 0, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (67, 0, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (68, 0, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (69, 0, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (94, 10, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (95, 10, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (96, 10, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (97, 10, 8)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (98, 10, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (99, 10, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (100, 6, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (101, 6, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (102, 6, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (103, 6, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (104, 2, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (105, 2, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (110, 7, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (111, 7, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (112, 7, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (113, 7, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (114, 7, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (115, 7, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (116, 7, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (117, 7, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (118, 7, 8)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (119, 7, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (120, 7, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (121, 7, 11)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (122, 7, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (123, 7, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (124, 11, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (125, 11, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (126, 11, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (127, 11, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (128, 11, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (129, 11, 8)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (130, 11, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (131, 11, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (132, 11, 11)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (133, 11, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (134, 11, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (142, 12, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (143, 12, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (144, 12, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (145, 12, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (146, 12, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (147, 12, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (148, 12, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (149, 12, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (150, 12, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (151, 12, 8)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (152, 12, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (153, 12, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (154, 12, 11)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (155, 12, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (156, 12, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (511, 1, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (512, 1, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (513, 1, 16)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (514, 1, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (515, 1, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (516, 1, 18)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (517, 1, 20)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (518, 1, 21)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (519, 1, 22)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (520, 1, 23)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (521, 1, 24)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (522, 1, 25)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (523, 1, 26)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (524, 1, 27)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (525, 22, 28)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (526, 22, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (527, 22, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (528, 22, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (529, 22, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (530, 22, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (531, 22, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (532, 22, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (533, 22, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (534, 22, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (535, 23, 28)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (536, 23, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (537, 23, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (538, 23, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (539, 23, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (540, 23, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (541, 23, 9)
GO
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (542, 23, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (543, 23, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (544, 23, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (545, 23, 16)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (546, 23, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (547, 23, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (548, 23, 18)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (549, 23, 20)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (550, 23, 21)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (551, 23, 22)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (552, 23, 23)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (553, 23, 24)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (554, 23, 25)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (555, 23, 26)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (556, 23, 27)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (607, 18, 16)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (608, 18, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (609, 18, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (610, 18, 18)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (670, 27, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (671, 27, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (672, 27, 28)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (673, 27, 14)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (674, 27, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (675, 27, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (676, 27, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (677, 27, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (678, 27, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (679, 27, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (680, 27, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (681, 27, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (682, 27, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (683, 27, 16)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (684, 27, 31)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (685, 27, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (686, 27, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (687, 27, 18)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (688, 27, 20)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (689, 27, 21)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (690, 27, 22)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (691, 27, 23)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (692, 27, 24)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (693, 27, 25)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (694, 27, 26)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (695, 27, 27)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (696, 27, 30)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1100, 28, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1101, 28, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1102, 28, 28)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1103, 28, 14)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1104, 28, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1105, 28, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1106, 28, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1107, 28, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1108, 28, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1109, 28, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1110, 28, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1111, 28, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1112, 28, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1113, 28, 16)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1114, 28, 31)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1115, 28, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1116, 28, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1117, 28, 18)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1118, 28, 30)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1119, 28, 32)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1120, 28, 20)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1121, 28, 21)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1122, 28, 22)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1123, 28, 23)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1124, 28, 24)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1125, 28, 25)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1126, 28, 26)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1127, 28, 27)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1128, 28, 33)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1129, 28, 34)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1130, 30, 18)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1131, 30, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1132, 30, 16)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1133, 31, 1)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1134, 31, 28)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1135, 31, 2)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1136, 31, 14)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1137, 31, 3)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1138, 31, 4)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1139, 31, 5)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1140, 31, 6)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1141, 31, 7)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1142, 31, 9)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1143, 31, 10)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1144, 31, 12)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1145, 31, 13)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1146, 31, 16)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1147, 31, 31)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1148, 31, 15)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1149, 31, 17)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1150, 31, 18)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1151, 31, 26)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1152, 31, 27)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1153, 31, 30)
GO
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1154, 31, 32)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1155, 31, 20)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1156, 31, 21)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1157, 31, 22)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1158, 31, 23)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1159, 31, 24)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1160, 31, 25)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1161, 31, 33)
INSERT [Acce].[tbPantallasPorRoles] ([Paxr_Id], [Role_Id], [Pant_Id]) VALUES (1162, 31, 34)
SET IDENTITY_INSERT [Acce].[tbPantallasPorRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbRoles] ON 

INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (1, N'Administrador', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, CAST(N'2024-05-15T11:09:03.700' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (2, N'gerente2', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, CAST(N'2024-05-07T01:10:31.627' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (5, N'afafafafsd', 1, CAST(N'2024-05-06T21:29:18.660' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (6, N'Admiiin', 1, CAST(N'2024-05-06T22:05:53.853' AS DateTime), 1, CAST(N'2024-05-07T01:07:35.353' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (7, N'Supervisor', 1, CAST(N'2024-05-06T22:15:14.243' AS DateTime), 1, CAST(N'2024-05-07T08:49:44.293' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (9, N'PRUEBA', 1, CAST(N'2024-05-06T23:42:44.693' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (10, N'Administra', 1, CAST(N'2024-05-07T00:25:10.737' AS DateTime), 1, CAST(N'2024-05-07T01:07:22.593' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (11, N'Mindy', 1, CAST(N'2024-05-07T09:32:24.163' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (12, N'MindyF', 1, CAST(N'2024-05-07T09:32:41.003' AS DateTime), 1, CAST(N'2024-05-07T09:28:06.190' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (18, N'Prueba', 1, CAST(N'2024-05-15T22:05:01.757' AS DateTime), 11, CAST(N'2024-05-15T23:01:07.267' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (19, N'Prueba', 1, CAST(N'2024-05-15T22:05:01.900' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (20, N'Pruebaa', 2, CAST(N'2024-05-15T22:14:57.407' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (21, N'PruebaasdAD', 2, CAST(N'2024-05-15T22:19:18.547' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (22, N'PruebaasdAD', 2, CAST(N'2024-05-15T22:20:38.067' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (23, N'PruebaasdAD', 2, CAST(N'2024-05-15T22:20:45.917' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (27, N'PROBANDO', 2, CAST(N'2024-05-15T22:42:37.387' AS DateTime), 11, CAST(N'2024-05-17T14:42:10.437' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (28, N'Cajera', 11, CAST(N'2024-05-21T13:32:09.397' AS DateTime), 2, CAST(N'2024-05-22T08:07:08.347' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (30, N'ultimo momento', 10, CAST(N'2024-05-22T13:59:13.243' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Role_Id], [Role_Rol], [Role_UsuarioCreacion], [Role_FechaCreacion], [Role_UsuarioModificacion], [Role_FechaModificacion], [Role_Estado]) VALUES (31, N'coso', 2, CAST(N'2024-05-22T16:48:58.640' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbUsuarios] ON 

INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (1, N'Admin', N'Admin', 0, 3, 1, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, NULL, NULL, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (2, N'Fabiola', N'149A860CDD79D7714004FD2CF699B0F555879FE4AFD99D99831D356354F8A26C2FD34B84EF786335AA22A8638E643D932C538F50DC39A728AB63A3C15C92E282', 1, 3, 28, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 10, CAST(N'2024-05-25T23:43:47.663' AS DateTime), 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (3, N'Eduardo', N'B270BB57A88B48434307D8B245C2734AA333DB584670E8C3D11A92A7CE33AD99EAE71EB2EFDD50ADEBB7CA0EBCFFF7CE4765FD37C6106348ED7A97D8774E3984', 0, 3, 1, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, NULL, 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (4, N'Minesit', N'B270BB57A88B48434307D8B245C2734AA333DB584670E8C3D11A92A7CE33AD99EAE71EB2EFDD50ADEBB7CA0EBCFFF7CE4765FD37C6106348ED7A97D8774E3984', 0, 3, 1, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, CAST(N'2024-05-06T08:05:54.623' AS DateTime), 0, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (5, N'Insertarxd', N'75B1D1075E53DC7C92C9154FC27E05CCAC18E3C3DE87134920B2E1B2AFA7FBDF1159F0AA930CD2EB0EB731539B29EA2EC41120D76C22B3693857852C4762CCB1', 0, 3, 1, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, CAST(N'2024-05-03T17:56:21.917' AS DateTime), 0, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (6, N'SKKFAK', N'243C061F8DD9AF59B57858D135C0001C6B4267286D6FE663A9008B2399817A20254E57F67ED359FA9334E8CDB8929E890B852DF3676ADFB7B39769FF8FC4F7DD', 0, 3, 1, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, NULL, 0, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (7, N'XDDD', N'3AE98A5E177162E6E20976C971ABECF7660D1F86FF85EEE53D93810BDE9A239256274C00D0C185D8DE13F2B4A337E30209C5F998AA72444A7332BAF99406518E', 1, 3, 2, 1, CAST(N'2024-05-03T17:34:03.157' AS DateTime), NULL, NULL, 0, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (8, N'juanito', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', 1, 3, 1, 1, CAST(N'2024-07-05T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (9, N'Esdra', N'B662FBCD16CF13F937E44C42232523BB9EB6C5B93462DF000755715CC1783F52C38E1E75E78C94D9695EDB2D8A9661DF38C3056ABADAD57385ECC73388E492C8', 0, 5, 28, 1, CAST(N'2024-05-07T14:09:34.200' AS DateTime), 11, CAST(N'2024-05-21T13:32:22.257' AS DateTime), 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (10, N'123', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', 1, 7, 1, 1, CAST(N'2024-05-08T14:59:11.297' AS DateTime), NULL, CAST(N'2024-05-22T13:25:30.223' AS DateTime), 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (11, N'Mine25', N'F2D9BD628918BB9CB7CC92FB3FF5663F23F60366DAC0DCD313D63BC599969EFBD34A4DC483AA7A5DE21142E881CD88A99CBF4A6D975601E3C7DF3AB4F37BE440', 1, 5, 27, 1, CAST(N'2024-05-15T23:00:34.527' AS DateTime), 11, CAST(N'2024-05-21T08:54:55.990' AS DateTime), 0, N'314913')
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (12, N'Jezer', N'F91666E52D7896162EEABC6D2DF0F95ABAC67752FCCA462CF1669FB9227C8E1C338D98ACF1FB403E9B1BCED2D4EC7F00C809C7ED4237EC784317FE05B4C5A466', 0, 3, 28, 1, CAST(N'2024-05-21T15:08:39.770' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (13, N'juancho123', N'D404559F602EAB6FD602AC7680DACBFAADD13630335E951F097AF3900E9DE176B6DB28512F2E000B9D04FBA5133E8B1C6E8DF59DB3A8AB9D60BE4B97CC9E81DB', 0, 5, 6, 1, CAST(N'2024-05-21T21:55:20.597' AS DateTime), 10, CAST(N'2024-05-21T21:55:45.887' AS DateTime), 0, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (14, N'juancho', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', 0, 7, 30, 1, CAST(N'2024-05-22T13:59:30.080' AS DateTime), NULL, NULL, 0, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contraseña], [Usua_Administrador], [Empl_Id], [Role_Id], [Usua_UsuarioCreacion], [Usua_FechaCreacion], [Usua_UsuarioModificacion], [Usua_FechaModificacion], [Usua_Estado], [Usua_Codigo]) VALUES (15, N'Jason', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', 1, 14, 31, 1, CAST(N'2024-05-22T16:49:27.503' AS DateTime), NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [Acce].[tbUsuarios] OFF
GO
SET IDENTITY_INSERT [Gral].[tbCargos] ON 

INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Cargo], [Carg_UsuarioCreacion], [Carg_FechaCreacion], [Carg_UsuarioModificacion], [Carg_FechaModificacion], [Carg_Estado]) VALUES (1, N'Mesero', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Cargo], [Carg_UsuarioCreacion], [Carg_FechaCreacion], [Carg_UsuarioModificacion], [Carg_FechaModificacion], [Carg_Estado]) VALUES (2, N'Cajera', 1, CAST(N'2024-04-30T20:08:47.690' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Cargo], [Carg_UsuarioCreacion], [Carg_FechaCreacion], [Carg_UsuarioModificacion], [Carg_FechaModificacion], [Carg_Estado]) VALUES (3, N'porfa', 1, CAST(N'2024-05-03T15:56:39.300' AS DateTime), 1, CAST(N'2024-05-03T16:23:55.360' AS DateTime), 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Cargo], [Carg_UsuarioCreacion], [Carg_FechaCreacion], [Carg_UsuarioModificacion], [Carg_FechaModificacion], [Carg_Estado]) VALUES (4, N'pruebita', 1, CAST(N'2024-05-03T23:52:01.190' AS DateTime), 1, CAST(N'2024-05-04T00:40:51.110' AS DateTime), 1)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Cargo], [Carg_UsuarioCreacion], [Carg_FechaCreacion], [Carg_UsuarioModificacion], [Carg_FechaModificacion], [Carg_Estado]) VALUES (5, N'PredicaX', 11, CAST(N'2024-05-15T23:23:13.043' AS DateTime), 11, CAST(N'2024-05-15T23:23:45.907' AS DateTime), 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Cargo], [Carg_UsuarioCreacion], [Carg_FechaCreacion], [Carg_UsuarioModificacion], [Carg_FechaModificacion], [Carg_Estado]) VALUES (6, N'cacaasasass', 10, CAST(N'2024-05-21T21:59:34.160' AS DateTime), 10, CAST(N'2024-05-21T21:59:37.570' AS DateTime), 0)
SET IDENTITY_INSERT [Gral].[tbCargos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbCategorias] ON 

INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (1, N'Oro', 1, CAST(N'2024-04-30T17:38:56.137' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (2, N'agagagag', 1, CAST(N'2024-05-04T17:38:56.137' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (3, N'Plata', 1, CAST(N'2024-05-04T17:38:56.137' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (4, N'pruebaaa', 1, CAST(N'2024-05-04T17:38:56.137' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (5, N'dfagahaha', 1, CAST(N'2024-05-06T10:43:56.433' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (6, N'sfagaagvc', 1, CAST(N'2024-05-06T10:44:37.407' AS DateTime), 1, CAST(N'2024-05-06T10:46:01.550' AS DateTime), 0)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (7, N'CategoriaPros', 11, CAST(N'2024-05-15T23:43:49.973' AS DateTime), 11, CAST(N'2024-05-15T23:43:53.413' AS DateTime), 0)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (8, N'.', 10, CAST(N'2024-05-16T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbCategorias] ([Cate_Id], [Cate_Categoria], [Cate_UsuarioCreacion], [Cate_FechaCreacion], [Cate_UsuarioModificacion], [Cate_FechaModificacion], [Cate_Estado]) VALUES (9, N'cacaasas', 10, CAST(N'2024-05-21T21:58:07.967' AS DateTime), 10, CAST(N'2024-05-21T21:58:13.647' AS DateTime), 0)
SET IDENTITY_INSERT [Gral].[tbCategorias] OFF
GO
SET IDENTITY_INSERT [Gral].[tbClientes] ON 

INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (1, N'Consumidor', N'Final', CAST(N'2024-04-30T21:44:50.783' AS DateTime), N'F', N'0320', 1, 1, CAST(N'2024-04-30T15:45:17.663' AS DateTime), NULL, NULL, 1, N'0000000000000')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (2, N'Eduardo', N'Varela', CAST(N'2024-05-14T20:28:00.000' AS DateTime), N'F', N'0501', 3, 1, CAST(N'2024-05-04T20:29:01.277' AS DateTime), 1, NULL, 1, N'0611200500732')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (3, N'Mindy', N'Campos', CAST(N'2024-05-05T14:47:00.000' AS DateTime), N'M', N'0501', 3, 1, CAST(N'2024-05-05T14:47:46.253' AS DateTime), NULL, NULL, 1, N'0711200500732')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (4, N'sxd', N'SDFAF', CAST(N'2024-05-10T10:05:00.000' AS DateTime), N'M', N'8645', 1, 1, CAST(N'2024-05-07T10:05:27.390' AS DateTime), 1, NULL, 1, N'1414141414141')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (5, N'MONICA', N'CHACON', CAST(N'2024-01-10T20:13:00.000' AS DateTime), N'M', N'0202', 1, 1, CAST(N'2024-05-15T20:13:42.000' AS DateTime), NULL, NULL, 1, N'08081')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (6, N'KAFKAAASDA', N'XD', CAST(N'2024-05-07T23:55:00.000' AS DateTime), N'M', N'0501', 1, 1, CAST(N'2024-05-15T23:55:55.540' AS DateTime), 11, CAST(N'2024-05-15T23:59:16.040' AS DateTime), 0, N'1414141415151')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (7, N'fasadasda', N'asdadfsafas', CAST(N'2024-05-31T21:58:00.000' AS DateTime), N'F', N'1453', 3, 1, CAST(N'2024-05-21T21:58:57.907' AS DateTime), 10, CAST(N'2024-05-21T21:59:19.697' AS DateTime), 0, N'1231231212333')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (8, N'fasadasda', N'qwe', CAST(N'2024-05-06T22:18:00.000' AS DateTime), N'M', N'0202', 1, 1, CAST(N'2024-05-21T22:19:02.053' AS DateTime), NULL, NULL, 1, N'111')
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_Nombre], [Clie_Apellido], [Clie_FechaNac], [Clie_Sexo], [Muni_Codigo], [Esta_Id], [Clie_UsuarioCreacion], [Clie_FechaCreacion], [Clie_UsuarioModificacion], [Clie_FechaModificacion], [Clie_Estado], [Clie_DNI]) VALUES (9, N'fasadasda', N'qwe', CAST(N'2024-05-14T22:22:00.000' AS DateTime), N'M', N'0201', 3, 1, CAST(N'2024-05-21T22:22:33.737' AS DateTime), NULL, NULL, 1, N'1233333333333')
SET IDENTITY_INSERT [Gral].[tbClientes] OFF
GO
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'01', N'Atlántida', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'02', N'Colón', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'03', N'Comayagua', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'05', N'Cortés', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'06', N'Choluteca', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'07', N'El Paraíso', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'08', N'Francisco Morazán', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'09', N'Gracias a Dios', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'10', N'Intibucaaas', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), 1, CAST(N'2024-05-06T08:13:53.790' AS DateTime))
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'11', N'Islas de la Bahía', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'12', N'La Paz', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'13', N'Lempira', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'14', N'Ocotepeque', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'15', N'Olancho', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'16', N'Santa Bárbara', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Depa_Codigo], [Depa_Departamento], [Depa_UsuarioCreacion], [Depa_FechaCreacion], [Depa_UsuarioModificacion], [Depa_FechaModificacion]) VALUES (N'17', N'Valle', 1, CAST(N'2024-04-21T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Gral].[tbEmpleados] ON 

INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (3, N'Eduardo', N'Varela', N'M', CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'0501', 1, 1, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 2, CAST(N'2024-05-17T21:14:35.383' AS DateTime), 1, N'hd1videoscalidad@gmail.com', N'0611200500732', 3)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (4, N'Fav', N'campos', N'f', CAST(N'2001-07-12T00:00:00.000' AS DateTime), N'0320', 1, 1, 1, CAST(N'2024-05-04T23:11:20.243' AS DateTime), 1, CAST(N'2024-05-04T00:00:00.000' AS DateTime), 0, N'eduardo.jafet.varela.salinas@gmail.com', N'0511200500732', 3)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (5, N'Esdra', N'Cerna', N'F', CAST(N'2024-05-29T23:56:00.000' AS DateTime), N'0501', 5, 2, 1, CAST(N'2024-05-04T23:58:51.627' AS DateTime), 2, CAST(N'2024-05-25T02:09:35.193' AS DateTime), 1, N'esdracerna@gmail.com', N'0711200500732', 3)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (6, N'dfagagagag', N'afaGAGAG', N'M', CAST(N'2024-05-01T10:24:00.000' AS DateTime), N'0501', 3, 1, 1, CAST(N'2024-05-07T10:24:26.500' AS DateTime), 1, CAST(N'2024-05-07T10:27:28.550' AS DateTime), 0, N'SDFAF', N'6666666666666', 3)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (7, N'Manuel', N'.', N'M', CAST(N'2005-08-15T09:30:00.000' AS DateTime), N'0294', 1, 2, 1, CAST(N'2024-05-08T14:57:08.943' AS DateTime), NULL, NULL, 1, N'jahir.lara99@gmail.com', N'0501200511', 3)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (13, N'KAFKAAASDATFGGFGF', N'XD', N'M', CAST(N'2024-05-12T00:32:00.000' AS DateTime), N'0294', 3, 2, 11, CAST(N'2024-05-16T00:32:38.633' AS DateTime), 11, CAST(N'2024-05-16T00:32:49.243' AS DateTime), 0, N'jahir.lara99@gmail.com', N'1414131313131', 3)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (14, N'dFfFfFffg', N'SAFA', N'M', CAST(N'2024-05-04T21:25:00.000' AS DateTime), N'0320', 1, 1, 11, CAST(N'2024-05-16T21:25:31.120' AS DateTime), 11, CAST(N'2024-05-16T21:28:19.330' AS DateTime), 1, N'Eduardo', N'3134344444', 4)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (15, N'casssssasda', N'casdfggasd', N'M', CAST(N'2024-05-01T22:00:00.000' AS DateTime), N'1453', 3, 4, 10, CAST(N'2024-05-21T22:01:15.640' AS DateTime), 10, CAST(N'2024-05-21T22:02:02.443' AS DateTime), 0, N'jasdujh123haahahahahahahaha@@@gmail.com', N'1899999999999', 4)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Empl_FechaNac], [Muni_Codigo], [Esta_Id], [Carg_Id], [Empl_UsuarioCreacion], [Empl_FechaCreacion], [Empl_UsuarioModificacion], [Empl_FechaModificacion], [Empl_Estado], [Empl_Correo], [Empl_DNI], [Sucu_Id]) VALUES (16, N'asdasdasd', N'asdasdasd', N'F', CAST(N'2024-05-10T22:52:00.000' AS DateTime), N'0294', 1, 1, 10, CAST(N'2024-05-21T22:53:05.120' AS DateTime), 10, CAST(N'2024-05-21T22:53:16.077' AS DateTime), 1, N'asdfasdf', N'11111111111', 4)
SET IDENTITY_INSERT [Gral].[tbEmpleados] OFF
GO
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] ON 

INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (1, N'Soltero', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), 1, CAST(N'2024-05-19T20:06:10.673' AS DateTime), 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (3, N'pruebaaaaasi', 1, CAST(N'2024-05-04T00:00:00.000' AS DateTime), 1, CAST(N'2024-05-04T00:36:12.937' AS DateTime), 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (4, N'pruebaaaaa', 1, CAST(N'2024-05-04T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (5, N'Casado', 1, CAST(N'2024-05-04T00:36:40.973' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (6, N'afagagag', 1, CAST(N'2024-05-06T10:48:54.613' AS DateTime), 1, CAST(N'2024-05-06T10:48:57.047' AS DateTime), 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (7, N'CASADOOOSS', 11, CAST(N'2024-05-16T00:46:31.067' AS DateTime), 11, CAST(N'2024-05-16T00:46:34.210' AS DateTime), 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (8, N'cacaasasasa', 10, CAST(N'2024-05-21T21:58:25.137' AS DateTime), 10, CAST(N'2024-05-21T21:58:28.837' AS DateTime), 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_EstadoCivil], [Esta_UsuarioCreacion], [Esta_FechaCreacion], [Esta_UsuarioModificacion], [Esta_FechaModificacion], [Esta_Estado]) VALUES (9, N'jhgfds', 15, CAST(N'2024-05-22T16:52:04.303' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] OFF
GO
SET IDENTITY_INSERT [Gral].[tbImpuestos] ON 

INSERT [Gral].[tbImpuestos] ([Impu_Id], [Impu_Impuesto], [Impu_UsuarioCreacion], [Impu_FechaCreacion], [Impu_UsuarioModificacion], [Impu_FechaModificacion], [Impu_Estado]) VALUES (1, CAST(15 AS Decimal(18, 0)), 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbImpuestos] ([Impu_Id], [Impu_Impuesto], [Impu_UsuarioCreacion], [Impu_FechaCreacion], [Impu_UsuarioModificacion], [Impu_FechaModificacion], [Impu_Estado]) VALUES (2, CAST(18 AS Decimal(18, 0)), 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbImpuestos] ([Impu_Id], [Impu_Impuesto], [Impu_UsuarioCreacion], [Impu_FechaCreacion], [Impu_UsuarioModificacion], [Impu_FechaModificacion], [Impu_Estado]) VALUES (3, NULL, 1, CAST(N'2024-04-30T14:58:31.470' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbImpuestos] ([Impu_Id], [Impu_Impuesto], [Impu_UsuarioCreacion], [Impu_FechaCreacion], [Impu_UsuarioModificacion], [Impu_FechaModificacion], [Impu_Estado]) VALUES (4, NULL, 1, CAST(N'2024-04-30T15:13:55.073' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbImpuestos] ([Impu_Id], [Impu_Impuesto], [Impu_UsuarioCreacion], [Impu_FechaCreacion], [Impu_UsuarioModificacion], [Impu_FechaModificacion], [Impu_Estado]) VALUES (5, CAST(20 AS Decimal(18, 0)), 1, CAST(N'2024-04-30T15:16:36.293' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbImpuestos] ([Impu_Id], [Impu_Impuesto], [Impu_UsuarioCreacion], [Impu_FechaCreacion], [Impu_UsuarioModificacion], [Impu_FechaModificacion], [Impu_Estado]) VALUES (6, CAST(38 AS Decimal(18, 0)), 1, NULL, 1, CAST(N'2024-05-04T01:17:47.343' AS DateTime), 0)
INSERT [Gral].[tbImpuestos] ([Impu_Id], [Impu_Impuesto], [Impu_UsuarioCreacion], [Impu_FechaCreacion], [Impu_UsuarioModificacion], [Impu_FechaModificacion], [Impu_Estado]) VALUES (7, CAST(90 AS Decimal(18, 0)), 1, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [Gral].[tbImpuestos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbMarcas] ON 

INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (3, N'Rare Beutiful', 1, CAST(N'2024-04-30T20:20:41.380' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (4, N'pruebaaaddd', 1, NULL, 1, CAST(N'2024-05-04T13:05:52.723' AS DateTime), 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (5, N'tyityy', 1, NULL, NULL, NULL, 1)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (6, N'pruebaaa', 1, NULL, NULL, NULL, 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (7, N'rafagagagagfagag', 1, CAST(N'2024-05-16T00:52:13.537' AS DateTime), 11, CAST(N'2024-05-16T00:52:16.023' AS DateTime), 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (8, N'generica', 10, CAST(N'2024-05-16T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (9, N'cacacasasasas', 10, CAST(N'2024-05-21T21:59:47.747' AS DateTime), 10, CAST(N'2024-05-21T21:59:51.407' AS DateTime), 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Marca], [Marc_UsuarioCreacion], [Marc_FechaCreacion], [Marc_UsuarioModificacion], [Marc_FechaModificacion], [Marc_Estado]) VALUES (10, N'reciprocro', 10, CAST(N'2024-05-22T12:27:51.140' AS DateTime), 15, CAST(N'2024-05-22T16:52:17.163' AS DateTime), 1)
SET IDENTITY_INSERT [Gral].[tbMarcas] OFF
GO
SET IDENTITY_INSERT [Gral].[tbMateriales] ON 

INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (1, N'Oro', 1, CAST(N'2024-04-30T20:29:53.367' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (2, N'pruebaaaa', 1, NULL, 1, CAST(N'2024-05-04T14:33:25.077' AS DateTime), 0)
INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (3, N'Plata', 1, NULL, NULL, NULL, 1)
INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (4, N'Acero', 1, NULL, NULL, NULL, 1)
INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (5, N'Hierrooss', 11, CAST(N'2024-05-16T01:09:49.600' AS DateTime), 11, CAST(N'2024-05-16T01:11:00.863' AS DateTime), 0)
INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (6, N'.', 10, CAST(N'2024-05-16T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (7, N'cacacasasasas', 10, CAST(N'2024-05-21T22:00:06.687' AS DateTime), 10, CAST(N'2024-05-21T22:00:10.950' AS DateTime), 0)
INSERT [Gral].[tbMateriales] ([Mate_Id], [Mate_Material], [Mate_UsuarioCreacion], [Mate_FechaCreacion], [Mate_UsuarioModificacion], [Mate_FechaModificacion], [Mate_Estado]) VALUES (8, N'fff', 15, CAST(N'2024-05-22T16:52:23.843' AS DateTime), 15, CAST(N'2024-05-22T16:52:28.673' AS DateTime), 1)
SET IDENTITY_INSERT [Gral].[tbMateriales] OFF
GO
SET IDENTITY_INSERT [Gral].[tbMetodosPago] ON 

INSERT [Gral].[tbMetodosPago] ([Mepa_Id], [Mepa_Metodo], [Mepa_UsuarioCreacion], [Mepa_FechaCreacion], [Mepa_UsuarioModificacion], [Mepa_FechaModificacion], [Mepa_Estado]) VALUES (1, N'Efectivo', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbMetodosPago] ([Mepa_Id], [Mepa_Metodo], [Mepa_UsuarioCreacion], [Mepa_FechaCreacion], [Mepa_UsuarioModificacion], [Mepa_FechaModificacion], [Mepa_Estado]) VALUES (4, N'Tarjeta de Credito', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbMetodosPago] ([Mepa_Id], [Mepa_Metodo], [Mepa_UsuarioCreacion], [Mepa_FechaCreacion], [Mepa_UsuarioModificacion], [Mepa_FechaModificacion], [Mepa_Estado]) VALUES (7, N'Pago en linea', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbMetodosPago] OFF
GO
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'0201', N'Santa Rosa', N'10', 1, CAST(N'2024-05-02T09:29:21.840' AS DateTime), 1, CAST(N'2024-05-02T21:09:45.713' AS DateTime))
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'0202', N'Funciona', N'08', 1, CAST(N'2024-05-02T09:31:22.587' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'0294', N'Probando', N'09', 1, CAST(N'2024-05-02T09:31:37.057' AS DateTime), 1, CAST(N'2024-05-02T20:28:13.963' AS DateTime))
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'0320', N'Las Lajas', N'03', 1, CAST(N'2024-04-30T00:10:51.213' AS DateTime), 1, CAST(N'2024-04-30T22:04:54.637' AS DateTime))
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'0452', N'Villanuevaaa', N'16', 1, CAST(N'2024-05-02T16:49:14.297' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'0501', N'San Pedro Sula', N'01', 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'1453', N'afatgaghaghaha', N'02', 11, CAST(N'2024-05-16T01:17:28.743' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'1551', N'zfgag', N'08', 1, CAST(N'2024-05-06T08:17:36.143' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'1553', N'Probandoss', N'02', 11, CAST(N'2024-05-16T01:16:54.553' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipios] ([Muni_Codigo], [Muni_Municipio], [Depa_Codigo], [Muni_UsuarioCreacion], [Muni_FechaCreacion], [Muni_UsuarioModificacion], [Muni_FechaModificacion]) VALUES (N'8645', N'fdagaggagagag', N'05', 1, CAST(N'2024-05-06T08:16:55.793' AS DateTime), 1, CAST(N'2024-05-16T01:17:34.573' AS DateTime))
GO
SET IDENTITY_INSERT [Gral].[tbProductosPorSucurales] ON 

INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (1, 1, 13, 0, 3, 1)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (2, 1, 14, 38, 3, 1)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (3, 1, 30, 0, 3, 1)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (4, 1, 16, 52, 3, 1)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (5, 0, 10, 1, 3, 1)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (6, 0, 87, 20, 3, 1)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (31, 1, 16, 0, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (32, 1, 14, 68, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (33, 1, 30, 31, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (34, 1, 13, 0, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (35, 0, 87, 49, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (36, 0, 10, 3, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (37, 1, 81, 984, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (38, 1, 82, 74, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (39, 0, 97, 28, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (40, 1, 74, 3, 3, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (41, 0, 98, 492, 3, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (42, 0, 99, 123, 3, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (43, 1, 74, 12, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (44, 1, 83, 0, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (45, 0, 100, 12, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (46, 1, 84, 984, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (47, 1, 74, 120, 7, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (48, 1, 59, 72, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (49, 1, 78, 0, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (50, 0, 101, 0, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (51, 1, 31, 12, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (52, 1, 64, 12, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (53, 0, 102, 123, NULL, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (54, 1, 85, 24, 7, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (55, 1, 85, 246, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (56, 0, 103, 738, 4, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (57, 1, 75, 123, 7, NULL)
INSERT [Gral].[tbProductosPorSucurales] ([Prxs_Id], [Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id], [Pren_Id]) VALUES (58, 1, 86, 0, 3, NULL)
SET IDENTITY_INSERT [Gral].[tbProductosPorSucurales] OFF
GO
SET IDENTITY_INSERT [Gral].[tbProveedores] ON 

INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (1, N'Proveedore1', N'55501222', N'0320', 1, CAST(N'2024-05-01T09:29:31.707' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (2, N'Compras', N'562465', N'0501', 1, CAST(N'2024-05-03T23:32:58.953' AS DateTime), 1, CAST(N'2024-05-04T00:30:24.990' AS DateTime), 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (3, N'Compra', N'14142312', N'0320', 1, CAST(N'2024-05-04T00:47:36.827' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (4, N'Compra', N'14142312', N'0501', 1, CAST(N'2024-05-04T00:48:31.833' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (5, N'afafa', N'1213231', N'0501', 1, CAST(N'2024-05-04T00:50:28.187' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (6, N'Comprasasfa', N'1131313', N'0501', 1, CAST(N'2024-05-04T00:52:11.983' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (7, N'Motomundo', N'14142312', N'0501', 1, CAST(N'2024-05-04T00:55:26.747' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (8, N'fasgagag', N'4141212', N'0501', 1, CAST(N'2024-05-04T00:56:17.720' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (9, N'rasgfagag', N'13414151', N'0501', 1, CAST(N'2024-05-04T01:00:35.280' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (10, N'FerreMax', N'13411412', N'0501', 1, CAST(N'2024-05-04T01:01:35.323' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (11, N'A todo dar', N'14151251', N'0501', 1, CAST(N'2024-05-04T01:02:12.160' AS DateTime), 15, CAST(N'2024-05-22T16:52:34.493' AS DateTime), 1)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (12, N'dfagagag', N'14141514', N'0501', 11, CAST(N'2024-05-16T01:23:57.860' AS DateTime), 11, CAST(N'2024-05-16T01:24:02.747' AS DateTime), 0)
INSERT [Gral].[tbProveedores] ([Prov_Id], [Prov_Proveedor], [Prov_Telefono], [Muni_Codigo], [Prov_UsuarioCreacion], [Prov_FechaCreacion], [Prov_UsuarioModificacion], [Prov_FechaModificacion], [Prov_Estado]) VALUES (13, N'cacacasasasasas', N'12123128', N'0294', 10, CAST(N'2024-05-21T22:00:26.343' AS DateTime), 10, CAST(N'2024-05-21T22:00:36.950' AS DateTime), 0)
SET IDENTITY_INSERT [Gral].[tbProveedores] OFF
GO
SET IDENTITY_INSERT [Gral].[tbSucursales] ON 

INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Nombre], [Muni_Codigo], [Sucu_UsuarioCreacion], [Sucu_FechaCreacion], [Sucu_UsuarioModificacion], [Sucu_FechaModificacion], [Sucu_Estado]) VALUES (3, N'Oficial', N'0320', 1, CAST(N'2024-05-01T04:06:38.783' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Nombre], [Muni_Codigo], [Sucu_UsuarioCreacion], [Sucu_FechaCreacion], [Sucu_UsuarioModificacion], [Sucu_FechaModificacion], [Sucu_Estado]) VALUES (4, N'El Calan', N'0320', 2, NULL, 10, CAST(N'2024-05-21T21:15:10.383' AS DateTime), 1)
INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Nombre], [Muni_Codigo], [Sucu_UsuarioCreacion], [Sucu_FechaCreacion], [Sucu_UsuarioModificacion], [Sucu_FechaModificacion], [Sucu_Estado]) VALUES (5, N'xde', N'0501', 11, CAST(N'2024-05-16T21:07:45.163' AS DateTime), 11, CAST(N'2024-05-16T21:07:57.017' AS DateTime), 0)
INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Nombre], [Muni_Codigo], [Sucu_UsuarioCreacion], [Sucu_FechaCreacion], [Sucu_UsuarioModificacion], [Sucu_FechaModificacion], [Sucu_Estado]) VALUES (6, N'merengue', N'0294', 10, CAST(N'2024-05-21T22:02:21.163' AS DateTime), 10, CAST(N'2024-05-21T22:02:34.550' AS DateTime), 0)
INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Nombre], [Muni_Codigo], [Sucu_UsuarioCreacion], [Sucu_FechaCreacion], [Sucu_UsuarioModificacion], [Sucu_FechaModificacion], [Sucu_Estado]) VALUES (7, N'coyons', N'0201', 10, CAST(N'2024-05-22T12:32:05.603' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Nombre], [Muni_Codigo], [Sucu_UsuarioCreacion], [Sucu_FechaCreacion], [Sucu_UsuarioModificacion], [Sucu_FechaModificacion], [Sucu_Estado]) VALUES (8, N'g', N'0320', 15, CAST(N'2024-05-22T16:54:29.880' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbSucursales] OFF
GO
SET IDENTITY_INSERT [Vent].[tbCajas] ON 

INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (1, 2, CAST(N'2024-05-19T12:00:00.000' AS DateTime), 2, CAST(N'2024-05-20T09:33:20.443' AS DateTime), CAST(200.00 AS Numeric(9, 2)), CAST(3000.00 AS Numeric(9, 2)), CAST(104078.45 AS Numeric(9, 2)), 3, N'S', NULL)
INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (3, 11, CAST(N'2024-05-20T08:04:20.673' AS DateTime), 11, NULL, CAST(66680.00 AS Numeric(9, 2)), CAST(70000.00 AS Numeric(9, 2)), CAST(7935.00 AS Numeric(9, 2)), 4, N'SIU', NULL)
INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (6, 2, CAST(N'2024-05-20T10:10:03.263' AS DateTime), 2, NULL, CAST(2420.00 AS Numeric(9, 2)), CAST(6560.00 AS Numeric(9, 2)), CAST(2990.00 AS Numeric(9, 2)), 3, N'afa', NULL)
INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (9, 2, CAST(N'2024-05-21T15:26:16.020' AS DateTime), 2, CAST(N'2024-05-22T12:04:45.310' AS DateTime), CAST(3000.00 AS Numeric(9, 2)), CAST(3300.00 AS Numeric(9, 2)), CAST(8638.80 AS Numeric(9, 2)), 3, N'afaag', 0)
INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (15, 2, CAST(N'2024-05-22T16:42:34.213' AS DateTime), 2, CAST(N'2024-05-24T17:27:27.213' AS DateTime), CAST(300.00 AS Numeric(9, 2)), CAST(3300.00 AS Numeric(9, 2)), CAST(12190.00 AS Numeric(9, 2)), 3, N'agag', 0)
INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (16, 2, CAST(N'2024-05-24T23:59:12.950' AS DateTime), 2, CAST(N'2024-05-25T00:33:16.807' AS DateTime), CAST(3000.00 AS Numeric(9, 2)), CAST(303000.00 AS Numeric(9, 2)), CAST(4485.00 AS Numeric(9, 2)), 3, N'Siu', 0)
INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (17, 9, CAST(N'2024-05-25T02:10:51.393' AS DateTime), 9, CAST(N'2024-05-25T02:10:51.393' AS DateTime), CAST(3340.00 AS Numeric(9, 2)), CAST(5000.00 AS Numeric(9, 2)), CAST(11040.00 AS Numeric(9, 2)), 3, N'sfa', 1)
INSERT [Vent].[tbCajas] ([caja_Id], [caja_UsuarioApertura], [caja_FechaApertura], [caja_UsuarioCierre], [caja_FechaCierre], [caja_MontoInicial], [caja_MontoFinal], [caja_MontoSistema], [Sucu_Id], [caja_Observacion], [caja_Finalizado]) VALUES (18, 9, CAST(N'2024-05-27T11:14:59.770' AS DateTime), 9, CAST(N'2024-05-27T11:14:59.770' AS DateTime), CAST(30.00 AS Numeric(9, 2)), CAST(1300.00 AS Numeric(9, 2)), CAST(1495.00 AS Numeric(9, 2)), 3, N'SIU', 1)
SET IDENTITY_INSERT [Vent].[tbCajas] OFF
GO
SET IDENTITY_INSERT [Vent].[tbFactura] ON 

INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (203, 1, 5, 1, 11, CAST(N'2024-05-21T12:38:47.513' AS DateTime), 11, CAST(N'2024-05-21T12:39:09.200' AS DateTime), 1, 0, CAST(N'2024-05-21T12:39:09.203' AS DateTime), 4, CAST(230.00 AS Numeric(8, 2)), CAST(2300.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (204, 1, 5, 1, 11, CAST(N'2024-05-21T12:39:27.580' AS DateTime), NULL, NULL, 1, 1, NULL, 4, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (205, 3, 5, 4, 11, CAST(N'2024-05-21T12:39:41.083' AS DateTime), 2, CAST(N'2024-05-22T15:41:33.470' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (206, 1, 5, 7, 11, CAST(N'2024-05-21T12:39:54.373' AS DateTime), 11, CAST(N'2024-05-21T12:41:24.367' AS DateTime), 1, 0, CAST(N'2024-05-21T12:41:24.370' AS DateTime), 4, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (207, 1, 5, 1, 11, CAST(N'2024-05-21T13:03:19.077' AS DateTime), 15, CAST(N'2024-05-22T16:55:58.317' AS DateTime), 1, 1, NULL, 4, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (208, 1, 5, 1, 11, CAST(N'2024-05-21T13:05:50.683' AS DateTime), 2, CAST(N'2024-05-22T15:41:37.737' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (209, 1, 5, 1, 11, CAST(N'2024-05-21T13:12:53.593' AS DateTime), NULL, NULL, 1, 1, NULL, 4, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (210, 1, 5, 1, 11, CAST(N'2024-05-21T13:16:58.857' AS DateTime), NULL, NULL, 1, 1, NULL, 4, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (211, 1, 5, 1, 11, CAST(N'2024-05-21T13:27:48.357' AS DateTime), 2, CAST(N'2024-05-22T15:41:36.133' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (212, 1, 5, 1, 11, CAST(N'2024-05-21T13:36:47.400' AS DateTime), 11, CAST(N'2024-05-21T13:37:46.067' AS DateTime), 1, 0, CAST(N'2024-05-21T13:37:46.067' AS DateTime), 4, CAST(5.00 AS Numeric(8, 2)), CAST(1500.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (213, 1, 5, 1, 11, CAST(N'2024-05-21T13:38:47.867' AS DateTime), 11, CAST(N'2024-05-21T13:39:01.060' AS DateTime), 1, 0, CAST(N'2024-05-21T13:39:01.070' AS DateTime), 4, CAST(55.00 AS Numeric(8, 2)), CAST(1550.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (214, 1, 3, 1, 2, CAST(N'2024-05-21T14:30:03.053' AS DateTime), 2, CAST(N'2024-05-21T14:30:07.407' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (215, 1, 3, 1, 2, CAST(N'2024-05-21T14:35:10.040' AS DateTime), 2, CAST(N'2024-05-21T14:35:14.957' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (216, 1, 3, 1, 2, CAST(N'2024-05-21T14:36:19.017' AS DateTime), 2, CAST(N'2024-05-21T14:36:25.753' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (217, 1, 3, 1, 2, CAST(N'2024-05-21T14:47:04.187' AS DateTime), NULL, NULL, 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (218, 1, 3, 1, 2, CAST(N'2024-05-21T14:47:50.610' AS DateTime), NULL, NULL, 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (219, 1, 3, 1, 2, CAST(N'2024-05-21T14:50:52.713' AS DateTime), 11, CAST(N'2024-05-22T01:01:12.487' AS DateTime), 1, 0, CAST(N'2024-05-22T01:01:12.500' AS DateTime), 4, CAST(505.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (220, 1, 3, 1, 2, CAST(N'2024-05-21T15:58:29.640' AS DateTime), 2, CAST(N'2024-05-21T15:58:35.590' AS DateTime), 1, 0, CAST(N'2024-05-21T15:58:35.590' AS DateTime), 3, CAST(2.20 AS Numeric(8, 2)), CAST(16.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (221, 1, 3, 1, 2, CAST(N'2024-05-21T16:27:05.173' AS DateTime), 2, CAST(N'2024-05-21T16:27:15.220' AS DateTime), 1, 0, CAST(N'2024-05-21T16:27:15.220' AS DateTime), 3, CAST(105.00 AS Numeric(8, 2)), CAST(1600.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (222, 1, 3, 1, 2, CAST(N'2024-05-21T16:27:34.530' AS DateTime), 2, CAST(N'2024-05-21T16:27:40.400' AS DateTime), 1, 0, CAST(N'2024-05-21T16:27:40.403' AS DateTime), 3, CAST(105.00 AS Numeric(8, 2)), CAST(1600.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (223, 1, 5, 4, 11, CAST(N'2024-05-22T00:52:26.557' AS DateTime), 11, CAST(N'2024-05-22T00:52:28.613' AS DateTime), 1, 0, CAST(N'2024-05-22T00:52:28.663' AS DateTime), 4, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (224, 1, 3, 1, 2, CAST(N'2024-05-22T15:38:55.683' AS DateTime), 2, CAST(N'2024-05-22T15:38:59.563' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (225, 1, 3, 1, 2, CAST(N'2024-05-22T15:40:44.593' AS DateTime), 2, CAST(N'2024-05-22T15:40:48.383' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (226, 1, 5, 1, 11, CAST(N'2024-05-22T15:48:45.483' AS DateTime), NULL, NULL, 1, 1, NULL, 4, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (227, 1, 3, 1, 2, CAST(N'2024-05-22T16:43:37.743' AS DateTime), NULL, NULL, 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (228, 1, 3, 1, 2, CAST(N'2024-05-22T16:46:04.967' AS DateTime), 2, CAST(N'2024-05-22T16:46:22.057' AS DateTime), 1, 0, CAST(N'2024-05-22T16:46:22.060' AS DateTime), 3, CAST(80800.00 AS Numeric(8, 2)), CAST(90000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (229, 1, 3, 1, 2, CAST(N'2024-05-24T17:26:45.997' AS DateTime), 2, CAST(N'2024-05-24T17:26:54.703' AS DateTime), 1, 0, CAST(N'2024-05-24T17:26:54.757' AS DateTime), 3, CAST(1124.00 AS Numeric(8, 2)), CAST(4114.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (230, 9, 3, 1, 2, CAST(N'2024-05-24T23:59:25.497' AS DateTime), 2, CAST(N'2024-05-24T23:59:35.767' AS DateTime), 1, 0, CAST(N'2024-05-24T23:59:35.833' AS DateTime), 3, CAST(505.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (231, 1, 3, 1, 2, CAST(N'2024-05-25T00:03:36.227' AS DateTime), 2, CAST(N'2024-05-25T00:03:40.837' AS DateTime), 1, 0, CAST(N'2024-05-25T00:03:40.900' AS DateTime), 3, CAST(1425.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (232, 1, 3, 1, 2, CAST(N'2024-05-25T01:45:02.417' AS DateTime), NULL, NULL, 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (233, 1, 3, 1, 2, CAST(N'2024-05-25T01:46:06.753' AS DateTime), 2, CAST(N'2024-05-25T01:46:12.837' AS DateTime), 1, 0, CAST(N'2024-05-25T01:46:12.840' AS DateTime), 3, CAST(505.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (234, 1, 3, 1, 2, CAST(N'2024-05-25T01:53:37.460' AS DateTime), 2, CAST(N'2024-05-25T01:53:44.007' AS DateTime), 1, 0, CAST(N'2024-05-25T01:53:44.007' AS DateTime), 3, CAST(505.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (235, 1, 3, 1, 2, CAST(N'2024-05-25T01:55:12.693' AS DateTime), 2, CAST(N'2024-05-25T01:55:14.813' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (236, 1, 3, 1, 2, CAST(N'2024-05-25T01:56:12.733' AS DateTime), 2, CAST(N'2024-05-25T01:56:16.533' AS DateTime), 1, 0, CAST(N'2024-05-25T01:56:16.533' AS DateTime), 3, CAST(10960.00 AS Numeric(8, 2)), CAST(12455.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (237, 1, 3, 1, 2, CAST(N'2024-05-25T01:56:29.143' AS DateTime), 2, CAST(N'2024-05-25T01:56:34.230' AS DateTime), 1, 0, CAST(N'2024-05-25T01:56:34.230' AS DateTime), 3, CAST(13071.00 AS Numeric(8, 2)), CAST(14566.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (238, 1, 3, 1, 2, CAST(N'2024-05-25T01:57:56.743' AS DateTime), 2, CAST(N'2024-05-25T01:57:59.070' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (239, 1, 3, 1, 2, CAST(N'2024-05-25T01:58:30.973' AS DateTime), 2, CAST(N'2024-05-25T01:58:37.683' AS DateTime), 1, 0, CAST(N'2024-05-25T01:58:37.683' AS DateTime), 3, CAST(18505.00 AS Numeric(8, 2)), CAST(20000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (240, 1, 3, 1, 2, CAST(N'2024-05-25T01:59:48.103' AS DateTime), 2, CAST(N'2024-05-25T01:59:55.370' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (241, 1, 3, 1, 2, CAST(N'2024-05-25T02:01:04.533' AS DateTime), 2, CAST(N'2024-05-25T02:01:05.743' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (242, 1, 3, 1, 2, CAST(N'2024-05-25T02:01:15.773' AS DateTime), NULL, NULL, 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (243, 1, 3, 1, 2, CAST(N'2024-05-25T02:07:14.387' AS DateTime), 2, CAST(N'2024-05-25T02:07:18.903' AS DateTime), 1, 0, CAST(N'2024-05-25T02:07:18.903' AS DateTime), 3, CAST(505.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (244, 1, 3, 1, 2, CAST(N'2024-05-25T02:07:44.093' AS DateTime), 2, CAST(N'2024-05-25T02:07:50.117' AS DateTime), 1, 0, CAST(N'2024-05-25T02:07:50.120' AS DateTime), 3, CAST(2505.00 AS Numeric(8, 2)), CAST(4000.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (245, 1, 5, 1, 9, CAST(N'2024-05-27T08:58:03.013' AS DateTime), 9, CAST(N'2024-05-27T08:58:07.433' AS DateTime), 1, 1, NULL, 3, CAST(0.00 AS Numeric(8, 2)), CAST(0.00 AS Numeric(8, 2)))
INSERT [Vent].[tbFactura] ([Fact_Id], [Clie_Id], [Empl_Id], [Mepa_Id], [Fact_UsuarioCreacion], [Fact_FechaCreacion], [Fact_UsuarioModificacion], [Fact_FechaModificacion], [Fact_Estado], [Fact_Finalizado], [Fact_FechaFinalizado], [Sucu_Id], [Fact_Cambio], [Fact_Pago]) VALUES (246, 1, 5, 1, 9, CAST(N'2024-05-27T08:58:27.060' AS DateTime), 9, CAST(N'2024-05-27T08:58:35.897' AS DateTime), 1, 0, CAST(N'2024-05-27T08:58:35.900' AS DateTime), 3, CAST(505.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
SET IDENTITY_INSERT [Vent].[tbFactura] OFF
GO
SET IDENTITY_INSERT [Vent].[tbFacturaCompraDetalle] ON 

INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (1, 4, 1, 13, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (2, 4, 1, 13, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (3, 4, 1, 13, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (4, 4, 1, 13, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (5, 4, 1, 16, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (6, 3, 1, 13, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (7, 3, 1, 13, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (9, 3, 1, 13, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (10, 3, 0, 10, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (12, 3, 0, 10, 40)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (13, 5, 0, 20, 80)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (14, 5, 0, 13, 80)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (16, 10, 1, 29, 40)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (17, 10, 1, 29, 40)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (18, 16, 1, 34, 10)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (19, 24, 1, 36, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (20, 25, 1, 37, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (21, 26, 1, 36, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (23, 28, 1, 16, 11)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (24, 29, 1, 16, 11)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (25, 30, 1, 34, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (28, 33, 1, 39, 23)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (29, 34, 1, 36, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (30, 35, 1, 41, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (32, 37, 1, 39, 2)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (33, 37, 1, 39, 2)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (34, 37, 1, 42, 300)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (35, 38, 1, 36, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (36, 39, 1, 37, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (38, 41, 1, 39, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (40, 43, 1, 34, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (42, 45, 1, 43, 23)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (43, 45, 1, 43, 23)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (44, 45, 1, 43, 23)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (46, 52, 1, 43, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (47, 4, 1, 37, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (48, 4, 1, 16, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (51, 9, 0, 16, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (58, 9, 1, 16, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (59, 9, 1, 16, 22)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (60, 54, 1, 45, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (61, 54, 1, 45, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (62, 54, 1, 45, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (63, 54, 1, 45, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (64, 54, 1, 45, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (65, 54, 1, 45, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (66, 54, 1, 36, 98)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (67, 54, 1, 36, 98)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (68, 54, 1, 36, 20000)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (69, 55, 0, 26, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (70, 55, 1, 37, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (71, 55, 0, 26, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (72, 55, 0, 13, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (73, 55, 1, 46, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (74, 55, 1, 43, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (75, 55, 0, 16, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (76, 55, 0, 26, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (77, 55, 0, 26, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (78, 55, 0, 16, 12123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (79, 57, 0, 17, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (80, 57, 0, 10, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (81, 57, 1, 32, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (82, 57, 1, 33, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (83, 57, 1, 47, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (84, 57, 0, 17, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (85, 79, 1, 32, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (86, 79, 0, 10, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (87, 79, 0, 87, 20)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (88, 80, 1, 34, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (89, 81, 0, 89, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (90, 81, 0, 89, 3)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (91, 81, 0, 89, 3)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (92, 82, 0, 87, 100)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (93, 83, 0, 13, 6)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (94, 93, 0, 13, 2)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (95, 94, 1, 39, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (96, 94, 1, 39, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (97, 95, 1, 37, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (98, 96, 1, 31, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (99, 96, 1, 59, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (100, 1, 1, 64, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (101, 1, 1, 64, 90)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (102, 2, 1, 65, 90)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (103, 2, 1, 65, 90)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (104, 5, 1, 66, 90)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (105, 5, 1, 67, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (106, 10, 1, 67, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (107, 1, 1, 46, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (108, 10, 1, 68, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (109, 10, 1, 69, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (110, 10, 1, 69, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (111, 10, 0, 92, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (112, 10, 0, 92, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (113, 10, 0, 93, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (114, 1, 0, 94, 30)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (115, 1, 0, 94, 40)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (116, 2, 0, 95, 40)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (117, 96, 1, 70, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (118, 96, 1, 70, 10)
GO
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (119, 97, 1, 71, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (120, 97, 1, 71, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (122, 98, 1, 72, 10)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (124, 98, 1, 37, 10)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (125, 99, 1, 73, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (126, 99, 1, 74, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (127, 99, 1, 39, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (128, 99, 1, 39, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (129, 100, 1, 37, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (130, 101, 1, 37, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (131, 101, 1, 75, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (132, 102, 1, 76, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (133, 103, 1, 77, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (134, 103, 1, 77, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (135, 103, 1, 77, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (136, 103, 1, 77, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (137, 103, 1, 77, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (138, 104, 1, 78, 1)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (140, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (141, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (142, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (143, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (144, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (145, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (146, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (147, 106, 1, 81, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (148, 107, 1, 82, 2)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (149, 107, 0, 97, 2)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (150, 107, 0, 97, 2)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (151, 108, 1, 74, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (152, 108, 0, 98, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (153, 108, 0, 98, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (154, 108, 0, 98, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (155, 108, 0, 98, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (156, 108, 0, 99, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (157, 109, 1, 74, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (159, 109, 0, 100, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (176, 112, 1, 59, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (177, 112, 1, 59, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (178, 112, 1, 59, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (179, 112, 1, 59, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (180, 112, 1, 59, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (181, 112, 1, 59, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (188, 112, 1, 31, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (194, 113, 1, 64, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (195, 58, 0, 102, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (196, 114, 1, 82, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (197, 114, 1, 82, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (198, 114, 1, 82, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (199, 114, 1, 82, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (200, 114, 1, 82, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (201, 114, 1, 82, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (202, 115, 1, 85, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (203, 115, 1, 85, 12)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (204, 116, 1, 85, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (205, 116, 1, 85, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (206, 116, 0, 103, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (207, 116, 0, 103, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (208, 116, 0, 103, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (209, 116, 0, 103, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (210, 116, 0, 103, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (211, 116, 0, 103, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (212, 117, 1, 75, 123)
INSERT [Vent].[tbFacturaCompraDetalle] ([FaCD_Id], [FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad]) VALUES (213, 118, 1, 86, 20)
SET IDENTITY_INSERT [Vent].[tbFacturaCompraDetalle] OFF
GO
SET IDENTITY_INSERT [Vent].[tbFacturaCompraEncabezado] ON 

INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (1, 10, 1, CAST(N'2024-05-12T23:45:56.893' AS DateTime), 1, NULL, NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (2, 1, 4, CAST(N'2024-05-12T23:46:26.583' AS DateTime), 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (3, 10, 4, NULL, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 0, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (4, 10, 4, CAST(N'2024-05-12T23:58:57.450' AS DateTime), 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (5, 5, 7, CAST(N'2024-05-09T19:24:31.417' AS DateTime), 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), 10, CAST(N'2024-05-09T14:25:34.347' AS DateTime), 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (6, 10, 4, NULL, 2, CAST(N'2024-05-15T17:32:06.193' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (7, 10, 4, NULL, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (8, 10, 4, NULL, 2, CAST(N'2024-05-15T17:32:58.863' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (9, 10, 4, CAST(N'2024-05-15T17:39:15.647' AS DateTime), 2, CAST(N'2024-05-15T17:39:15.597' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (10, 5, 7, CAST(N'2024-05-09T19:26:37.610' AS DateTime), 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), 10, CAST(N'2024-05-09T14:27:29.817' AS DateTime), 0, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (11, 10, 4, CAST(N'2024-05-15T17:38:13.077' AS DateTime), 2, CAST(N'2024-05-15T17:38:13.010' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (12, 10, 1, CAST(N'2024-05-15T17:36:31.460' AS DateTime), 2, CAST(N'2024-05-15T17:34:05.580' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (13, 10, 4, NULL, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (14, 3, 7, NULL, 10, CAST(N'2024-05-09T13:47:37.877' AS DateTime), 1, CAST(N'2024-05-09T14:11:41.790' AS DateTime), 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (15, 3, 7, CAST(N'2024-05-09T18:57:45.613' AS DateTime), 10, CAST(N'2024-05-09T13:58:09.770' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (16, 10, 7, NULL, 1, CAST(N'2024-05-11T18:17:47.280' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (17, 7, 7, NULL, 1, CAST(N'2024-05-12T03:59:56.307' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (18, 7, 7, NULL, 1, CAST(N'2024-05-12T04:00:37.080' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (19, 7, 7, NULL, 1, CAST(N'2024-05-12T04:07:21.170' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (20, 7, 7, NULL, 1, CAST(N'2024-05-12T04:09:06.127' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (21, 7, 7, NULL, 1, CAST(N'2024-05-12T04:09:30.983' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (22, 7, 7, NULL, 1, CAST(N'2024-05-12T04:10:40.617' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (23, 7, 7, NULL, 1, CAST(N'2024-05-12T04:13:07.813' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (24, 7, 7, NULL, 1, CAST(N'2024-05-12T04:15:15.040' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (25, 10, 7, NULL, 1, CAST(N'2024-05-12T04:19:33.900' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (26, 7, 7, NULL, 1, CAST(N'2024-05-12T03:28:53.920' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (27, 7, 7, NULL, 1, CAST(N'2024-05-12T15:56:06.270' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (28, 10, 7, NULL, 1, CAST(N'2024-05-12T16:01:28.727' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (29, 10, 7, NULL, 1, CAST(N'2024-05-12T16:01:31.683' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (30, 10, 7, NULL, 1, CAST(N'2024-05-12T16:10:41.450' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (31, 10, 7, NULL, 1, CAST(N'2024-05-12T16:11:02.743' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (32, 7, 7, NULL, 1, CAST(N'2024-05-12T16:12:23.643' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (33, 7, 7, NULL, 1, CAST(N'2024-05-12T16:13:33.360' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (34, 7, 7, NULL, 1, CAST(N'2024-05-12T16:21:18.433' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (35, 7, 7, NULL, 1, CAST(N'2024-05-12T16:25:47.253' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (36, 7, 7, NULL, 1, CAST(N'2024-05-12T16:33:09.503' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (37, 7, 7, NULL, 1, CAST(N'2024-05-12T16:39:59.333' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (38, 7, 7, NULL, 1, CAST(N'2024-05-12T16:51:55.563' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (39, 10, 7, NULL, 1, CAST(N'2024-05-12T16:56:30.527' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (40, 10, 7, NULL, 1, CAST(N'2024-05-12T17:18:28.293' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (41, 7, 7, NULL, 1, CAST(N'2024-05-12T17:26:07.653' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (42, 11, 7, NULL, 1, CAST(N'2024-05-12T17:40:42.077' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (43, 10, 7, NULL, 1, CAST(N'2024-05-12T18:03:09.350' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (44, 10, 7, NULL, 1, CAST(N'2024-05-12T20:15:05.840' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (45, 10, 1, NULL, 1, CAST(N'2024-05-12T20:37:41.243' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (52, 10, 7, NULL, 1, CAST(N'2024-05-12T21:06:49.583' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (53, 11, 7, CAST(N'2024-05-12T23:59:08.980' AS DateTime), 1, CAST(N'2024-05-12T22:35:36.077' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (54, 7, 7, NULL, 1, CAST(N'2024-05-13T11:43:27.473' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (55, 10, 7, NULL, 1, CAST(N'2024-05-13T12:02:33.857' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (56, 11, 7, NULL, 1, CAST(N'2024-05-13T12:30:50.123' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (57, 11, 7, NULL, 1, CAST(N'2024-05-13T12:31:02.067' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (58, 11, 1, NULL, 14, CAST(N'2024-05-22T14:04:53.713' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (59, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:03.767' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (60, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:03.940' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (61, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:06.310' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (62, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:06.483' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (63, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:06.637' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (64, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:17.283' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (65, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:18.070' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (66, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:18.247' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (67, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:18.983' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (68, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:19.197' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (69, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:19.400' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (70, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:19.590' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (71, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:19.777' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (72, 11, 1, NULL, 1, CAST(N'2024-05-13T12:35:22.247' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (73, 11, 1, NULL, 1, CAST(N'2024-05-13T12:36:14.297' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (74, 11, 1, NULL, 1, CAST(N'2024-05-13T12:36:18.620' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (75, 11, 1, NULL, 1, CAST(N'2024-05-13T12:36:18.787' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (76, 11, 1, NULL, 1, CAST(N'2024-05-13T12:36:18.933' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (77, 11, 1, NULL, 1, CAST(N'2024-05-13T12:36:53.430' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (78, 11, 1, NULL, 1, CAST(N'2024-05-13T12:37:49.153' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (79, 11, 7, CAST(N'2024-05-13T12:43:10.993' AS DateTime), 1, CAST(N'2024-05-13T12:38:34.593' AS DateTime), NULL, NULL, 1, 1, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (80, 10, 1, NULL, 1, CAST(N'2024-05-13T12:46:47.743' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (81, 10, 7, NULL, 1, CAST(N'2024-05-13T13:15:16.000' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (82, 11, 7, NULL, 1, CAST(N'2024-05-13T13:17:14.873' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (83, 10, 7, NULL, 1, CAST(N'2024-05-15T03:12:26.110' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (84, 10, 4, NULL, 1, CAST(N'2024-05-15T16:58:55.723' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (85, 10, 4, NULL, 1, CAST(N'2024-05-15T16:58:58.940' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (86, 10, 4, NULL, 1, CAST(N'2024-05-15T17:00:02.400' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (87, 10, 7, NULL, 1, CAST(N'2024-05-15T17:00:56.723' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (88, 10, 4, NULL, 1, CAST(N'2024-05-15T17:01:20.433' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (89, 10, 4, NULL, 1, CAST(N'2024-05-15T17:02:33.993' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (90, 10, 4, NULL, 1, CAST(N'2024-05-15T17:02:45.393' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (91, 10, 4, NULL, 1, CAST(N'2024-05-15T17:02:49.493' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (92, 10, 4, NULL, 1, CAST(N'2024-05-15T17:03:38.420' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (93, 10, 7, NULL, 2, CAST(N'2024-05-15T17:42:33.940' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (94, 7, 4, NULL, 10, CAST(N'2024-05-16T14:44:42.457' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (95, 10, 7, NULL, 10, CAST(N'2024-05-16T15:10:55.763' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (96, 11, 7, NULL, 10, CAST(N'2024-05-16T15:11:14.750' AS DateTime), NULL, NULL, 1, 0, NULL)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (97, 10, 7, NULL, 10, CAST(N'2024-05-17T00:57:11.140' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (98, 10, 7, CAST(N'2024-05-17T17:15:33.933' AS DateTime), 10, CAST(N'2024-05-17T17:15:33.877' AS DateTime), NULL, NULL, 1, 1, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (99, 7, 7, NULL, 10, CAST(N'2024-05-17T17:16:34.393' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (100, 10, 7, NULL, 10, CAST(N'2024-05-17T17:32:39.617' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (101, 10, 7, NULL, 10, CAST(N'2024-05-17T17:35:57.117' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (102, 10, 7, CAST(N'2024-05-17T17:41:41.410' AS DateTime), 10, CAST(N'2024-05-17T17:41:41.360' AS DateTime), NULL, NULL, 1, 1, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (103, 3, 7, NULL, 10, CAST(N'2024-05-17T17:42:12.997' AS DateTime), NULL, NULL, 1, 0, 3)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (104, 11, 7, CAST(N'2024-05-17T17:43:56.657' AS DateTime), 10, CAST(N'2024-05-17T17:43:56.603' AS DateTime), NULL, NULL, 1, 1, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (105, 10, 7, NULL, 10, CAST(N'2024-05-17T19:10:28.263' AS DateTime), NULL, NULL, 1, 0, 4)
GO
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (106, 10, 7, CAST(N'2024-05-21T22:04:56.297' AS DateTime), 10, CAST(N'2024-05-21T22:04:56.247' AS DateTime), NULL, NULL, 1, 1, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (107, 7, 7, NULL, 10, CAST(N'2024-05-22T00:25:46.020' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (108, 7, 7, NULL, 10, CAST(N'2024-05-22T00:32:42.233' AS DateTime), NULL, NULL, 1, 0, 3)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (109, 7, 7, NULL, 10, CAST(N'2024-05-22T00:37:45.690' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (110, 7, 7, NULL, 10, CAST(N'2024-05-22T01:01:21.250' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (111, 10, 7, NULL, 10, CAST(N'2024-05-22T01:11:31.197' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (112, 11, 7, NULL, 10, CAST(N'2024-05-22T13:07:03.063' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (113, 10, 7, NULL, 14, CAST(N'2024-05-22T14:00:14.003' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (114, 7, 7, NULL, 14, CAST(N'2024-05-22T14:21:06.430' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (115, 7, 7, NULL, 14, CAST(N'2024-05-22T14:22:18.683' AS DateTime), NULL, NULL, 1, 0, 7)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (116, 7, 7, NULL, 14, CAST(N'2024-05-22T13:36:24.400' AS DateTime), NULL, NULL, 1, 0, 4)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (117, 10, 7, CAST(N'2024-05-22T13:38:08.043' AS DateTime), 14, CAST(N'2024-05-22T13:38:07.967' AS DateTime), NULL, NULL, 1, 1, 7)
INSERT [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id], [Prov_Id], [Mepa_Id], [FaCE_fechafinalizacion], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_UsuarioModificacion], [FaCE_FechaModificacion], [FaCE_Etado], [FaCE_Finalizada], [Sucu_Id]) VALUES (118, 7, 7, NULL, 2, CAST(N'2024-05-22T16:45:51.360' AS DateTime), NULL, NULL, 1, 0, 3)
SET IDENTITY_INSERT [Vent].[tbFacturaCompraEncabezado] OFF
GO
SET IDENTITY_INSERT [Vent].[tbFacturaDetalles] ON 

INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1931, 1, 16, 1, 203)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1932, 0, 10, 1, 203)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1933, 0, 10, 1, 204)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1934, 0, 10, 3, 205)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1935, 0, 10, 1, 206)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1936, 1, 14, 1, 207)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1937, 1, 16, 1, 208)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1938, 1, 14, 1, 209)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1939, 1, 16, 1, 210)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1940, 1, 14, 1, 211)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1941, 1, 16, 1, 212)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1942, 1, 14, 1, 213)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1943, 1, 14, 1, 214)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1944, 1, 14, 1, 215)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1945, 1, 14, 1, 216)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1946, 1, 14, 1, 217)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1947, 1, 14, 1, 218)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1948, 1, 14, 1, 219)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1949, 1, 14, 6, 220)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1950, 1, 14, 1, 221)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1951, 1, 14, 1, 222)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1952, 1, 16, 1, 223)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1953, 1, 14, 1, 224)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1954, 1, 14, 1, 225)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1955, 1, 14, 1, 226)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1956, 1, 16, 14, 227)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1957, 1, 86, 20, 228)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1958, 1, 16, 1, 229)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1959, 1, 16, 1, 229)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1960, 1, 16, 1, 230)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1961, 0, 10, 1, 231)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1962, 1, 16, 1, 232)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1963, 1, 16, 1, 233)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1964, 1, 16, 1, 234)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1965, 1, 16, 1, 235)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1966, 1, 16, 1, 236)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1967, 1, 16, 1, 237)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1968, 1, 16, 1, 238)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1969, 1, 16, 1, 239)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1970, 1, 16, 1, 240)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1971, 1, 16, 1, 241)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1972, 1, 16, 1, 242)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1973, 1, 16, 1, 243)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1974, 1, 16, 1, 244)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1975, 1, 16, 1, 245)
INSERT [Vent].[tbFacturaDetalles] ([FaxD_Id], [FaxD_Dif], [Prod_Id], [FaxD_Cantidad], [Fact_Id]) VALUES (1976, 1, 16, 1, 246)
SET IDENTITY_INSERT [Vent].[tbFacturaDetalles] OFF
GO
SET IDENTITY_INSERT [Vent].[tbJoyas] ON 

INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (13, N'Cadena Mariposa', CAST(133.00 AS Numeric(8, 2)), CAST(600.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), N'1716311882234-841085119-cadena-mariposa.jpg', 11, 1, 1, 1, CAST(N'2024-05-06T18:59:58.567' AS DateTime), 11, CAST(N'2024-05-21T11:18:04.903' AS DateTime), 1, 50)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (14, N'Pulsera Pandora', CAST(133.00 AS Numeric(8, 2)), CAST(1300.00 AS Numeric(8, 2)), CAST(2.00 AS Numeric(8, 2)), N'1715044355785-239617251-Fondo.png', 11, 1, 1, 1, CAST(N'2024-05-06T19:12:38.093' AS DateTime), 11, CAST(N'2024-05-17T15:56:10.627' AS DateTime), 1, 231)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (16, N'Pulsera Pandora', CAST(133.00 AS Numeric(8, 2)), CAST(1300.00 AS Numeric(8, 2)), CAST(2.00 AS Numeric(8, 2)), N'1715044355785-239617251-Fondo.png', 10, 1, 1, 1, CAST(N'2024-05-09T00:00:00.000' AS DateTime), 2, CAST(N'2024-05-17T16:33:29.687' AS DateTime), 1, 185)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (20, N'Cadena Mariposa', CAST(133.00 AS Numeric(8, 2)), CAST(600.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), N'1716311901244-790015228-cadena-mariposa.jpg', 10, 1, 1, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), 11, CAST(N'2024-05-21T11:18:22.147' AS DateTime), 1, 0)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (29, N'Pulsera Pandora', CAST(133.00 AS Numeric(8, 2)), CAST(1300.00 AS Numeric(8, 2)), CAST(2.00 AS Numeric(8, 2)), N'1715044355785-239617251-Fondo.png', 5, 1, 1, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 0)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (30, N'rubi', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(5.00 AS Numeric(8, 2)), N'1716312301246-442763263-rubies.png', 11, 1, 3, 1, CAST(N'2024-05-11T01:02:01.037' AS DateTime), 11, CAST(N'2024-05-21T11:25:02.317' AS DateTime), 1, 25)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (31, N'Mim', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715411016443-7751913-GBiK61ebcAA_Awn.jpg', 11, 1, 1, 1, CAST(N'2024-05-11T01:04:01.157' AS DateTime), NULL, NULL, 1, 44)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (32, N'esmeralda', CAST(13.00 AS Numeric(8, 2)), CAST(12390.00 AS Numeric(8, 2)), CAST(1235.00 AS Numeric(8, 2)), N'1715482877343-923319358-42e896a87a63ffe9a927aca1e6d6b309.png', 11, 1, 3, 1, CAST(N'2024-05-11T21:01:18.990' AS DateTime), NULL, NULL, 1, 148)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (33, N'Waos', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715489267689-465376419-eiden_png.png', 11, 1, 3, 1, CAST(N'2024-05-11T22:47:49.097' AS DateTime), NULL, NULL, 1, 147)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (34, N'esmeralda', CAST(1234.00 AS Numeric(8, 2)), CAST(12390.00 AS Numeric(8, 2)), CAST(1235.00 AS Numeric(8, 2)), N'1715482877343-923319358-42e896a87a63ffe9a927aca1e6d6b309.png', 10, 1, 3, 1, CAST(N'2024-05-11T18:17:47.280' AS DateTime), NULL, NULL, 1, 169)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (36, N'esmeralda', CAST(123.00 AS Numeric(8, 2)), CAST(12390.00 AS Numeric(8, 2)), CAST(1235.00 AS Numeric(8, 2)), N'1715482877343-923319358-42e896a87a63ffe9a927aca1e6d6b309.png', 7, 1, 3, 1, CAST(N'2024-05-12T04:15:15.040' AS DateTime), NULL, NULL, 1, 20455)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (37, N'Mim', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715411016443-7751913-GBiK61ebcAA_Awn.jpg', 10, 1, 1, 1, CAST(N'2024-05-12T04:19:33.900' AS DateTime), NULL, NULL, 1, 539)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (38, N'Cadena Mariposa', CAST(123.00 AS Numeric(8, 2)), CAST(600.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), N'1716311912429-392921924-cadena-mariposa.jpg', 7, 1, 1, 1, CAST(N'2024-05-12T15:56:06.270' AS DateTime), 11, CAST(N'2024-05-21T11:18:34.087' AS DateTime), 1, 0)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (39, N'Mim', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715411016443-7751913-GBiK61ebcAA_Awn.jpg', 7, 1, 1, 1, CAST(N'2024-05-12T16:12:23.643' AS DateTime), NULL, NULL, 1, 333)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (41, N'rubi', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(5.00 AS Numeric(8, 2)), N'1716312334578-181427330-rubies.png', 7, 1, 3, 1, CAST(N'2024-05-12T16:25:47.253' AS DateTime), 11, CAST(N'2024-05-21T11:25:35.493' AS DateTime), 1, 0)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (42, N'Pulsera Pandora', CAST(12355.00 AS Numeric(8, 2)), CAST(1300.00 AS Numeric(8, 2)), CAST(2.00 AS Numeric(8, 2)), N'1715044355785-239617251-Fondo.png', 7, 1, 1, 1, CAST(N'2024-05-12T16:39:59.333' AS DateTime), NULL, NULL, 1, 300)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (43, N'Waos', CAST(12.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715489267689-465376419-eiden_png.png', 10, 1, 3, 1, CAST(N'2024-05-12T20:37:41.243' AS DateTime), NULL, NULL, 1, 12461)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (44, N'Playa', CAST(200.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715610357340-165568077-Tree.png', 3, 3, 2, 1, CAST(N'2024-05-13T08:27:01.603' AS DateTime), NULL, NULL, 1, 1)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (45, N'vanguardia', CAST(125.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), CAST(390.00 AS Numeric(8, 2)), N'1715622092040-327448421-OIP.jpg', 7, 3, 4, 1, CAST(N'2024-05-13T11:41:39.773' AS DateTime), NULL, NULL, 1, 73)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (46, N'rubi', CAST(209.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(5.00 AS Numeric(8, 2)), N'1716312324766-818734647-rubies.png', 10, 1, 3, 1, CAST(N'2024-05-13T12:02:33.857' AS DateTime), 11, CAST(N'2024-05-21T11:25:25.613' AS DateTime), 1, 30)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (47, N'vanguardia', CAST(123.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), CAST(390.00 AS Numeric(8, 2)), N'1715622092040-327448421-OIP.jpg', 11, 3, 4, 1, CAST(N'2024-05-13T12:31:02.067' AS DateTime), NULL, NULL, 1, 123)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (48, N'JoyaOros', CAST(300.00 AS Numeric(8, 2)), CAST(200.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), N'1715845418180-997742320-anillos de aniversario joyas preciosas anillo.jpg', 7, 3, 1, 1, CAST(N'2024-05-16T01:43:44.597' AS DateTime), 1, CAST(N'2024-05-16T01:44:07.080' AS DateTime), 1, 20)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (49, N'JoyaOrossssss', CAST(300.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715848359396-449902548-anillos de aniversario joyas preciosas anillo.jpg', 3, 1, 1, 1, CAST(N'2024-05-16T02:32:41.363' AS DateTime), 1, CAST(N'2024-05-16T02:32:48.990' AS DateTime), 1, 20)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (50, N'DiamanteEES', CAST(144.00 AS Numeric(8, 2)), CAST(414.00 AS Numeric(8, 2)), CAST(4141.00 AS Numeric(8, 2)), N'1715848580639-195405431-anillos de aniversario joyas preciosas anillo.jpg', 10, 3, 1, 11, CAST(N'2024-05-16T02:36:23.660' AS DateTime), 11, CAST(N'2024-05-16T02:36:32.463' AS DateTime), 0, 23)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (64, N'juaquin', CAST(33.00 AS Numeric(8, 2)), CAST(34.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)), N'NA', 10, 6, 8, 1, NULL, NULL, NULL, 1, 114)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (65, N'juaquin', CAST(209.00 AS Numeric(8, 2)), CAST(34.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)), N'NA', 1, 6, 8, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 180)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (66, N'juaquin', CAST(209.00 AS Numeric(8, 2)), CAST(34.00 AS Numeric(8, 2)), CAST(32.00 AS Numeric(8, 2)), N'NA', 5, 6, 8, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 90)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (68, N'rubi', CAST(10.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(5.00 AS Numeric(8, 2)), N'1716312311707-161212215-rubies.png', 5, 1, 3, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), 11, CAST(N'2024-05-21T11:25:12.437' AS DateTime), 1, 30)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (69, N'Pruebaqwer', CAST(209.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), N'NA', 5, 6, 8, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 60)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (70, N'Hemertino', CAST(132.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 11, 6, 8, 10, CAST(N'2024-05-16T15:11:14.750' AS DateTime), NULL, NULL, 1, 22)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (71, N'JoyaOrossssss', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715848359396-449902548-anillos de aniversario joyas preciosas anillo.jpg', 10, 1, 1, 10, CAST(N'2024-05-17T00:51:03.183' AS DateTime), NULL, NULL, 1, 2)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (72, N'Juana de arco', CAST(129.00 AS Numeric(8, 2)), CAST(140.00 AS Numeric(8, 2)), CAST(110.00 AS Numeric(8, 2)), N'NA', 10, 6, 8, 10, CAST(N'2024-05-17T17:04:49.010' AS DateTime), NULL, NULL, 1, 10)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (73, N'Playa', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1715610357340-165568077-Tree.png', 7, 3, 2, 10, CAST(N'2024-05-17T17:16:34.393' AS DateTime), NULL, NULL, 1, 123)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (74, N'mairan', CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), N'NA', 7, 6, 8, 10, CAST(N'2024-05-17T17:16:34.393' AS DateTime), 10, CAST(N'2024-05-22T00:37:13.603' AS DateTime), 1, 258)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (75, N'123', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 10, 6, 8, 10, CAST(N'2024-05-17T17:33:31.840' AS DateTime), NULL, NULL, 1, 246)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (76, N'cuack', CAST(1.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(8, 2)), N'NA', 10, 6, 8, 10, CAST(N'2024-05-17T17:39:32.990' AS DateTime), NULL, NULL, 1, 1)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (77, N'nada', CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), CAST(1.00 AS Numeric(8, 2)), N'NA', 3, 6, 8, 10, CAST(N'2024-05-17T17:42:05.480' AS DateTime), NULL, NULL, 1, 60)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (78, N'de todo', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 11, 6, 8, 10, CAST(N'2024-05-17T17:43:54.933' AS DateTime), NULL, NULL, 1, 1)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (79, N'sis', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 10, 6, 8, 10, CAST(N'2024-05-17T19:10:05.530' AS DateTime), 10, CAST(N'2024-05-22T00:34:55.683' AS DateTime), 1, 0)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (80, N'cacaasasdasdadsasdasdasd', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'1716350596372-228209001-ventasmayoristas.png', 3, 4, 2, 10, CAST(N'2024-05-21T22:03:04.790' AS DateTime), 10, CAST(N'2024-05-21T22:03:21.737' AS DateTime), 0, 123)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (81, N'ca', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 10, 6, 8, 10, CAST(N'2024-05-21T22:04:50.533' AS DateTime), 10, CAST(N'2024-05-22T00:34:10.170' AS DateTime), 1, 984)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (82, N'jose', CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), N'NA', 7, 6, 8, 10, CAST(N'2024-05-22T00:25:46.020' AS DateTime), NULL, NULL, 1, 74)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (83, N'eminem', CAST(12.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 7, 6, 8, 10, CAST(N'2024-05-22T00:37:45.690' AS DateTime), NULL, NULL, 1, 0)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (84, N'eminem', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 10, 6, 8, 10, CAST(N'2024-05-22T01:11:31.197' AS DateTime), NULL, NULL, 1, 984)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (85, N'Hemertino', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 7, 6, 8, 14, CAST(N'2024-05-22T14:22:17.433' AS DateTime), NULL, NULL, 1, 270)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (86, N'Coca Cola', CAST(300.00 AS Numeric(8, 2)), CAST(200.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), N'NA', 7, 6, 8, 2, CAST(N'2024-05-22T16:45:51.360' AS DateTime), NULL, NULL, 1, 20)
INSERT [Vent].[tbJoyas] ([Joya_Id], [Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_UsuarioModificacion], [Joya_FechaModificacion], [Joya_Estado], [Joya_Stock]) VALUES (87, N'f', CAST(3.00 AS Numeric(8, 2)), CAST(3.00 AS Numeric(8, 2)), CAST(3.00 AS Numeric(8, 2)), N'1716414904635-54651593-favicon.ico', 10, 8, 5, 15, CAST(N'2024-05-22T16:55:05.920' AS DateTime), NULL, NULL, 1, 3)
SET IDENTITY_INSERT [Vent].[tbJoyas] OFF
GO
SET IDENTITY_INSERT [Vent].[tbMaquillajes] ON 

INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (10, N'Labial', CAST(13.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), CAST(200.00 AS Numeric(8, 2)), N'1716312208597-375026973-_101911569_1.jpg', 11, 3, 1, CAST(N'2024-05-06T20:17:11.360' AS DateTime), 11, CAST(N'2024-05-21T11:23:29.850' AS DateTime), 1, 62)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (13, N'Labial', CAST(300.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), CAST(200.00 AS Numeric(8, 2)), N'1716312218605-794084538-_101911569_1.jpg', 10, 3, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), 11, CAST(N'2024-05-21T11:23:39.340' AS DateTime), 1, 12402)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (15, N'Labial', CAST(123.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), CAST(200.00 AS Numeric(8, 2)), N'1716312230363-156236208-_101911569_1.jpg', 5, 3, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), 11, CAST(N'2024-05-21T11:23:51.190' AS DateTime), 1, 2)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (16, N'Prueba', CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), N'1715291952416-770720104-OIP.jpg', 10, 3, 1, CAST(N'2024-05-09T15:59:45.677' AS DateTime), 1, CAST(N'2024-05-10T01:15:16.520' AS DateTime), 1, 24217)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (17, N'Base', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'', 11, 3, 1, CAST(N'2024-05-11T01:57:38.227' AS DateTime), NULL, NULL, 1, 246)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (21, N'Imagen', CAST(300.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), CAST(300.00 AS Numeric(8, 2)), N'1715610266801-516526787-sfaf.png', 3, 3, 1, CAST(N'2024-05-13T08:24:34.867' AS DateTime), NULL, NULL, 1, 2)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (26, N'Pruebaqweqwe', CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), N'', 10, 3, 1, CAST(N'2024-05-13T11:37:30.407' AS DateTime), NULL, NULL, 1, 36392)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (27, N'Pruebaqwer', CAST(12.00 AS Numeric(8, 2)), CAST(121.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), N'', 7, 3, 1, CAST(N'2024-05-13T11:41:08.433' AS DateTime), NULL, NULL, 1, 11)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (63, N'Proveedor', CAST(300.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)), CAST(2500.00 AS Numeric(8, 2)), N'1715625251008-625557267-1.png', 7, 5, 1, CAST(N'2024-05-13T12:34:12.050' AS DateTime), NULL, NULL, 1, 0)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (87, N'Proveedor', CAST(900.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)), CAST(2500.00 AS Numeric(8, 2)), N'1715625251008-625557267-1.png', 11, 5, 1, CAST(N'2024-05-13T12:38:34.593' AS DateTime), NULL, NULL, 1, 50)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (88, N'Hermenegildo', CAST(300.00 AS Numeric(8, 2)), CAST(350.00 AS Numeric(8, 2)), CAST(320.00 AS Numeric(8, 2)), N'', 10, 3, 1, CAST(N'2024-05-13T12:47:29.773' AS DateTime), NULL, NULL, 1, 12)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (89, N'Proveedor', CAST(600.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)), CAST(2500.00 AS Numeric(8, 2)), N'1715625251008-625557267-1.png', 10, 5, 1, CAST(N'2024-05-13T13:15:16.000' AS DateTime), NULL, NULL, 1, 18)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (90, N'Escarcha', CAST(300.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), CAST(600.00 AS Numeric(8, 2)), N'1715845516163-669051681-anillos de aniversario joyas preciosas anillo.jpg', 7, 3, 1, CAST(N'2024-05-16T01:44:59.683' AS DateTime), 1, CAST(N'2024-05-16T01:45:59.170' AS DateTime), 1, 40)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (91, N'Escarchass', CAST(300.00 AS Numeric(8, 2)), CAST(400.00 AS Numeric(8, 2)), CAST(600.00 AS Numeric(8, 2)), N'1715845668053-346831259-R.jfif', 3, 3, 11, CAST(N'2024-05-16T01:47:29.983' AS DateTime), 11, CAST(N'2024-05-16T01:47:57.823' AS DateTime), 1, 40)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (92, N'Pruebaqwer', CAST(209.00 AS Numeric(8, 2)), CAST(121.00 AS Numeric(8, 2)), CAST(500.00 AS Numeric(8, 2)), N'', 5, 3, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 60)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (93, N'Manicomio', CAST(209.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 5, 8, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 30)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (94, N'Manicomio', CAST(209.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 10, 8, 1, NULL, NULL, NULL, 1, 70)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (95, N'Manicomio', CAST(209.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 1, 8, 10, CAST(N'2024-05-08T00:00:00.000' AS DateTime), NULL, NULL, 1, 40)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (96, N'cacacasdasd', CAST(121233.00 AS Numeric(8, 2)), CAST(112323.00 AS Numeric(8, 2)), CAST(112323.00 AS Numeric(8, 2)), N'1716350657975-864093136-png-clipart-profile-icon-simple-user-icon-icons-logos-emojis-users-thumbnail.png', 7, 5, 10, CAST(N'2024-05-21T22:03:52.993' AS DateTime), 10, CAST(N'2024-05-21T22:04:19.290' AS DateTime), 0, 123123)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (97, N'Man', CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), N'NA', 7, 8, 10, CAST(N'2024-05-22T00:25:46.020' AS DateTime), NULL, NULL, 1, 28)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (98, N'Manicomio', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 7, 8, 10, CAST(N'2024-05-22T00:32:42.233' AS DateTime), NULL, NULL, 1, 492)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (99, N'esternocleidomastoideo', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 7, 8, 10, CAST(N'2024-05-22T00:32:42.233' AS DateTime), NULL, NULL, 1, 123)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (100, N'mariana', CAST(12.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 7, 8, 10, CAST(N'2024-05-22T00:37:45.690' AS DateTime), NULL, NULL, 1, 12)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (101, N'mariana', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 11, 8, 10, CAST(N'2024-05-22T12:55:04.640' AS DateTime), NULL, NULL, 1, 0)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (102, N'Man', CAST(123.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), CAST(12.00 AS Numeric(8, 2)), N'NA', 11, 8, 1, CAST(N'2024-05-13T12:35:00.040' AS DateTime), NULL, NULL, 1, 123)
INSERT [Vent].[tbMaquillajes] ([Maqu_Id], [Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_UsuarioModificacion], [Maqu_FechaModificacion], [Maqu_Estado], [Maqu_Stock]) VALUES (103, N'jose', CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), CAST(123.00 AS Numeric(8, 2)), N'NA', 7, 8, 14, CAST(N'2024-05-22T14:27:19.670' AS DateTime), NULL, NULL, 1, 738)
SET IDENTITY_INSERT [Vent].[tbMaquillajes] OFF
GO
SET IDENTITY_INSERT [Vent].[tbProductosPorSucursalesEncabezados] ON 

INSERT [Vent].[tbProductosPorSucursalesEncabezados] ([Pren_Id], [Sucu_Id], [Pren_UsuarioCreacion], [Pren_FechaCreacion], [Pren_UsuarioModificacion], [Pren_FechaModificacion], [Pren_Finalizado], [Pren_Estado]) VALUES (1, 3, 1, CAST(N'2024-12-12T00:00:00.000' AS DateTime), NULL, NULL, 1, 1)
SET IDENTITY_INSERT [Vent].[tbProductosPorSucursalesEncabezados] OFF
GO
ALTER TABLE [Acce].[tbPantallas] ADD  DEFAULT ((1)) FOR [Pant_Estado]
GO
ALTER TABLE [Acce].[tbRoles] ADD  DEFAULT ((1)) FOR [Role_Estado]
GO
ALTER TABLE [Acce].[tbUsuarios] ADD  DEFAULT ((1)) FOR [Usua_Estado]
GO
ALTER TABLE [Gral].[tbCargos] ADD  DEFAULT ((1)) FOR [Carg_Estado]
GO
ALTER TABLE [Gral].[tbCategorias] ADD  DEFAULT ((1)) FOR [Cate_Estado]
GO
ALTER TABLE [Gral].[tbClientes] ADD  DEFAULT ((1)) FOR [Clie_Estado]
GO
ALTER TABLE [Gral].[tbEmpleados] ADD  DEFAULT ((1)) FOR [Empl_Estado]
GO
ALTER TABLE [Gral].[tbEstadosCiviles] ADD  DEFAULT ((1)) FOR [Esta_Estado]
GO
ALTER TABLE [Gral].[tbImpuestos] ADD  DEFAULT ((1)) FOR [Impu_Estado]
GO
ALTER TABLE [Gral].[tbMarcas] ADD  DEFAULT ((1)) FOR [Marc_Estado]
GO
ALTER TABLE [Gral].[tbMateriales] ADD  DEFAULT ((1)) FOR [Mate_Estado]
GO
ALTER TABLE [Gral].[tbMetodosPago] ADD  DEFAULT ((1)) FOR [Mepa_Estado]
GO
ALTER TABLE [Gral].[tbProveedores] ADD  DEFAULT ((1)) FOR [Prov_Estado]
GO
ALTER TABLE [Gral].[tbSucursales] ADD  DEFAULT ((1)) FOR [Sucu_Estado]
GO
ALTER TABLE [Vent].[tbCajas] ADD  DEFAULT ((0)) FOR [caja_MontoFinal]
GO
ALTER TABLE [Vent].[tbCajas] ADD  DEFAULT ((0)) FOR [caja_MontoSistema]
GO
ALTER TABLE [Vent].[tbFactura] ADD  DEFAULT ((1)) FOR [Fact_Estado]
GO
ALTER TABLE [Vent].[tbFactura] ADD  DEFAULT ((1)) FOR [Fact_Finalizado]
GO
ALTER TABLE [Vent].[tbFactura] ADD  DEFAULT ((0)) FOR [Fact_Cambio]
GO
ALTER TABLE [Vent].[tbFactura] ADD  DEFAULT ((0)) FOR [Fact_Pago]
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado] ADD  DEFAULT ((1)) FOR [FaCE_Etado]
GO
ALTER TABLE [Vent].[tbJoyas] ADD  DEFAULT ((1)) FOR [Joya_Estado]
GO
ALTER TABLE [Vent].[tbJoyas] ADD  DEFAULT ((0)) FOR [Joya_Stock]
GO
ALTER TABLE [Vent].[tbMaquillajes] ADD  DEFAULT ((1)) FOR [Maqu_Estado]
GO
ALTER TABLE [Vent].[tbMaquillajes] ADD  DEFAULT ((0)) FOR [Maqu_Stock]
GO
ALTER TABLE [Vent].[tbProductosPorSucursalesEncabezados] ADD  DEFAULT ((1)) FOR [Pren_Finalizado]
GO
ALTER TABLE [Vent].[tbProductosPorSucursalesEncabezados] ADD  DEFAULT ((1)) FOR [Pren_Estado]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [tbPantallas_tbUsuarios_Pant_UsuarioCreacion] FOREIGN KEY([Pant_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [tbPantallas_tbUsuarios_Pant_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [tbPantallas_tbUsuarios_Pant_UsuarioModificacion] FOREIGN KEY([Pant_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [tbPantallas_tbUsuarios_Pant_UsuarioModificacion]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [tbPantallas_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Pant_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [tbPantallas_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [tbPantallas_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Pant_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [tbPantallas_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [tbRoles_tbUsuarios_Role_UsuarioCreacion] FOREIGN KEY([Role_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [tbRoles_tbUsuarios_Role_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [tbRoles_tbUsuarios_Role_UsuarioModificacion] FOREIGN KEY([Role_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [tbRoles_tbUsuarios_Role_UsuarioModificacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [tbRoles_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Role_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [tbRoles_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [tbRoles_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Role_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [tbRoles_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbEmpleados] FOREIGN KEY([Empl_Id])
REFERENCES [Gral].[tbEmpleados] ([Empl_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbEmpleados]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbRoles] FOREIGN KEY([Role_Id])
REFERENCES [Acce].[tbRoles] ([Role_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbRoles]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Creacion] FOREIGN KEY([Usua_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Creacion]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Modificacion] FOREIGN KEY([Usua_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Modificacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [tbCargos_tbUsuarios_Carg_UsuarioCreacion] FOREIGN KEY([Carg_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [tbCargos_tbUsuarios_Carg_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [tbCargos_tbUsuarios_Carg_UsuarioModificacion] FOREIGN KEY([Carg_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [tbCargos_tbUsuarios_Carg_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [tbCargos_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Carg_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [tbCargos_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [tbCargos_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Carg_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [tbCargos_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbCategorias]  WITH CHECK ADD  CONSTRAINT [tbCategorias_tbUsuarios_Cate_UsuarioCreacion] FOREIGN KEY([Cate_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCategorias] CHECK CONSTRAINT [tbCategorias_tbUsuarios_Cate_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbCategorias]  WITH CHECK ADD  CONSTRAINT [tbCategorias_tbUsuarios_Cate_UsuarioModificacion] FOREIGN KEY([Cate_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCategorias] CHECK CONSTRAINT [tbCategorias_tbUsuarios_Cate_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [tbClientes_tbEstadosCiviles_Esta_Id] FOREIGN KEY([Esta_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Esta_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [tbClientes_tbEstadosCiviles_Esta_Id]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [tbClientes_tbMunicipios_Muni_Codigo] FOREIGN KEY([Muni_Codigo])
REFERENCES [Gral].[tbMunicipios] ([Muni_Codigo])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [tbClientes_tbMunicipios_Muni_Codigo]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [tbClientes_tbUsuarios_Clie_UsuarioCreacion] FOREIGN KEY([Clie_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [tbClientes_tbUsuarios_Clie_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [tbClientes_tbUsuarios_Clie_UsuarioModificacion] FOREIGN KEY([Clie_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [tbClientes_tbUsuarios_Clie_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [tbClientes_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Clie_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [tbClientes_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [tbClientes_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Clie_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [tbClientes_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [tbDepartamentos_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Depa_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [tbDepartamentos_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [tbDepartamentos_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Depa_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [tbDepartamentos_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [tbUsuarios_tbUsuarios_Depa_UsuarioCreacion] FOREIGN KEY([Depa_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [tbUsuarios_tbUsuarios_Depa_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [tbUsuarios_tbUsuarios_Depa_UsuarioModificacion] FOREIGN KEY([Depa_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [tbUsuarios_tbUsuarios_Depa_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [tbEmpleados_tbCargos_carg_Id] FOREIGN KEY([Carg_Id])
REFERENCES [Gral].[tbCargos] ([Carg_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [tbEmpleados_tbCargos_carg_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [tbEmpleados_tbEstadosCiviles_Esta_Id] FOREIGN KEY([Esta_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Esta_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [tbEmpleados_tbEstadosCiviles_Esta_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [tbEmpleados_tbMunicipios_Muni_Codigo] FOREIGN KEY([Muni_Codigo])
REFERENCES [Gral].[tbMunicipios] ([Muni_Codigo])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [tbEmpleados_tbMunicipios_Muni_Codigo]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [tbEmpleados_tbUsuarios_Prov_UsuarioCreacion] FOREIGN KEY([Empl_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [tbEmpleados_tbUsuarios_Prov_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [tbEmpleados_tbUsuarios_Prov_UsuarioModificacion] FOREIGN KEY([Empl_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [tbEmpleados_tbUsuarios_Prov_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [tbEmpleados_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Empl_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [tbEmpleados_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [tbEmpleados_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Empl_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [tbEmpleados_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [tbEstadosCiviles_tbUsuarios_Esta_UsuarioCreacion] FOREIGN KEY([Esta_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [tbEstadosCiviles_tbUsuarios_Esta_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [tbEstadosCiviles_tbUsuarios_Esta_UsuarioModificacion] FOREIGN KEY([Esta_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [tbEstadosCiviles_tbUsuarios_Esta_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [tbEstadosCiviles_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Esta_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [tbEstadosCiviles_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [tbEstadosCiviles_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Esta_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [tbEstadosCiviles_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbImpuestos]  WITH CHECK ADD  CONSTRAINT [tbImpuestos_tbUsuarios_Impu_UsuarioCreacion] FOREIGN KEY([Impu_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbImpuestos] CHECK CONSTRAINT [tbImpuestos_tbUsuarios_Impu_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbImpuestos]  WITH CHECK ADD  CONSTRAINT [tbImpuestos_tbUsuarios_Impu_UsuarioModificacion] FOREIGN KEY([Impu_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbImpuestos] CHECK CONSTRAINT [tbImpuestos_tbUsuarios_Impu_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbImpuestos]  WITH CHECK ADD  CONSTRAINT [tbImpuestos_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Impu_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbImpuestos] CHECK CONSTRAINT [tbImpuestos_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbImpuestos]  WITH CHECK ADD  CONSTRAINT [tbImpuestos_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Impu_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbImpuestos] CHECK CONSTRAINT [tbImpuestos_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbMarcas]  WITH CHECK ADD  CONSTRAINT [tbMarcas_tbUsuarios_Marc_UsuarioCreacion] FOREIGN KEY([Marc_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMarcas] CHECK CONSTRAINT [tbMarcas_tbUsuarios_Marc_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbMarcas]  WITH CHECK ADD  CONSTRAINT [tbMarcas_tbUsuarios_Marc_UsuarioModificacion] FOREIGN KEY([Marc_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMarcas] CHECK CONSTRAINT [tbMarcas_tbUsuarios_Marc_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbMateriales]  WITH CHECK ADD  CONSTRAINT [tbMateriales_tbUsuarios_Marc_UsuarioCreacion] FOREIGN KEY([Mate_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMateriales] CHECK CONSTRAINT [tbMateriales_tbUsuarios_Marc_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbMateriales]  WITH CHECK ADD  CONSTRAINT [tbMateriales_tbUsuarios_Marc_UsuarioModificacion] FOREIGN KEY([Mate_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMateriales] CHECK CONSTRAINT [tbMateriales_tbUsuarios_Marc_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbMetodosPago]  WITH CHECK ADD  CONSTRAINT [tbMetodosPago_tbUsuarios_Mepa_UsuarioCreacion] FOREIGN KEY([Mepa_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMetodosPago] CHECK CONSTRAINT [tbMetodosPago_tbUsuarios_Mepa_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbMetodosPago]  WITH CHECK ADD  CONSTRAINT [tbMetodosPago_tbUsuarios_Mepa_UsuarioModificacion] FOREIGN KEY([Mepa_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMetodosPago] CHECK CONSTRAINT [tbMetodosPago_tbUsuarios_Mepa_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbMetodosPago]  WITH CHECK ADD  CONSTRAINT [tbMetodosPago_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Mepa_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMetodosPago] CHECK CONSTRAINT [tbMetodosPago_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbMetodosPago]  WITH CHECK ADD  CONSTRAINT [tbMetodosPago_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Mepa_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMetodosPago] CHECK CONSTRAINT [tbMetodosPago_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [tbDepartamentos_tbMunicipios_Depa_Codigo] FOREIGN KEY([Depa_Codigo])
REFERENCES [Gral].[tbDepartamentos] ([Depa_Codigo])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [tbDepartamentos_tbMunicipios_Depa_Codigo]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [tbMunicipios_tbUsuarios_UsuarioCreacion] FOREIGN KEY([Muni_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [tbMunicipios_tbUsuarios_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [tbMunicipios_tbUsuarios_UsuarioModificacion] FOREIGN KEY([Muni_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [tbMunicipios_tbUsuarios_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [tbUsuarios_tbUsuarios_Muni_UsuarioCreacion] FOREIGN KEY([Muni_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [tbUsuarios_tbUsuarios_Muni_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [tbUsuarios_tbUsuarios_Muni_UsuarioModificacion] FOREIGN KEY([Muni_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [tbUsuarios_tbUsuarios_Muni_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [tbProveedores_tbMunicipios_Muni_Codigo] FOREIGN KEY([Muni_Codigo])
REFERENCES [Gral].[tbMunicipios] ([Muni_Codigo])
GO
ALTER TABLE [Gral].[tbProveedores] CHECK CONSTRAINT [tbProveedores_tbMunicipios_Muni_Codigo]
GO
ALTER TABLE [Gral].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [tbProveedores_tbUsuarios_Prov_UsuarioCreacion] FOREIGN KEY([Prov_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbProveedores] CHECK CONSTRAINT [tbProveedores_tbUsuarios_Prov_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbProveedores]  WITH CHECK ADD  CONSTRAINT [tbProveedores_tbUsuarios_Prov_UsuarioModificacion] FOREIGN KEY([Prov_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbProveedores] CHECK CONSTRAINT [tbProveedores_tbUsuarios_Prov_UsuarioModificacion]
GO
ALTER TABLE [Gral].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [tbSucursales_tbMunicipios_Muni_Codigo] FOREIGN KEY([Muni_Codigo])
REFERENCES [Gral].[tbMunicipios] ([Muni_Codigo])
GO
ALTER TABLE [Gral].[tbSucursales] CHECK CONSTRAINT [tbSucursales_tbMunicipios_Muni_Codigo]
GO
ALTER TABLE [Gral].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [tbSucursales_tbUsuarios_Prov_UsuarioCreacion] FOREIGN KEY([Sucu_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbSucursales] CHECK CONSTRAINT [tbSucursales_tbUsuarios_Prov_UsuarioCreacion]
GO
ALTER TABLE [Gral].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [tbSucursales_tbUsuarios_Prov_UsuarioModificacion] FOREIGN KEY([Sucu_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbSucursales] CHECK CONSTRAINT [tbSucursales_tbUsuarios_Prov_UsuarioModificacion]
GO
ALTER TABLE [Vent].[tbFactura]  WITH CHECK ADD  CONSTRAINT [tbFactura_tbClientes_Clie_Id] FOREIGN KEY([Clie_Id])
REFERENCES [Gral].[tbClientes] ([Clie_Id])
GO
ALTER TABLE [Vent].[tbFactura] CHECK CONSTRAINT [tbFactura_tbClientes_Clie_Id]
GO
ALTER TABLE [Vent].[tbFactura]  WITH CHECK ADD  CONSTRAINT [tbFactura_tbEmpleados_Empl_Id] FOREIGN KEY([Empl_Id])
REFERENCES [Gral].[tbEmpleados] ([Empl_Id])
GO
ALTER TABLE [Vent].[tbFactura] CHECK CONSTRAINT [tbFactura_tbEmpleados_Empl_Id]
GO
ALTER TABLE [Vent].[tbFactura]  WITH CHECK ADD  CONSTRAINT [tbFactura_tbMetodosPago_Mepa_Id] FOREIGN KEY([Mepa_Id])
REFERENCES [Gral].[tbMetodosPago] ([Mepa_Id])
GO
ALTER TABLE [Vent].[tbFactura] CHECK CONSTRAINT [tbFactura_tbMetodosPago_Mepa_Id]
GO
ALTER TABLE [Vent].[tbFactura]  WITH CHECK ADD  CONSTRAINT [tbFactura_tbUsuarios_Fact_UsuarioCreacion] FOREIGN KEY([Fact_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbFactura] CHECK CONSTRAINT [tbFactura_tbUsuarios_Fact_UsuarioCreacion]
GO
ALTER TABLE [Vent].[tbFactura]  WITH CHECK ADD  CONSTRAINT [tbFactura_tbUsuarios_Fact_UsuarioModificacion] FOREIGN KEY([Fact_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbFactura] CHECK CONSTRAINT [tbFactura_tbUsuarios_Fact_UsuarioModificacion]
GO
ALTER TABLE [Vent].[tbFacturaCompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FacturaencabezadoCompra_FaCE_Id] FOREIGN KEY([FaCE_Id])
REFERENCES [Vent].[tbFacturaCompraEncabezado] ([FaCE_Id])
GO
ALTER TABLE [Vent].[tbFacturaCompraDetalle] CHECK CONSTRAINT [FK_FacturaencabezadoCompra_FaCE_Id]
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_FacCompraSucu_Id] FOREIGN KEY([Sucu_Id])
REFERENCES [Gral].[tbSucursales] ([Sucu_Id])
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado] CHECK CONSTRAINT [FK_FacCompraSucu_Id]
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_MedotoPagoFacCompra_Mepa_Id] FOREIGN KEY([Mepa_Id])
REFERENCES [Gral].[tbMetodosPago] ([Mepa_Id])
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado] CHECK CONSTRAINT [FK_MedotoPagoFacCompra_Mepa_Id]
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorFacCompra_Prov_Id] FOREIGN KEY([Prov_Id])
REFERENCES [Gral].[tbProveedores] ([Prov_Id])
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado] CHECK CONSTRAINT [FK_ProveedorFacCompra_Prov_Id]
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioCreacion] FOREIGN KEY([FeCE_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado] CHECK CONSTRAINT [FK_UsuarioCreacion]
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioModificacion] FOREIGN KEY([FaCE_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbFacturaCompraEncabezado] CHECK CONSTRAINT [FK_UsuarioModificacion]
GO
ALTER TABLE [Vent].[tbFacturaDetalles]  WITH CHECK ADD  CONSTRAINT [tbFacturaDetalles_tbFactura_Fact_Id] FOREIGN KEY([Fact_Id])
REFERENCES [Vent].[tbFactura] ([Fact_Id])
GO
ALTER TABLE [Vent].[tbFacturaDetalles] CHECK CONSTRAINT [tbFacturaDetalles_tbFactura_Fact_Id]
GO
ALTER TABLE [Vent].[tbJoyas]  WITH CHECK ADD  CONSTRAINT [tbJoyas_tbCategorias_Cate_Id] FOREIGN KEY([Cate_Id])
REFERENCES [Gral].[tbCategorias] ([Cate_Id])
GO
ALTER TABLE [Vent].[tbJoyas] CHECK CONSTRAINT [tbJoyas_tbCategorias_Cate_Id]
GO
ALTER TABLE [Vent].[tbJoyas]  WITH CHECK ADD  CONSTRAINT [tbJoyas_tbMateriales_Mate_Id] FOREIGN KEY([Mate_Id])
REFERENCES [Gral].[tbMateriales] ([Mate_Id])
GO
ALTER TABLE [Vent].[tbJoyas] CHECK CONSTRAINT [tbJoyas_tbMateriales_Mate_Id]
GO
ALTER TABLE [Vent].[tbJoyas]  WITH CHECK ADD  CONSTRAINT [tbJoyas_tbProveedores_Prov_Id] FOREIGN KEY([Prov_Id])
REFERENCES [Gral].[tbProveedores] ([Prov_Id])
GO
ALTER TABLE [Vent].[tbJoyas] CHECK CONSTRAINT [tbJoyas_tbProveedores_Prov_Id]
GO
ALTER TABLE [Vent].[tbJoyas]  WITH CHECK ADD  CONSTRAINT [tbJoyas_tbUsuarios_Joya_UsuarioCreacion] FOREIGN KEY([Joya_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbJoyas] CHECK CONSTRAINT [tbJoyas_tbUsuarios_Joya_UsuarioCreacion]
GO
ALTER TABLE [Vent].[tbJoyas]  WITH CHECK ADD  CONSTRAINT [tbJoyas_tbUsuarios_Joya_UsuarioModificacion] FOREIGN KEY([Joya_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbJoyas] CHECK CONSTRAINT [tbJoyas_tbUsuarios_Joya_UsuarioModificacion]
GO
ALTER TABLE [Vent].[tbMaquillajes]  WITH CHECK ADD  CONSTRAINT [tbMaquillajes_tbMarcas_Marc_Id] FOREIGN KEY([Marc_Id])
REFERENCES [Gral].[tbMarcas] ([Marc_Id])
GO
ALTER TABLE [Vent].[tbMaquillajes] CHECK CONSTRAINT [tbMaquillajes_tbMarcas_Marc_Id]
GO
ALTER TABLE [Vent].[tbMaquillajes]  WITH CHECK ADD  CONSTRAINT [tbMaquillajes_tbProveedores_Prov_Id] FOREIGN KEY([Prov_Id])
REFERENCES [Gral].[tbProveedores] ([Prov_Id])
GO
ALTER TABLE [Vent].[tbMaquillajes] CHECK CONSTRAINT [tbMaquillajes_tbProveedores_Prov_Id]
GO
ALTER TABLE [Vent].[tbMaquillajes]  WITH CHECK ADD  CONSTRAINT [tbMaquillajes_tbUsuarios_Maqu_UsuarioCreacion] FOREIGN KEY([Maqu_UsuarioCreacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbMaquillajes] CHECK CONSTRAINT [tbMaquillajes_tbUsuarios_Maqu_UsuarioCreacion]
GO
ALTER TABLE [Vent].[tbMaquillajes]  WITH CHECK ADD  CONSTRAINT [tbMaquillajes_tbUsuarios_Maqu_UsuarioModificacion] FOREIGN KEY([Maqu_UsuarioModificacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Vent].[tbMaquillajes] CHECK CONSTRAINT [tbMaquillajes_tbUsuarios_Maqu_UsuarioModificacion]
GO
/****** Object:  StoredProcedure [Acce].[sp_LlenarCodigo]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [Acce].[sp_LlenarCodigo] 
@usua_Id int,
@codigo varchar(7)
AS
BEGIN
	UPDATE Acce.tbUsuarios
	set [Usua_Codigo] = @codigo
	WHERE Usua_Id = @usua_Id
END
GO
/****** Object:  StoredProcedure [Acce].[sp_Pantallas_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Acce].[sp_Pantallas_listar] 
AS
BEGIN
  SELECT 
    Pant_Id, 
    [Pant_Descripcion], 
    Pant_UsuarioCreacion, 
    Pant_FechaCreacion, 
    Pant_UsuarioModificacion, 
    Pant_FechaModificacion
  FROM [Acce].[tbPantallas]  
  WHERE Pant_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRol_Pantallas]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_PantallasPorRol_Pantallas]
@Role_Id INT
AS 
BEGIN
SELECT P.Pant_Descripcion FROM Acce.tbPantallasPorRoles PR
INNER JOIN Acce.tbRoles R ON R.Role_Id = PR.Role_Id
INNER JOIN Acce.tbPantallas P ON P.Pant_Id = Pr.Pant_Id
WHERE R.Role_Id =  @Role_Id
END
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRol2_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[sp_PantallasPorRol2_buscar] 
    @Role_Id INT
AS
BEGIN
    SELECT 
        Paxr_Id,
        Pant_Id,
        paro.[Role_Id],
        Role_Rol,
		'SI' AS Agregado 
    FROM 
        [Acce].[tbPantallasPorRoles] AS paro
        JOIN Acce.tbRoles AS r on paro.Role_Id = r.Role_Id
    WHERE
        paro.[Role_Id] = @Role_Id ;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRoles_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Acce].[sp_PantallasPorRoles_actualizar]
    @Paxr_Id INT,
    @Role_Id INT,
    @Pant_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Acce].[tbPantallasPorRoles]
        SET
            Role_Id = @Role_Id,
            Pant_Id = @Pant_Id
        WHERE
            Paxr_Id = @Paxr_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRoles_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Acce].[sp_PantallasPorRoles_buscar]
    @Paxr_Id INT
AS
BEGIN
    SELECT 
        Paxr_Id,
        Role_Id,
        Pant_Id
    FROM 
        [Acce].[tbPantallasPorRoles]
    WHERE
        Paxr_Id = @Paxr_Id;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRoles_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Acce].[sp_PantallasPorRoles_eliminar]
    @Role_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Acce].[tbPantallasPorRoles]
        WHERE Role_Id = @Role_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRoles_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Acce].[sp_PantallasPorRoles_insertar]
    @Role_Id INT,
    @Pant_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Acce].[tbPantallasPorRoles] 
        (
            Role_Id, 
            Pant_Id
        )
        VALUES 
        (
            @Role_Id, 
            @Pant_Id
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasRoles_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCedure [Acce].[sp_PantallasRoles_listar]
as
begin
SELECT PR.[Pant_Id], P.[Pant_Descripcion] AS Pantalla, R.Role_Rol
FROM [Acce].[tbPantallasPorRoles] PR 
INNER JOIN Acce.tbPantallas P ON PR.Pant_Id=P.Pant_Id 
INNER JOIN[Acce].[tbRoles] R ON PR.Role_Id= R.Role_Id
end
GO
/****** Object:  StoredProcedure [Acce].[sp_Restablecer_Contra]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [Acce].[sp_Restablecer_Contra]
@Usua_Id int,
@contra varchar(MAX)
as
begin
	update [Acce].[tbUsuarios]
	set 
	[Usua_Contraseña] = CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @contra), 2)
	where [Usua_Id] = @Usua_Id
end
GO
/****** Object:  StoredProcedure [Acce].[sp_Roles_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Acce].[sp_Roles_actualizar]
    @Role_Id INT,
    @Role_Rol NVARCHAR(60),
    @Role_UsuarioModificacion INT,
    @Role_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Acce].[tbRoles]
        SET
            Role_Rol = @Role_Rol,
            Role_UsuarioModificacion = @Role_UsuarioModificacion,
            Role_FechaModificacion = @Role_FechaModificacion
        WHERE
            Role_Id = @Role_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_Roles_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Acce].[sp_Roles_buscar] 
    @Role_Id INT
AS
BEGIN
    SELECT 
        c.Role_Id,
        Role_Rol,
        Role_UsuarioCreacion,
        Role_UsuarioModificacion,
		FORMAT(Role_FechaCreacion, 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Role_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion ,
        [Role_Estado]
    FROM 
        [Acce].[tbRoles] c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Role_UsuarioCreacion
		LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Role_UsuarioModificacion
    WHERE
        c.Role_Id = @Role_Id;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_Roles_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Acce].[sp_Roles_eliminar]
    @Role_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Acce].[tbRoles]
        WHERE Role_Id = @Role_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_Roles_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Acce].[sp_Roles_insertar]
    @Role_Rol NVARCHAR(60),
    @Role_UsuarioCreacion INT,
    @Role_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Acce].[tbRoles] 
        (
            Role_Rol, 
            Role_UsuarioCreacion, 
            Role_FechaCreacion
        )
        VALUES 
        (
            @Role_Rol, 
            @Role_UsuarioCreacion, 
            @Role_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_Roles_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[sp_Roles_listar]
AS
BEGIN
SELECT * FROM Acce.tbRoles
WHERE Role_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[sp_Roles2_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [Acce].[sp_Roles2_insertar]
  @Role_Rol NVARCHAR(60),
    @Role_UsuarioCreacion INT,
    @Role_FechaCreacion DATETIME,
    @ID INT OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Acce].[tbRoles] (Role_Rol, Role_UsuarioCreacion,  Role_FechaCreacion)
        VALUES (@Role_Rol, @Role_UsuarioCreacion, @Role_FechaCreacion);

        SET @ID = SCOPE_IDENTITY();
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT @ID = 0;
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_Usuarios_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_Usuarios_actualizar]
    (
		@Usua_Id INT,
        @Usua_Usuario VARCHAR(30),
        @Usua_Admin BIT,
        @Empl_Id INT,
        @Rol_Id INT,
        @UsuarioModificacion INT,
        @FechaModificacion DATETIME
    )
AS
BEGIN

BEGIN TRY 

   
        UPDATE Acce.tbUsuarios SET
            Usua_Usuario = @Usua_Usuario,
            Usua_Administrador = @Usua_Admin,
            Empl_Id = @Empl_Id,
            Role_Id = @Rol_Id,
            Usua_UsuarioModificacion = @UsuarioModificacion,
            Usua_FechaModificacion = @FechaModificacion

			WHERE Usua_Id = @Usua_Id
	
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [Acce].[sp_Usuarios_actualizar1]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[sp_Usuarios_actualizar1]
    (
		@Usua_Id INT,
        @Usua_Usuario VARCHAR(30),
        @Empl_Id INT,
        @Rol_Id INT,
        @UsuarioModificacion INT,
        @FechaModificacion DATETIME
    )
AS
BEGIN

BEGIN TRY 

   
        UPDATE Acce.tbUsuarios SET
            Usua_Usuario = @Usua_Usuario,
            Empl_Id = @Empl_Id,
            Role_Id = @Rol_Id,
            Usua_UsuarioModificacion = @UsuarioModificacion,
            Usua_FechaModificacion = @FechaModificacion

			WHERE Usua_Id = @Usua_Id
	
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [Acce].[sp_Usuarios_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_Usuarios_buscar]
@Usua_Id INT
AS
BEGIN
    SELECT 
        u.Usua_Id,
        u.Usua_Usuario,
        u.Usua_Contraseña,
        u.Usua_Administrador,
        CASE WHEN u.Usua_Administrador = 1 THEN 'Admin' ELSE 'Usuario' END AS Usua_Administradores,
        r.Role_Rol,  
        e.Empl_Nombre, 
		e.Empl_Correo,
        r.Role_Id, 
        e.Empl_Id,
		s.Sucu_Nombre,
		FORMAT(u.[Usua_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(u.[Usua_FechaModificacion], 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion,
		uModificador.Usua_Usuario AS UsuarioModificacion
    FROM Acce.tbUsuarios u
    LEFT JOIN Acce.tbRoles r ON r.Role_Id = u.Role_Id
    LEFT JOIN Gral.tbEmpleados e ON e.Empl_Id = u.Empl_Id
    LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = u.Usua_UsuarioCreacion
    LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = u.Usua_UsuarioModificacion
	LEFT JOIN Gral.tbSucursales s ON s.Sucu_Id = e.Sucu_Id
    WHERE u.Usua_Id = @Usua_Id
END
GO
/****** Object:  StoredProcedure [Acce].[sp_Usuarios_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_Usuarios_eliminar] 
    @Usua_Id INT
AS
BEGIN
    BEGIN TRY
        UPDATE Acce.tbUsuarios
        SET Usua_Estado = 0
        WHERE Usua_Id = @Usua_Id;
        SELECT 1 AS Resultado;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_Usuarios_inicioSesion]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_Usuarios_inicioSesion] 
	@Usuario VARCHAR (100),
	@Contra	VARCHAR (MAX)
AS
BEGIN
 BEGIN TRY
       
	SELECT usu.Usua_Id AS Usua_Id,
			usu.Usua_Usuario AS Usua_Usuario,
			usu.Usua_Contraseña AS Usua_Contraseña,
			emp.Empl_Nombre + ' ' + emp.Empl_Apellido AS Empl_Nombre,
			emp.Empl_Id,
			r.Role_Id,
			p.pant_descripcion,
			usu.Usua_Administrador,
			S.Sucu_Id,
			S.Sucu_Nombre,
			ro.Role_Rol,
			emp.Empl_Correo
	FROM Acce.tbUsuarios AS usu LEFT JOIN Gral.tbEmpleados AS emp
	ON usu.Empl_id = emp.Empl_id LEFT JOIN Acce.tbPantallasPorRoles AS R ON r.Role_Id = usu.Role_Id LEFT JOIN Acce.tbPantallas AS p ON p.Pant_id = R.Pant_id
	LEFT JOIN Gral.tbSucursales S ON S.Sucu_Id = emp.Sucu_Id left join [Acce].[tbRoles] as ro on ro.Role_Id = usu.Role_Id
	WHERE usu.Usua_Usuario = @Usuario AND usu.Usua_Contraseña = CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @Contra), 2);
 SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0; 
      
    END CATCH
END
GO
/****** Object:  StoredProcedure [Acce].[sp_Usuarios_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_Usuarios_insertar]
        @Usua_Usuario VARCHAR(30),
        @Usua_Contra VARCHAR(MAX),
        @Usua_Admin BIT,
        @Empl_Id INT,
        @Rol_Id INT,
        @Usua_Usua_Creacion INT,
        @Usua_Fecha_Creacion DATETIME
AS
BEGIN
     DECLARE @estadoActual INT;

    SELECT @estadoActual = Usua_Estado FROM [Acce].[tbUsuarios] WHERE Usua_Usuario = @Usua_Usuario;
BEGIN TRY 
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
           
                UPDATE [Acce].[tbUsuarios] SET Usua_Estado = 0 WHERE Usua_Usuario = @Usua_Usuario;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
        INSERT INTO Acce.tbUsuarios (
           Usua_Usuario,
            Usua_Contraseña,
            Usua_Administrador,
            Empl_Id,
            Role_Id,
            Usua_UsuarioCreacion,
            Usua_FechaCreacion
        )
        VALUES (
           @Usua_Usuario,
		CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @Usua_Contra), 2),
            @Usua_Admin,
            @Empl_Id,
            @Rol_Id,
            @Usua_Usua_Creacion,
            @Usua_Fecha_Creacion
        );
		END
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_Usuarios_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_Usuarios_listar] 
AS
BEGIN
  SELECT 
    Usua_Id, 
    Usua_Usuario, 
    Usua_Contraseña, 
    CASE Usua_Administrador WHEN 1 THEN 'SI' ELSE 'NO' END AS Usua_Administradores, 
	R.Role_Rol,
	E.Empl_Nombre,
    Usua_UsuarioCreacion, 
    Usua_FechaCreacion, 
    Usua_UsuarioModificacion, 
    Usua_FechaModificacion, 
    Usua_Estado
  FROM [Acce].[tbUsuarios] U
  LEFT JOIN Acce.tbRoles R ON R.Role_Id = U.Role_Id
  LEFT JOIN Gral.tbEmpleados E ON E.Empl_Id = U.Empl_Id
  WHERE Usua_Estado = 1
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_ValidarCodigo]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [Acce].[sp_ValidarCodigo] 
@Codigo varchar(7)
as
begin
	begin try
		declare @return int
		set @return = 0;
		update Acce.tbUsuarios
		set
		[Usua_Codigo] = NULL,
		@return = 1
		where [Usua_Codigo] = @Codigo
		
		select @return
	end try
	begin catch
		select 0
	end catch
end
GO
/****** Object:  StoredProcedure [Acce].[sp_validarCorreo]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[sp_validarCorreo] 
@usua_Usuario VARCHAR(60)
AS
BEGIN
SELECT 
	Usua_Id,
	Usua_Usuario,
	Empl_Correo as empl_Correo
FROM Acce.tbUsuarios usu
LEFT JOIN Gral.tbEmpleados emp ON emp.Empl_Id = usu.Empl_Id
WHERE Usua_Usuario = @usua_Usuario
END

GO
/****** Object:  StoredProcedure [Gral].[sp_Cargos_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Cargos_actualizar]
    @Carg_Id INT,
    @Carg_Cargo NVARCHAR(60),
    @Carg_UsuarioModificacion INT,
    @Carg_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbCargos]
        SET
            Carg_Cargo = @Carg_Cargo,
            Carg_UsuarioModificacion = @Carg_UsuarioModificacion,
            Carg_FechaModificacion = @Carg_FechaModificacion
        WHERE
            Carg_Id = @Carg_Id;
        SELECT 1; -- Operación exitosa
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; -- Si ocurre un error, devolvemos 0
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Cargos_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Cargos_buscar]
    @Carg_Id INT
AS
BEGIN
    SELECT 
        [Carg_Id],
        [Carg_Cargo],
        [Carg_UsuarioCreacion],
        [Carg_FechaCreacion],
		     FORMAT([Carg_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT([Carg_FechaModificacion], 'yyyy-MM-dd') AS FechaModificacion,
        
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion ,
        [Carg_Estado]
    FROM 
        [Gral].[tbCargos]c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Carg_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Carg_UsuarioModificacion
    WHERE
        Carg_Id = @Carg_Id 
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Cargos_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Cargos_eliminar]
    @Carg_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbCargos]
        SET Carg_Estado = 0 
        WHERE Carg_Id = @Carg_Id;

        SELECT 1 AS Resultado;
          
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Cargos_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Cargos_insertar]
    @Carg_Cargo NVARCHAR(60),
    @Carg_UsuarioCreacion INT,
    @Carg_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbCargos] (Carg_Cargo, Carg_UsuarioCreacion, Carg_FechaCreacion)
        VALUES (@Carg_Cargo, @Carg_UsuarioCreacion, @Carg_FechaCreacion);
        SELECT 1
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0
        ROLLBACK;
    END CATCH
END;


GO
/****** Object:  StoredProcedure [Gral].[sp_Cargos_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Cargos_listar] 
AS
BEGIN
  SELECT Carg_Id, Carg_Cargo, Carg_UsuarioCreacion, Carg_FechaCreacion, Carg_UsuarioModificacion, Carg_FechaModificacion, Carg_Estado
  FROM [Gral].[tbCargos]  
  WHERE Carg_Estado = 1; 
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Mostrar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Cargos_Mostrar]
AS
BEGIN
SELECT * FROM Gral.tbCargos
END
GO
/****** Object:  StoredProcedure [Gral].[sp_Categorias_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Categorias_actualizar]
    @Cate_Id INT,
    @Cate_Categoria NVARCHAR(60),
    @Cate_UsuarioModificacion INT,
    @Cate_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbCategorias]
        SET
            Cate_Categoria = @Cate_Categoria,
            Cate_UsuarioModificacion = @Cate_UsuarioModificacion,
            Cate_FechaModificacion = @Cate_FechaModificacion
        WHERE
            Cate_Id = @Cate_Id;
        
        COMMIT;
        SELECT 1; 
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 0; 
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Categorias_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Categorias_buscar] 
    @Cate_Id INT
AS
BEGIN
    SELECT 
        [Cate_Id],
        [Cate_Categoria],
        [Cate_UsuarioCreacion],
        [Cate_FechaCreacion],
        [Cate_UsuarioModificacion],
        [Cate_FechaModificacion],
        [Cate_Estado],
	   FORMAT([Cate_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT([Cate_FechaModificacion], 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbCategorias] c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Cate_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Cate_UsuarioModificacion

    WHERE
        Cate_Id = @Cate_Id 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Categorias_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Categorias_eliminar]
    @Cate_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbCategorias]
        SET Cate_Estado = 0 
        WHERE Cate_Id = @Cate_Id;
          
        COMMIT;
        SELECT 1 AS Resultado; 
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SELECT 0 AS Resultado; 
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Categorias_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Categorias_insertar]
    @Cate_Categoria NVARCHAR(60),
    @Cate_UsuarioCreacion INT,
    @Cate_FechaCreacion DATETIME
AS
BEGIN
   

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbCategorias] (Cate_Categoria, Cate_UsuarioCreacion, Cate_FechaCreacion)
        VALUES (@Cate_Categoria, @Cate_UsuarioCreacion, @Cate_FechaCreacion);
        
        SElect   1;
        
        COMMIT;
    END TRY
    BEGIN CATCH
        SElect   0;
        ROLLBACK;
    END CATCH

   
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Categorias_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Categorias_listar] 
AS
BEGIN
  SELECT Cate_Id, Cate_Categoria, Cate_UsuarioCreacion, Cate_FechaCreacion, Cate_UsuarioModificacion, Cate_FechaModificacion, Cate_Estado
  FROM [Gral].[tbCategorias]  
  WHERE Cate_Estado = 1; 
END
GO
/****** Object:  StoredProcedure [Gral].[sp_Clientes_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Clientes_actualizar]
    @Clie_Id INT,
    @Clie_Nombre NVARCHAR(60),
    @Clie_Apellido NVARCHAR(60),
    @Clie_FechaNac DATETIME,
    @Clie_Sexo CHAR(1),
	@Clie_DNI VARCHAR(13),
    @Muni_Codigo VARCHAR(4),
    @Esta_Id INT,
    @Clie_UsuarioModificacion INT,
    @Clie_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbClientes]
        SET
            Clie_Nombre = @Clie_Nombre,
            Clie_Apellido = @Clie_Apellido,
            Clie_FechaNac = @Clie_FechaNac,
            Clie_Sexo = @Clie_Sexo,
            Muni_Codigo = @Muni_Codigo,
            Esta_Id = @Esta_Id,
			Clie_DNI = @Clie_DNI,
            Clie_UsuarioModificacion = @Clie_UsuarioModificacion,
            Clie_FechaModificacion = @Clie_FechaModificacion
        WHERE
            Clie_Id = @Clie_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;


GO
/****** Object:  StoredProcedure [Gral].[sp_Clientes_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Gral].[sp_Clientes_buscar]
    @Clie_Id INT
AS
BEGIN
    SELECT 
        Clie_Id,
        Clie_Nombre,
        Clie_Apellido,
        Clie_FechaNac,
		Clie_DNI,
        Clie_Sexo,
        c.Muni_Codigo,
		mu.Muni_Municipio,
        c.Esta_Id,
		e.Esta_EstadoCivil,
        Clie_UsuarioCreacion,
        Clie_FechaCreacion,
        Clie_UsuarioModificacion,
        Clie_FechaModificacion,
        Clie_Estado,
		D.Depa_Codigo,
		D.Depa_Departamento,
		FORMAT([Clie_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT([Clie_FechaModificacion], 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbClientes]c INNER JOIN Gral.tbEstadosCiviles e on c.Esta_Id= e.Esta_Id INNER JOIN Gral.tbMunicipios mu
  ON mu.Muni_Codigo =c.Muni_Codigo LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Clie_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Clie_UsuarioModificacion
LEFT JOIN Gral.tbDepartamentos D ON mu.Depa_Codigo = D.Depa_Codigo

    WHERE
        Clie_Id = @Clie_Id;
END;	
GO
/****** Object:  StoredProcedure [Gral].[sp_Clientes_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Clientes_eliminar]
    @Clie_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbClientes]
        SET Clie_Estado = 0
        WHERE Clie_Id = @Clie_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Clientes_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Clientes_insertar]
    @Clie_Nombre NVARCHAR(60),
    @Clie_Apellido NVARCHAR(60),
    @Clie_FechaNac DATETIME,
    @Clie_Sexo CHAR(1),
	@Clie_DNI VARCHAR(13),
    @Muni_Codigo VARCHAR(4),
    @Esta_Id INT,
    @Clie_UsuarioCreacion INT,
    @Clie_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbClientes] 
        (
            Clie_Nombre, 
            Clie_Apellido, 
            Clie_FechaNac, 
            Clie_Sexo, 
			Clie_DNI,
            Muni_Codigo, 
            Esta_Id, 
            Clie_UsuarioCreacion, 
            Clie_FechaCreacion
        )
        VALUES 
        (
            @Clie_Nombre, 
            @Clie_Apellido, 
            @Clie_FechaNac, 
            @Clie_Sexo,
			@Clie_DNI,
            @Muni_Codigo, 
            @Esta_Id, 
            @Clie_UsuarioCreacion, 
            @Clie_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Clientes_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [Gral].[sp_Clientes_listar] 
AS
BEGIN
  SELECT 
    Clie_Id, 
    CONCAT(Clie_Nombre, ' ', Clie_Apellido) AS  Clie_Nombre,
    Clie_Apellido, 
    Clie_FechaNac, 
    CASE Clie_Sexo WHEN 'M' THEN 'Masculino' ELSE 'Femenino' END AS Clie_Sexo, 
   c.Muni_Codigo,
   Clie_DNI,
   mu.Muni_Municipio AS Municipio,
    c.Esta_Id, 
	e.Esta_EstadoCivil AS Estado_Civil,
    Clie_UsuarioCreacion, 
    Clie_FechaCreacion, 
    Clie_UsuarioModificacion, 
    Clie_FechaModificacion, 
    Clie_Estado
  FROM [Gral].[tbClientes] c INNER JOIN Gral.tbEstadosCiviles e on c.Esta_Id= e.Esta_Id INNER JOIN Gral.tbMunicipios mu
  ON mu.Muni_Codigo =c.Muni_Codigo 
  WHERE Clie_Estado = 1 AND Clie_DNI != '0000000000000'
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Departamentos_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [Gral].[sp_Departamentos_actualizar]
    @Depa_Codigo NVARCHAR(2),
    @Depa_Departamento NVARCHAR(50),
    @Depa_UsuarioModificacion INT,
    @DePa_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbDepartamentos]
        SET
            Depa_Departamento = @Depa_Departamento,
            Depa_UsuarioModificacion = @Depa_UsuarioModificacion,
            DePa_FechaModificacion = @DePa_FechaModificacion
        WHERE
            Depa_Codigo = @Depa_Codigo;
          SELECT 1 ;
    COMMIT;
  END TRY
  BEGIN CATCH
    SELECT 0;
    ROLLBACK;
  END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Departamentos_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Gral].[sp_Departamentos_buscar]
    @Depa_Codigo NVARCHAR(2)
AS
BEGIN
    SELECT 
        [Depa_Codigo],
        [Depa_Departamento],
        [Depa_UsuarioCreacion],
        [Depa_FechaCreacion],
		   FORMAT([Depa_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Depa_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 

    FROM 
        [Gral].[tbDepartamentos]c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Depa_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Depa_UsuarioModificacion

    WHERE
        Depa_Codigo = @Depa_Codigo 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Departamentos_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Departamentos_eliminar]
    @Depa_Codigo NVARCHAR(2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Gral].[tbDepartamentos]
        WHERE Depa_Codigo = @Depa_Codigo;

            SELECT 1 AS Resultado; 
          
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Departamentos_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Gral].[sp_Departamentos_insertar]
    @Depa_Codigo NVARCHAR(2),
    @Depa_Departamento NVARCHAR(50),
    @Depa_UsuarioCreacion INT,
    @Depa_FechaCreacion DATETIME

AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbDepartamentos] (Depa_Codigo, Depa_Departamento, Depa_UsuarioCreacion, Depa_FechaCreacion)
        VALUES (@Depa_Codigo, @Depa_Departamento, @Depa_UsuarioCreacion, @Depa_FechaCreacion);
           select 0;
        COMMIT;
    END TRY
    BEGIN CATCH
        select -1;
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Departamentos_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Departamentos_listar] 
AS
BEGIN
  SELECT Depa_Codigo, Depa_Departamento, Depa_UsuarioCreacion, Depa_FechaCreacion, Depa_UsuarioModificacion,Depa_FechaModificacion
  FROM[Gral].[tbDepartamentos]  
END
GO
/****** Object:  StoredProcedure [Gral].[sp_Empleados_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Empleados_actualizar] 
    @Empl_Id INT,
    @Empl_Nombre NVARCHAR(30),
    @Empl_Apellido NVARCHAR(30),
    @Empl_Sexo CHAR(1),
    @Empl_FechaNac DATETIME,
	@Empl_DNI VARCHAR(13),
    @Muni_Codigo VARCHAR(4),
	@Sucu_Id INT,
    @Esta_Id INT,
    @Carg_Id INT,
	@Empl_Correo Varchar(max),
    @Empl_UsuarioModificacion INT,
    @Empl_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbEmpleados]
        SET
            Empl_Nombre = @Empl_Nombre,
            Empl_Apellido = @Empl_Apellido,
            Empl_Sexo = @Empl_Sexo,
            Empl_FechaNac = @Empl_FechaNac,
            Muni_Codigo = @Muni_Codigo,
			Empl_DNI = @Empl_DNI,
			Sucu_Id = @Sucu_Id,
            Esta_Id = @Esta_Id,
            Carg_Id = @Carg_Id,
			Empl_Correo= @Empl_Correo,
            Empl_UsuarioModificacion = @Empl_UsuarioModificacion,
            Empl_FechaModificacion = @Empl_FechaModificacion
        WHERE
            Empl_Id = @Empl_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Empleados_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Empleados_buscar] 
    @Empl_Id INT
AS
BEGIN
    SELECT 
       em.Empl_Id,
        Empl_Nombre,
        Empl_Apellido,
        Empl_Sexo,
        Empl_FechaNac,
           em.Muni_Codigo, 
		   Empl_DNI,
	Sucu_Id,
	mu.Muni_Municipio,
    em.Esta_Id, 
	e.Esta_EstadoCivil,
    em.Carg_Id,
	c.Carg_Cargo,
	D.Depa_Codigo,
	D.Depa_Departamento,
	Empl_Correo,
     	   FORMAT([Empl_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Empl_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
        Empl_Estado,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbEmpleados] em INNER JOIN Gral.tbEstadosCiviles e on em.Esta_Id= e.Esta_Id  INNER JOIN Gral.tbCargos c on em.Carg_Id=c.Carg_Id inner join Gral.tbMunicipios mu on mu.Muni_Codigo=em.Muni_Codigo LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = em.Empl_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = em.Empl_UsuarioModificacion
LEFT JOIN Gral.tbDepartamentos D ON D.Depa_Codigo = mu.Depa_Codigo



  
    WHERE
        em.Empl_Id = @Empl_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Empleados_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Empleados_eliminar]
    @Empl_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbEmpleados]
        SET Empl_Estado = 0
        WHERE Empl_Id = @Empl_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Empleados_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Empleados_insertar]
    @Empl_Nombre NVARCHAR(30),
    @Empl_Apellido NVARCHAR(30),
    @Empl_Sexo CHAR(1),
    @Empl_FechaNac DATETIME,
	@Empl_DNI VARCHAR(13),
    @Muni_Codigo VARCHAR(4),
	@Sucu_Id INT,
    @Esta_Id INT,
    @Carg_Id INT,
	@Empl_Correo Varchar(max),
    @Empl_UsuarioCreacion INT,
    @Empl_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbEmpleados] 
        (
            Empl_Nombre, 
            Empl_Apellido, 
            Empl_Sexo, 
            Empl_FechaNac,
			Empl_DNI,
            Muni_Codigo, 
			Sucu_Id,
            Esta_Id, 
            Carg_Id, 
			Empl_Correo ,
            Empl_UsuarioCreacion, 
            Empl_FechaCreacion
        )
        VALUES 
        (
            @Empl_Nombre, 
            @Empl_Apellido, 
            @Empl_Sexo, 
            @Empl_FechaNac, 
			@Empl_DNI,
            @Muni_Codigo,
			@Sucu_Id,
            @Esta_Id, 
            @Carg_Id, 
			@Empl_Correo,
            @Empl_UsuarioCreacion, 
            @Empl_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Empleados_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Empleados_listar] 
AS
BEGIN
  SELECT 
    Empl_Id, 
    CONCAT(Empl_Nombre, ' ',Empl_Apellido) AS Empl_Nombre, 
    Empl_Apellido, 
	Empl_DNI,
    CASE Empl_Sexo WHEN 'M' THEN 'Masculino' ELSE 'Femenino' END AS Empl_Sexo,
    Empl_FechaNac, 
    em.Muni_Codigo, 
	mu.Muni_Municipio,
    em.Esta_Id, 
	e.Esta_EstadoCivil,
    em.Carg_Id,
	c.Carg_Cargo,
	Sucu_Id,
    Empl_UsuarioCreacion, 
    Empl_FechaCreacion, 
    Empl_UsuarioModificacion, 
    Empl_FechaModificacion, 
    Empl_Estado
  FROM [Gral].[tbEmpleados] em INNER JOIN Gral.tbEstadosCiviles e on em.Esta_Id= e.Esta_Id INNER JOIN Gral.tbCargos c on em.Carg_Id=c.Carg_Id inner join Gral.tbMunicipios mu on mu.Muni_Codigo=em.Muni_Codigo
  WHERE Empl_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_EstadosCiviles_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_EstadosCiviles_actualizar]
    @Esta_Id INT,
    @Esta_EstadoCivil NVARCHAR(60),
    @Esta_UsuarioModificacion INT,
    @Esta_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbEstadosCiviles]
        SET
            Esta_EstadoCivil = @Esta_EstadoCivil,
            Esta_UsuarioModificacion = @Esta_UsuarioModificacion,
            Esta_FechaModificacion = @Esta_FechaModificacion
        WHERE
            Esta_Id = @Esta_Id;
        SELECT 1; -- Operación exitosa
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; -- Si ocurre un error, devolvemos 0
        ROLLBACK;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_EstadosCiviles_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_EstadosCiviles_buscar]
    @Esta_Id INT
AS
BEGIN
    SELECT 
        [Esta_Id],
        [Esta_EstadoCivil],
        [Esta_UsuarioCreacion],
        [Esta_FechaCreacion],
        	   FORMAT([Esta_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Esta_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
        [Esta_Estado],
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbEstadosCiviles]c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Esta_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Esta_UsuarioModificacion
    WHERE
        Esta_Id = @Esta_Id 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_EstadosCiviles_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Gral].[sp_EstadosCiviles_eliminar]
    @Esta_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbEstadosCiviles]
        SET Esta_Estado = 0
        WHERE Esta_Id = @Esta_Id;

        SELECT 1 AS Resultado ;
          
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_EstadosCiviles_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_EstadosCiviles_insertar]
    @Esta_EstadoCivil NVARCHAR(60),
    @Esta_UsuarioCreacion INT,
    @Esta_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbEstadosCiviles] (Esta_EstadoCivil, Esta_UsuarioCreacion, Esta_FechaCreacion)
        VALUES (@Esta_EstadoCivil, @Esta_UsuarioCreacion, @Esta_FechaCreacion);
        SELECT 1
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_EstadosCiviles_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_EstadosCiviles_listar] 
AS
BEGIN
  SELECT Esta_Id, Esta_EstadoCivil, Esta_UsuarioCreacion, Esta_FechaCreacion, Esta_UsuarioModificacion, Esta_FechaModificacion, Esta_Estado
  FROM [Gral].[tbEstadosCiviles]  
  WHERE Esta_Estado = 1; 
END
GO
/****** Object:  StoredProcedure [Gral].[sp_Impuestos_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Gral].[sp_Impuestos_actualizar]
    @Impu_Id INT,
    @Impu_Impuesto DECIMAL(18,0),
    @Impu_UsuarioModificacion INT,
    @Impu_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbImpuestos]
        SET
            Impu_Impuesto = @Impu_Impuesto,
            Impu_UsuarioModificacion = @Impu_UsuarioModificacion,
            Impu_FechaModificacion = @Impu_FechaModificacion
        WHERE
            Impu_Id = @Impu_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Impuestos_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Impuestos_buscar]
    @Impu_Id INT
AS
BEGIN
    SELECT 
        Impu_Id,
        Impu_Impuesto,
        Impu_UsuarioCreacion,
        Impu_FechaCreacion,
           FORMAT([Impu_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Impu_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario,uModificador.Usua_Usuario
    FROM 
        [Gral].[tbImpuestos]c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Impu_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Impu_UsuarioModificacion
    WHERE
        Impu_Id = @Impu_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Impuestos_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Impuestos_eliminar]
    @Impu_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbImpuestos]
        SET Impu_Estado = 0
        WHERE Impu_Id = @Impu_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Impuestos_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Gral].[sp_Impuestos_insertar]
    @Impu_Impuesto DECIMAL(18,0),
    @Impu_UsuarioCreacion INT,
    @Impu_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbImpuestos] 
        (
            Impu_Impuesto, 
            Impu_UsuarioCreacion, 
            Impu_FechaCreacion
        )
        VALUES 
        (
            @Impu_Impuesto, 
            @Impu_UsuarioCreacion, 
            @Impu_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Impuestos_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Impuestos_listar] 
AS
BEGIN
  SELECT 
    Impu_Id, 
    Impu_Impuesto, 
    Impu_UsuarioCreacion, 
    Impu_FechaCreacion, 
    Impu_UsuarioModificacion, 
    Impu_FechaModificacion
  FROM [Gral].[tbImpuestos]  
  WHERE Impu_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Gral].[SP_Impuestos_Mostrar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Gral].[SP_Impuestos_Mostrar]
AS
BEGIN
SELECT * FROM Gral.tbImpuestos
END
GO
/****** Object:  StoredProcedure [Gral].[sp_Marcas_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Marcas_actualizar]
    @Marc_Id INT,
    @Marc_Marca NVARCHAR(60),
    @Marc_UsuarioModificacion INT,
    @Marc_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbMarcas]
        SET
            Marc_Marca = @Marc_Marca,
            Marc_UsuarioModificacion = @Marc_UsuarioModificacion,
            Marc_FechaModificacion = @Marc_FechaModificacion
        WHERE
            Marc_Id = @Marc_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Marcas_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Marcas_buscar]
    @Marc_Id INT
AS
BEGIN
    SELECT 
        Marc_Id,
        Marc_Marca,
        Marc_UsuarioCreacion,
        Marc_FechaCreacion,
        Marc_UsuarioModificacion,
        Marc_FechaModificacion,
		     FORMAT([Marc_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(  Marc_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbMarcas]c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Marc_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Marc_UsuarioModificacion
    WHERE
        Marc_Id = @Marc_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Marcas_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Gral].[sp_Marcas_eliminar]
    @Marc_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbMarcas]
        SET Marc_Estado = 0
        WHERE Marc_Id = @Marc_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Marcas_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Marcas_insertar]
    @Marc_Marca NVARCHAR(60),
    @Marc_UsuarioCreacion INT,
    @Marc_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbMarcas] 
        (
            Marc_Marca, 
            Marc_UsuarioCreacion, 
            Marc_FechaCreacion
        )
        VALUES 
        (
            @Marc_Marca, 
            @Marc_UsuarioCreacion, 
            @Marc_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Marcas_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Marcas_listar] 
AS
BEGIN
  SELECT 
    Marc_Id, 
    Marc_Marca, 
    Marc_UsuarioCreacion, 
    Marc_FechaCreacion, 
    Marc_UsuarioModificacion, 
    Marc_FechaModificacion
  FROM [Gral].[tbMarcas]  
  WHERE Marc_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Materiales_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Materiales_actualizar]
    @Mate_Id INT,
    @Mate_Material NVARCHAR(60),
    @Mate_UsuarioModificacion INT,
    @Mate_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbMateriales]
        SET
            Mate_Material = @Mate_Material,
            Mate_UsuarioModificacion = @Mate_UsuarioModificacion,
            Mate_FechaModificacion = @Mate_FechaModificacion
        WHERE
            Mate_Id = @Mate_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Materiales_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Materiales_buscar]
    @Mate_Id INT
AS
BEGIN
    SELECT 
        Mate_Id,
        Mate_Material,
        Mate_UsuarioCreacion,
        Mate_UsuarioModificacion,
		     FORMAT([Mate_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Mate_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbMateriales]c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Mate_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Mate_UsuarioModificacion
    WHERE
        Mate_Id = @Mate_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Materiales_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Materiales_eliminar]
    @Mate_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbMateriales]
        SET Mate_Estado = 0
        WHERE Mate_Id = @Mate_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Materiales_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Materiales_insertar]
    @Mate_Material NVARCHAR(60),
    @Mate_UsuarioCreacion INT,
    @Mate_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbMateriales] 
        (
            Mate_Material, 
            Mate_UsuarioCreacion, 
            Mate_FechaCreacion
        )
        VALUES 
        (
            @Mate_Material, 
            @Mate_UsuarioCreacion, 
            @Mate_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Materiales_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Materiales_listar] 
AS
BEGIN
  SELECT 
    Mate_Id, 
    Mate_Material, 
    Mate_UsuarioCreacion, 
    Mate_FechaCreacion, 
    Mate_UsuarioModificacion, 
    Mate_FechaModificacion
  FROM [Gral].[tbMateriales]  
  WHERE Mate_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_MetodosPago_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_MetodosPago_actualizar]
    @Mepa_Id INT,
    @Mepa_Metodo NVARCHAR(60),
    @Mepa_UsuarioModificacion INT,
    @Mepa_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbMetodosPago]
        SET
            Mepa_Metodo = @Mepa_Metodo,
            Mepa_UsuarioModificacion = @Mepa_UsuarioModificacion,
            Mepa_FechaModificacion = @Mepa_FechaModificacion
        WHERE
            Mepa_Id = @Mepa_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_MetodosPago_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_MetodosPago_buscar]
    @Mepa_Id INT
AS
BEGIN
    SELECT 
        Mepa_Id,
        Mepa_Metodo,
        Mepa_UsuarioCreacion,
        Mepa_FechaCreacion,
        Mepa_UsuarioModificacion,
        Mepa_FechaModificacion,
				     FORMAT([Mepa_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Mepa_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbMetodosPago]c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Mepa_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Mepa_UsuarioModificacion
    WHERE
        Mepa_Id = @Mepa_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_MetodosPago_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Gral].[sp_MetodosPago_eliminar]
    @Mepa_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbMetodosPago]
        SET Mepa_Estado = 0
        WHERE Mepa_Id = @Mepa_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_MetodosPago_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_MetodosPago_insertar]
    @Mepa_Metodo NVARCHAR(60),
    @Mepa_UsuarioCreacion INT,
    @Mepa_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbMetodosPago] 
        (
            Mepa_Metodo, 
            Mepa_UsuarioCreacion, 
            Mepa_FechaCreacion
        )
        VALUES 
        (
            @Mepa_Metodo, 
            @Mepa_UsuarioCreacion, 
            @Mepa_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_MetodosPago_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_MetodosPago_listar] 
AS
BEGIN
  SELECT 
    Mepa_Id, 
    Mepa_Metodo, 
    Mepa_UsuarioCreacion, 
    Mepa_FechaCreacion, 
    Mepa_UsuarioModificacion, 
    Mepa_FechaModificacion
  FROM [Gral].[tbMetodosPago]  
  WHERE Mepa_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Municipios_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Municipios_actualizar]
    @Muni_Codigo NVARCHAR(4),
    @Muni_Municipio NVARCHAR(60),
    @Depa_Codigo NVARCHAR(2),
    @Muni_UsuarioModificacion INT,
    @Muni_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbMunicipios]
        SET
            Muni_Municipio = @Muni_Municipio,
            Depa_Codigo = @Depa_Codigo,
            Muni_UsuarioModificacion = @Muni_UsuarioModificacion,
            Muni_FechaModificacion = @Muni_FechaModificacion
        WHERE
            Muni_Codigo = @Muni_Codigo;
        SELECT 1;
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Municipios_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Gral].[sp_Municipios_buscar] 
    @Muni_Codigo NVARCHAR(4)
AS
BEGIN
    SELECT 
        [Muni_Codigo],
        [Muni_Municipio],
       m.[Depa_Codigo],
		d.Depa_Departamento as Departamento,
        [Muni_UsuarioCreacion],
        FORMAT([Muni_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT([Muni_FechaModificacion], 'yyyy-MM-dd') AS FechaModificacion,
        [Muni_UsuarioModificacion],
			
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbMunicipios]m INNER JOIN Gral.tbDepartamentos  d on d.Depa_Codigo=m.Depa_Codigo LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = m.Muni_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = m.Muni_UsuarioModificacion
   
    WHERE
        Muni_Codigo = @Muni_Codigo 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Municipios_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Municipios_eliminar]
    @Muni_Codigo NVARCHAR(4)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Gral].[tbMunicipios]
        WHERE Muni_Codigo = @Muni_Codigo;

        SELECT 1 AS Resultado;
          
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Municipios_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Municipios_insertar]
    @Muni_Codigo NVARCHAR(4),
    @Muni_Municipio NVARCHAR(60),
    @Depa_Codigo NVARCHAR(2),
    @Muni_UsuarioCreacion INT,
    @Muni_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbMunicipios] (Muni_Codigo, Muni_Municipio, Depa_Codigo, Muni_UsuarioCreacion, Muni_FechaCreacion)
        VALUES (@Muni_Codigo, @Muni_Municipio, @Depa_Codigo, @Muni_UsuarioCreacion, @Muni_FechaCreacion);
        SELECT 0;
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT -1;
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Municipios_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [Gral].[sp_Municipios_listar] 
AS
BEGIN
  SELECT Muni_Codigo, Muni_Municipio, d.Depa_Departamento AS Departamento, Muni_UsuarioCreacion, Muni_FechaCreacion, Muni_UsuarioModificacion, Muni_FechaModificacion
  FROM [Gral].[tbMunicipios]  m INNER JOIN Gral.tbDepartamentos  d on d.Depa_Codigo=m.Depa_Codigo
END
GO
/****** Object:  StoredProcedure [Gral].[sp_Municipios_MostrarPorDepartamento]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Municipios_MostrarPorDepartamento]
@Depa_Codigo VARCHAR(2)
AS
BEGIN
SELECT * FROM Gral.tbMunicipios
WHERE Depa_Codigo = @Depa_Codigo
END
GO
/****** Object:  StoredProcedure [Gral].[sp_Proveedores_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Proveedores_actualizar]
    @Prov_Id INT,
    @Prov_Proveedor NVARCHAR(60),
    @Prov_Telefono VARCHAR(8),
    @Muni_Codigo VARCHAR(4),
    @Prov_UsuarioModificacion INT,
    @Prov_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbProveedores]
        SET
            Prov_Proveedor = @Prov_Proveedor,
            Prov_Telefono = @Prov_Telefono,
            Muni_Codigo = @Muni_Codigo,
            Prov_UsuarioModificacion = @Prov_UsuarioModificacion,
            Prov_FechaModificacion = @Prov_FechaModificacion
        WHERE
            Prov_Id = @Prov_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Proveedores_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Proveedores_buscar] 
    @Prov_Id INT
AS
BEGIN
    SELECT 
        Prov_Id,
        Prov_Proveedor,
        Prov_Telefono,
        p.Muni_Codigo,
		m.Muni_Municipio,
		d.Depa_Codigo,
		d.Depa_Departamento,
		FORMAT([Prov_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Prov_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbProveedores]p INNER JOIN Gral.tbMunicipios m on p.Muni_Codigo=m.Muni_Codigo  LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = p.Prov_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = p.Prov_UsuarioModificacion
LEFT JOIN Gral.tbDepartamentos D ON m.Depa_Codigo = d.Depa_Codigo
 
    WHERE
        Prov_Id = @Prov_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Proveedores_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Proveedores_eliminar]
    @Prov_Id INT
AS
BEGIN
    BEGIN TRY

        UPDATE [Gral].[tbProveedores]
        SET Prov_Estado = 0
        WHERE Prov_Id = @Prov_Id;

        SELECT 1 AS Resultado;;


    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Proveedores_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Proveedores_insertar]
    @Prov_Proveedor NVARCHAR(60),
    @Prov_Telefono VARCHAR(8),
    @Muni_Codigo VARCHAR(4),
    @Prov_UsuarioCreacion INT,
    @Prov_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbProveedores] 
        (
            Prov_Proveedor, 
            Prov_Telefono, 
            Muni_Codigo, 
            Prov_UsuarioCreacion, 
            Prov_FechaCreacion
        )
        VALUES 
        (
            @Prov_Proveedor, 
            @Prov_Telefono, 
            @Muni_Codigo, 
            @Prov_UsuarioCreacion, 
            @Prov_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Proveedores_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Proveedores_listar] 
AS
BEGIN
  SELECT 
    Prov_Id, 
    Prov_Proveedor, 
    Prov_Proveedor as nombreProveedor, 
    Prov_Telefono, 
    p.Muni_Codigo, 
	m.Muni_Municipio,
    Prov_UsuarioCreacion, 
    Prov_FechaCreacion, 
    Prov_UsuarioModificacion, 
    Prov_FechaModificacion
  FROM [Gral].[tbProveedores] p INNER JOIN Gral.tbMunicipios m on p.Muni_Codigo=m.Muni_Codigo
  WHERE Prov_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Proveedores_listar1]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   PROCEDURE [Gral].[sp_Proveedores_listar1] 
AS
BEGIN
  SELECT 
    Prov_Id, 
    Prov_Proveedor as nombreProveedor, 
    Prov_Telefono, 
    p.Muni_Codigo, 
	m.Muni_Municipio,
    Prov_UsuarioCreacion, 
    Prov_FechaCreacion, 
    Prov_UsuarioModificacion, 
    Prov_FechaModificacion
  FROM [Gral].[tbProveedores] p INNER JOIN Gral.tbMunicipios m on p.Muni_Codigo=m.Muni_Codigo
  WHERE Prov_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Sucursales_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Sucursales_actualizar]
    @Sucu_Id INT,
    @Sucu_Nombre NVARCHAR(60),
    @Muni_Codigo VARCHAR(4),
    @Sucu_UsuarioModificacion INT,
    @Sucu_FechaModificacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbSucursales]
        SET
            Sucu_Nombre = @Sucu_Nombre,
            Muni_Codigo = @Muni_Codigo,
            Sucu_UsuarioModificacion = @Sucu_UsuarioModificacion,
            Sucu_FechaModificacion = @Sucu_FechaModificacion
        WHERE
            Sucu_Id = @Sucu_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Sucursales_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Sucursales_buscar] 
    @Sucu_Id INT
AS
BEGIN
    SELECT 
        Sucu_Id,
        Sucu_Nombre,
       s.Muni_Codigo,
	   m.Muni_Municipio,
	   Depa_Codigo,
        Sucu_UsuarioCreacion,
        Sucu_UsuarioModificacion,
				   FORMAT([Sucu_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Sucu_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
    FROM 
        [Gral].[tbSucursales] s INNER JOIN Gral.tbMunicipios m on s.Muni_Codigo=m.Muni_Codigo  LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = s.Sucu_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = s.Sucu_UsuarioModificacion
 
    WHERE
        Sucu_Id = @Sucu_Id;
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Sucursales_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Sucursales_eliminar]
    @Sucu_Id VARCHAR(MAX)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Gral].[tbSucursales]
        SET Sucu_Estado = 0
        WHERE Sucu_Id = @Sucu_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [Gral].[sp_Sucursales_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[sp_Sucursales_insertar]
    @Sucu_Nombre NVARCHAR(60),
    @Muni_Codigo VARCHAR(4),
    @Sucu_UsuarioCreacion INT,
    @Sucu_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Gral].[tbSucursales] 
        (
            Sucu_Nombre, 
            Muni_Codigo, 
            Sucu_UsuarioCreacion, 
            Sucu_FechaCreacion
        )
        VALUES 
        (
            @Sucu_Nombre, 
            @Muni_Codigo, 
            @Sucu_UsuarioCreacion, 
            @Sucu_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Gral].[sp_Sucursales_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[sp_Sucursales_listar] 
AS
BEGIN
  SELECT 
    Sucu_Id, 
    Sucu_Nombre, 
    s.Muni_Codigo, 
	m.Muni_Municipio,
    Sucu_UsuarioCreacion, 
    Sucu_FechaCreacion, 
    Sucu_UsuarioModificacion, 
    Sucu_FechaModificacion
  FROM [Gral].[tbSucursales] s INNER JOIN Gral.tbMunicipios m on s.Muni_Codigo=m.Muni_Codigo
 
  WHERE Sucu_Estado = 1; 
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_Cajas_Cierre]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Cajas_Cierre]
@caja_UsuarioCierre INT,
@caja_FechaCierre DATETIME,
@caja_MontoInicial NUMERIC(8,2),
@caja_MontoFinal NUMERIC(8,2),
@caja_MontoSistema NUMERIC(8,2),
@caja_Observacion VARCHAR(MAX),
@caja_Id INT
AS
BEGIN
BEGIN TRY
    UPDATE Vent.tbCajas 
    SET 
        caja_UsuarioCierre = @caja_UsuarioCierre, 
        caja_MontoInicial = @caja_MontoInicial,
        caja_FechaCierre = @caja_FechaCierre, 
        caja_MontoFinal = @caja_MontoFinal, 
        caja_MontoSistema = @caja_MontoSistema, 
        caja_Observacion = @caja_Observacion,
		caja_Finalizado = 0
    WHERE caja_Id = @caja_Id;
    SELECT 1;
END TRY
BEGIN CATCH
    SELECT 0;
END CATCH
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_Cajas_Insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Cajas_Insertar]
    @caja_FechaApertura DATETIME,
    @Sucu_Id INT,
    @caja_MontoInicial DECIMAL(18, 2),
    @caja_UsuarioApertura INT
AS
BEGIN
    SET NOCOUNT ON;


    IF EXISTS (SELECT 1 FROM Vent.tbCajas WHERE CAST(caja_FechaCierre AS DATE) =  CAST(@caja_FechaApertura AS DATE) AND Sucu_Id = @Sucu_Id)
    BEGIN
    
        UPDATE Vent.tbCajas
        SET 
            caja_MontoInicial = @caja_MontoInicial,
            caja_UsuarioApertura = @caja_UsuarioApertura,
            caja_FechaApertura = @caja_FechaApertura,
			caja_FechaCierre = @caja_FechaApertura,
			caja_Finalizado = 1
        WHERE 
            CAST(caja_FechaApertura AS DATE) = CAST(@caja_FechaApertura AS DATE)
            AND Sucu_Id = @Sucu_Id
    END
    ELSE
    BEGIN
 
        INSERT INTO Vent.tbCajas (caja_MontoInicial, caja_UsuarioApertura, caja_FechaApertura,caja_FechaCierre, Sucu_Id,caja_Finalizado)
        VALUES (@caja_MontoInicial, @caja_UsuarioApertura, @caja_FechaApertura,@caja_FechaApertura, @Sucu_Id,1)
    END
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Cajas_Validar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Cajas_Validar] 
    @FechaHoy DATE,
    @Sucu_Id INT
AS
BEGIN
    SELECT TOP 1 *
    FROM Vent.tbCajas
    WHERE 
        CAST(caja_FechaApertura AS DATE) = @FechaHoy
        AND Sucu_Id = @Sucu_Id
END
GO
/****** Object:  StoredProcedure [Vent].[sp_CalcularProductosVendidos]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_CalcularProductosVendidos]
    @Mes INT,
    @Ano INT,
    @TipoProducto INT 
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        p.Producto,
        SUM(fd.FaxD_Cantidad) AS TotalVendido,
        CASE 
            WHEN fd.FaxD_Dif = 1 THEN 'Joya'
            WHEN fd.FaxD_Dif = 0 THEN 'Maquillaje'
        END AS Categoria
    FROM Vent.tbFacturaDetalles fd
    INNER JOIN Vent.tbFactura f ON fd.Fact_Id = f.Fact_Id
    LEFT JOIN Vent.tbJoyas j ON j.Joya_Id = fd.Prod_Id AND fd.FaxD_Dif = 1
    LEFT JOIN Vent.tbMaquillajes m ON m.Maqu_Id = fd.Prod_Id AND fd.FaxD_Dif = 0
    CROSS APPLY (
        VALUES (CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_Nombre ELSE m.Maqu_Nombre END)
    ) AS p(Producto)
    WHERE
        MONTH(f.Fact_FechaFinalizado) = @Mes AND
        YEAR(f.Fact_FechaFinalizado) = @Ano AND
        f.Fact_Finalizado = 0 AND
        (
            (@TipoProducto = 2) OR
            (@TipoProducto = 1 AND fd.FaxD_Dif = 1) OR
            (@TipoProducto = 0 AND fd.FaxD_Dif = 0)
        )
    GROUP BY
        p.Producto,
        CASE 
            WHEN fd.FaxD_Dif = 1 THEN 'Joya'
            WHEN fd.FaxD_Dif = 0 THEN 'Maquillaje'
        END
END
GO
/****** Object:  StoredProcedure [Vent].[sp_ConfirmarFactura]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ConfirmarFactura]
@Fact_Id INT,
@Fact_FechaFinalizado DATETIME,
@Fact_Pago NUMERIC(8,2),
@Fact_Cambio NUMERIC(8,2)
AS
BEGIN
	BEGIN TRY
UPDATE Vent.tbFactura SET Fact_Finalizado = 0, Fact_FechaFinalizado = @Fact_FechaFinalizado, Fact_Pago = @Fact_Pago, Fact_Cambio = @Fact_Cambio 
WHERE Fact_Id = @Fact_Id
SELECT 1 AS Resultado
END TRY
BEGIN CATCH
SELECT 0 AS Resultado
END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_CantidadProducto_anual]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Dash_CantidadProducto_anual]
AS
BEGIN
   

    SELECT 'Joyas' AS Producto, COUNT(*) AS Cantidad
    FROM Vent.tbFacturaDetalles D
    INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
    INNER JOIN Vent.tbJoyas J ON D.Prod_Id = J.Joya_Id
    WHERE  FaxD_Dif=0
    UNION ALL
    SELECT 'Maquillaje' AS Producto, COUNT(*) AS Cantidad
    FROM Vent.tbFacturaDetalles D
    INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
    INNER JOIN Vent.tbMaquillajes M ON D.Prod_Id = M.Maqu_Id
    WHERE FaxD_Dif=1 and [Fact_Finalizado] = 0;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_CantidadProducto_Mes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Dash_CantidadProducto_Mes] 
	 @MesActual INT, 
	 @AñoActual INT
AS
BEGIN


		
SELECT 'Joyas' AS Producto, SUM(FaxD_Cantidad) AS Cantidad
FROM Vent.tbFacturaDetalles D
INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
INNER JOIN Vent.tbJoyas J ON D.Prod_Id = J.Joya_Id
WHERE MONTH(F.Fact_FechaCreacion) = @MesActual
AND YEAR(F.Fact_FechaCreacion) = @AñoActual AND FaxD_Dif=1
UNION ALL
SELECT 'Maquillaje' AS Producto, SUM(FaxD_Cantidad) AS Cantidad
FROM Vent.tbFacturaDetalles D
INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
INNER JOIN Vent.tbMaquillajes M ON D.Prod_Id = M.Maqu_Id
WHERE MONTH(F.Fact_FechaCreacion) = @MesActual
AND YEAR(F.Fact_FechaCreacion) = @AñoActual AND FaxD_Dif=0 and [Fact_Finalizado] = 0;
END;

GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_CantidadProducto_Mes2]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [Vent].[sp_Dash_CantidadProducto_Mes2] 
	 @MesInicio INT, 
	 @AñoInicio INT,
	 @MesFinal INT, 
	 @AñoFinal INT
AS
BEGIN
	SELECT 'Joyas' AS Producto, SUM(FaxD_Cantidad) AS Cantidad
	FROM Vent.tbFacturaDetalles D
	INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
	INNER JOIN Vent.tbJoyas J ON D.Prod_Id = J.Joya_Id
	WHERE MONTH(F.Fact_FechaCreacion) = @MesInicio
	AND YEAR(F.Fact_FechaCreacion) = @AñoInicio 
	AND FaxD_Dif = 1
	AND (YEAR(F.Fact_FechaCreacion) * 100 + MONTH(F.Fact_FechaCreacion)) BETWEEN (@AñoInicio * 100 + @MesInicio) AND (@AñoFinal * 100 + @MesFinal)
	UNION ALL
	SELECT 'Maquillaje' AS Producto, SUM(FaxD_Cantidad) AS Cantidad
	FROM Vent.tbFacturaDetalles D
	INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
	INNER JOIN Vent.tbMaquillajes M ON D.Prod_Id = M.Maqu_Id
	WHERE MONTH(F.Fact_FechaCreacion) = @MesInicio
	AND YEAR(F.Fact_FechaCreacion) = @AñoInicio 
	AND FaxD_Dif = 0
	AND (YEAR(F.Fact_FechaCreacion) * 100 + MONTH(F.Fact_FechaCreacion)) BETWEEN (@AñoInicio * 100 + @MesInicio) AND (@AñoFinal * 100 + @MesFinal)
	and [Fact_Finalizado] = 0;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_CantidadProducto_RangoFechas]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Vent].[sp_Dash_CantidadProducto_RangoFechas]
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT 'Joyas' AS Producto, SUM(FaxD_Cantidad) AS Cantidad
    FROM Vent.tbFacturaDetalles D
    INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
    INNER JOIN Vent.tbJoyas J ON D.Prod_Id = J.Joya_Id
    WHERE F.Fact_FechaCreacion BETWEEN @FechaInicio AND @FechaFin
    AND FaxD_Dif = 1
    UNION ALL
    SELECT 'Maquillaje' AS Producto, SUM(FaxD_Cantidad) AS Cantidad
    FROM Vent.tbFacturaDetalles D
    INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
    INNER JOIN Vent.tbMaquillajes M ON D.Prod_Id = M.Maqu_Id
    WHERE F.Fact_FechaCreacion BETWEEN @FechaInicio AND @FechaFin
    AND FaxD_Dif = 0 and [Fact_FechaFinalizado] = 0;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_JoyasMes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Dash_JoyasMes]
    @MesActual INT,
    @AñoActual INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Obtener los datos agrupados y sumados
    WITH RankedProducts AS (
        SELECT 
            J.Joya_Nombre AS NombreProducto,
            SUM(D.FaxD_Cantidad) AS TotalVendido,
            SUM(D.FaxD_Cantidad * J.Joya_PrecioCompra) AS Total,
            ROW_NUMBER() OVER (ORDER BY SUM(D.FaxD_Cantidad) DESC) AS RowNum
        FROM Vent.tbFacturaDetalles D
        INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
        INNER JOIN Vent.tbJoyas J ON D.Prod_Id = J.Joya_Id
        WHERE MONTH(F.Fact_FechaCreacion) = @MesActual
            AND YEAR(F.Fact_FechaCreacion) = @AñoActual
            AND D.FaxD_Dif = 1 and [Fact_Finalizado] = 0
        GROUP BY J.Joya_Nombre
    )
    SELECT TOP 5
        NombreProducto,
        TotalVendido,
        Total
    FROM RankedProducts
    ORDER BY TotalVendido DESC, NombreProducto;
END;

GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_JoyasMes_Top5]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Dash_JoyasMes_Top5]
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
      WITH RankedProducts AS (
        SELECT 
            J.Joya_Nombre AS NombreProducto,
            SUM(D.FaxD_Cantidad) AS TotalVendido,
            SUM(D.FaxD_Cantidad * J.Joya_PrecioCompra) AS Total,
            ROW_NUMBER() OVER (ORDER BY SUM(D.FaxD_Cantidad) DESC) AS RowNum
        FROM Vent.tbFacturaDetalles D
        INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
        INNER JOIN Vent.tbJoyas J ON D.Prod_Id = J.Joya_Id
        WHERE  F.Fact_FechaCreacion >= @FechaInicio
        AND F.Fact_FechaCreacion <= @FechaFin
            AND D.FaxD_Dif = 1 and [Fact_FechaFinalizado] = 0
        GROUP BY J.Joya_Nombre
    )
    SELECT TOP 5
        NombreProducto,
        TotalVendido,
        Total
    FROM RankedProducts
    ORDER BY TotalVendido DESC, NombreProducto;
END;

GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_MaquillajeMes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Vent].[sp_Dash_MaquillajeMes]
    @MesActual INT,
    @AñoActual INT
AS
BEGIN
    SET NOCOUNT ON;

    WITH RankedProducts AS (
        SELECT 
            M.Maqu_Nombre AS NombreProducto,
            SUM(D.FaxD_Cantidad) AS TotalVendido,
            SUM(D.FaxD_Cantidad * M.Maqu_PrecioCompra) AS Total,
            ROW_NUMBER() OVER (ORDER BY SUM(D.FaxD_Cantidad) DESC) AS RowNum
        FROM Vent.tbFacturaDetalles D
        INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
        INNER JOIN Vent.tbMaquillajes M ON D.Prod_Id = M.Maqu_Id
        WHERE MONTH(F.Fact_FechaCreacion) = @MesActual
            AND YEAR(F.Fact_FechaCreacion) = @AñoActual
            AND D.FaxD_Dif = 0 and [Fact_Finalizado] = 0
        GROUP BY M.Maqu_Nombre
    )
    SELECT 
        NombreProducto,
        TotalVendido,
        Total
    FROM RankedProducts
    ORDER BY TotalVendido DESC, NombreProducto;
END;

GO
/****** Object:  StoredProcedure [Vent].[sp_Dash_MaquillajeMes_Top5]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Dash_MaquillajeMes_Top5]
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    WITH RankedProducts AS (
        SELECT 
            M.Maqu_Nombre AS NombreProducto,
            SUM(D.FaxD_Cantidad) AS TotalVendido,
            SUM(D.FaxD_Cantidad * M.Maqu_PrecioCompra) AS Total,
            ROW_NUMBER() OVER (ORDER BY SUM(D.FaxD_Cantidad) DESC) AS RowNum
        FROM Vent.tbFacturaDetalles D
        INNER JOIN Vent.tbFactura F ON D.Fact_Id = F.Fact_Id
        INNER JOIN Vent.tbMaquillajes M ON D.Prod_Id = M.Maqu_Id
        WHERE F.Fact_FechaCreacion  >= @FechaInicio
            AND F.Fact_FechaCreacion <= @FechaFin
            AND D.FaxD_Dif = 0 and [Fact_Finalizado] = 0
        GROUP BY M.Maqu_Nombre
    )
    SELECT TOP 5
        NombreProducto,
        TotalVendido,
        Total
    FROM RankedProducts
    ORDER BY TotalVendido DESC, NombreProducto;
END;

GO
/****** Object:  StoredProcedure [Vent].[sp_DashGeneroMes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE [Vent].[sp_DashGeneroMes]
AS
BEGIN
    DECLARE @MesActual INT, @AñoActual INT;
    SET @MesActual = MONTH(GETDATE());
    SET @AñoActual = YEAR(GETDATE());

    SELECT
        CASE WHEN C.Clie_Sexo = 'M' THEN 'Masculino' ELSE 'Femenino' END AS Genero,
        COUNT(*) AS TotalCompras
    FROM 
        Vent.tbFactura F
    INNER JOIN 
        Gral.tbClientes C ON F.Clie_Id = C.Clie_Id
    WHERE 
        MONTH(F.Fact_FechaCreacion) = @MesActual
        AND YEAR(F.Fact_FechaCreacion) = @AñoActual
    GROUP BY 
        C.Clie_Sexo;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_Factura_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Factura_buscar] 
@Fact_Id INT
AS
BEGIN
SELECT F.Fact_Id,c.Clie_Id,e.Empl_Id,m.Mepa_Id,CONCAT(c.Clie_Nombre, ' ' ,c.Clie_Apellido) AS Clie_Nombre, CONCAT(e.Empl_Nombre, ' ' , Empl_Apellido) AS Empl_Nombre,   FORMAT(Fact_FechaCreacion, 'yyyy-MM-dd') AS FechaCreacion, uCreacion.Usua_Usuario AS UsuarioCreacion,uModificador.Usua_Usuario AS UsuarioModificacion,c.Clie_DNI,
FORMAT(Fact_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,Depa_Departamento,Muni_Municipio,m.Mepa_Metodo, F.Fact_Cambio, F.Fact_Pago,sucu.Sucu_Nombre FROM Vent.tbFactura F
LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = F.Fact_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = F.Fact_UsuarioModificacion
LEFT JOIN Gral.tbClientes c ON c.Clie_Id = F.Clie_Id 
LEFT JOIN Gral.tbEmpleados e ON e.Empl_Id = F.Empl_Id
LEFT JOIN Gral.tbMetodosPago m ON m.Mepa_Id = F.Mepa_Id
LEFT JOIN Gral.tbMunicipios muni on muni.Muni_Codigo = c.Muni_Codigo
LEFT JOIN Gral.tbDepartamentos depa on depa.Depa_Codigo = muni.Depa_Codigo
LEFT JOIN Gral.tbSucursales sucu ON sucu.Sucu_Id = F.Sucu_Id
WHERE Fact_Id = @Fact_Id
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Factura_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Factura_listar]
AS
BEGIN
SELECT Fact_Id,C.Clie_Nombre,E.Empl_Nombre,M.Mepa_Metodo,F.Fact_Finalizado FROM Vent.tbFactura F
LEFT JOIN Gral.tbClientes C ON C.Clie_Id = F.Clie_Id
LEFT JOIN Gral.tbEmpleados E ON E.Empl_Id = F.Empl_Id
LEFT JOIN Gral.tbMetodosPago M ON M.Mepa_Id = F.Mepa_Id

END
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompra_Actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     procedure [Vent].[SP_FacturaCompra_Actualizar] 
@FaCE_Id int,
@Prov_Id int,
@Mepa_Id int,
@FeCE_UsuarioModificacion int,
@FaCE_FechaModificacion datetime
as
BEGIN
	BEGIN TRY

		UPDATE [Vent].[tbFacturaCompraEncabezado] 
		SET
		[Prov_Id] = @Prov_Id,
		[Mepa_Id] = @Mepa_Id,
		[FaCE_UsuarioModificacion] = @FeCE_UsuarioModificacion,
		[FaCE_FechaModificacion] = @FaCE_FechaModificacion
		where @FaCE_Id = FaCE_Id


		SELECT 1;
	END TRY
	BEGIN CATCH
		SELECT 0;
	END CATCH
END

GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompra_Buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [Vent].[SP_FacturaCompra_Buscar]
@id int
AS
BEGIN
	SELECT
		[FaCE_Id] as faCE_Id,
		fe.[Prov_Id],
		faCD_Dif = 0,
		P.Prov_Proveedor as nombreProveedor,
		fe.[Mepa_Id],
		Mepa_Metodo,
		FaCE_fechafinalizacion,
		s.Sucu_Id as sucu_Id,
		Sucu_Nombre as sucu_Nombre
	FROM [Vent].[tbFacturaCompraEncabezado] fe LEFT JOIN [Acce].[tbUsuarios] U1
	ON fe.FeCE_UsuarioCreacion = U1.Usua_Id LEFT JOIN [Acce].[tbUsuarios] U2
	ON fe.FaCE_UsuarioModificacion = U2.Usua_Id LEFT JOIN [Gral].[tbProveedores] P
	ON P.Prov_Id = fe.Prov_Id left join [Gral].[tbMetodosPago] M
	ON M.Mepa_Id = fe.Mepa_Id left join [Gral].[tbSucursales] s
	on s.Sucu_Id = fe.Sucu_Id
	where [FaCE_Id] = @id and FaCE_Etado = 1
END 
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompra_Detalle]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create     procedure [Vent].[SP_FacturaCompra_Detalle]
@id int
AS
BEGIN
	SELECT
		[FaCE_Id] as faCE_Id,
		fe.[Prov_Id],
		P.Prov_Proveedor as nombreProveedor,
		fe.[Mepa_Id],
		mepa_Metodo 
	FROM [Vent].[tbFacturaCompraEncabezado] fe LEFT JOIN [Acce].[tbUsuarios] U1
	ON fe.FeCE_UsuarioCreacion = U1.Usua_Id LEFT JOIN [Acce].[tbUsuarios] U2
	ON fe.FaCE_UsuarioModificacion = U2.Usua_Id LEFT JOIN [Gral].[tbProveedores] P
	ON P.Prov_Id = fe.Prov_Id left join [Gral].[tbMetodosPago] M
	ON M.Mepa_Id = fe.Mepa_Id
	where [FaCE_Id] = @id and FaCE_Etado = 1
END 
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompra_Eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [Vent].[SP_FacturaCompra_Eliminar]
@ID INT
AS
BEGIN
	UPDATE [Vent].[tbFacturaCompraEncabezado]
	SET
		[FaCE_Etado] = 0
	WHERE [FaCE_Id] = @ID
END 
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompra_Finalizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create       procedure [Vent].[SP_FacturaCompra_Finalizar] 
@FaCE_Id int,
@FaCE_FechaFinal datetime
as
BEGIN
	BEGIN TRY

		UPDATE [Vent].[tbFacturaCompraEncabezado] 
		SET
		[FaCE_Finalizada] = 1,
		[FaCE_fechafinalizacion] = @FaCE_FechaFinal
		where @FaCE_Id = FaCE_Id


		SELECT 1;
	END TRY
	BEGIN CATCH
		SELECT 0;
	END CATCH
END

GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompra_Insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[SP_FacturaCompra_Insertar] 
@Prov_Id INT,
@Mepa_Id INT,
@Sucu_Id int,
@FeCE_UsuarioCreacion INT,
@FaCE_FechaCreacion DATETIME,
@FeCE_UsuarioModificacion INT,
@FaCE_FechaModificacion DATETIME,
@FaCe_Id INT,
@ID INT OUTPUT

AS
BEGIN
    BEGIN TRY
        IF @FaCe_Id = 0
        BEGIN
            INSERT INTO [Vent].[tbFacturaCompraEncabezado] 
                ([Prov_Id], [Mepa_Id], [FeCE_UsuarioCreacion], [FaCE_FechaCreacion], [FaCE_Finalizada], Sucu_Id)
            VALUES 
                (@Prov_Id, @Mepa_Id, @FeCE_UsuarioCreacion, @FaCE_FechaCreacion, 0, @Sucu_Id);

            SET @ID = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            UPDATE [Vent].[tbFacturaCompraEncabezado]
            SET 
                [Prov_Id] = @Prov_Id,
                [Mepa_Id] = @Mepa_Id,
                [FeCE_UsuarioCreacion] = @FeCE_UsuarioModificacion,
                [FaCE_FechaCreacion] = @FaCE_FechaModificacion,
                [FaCE_Finalizada] = 0,
				Sucu_Id = @Sucu_Id
            WHERE 
                [FaCE_Id] = @FaCe_Id;

            SET @ID = @FaCe_Id;
        END

        SELECT @ID;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompra_Listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [Vent].[SP_FacturaCompra_Listar]
AS
BEGIN
	SELECT
		FaCE_Id,
		P.Prov_Proveedor as nombreProveedor,
		M.Mepa_Metodo as mepa_Metodo,
		[FaCE_fechafinalizacion] as faCE_fechafinalizacion,
		case [FaCE_Finalizada] when 0 then 'True' ELSE 'False' END AS faCE_Finalizada
	FROM [Vent].[tbFacturaCompraEncabezado] fe LEFT JOIN [Gral].[tbProveedores] P
	ON P.Prov_Id = fe.Prov_Id left join [Gral].[tbMetodosPago] M
	ON M.Mepa_Id = fe.Mepa_Id
	where FaCE_Etado = 1
END 
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompraDetalle_Buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [Vent].[SP_FacturaCompraDetalle_Buscar]
AS
BEGIN 
	select *
	from [Vent].[tbFacturaCompraDetalle]
END
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompraDetalle_Eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [Vent].[SP_FacturaCompraDetalle_Eliminar] 
@ID INT
AS
BEGIN
	begin try
		declare @Cantidad int, @dife bit, @producto varchar(max), @menor int,@menor1 int, @sucu int, @encabe int, @provee int, @nombre varchar(max)
		
		select 
			
			@dife = FaCD_Dif,
			@producto = [Prod_Id],
			@encabe = [FaCE_Id]
		from [Vent].[tbFacturaCompraDetalle]
		WHERE [FaCD_Id] = @ID

		select 
		@Cantidad = sum(FaCD_Cantidad)
		from [Vent].[tbFacturaCompraDetalle]
		where @encabe = [FaCE_Id] and @producto = [Prod_Id]

		select 
		@sucu = [Sucu_Id],
		@provee = [Prov_Id]
		from [Vent].[tbFacturaCompraEncabezado]
		where [FaCE_Id] = @encabe

		IF  @dife = 1
		BEGIN
			select
			@nombre = [Joya_Nombre]
			from[Vent].[tbJoyas]
			where [Joya_Id] = @producto and [Prov_Id] = @provee

			UPDATE [Vent].[tbJoyas]
			set [Joya_Stock] = [Joya_Stock] - @Cantidad
			where @nombre = [Joya_Nombre] and [Prov_Id] = @provee


			Update [Gral].[tbProductosPorSucurales]
			set
				[Prsx_Stock] = [Prsx_Stock] - @Cantidad
			where [Prxs_Dif] = @dife and  [Sucu_Id] = @sucu AND [Prod_Id] = @producto

			select 
			@menor = [Joya_Stock]
			from [Vent].[tbJoyas]
			where [Joya_Id] = @producto

			select 
			@menor1 = [Prsx_Stock]
			from [Gral].[tbProductosPorSucurales]
			where [Prxs_Dif] = @dife and  [Sucu_Id] = @sucu AND [Prod_Id] = @producto


			if @menor < 0
			begin
				UPDATE [Vent].[tbJoyas]
				set [Joya_Stock] = 0
				where [Joya_Id] = @producto

			end 
			
			if @menor1 < 0
			begin
				UPDATE [Gral].[tbProductosPorSucurales]
				set [Prsx_Stock] = 0
				where [Prxs_Dif] = @dife and  [Sucu_Id] = @sucu AND [Prod_Id] = @producto

			end 

			DELETE FROM  [Vent].[tbFacturaCompraDetalle]
			WHERE [FaCE_Id] = @encabe and [Prod_Id] = @producto
		END
		else
		begin
			UPDATE [Vent].[tbMaquillajes]
			set [Maqu_Stock] = [Maqu_Stock] - @Cantidad
			where [Maqu_Id] = @producto
			
			
			Update [Gral].[tbProductosPorSucurales]
			set
				[Prsx_Stock] = [Prsx_Stock] - @Cantidad
			where [Prxs_Dif] = @dife and  [Sucu_Id] = @sucu AND [Prod_Id] = @producto

			select 
			@menor = [Maqu_Stock]
			from [Vent].[tbMaquillajes]
			where [Maqu_Id] = @producto

			select 
			@menor1 = [Prsx_Stock]
			from [Gral].[tbProductosPorSucurales]
			where [Prxs_Dif] = @dife and  [Sucu_Id] = @sucu AND [Prod_Id] = @producto


			if @menor < 0
			begin
				UPDATE [Vent].[tbMaquillajes]
				set [Maqu_Stock] = 0
				where [Maqu_Id] = @producto
			end

			if @menor1 < 0
			begin
				UPDATE [Gral].[tbProductosPorSucurales]
				set [Prsx_Stock] = 0
				where [Prxs_Dif] = @dife and  [Sucu_Id] = @sucu AND [Prod_Id] = @producto
			end 

			DELETE FROM  [Vent].[tbFacturaCompraDetalle]
			WHERE [FaCE_Id] = @encabe and [Prod_Id] = @producto
		end
	select 1;
	end try
	begin catch
		select 0;
	end catch
END
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompraDetalle_Insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [Vent].[SP_FacturaCompraDetalle_Insertar]
@FaCE_Id INT,
@FaCD_Dif BIT,
@NombreProducto VARCHAR(70),
@FaCD_Cantidad INT,
@PrecioCompra Numeric (8,2),
@PrecioVenta Numeric (8,2),
@PrecioMayor Numeric(8,2)
AS
BEGIN
	BEGIN TRY
		DECLARE @proid int, @idsalida INT, @prove INT, @stockActual INT, @usuariocreacion int, @fechacreacion datetime, @sucursal int;

		SELECT 
			@prove = [Prov_Id],
			@usuariocreacion = [FeCE_UsuarioCreacion],
			@fechacreacion = [FaCE_FechaCreacion],
			@sucursal = Sucu_Id
		FROM [Vent].[tbFacturaCompraEncabezado] 
		WHERE [FaCE_Id] = @FaCE_Id;

		

		
		--joyas
		IF @FaCD_Dif = 1
		BEGIN
			--ACTUALIZAR
			IF EXISTS (SELECT 1 FROM [Vent].[tbJoyas] WHERE [Prov_Id] = @prove AND [Joya_Nombre] = @NombreProducto)
			BEGIN
				SELECT @proid = [Joya_Id] FROM  [Vent].[tbJoyas]
				WHERE [Prov_Id] = @prove AND [Joya_Nombre] = @NombreProducto

				UPDATE [Vent].[tbJoyas]
				SET [Joya_Stock] = [Joya_Stock] + @FaCD_Cantidad,
				Joya_PrecioCompra = @PrecioCompra
				WHERE [Prov_Id] = @prove AND [Joya_Id] = @proid;

				Update [Vent].[tbJoyas]
				set [Joya_PrecioVenta] = @PrecioVenta,
				[Joya_PrecioMayor] = @PrecioMayor
				where [Joya_Nombre] = @NombreProducto

					IF EXISTS (SELECT 1 FROM [Gral].[tbProductosPorSucurales] where [Sucu_Id] = @sucursal and [Prod_Id] = @proid and [Prxs_Dif] = @FaCD_Dif)
					BEGIN
						Update [Gral].[tbProductosPorSucurales]
						set	[Prxs_Dif] = @FaCD_Dif,
						[Prod_Id] = @proid,
						[Prsx_Stock] = [Prsx_Stock] + @FaCD_Cantidad,
						[Sucu_Id] = @sucursal
						where [Sucu_Id] = @sucursal and [Prod_Id] = @proid and [Prxs_Dif] = @FaCD_Dif
					END
					ELSE
					BEGIN
						insert into [Gral].[tbProductosPorSucurales] ([Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id])
						VALUES (@FaCD_Dif, @proid,@FaCD_Cantidad, @sucursal);
					END

				

				--insert detalle
				INSERT INTO [Vent].[tbFacturaCompraDetalle] ([FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad])
				VALUES (@FaCE_Id, @FaCD_Dif, @proid, @FaCD_Cantidad);
			END
			
			--INSERTAR
			else
			BEGIN
				if EXISTS (SELECT 1 FROM [Vent].[tbJoyas] WHERE  [Joya_Nombre] = @NombreProducto)
				begin
				DECLARE @nombre VARCHAR(60),  @precio_Venta NUMERIC(18,2), @precio_Mayor NUMERIC(18,2), @imagen VARCHAR(MAX), @mateId INT, @cateId INT;

				SELECT @proid = [Joya_Id] FROM  [Vent].[tbJoyas]
				WHERE [Joya_Nombre] = @NombreProducto

					Update [Vent].[tbJoyas]
				set [Joya_PrecioVenta] = @PrecioVenta,
				[Joya_PrecioMayor] = @PrecioMayor
				where [Joya_Nombre] = @NombreProducto


				SELECT TOP(1)
					   @nombre = [Joya_Nombre],
					   @precioVenta = [Joya_PrecioVenta],
					   @precioMayor = [Joya_PrecioMayor],
					   @imagen = [Joya_Imagen],
					   @mateId = [Mate_Id],
					   @cateId = [Cate_Id]
				FROM [Vent].[tbJoyas]
				WHERE [Joya_Nombre] = @NombreProducto


					INSERT INTO [Vent].[tbJoyas] ([Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_Estado], [Joya_Stock])
					VALUES (@nombre, @precioCompra, @precioVenta, @precioMayor, @imagen, @prove, @mateId, @cateId, @usuariocreacion, @fechacreacion, 1, @FaCD_Cantidad);
					SET @idsalida = SCOPE_IDENTITY();
			
					insert into [Gral].[tbProductosPorSucurales] ([Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id])
					VALUES (@FaCD_Dif, @idsalida,@FaCD_Cantidad, @sucursal);

					--insert detalle
					INSERT INTO [Vent].[tbFacturaCompraDetalle] ([FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad])
					VALUES (@FaCE_Id, @FaCD_Dif, @idsalida, @FaCD_Cantidad);
				END
				ELSE 
				--CREAR JOYA
				BEGIN
					INSERT INTO [Vent].[tbJoyas] ([Joya_Nombre], [Joya_PrecioCompra], [Joya_PrecioVenta], [Joya_PrecioMayor], [Joya_Imagen], [Prov_Id], [Mate_Id], [Cate_Id], [Joya_UsuarioCreacion], [Joya_FechaCreacion], [Joya_Estado], [Joya_Stock])
					VALUES (@NombreProducto, @PrecioCompra, @PrecioVenta, @PrecioMayor, 'NA', @prove, 6, 8, @usuariocreacion, @fechacreacion, 1, @FaCD_Cantidad);
					SET @idsalida = SCOPE_IDENTITY();

					
					insert into [Gral].[tbProductosPorSucurales] ([Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id])
					VALUES (@FaCD_Dif, @idsalida,@FaCD_Cantidad, @sucursal);

					--INSERT DETALLE
					INSERT INTO [Vent].[tbFacturaCompraDetalle] ([FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad])
					VALUES (@FaCE_Id, @FaCD_Dif, @idsalida, @FaCD_Cantidad);
				END
			END
		END


		--maquillaje
		ELSE
		BEGIN
			IF EXISTS (SELECT 1 FROM [Vent].[tbMaquillajes] WHERE [Prov_Id] = @prove AND [Maqu_Nombre] = @NombreProducto)
			BEGIN
				SELECT @proid = [Maqu_Id] FROM [Vent].[tbMaquillajes] 
				WHERE [Prov_Id] = @prove AND [Maqu_Nombre] = @NombreProducto
				
				UPDATE [Vent].[tbMaquillajes]
				SET [Maqu_Stock] = [Maqu_Stock] + @FaCD_Cantidad,
				Maqu_PrecioCompra = @PrecioCompra
				WHERE [Prov_Id] = @prove AND [Maqu_Id] = @proid;


				Update [Vent].[tbMaquillajes]
				set [Maqu_PrecioVenta] = @PrecioVenta,
				[Maqu_PrecioMayor] = @PrecioMayor
				where [Maqu_Nombre] = @NombreProducto

				IF EXISTS (SELECT 1 FROM [Gral].[tbProductosPorSucurales] where [Sucu_Id] = @sucursal and [Prod_Id] = @proid and [Prxs_Dif] = @FaCD_Dif)
				BEGIN
					Update [Gral].[tbProductosPorSucurales]
					set	[Prxs_Dif] = @FaCD_Dif,
						[Prod_Id] = @proid,
						[Prsx_Stock] = [Prsx_Stock] + @FaCD_Cantidad,
						[Sucu_Id] = @sucursal
					where [Sucu_Id] = @sucursal and [Prod_Id] = @proid and [Prxs_Dif] = @FaCD_Dif
				END
				ELSE
				BEGIN
					

					insert into [Gral].[tbProductosPorSucurales] ([Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id])
					VALUES (@FaCD_Dif, @proid,@FaCD_Cantidad, @sucursal);
				END
				

				--insert detalle
				INSERT INTO [Vent].[tbFacturaCompraDetalle] ([FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad])
				VALUES (@FaCE_Id, @FaCD_Dif, @proid, @FaCD_Cantidad);
			END
			ELSE 
			BEGIN
				IF EXISTS (SELECT 1 FROM [Vent].[tbMaquillajes] WHERE [Maqu_Nombre] = @NombreProducto)
				BEGIN
					DECLARE  @nombreM VARCHAR(60),  @precioVentaM NUMERIC(18,2), @precioMayorM NUMERIC(18,2), @imagenM VARCHAR(MAX), @marcIdM INT;

					SELECT @proid = [Maqu_Id] FROM [Vent].[tbMaquillajes] 
					WHERE  [Maqu_Nombre] = @NombreProducto

					SELECT @nombreM = [Maqu_Nombre],
						   @precioVentaM = [Maqu_PrecioVenta],
						   @precioMayorM = [Maqu_PrecioMayor],
						   @imagenM = [Maqu_Imagen],
						   @marcIdM = [Marc_Id]
					FROM [Vent].[tbMaquillajes]
					WHERE [Maqu_Id] = @proid;

					INSERT INTO [Vent].[tbMaquillajes] ([Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_Estado], [Maqu_Stock])
					VALUES (@nombreM, @precioCompra, @precioVentaM, @precioMayorM, @imagenM, @prove, @marcIdM,  @usuariocreacion, @fechacreacion, 1, @FaCD_Cantidad);
					SET @idsalida = SCOPE_IDENTITY();

					
				
					insert into [Gral].[tbProductosPorSucurales] ([Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id])
					VALUES (@FaCD_Dif, @idsalida,@FaCD_Cantidad, @sucursal);


					--insert detalle
					INSERT INTO [Vent].[tbFacturaCompraDetalle] ([FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad])
					VALUES (@FaCE_Id, @FaCD_Dif, @idsalida, @FaCD_Cantidad);
				END
				ELSE
				BEGIN
				
					INSERT INTO [Vent].[tbMaquillajes] ([Maqu_Nombre], [Maqu_PrecioCompra], [Maqu_PrecioVenta], [Maqu_PrecioMayor], [Maqu_Imagen], [Prov_Id], [Marc_Id], [Maqu_UsuarioCreacion], [Maqu_FechaCreacion], [Maqu_Estado], [Maqu_Stock])
					VALUES (@NombreProducto, @PrecioCompra, @PrecioVenta, @PrecioMayor, 'NA', @prove, 8, @usuariocreacion, @fechacreacion, 1, @FaCD_Cantidad);
					SET @idsalida = SCOPE_IDENTITY();	

					
					insert into [Gral].[tbProductosPorSucurales] ([Prxs_Dif], [Prod_Id], [Prsx_Stock], [Sucu_Id])
					VALUES (@FaCD_Dif, @idsalida,@FaCD_Cantidad, @sucursal);

					--insert detalle
					INSERT INTO [Vent].[tbFacturaCompraDetalle] ([FaCE_Id], [FaCD_Dif], [Prod_Id], [FaCD_Cantidad])
					VALUES (@FaCE_Id, @FaCD_Dif, @idsalida, @FaCD_Cantidad);
				END
			END

		END		
		
		SELECT 1;
	END TRY
	BEGIN CATCH
		SELECT 0 Error;
	END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompraDetalle_Listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [Vent].[SP_FacturaCompraDetalle_Listar] 
@FaCE_Id int
AS
BEGIN 

	 WITH Consolidated AS (
        SELECT
            fd.FaCD_Dif,
            MAX(fd.FaCD_Id) AS FaCD_Id, 
            MAX(j.Joya_Id) AS Prod_Id, 
            j.Joya_Nombre AS Prod_Nombre,
            SUM(fd.FaCD_Cantidad) AS Total_Cantidad,
            'Joyas' AS Categoria,
            
			MAX(j.Joya_PrecioCompra) AS Prod_Precio,
			MAX(j.Joya_PrecioVenta) as PrecioVenta,
			MAX(j.Joya_PrecioMayor) as PrecioMayorista
        FROM
            [Vent].[tbFacturaCompraDetalle] fd
        JOIN
            [Vent].[tbJoyas] j ON fd.Prod_Id = j.Joya_Id
        WHERE
            fd.FaCD_Dif = 1
            AND fd.FaCE_Id = @FaCE_Id
        GROUP BY
            fd.FaCD_Dif, j.Joya_Nombre

        UNION ALL

        SELECT
            fd.FaCD_Dif,
            MAX(fd.FaCD_Id) AS FaxD_Id,
            MAX(m.Maqu_Id) AS Prod_Id, 
            m.Maqu_Nombre AS Prod_Nombre,
            SUM(fd.FaCD_Cantidad) AS Total_Cantidad,
            'Maquillajes' AS Categoria,
            MAX(m.Maqu_PrecioCompra) Prod_Precio,
			MAX(m.Maqu_PrecioVenta) as PrecioVenta,
			MAX(m.Maqu_PrecioMayor) as PrecioMayorista
        FROM
            [Vent].[tbFacturaCompraDetalle] fd
        JOIN
            [Vent].[tbMaquillajes] m ON fd.Prod_Id = m.Maqu_Id
        WHERE
            fd.FaCD_Dif = 0
            AND fd.FaCE_Id = @FaCE_Id
        GROUP BY
            fd.FaCD_Dif, m.Maqu_Nombre
    )
    SELECT
        FaCD_Id as faCD_Id,
        Prod_Id,
        Prod_Nombre AS Producto,
        Total_Cantidad AS Cantidad,
        Prod_Precio AS Precio_Venta,
		PrecioVenta,
		PrecioMayorista,
        (Total_Cantidad * Prod_Precio) AS Total,
        Categoria
    FROM
        Consolidated;

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaCompraEncabezado]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[SP_FacturaCompraEncabezado]
AS
BEGIN
SELECT * FROM Vent.tbFacturaCompraEncabezado
END
GO
/****** Object:  StoredProcedure [Vent].[sp_FacturaDetalles_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FacturaDetalles_eliminar]
    @Fact_Id INT,
    @Sucu_Id INT,
    @Prod_Nombre NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DECLARE @Prod_Id INT, @FaxD_Cantidad INT, @FaxD_Dif INT

        DECLARE cursor_factura CURSOR FOR
        SELECT fd.Prod_Id, fd.FaxD_Cantidad, fd.FaxD_Dif
        FROM Vent.tbFacturaDetalles fd
        WHERE fd.Fact_Id = @Fact_Id AND (
            fd.Prod_Id IN (SELECT Joya_Id FROM Vent.tbJoyas WHERE Joya_Nombre = @Prod_Nombre) OR
            fd.Prod_Id IN (SELECT Maqu_Id FROM Vent.tbMaquillajes WHERE Maqu_Nombre = @Prod_Nombre)
        )

        OPEN cursor_factura
        FETCH NEXT FROM cursor_factura INTO @Prod_Id, @FaxD_Cantidad, @FaxD_Dif

        WHILE @@FETCH_STATUS = 0
        BEGIN
            IF @FaxD_Dif = 1 
            BEGIN
             
                UPDATE j
                SET j.Joya_Stock = j.Joya_Stock + @FaxD_Cantidad
                FROM Vent.tbJoyas j
                WHERE j.Joya_Id = @Prod_Id;

 
                UPDATE ps
                SET ps.Prsx_Stock = ps.Prsx_Stock + @FaxD_Cantidad
                FROM Gral.tbProductosPorSucurales ps
                WHERE ps.Prod_Id = @Prod_Id AND ps.Sucu_Id = @Sucu_Id AND ps.Prxs_Dif = @FaxD_Dif;
            END
            ELSE 
            BEGIN
              
                UPDATE m
                SET m.Maqu_Stock = m.Maqu_Stock + @FaxD_Cantidad
                FROM Vent.tbMaquillajes m
                WHERE m.Maqu_Id = @Prod_Id;

        
                UPDATE ps
                SET ps.Prsx_Stock = ps.Prsx_Stock + @FaxD_Cantidad
                FROM Gral.tbProductosPorSucurales ps
                WHERE ps.Prod_Id = @Prod_Id AND ps.Sucu_Id = @Sucu_Id AND ps.Prxs_Dif = @FaxD_Dif;
            END

            FETCH NEXT FROM cursor_factura INTO @Prod_Id, @FaxD_Cantidad, @FaxD_Dif
        END

        CLOSE cursor_factura
        DEALLOCATE cursor_factura

        DELETE FROM Vent.tbFacturaDetalles
        WHERE Fact_Id = @Fact_Id AND (
            Prod_Id IN (SELECT Joya_Id FROM Vent.tbJoyas WHERE Joya_Nombre = @Prod_Nombre) OR
            Prod_Id IN (SELECT Maqu_Id FROM Vent.tbMaquillajes WHERE Maqu_Nombre = @Prod_Nombre)
        );

        SELECT 1 AS Resultado; 

    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_FacturaDetalles_Insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FacturaDetalles_Insertar]
    @Faxd_Dif INT,
    @Prod_Nombre VARCHAR(MAX),
    @Faxd_Cantidad INT,
    @Fact_Id INT,
    @Sucu_Id INT,
    @StockFinal INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CantidadRestante INT = @Faxd_Cantidad;
    DECLARE @TotalStock INT;
    DECLARE @Prod_Id INT;


    SELECT @TotalStock = SUM([Prsx_Stock])
    FROM [Gral].[tbProductosPorSucurales]
    WHERE [Sucu_Id] = @Sucu_Id
    AND [Prxs_Dif] = @Faxd_Dif
    AND [Prod_Id] IN (
        SELECT CASE 
            WHEN @Faxd_Dif = 1 THEN [Joya_Id]
            WHEN @Faxd_Dif = 0 THEN [Maqu_Id]
        END
        FROM [Vent].[tbJoyas] J
        FULL JOIN [Vent].[tbMaquillajes] M ON J.[Joya_Nombre] = M.[Maqu_Nombre]
        WHERE [Joya_Nombre] = @Prod_Nombre OR [Maqu_Nombre] = @Prod_Nombre
    );


    IF @TotalStock IS NULL OR @TotalStock < @Faxd_Cantidad
    BEGIN
    
        SET @StockFinal = @TotalStock;
        SELECT 0 AS Resultado;
        RETURN;
    END
		ELSE
			BEGIN
			 DECLARE @stockActual INT, @nombreActual VARCHAR(MAX);
    DECLARE @cantidadAtransferir INT;


    DECLARE stock_cursor CURSOR FOR
    SELECT P.[Prod_Id], P.[Prsx_Stock], 
        CASE 
            WHEN @Faxd_Dif = 1 THEN J.[Joya_Nombre]
            WHEN @Faxd_Dif = 0 THEN M.[Maqu_Nombre]
        END AS Prod_Nombre
    FROM [Gral].[tbProductosPorSucurales] P
    LEFT JOIN [Vent].[tbJoyas] J ON J.[Joya_Id] = P.[Prod_Id]
    LEFT JOIN [Vent].[tbMaquillajes] M ON M.[Maqu_Id] = P.[Prod_Id]
    WHERE P.[Sucu_Id] = @Sucu_Id AND P.[Prxs_Dif] = @Faxd_Dif
    ORDER BY P.[Prsx_Stock] DESC;

    OPEN stock_cursor;
    FETCH NEXT FROM stock_cursor INTO @Prod_Id, @stockActual, @nombreActual;

    WHILE @@FETCH_STATUS = 0 AND @CantidadRestante > 0
    BEGIN
  
        IF @nombreActual = @Prod_Nombre
        BEGIN
            SET @cantidadAtransferir = CASE 
                WHEN @stockActual > @CantidadRestante THEN @CantidadRestante
                ELSE @stockActual
            END
		


            UPDATE [Gral].[tbProductosPorSucurales]
            SET [Prsx_Stock] = [Prsx_Stock] - @cantidadAtransferir
            WHERE [Prod_Id] = @Prod_Id AND [Sucu_Id] = @Sucu_Id AND [Prxs_Dif] = @Faxd_Dif;

   
            INSERT INTO [Vent].[tbFacturaDetalles] (FaxD_Dif, Prod_Id, FaxD_Cantidad, Fact_Id)
            VALUES (@Faxd_Dif, @Prod_Id, @cantidadAtransferir, @Fact_Id);

            SET @CantidadRestante = @CantidadRestante - @cantidadAtransferir;
        END

        FETCH NEXT FROM stock_cursor INTO @Prod_Id, @stockActual, @nombreActual;
    END

    CLOSE stock_cursor;
    DEALLOCATE stock_cursor;
	  SET @StockFinal = 0;
    SELECT 1 AS Resultado;
	END

   
    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [Vent].[SP_FacturaDetalles_ProductosVentas]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[SP_FacturaDetalles_ProductosVentas] 
    @FactId INT
AS
BEGIN
    WITH Consolidated AS (
        SELECT
            fd.FaxD_Dif,
            MAX(fd.FaxD_Id) AS FaxD_Id, 
            MAX(j.Joya_Id) AS Prod_Id, 
            j.Joya_Nombre AS Prod_Nombre,
			j.Joya_Imagen AS Imagen,
            SUM(fd.FaxD_Cantidad) AS Total_Cantidad,
            'Joyas' AS Categoria,
            CASE
                WHEN SUM(fd.FaxD_Cantidad) >= 6 THEN MAX(j.Joya_PrecioMayor)
                ELSE MAX(j.Joya_PrecioVenta)
            END AS Prod_Precio
        FROM
            [Vent].[tbFacturaDetalles] fd
        JOIN
            [Vent].[tbJoyas] j ON fd.Prod_Id = j.Joya_Id
        WHERE
            fd.FaxD_Dif = 1
            AND fd.Fact_Id = @FactId
        GROUP BY
            fd.FaxD_Dif, j.Joya_Nombre,j.Joya_Imagen

        UNION ALL

        SELECT
            fd.FaxD_Dif,
            MAX(fd.FaxD_Id) AS FaxD_Id,
            MAX(m.Maqu_Id) AS Prod_Id, 
            m.Maqu_Nombre AS Prod_Nombre,
			m.Maqu_Imagen AS Imagen,
            SUM(fd.FaxD_Cantidad) AS Total_Cantidad,
            'Maquillajes' AS Categoria,
            CASE
                WHEN SUM(fd.FaxD_Cantidad) >= 6 THEN MAX(m.Maqu_PrecioMayor)
                ELSE MAX(m.Maqu_PrecioVenta)
            END AS Prod_Precio
        FROM
            [Vent].[tbFacturaDetalles] fd
        JOIN
            [Vent].[tbMaquillajes] m ON fd.Prod_Id = m.Maqu_Id
        WHERE
            fd.FaxD_Dif = 0
            AND fd.Fact_Id = @FactId
        GROUP BY
            fd.FaxD_Dif, m.Maqu_Nombre,m.Maqu_Imagen
    )
    SELECT
        ROW_NUMBER() OVER (ORDER BY FaxD_Id) AS CodigoRow,
        FaxD_Id,
        Prod_Id,
        Prod_Nombre AS Producto,
		Imagen AS Imagen,
        Total_Cantidad AS Cantidad,
        Prod_Precio AS Precio_Unitario,
        (Total_Cantidad * Prod_Precio) AS Total,
        Categoria
    FROM
        Consolidated;

    SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Facturas_Actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Facturas_Actualizar]
@Clie_Id INT,
@Empl_Id INT,
@Mepa_Id INT,
@Fact_UsuarioModificacion INT,
@Fact_FechaModificacion DATETIME,
@Fact_Id INT
AS
BEGIN
	   BEGIN TRY
        BEGIN TRANSACTION;
UPDATE Vent.tbFactura SET Clie_Id = @Clie_Id, Empl_Id = @Empl_Id,Mepa_Id = @Mepa_Id,Fact_UsuarioModificacion = @Fact_UsuarioModificacion,Fact_FechaModificacion = @Fact_FechaModificacion
WHERE Fact_Id = @Fact_Id
	SELECT 1 AS Resultado
  COMMIT;
    END TRY
    BEGIN CATCH
	  SELECT 0 AS Resultado
        ROLLBACK;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Facturas_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Facturas_eliminar]
@Fact_Id INT
AS
BEGIN
	   BEGIN TRY
        BEGIN TRANSACTION;
UPDATE Vent.tbFactura SET Fact_Estado = 0
WHERE Fact_Id = @Fact_Id
	SELECT 1 AS Resultado
  COMMIT;
    END TRY
    BEGIN CATCH
	  SELECT 0 AS Resultado
        ROLLBACK;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Facturas_Insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Facturas_Insertar]
@Clie_Id INT,
@Empl_Id INT,
@Mepa_Id INT,

@Sucu_Id INT,
@Fact_UsuarioCreacion INT,
@Fact_FechaCreacion DATETIME,
@Fact_UsuarioModificacion INT,
@Fact_FechaModifcacion DATETIME,
@Fact_Id INT,
@ID INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Verifica si Fact_Id es 0 para decidir entre insertar o actualizar
        IF @Fact_Id = 0
        BEGIN
            -- Inserción de un nuevo registro
            INSERT INTO Vent.tbFactura (Clie_Id, Empl_Id, Mepa_Id,Sucu_Id, Fact_UsuarioCreacion, Fact_FechaCreacion)
            VALUES (@Clie_Id, @Empl_Id, @Mepa_Id,@Sucu_Id, @Fact_UsuarioCreacion, @Fact_FechaCreacion);

            -- Establece @Fact_Id al último ID generado
            SET @ID = SCOPE_IDENTITY();
        END
        ELSE
        BEGIN
            -- Actualización de un registro existente
            UPDATE Vent.tbFactura
            SET Clie_Id = @Clie_Id,
                Empl_Id = @Empl_Id,
                Mepa_Id = @Mepa_Id,
				Sucu_Id= @Sucu_Id,
                Fact_UsuarioModificacion = @Fact_UsuarioModificacion,
                Fact_FechaModificacion = @Fact_FechaModifcacion
            WHERE Fact_Id = @Fact_Id;
			 SET @ID = @Fact_Id;
        END

        -- Devuelve 1 en caso de éxito
        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        -- En caso de error, devuelve 0 y hace rollback de la transacción
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_FiltroJoyaCodigo]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FiltroJoyaCodigo] 
AS
BEGIN
SELECT Joya_Id AS ID,Joya_Nombre AS Nombre, Joya_PrecioVenta AS Venta, Joya_PrecioMayor AS Mayor FROM Vent.tbJoyas 
WHERE Joya_Estado = 1
END
GO
/****** Object:  StoredProcedure [Vent].[sp_FiltroJoyaCodigoSucursal]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FiltroJoyaCodigoSucursal]
@Sucu_Id INT
AS
BEGIN
SELECT Joya_Id AS ID,Joya_Nombre AS Nombre, Joya_PrecioVenta AS Venta, Joya_PrecioMayor AS Mayor, P.Sucu_Id, P.Prsx_Stock FROM Vent.tbJoyas J
LEFT JOIN Gral.tbProductosPorSucurales P ON P.Prod_Id = J.Joya_Id
WHERE Joya_Estado = 1 AND P.Prxs_Dif = 1 AND P.Sucu_Id = @Sucu_Id
END
GO
/****** Object:  StoredProcedure [Vent].[sp_FiltroJoyas]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FiltroJoyas]
@Joya VARCHAR(MAX)
AS
BEGIN
SELECT * FROM Vent.tbJoyas
WHERE Joya_Nombre LIKE @Joya + '%'
END
GO
/****** Object:  StoredProcedure [Vent].[sp_FiltroMaquillaje]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FiltroMaquillaje]
@Maquillaje VARCHAR(MAX)
AS
BEGIN
SELECT * FROM Vent.tbMaquillajes
WHERE Maqu_Nombre LIKE @Maquillaje + '%'
END
GO
/****** Object:  StoredProcedure [Vent].[sp_FiltroMaquillajeCodigo]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FiltroMaquillajeCodigo] 
AS
BEGIN
SELECT Maqu_Id AS ID, Maqu_Nombre AS Nombre, Maqu_PrecioVenta AS Venta,Maqu_PrecioMayor AS Mayor FROM Vent.tbMaquillajes
WHERE Maqu_Estado = 1
END
GO
/****** Object:  StoredProcedure [Vent].[sp_FiltroMaquillajeCodigoSucursal]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_FiltroMaquillajeCodigoSucursal] 
@Sucu_Id INT
AS
BEGIN
SELECT Maqu_Id AS ID, Maqu_Nombre AS Nombre, Maqu_PrecioVenta AS Venta,Maqu_PrecioMayor AS Mayor, P.Sucu_Id, P.Prsx_Stock FROM Vent.tbMaquillajes M
LEFT JOIN Gral.tbProductosPorSucurales P ON P.Prod_Id = M.Maqu_Id
WHERE Maqu_Estado = 1 AND P.Prxs_Dif = 0 AND P.Sucu_Id = @Sucu_Id
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Joyas_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Joyas_actualizar]
@Joya_Nombre VARCHAR(60),
@Joya_PrecioCompra NUMERIC(10,2),
@Joya_PrecioVenta NUMERIC(10,2),
@Joya_PrecioMayor NUMERIC(10,2),
@Joya_Imagen VARCHAR(MAX),
@Joya_Stock INT,
@Prov_Id INT,
@Mate_Id INT,
@Cate_Id INT,
@Joya_UsuarioModificacion INT,
@Joya_FechaModificacion DATETIME,
@Joya_Id INT
AS
BEGIN
BEGIN TRY
UPDATE Vent.tbJoyas SET Joya_Nombre = @Joya_Nombre,Joya_PrecioCompra = @Joya_PrecioCompra,Joya_PrecioVenta = @Joya_PrecioVenta,Joya_PrecioMayor = @Joya_PrecioMayor,Joya_Imagen = @Joya_Imagen,Prov_Id = @Prov_Id,Mate_Id = @Mate_Id,Cate_Id = @Cate_Id,Joya_UsuarioModificacion = @Joya_UsuarioModificacion,Joya_FechaModificacion = @Joya_FechaModificacion,Joya_Stock = @Joya_Stock 
WHERE Joya_Id = @Joya_Id
SELECT 1
END TRY
BEGIN CATCH 
SELECT 0
END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Joyas_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Joyas_buscar]
@Joya_Id INT
AS
BEGIN
SELECT Joya_Id,Joya_Nombre,Joya_PrecioCompra,Joya_Stock,Joya_PrecioMayor,Joya_PrecioVenta,Joya_Imagen,P.Prov_Id,P.Prov_Proveedor,M.Mate_Id,M.Mate_Material,C.Cate_Id,C.Cate_Categoria,
	   FORMAT([Joya_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Joya_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion 
FROM Vent.tbJoyas J
LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = J.Joya_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = J.Joya_UsuarioModificacion
LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = J.Prov_Id LEFT JOIN Gral.tbMateriales M ON M.Mate_Id = J.Mate_Id
LEFT JOIN Gral.tbCategorias C ON C.Cate_Id = J.Cate_Id
WHERE Joya_Id = @Joya_Id
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Joyas_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Joyas_eliminar]
@Joya_Id INT
AS
BEGIN
BEGIN TRY
UPDATE Vent.tbJoyas SET Joya_Estado = 0 
WHERE Joya_Id = @Joya_Id
SELECT 1 AS Resultado
END TRY
BEGIN CATCH
SELECT 0  AS Resultado
END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Joyas_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [Vent].[sp_Joyas_insertar]

@Joya_Nombre VARCHAR(60),
@Joya_PrecioCompra NUMERIC(10,2),
@Joya_PrecioVenta NUMERIC(10,2),
@Joya_PrecioMayor NUMERIC(10,2),
@Joya_Imagen VARCHAR(MAX),
@Joya_Stock INT,
@Prov_Id INT,
@Mate_Id INT,
@Cate_Id INT,
@Joya_UsuarioCreacion INT,
@Joya_FechaCreacion DATETIME
AS
BEGIN
DECLARE @estadoActual INT;

    SELECT @estadoActual = Joya_Estado FROM Vent.tbJoyas WHERE Joya_Nombre = @Joya_Nombre;
BEGIN TRY 
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
                -- El estado es 0, actualiza el estado a 1
                UPDATE Vent.tbJoyas SET Joya_Estado = 0 WHERE Joya_Nombre = @Joya_Nombre;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
INSERT INTO Vent.tbJoyas (Joya_Nombre,Joya_PrecioCompra,Joya_PrecioVenta,Joya_PrecioMayor,Joya_Imagen,Joya_Stock,Prov_Id,Mate_Id,Cate_Id,Joya_UsuarioCreacion,Joya_FechaCreacion)
VALUES (@Joya_Nombre,
@Joya_PrecioCompra,
@Joya_PrecioVenta,
@Joya_PrecioMayor,
@Joya_Imagen,
@Joya_Stock,
@Prov_Id,
@Mate_Id,
@Cate_Id,
@Joya_UsuarioCreacion,
@Joya_FechaCreacion)
SELECT 1
END
END TRY
BEGIN CATCH 
SELECT 0
END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Joyas_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Joyas_listar]
AS
BEGIN
SELECT Joya_Id,Joya_Nombre,Joya_PrecioCompra,Joya_PrecioVenta,Joya_Stock,Joya_PrecioMayor,Joya_Imagen,M.Mate_Material,P.Prov_Proveedor,C.Cate_Categoria FROM Vent.tbJoyas J
LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = J.Prov_Id LEFT JOIN Gral.tbMateriales M ON M.Mate_Id = J.Mate_Id
LEFT JOIN Gral.tbCategorias C ON C.Cate_Id = J.Cate_Id
WHERE Joya_Estado = 1
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Joyas_listarAutoCompletado]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Joyas_listarAutoCompletado]
AS
BEGIN
SELECT 
    MIN(J.Joya_Id) AS ID,
    J.Joya_Nombre AS Nombre,
    MIN(J.Joya_PrecioCompra) AS Joya_PrecioCompra,
    MIN(J.Joya_PrecioVenta) AS Venta,
    MIN(J.Joya_Stock) AS Joya_Stock,
    MIN(J.Joya_PrecioMayor) AS Mayor,
    MIN(J.Joya_Imagen) AS Joya_Imagen,
    MIN(M.Mate_Material) AS Mate_Material,
    MIN(P.Prov_Proveedor) AS Prov_Proveedor,
    MIN(C.Cate_Categoria) AS Cate_Categoria
FROM Vent.tbJoyas J
LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = J.Prov_Id
LEFT JOIN Gral.tbMateriales M ON M.Mate_Id = J.Mate_Id
LEFT JOIN Gral.tbCategorias C ON C.Cate_Id = J.Cate_Id
WHERE J.Joya_Estado = 1
GROUP BY J.Joya_Nombre

END
GO
/****** Object:  StoredProcedure [Vent].[sp_Joyas_listarAutoCompletado1]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Vent].[sp_Joyas_listarAutoCompletado1]
AS
BEGIN
SELECT 
    MIN(J.Joya_Id) AS Joya_Id,
    J.Joya_Nombre AS Joya_Nombre,
    MIN(J.Joya_PrecioCompra) AS Joya_PrecioCompra,
    MIN(J.Joya_PrecioVenta) AS Venta,
    MIN(J.Joya_Stock) AS Joya_Stock,
    MIN(J.Joya_PrecioMayor) AS Mayor,
    MIN(J.Joya_Imagen) AS Joya_Imagen,
    MIN(M.Mate_Material) AS Mate_Material,
    MIN(P.Prov_Proveedor) AS Prov_Proveedor,
    MIN(C.Cate_Categoria) AS Cate_Categoria
FROM Vent.tbJoyas J
LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = J.Prov_Id
LEFT JOIN Gral.tbMateriales M ON M.Mate_Id = J.Mate_Id
LEFT JOIN Gral.tbCategorias C ON C.Cate_Id = J.Cate_Id
WHERE J.Joya_Estado = 1
GROUP BY J.Joya_Nombre

END
GO
/****** Object:  StoredProcedure [Vent].[sp_JoyasPorSucursal_Lista]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_JoyasPorSucursal_Lista]
    @Sucu_Id INT
AS
BEGIN
      SELECT 
        MIN(P.Prod_Id) AS id,
        J.Joya_Nombre AS nombre,
        SUM(P.Prsx_Stock) AS stock,
        J.Joya_PrecioCompra AS compra,
        J.Joya_PrecioVenta AS venta,
        J.Joya_PrecioMayor AS mayor,
        'Joya' AS tipo
    FROM Gral.tbProductosPorSucurales P
    JOIN Vent.tbJoyas J ON J.Joya_Id = P.Prod_Id
    WHERE P.Prxs_Dif = 1 AND P.Sucu_Id = @Sucu_Id
    GROUP BY J.Joya_Nombre, J.Joya_PrecioCompra, J.Joya_PrecioVenta, J.Joya_PrecioMayor
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Maquillajes_actualizar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Maquillajes_actualizar]
@Maqu_Nombre VARCHAR(60),
@Maqu_PrecioCompra NUMERIC(8,2),
@Maqu_PrecioVenta NUMERIC(8,2),
@Maqu_PrecioMayor NUMERIC(8,2),
@Maqu_Imagen VARCHAR(MAX),
@Maqu_Stock INT,
@Prov_Id INT,
@Marc_Id INT,
@Maqu_UsuarioModificacion INT,
@Maqu_FechaModificacion DATETIME,
@Maqu_Id INT
AS
BEGIN
BEGIN TRY
UPDATE Vent.tbMaquillajes SET Maqu_Nombre = @Maqu_Nombre,Maqu_PrecioCompra = @Maqu_PrecioCompra,Maqu_PrecioVenta = @Maqu_PrecioVenta,Maqu_PrecioMayor = @Maqu_PrecioMayor,Prov_Id = @Prov_Id,Marc_Id = @Marc_Id,Maqu_UsuarioModificacion = @Maqu_UsuarioModificacion,Maqu_FechaModificacion = @Maqu_FechaModificacion,Maqu_Imagen = @Maqu_Imagen, Maqu_Stock = @Maqu_Stock
WHERE Maqu_Id = @Maqu_Id
SELECT 1 AS Resultado
END TRY
BEGIN CATCH
SELECT 0 AS Resultado
END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Maquillajes_buscar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Maquillajes_buscar]
@Maqu_Id INT
AS
BEGIN
SELECT Maqu_Id,Maqu_Nombre,Maqu_PrecioCompra,Maqu_Stock,Maqu_PrecioVenta,MA.Prov_Id,MA.Marc_Id,P.Prov_Proveedor,Mar.Marc_Marca,
   FORMAT([Maqu_FechaCreacion], 'yyyy-MM-dd') AS FechaCreacion,
   FORMAT(Maqu_FechaModificacion, 'yyyy-MM-dd') AS FechaModificacion,
Maqu_PrecioMayor,Maqu_Imagen,uCreacion.Usua_Usuario AS UsuarioCreacion,uModificador.Usua_Usuario AS usuarioModificacion FROM Vent.tbMaquillajes MA
LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = MA.Maqu_UsuarioCreacion
LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = MA.Maqu_UsuarioModificacion
LEFT JOIN Gral.tbMarcas Mar ON MA.Marc_Id = Mar.Marc_Id LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = MA.Prov_Id
WHERE Maqu_Id = @Maqu_Id
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Maquillajes_eliminar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Maquillajes_eliminar]
@Maqu_Id INT
AS
BEGIN
BEGIN TRY
UPDATE Vent.tbMaquillajes SET Maqu_Estado = 0
WHERE Maqu_Id = @Maqu_Id
SELECT 1 AS Resultado
END TRY
BEGIN CATCH
SELECT 0 AS Resultado
END CATCH
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Maquillajes_insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Vent].[sp_Maquillajes_insertar]
    @Maqu_Nombre VARCHAR(60),
    @Maqu_PrecioCompra NUMERIC(8,2),
    @Maqu_PrecioVenta NUMERIC(8,2),
    @Maqu_PrecioMayor NUMERIC(8,2),
	@Maqu_Stock INT,
    @Maqu_Imagen VARCHAR(MAX),
    @Prov_Id INT,
    @Marc_Id INT,
    @Maqu_UsuarioCreacion INT,
    @Maqu_FechaCreacion DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Vent.tbMaquillajes 
        (
            Maqu_Nombre,
            Maqu_PrecioCompra,
            Maqu_PrecioVenta,
            Maqu_PrecioMayor,
			Maqu_Stock,
            Maqu_Imagen,
            Prov_Id,
            Marc_Id,
            Maqu_UsuarioCreacion,
            Maqu_FechaCreacion
        )
        VALUES 
        (
            @Maqu_Nombre,
            @Maqu_PrecioCompra,
            @Maqu_PrecioVenta,
            @Maqu_PrecioMayor,
			@Maqu_Stock,
            @Maqu_Imagen,
            @Prov_Id,
            @Marc_Id,
            @Maqu_UsuarioCreacion,
            @Maqu_FechaCreacion
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_Maquillajes_listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Maquillajes_listar]
AS
BEGIN
SELECT Maqu_Id,Maqu_Nombre,Maqu_PrecioCompra,Maqu_Stock,Maqu_PrecioVenta,Maqu_PrecioMayor,Maqu_Imagen,Mar.Marc_Marca,P.Prov_Proveedor FROM Vent.tbMaquillajes M
LEFT JOIN Gral.tbMarcas Mar ON M.Marc_Id = Mar.Marc_Id LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = M.Prov_Id
WHERE Maqu_Estado = 1
END
GO
/****** Object:  StoredProcedure [Vent].[sp_Maquillajes_listarAutoCompletado]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Maquillajes_listarAutoCompletado]
AS
BEGIN
SELECT 
    MIN(M.Maqu_Id) AS Id, 
    M.Maqu_Nombre AS Nombre,
    MIN(M.Maqu_PrecioCompra) AS Maqu_PrecioCompra,
    MIN(M.Maqu_Stock) AS Maqu_Stock,
    MIN(M.Maqu_PrecioVenta) AS Venta,
    MIN(M.Maqu_PrecioMayor) AS Mayor,
    MIN(M.Maqu_Imagen) AS Maqu_Imagen,
    MIN(Mar.Marc_Marca) AS Marc_Marca,
    MIN(P.Prov_Proveedor) AS Prov_Proveedor
FROM Vent.tbMaquillajes M
LEFT JOIN Gral.tbMarcas Mar ON M.Marc_Id = Mar.Marc_Id
LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = M.Prov_Id
WHERE M.Maqu_Estado = 1
GROUP BY M.Maqu_Nombre
END

GO
/****** Object:  StoredProcedure [Vent].[sp_Maquillajes_listarAutoCompletado1]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Vent].[sp_Maquillajes_listarAutoCompletado1]
AS
BEGIN
SELECT 
    MIN(M.Maqu_Id) AS Maqu_Id, 
    M.Maqu_Nombre AS Maqu_Nombre,
    MIN(M.Maqu_PrecioCompra) AS Maqu_PrecioCompra,
    MIN(M.Maqu_Stock) AS Maqu_Stock,
    MIN(M.Maqu_PrecioVenta) AS Venta,
    MIN(M.Maqu_PrecioMayor) AS Mayor,
    MIN(M.Maqu_Imagen) AS Maqu_Imagen,
    MIN(Mar.Marc_Marca) AS Marc_Marca,
    MIN(P.Prov_Proveedor) AS Prov_Proveedor
FROM Vent.tbMaquillajes M
LEFT JOIN Gral.tbMarcas Mar ON M.Marc_Id = Mar.Marc_Id
LEFT JOIN Gral.tbProveedores P ON P.Prov_Id = M.Prov_Id
WHERE M.Maqu_Estado = 1
GROUP BY M.Maqu_Nombre
END

GO
/****** Object:  StoredProcedure [Vent].[sp_MaquillajesPorSucursal_Lista]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_MaquillajesPorSucursal_Lista] 
    @Sucu_Id INT
AS
BEGIN
     SELECT 
        MIN(P.Prod_Id) AS id,
        M.Maqu_Nombre AS nombre,
        SUM(P.Prsx_Stock) AS stock,
        M.Maqu_PrecioCompra AS compra,
        M.Maqu_PrecioVenta AS venta,
        M.Maqu_PrecioMayor AS mayor,
        'Maquillaje' AS tipo
    FROM Gral.tbProductosPorSucurales P
    JOIN Vent.tbMaquillajes M ON M.Maqu_Id = P.Prod_Id
    WHERE P.Prxs_Dif = 0 AND P.Sucu_Id = @Sucu_Id
    GROUP BY M.Maqu_Nombre, M.Maqu_PrecioCompra, M.Maqu_PrecioVenta, M.Maqu_PrecioMayor
END
GO
/****** Object:  StoredProcedure [Vent].[sp_ProductosPorSucursal_Detalle]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ProductosPorSucursal_Detalle] 
    @Pren_Id INT
AS
BEGIN
    -- Selecciona productos de joyas donde Prxs_Dif = 1
    SELECT 
        MIN(P.Prod_Id) AS id,
        J.Joya_Nombre AS nombre,
        SUM(P.Prsx_Stock) AS stock,
        J.Joya_PrecioCompra AS compra,
        J.Joya_PrecioVenta AS venta,
        J.Joya_PrecioMayor AS mayor,
        'Joya' AS tipo
    FROM Gral.tbProductosPorSucurales P
    JOIN Vent.tbJoyas J ON J.Joya_Id = P.Prod_Id
    WHERE P.Prxs_Dif = 1 AND P.Sucu_Id = @Pren_Id
    GROUP BY J.Joya_Nombre, J.Joya_PrecioCompra, J.Joya_PrecioVenta, J.Joya_PrecioMayor

    UNION ALL

    -- Selecciona productos de maquillajes donde Prxs_Dif = 0
    SELECT 
        MIN(P.Prod_Id) AS id,
        M.Maqu_Nombre AS nombre,
        SUM(P.Prsx_Stock) AS stock,
        M.Maqu_PrecioCompra AS compra,
        M.Maqu_PrecioVenta AS venta,
        M.Maqu_PrecioMayor AS mayor,
        'Maquillaje' AS tipo
    FROM Gral.tbProductosPorSucurales P
    JOIN Vent.tbMaquillajes M ON M.Maqu_Id = P.Prod_Id
    WHERE P.Prxs_Dif = 0 AND P.Sucu_Id = @Pren_Id
    GROUP BY M.Maqu_Nombre, M.Maqu_PrecioCompra, M.Maqu_PrecioVenta, M.Maqu_PrecioMayor
END
GO
/****** Object:  StoredProcedure [Vent].[sp_ProductosPorSucursal_PROBANDO]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Vent].[sp_ProductosPorSucursal_PROBANDO]
    @Pren_Id INT
AS
BEGIN
    -- Selecciona productos de joyas donde Prxs_Dif = 1
    SELECT 
       P.Prod_Id AS id,
        J.Joya_Nombre AS nombre,
        P.Prsx_Stock AS stock,
        J.Joya_PrecioCompra AS compra,
        J.Joya_PrecioVenta AS venta,
        J.Joya_PrecioMayor AS mayor,
        'Joya' AS tipo
    FROM Gral.tbProductosPorSucurales P
    JOIN Vent.tbJoyas J ON J.Joya_Id = P.Prod_Id
    WHERE P.Prxs_Dif = 1 AND P.Sucu_Id = @Pren_Id


    UNION ALL

    -- Selecciona productos de maquillajes donde Prxs_Dif = 0
    SELECT 
      M.Maqu_Id AS id,
        M.Maqu_Nombre AS nombre,
        M.Maqu_Stock AS stock,
        M.Maqu_PrecioCompra AS compra,
        M.Maqu_PrecioVenta AS venta,
        M.Maqu_PrecioMayor AS mayor,
        'Maquillaje' AS tipo
    FROM Gral.tbProductosPorSucurales P
    LEFT JOIN Vent.tbMaquillajes M ON M.Maqu_Id = P.Prod_Id
    WHERE P.Prxs_Dif = 0 AND P.Sucu_Id = @Pren_Id

END
GO
/****** Object:  StoredProcedure [Vent].[sp_ProductosPorSucursales_Insertar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ProductosPorSucursales_Insertar]
@Prxs_Dif INT,
@Prod_Nombre VARCHAR(MAX),
@Prsx_Stock INT,
@Sucu_EnviadoId INT,
@Sucu_RecibidoId INT
AS
BEGIN
INSERT INTO Gral.tbProductosPorSucurales (Prxs_Dif,Prod_Id,Prsx_Stock,Sucu_Id)
VALUES (@Prxs_Dif,
@Prod_Nombre,
@Prsx_Stock,
@Sucu_RecibidoId)
END

GO
/****** Object:  StoredProcedure [Vent].[sp_ProductosPorSucursales_Transferir]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ProductosPorSucursales_Transferir]
    @Prxs_Dif INT,
    @Prod_Nombre VARCHAR(MAX),
    @Prsx_Stock INT,
    @Sucu_EnviadoId INT,
    @Sucu_RecibidoId INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @totalStockEnviado INT;

    -- Calcular el total del stock disponible para el producto en la sucursal enviada
    SELECT @totalStockEnviado = SUM(Prsx_Stock)
    FROM Gral.tbProductosPorSucurales
    WHERE Sucu_Id = @Sucu_EnviadoId 
    AND Prod_Id IN (
        SELECT Prod_Id 
        FROM Vent.tbJoyas 
        WHERE Prxs_Dif = 1 
        AND Joya_Nombre = @Prod_Nombre 
        UNION
        SELECT Prod_Id 
        FROM Vent.tbMaquillajes 
        WHERE Prxs_Dif = 0 
        AND Maqu_Nombre = @Prod_Nombre
    );

    -- Validar si el stock solicitado es mayor que el stock disponible
    IF @Prsx_Stock > @totalStockEnviado
    BEGIN
        SELECT 0 AS Resultado;  -- No hay suficiente stock, devolver 0
      
    END
	ELSE
	BEGIN 
	  DECLARE @prodId INT, @stockActual INT, @nombreActual VARCHAR(MAX);
    DECLARE @stockRestante INT = @Prsx_Stock;
    DECLARE @cantidadAtransferir INT;

    -- Cursor para manejar el stock de productos con el mismo nombre en la sucursal enviada, ordenados por stock descendente
    DECLARE stock_cursor CURSOR FOR
    SELECT Prod_Id, Prsx_Stock, 
        CASE 
            WHEN @Prxs_Dif = 1 THEN (SELECT Joya_Nombre FROM Vent.tbJoyas WHERE Joya_Id = Prod_Id)
            WHEN @Prxs_Dif = 0 THEN (SELECT Maqu_Nombre FROM Vent.tbMaquillajes WHERE Maqu_Id = Prod_Id)
        END AS Prod_Nombre
    FROM Gral.tbProductosPorSucurales
    WHERE Sucu_Id = @Sucu_EnviadoId 
    AND Prxs_Dif = @Prxs_Dif  -- Asegurarse de que el filtro de Prxs_Dif se aplique aquí
    ORDER BY Prsx_Stock DESC;  -- Ordenar por stock descendente para procesar primero los más grandes

    OPEN stock_cursor;
    FETCH NEXT FROM stock_cursor INTO @prodId, @stockActual, @nombreActual;

    WHILE @@FETCH_STATUS = 0 AND @stockRestante > 0
    BEGIN
        -- Asegurarse de que solo se maneje el producto con el nombre correcto
        IF @nombreActual = @Prod_Nombre
        BEGIN
            SET @cantidadAtransferir = CASE 
                WHEN @stockActual > @stockRestante THEN @stockRestante
                ELSE @stockActual
            END;

            -- Actualizar el stock en la sucursal enviada
            UPDATE Gral.tbProductosPorSucurales
            SET Prsx_Stock = Prsx_Stock - @cantidadAtransferir
            WHERE Prod_Id = @prodId AND Sucu_Id = @Sucu_EnviadoId AND Prxs_Dif = @Prxs_Dif;

            -- Verificar si el producto existe en la sucursal recibida
            IF EXISTS (SELECT 1 FROM Gral.tbProductosPorSucurales WHERE Prod_Id = @prodId AND Sucu_Id = @Sucu_RecibidoId AND Prxs_Dif = @Prxs_Dif)
            BEGIN
                -- Actualizar el stock en la sucursal recibida
                UPDATE Gral.tbProductosPorSucurales
                SET Prsx_Stock = Prsx_Stock + @cantidadAtransferir
                WHERE Prod_Id = @prodId AND Sucu_Id = @Sucu_RecibidoId AND Prxs_Dif = @Prxs_Dif;
            END
            ELSE
            BEGIN
                -- Insertar nuevo registro en la sucursal recibida si no existe
                INSERT INTO Gral.tbProductosPorSucurales (Prxs_Dif, Prod_Id, Prsx_Stock, Sucu_Id)
                VALUES (@Prxs_Dif, @prodId, @cantidadAtransferir, @Sucu_RecibidoId);
            END

            SET @stockRestante = @stockRestante - @cantidadAtransferir;
        END

        FETCH NEXT FROM stock_cursor INTO @prodId, @stockActual, @nombreActual;
    END

    CLOSE stock_cursor;
    DEALLOCATE stock_cursor;

    -- Confirmar que la operación fue exitosa
    SELECT 1 AS Resultado;
	END

  
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_ProductosVendidosEnMes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ProductosVendidosEnMes] 
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SET NOCOUNT ON;

    WITH Consolidated AS (
        SELECT
            CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_Nombre ELSE m.Maqu_Nombre END AS Prod_Nombre,
            SUM(fd.FaxD_Cantidad) AS Total_Cantidad,
            CASE WHEN fd.FaxD_Dif = 1 THEN 'Joyas' ELSE 'Maquillajes' END AS Categoria,
            fd.FaxD_Dif,
            j.Joya_PrecioMayor AS Joya_PrecioMayor,
            j.Joya_PrecioVenta AS Joya_PrecioVenta,
            m.Maqu_PrecioMayor AS Maqu_PrecioMayor,
            m.Maqu_PrecioVenta AS Maqu_PrecioVenta
        FROM
            [Vent].[tbFacturaDetalles] fd
        JOIN
            [Vent].[tbFactura] f ON fd.Fact_Id = f.Fact_Id
        LEFT JOIN
            [Vent].[tbJoyas] j ON fd.Prod_Id = j.Joya_Id AND fd.FaxD_Dif = 1
        LEFT JOIN
            [Vent].[tbMaquillajes] m ON fd.Prod_Id = m.Maqu_Id AND fd.FaxD_Dif = 0
        WHERE
            f.Fact_Finalizado = 0 AND
			CAST(f.Fact_FechaFinalizado AS DATE)    BETWEEN @FechaInicio AND @FechaFin
        GROUP BY
            fd.FaxD_Dif,
            j.Joya_Nombre, m.Maqu_Nombre,
            j.Joya_PrecioMayor, j.Joya_PrecioVenta,
            m.Maqu_PrecioMayor, m.Maqu_PrecioVenta
    ),
    PriceCalc AS (
        SELECT
            Prod_Nombre,
            Total_Cantidad,
            Categoria,
            CASE
                WHEN Total_Cantidad >= 6 THEN CASE WHEN Categoria = 'Joyas' THEN Joya_PrecioMayor ELSE Maqu_PrecioMayor END
                ELSE CASE WHEN Categoria = 'Joyas' THEN Joya_PrecioVenta ELSE Maqu_PrecioVenta END
            END AS Prod_Precio
        FROM
            Consolidated
    )
    SELECT TOP 10
        Prod_Nombre AS Producto,
        Total_Cantidad AS Cantidad,
        Prod_Precio AS Precio_Unitario,
        (Total_Cantidad * Prod_Precio) AS Total,
        Categoria
    FROM
        PriceCalc
    ORDER BY Total_Cantidad DESC, Total DESC;
END;

GO
/****** Object:  StoredProcedure [Vent].[sp_Reporte_ControlStock]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_Reporte_ControlStock] 
    @TipoProducto INT,
    @Sucu_Id INT
AS
BEGIN
    SET NOCOUNT ON;


    IF @TipoProducto = 2 AND @Sucu_Id = 0
    BEGIN
        SELECT
            CASE 
                WHEN j.Joya_Nombre IS NOT NULL THEN j.Joya_Nombre
                ELSE m.Maqu_Nombre
            END AS Producto,
            SUM(p.Prsx_Stock) AS Stock,
            CASE 
                WHEN j.Joya_Nombre IS NOT NULL THEN 'Joya'
                ELSE 'Maquillaje'
            END AS Categoria
        FROM Gral.tbProductosPorSucurales p
        LEFT JOIN Vent.tbJoyas j ON p.Prod_Id = j.Joya_Id AND p.Prxs_Dif = 1
        LEFT JOIN Vent.tbMaquillajes m ON p.Prod_Id = m.Maqu_Id AND p.Prxs_Dif = 0
        WHERE (j.Joya_Estado = 1 OR m.Maqu_Estado = 1)
        GROUP BY CASE 
                    WHEN j.Joya_Nombre IS NOT NULL THEN j.Joya_Nombre
                    ELSE m.Maqu_Nombre
                 END,
                 CASE 
                    WHEN j.Joya_Nombre IS NOT NULL THEN 'Joya'
                    ELSE 'Maquillaje'
                 END
    END

   
    ELSE IF @TipoProducto = 1 AND @Sucu_Id = 0
    BEGIN
        SELECT
            j.Joya_Nombre AS Producto,
            SUM(p.Prsx_Stock) AS Stock,  
            'Joya' AS Categoria
        FROM Gral.tbProductosPorSucurales p
        LEFT JOIN Vent.tbJoyas j ON p.Prod_Id = j.Joya_Id AND p.Prxs_Dif = 1
        WHERE j.Joya_Estado = 1
        AND p.Prxs_Dif = 1
        GROUP BY j.Joya_Nombre
    END


    ELSE IF @TipoProducto = 0 AND @Sucu_Id = 0
    BEGIN
        SELECT
            m.Maqu_Nombre AS Producto,
            SUM(p.Prsx_Stock) AS Stock,  
            'Maquillaje' AS Categoria
        FROM Gral.tbProductosPorSucurales p
        LEFT JOIN Vent.tbMaquillajes m ON p.Prod_Id = m.Maqu_Id AND p.Prxs_Dif = 0
        WHERE m.Maqu_Estado = 1
        AND p.Prxs_Dif = 0
        GROUP BY m.Maqu_Nombre
    END

  
    ELSE IF @TipoProducto = 1
    BEGIN
        SELECT
            j.Joya_Nombre AS Producto,
            SUM(p.Prsx_Stock) AS Stock,  
            'Joya' AS Categoria
        FROM Gral.tbProductosPorSucurales p
        LEFT JOIN Vent.tbJoyas j ON p.Prod_Id = j.Joya_Id AND p.Prxs_Dif = 1
        WHERE j.Joya_Estado = 1
        AND p.Prxs_Dif = 1
        AND (@Sucu_Id = 2 OR p.Sucu_Id = @Sucu_Id)
        GROUP BY j.Joya_Nombre
    END

  
    ELSE IF @TipoProducto = 0
    BEGIN
        SELECT
            m.Maqu_Nombre AS Producto,
            SUM(p.Prsx_Stock) AS Stock,  
            'Maquillaje' AS Categoria
        FROM Gral.tbProductosPorSucurales p
        LEFT JOIN Vent.tbMaquillajes m ON p.Prod_Id = m.Maqu_Id AND p.Prxs_Dif = 0
        WHERE m.Maqu_Estado = 1
        AND p.Prxs_Dif = 0
        AND (@Sucu_Id = 2 OR p.Sucu_Id = @Sucu_Id)
        GROUP BY m.Maqu_Nombre
    END

    ELSE IF @TipoProducto = 2
    BEGIN
        SELECT
            CASE 
                WHEN j.Joya_Nombre IS NOT NULL THEN j.Joya_Nombre
                ELSE m.Maqu_Nombre
            END AS Producto,
            SUM(p.Prsx_Stock) AS Stock,
            CASE 
                WHEN j.Joya_Nombre IS NOT NULL THEN 'Joya'
                ELSE 'Maquillaje'
            END AS Categoria
        FROM Gral.tbProductosPorSucurales p
        LEFT JOIN Vent.tbJoyas j ON p.Prod_Id = j.Joya_Id AND p.Prxs_Dif = 1
        LEFT JOIN Vent.tbMaquillajes m ON p.Prod_Id = m.Maqu_Id AND p.Prxs_Dif = 0
        WHERE (j.Joya_Estado = 1 OR m.Maqu_Estado = 1)
        AND (@Sucu_Id = 2 OR p.Sucu_Id = @Sucu_Id)
        GROUP BY CASE 
                    WHEN j.Joya_Nombre IS NOT NULL THEN j.Joya_Nombre
                    ELSE m.Maqu_Nombre
                 END,
                 CASE 
                    WHEN j.Joya_Nombre IS NOT NULL THEN 'Joya'
                    ELSE 'Maquillaje'
                 END
    END
END;
GO
/****** Object:  StoredProcedure [Vent].[SP_Reporte_FacturaEmpleadoTotal]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[SP_Reporte_FacturaEmpleadoTotal] 
    @EmplId INT
AS
BEGIN
    SET NOCOUNT ON;

    WITH FacturaDetalles AS (
        SELECT
            fd.Fact_Id,
            CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_Nombre ELSE m.Maqu_Nombre END AS Prod_Nombre,
            SUM(fd.FaxD_Cantidad) AS Total_Cantidad,
            MAX(CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_PrecioMayor ELSE m.Maqu_PrecioMayor END) AS PrecioMayor,
            MAX(CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_PrecioVenta ELSE m.Maqu_PrecioVenta END) AS PrecioVenta
        FROM
            [Vent].[tbFacturaDetalles] fd
        LEFT JOIN
            [Vent].[tbJoyas] j ON fd.Prod_Id = j.Joya_Id AND fd.FaxD_Dif = 1
        LEFT JOIN
            [Vent].[tbMaquillajes] m ON fd.Prod_Id = m.Maqu_Id AND fd.FaxD_Dif = 0
        WHERE
            fd.Fact_Id IN (SELECT Fact_Id FROM [Vent].[tbFactura] WHERE @EmplId = 0 OR Empl_Id = @EmplId)
        GROUP BY
            fd.Fact_Id, CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_Nombre ELSE m.Maqu_Nombre END
    ),
    FacturaTotales AS (
        SELECT
            f.Empl_Id,
            fd.Fact_Id,
            SUM(
                CASE 
                    WHEN fd.Total_Cantidad >= 6 THEN fd.Total_Cantidad * fd.PrecioMayor
                    ELSE fd.Total_Cantidad * fd.PrecioVenta
                END
            ) AS Total,
            FORMAT(f.Fact_FechaFinalizado, 'yyyy-MM-dd') AS Fact_FechaFinalizado
        FROM
            [Vent].[tbFactura] f
        LEFT JOIN
            FacturaDetalles fd ON f.Fact_Id = fd.Fact_Id
        WHERE
            (@EmplId = 0 OR f.Empl_Id = @EmplId) AND Fact_Finalizado = 0
        GROUP BY
            f.Empl_Id, fd.Fact_Id, f.Fact_FechaFinalizado
    )
    SELECT
        e.Empl_Id AS Empl_Id,
        CONCAT(e.Empl_Nombre, ' ', e.Empl_Apellido) AS Empl_Nombre,
        ft.Fact_Id AS Factura,
        ft.Total AS Total,
        ft.Fact_FechaFinalizado
    FROM
        [Gral].[tbEmpleados] e
    LEFT JOIN
        FacturaTotales ft ON e.Empl_Id = ft.Empl_Id
    WHERE 
        @EmplId = 0 OR e.Empl_Id = @EmplId
    ORDER BY e.Empl_Id, ft.Fact_Id;

    SET NOCOUNT OFF;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_ReporteCaja_Fecha]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ReporteCaja_Fecha] 
    @FechaHoy DATE,
    @Sucu_Id INT
AS
BEGIN
    SELECT 
        caja_Id,
        ISNULL(caja_UsuarioApertura, 1)AS  caja_UsuarioApertura,
		ISNULL(caja_UsuarioCierre, 1)AS  caja_UsuarioCierre,
        caja_FechaApertura,
        ISNULL(caja_FechaCierre, '2024-5-22') AS caja_FechaCierre,
        caja_MontoInicial,
        caja_MontoFinal,
        caja_MontoSistema,
        caja_Observacion,
        S.Sucu_Nombre,
	 ISNULL(U.Usua_Usuario , 'Eduardo')AS Apertura,
 ISNULL(UC.Usua_Usuario , 'Eduardo')AS Cierre,
	caja_Finalizado

    FROM 
        Vent.tbCajas C
    LEFT JOIN 
        Gral.tbSucursales S ON S.Sucu_Id = C.Sucu_Id
	LEFT JOIN
		Acce.tbUsuarios U ON U.Usua_Id = C.caja_UsuarioApertura
	LEFT JOIN Acce.tbUsuarios UC ON UC.Usua_Id = C.caja_UsuarioCierre
    WHERE 
        CAST(caja_FechaApertura AS DATE) = @FechaHoy 
        AND C.Sucu_Id = @Sucu_Id
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_ReporteTop10]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ReporteTop10]  
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SET NOCOUNT ON;

    WITH Consolidated AS (
        SELECT
            CASE WHEN fd.FaxD_Dif = 1 THEN j.Joya_Nombre ELSE m.Maqu_Nombre END AS Prod_Nombre,
            SUM(fd.FaxD_Cantidad) AS Total_Cantidad,
            CASE WHEN fd.FaxD_Dif = 1 THEN 'Joyas' ELSE 'Maquillajes' END AS Categoria,
            fd.FaxD_Dif,
            j.Joya_PrecioMayor AS Joya_PrecioMayor,
            j.Joya_PrecioVenta AS Joya_PrecioVenta,
            m.Maqu_PrecioMayor AS Maqu_PrecioMayor,
            m.Maqu_PrecioVenta AS Maqu_PrecioVenta
        FROM
            [Vent].[tbFacturaDetalles] fd
        JOIN
            [Vent].[tbFactura] f ON fd.Fact_Id = f.Fact_Id
        LEFT JOIN
            [Vent].[tbJoyas] j ON fd.Prod_Id = j.Joya_Id AND fd.FaxD_Dif = 1
        LEFT JOIN
            [Vent].[tbMaquillajes] m ON fd.Prod_Id = m.Maqu_Id AND fd.FaxD_Dif = 0
        WHERE
            f.Fact_Finalizado = 0 AND
            f.Fact_FechaFinalizado BETWEEN @FechaInicio AND @FechaFin
        GROUP BY
            fd.FaxD_Dif,
            j.Joya_Nombre, m.Maqu_Nombre,
            j.Joya_PrecioMayor, j.Joya_PrecioVenta,
            m.Maqu_PrecioMayor, m.Maqu_PrecioVenta ),
    PriceCalc AS (
        SELECT
            Prod_Nombre,
            Total_Cantidad,
            Categoria,
            CASE
                WHEN Total_Cantidad >= 6 THEN CASE WHEN Categoria = 'Joyas' THEN Joya_PrecioMayor ELSE Maqu_PrecioMayor END
                ELSE CASE WHEN Categoria = 'Joyas' THEN Joya_PrecioVenta ELSE Maqu_PrecioVenta END
            END AS Prod_Precio
        FROM
            Consolidated
    )
    SELECT
        Prod_Nombre AS Producto,
        Total_Cantidad AS Cantidad,
        Prod_Precio AS Precio_Unitario,
        (Total_Cantidad * Prod_Precio) AS Total,
        Categoria
    FROM
        PriceCalc
    ORDER BY Total_Cantidad DESC, Total DESC;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_ReporteVentasAnual]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ReporteVentasAnual]
@Año INT
AS
BEGIN
SELECT * FROM VW_VentasTotales
WHERE Año = @Año
END
GO
/****** Object:  StoredProcedure [Vent].[sp_ReporteVentasFechasDelDia]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ReporteVentasFechasDelDia]
    @Fecha DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalGeneral DECIMAL(18, 2)
    DECLARE @TotalEfectivo DECIMAL(18, 2)

    -- Calcular el total general
    SELECT @TotalGeneral = SUM(V.Total) * 1.15
    FROM VW_VentasMayoristas V
    LEFT JOIN Vent.tbFactura F ON F.Fact_Id = V.fact_Id
    LEFT JOIN Gral.tbMetodosPago M ON M.Mepa_Id = F.Mepa_Id
    WHERE V.Fact_FechaFinalizado = @Fecha

    -- Calcular el total en efectivo
    SELECT @TotalEfectivo = SUM(V.Total) * 1.15
    FROM VW_VentasMayoristas V
    LEFT JOIN Vent.tbFactura F ON F.Fact_Id = V.fact_Id
    LEFT JOIN Gral.tbMetodosPago M ON M.Mepa_Id = F.Mepa_Id
    WHERE V.Fact_FechaFinalizado = @Fecha
      AND M.Mepa_Metodo = 'Efectivo'

    -- Devolver los resultados
    SELECT 
        @TotalGeneral AS Total,
        @TotalEfectivo AS TotalEfectivo
END

GO
/****** Object:  StoredProcedure [Vent].[sp_ReporteVentasMayoristas]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ReporteVentasMayoristas]
@FechaInicio DATE,
@FechaFinal DATE
AS
BEGIN
    SELECT * 
    FROM VW_VentasMayoristas
    WHERE Fact_FechaFinalizado >= @FechaInicio 
      AND Fact_FechaFinalizado <= @FechaFinal 
      AND Cantidad > 5
END
GO
/****** Object:  StoredProcedure [Vent].[sp_ReporteVentaspPorPago]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_ReporteVentaspPorPago] 
@Mepa_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF @Mepa_Id = 0
    BEGIN
       SELECT 
            V.Fact_Id,
            SUM(V.Total) * 1.15 AS Total,
            M.Mepa_Metodo,
            V.Fact_FechaFinalizado
        FROM VW_VentasMayoristas V
        LEFT JOIN Vent.tbFactura F ON F.Fact_Id = V.Fact_Id
        LEFT JOIN Gral.tbMetodosPago M ON M.Mepa_Id = F.Mepa_Id
        GROUP BY V.Fact_Id, M.Mepa_Metodo, V.Fact_FechaFinalizado
    END
    ELSE
    BEGIN
        SELECT 
            V.Fact_Id,
            SUM(V.Total) * 1.15 AS Total,
            M.Mepa_Metodo,
            V.Fact_FechaFinalizado
        FROM VW_VentasMayoristas V
        LEFT JOIN Vent.tbFactura F ON F.Fact_Id = V.Fact_Id
        LEFT JOIN Gral.tbMetodosPago M ON M.Mepa_Id = F.Mepa_Id
        WHERE M.Mepa_Id = @Mepa_Id
        GROUP BY V.Fact_Id, M.Mepa_Metodo, V.Fact_FechaFinalizado
    END
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_TotalFinal_JoyasMes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [Vent].[sp_TotalFinal_JoyasMes]
   @MesActual INT,
   @AñoActual INT
AS
BEGIN
    DECLARE @TotalFinal NUMERIC(18, 2)
    SELECT @TotalFinal = SUM(Total) 
	FROM [Vent].[v_Dash_JoyasMes]

    SELECT @TotalFinal AS TotalFinal
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_TotalFinal_MaquillajeMes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Vent].[sp_TotalFinal_MaquillajeMes] 
   @MesActual INT,
   @AñoActual INT
AS
BEGIN
    -- Obtener el total final de la vista [Vent].[v_Dash_JoyasMes]
    DECLARE @TotalFinal NUMERIC(18, 2)
    SELECT @TotalFinal = SUM(Total) FROM [Vent].[v_Dash_MaquillajeMes]

    -- Devolver el total final
    SELECT @TotalFinal AS TotalFinal
END;


GO
/****** Object:  StoredProcedure [Vent].[sp_TotalVentasPorproducto]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_TotalVentasPorproducto]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CASE WHEN fd.FaxD_Dif = 1 THEN 'Joya'
             WHEN fd.FaxD_Dif = 0 THEN 'Maquillaje'
        END AS Producto,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    GROUP BY
        CASE WHEN fd.FaxD_Dif = 1 THEN 'Joya'
             WHEN fd.FaxD_Dif = 0 THEN 'Maquillaje'
        END;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_VentastotalMes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_VentastotalMes]
    @Año INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Month INT = 1;
    DECLARE @TotalVentas TABLE (Mes NVARCHAR(20), TotalVentas DECIMAL(18, 2));

    WHILE @Month <= 12
    BEGIN
        DECLARE @MonthName NVARCHAR(20);
        SET @MonthName = DATENAME(MONTH, DATEADD(MONTH, @Month - 1, '1900-01-01'));

        INSERT INTO @TotalVentas (Mes, TotalVentas)
        SELECT
            @MonthName AS Mes,
            COALESCE(SUM(
                CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                     WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
                END
            ), 0) AS TotalVentas
        FROM
            [Vent].[tbFactura] f
        LEFT JOIN
            [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
        LEFT JOIN
            [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
        LEFT JOIN
            [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
        WHERE
            MONTH(f.Fact_FechaCreacion) = @Month
            AND YEAR(f.Fact_FechaCreacion) = @Año;

        SET @Month = @Month + 1;
    END;

    INSERT INTO @TotalVentas (Mes, TotalVentas)
    SELECT 'TotalAnual', SUM(TotalVentas) FROM @TotalVentas;

    SELECT * FROM @TotalVentas ORDER BY
        CASE Mes
            WHEN 'Enero' THEN 1
            WHEN 'Febrero' THEN 2
            WHEN 'Marzo' THEN 3
            WHEN 'Abril' THEN 4
            WHEN 'Mayo' THEN 5
            WHEN 'Junio' THEN 6
            WHEN 'Julio' THEN 7
            WHEN 'Agosto' THEN 8
            WHEN 'Septiembre' THEN 9
            WHEN 'Octubre' THEN 10
            WHEN 'Noviembre' THEN 11
            WHEN 'Diciembre' THEN 12
            ELSE 13
        END;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_VentastotalMes2]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Vent].[sp_VentastotalMes2]
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Month INT = 1;
    DECLARE @TotalVentas TABLE (Mes NVARCHAR(20), TotalVentas DECIMAL(18, 2));

    WHILE @Month <= 12
    BEGIN
        DECLARE @MonthName NVARCHAR(20);
        SET @MonthName = DATENAME(MONTH, DATEADD(MONTH, @Month - 1, '1900-01-01'));

        INSERT INTO @TotalVentas (Mes, TotalVentas)
        SELECT
            @MonthName AS Mes,
            SUM(
                CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                     WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
                END
            ) AS TotalVentas
        FROM
            [Vent].[tbFactura] f
        INNER JOIN
            [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
        LEFT JOIN
            [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
        LEFT JOIN
            [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
        WHERE
            MONTH(f.Fact_FechaCreacion) = @Month;

        SET @Month = @Month + 1;
    END;

    SELECT * FROM @TotalVentas ORDER BY Mes;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_VentastotalMes3]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE  [Vent].[sp_VentastotalMes3]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        'TotalAnual' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id

    UNION ALL

    SELECT
        'Enero' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 1 -- Enero

    UNION ALL

    SELECT
        'Febrero' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 2

		  UNION ALL

    SELECT
        'Marzo' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 3 -- Marzo


		  UNION ALL

    SELECT
        'Abril' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 4 

		  UNION ALL

    SELECT
        'Mayo' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 5 -- Febrero


		
		  UNION ALL

    SELECT
        'Junio' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 6 -- Febrero





		
		  UNION ALL

    SELECT
        'Julio' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 7


		
		  UNION ALL

    SELECT
        'Agosto' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 8 -- Febrero

		
		  UNION ALL

    SELECT
        'Septiembre' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 9 -- Febrero


		
		  UNION ALL

    SELECT
        'Octubre' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 10

		
		  UNION ALL

    SELECT
        'Noviembre' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 11 



		
		  UNION ALL

    SELECT
        'Diciembre' AS Mes,
        SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ) AS TotalVentas
    FROM
        [Vent].[tbFactura] f
    INNER JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        MONTH(f.Fact_FechaCreacion) = 12


  

    ORDER BY
        Mes;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_VentastotalMesConDetalles]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_VentastotalMesConDetalles]
    @Año INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Month INT = 1;
    DECLARE @TotalVentas TABLE (Mes NVARCHAR(20), TotalVentas DECIMAL(18, 2), VentasJoyas DECIMAL(18, 2), VentasMaquillaje DECIMAL(18, 2));

    WHILE @Month <= 12
    BEGIN
        DECLARE @MonthName NVARCHAR(20);
        SET @MonthName = DATENAME(MONTH, DATEADD(MONTH, @Month - 1, '1900-01-01'));

        INSERT INTO @TotalVentas (Mes, TotalVentas, VentasJoyas, VentasMaquillaje)
        SELECT
            @MonthName AS Mes,
            COALESCE(SUM(
                CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                     WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
                END
            ), 0) AS TotalVentas,
            COALESCE(SUM(
                CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta ELSE 0 END
            ), 0) AS VentasJoyas,
            COALESCE(SUM(
                CASE WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta ELSE 0 END
            ), 0) AS VentasMaquillaje
        FROM
            [Vent].[tbFactura] f
        LEFT JOIN
            [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
        LEFT JOIN
            [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
        LEFT JOIN
            [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
        WHERE
            MONTH(f.Fact_FechaCreacion) = @Month
            AND YEAR(f.Fact_FechaCreacion) = @Año;

        SET @Month = @Month + 1;
    END;

    INSERT INTO @TotalVentas (Mes, TotalVentas, VentasJoyas, VentasMaquillaje)
    SELECT 
        'TotalAnual', 
        SUM(TotalVentas), 
        SUM(VentasJoyas), 
        SUM(VentasMaquillaje) 
    FROM @TotalVentas;

    SELECT * FROM @TotalVentas ORDER BY
        CASE Mes
            WHEN 'Enero' THEN 1
            WHEN 'Febrero' THEN 2
            WHEN 'Marzo' THEN 3
            WHEN 'Abril' THEN 4
            WHEN 'Mayo' THEN 5
            WHEN 'Junio' THEN 6
            WHEN 'Julio' THEN 7
            WHEN 'Agosto' THEN 8
            WHEN 'Septiembre' THEN 9
            WHEN 'Octubre' THEN 10
            WHEN 'Noviembre' THEN 11
            WHEN 'Diciembre' THEN 12
            ELSE 13 
        END;
END;
GO
/****** Object:  StoredProcedure [Vent].[sp_VentastotalMesConDetallesmes]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[sp_VentastotalMesConDetallesmes]
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @TotalVentas TABLE (Mes NVARCHAR(20), TotalVentas DECIMAL(18, 2), VentasJoyas DECIMAL(18, 2), VentasMaquillaje DECIMAL(18, 2));

    INSERT INTO @TotalVentas (Mes, TotalVentas, VentasJoyas, VentasMaquillaje)
    SELECT
        'Rango de Fechas' AS Mes,
        COALESCE(SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta
                 WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta
            END
        ), 0) AS TotalVentas,
        COALESCE(SUM(
            CASE WHEN fd.FaxD_Dif = 1 THEN fd.FaxD_Cantidad * j.Joya_PrecioVenta ELSE 0 END
        ), 0) AS VentasJoyas,
        COALESCE(SUM(
            CASE WHEN fd.FaxD_Dif = 0 THEN fd.FaxD_Cantidad * m.Maqu_PrecioVenta ELSE 0 END
        ), 0) AS VentasMaquillaje
    FROM
        [Vent].[tbFactura] f
    LEFT JOIN
        [Vent].[tbFacturaDetalles] fd ON f.Fact_Id = fd.Fact_Id
    LEFT JOIN
        [Vent].[tbJoyas] j ON fd.FaxD_Dif = 1 AND fd.Prod_Id = j.Joya_Id
    LEFT JOIN
        [Vent].[tbMaquillajes] m ON fd.FaxD_Dif = 0 AND fd.Prod_Id = m.Maqu_Id
    WHERE
        f.Fact_FechaCreacion BETWEEN @FechaInicio AND @FechaFin;

    INSERT INTO @TotalVentas (Mes, TotalVentas, VentasJoyas, VentasMaquillaje)
    SELECT 
        'Total',
        SUM(TotalVentas), 
        SUM(VentasJoyas), 
        SUM(VentasMaquillaje) 
    FROM @TotalVentas;

    SELECT * FROM @TotalVentas;
END;
GO
/****** Object:  StoredProcedure [Vent].[tbProductosPorSucursales_Listar]    Script Date: 27/5/2024 10:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[tbProductosPorSucursales_Listar]
@Pren_Id INT
AS
BEGIN
SELECT * FROM [Gral].[tbProductosPorSucurales]
WHERE Pren_Id = @Pren_Id
END
GO
USE [master]
GO
ALTER DATABASE [dbSistemaEsmeralda] SET  READ_WRITE 
GO
