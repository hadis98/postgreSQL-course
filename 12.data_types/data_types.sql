SELECT 2 + 2;
--integer
SELECT (2);
--integer
SELECT (2.0) --numeric
SELECT (2.0::integer);
--integer   int4
SELECT (2.0::SMALLINT);
--smallinteger int2
-- error!!! because its out of SMALLINT range
SELECT (999999::SMALLINT);
SELECT (1.88888::REAL -1.88887::REAL);
SELECT (1.88888::DECIMAL -1.88887::DECIMAL);
SELECT (1.88888::NUMERIC -1.88887::NUMERIC);
SELECT ('ADLFKJAS;DLFSDF'::CHAR(3));
SELECT ('HI'::CHAR(3));
SELECT ('y'::BOOLEAN);
SELECT ('F'::BOOLEAN);
SELECT ('f'::BOOLEAN);
SELECT ('n'::BOOLEAN);
SELECT (0::BOOLEAN);
SELECT (NULL::BOOLEAN);   --NULL
SELECT ('1 D 12 H 1 M 15S'::interval)
SELECT ('1 D 12 H 1 M 15S'::interval) - ('1 D '::interval)
SELECT
     ('NOV-20-1970 1:23 AM EST'::timestamp with time zone)
         -
     ('1 D'::interval);

SELECT
     ('NOV-20-1970 1:23 AM EST'::timestamp with time zone)
         -
     ('NOV-7-1970 1:23 AM EST'::timestamp with time zone)


-- DIFFRENT time zone
SELECT
     ('NOV-20-1970 1:23 AM EST'::timestamp with time zone)
         -
     ('NOV-7-1970 6:53 AM PST'::timestamp with time zone)
