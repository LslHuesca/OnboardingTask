--TASK 1a

SELECT OwnerId AS OwnersId
	, PropertyId AS PropertyId
	, Name AS PropertyName
FROM dbo.OwnerProperty
JOIN dbo.Owners
ON dbo.OwnerProperty.OwnerId=Owners.Id
JOIN dbo.Property
ON dbo.OwnerProperty.PropertyId=dbo.Property.Id
WHERE Owners.Id=1426;

--TASK 1b

SELECT dbo.OwnerProperty.PropertyId AS PropertyId
	, Name AS PropertyName
	, CurrentHomeValue
FROM dbo.OwnerProperty
JOIN dbo.Owners
ON dbo.OwnerProperty.OwnerId=Owners.Id
JOIN dbo.Property
ON dbo.OwnerProperty.PropertyId=dbo.Property.Id
JOIN dbo.PropertyFinance
ON dbo.Property.Id=dbo.PropertyFinance.PropertyId
WHERE Owners.Id=1426
ORDER BY PropertyName ASC;

--TASK 1c

SELECT dbo.Property.Name AS PropertyName
	, PaymentAmount AS RentalPaymentAmount
	, dbo.TargetRentType.Name AS RentalFrequency
	, StartDate AS TenantStartDate
	, EndDate AS TenantEndDate
	, TotalPayments= PaymentAmount*DATEDIFF(WEEK,StartDate, EndDate)
	, Yield
FROM dbo.OwnerProperty
JOIN dbo.Owners
ON dbo.OwnerProperty.OwnerId=Owners.Id
JOIN dbo.Property
ON dbo.OwnerProperty.PropertyId=dbo.Property.Id
JOIN dbo.PropertyFinance
ON dbo.Property.Id=dbo.PropertyFinance.PropertyId
JOIN dbo.PropertyRentalPayment
ON dbo.Property.Id=dbo.PropertyRentalPayment.PropertyId
JOIN dbo.TenantProperty
ON dbo.Property.Id=dbo.TenantProperty.PropertyId
JOIN dbo.TargetRentType
ON dbo.PropertyRentalPayment.FrequencyType=dbo.TargetRentType.Id
WHERE Owners.Id=1426
ORDER BY PropertyName ASC;

--TASK 1d

SELECT JobDescription AS JobsAvailable
	, Status AS JobStatus
FROM dbo.Job
JOIN dbo.JobStatus
ON dbo.Job.JobStatusId=dbo.JobStatus.Id
WHERE JobStatusId =1 OR JobStatusId = 3
ORDER BY JobStatusId ASC;

--TASK 1e

SELECT dbo.Property.Name AS PropertyName
	, (SELECT FirstName 
		FROM dbo.Person 
		WHERE dbo.OwnerProperty.Id=dbo.Person.Id) AS FirstName
	, (SELECT LastName 
		FROM dbo.Person 
		WHERE dbo.OwnerProperty.Id=dbo.Person.Id) AS LastName
	, WeeklyRentalPayments= (Amount*1)
	, ForthnightRentalPayments= (Amount*2)
	, MonthlyRentalPayments= (Amount*4)
FROM dbo.OwnerProperty
JOIN dbo.Owners
ON dbo.OwnerProperty.OwnerId=Owners.Id
JOIN dbo.Property
ON dbo.OwnerProperty.PropertyId=dbo.Property.Id
JOIN dbo.PropertyHomeValue
ON dbo.Property.Id=dbo.PropertyHomeValue.PropertyId
JOIN dbo.PropertyRentalPayment
ON dbo.Property.Id=dbo.PropertyRentalPayment.PropertyId
JOIN dbo.TenantProperty
ON dbo.Property.Id=dbo.TenantProperty.PropertyId
JOIN dbo.TargetRentType
ON dbo.PropertyRentalPayment.FrequencyType=dbo.TargetRentType.Id
WHERE Owners.Id=1426
ORDER BY PropertyName ASC;