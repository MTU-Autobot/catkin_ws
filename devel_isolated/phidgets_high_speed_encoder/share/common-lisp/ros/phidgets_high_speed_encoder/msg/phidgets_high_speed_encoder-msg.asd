
(cl:in-package :asdf)

(defsystem "phidgets_high_speed_encoder-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "EncoderDecimatedSpeed" :depends-on ("_package_EncoderDecimatedSpeed"))
    (:file "_package_EncoderDecimatedSpeed" :depends-on ("_package"))
  ))