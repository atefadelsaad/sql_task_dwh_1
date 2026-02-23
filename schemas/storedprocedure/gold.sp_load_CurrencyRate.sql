CREATE OR ALTER PROCEDURE gold.load_CurrencyRate
AS
BEGIN
merge gold.dim_CurrencyRate AS target
using silver.CurrencyRate AS source
on target.CurrencyRateID = source.CurrencyRateID
when matched and
   target.CurrencyRateDate <> source.CurrencyRateDate
or target.FromCurrencyCode <> source.FromCurrencyCode 
or target.ToCurrencyCode <> source.ToCurrencyCode 
or target.AverageRate <> source.AverageRate 
or target.EndOfDayRate <> source.EndOfDayRate
or target.total_Rate <> source.total_Rate 
or target.ModifiedDate <> source.ModifiedDate
then update set
	target.CurrencyRateDate = source.CurrencyRateDate,
	target.FromCurrencyCode = source.FromCurrencyCode ,
	target.ToCurrencyCode = source.ToCurrencyCode ,
	target.AverageRate = source.AverageRate ,
	target.EndOfDayRate = source.EndOfDayRate,
	target.total_Rate = source.total_Rate ,
	target.ModifiedDate = source.ModifiedDate
when not matched by target
then 
insert(CurrencyRateID,CurrencyRateDate,FromCurrencyCode,ToCurrencyCode,AverageRate,EndOfDayRate,total_Rate,ModifiedDate,last_date)
values(source.CurrencyRateID,source.CurrencyRateDate,source.FromCurrencyCode,source.ToCurrencyCode,source.AverageRate,source.EndOfDayRate,source.total_Rate,source.ModifiedDate,getdate())
when not matched by source
then delete;

END
EXEC gold.load_CurrencyRate

select * from gold.dim_CurrencyRate
