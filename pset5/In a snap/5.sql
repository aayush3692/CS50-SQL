select f1.friend_id as 'mutual_friends' from friends f1
join friends f2 on f1.friend_id = f2.friend_id
where f1.user_id = (
    select id from users where username = 'exceptionalinspiration482'
)and
f2.user_id = (
    select id from users
        where username = 'lovelytrust487'
);
