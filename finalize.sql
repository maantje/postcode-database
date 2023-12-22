create table addresses as SELECT
    postcode,
    huisnummer as house_number,
    huisletter as addition,
    toevoeging as extension,
    gemeenten.naam as municipality,
    woonplaatsen.naam as city,
    openbare_ruimten.naam as street,
    openbare_ruimten.lange_naam as long_street,
    openbare_ruimten.verkorte_naam as short_street,
    oppervlakte as area,
    gebruiksdoel as usage,
    bouwjaar as built_in,
    latitude,
    longitude
FROM
    adressen
JOIN openbare_ruimten on openbare_ruimten.id = openbare_ruimte_id
JOIN woonplaatsen on woonplaatsen.woonplaats_id = openbare_ruimten.woonplaats_id
JOIN gemeenten on gemeenten.id = woonplaatsen.gemeente_id;


CREATE INDEX search_index ON addresses(postcode,house_number,addition,extension);
DROP TABLE gemeenten;
DROP TABLE provincies;
DROP TABLE woonplaatsen;
DROP TABLE gemeente_woonplaatsen;
DROP TABLE openbare_ruimten;
DROP TABLE nummers;
DROP TABLE panden;
DROP TABLE verblijfsobjecten;
DROP TABLE ligplaatsen;
DROP TABLE standplaatsen;
DROP TABLE adressen;

VACUUM;