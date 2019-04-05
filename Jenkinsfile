node {
    stage 'build'
        node() {
	    checkout scm
            sh 'whoami'
            sh 'pwd'
            sh 'ls -al'
            sh 'pwd'
            sh 'ls -al'
            sh 'pip3 install -r /var/jenkins_home/workspace/pipeline@2/requirements.txt'      
        }
    stage'test'
        node() {
            sh 'python3 /var/jenkins_home/workspace/pipeline@2/behave --no-capture'            
        }
}
