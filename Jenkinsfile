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
            sh 'behave --no-capture /var/jenkins_home/workspace/pipeline@2/features'            
        }
    stage'deploy'
        node() {
            sh 'zip -r deploy.zip /var/jenkins_home/workspace/pipeline@2'
	    sh 'git add /var/jenkins_home/workspace/pipeline@2/deploy.zip'
	    sh 'git commit'
	    sh 'git pull '		
		
        }
}
