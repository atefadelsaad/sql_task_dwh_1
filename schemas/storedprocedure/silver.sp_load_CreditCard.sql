CREATE OR ALTER PROCEDURE silver.load_CreditCard
AS
BEGIN
	INSERT INTO silver.CreditCard(
		CreditCardID,
       	CardType,
		CardNumber,
		ExpMonth,
		ExpYear,
		ModifiedDate
	    )
     SELECT 
	 CreditCardID,
	 TRIM(CardType) AS CardType,
	 TRIM(CardNumber) AS CardNumber,
	 CAST(ExpMonth AS INT) AS ExpMonth,
	 ExpYear,
	 CAST(ModifiedDate AS DATE) AS ModifiedDate
	 FROM bronze.erp_CreditCard
END
EXEC silver.load_CreditCard
