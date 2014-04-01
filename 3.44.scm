; This is not sufficent - if two operations make near
; simultaneous requests to from-account, they will each read
; the same balance, and can withdraw from that. After the withdraw operation,
; the account's balance will be incorrect for the second operation,
; which will not be rejected becuase it already has a separate reference
; to the account, and is proceeding independently.
