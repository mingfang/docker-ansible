node {
   stage 'Checkout'
   checkout scm

   stage 'Build'
   sh "./build --cache" 

   stage 'Push'
   sh "bash -x ./push"   
}
