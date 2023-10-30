--MOSTRAR EL TOTAL DE INVENTARIO POR TIENDA--

SELECT store_id, COUNT(inventory_id) AS total_inventories
FROM inventory
GROUP BY store_id
ORDER BY total_inventories DESC;

--MOSTRAR EL NÚMERO DE ALQUILERES POR ID DE CLIENTE--

SELECT customer_id, COUNT(rental_id) AS num_rentals
FROM rental
GROUP BY customer_id
ORDER BY num_rentals DESC;

-- MOSTRAR EL TÍTULO DE LA PELÍCULA MÁS LARGA --

SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 1;

--LISTAR PELÍCULAS PG O PG-13 Y ORDENARLAS ALFABÉTICAMENTE--

SELECT title, rating
FROM film
WHERE rating IN ('PG', 'PG-13')
ORDER BY title;

-- MOSTRAR LA CANTIDAD DE PELÍCULAS POR CALIFICACIÓN Y ORDENARLAS DESCENDENTE --

SELECT rating, COUNT(film_id) AS num_films
FROM film
GROUP BY rating
ORDER BY num_films DESC;

-- ENCONTRAR LOS ALQUILERES QUE MÁS HAN DURADO Y EL QUE MENOS --

SELECT MAX(DATEDIFF(return_date, rental_date)) AS max_duration,
       MIN(DATEDIFF(return_date, rental_date)) AS min_duration
FROM rental;


