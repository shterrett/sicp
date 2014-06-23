; All meetings on that day

(meeting ?division (Friday . ?time))

; rule for names

(rule (meeting-time ?person ?day-and-time)
      (and (job ?person (?division . ?title))
           (meeting ?division (?day . ?time))))

; query with rule

(meeting-time (Hacker Alyssa) ?day-and-time)
