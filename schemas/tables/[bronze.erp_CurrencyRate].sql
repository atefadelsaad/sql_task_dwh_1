DROP TABLE IF EXISTS bronze.erp_CurrencyRate
CREATE TABLE bronze.erp_CurrencyRate(
	CurrencyRateID int primary key NOT NULL,
	CurrencyRateDate datetime NOT NULL,
	FromCurrencyCode nchar(3) NOT NULL,
	ToCurrencyCode nchar(3) NOT NULL,
	AverageRate money NOT NULL,
	EndOfDayRate money NOT NULL,
	ModifiedDate datetime NOT NULL
)
