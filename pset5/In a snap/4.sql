select "username" from "users"
JOIN (
    SELECT "to_user_id"
    FROM "messages"
    GROUP BY("to_user_id")
    ORDER BY(COUNT("to_user_id")) desc
    LIMIT 1
)AS most_messages ON users.id = most_messages.to_user_id;
