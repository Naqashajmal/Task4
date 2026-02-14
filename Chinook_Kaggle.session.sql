SELECT 
    t.Name AS SongName, 
    SUM(il.Quantity) AS TotalSold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY TotalSold DESC
LIMIT 10;

SELECT 
    BillingCountry, 
    SUM(Total) AS TotalRevenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalRevenue DESC;

SELECT 
    strftime('%Y-%m', InvoiceDate) AS Month, 
    SUM(Total) AS MonthlyRevenue
FROM Invoice
GROUP BY Month
ORDER BY Month ASC;

SELECT 
    Name, 
    TotalSales,
    RANK() OVER (ORDER BY TotalSales DESC) as SalesRank
FROM (
    SELECT t.Name, SUM(il.Quantity) as TotalSales
    FROM InvoiceLine il
    JOIN Track t ON il.TrackId = t.TrackId
    GROUP BY t.Name
)
LIMIT 10;