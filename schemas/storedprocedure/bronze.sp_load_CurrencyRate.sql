
CREATE OR ALTER PROCEDURE bronze.load_CurrencyRate
AS
BEGIN
     INSERT INTO db_Atef.bronze.erp_CurrencyRate
	   SELECT * FROM AdventureWorks2022.Sales.CurrencyRate
END
EXEC bronze.load_CurrencyRate
