#|
  This file is a part of cl-pipe project.
  Copyright (c) 2019 fgatherlet (fgatherlet@gmail.com)
|#

(defsystem "cl-pipe-test"
  :defsystem-depends-on ("prove-asdf")
  :author "fgatherlet"
  :license "MIT"
  :depends-on ("cl-pipe"
               "prove")
  :components ((:module "t"
                :components
                ((:test-file "test"))))
  :description "Test system for cl-pipe"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
