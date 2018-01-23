docker run \
-v /home/ec2-user/SageMaker/CNTK_KERAS_SAGEMAKER/container/setup:/data \
-v /home/ec2-user/SageMaker/CNTK_KERAS_SAGEMAKER/container/context:/opt/ml \
-p 8080:8080 \
--rm \
cntkdemo \
$1
# if you are testing locally, to avoid continous image rebuilds replace
# $1 
# with 
# python /data/$1
