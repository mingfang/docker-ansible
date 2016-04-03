node {
   stage 'Checkout'
   checkout scm
   
   stage 'Pull Ubuntu'
   sh "docker pull ubuntu:14.04"

   stage 'Build'
   sh "./build --no-cache" 

   stage 'Push'
   sh "bash -x ./push"   
}
