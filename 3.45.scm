; The exchange will be serialized with a different serializer
; than the deposits/withdraws. This means that while two simultaneous exchnages
; are protected, and two simultaneous deposit/withdraws are protected,
; an exchange simultaneous with a withdraw can happen without protection.
; Each serializer will control access to its method, but the two of them
; will have simultaneous access because they don't know about the other methods.
