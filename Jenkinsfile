node {
    stage 'build'
        node() {
	    checkout scm
            sh 'whoami'
            sh 'pwd'
            sh 'ls -al'
            sh 'pwd'
            sh 'ls -al'
            sh 'pip3 install -r ApiTesting/requirements.txt'      
        }
    stage'test'
        node() {
            sh 'python3 ApiTesting/behave --no-capture'            
        }
}
