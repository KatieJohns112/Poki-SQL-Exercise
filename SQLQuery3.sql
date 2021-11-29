--1 What grades are stored in the database?
SELECT Name FROM Grade;

--2 What emotions may be associated with a poem?
SELECT Name FROM Emotion;

--3 How many poems are in the database?
SELECT COUNT(ID) FROM Poem;

--4 Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT TOP 76 Name FROM Author
ORDER BY Name DESC;

--5 Starting with the above query, add the grade of each of the authors.
SELECT top 76 a.Name, g.Name
FROM Author a 
JOIN Grade g ON a.GradeId = g.Id
ORDER BY a.Name;

--6 Starting with the above query, add the recorded gender of each of the authors.
SELECT top 76 a.Name AuthorsName, g.Name Grade , gen.Name StudentsGender
FROM Author a 
JOIN Grade g ON a.GradeId = g.Id
JOIN Gender gen ON gen.Id = a.GenderId
ORDER BY a.Name;

--7 What is the total number of words in all poems in the database?
SELECT SUM(CharCount) NumberOfWordsForAllPoems
FROM Poem;

--8 Which poem has the fewest characters? (TOP allows you to retun a certain number/percentage based on input)
SELECT top 1 Title, CharCount
FROM Poem
ORDER BY CharCount;

--9 How many authors are in the third grade?
SELECT COUNT(Author.Id) '3rd grade authors'
from Author 
JOIN Grade on Author.GradeId = Grade.Id
WHERE Grade.Name = '3rd Grade';

--10 How many total authors are in the first through third grades?
SELECT COUNT(Author.Id) '1st through 3rd grade authors'
from Author 
JOIN Grade on Author.GradeId = Grade.Id
WHERE Grade.Name = '3rd Grade'
OR Grade.Name = '2nd Grade'
OR Grade.Name = '1st Grade';

--11 What is the total number of poems written by fourth graders?
SELECT COUNT(p.Id) 'poems written by 4th graders'
from Poem p
JOIN Author a ON a.Id = p.AuthorId
JOIN Grade g ON a.GradeId = g.Id
WHERE g.Name = '4th grade';

--12 How many poems are there per grade?
SELECT COUNT(p.Id) 'Poems in each grade', g.name 'Grade'
FROM Poem p
JOIN Author a on a.Id = p.AuthorId
JOIN Grade g on a.GradeId = g.Id
GROUP BY g.Name;

--13 How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT COUNT(a.Id) 'Authors in grade', g.Name 'Authors name'
FROM Author A
JOIN Grade g ON a.GradeId = g.Id
GROUP BY g.Name;

--14 What is the title of the poem that has the most words?
SELECT TOP 1 p.title 'Poem with the most words', p.wordcount
FROM poem p
ORDER BY  p.wordcount DESC;

--15 Which author(s) have the most poems? (Remember authors can have the same name.)

--16 How many poems have an emotion of sadness?
SELECT COUNT(pe.Id) 'Sad Poems'
FROM PoemEmotion pe
JOIN Emotion e ON pe.EmotionId = e.id
WHERE e.Name = 'Sadness';
