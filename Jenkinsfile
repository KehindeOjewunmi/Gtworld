//Building Declarative pipeline via standalone static library code file saved in app specific git repository 

pipeline{
  agent any
  // environment {
  //       AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
  //       AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
  //       AWS_DEFAULT_REGION = "us-west-2"
  // }
  tools{
    maven "maven3.8.7"
  }
  stages{
    // stage("Create an EKS Cluster") {
    //         steps {
    //             script {
    //                 dir('terraform') {
    //                     // sh "terraform init"
    //                     sh "terraform destroy -auto-approve"
    //                     // sh "terraform init"
    //                     // sh "terraform apply -auto-approve"
    //                 }
    //             }
    //         }
    //     }
    stage("A.CodeClone"){
      steps{
        sh "echo This stage performs git clone action"
        git credentialsId: 'Github-Cred', url: 'https://github.com/KehindeOjewunmi/Gtworld-app.git'
      }
    }
    // stage("B.Buildcode"){
    //   steps{
    //     sh "echo code is being built"
    //     sh "mvn clean package"
    //   }
    // }
    // stage("C.CodeCheck"){
    //   steps{
    //     sh "echo codequality is being checked"
    //     sh "mvn sonar:sonar"
    //   }
    // }
    // // stage("D.ArtifactBackup"){
    // //   steps{
    // //     sh "echo performing artifact back up to nexus"
    // //     sh "mvn deploy"
    // //   }
    // // }
    // stage('Build Docker Image'){
    //   steps{
    //         sh 'docker build -t kehindeojewunmi/naitdemo .'
    //         }
    //     }
    // stage('Push Image'){
    //   steps{
    //         sh 'docker login -u kehindeojewunmi -p dckr_pat_tvQq3rU_Rok_lJvRwM9LH6805PQ'
                
    //         sh 'docker push kehindeojewunmi/naitdemo'
    //         }
    //     }
    stage('Deploy'){
      steps{                
            sh 'docker run --name naitapp4 -d -p 8000:8080 kehindeojewunmi/naitdemo'
            // sh 'docker run --name naitapp2 -d -p 5000:8080 ashokit/spring-boot-mongo:latest'
            // sh 'docker run --name naitapp3 -d -p 7000:8080 ashokit/javawebapp'
            }
        }
    stage("Deploy to EKS") {
      steps {
      withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kube-config', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') {
                  sh "kubectl apply -f deploymentservice.yaml"
            }
        }
      }
}
}
