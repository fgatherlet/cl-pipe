# Cl-Pipe - utils to handle unix pipe as stream. sbcl only.

## Synopsis

```
;; install by `ros install fgatherlet/cl-pipe` or something.

(ql:quickload :cl-pipe)
(use-package :cl-pipe)
(with-open-pipe (input-stream output-stream)
  (format output-stream "(+ 1 2) ")
  (finish-output output-stream)
  (read input-stream))
;; (+ 1 2)
```

## Description

This is simple utilities to handle unix pipe as stream.
This uses sb-unix, sb-sys api.
Currently this works only with sbcl.

## API

### function open-pipe -> (values input-stream output-stream)

### function close-pipe input-stream output-stream -> nil

### macro: with-open-pipe input-stream output-stream &body body

## Bugs
This supports only sbcl.

## Author

* fgatherlet (fgatherlet@gmail.com)

## Copyright

Copyright (c) 2019 fgatherlet (fgatherlet@gmail.com)

## License

Licensed under the MIT License.

