#|
  This file is a part of cl-pipe project.
  Copyright (c) 2019 fgatherlet (fgatherlet@gmail.com)
|#

#|
  utils to handle unix pipe as stream. sbcl only.

  Author: fgatherlet (fgatherlet@gmail.com)
|#

(defsystem "cl-pipe"
  :version "0.1.0"
  :author "fgatherlet"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "main" :depends-on ("package"))
                 )))
  :description "utils to handle unix pipe as stream. sbcl only."
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "cl-pipe-test"))))
