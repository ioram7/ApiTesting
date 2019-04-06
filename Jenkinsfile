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
	    sh 'cd /var/jenkins_home/workspace/pipeline@2/features/'
            sh 'zip -r deploy.zip /var/jenkins_home/workspace/pipeline@2/features'
            sh 'python3 /var/jenkins_home/workspace/pipeline@2/features/upload_file.py'
        }
        
}
