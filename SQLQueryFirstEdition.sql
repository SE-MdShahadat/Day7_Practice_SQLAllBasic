--create database
Create Database ProductDb

--using database
use ProductDb

--insert data into Category table
INSERT INTO Category (CategoryName) VALUES ('Stationery')
INSERT INTO Category (CategoryName) VALUES ('Computer')

--insert data into Product table
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Pen',10,15,'Good pen for exam')
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Pencil',100,5,'Good pencil for
drawing')
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Notebook',50,25,'Notebook for
primary students')
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Fullscape',200,15,'Fullscape for
higer secondary students')
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Eraser',1000,1.50,'Eraser for KG
Students')
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (2,'Mouse',20,200,'USB 2.0 Mouse')
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (2,'Keyboard',20,250,'USB 3.0
Keyboard')
INSERT INTO Product (CategoryId,ProductName,Qty,Price,Description) VALUES (2,'USB Stick',1000,450,'4 GB
Pendrives')

--2.1: Get all columns and all rows from ‘Product’ table
Select * from Product

--2.2: Get Column with their respective values from the table.
Select ProductName, Qty, Price From Product

--2.3: Get all columns from ‘Product’ table with where clause.
Select * from Product Where ProductId=2

--2.4: Get all columns from ‘Product’ table using Between Operator.
Select * From Product where ProductId between 2 and 5

--2.5: Get all rows from ‘Product’ table where ProductName is Mouse,Keyboard,USB Stick
Select * From Product Where ProductName in('Mouse','Keyboard','USB Stick')

--2.6: Get all rows from ‘Product’ table where the name starts with ‘K’ letter.Select * From Product Where ProductName Like 'K%'--2.7: Get all rows from ‘Product’ table where the name ends with ‘K’ letter.Select * From Product where ProductName Like '%K'--2.8: Get all rows from ‘Product’ table where the name starts with ‘E/F’ letter.Select * from Product where ProductName Like '[EF]%'--2.9: Get all rows from ‘Product’ table where the name not starts with ‘E/F’ letterSelect * from product where ProductName Like '[^EF]%'--2.10: Get single column with a combination of Product and Qty added together with a space from Product’ table 
Select (ProductName +Space(1)+CONVERT(varchar,Qty)) As ProductWithQty From Product

--2.11: Get all rows from ‘Product’ table where ProductName column is not containing null values
Select * From Product Where ProductName is not Null

--2.12: Get all rows from ‘Product’ table in descending order of ProductId
Select * From Product Order By ProductId DESC

--2.13: Get all rows from ‘Product’ table in ascending order of ProductId
Select * From Product Order By ProductId

--2.14: Get Unique row from ‘Product’ table based on CategoryId
Select Distinct CategoryId From Product

--2.15: Get top 5 Rows from ‘Product’ table
Select Top 5 * From Product

--2.16: Get maximum value Of ProductId from ‘Product’ table
Select MAX(ProductId) from Product

--2.17: Get maximum value Of Qty from ‘Product’ table
Select Max(Qty) From Product 

--2.18: Get even row from table 'Product'Select Temp. * From
	(Select ROW_NUMBER()OVER(ORDER by ProductId) as row_num,
			Product.*From Product)Temp
Where((temp.row_num)%2)=0

--2.19: Get odd row from table 'Product'
Select Temp. * from
	(Select ROW_NUMBER()Over(Order by ProductId)as row_num,
			Product. * From Product)Temp
where ((Temp.row_num)%2)=1

--2.20: Count number of records in a 'Product' table
Select Count(*) As RecordCount From Product

--2.21: List all the categories with products (Inner Join)Select * From CategoryInner Join ProductON Category.CategoryId=Product.CategoryId--2.22: List all rows from category, even if there are no matches in the product table (Left Join)Select * From CategoryLeft Join ProductON Category.CategoryId = Product.CategoryId--2.23: List all the rows from product, even if there are no matches in the category table (Right Join)Select * From CategoryRight Join ProductON Category.CategoryId = Product.CategoryId--2.24: List all the rows from the category table and all the rows from the product table (Full Join)SELECT * FROM Category
FULL JOIN Product
ON Category.CategoryId = Product.CategoryId--2.25: Get average value of price from product tableSelect AVG(Price) As PriceAverage From Product--2.26: Get number of products from product tableSelect COUNT(ProductName) as NoOfProduct From Product--2.27: Get Maximum price of product from product tableSelect Max(Price) as MaximumPrice from Product--2.28: Get minimum price of product from product tableSelect Min(Price) As MinimumPrice from Product--2.29: Get total number of qty of products from product tableSelect SUM(Qty) as TotalQty From Product--2.30: Get all product name is in upper case from product tableSelect UPPER(ProductName) as PRODUCTS From Product--2.31: Get all product name is in lower case from product tableSelect LOWER(ProductName) as products from Product--2.32: List all columns of all tables in a databaseSelect sys.objects.name as TableName, sys.columns.name as ColumnNameFrom sys.columnsInner Join sys.objects	on sys.columns.object_id=sys.objects.object_id		and type_desc ='USER_TABLE'	ORDER BY sys.objects.name, sys.columns.column_id--2.33: List all tables which have column name like 'CategoryId'	SELECT
	sys.tables.name AS table_name,
	SCHEMA_NAME(schema_id) AS schema_name,
	sys.columns.name AS column_name
	FROM sys.tables
	INNER JOIN sys.columns
	ON sys.tables.OBJECT_ID = sys.columns.OBJECT_ID
	WHERE sys.columns.name LIKE '%CategoryId%'
	ORDER BY schema_name, table_name--2.34: List number of records in each table in a databaseDECLARE @DSql VARCHAR(MAX)
SELECT @DSql =
 COALESCE(@DSql + CHAR(13) + ' UNION ALL ' + CHAR(13), '') +
 'SELECT ' + QUOTENAME(TABLE_NAME,'''') + ' as [Table Name], COUNT(*) AS [Records Count]
 FROM ' + QUOTENAME(Table_schema) + '.' + QUOTENAME(TABLE_NAME)
FROM INFORMATION_SCHEMA.TABLES
ORDER BY TABLE_NAME
EXEC( @DSql)--2.35: List all tables in a databaseSELECT Table_Schema AS [Table Schema], Table_Name AS [Table Name]
FROM INFORMATION_SCHEMA.Tables--2.36: List all procedures from a databaseSELECT name,create_date, modify_date FROM sys.procedures--2.37: List all tables in all databasesCREATE TABLE #Temp
(
DBName sysname,
TableSchema sysname,
TableName sysname
)
DECLARE @DSql NVARCHAR(MAX)
SELECT @DSql = COALESCE(@DSql,'') + '
INSERT INTO #temp
SELECT ' + QUOTENAME(name,'''') + ' as [DB Name], [Table_Schema] as [Table Schema],
[Table_Name] as [Table Name]
FROM ' + QUOTENAME(Name) + '.INFORMATION_SCHEMA.Tables;'
FROM sys.databases
ORDER BY name
EXECUTE(@DSql)
SELECT * FROM #temp
DROP TABLE #temp--2.38: List all Stored Procedures in All Databases
CREATE TABLE #Temp
(
DBName SYSNAME,
SPName SYSNAME,
create_date DATETIME,
modify_date DATETIME
)
DECLARE @DSql NVARCHAR(MAX)
SET @DSql = ''
SELECT @DSql = @DSql + ' INSERT INTO #Temp
 SELECT ' + QUOTENAME(name, '''') + ', name, create_date, modify_date
 FROM ' + QUOTENAME(name) + '.sys.procedures' from sys.databases
EXECUTE (@DSql)
SELECT * FROM #Temp ORDER BY DBName, SPName
DROP TABLE #temp
--2.39: List sizes of all tables in a database
CREATE TABLE #Temp
(
TableName SYSNAME,
ROWS BIGINT,
reserved VARCHAR(100),
data VARCHAR(100),
index_size VARCHAR(100),
unused VARCHAR(100)
)
DECLARE @DSql VARCHAR(MAX)
SELECT @DSql = COALESCE(@DSql,'') + '
INSERT INTO #Temp execute sp_spaceused ' + QUOTENAME(Table_Name,'''') FROM
INFORMATION_SCHEMA.TABLES
EXECUTE (@DSql)
SELECT * FROM #Temp ORDER BY TableName--2.40: List sizes of all database filesCREATE TABLE #Temp
(
DBName SYSNAME,
FILENAME VARCHAR(MAX),
PhysicalName VARCHAR(MAX),
Size DECIMAL(12,2)
)
DECLARE @DSql NVARCHAR(MAX)
SET @DSql = ''
SELECT @DSql = @DSql + 'USE' + QUOTENAME(name) + '
INSERT INTO #Temp
SELECT ' + QUOTENAME(name,'''') + ', Name,
Physical_Name, size/1024.0 from sys.database_files'
FROM sys.databases
EXECUTE (@DSql)
SELECT * FROM #Temp ORDER BY DBName, FileName
DROP TABLE #Temp--2.41: Generate xsd of a table without dataDECLARE @myXsd XML
SET @myXsd = (SELECT TOP 0 * FROM Category FOR XML AUTO, ELEMENTS,
XMLSCHEMA('myTargetNamespace'))
SET @myXsd.modify('delete /xs:schema[1]/@targetNamespace')
SELECT @myXsd--2.42: Generate xsd of a table with dataDECLARE @XsdSchema XML
SET @XsdSchema = (SELECT * FROM Category FOR XML AUTO, ELEMENTS,
XMLSCHEMA('TestXsdSchema'))
SELECT @XsdSchema