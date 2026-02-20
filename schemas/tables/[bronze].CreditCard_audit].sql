
DROP TABLE IF EXISTS bronze.erp_CreditCard_audit
CREATE TABLE bronze.erp_CreditCard_audit(
  id_erp int IDENTITY(1,1) primary key NOT NULL,
	CreditCardID int  NOT NULL,
	CardType nvarchar(50) NOT NULL,
	CardNumber nvarchar(25) NOT NULL,
	ExpMonth tinyint NOT NULL,
	ExpYear smallint NOT NULL,
	ModifiedDate datetime NOT NULL,
	last_date datetime NOT NULL,
	action char(3) NOT NULL
	CHECK(action = 'INS' OR action = 'DEL')
)
