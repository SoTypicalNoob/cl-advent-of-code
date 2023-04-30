(defun day-04-1 ()
  (let ((first-min 0)
        (first-max 0)
        (second-min 0)
        (second-max 0)
        (line-list (list))
        (duplicates 0))
    (with-open-file (stream "input-04")
      (loop :for line = (read-line stream nil nil)
            :while line
            :do (progn
                  (setq line-list (split-assignment line))
                  (setq first-min (read-from-string (nth 0 (nth 0 line-list))))
                  (setq first-max (read-from-string (nth 1 (nth 0 line-list))))
                  (setq second-min (read-from-string (nth 0 (nth 1 line-list))))
                  (setq second-max (read-from-string (nth 1 (nth 1 line-list))))
                  (if (or (and (>= first-min second-min)
                               (<= first-max second-max))
                          (and (>= second-min first-min)
                               (<= second-max first-max)))
                      (setq duplicates (+ 1 duplicates))))))
    duplicates))

(defun day-04-2 ()
  (let ((first-min 0)
        (first-max 0)
        (second-min 0)
        (second-max 0)
        (line-list (list))
        (duplicates 0))
    (with-open-file (stream "input-04")
      (loop :for line = (read-line stream nil nil)
            :while line
            :do (progn
                  (setq line-list (split-assignment line))
                  (setq first-min (read-from-string (nth 0 (nth 0 line-list))))
                  (setq first-max (read-from-string (nth 1 (nth 0 line-list))))
                  (setq second-min (read-from-string (nth 0 (nth 1 line-list))))
                  (setq second-max (read-from-string (nth 1 (nth 1 line-list))))
                  (if (or (and (>= first-max second-min)
                               (<= first-max second-max))
                          (and (>= second-max first-min)
                               (<= second-max first-max)))
                      (setq duplicates (+ 1 duplicates))))))
    duplicates))

(defun split-assignment (line)
  (let ((assignment-list (list)))
    (push (uiop:split-string (nth 1 (uiop:split-string line :separator ",")) :separator "-") assignment-list)
    (push (uiop:split-string (nth 0 (uiop:split-string line :separator ",")) :separator "-") assignment-list)
    assignment-list))

;; CL-USER> (uiop:split-string "2-4,6-8" :separator ",")
;; ("2-4" "6-8")
;; CL-USER> (uiop:split-string (nth 1 '("2-4" "6-8")) :separator "-")
;; ("6" "8")