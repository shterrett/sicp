; grandson
(rule (grandson ?s ?g)
      (and (son (?s ?f))
           (son (?f ?g))))

; mother-father-son
(rule (male-parent ?s ?f)
      (and (wife ?f ?m)
           (son ?m ?s)))
