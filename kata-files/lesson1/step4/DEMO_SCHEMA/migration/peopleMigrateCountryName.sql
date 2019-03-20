//// CHANGE name="migrate" includeDependencies="Person.addressCountry_id"
UPDATE Person p
SET addressCountry_id = (SELECT c.id FROM Country c WHERE c.name = p.addressCountryName)
GO
