
CREATE OR ALTER PROCEDURE silver.load_CurrencyRate
AS
BEGIN
	INSERT INTO silver.CurrencyRate
	SELECT 
		CurrencyRateID,
		CAST(CurrencyRateDate AS DATE) AS CurrencyRateDate,
		TRIM(FromCurrencyCode) AS FromCurrencyCode,
		TRIM(ToCurrencyCode) AS ToCurrencyCode,
		AverageRate,
		EndOfDayRate,
		CASE WHEN AverageRate IS NULL OR EndOfDayRate IS NULL 
			 THEN 0
			 ELSE AverageRate + EndOfDayRate
		END total_Rate,
		CAST(ModifiedDate AS DATE) AS ModifiedDate
	FROM bronze.erp_CurrencyRate
END

EXEC silver.load_CurrencyRate
