pipeline {
     environment {
	 registry = "wolusiter1990/udacity_capstone"
	 registryCredential = 'dockerhub'
     }

     agent any
     stages {
         stage('Linting') {
             steps {
                 sh 'echo "Hello World and U crazy little programmer"'
		 sh 'tidy -q -e *.html'
             }
         }
	 stage('Build docker image') {
	     steps {
		 sh './run_docker.sh '
	     }
	 }
	 stage('Upload docker image to docker hub') {
	     steps {
	       script {
		 docker.withRegistry('', registryCredential) {
		   sh './upload_docker.sh'
		 }
	       }
	     }
	 }
	 stage('Set kubectl context') {
			steps {
				withAWS(region:'us-west-2', credentials:'ND_Cloud') {
					sh '''
						kubectl config use-context arn:aws:eks:us-east-1:142977788479:cluster/capstonecluster
					'''
				}
			}
		}

		stage('Deploy blue controller') {
			steps {
				withAWS(region:'us-west-2', credentials:'ND_Cloud') {
					sh '''
						kubectl apply -f ./blue-controller.json
					'''
				}
			}
		}

		stage('Deploy green controller') {
			steps {
				withAWS(region:'us-west-2', credentials:'ND_Cloud') {
					sh '''
						kubectl apply -f ./green-controller.json
					'''
				}
			}
		}

		stage('Create blue service') {
			steps {
				withAWS(region:'us-west-2', credentials:'ND_Cloud') {
					sh '''
						kubectl apply -f ./blue-service.json
					'''
				}
			}
		}

		stage('Wait ') {
            		steps {
                		input "Change traffic?"
            		}
        	}

		stage('Create green service') {
			steps {
				withAWS(region:'us-west-2', credentials:'ND_Cloud') {
					sh '''
						kubectl apply -f ./green-service.json
					'''
				}
			}
		}
     }
}
