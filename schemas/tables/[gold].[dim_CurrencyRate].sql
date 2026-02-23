DROP TABLE IF EXISTS gold.dim_CurrencyRate
CREATE TABLE gold.dim_CurrencyRate(
	CurrencyRateID int primary key NOT NULL,
	CurrencyRateDate datetime NOT NULL,
	FromCurrencyCode nchar(3) NOT NULL,
	ToCurrencyCode nchar(3) NOT NULL,
	AverageRate money NOT NULL,
	EndOfDayRate money NOT NULL,
	total_Rate money NOT NULL,
	ModifiedDate DATE NOT NULL,
	last_date datetime NOT NULL
)
