; Ordering accessto shared resources by id
; only prevents deadlock in situations where the
; resources needed are known ahead of time.
; In a situation where future shared resources are
; determined by the result of a calculation involving the
; first shared resource, this cannot work because the
; information is not available.
;
; Consider, for example, a shared hash table that
; associates users with accounts. As this hash table
; is written to, the associations between users and accounts
; are changed. A process must access this table
; to determine which accounts belong to each user, but
; other processes may be writing to it concurrently.
; So if a process wants to change an account association, it
; first must access the hash table and then the account indicated
; but another process may already be accessing/modifying that
; acccount.
