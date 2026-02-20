DROP TABLE IF EXISTS silver.CreditCard
CREATE TABLE silver.CreditCard (
   	CreditCardID int primary key  NOT NULL,
	CardType nvarchar(50) NOT NULL,
	CardNumber nvarchar(25) NOT NULL,
	ExpMonth tinyint NOT NULL,
	ExpYear smallint NOT NULL,
	ModifiedDate datetime NOT NULL
    )
