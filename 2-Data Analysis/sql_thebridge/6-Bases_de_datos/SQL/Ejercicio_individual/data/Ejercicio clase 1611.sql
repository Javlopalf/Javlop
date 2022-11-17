/*Ejercicio Chinook SQL */

select distinct Country 
from customer;

/* Sacar clientes Brasil */
select *
from customer 
where Country = 'Brazil';

/* 2. Empleados agentes de ventas */
SELECT  *
FROM employee
WHERE Title = 'Sales Support Agent';

/* 3. Canciones ACDC */

SELECT DISTINCT Composer
FROM Track;

select * 
from Track
where composer = 'AC/DC';

/*4 . Clientes que no sean de USA */

select  *
from customer
where  country != 'USA';
  
/*5. Clientes agente ventas */

SELECT  FirstName, LastName, Address, City, State, Country,  Email
FROM employee
WHERE Title = 'Sales Support Agent';

/* 6. Paises que han facturado */

select  distinct BillingCountry  
from invoice;

/* 7. Estados de USA de donde son los clientes */

select  distinct state
from customer
where country = 'USA';

/* 8. Articulos factura 37 */

select *
from invoiceline
where InvoiceId = '37';

/* 9. Canciones ACDC */ 

select * 
from Track
where composer = 'AC/DC';

/* 10. Facturas */

select  InvoiceId, Quantity 
from invoiceline;

/* 11. facturas de cada pais */

select BillingCountry, count(InvoiceId)
from invoice
group by BillingCountry;

/*12 Facturas 2009 y 2011 */
select InvoiceDate
from invoice
where Year(InvoiceDate) = 2009 or Year(InvoiceDate) = 2011;

/*13*/
select InvoiceDate
from invoice
where Year(InvoiceDate) between 2009 and 2011;

/*14*/

select count(CustomerId), Country
from customer
where Country = 'Spain' or Country = 'Brazil' 
group by Country;

/*15*/
select Name
from track 
where Name like 'You%';



select *
from track
limit 50 ;

select * 
from genre;

select *
from track as t 
inner join genre as g
on t.GenreId = g.GenreId;

/* 2.1. Clientes Brasil, Nombre, ID factura , fecha y pais */

select customer.CustomerId, customer.FirstName, customer.LastName, customer.Country, invoice.CustomerId, invoice.InvoiceDate, invoice.BillingCountry 
from customer
left join invoice 
on customer.customerId = invoice.CustomerId
where Country = 'Brazil';


/*2.2 */

select BillingCountry, count(InvoiceId)
from invoice
where BillingCountry = 'Brazil';


/*2.3*/

select customer.CustomerId,customer.FirstName, customer.LastName, customer.SupportRepId, employee.EmployeeId,employee.FirstName, employee.LastName, employee.Title
from customer 
left join employee
on customer.SupportRepId = employee.EmployeeId
left join invoice
select customer.CustomerId,customer.FirstName, customer.LastName, customer.SupportRepId, employee.EmployeeId,employee.FirstName, employee.LastName, employee.Title
from customer 
left join employee
on customer.SupportRepId = employee.EmployeeId
left join invoice
on customer.CustomerId = invoice.CustomerId;

/*2.4*/

select employee.EmployeeId, employee.FirstName, employee.Lastname, customer.CustomerId, customer.FirstName,  customer.LastName, customer.Country, customer.SupportRepId, invoice.Total
from employee
left join customer
on employee.EmployeeId = customer.SupportRepId
left join invoice
on customer.CustomerId = invoice.CustomerId;


/*2.5*/

select  invoiceline.TrackId, track.TrackId, track.Name, invoiceline.Unitprice
from invoiceLine
left join track
on track.TrackId = invoiceline.TrackId;

/*2.6*/

SELECT track.TrackId, track.Name, track.AlbumId, track.GenreId, genre.GenreId, album.AlbumId,mediatype.MediaTypeId,mediatype.Name
from track
left join genre
on track.GenreId = genre.GenreId
left join mediatype
on mediatype.MediaTypeId = track.MediaTypeId
left join album
on album.AlbumId = track.AlbumId;

/*2.7*/

select playlist.PlaylistId, playlist.name, playlisttrack.PlaylistId, playlisttrack.TrackId, track.TrackId, 
from playlist
left join playlisttrack
on playlisttrack.PlaylistId = playlist.PlaylistId
left join track 
on track.TrackId = playlisttrack.TrackId;

/* 2.8*/

select employee.FirstName, employee.LastName, employee.Title, employee.EmployeeId, customer.SupportRepId, customer.CustomerId, invoice.InvoiceId, invoice.Total, invoiceline.InvoiceLineId, invoiceline.Quantity
from employee
left join customer
on employee.EmployeeId = customer.SupportRepId
left join invoice 
on customer.CustomerId = invoice.InvoiceId
left join invoiceline
on invoice.InvoiceId = invoiceline.InvoiceLineId;

/* 2.9*/ 


select employee.FirstName, employee.LastName, employee.Title, employee.EmployeeId, customer.SupportRepId, customer.CustomerId, invoice.InvoiceId, invoice.Total, invoiceline.InvoiceLineId, invoiceline.Quantity
from employee
left join customer
on employee.EmployeeId = customer.SupportRepId
left join invoice 
on customer.CustomerId = invoice.InvoiceId
left join invoiceline
on invoice.InvoiceId = invoiceline.InvoiceLineId;



/* 2.10*/


SELECT DISTINCT artist.ArtistId, artist.Name, album.AlbumId, track.TrackId, invoiceline.Quantity,invoiceline.InvoiceId
FROM artist
LEFT JOIN album
on artist.ArtistId = album.ArtistId
LEFT JOIN track
on album.AlbumId = track.TrackId
LEFT JOIN invoiceline
on track.TrackId = invoiceline.TrackId;