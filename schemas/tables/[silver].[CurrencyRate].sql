DROP TABLE IF EXISTS silver.CurrencyRate
CREATE TABLE silver.CurrencyRate(
	CurrencyRateID int primary key NOT NULL,
	CurrencyRateDate datetime NOT NULL,
	FromCurrencyCode nchar(3) NOT NULL,
	ToCurrencyCode nchar(3) NOT NULL,
	AverageRate money NOT NULL,
	EndOfDayRate money NOT NULL,
	total_Rate money NOT NULL,
	ModifiedDate datetime NOT NULL
)
