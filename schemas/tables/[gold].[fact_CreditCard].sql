
DROP TABLE IF EXISTS gold.fact_CreditCard
CREATE TABLE gold.fact_CreditCard(
   	CreditCardID int primary key  NOT NULL,
	CardType nvarchar(50) NOT NULL,
	CardNumber nvarchar(25) NOT NULL,
	ExpMonth tinyint NOT NULL,
	ExpYear smallint NOT NULL,
	ModifiedDate datetime NOT NULL,
	last_update DATETIME
   )
