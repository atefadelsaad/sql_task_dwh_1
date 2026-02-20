CREATE OR ALTER TRIGGER bronze.trg_CreditCard_audit
    ON bronze.erp_CreditCard
	AFTER INSERT,DELETE
	AS
	BEGIN
	  INSERT INTO bronze.erp_CreditCard_audit(
	     CreditCardID,
		 CardType,
		 CardNumber,
		 ExpMonth,
		 ExpYear,
		 ModifiedDate,
		 last_date,
		 action
	  )
	  SELECT 
	     CreditCardID,
		 CardType,
		 CardNumber,
		 ExpMonth,
		 ExpYear,
		 ModifiedDate,
		 GETDATE(),
		 'INS'
	  FROM inserted
	     UNION ALL
      SELECT 
	     CreditCardID,
		 CardType,
		 CardNumber,
		 ExpMonth,
		 ExpYear,
		 ModifiedDate,
		 GETDATE(),
		 'DEL'
      FROM deleted
	END
SELECT * FROM bronze.erp_CreditCard_audit    
