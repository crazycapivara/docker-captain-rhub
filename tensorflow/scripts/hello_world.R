library(tensorflow)

sess = tf$Session()
hello <- tf$constant('Hello, TensorFlow!')
sess$run(hello)

