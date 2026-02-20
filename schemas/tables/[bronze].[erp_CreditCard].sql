DROP TABLE IF EXISTS bronze.erp_CreditCard
CREATE TABLE bronze.erp_CreditCard(
	CreditCardID int primary key  NOT NULL,
	CardType nvarchar(50) NOT NULL,
	CardNumber nvarchar(25) NOT NULL,
	ExpMonth tinyint NOT NULL,
	ExpYear smallint NOT NULL,
	ModifiedDate datetime NOT NULL
)
