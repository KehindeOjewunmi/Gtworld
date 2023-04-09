//Building Declarative pipeline via standalone static library code file saved in app specific git repository 

pipeline{
  agent any
  environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-west-2"
  }
  tools{
    maven "maven3.8.7"
  }
  stages{
    stage("A.CodeClone"){
      steps{
        sh "echo This stage performs git clone action"
        git credentialsId: 'Github-Cred', url: 'https://github.com/KehindeOjewunmi/Gtworld-app.git'
      }
    }
    stage("B.Buildcode"){
      steps{
        sh "echo code is being built"
        sh "mvn clean package"
      }
    }
    stage("C.CodeCheck"){
      steps{
        sh "echo codequality is being checked"
        sh "mvn sonar:sonar"
      }
    }
    stage("D.ArtifactBackup"){
      steps{
        sh "echo performing artifact back up to nexus"
        sh "mvn deploy"
      }
    }
    stage('Build Docker Image'){
      steps{
            sh 'docker build -t kehindeojewunmi/kubernetes .'
            }
        }
    stage('Push Image'){
      steps{
            sh 'docker login -u kehindeojewunmi -p dckr_pat_JK_ZP5z1Kk4DnGvBKgME68J3CGA'
                
            sh 'docker push kehindeojewunmi/kubernetes'
            }
        }
    stage("Deploy to EKS") {
      steps {
            sh "aws eks update-kubeconfig --name demo-cluster"
            sh "kubectl apply -f deploymentservice.yaml"
            }
        }
}
}