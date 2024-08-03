SELECT "to_user_id" FROM "messages"
WHERE from_user_id = (
    select "id" FROM "users"
    WHERE "username" = 'creativewisdom377'
)
GROUP BY("to_user_id")
ORDER BY (COUNT("id")) DESC
LIMIT 3;

/*EXPLAIN QUERY PLAN
SELECT "to_user_id" FROM "messages"
WHERE from_user_id = (
    select "id" FROM "users"
    WHERE "username" = 'creativewisdom377'
)
GROUP BY("to_user_id")
ORDER BY (COUNT("id")) DESC
LIMIT 3;*/


