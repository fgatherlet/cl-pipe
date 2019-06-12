(in-package :cl-pipe)

(defun open-pipe (&key (element-type 'base-char))
  (let (input-fd output-fd)
    (multiple-value-setq (input-fd output-fd) (sb-unix:unix-pipe))
    (values (sb-sys:make-fd-stream input-fd :input t :element-type element-type)
            (sb-sys:make-fd-stream output-fd :output t :element-type element-type))))

(defun close-pipe (input-stream output-stream)
  (let ((input-fd (sb-sys:fd-stream-fd input-stream))
        (output-fd (sb-sys:fd-stream-fd output-stream)))
    (close input-stream)
    (close output-stream)
    (sb-unix:unix-close input-fd)
    (sb-unix:unix-close output-fd)))

(defmacro with-open-pipe ((input-stream output-stream &key (element-type 'base-char)) &body body)
  `(let (,input-stream ,output-stream)
     (unwind-protect
          (progn
            (multiple-value-setq (,input-stream ,output-stream) (open-pipe :element-type ',element-type))
            ,@body)
       (close-pipe ,input-stream ,output-stream))))

#+nil(defmacro with-open-pipe ((input-stream output-stream) &body body)
       (let ((input-fd (gensym "INPUT-FD"))
             (output-fd (gensym "OUTPUT-FD")))
         `(let (,input-fd
                ,output-fd
                ,input-stream
                ,output-stream)
            (unwind-protect
                 (progn
                   (multiple-value-setq (,input-fd ,output-fd) (sb-unix:unix-pipe))
                   (setf ,input-stream (sb-sys:make-fd-stream ,input-fd :input t)
                         ,output-stream (sb-sys:make-fd-stream ,output-fd :output t))
                   ,@body)
              (when ,input-stream (close ,input-stream))
              (when ,output-stream (close ,output-stream))
              (when ,output-fd (sb-unix:unix-close ,output-fd))
              (when ,input-fd (sb-unix:unix-close ,input-fd))))))
