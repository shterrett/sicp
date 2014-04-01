; by not serializing balance, it may be read during a transaction
; this will cause it to return an amount that is correct for
; that point in time, but not accurately reflecting the transaction
; in progress. However, because withdraw and deposit are serialized,
; someone attempting to act on inaccurate information is still
; protected.
