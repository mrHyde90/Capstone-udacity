pipeline {
     agent any
     stages {
         stage('Linting') {
             steps {
                 sh 'echo "Hello World and U crazy little programmer"'
                 sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                 '''
             }
         }
	 stage('Build docker image') {
	     steps {
		 sh './run_docker.sh '
	     }
	 }
	 stage('Upload docker image to docker hub') {
	     steps {
		sh './upload_docker.sh'
	     }
	 }
     }
}
