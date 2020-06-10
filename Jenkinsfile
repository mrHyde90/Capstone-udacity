pipeline {
     agent any
     stages {
         stage('Build') {
             steps {
                 sh 'echo "Hello World and U crazy little programmer"'
                 sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                 '''
             }
         }
	 stage('ansible Build') {
	     steps {
		 sh 'docker build -t simple-nginx . '
	     }
	 }
     }
}
