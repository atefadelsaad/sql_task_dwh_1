CREATE OR ALTER PROCEDURE gold.load_CreditCard
AS
BEGIN 
     MERGE gold.fact_CreditCard AS target
  	 USING silver.CreditCard AS source
	 ON target.CreditCardID = source.CreditCardID
WHEN MATCHED AND
      target.CardType <> source.CardType
	 OR target.CardNumber <> source.CardNumber
	 OR target.ExpMonth <> source.ExpMonth
	 OR target.ExpYear <> source.ExpYear
	 OR target.ModifiedDate <> source.ModifiedDate
THEN 
UPDATE SET
     target.CardType = source.CardType,
	   target.CardNumber = source.CardNumber,
	   target.ExpMonth = source.ExpMonth,
	   target.ExpYear = source.ExpYear,
	   target.ModifiedDate = source.ModifiedDate
WHEN NOT MATCHED BY target
THEN
       INSERT(CreditCardID,CardType,CardNumber,ExpMonth,ExpYear,ModifiedDate,last_update)
	   VALUES(source.CreditCardID,source.CardType,source.CardNumber,source.ExpMonth,source.ExpYear,source.ModifiedDate,GETDATE())
WHEN NOT MATCHED BY source
THEN DELETE
OUTPUT $ACTION,
     inserted.CreditCardID AS I_CreditCardID,
     inserted.CardType AS I_CardType,
     inserted.CardNumber AS I_CardNumber,
     inserted.ExpMonth AS I_ExpMonth,
	   inserted.ExpYear AS I_ModifiedDate,
     inserted.ModifiedDate AS I_ExpMonth,
	   inserted.last_update AS I_last_update,     
	   deleted.CreditCardID AS D_CreditCardID,
     deleted.CardType AS D_CardType,
     deleted.CardNumber AS D_CardNumber,
     deleted.ExpMonth AS D_ExpMonth,
     deleted.ExpYear AS D_ExpYear,
  	 deleted.ModifiedDate AS D_ModifiedDate,
     deleted.last_update AS D_last_update;

END

EXEC gold.load_CreditCard
