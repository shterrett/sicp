(define (get-record file div)
  ((get 'record div) file))

(define (get-salary record div)
  ((get 'salary div) record))

(define (find-file name files)
  (define (emp-name file)
    ((get 'name (tag file)) file))
  (if (eq? (emp-name (car files) name) (car files))
    (find-file (cdr files))))

; New divisions will have to have their structure indexed
; in the table of division/operation
; and a set of accessors for all of their data will have to be written
; and installed to those locations
