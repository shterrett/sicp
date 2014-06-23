(rule (replace ?replaceable ?replacement)
      (and
        (not (same ?replaceable ?replacement))
        (or (and (job ?replaceable ?job)
                 (job ?replacement ?job))
            (and (job ?replaceable ?replaceable-job)
                 (job ?replacement ?replacement-job)
                 (can-do-job ?replacement-job ?replaceable-job)))))

; can replae Cy D. Fect
(and (job ?person ?job)
     (job (Fect Cy D.) ?cdf-job)
     (replace (Fect Cy D.) ?person))

; can replace person paid more
(and (job ?lower ?lower-job)
     (job ?higher ?higher-job)
     (replace ?higher ?lower)
     (salary ?lower ?lower-salary)
     (salary ?higher ?higher-salary))
