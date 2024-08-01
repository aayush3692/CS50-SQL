update "users" set "password" = '982c0381c279d139fd221fce974916e7' where "username" = "admin";


update "user_logs" set "new_password" =(
    select "password" from "users"
    where "username" = 'emily33'
)
where type = 'update'
and "old_username" = 'admin';
