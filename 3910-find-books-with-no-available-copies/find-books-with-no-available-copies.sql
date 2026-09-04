# Write your MySQL query statement below

SELECT 
l.book_id,
l.title,
l.author,
l.genre,
l.publication_year,
l.total_copies AS current_borrowers

FROM 
Library_books AS l
JOIN
Borrowing_records AS b
USING(book_id)
WHERE b.return_date IS NULL
GROUP BY l.book_id
HAVING COUNT(*) = l.total_copies
ORDER BY current_borrowers DESC, l.title