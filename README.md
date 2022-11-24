# SQL

<pre>
This was a project for the "Database" class. We were tasked to create a database for a university to manage internships.
</pre>

<br>

We started by creating an *Entity-Relationship* diagram. This diagram is used to plan and organise the logic behind the SQL database. 

<p align="center">
  <img height="500" src="images/Entity_relationship_diagram.png">
</p>

<br>

Each table looks like this :

- Acteur(`Matricule`, NAS)
- Contact(`#NAS`, NumeroPrincipal, NumeroSec, EmailScolaire, EmailPerso)
- Identitee(`#NAS`, Prenom, Nom, Sexe)
- Adresse(`#NAS`, `Num`, `rue`, `ville`)
- Etudiant(`#Matricule`, Dep)
- Professeur(`#Matricule`, Salaire)
- Compagnie(`NoComp`, NomC, Domaine, Description)
- ContactC(`#NoComp`, `NomResponsable`, `Poste`, EmailPrincipal, EmailSec, NumeroPrincipal, NumeroSec)
- Stage(`NoStage`, #MatriculeE, #MatriculeP, #NoComp, Rapport, DateDebut, DateFin)


*#* : represents Foreign keys <br>
`{text}` : represents Primary keys

---

<pre>
The SQL script creating the database can be found in this project as "Script.sql" or "sql.txt".
</pre>

<br>

Furthermore, we were asked to create 4 `SQL Views`. First by writting "Database Algebra" and then transforming it into *SQL*

<br>

### 1 - The first view represents the number of female students that had an internship at Tesla.

<br>

<p align="center">
  <img height="250" src="images/question_1.png">
</p>

`Select count (*)` <br>
`From Acteur as a , Compagnie as c, Identitee as i, Etudiant as e, Stage as s` <br>
`Where i.sexe = 'Femme' AND c.nomC = 'Tesla' and a.nas = i.nas and a.matricule =` <br>
`e.matricule and s.matriculeE = a.matricule;` <br>


<br>

### 2 - Display a single manager as well as their primary email and phone number per company working in the field of finance.

<br>

<p align="center">
  <img height="250" src="images/question_2.png">
</p>

`Select co.NomResponsable, co.NumeroPrincipal, co.EmailPrincipal` <br>
`From Compagnie as c, ContactC as co` <br>
`Where c.Domaine = 'Finance' and c.NoComp = co.NoComp Limit 1;` <br>


<br>

### 3 - Display the report with surname and first name of the students who have completed an internship with Mr. Boyer.

<br>

<p align="center">
  <img height="250" src="images/question_3.png">
</p>

`Select s.Rapport, i.Nom, i.Prenom` <br>
`From Identitee as i, Etudiant as e, Professeur as p` <br>
`Join Acteur as a on (a.NAS = i.NAS AND a.Matricule = e.Matricule AND a.Matricule = p.Matricule)` <br>
`Join Stage as s on (s.MatriculeE = e.Matricule AND s.MatriculeP = p.Matricule)` <br>
`Where i.Nom = ‘Boyer’;` <br>


<br>

### 4 - Give the name of the company, the name of the people in charge and the main number of all internships that start during the month of June 2021.

<br>

<p align="center">
  <img height="250" src="images/question_4.png">
</p>

`Select c.NomC, co.NomResponsable, co.NumeroPrincipal` <br>
`From ContactC as co` <br>
`Join Compagnie as c on co.NoComp = c.NoComp` <br>
`Join Stage as s on c.NoComp = s.NoComp` <br>
`Where s.DateDebut > '2021-06-01';` <br>








