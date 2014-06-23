; grandson
(rule (grandson ?s ?g)
      (and (son (?s ?f))
           (son (?f ?g))))

; mother-father-son
(rule (male-parent ?s ?f)
      (and (wife ?f ?m)
           (son ?m ?s)))

; greats
(rule (greats (great . ?rel) ?ggf ?ggs)
      (and (?rel ?ggs ?gf)
           (son ?gs ?gf)))
