;;;; I have no idea what I'm doing but it feels like progress

;;; Read ALL the file. Into a string, if you'd be so kind.
(defun read-all (filename)
  (with-open-file (stream filename)
    (read-entire-stream stream)))

;;; Read an entire stream as a string
(defun read-entire-stream (stream)
  (let ((seq (make-string (file-length stream))))
    (read-sequence seq stream)
    seq))

;;; Prepare a string to be put in the hash table
(defun prepare-markov-data (a-string)
  (words (chomp a-string)))

;;; Make newlines into spaces
(defun chomp (a-string)
  (substitute '\n' ' ' a-string))

;;; Split a string by spaces
(defun words (a-string)
  (split-sequence ' ' a-string))
