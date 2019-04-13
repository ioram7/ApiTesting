node {

    stage 'build'
        node() {
	    checkout scm
            sh 'whoami'
            sh 'pwd'
            sh 'ls -al'
            sh 'pwd'
            sh 'ls -al'
            sh 'pip3 install -r requirements.txt'      
        }

    stage'test'
        node() {
            sh 'behave --no-capture features'            
        }

    stage'deploy'
        node() {
	    sh 'cd features/'
            sh 'zip -r deploy.zip features'            
        }
        
}
