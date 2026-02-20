
CREATE OR ALTER PROCEDURE bronze.load_CreditCard
	AS
	BEGIN
		  INSERT INTO TEST.bronze.erp_CreditCard
		  SELECT * FROM AdventureWorks2022.Sales.CreditCard   
	END
	EXEC bronze.load_CreditCard
