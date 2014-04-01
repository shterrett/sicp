; knowing in advance which accounts it will access,
; by always attempting to acquire the lowest numbered account first,
; any competing processes will always attempt to acquire the same
; account. This ensures that process A cannot grab account X first,
; while process B grabs account Y - both A and B will attempt to
; grab X.

(define (serialized-exchange account-1 account-2)
  (define (make-exchange s1 s2 a1 a2)
    (s1 (s2 exchange)
        a1
        a2))
  (cond ((< (account-1 'id) (account-2 'id))
          (let ((serializer-1 (account-1 'serializer))
                (serializer-2 (account-2 'serializer)))
            (make-exchange serializer-1 serializer-2 account-1 account-2)))
        (else
          (let ((serializer-1 (account-2 'serializer))
                (serializer-2 (account-1 'serializer)))
            (make-exchange serializer-1 serializer-2 account-1 account-2)))))
