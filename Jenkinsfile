//==================================================================================
//  Database Liquibase Pipeline template 2019/07/25 - JVC
//  Liquibase Deployment
//  Latest update - 10162019
//  Current version - 10162019
//==================================================================================
//  Variable section -
//  Documentation found in confluent for standard variables
//  Please include comments for any non standard variables used
//==================================================================================

def project = 'wbh-service-claims-db'
//!!!Required for processing QA/UAT build email (set this as token in DEV branch pipeline setup in Orchestration)!!!//
// If you don't know how please ask!!!!!!!!!!!!!!!!!!!!!!
//def linkToken = 'devpipelinebuildawb'

def curr_env
def mail_list
def qg
def myEnv = env.WORKSPACE
def mergeBuild
def creds
def qaFile

//==================================================================================
// Pipeline section -
//  Documentation found in confluent for standard variables
//  Please include comments for any non standard stages or properties used
//==================================================================================

pipeline {
	agent {
		node {
			//docker build server
			label 'atl20do0000as02.amer.prgx.com'
		}
	}

	//set parameters for pipeline
  parameters {
		booleanParam(defaultValue: false, description: 'Used to promote a branch to the next available environment', name: 'promoteBuild')
    booleanParam(defaultValue: false, description: 'Used to promote a release branch to Production', name: 'promoteProd')
		//string(defaultValue: '', description: 'Required for promoting files to QA/UAT', name: 'deployBuild')
	}

	stages {
		//DEV deployment stage
		stage('Deploy-DEV') {
			when { branch 'develop' }
			steps {
				script{
           curr_env = "DEV"
          sh 'echo "Deploy DEV"'

          //liquibase
          sh 'mvn -Phonda-na-claims-dev liquibase:update'
				sh 'mvn -Pcargill-claims-dev liquibase:update'
				sh 'mvn -Psobeys-claims-dev liquibase:update'

          //GitHub
          branchCandidate(project)

          mail_list = 'ITDevOps@prgx.com'
				}
			}
		}

    //QA deployment stage
    stage('Deploy-QA') {
      when { expression { env.BRANCH_NAME =~ 'candidate-' } }
      steps {
        script {
          if(params.promoteBuild==true) {
	//liquibase
             sh 'mvn -Phonda-na-claims-qa liquibase:update'
				    sh 'mvn -Pcargill-claims-qa liquibase:update'
				    sh 'mvn -Psobeys-claims-qa liquibase:update'
            //promote this build
            candidatePromote(project)
          } else {
            //merge and send email
		  			mail_list = 'ITDevOps@prgx.com'
            candidateMergeTest(project)
            candidatePromotion(project,mail_list)
					}
        }
      }
    }

		//candidate creates release
		//release deploys to UAT / Staging on promote
//		stage('Deploy-Staging') {
//			when { expression { env.BRANCH_NAME =~ 'uat-candidate-' } }
//			steps {
//        script {
//          mail_list = ''
//          if(params.promoteBuild==true) {
//            //promote to UAT
//            stgPromoteProd(project)
//		  			mail_list = 'ITDevOps@prgx.com, abhishek.jaiswal@prgx.com'
//            notifySuccess(project,mail_list)

//          } else {
//            //merge bugfix and generate new UAT branch
//		  			mail_list = 'jonathan.chunlamany@prgx.com'
//            stgMerge(project)
//            stgPromotionEmail(project,mail_list)

//          }
//        }
//			}
//		}

    //STG deployment stage
		stage('Deploy-STG') {
			when { expression { env.BRANCH_NAME.indexOf("-") > 0 && env.BRANCH_NAME.substring(0, env.BRANCH_NAME.indexOf("-")) == 'release' }}
				//env.BRANCH_NAME. =~ 'release-' && env.BRANCH_NAME != 'prod-release-'} }
			steps {
        script {
          mail_list = ''
          if(params.promoteBuild==true) {
            //promote to Staging
		  //liquibase
		 sh 'mvn -Phonda-na-claims-stage liquibase:update'
				    sh 'mvn -Pcargill-claims-stage liquibase:update'
				    sh 'mvn -Psobeys-claims-stage liquibase:update'
            stgPromoteProd(project)
		  			mail_list = 'ITDevOps@prgx.com'
            notifySuccess(project,mail_list)

          } else {
            //merge bugfix and generate new UAT branch
		  			mail_list = 'ITDevOps@prgx.com'
            //stgMerge(project)
            stgPromotionEmail(project,mail_list)

          }
        }
			}
		}

		//PROD deployment stage
		stage('Deploy-PROD') {
			when { expression { env.BRANCH_NAME =~ 'prod-release-' } }
			steps {
        script {
					echo "${params.promoteProd}"
          if(params.promoteProd==true) {
            //promote to PROD
		  //liquibase
	sh 'mvn -Phonda-na-claims-prod liquibase:update'
        			sh 'mvn -Pcargill-claims-prod liquibase:update'
				sh 'mvn -Psobeys-claims-prod liquibase:update'
            releasePromotePROD(project)
		  			mail_list = 'ITDevOps@prgx.com'
            notifySuccess(project,mail_list)

          } else {
            //merge bugfix and generate new release branch
		  			mail_list = 'ITDevOps@prgx.com'
            releaseMerge(project)
            releasePromotionEmail(project,mail_list)

          }
        }
			}
		}

		//Developer working branches (build, test, sonar)
		stage('OnNonDeployableBranch') {
			when { not { expression { env.BRANCH_NAME =~ 'prod-release-' || env.BRANCH_NAME =~ 'release-' || env.BRANCH_NAME =~ 'candidate-' || env.BRANCH_NAME == 'develop' || env.BRANCH_NAME =~ 'hotfix-' } } }
			steps {
				script{
					sh 'echo "Non-Deployable branch"'
					curr_env=env.BRANCH_NAME

					//mvnBuildSonar()
					//qualityGateCheck()


					mail_list = 'ITDevOps@prgx.com'
    			notifySuccess(project,mail_list)
				}
			}
		}

		//Devops pipeline development work
		stage('devopsWork'){
			when { expression { env.BRANCH_NAME =~ 'devops' } }
			steps{
				script{
					//DEV-OPS development work section ---------------------------------------
					//this section will only run with-in a DEVOPS- jira branch
					curr_env = env.BRANCH_NAME
					sh 'echo "DevOps working branch"'

					//Tested and working 2019/07/20
					//=================================



					//=================================
					//DEV-OPS development work section ---------------------------------------
				}
			}
		}
	}
	post {
		failure {
      notifyFailure(project,'AWBDevs-nagarro@prgx.onmicrosoft.com')
		}
		cleanup {
			cleanWs()
		}
	}
}

//===================================================================================
//  Included function set
//  Documentation found in confluent for standard functions
//  Please include comments for any non standard functions used
//===================================================================================

//===================================================================================
//
//  Develop function section
//
//===================================================================================

// function to execute full development merge
def developBuild(project){
  sh 'echo "Deploy DEV"'

  //Maven
  mvnBuildSonar()
  qualityGateCheck()

  //File Repo
  mvnDeployNexusDevelopment()
  deploySuperRepo(project)

  //GitHub
  branchCandidate(project)

  //Docker
  prepOC(project)
	//pull all yaml
	gitPullYAMLDevQA(project)
  dockerPush(project,mvnVersionPOM())
  dockerPushDev(project)
	//testing openshift deployment
	openShiftConfigDeployDev(project)

  mail_list = 'jesse.hurt@prgx.com,Jeff.Strickland@prgx.com,jonathan.chunlamany@prgx.com'

}

//===================================================================================
//
//  Candidate function section
//
//===================================================================================

// Function to handle email promotion upon candidate branch creation
// if new code is merged into candidate it must be remerged with develop
// to generate a new candidate branch
def candidatePromotion(project,mail_list){
  if(env.BUILD_NUMBER=='1'){
    // send promotion email
    notifyCandidate(project,mail_list)
  }else{
    notifyCandidateMerge(project,mail_list)
  }
}

// Function to handle merges to a candidate branch
// this will only occur after the first build of the branch
// build 1 occurs upon creation
def candidateMergeTest(project){
  if(env.BUILD_NUMBER!='1'){

    echo "Merges to - Candidate Branch: "+env.BRANCH_NAME

    mvnBuildSonar()
    qualityGateCheck()

  }
}

// Function to handle promotion of a candidate branch
// this will only occur on the second build of a branch (promotion)
// build 2 occurs upon creation when promoteBuild is selected and build
// is pushed to QA and release is created
def candidatePromote(project){
  //if(env.BUILD_NUMBER=='2'){
    ver = mvnVersionPOM()
    bname = env.BRANCH_NAME
    buildNumber = bname.substring(bname.lastIndexOf("-")+1,bname.length())
    versionNumber = ver.substring(0, ver.lastIndexOf("-"))

    echo "Promote - Candidate Branch: "+env.BRANCH_NAME

    //move code from super repo build to super repo release
   // mvSuperRepo(project,buildNumber,versionNumber)

    //create release branch
    branchRelease(project,buildNumber)

		//push to QA environment
		//dockerPushQA(project,buildNumber)

		// pull YAML QA
		//gitPullYAMLDevQA(project)

		// openshift deploy qa
		//openShiftConfigDeployQA(project)
  //}
}

//	possible rewrite due to bad naming
//===================================================================================
//
//  Staging Release function section (stg)
//
//===================================================================================

// Function to handle email promotion upon release branch creation
// if new code is merged into release a new branch is created
def stgPromotionEmail(project,mail_list){
  if(env.BUILD_NUMBER=='1'){
    ver = env.BRANCH_NAME
    relVersion = ver.substring(0, ver.lastIndexOf("-"))

    // send promotion email
    notifyStgRelease(project,mail_list,relVersion)

  }
}

// Function to handle merging into staging release
// there should be no merging for staging (this should only occur in UAT)
// bug fix to an existing release branch
// when code is merged into release branch
def stgMerge(project){
  if(env.BUILD_NUMBER!='1'){
    //mvnBuildSonar()
    //qualityGateCheck()

    ver = mvnVersionPOM()
    bname = env.BRANCH_NAME
    buildNumber = bname.substring(bname.lastIndexOf("-")+1,bname.length())
    versionNumber = ver.substring(0, ver.lastIndexOf("-"))

    echo "Bug Fix: Patch to Release Branch: "+env.BRANCH_NAME

    //create new staging release branch from existing
    if(versionNumber != buildNumber){
      //mvSuperRepoBugfix(project,buildNumber,versionNumber)
      branchReleaseFromRelease(project,versionNumber,env.BRANCH_NAME)
    }else{
      error("Build failed due to duplicate POM Version Number")
    }

  }
}

//	promote QA to Staging environment
//	create final prod branch that will promote to Production environment
def stgPromoteProd(project){
  //if(env.BUILD_NUMBER=='2'){
		ver = mvnVersionPOM()
		bname = env.BRANCH_NAME
		buildNumber = bname.substring(bname.lastIndexOf("-")+1,bname.length())
    versionNumber = ver.substring(0, ver.lastIndexOf("-"))
    echo "Promote - Release Branch: "+env.BRANCH_NAME
		//move code from release to release prod
		//mvSuperRepoProd(project,versionNumber)
		// pull qa image
    // push qa image to Staging environment
		//dockerPullQA(project)
		//dockerLoadSTG(project,versionNumber)
		// pull YAML Staging
		//gitPullYAMLStagingProd(project)
    // push docker image to stage
		//dockerPushStage(project,versionNumber)
		// openshift deploy staging`
		//openShiftConfigDeployStage(project)
		//create prod release
		branchProdRelease(project,buildNumber)
  //}else{
    //error("Multiple changes have been processed in this release branch, this branch can no longer be promoted")
  //}
}


//===================================================================================
//
//  Prod Release function section
//
//===================================================================================

// Function to handle email promotion upon release branch creation
// if new code is merged into release a new branch is created
def releasePromotionEmail(project,mail_list){
  if(env.BUILD_NUMBER=='1'){
    ver = env.BRANCH_NAME
    relVersion = ver.substring(0, ver.lastIndexOf("-"))

    // send promotion email
    notifyProdRelease(project,mail_list,relVersion)

  }
}

// bug fix to an existing release branch
// when code is merged into release branch
def releaseMerge(project){
  if(env.BUILD_NUMBER!='1'){
    //mvnBuildSonar()
    //qualityGateCheck()

    ver = mvnVersionPOM()
    bname = env.BRANCH_NAME
    buildNumber = bname.substring(bname.lastIndexOf("-")+1,bname.length())
    versionNumber = ver.substring(0, ver.lastIndexOf("-"))

    echo "Bug Fix: Patch to Release Branch: "+env.BRANCH_NAME

    //create release branch
    if(versionNumber != buildNumber){
      //mvSuperRepoBugfix(project,buildNumber,versionNumber)
      branchProdReleaseFromProdRelease(project,versionNumber,env.BRANCH_NAME)
    }else{
      error("Build failed due to duplicate Production POM Version Number")
    }

  }
}


def releasePromotePROD(project){
  //if(env.BUILD_NUMBER=='2'){
		finalVersion = mvnVersionPOM()
    bname = env.BRANCH_NAME
		buildNumber = bname.substring(bname.lastIndexOf("-")+1,bname.length())
		//merge master
		branchMergeProdMaster(project,buildNumber,env.BRANCH_NAME)

    //deploy to nexus releases
		//mvnDeployNR(project,finalVersion)

    //deploy image to PROD
		//dockerPullSTG(project,finalVersion)
		//dockerPushPROD(project,finalVersion)

		//openshift deploy prod`
		//gitPullYAMLStagingProd(project)
		//openShiftConfigDeployProd(project)

    //merge master


    //merge develop (will create candidate must be deleted)

    //tag

  //}else{
  //  error("Multiple changes have been processed in this release branch, this branch can no longer be promoted")
  //}
}

//===================================================================================
//
//  Standard function section
//
//===================================================================================

// function to generate release promotion email
// required variables
// project = github repo name
// mail_list = promotion distribution list
def notifyProdRelease(project,mail_list,relVersion) {
	emailext (
		from: "BuildSuccess@prgx.com",
		subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
		body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' from branch <b>${env.BRANCH_NAME}</b>:</p>
		<p>CREATING: Prod-Release (prod-release-"""+relVersion+""") :: GitHub link
		<a href='https://github.com/prgxlabs/"""+project+"""/tree/prod-release-"""+relVersion+"""'>GitHub Project<a></p>
		<p>Check console output or Promote at &QUOT;<a href='${env.JOB_URL}/build??promoteBuild=true&deployBuild=${env.BUILD_NUMBER}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
		to: "$mail_list"
	)
}

// function to generate release promotion email
// required variables
// project = github repo name
// mail_list = promotion distribution list
def notifyStgRelease(project,mail_list,relVersion) {
	emailext (
		from: "BuildSuccess@prgx.com",
		subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
		body: """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' from branch <b>${env.BRANCH_NAME}</b>:</p>
		<p>CREATING: Release (release-"""+relVersion+""") :: GitHub link
		<a href='https://github.com/prgxlabs/"""+project+"""/tree/release-"""+relVersion+"""'>GitHub Project<a></p>
		<p>Check console output or Promote at &QUOT;<a href='${env.JOB_URL}/build??promoteBuild=true&deployBuild=${env.BUILD_NUMBER}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
		to: "$mail_list"
	)
}

// function to generate candidate promotion email
// required variables
// project = github repo name
// mail_list = promotion distribution list
def notifyCandidate(project,mail_list) {
	emailext (
		from: "BuildSuccess@prgx.com",
		subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
		body: """<p>Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' from branch <b>${env.BRANCH_NAME}</b>:</p>
		<p>CREATING: Candidate for release (candidate-"""+env.BUILD_NUMBER+""") :: GitHub link
		<a href='https://github.com/prgxlabs/"""+project+"""/tree/candidate-"""+env.BUILD_NUMBER+"""'>GitHub Project<a></p>
		<p>Check console output or Promote at &QUOT;<a href='${env.JOB_URL}/build??promoteBuild=true&deployBuild=${env.BUILD_NUMBER}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
		to: "$mail_list"
	)
}

// function to generate candidate change email
// candidate branches can not be modified with remerge to master
// required variables
// project = github repo name
// mail_list = promotion distribution list
def notifyCandidateMerge(project,mail_list) {
	emailext (
		from: "BuildAlert@prgx.com",
		subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
		body: """<p>ALERT: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' from branch <b>${env.BRANCH_NAME}</b>:</p>
		<p>Additional code has been added to the candidate branch.<br>
		This code will not be included if a promotion occurs.<br>
		Please merge to create a new candidate if changes need to be made.<br>
		(${env.BRANCH_NAME}) :: GitHub link
		<a href='https://github.com/prgxlabs/"""+project+"""/tree/${env.BRANCH_NAME}'>GitHub Project<a></p>
		<p>Check console output at &QUOT;<a href='${env.JOB_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
		to: "$mail_list"
	)
}

// function to generate failure email, plus build log
// required variables
// project = github repo name
// mail_list = developer distribution list
def notifyFailure(project,mail_list){
	emailext (
		from: "BuildFailure@prgx.com",
		subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
		body: """<p> Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' has failed triggred from branch <b>${env.BRANCH_NAME}</b>:</p>
		<p>See attached build log for failures</p>
		<p>FAILED GitHub build link:<a href='https://github.com/prgxlabs/"""+project+"""/tree/"""+env.BRANCH_NAME+"""'>GitHub Project<a></p>
		<p>Check console output at &QUOT;<a href='${env.BUILD_URL}/console'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
		to: 'ITDevOps@prgx.com, '+mail_list,
		attachLog:true
	)
}

// function to generate success email
// required variables
// project = github repo name
// mail_list = developer distribution list
def notifySuccess(project,mail_list){
  emailext (
    from: "BuildSuccess@prgx.com",
    subject: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
    body: """<p>Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' from branch <b>${env.BRANCH_NAME}</b>:
          has completed successfully</p>""",
    to: 'ITDevOps@prgx.com, '+mail_list
  )
}

//===================================================================================
//
//  Maven / SonarQube function section
//
//===================================================================================

// function to run sonar
// maven funcions to build sonar reports
// -X switch verbose logging
def mvnBuildSonar(){
  withSonarQubeEnv('SonarQube'){
    sh 'mvn -X clean verify sonar:sonar'
  }
}

// Standard maven snapshot deployment.
// The developers should only be using snapshots
def mvnDeployNexusDevelopment(){
	//clean project and deploy to nexus repo stored in POM
	//This should be the nexus development repository
	sh 'mvn -X clean deploy'
}

// Maven 3rd party jar deployment.
// This function is not called directly
// This should be called from mvnDeployNR()
// used to convert an existing snapshot jar into a release jar
// rename snapshot to release version
// deploy file from superrepo to nexus release
// required parameters:
// project
// pom verion
// artifact id
// group id
//
// *** this deployment won't work for parent projects *** //
//
// need a separate deploy process for non library files
def mvnDeployNexusRelease(project,pomV,artID,grpID){
	//maven artifact deployment from super repo
	//verify deployable jar file exists
	//else deploy pom only
	def fex = fileExists project+'-'+pomV+'-SNAPSHOT.jar'
	if(fex){
		//deploy jar
		sh '''
		mvnMoveSnapshotJar(project,pomV)

		mvn -X deploy:deploy-file -Dfile=/mnt/superRepo/'''+project+'''/'''+params.deployBuild+'''/'''+project+'''-'''+pomV+'''.jar \
		-DgroupId='''+grpID+''' \
		-DartifactId='''+artID+''' \
		-Dversion='''+pomV+''' \
		-Dpackaging=jar \
		-DgeneratePom=true \
		-DrepositoryId=NexusRepoXtreme \
		-Durl=http://atl20op1000ws01.amer.prgx.com:8081/nexus/content/repositories/releases
		'''
	}else{
		//deploy pom only


	}
}

// move snapshot jar to deployable deployed version
def mvnMoveSnapshotJar(project,pomV){
	sh 'mv '+project+'-'+pomV+'-SNAPSHOT.jar '+project+'-'+pomV+'.jar'
}

// use maven to output project version from project pom
def mvnVersionPOM(){
	def pomVersion = sh(returnStdout: true, script: 'mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.version -q -DforceStdout').trim()
	return pomVersion
}

// use maven to output project groupid from project groupid
def mvnGroupIDPOM(){
	def pomGroupID = sh(returnStdout: true, script: 'mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.groupId -q -DforceStdout').trim()
	return pomGroupID
}

// use maven to output project artifactid from project artifactid
def mvnArtifactIDPOM(){
	def pomArtifactID = sh(returnStdout: true, script: 'mvn org.apache.maven.plugins:maven-help-plugin:3.1.0:evaluate -Dexpression=project.artifactId -q -DforceStdout').trim()
	return pomArtifactID
}

// Full maven deployment code for snapshot to release
// moves a snapshot build version to full release
// required parameters:
// project
// params.deployBuild pulled from build call
def mvnDeployNR(project,relVersion){

	def myDir = '/mnt/superRepo/'+project+'/prod-release-'+relVersion+'/'
	dir(myDir){
		def grp = mvnGroupIDPOM()
		def artf = mvnArtifactIDPOM()
		def ver = mvnVersionPOM()

		mvnRenamePOM()
		mvnDeployNexusRelease(project,ver.substring(0, ver.lastIndexOf("-")),artf,grp)

	}
}

//Rename pom.xml to pom.bk
def mvnRenamePOM(){
	sh 'mv pom.xml pom.bk'
}

def qualityGateCheck(){
	for(int i = 0; i < 2; i++){
		sleep(10)
		try{
			timeout(time: 30, unit: 'SECONDS') {
				qg = waitForQualityGate abortPipeline: true
				if (qg.status != 'OK') {
					echo "Status: ${qg.status}"
					error "Pipeline aborted due to quality gate failure: ${qg.status}"
				}
				i = 2
			}
		} catch(Exception e){
			if(i == 1){
				throw e
			}
		}
	}
	return qg
}

// function to deploy java project to super repo
// this code is specific for java files
def deploySuperRepo(project){
	//copy compiled jar and pom if possible
	//copy to mounted file repository
	sh 'find ./target/ -iregex ".*\\.jar" -exec mkdir -p /mnt/superRepo/'+project+'/'+env.BUILD_NUMBER+' \\; -exec cp {} /mnt/superRepo/'+project+'/'+env.BUILD_NUMBER+'/. \\; || echo "No package"'
	sh 'find . -iname "pom.xml" -exec mkdir -p /mnt/superRepo/'+project+'/'+env.BUILD_NUMBER+' \\; -exec cp {} /mnt/superRepo/'+project+'/'+env.BUILD_NUMBER+'/pom.xml \\;'
}

def mvSuperRepo(project,buildNumber,relVersion){
  //move build directory to release directory
  sh 'mv /mnt/superRepo/'+project+'/'+buildNumber+' /mnt/superRepo/'+project+'/release-'+relVersion
}

def mvSuperRepoBugfix(project,relVersion,newRelVersion){
  //update release directory to match pom
  sh 'mv /mnt/superRepo/'+project+'/release-'+relVersion+' /mnt/superRepo/'+project+'/release-'+newRelVersion
}

def mvSuperRepoProd(project,relVersion){
  //update release directory to match pom
  sh 'mv /mnt/superRepo/'+project+'/release-'+relVersion+' /mnt/superRepo/'+project+'/prod-release-'+relVersion
}

//===================================================================================
//
//  GitHub function section
//
//===================================================================================

// Function to create candidate branch
// Specific to branching strategy:
// This should be triggered from the develop branch
// when a code merge occurs.
// (If promoted this moves to QA)
def branchCandidate(project){
	//create branch for release candidate as build id
	//this creates a github branch of the current build
	withCredentials([usernamePassword(credentialsId: gitJenkins(), usernameVariable: 'USER', passwordVariable: 'TOKEN')]) {

		//initialize github
		//clone project into jenkins project workspace
		//fresh copy of git project
		sh 'git init'
		sh 'git clone https://'+TOKEN+'@github.com/prgxlabs/'+project+'.git --branch develop --single-branch'

		//switch to cloned project directory
		dir(project){
			//create candidate branch and push
			sh 'git branch candidate-'+env.BUILD_NUMBER
			sh 'git push origin candidate-'+env.BUILD_NUMBER
		}
	}
}

// Function to create RELEASE BRANCH
// Specific to branching strategy:
// This should be triggered from the candidate branch
// when a promotion occurs.
// promotes to QA env
def branchRelease(project,build){
	// create branch for release using release version
	// this creates a github branch from the corresponding candidate
	// the candidate is deleted on release creation
	withCredentials([usernamePassword(credentialsId: gitJenkins(), usernameVariable: 'USER', passwordVariable: 'TOKEN')]) {
		//initialize github
		//clone project into jenkins project workspace
		//fresh copy of git project
		sh 'git init'
		sh 'git clone https://'+TOKEN+'@github.com/prgxlabs/'+project+'.git --branch candidate-'+build+' --single-branch'
		//switch to cloned project directory
		dir(project){
			//create release branch and push
			//delete candidate branch
			sh 'git branch release-'+build
			sh 'git push origin release-'+build
			sh 'git push --delete origin candidate-'+build
		}
	}
}

// Function to create new PROD-RELEASE BRANCH on promotion of release to Staging
// Specific to branching strategy:
// This should be triggered from the release branch on promotion
// releaseBranch is the current release branch that should be deleted
def branchProdRelease(project,build){
	// create branch for release using release version
	// this creates a github branch from the corresponding candidate
	// the candidate is deleted on release creation
	withCredentials([usernamePassword(credentialsId: gitJenkins(), usernameVariable: 'USER', passwordVariable: 'TOKEN')]) {
		//initialize github
		//clone project into jenkins project workspace
		//fresh copy of git project
		sh 'git init'
		sh 'git clone https://'+TOKEN+'@github.com/prgxlabs/'+project+'.git --branch release-'+build+' --single-branch'
		//switch to cloned project directory
		dir(project){
			//create release branch and push
			//delete candidate branch
			sh 'git branch prod-release-'+build
			sh 'git push origin prod-release-'+build
			sh 'git push --delete origin release-'+build
		}
	}
}

// Function to create new release branch from bug fix
// Specific to branching strategy:
// This should be triggered from the release branch
// when bug fix code merge occurs.
// relVersion is the release version and should be pulled
// from the POM using the mavenfunctions
// releaseBranch is the current release branch that should be deleted
def branchReleaseFromRelease(project,relVersion,releaseBranch){
	// create branch for release using release version
	// this creates a github branch from the corresponding candidate
	// the candidate is deleted on release creation
	withCredentials([usernamePassword(credentialsId: gitJenkins(), usernameVariable: 'USER', passwordVariable: 'TOKEN')]) {

		//initialize github
		//clone project into jenkins project workspace
		//fresh copy of git project
		sh 'git init'
		sh 'git clone https://'+TOKEN+'@github.com/prgxlabs/'+project+'.git --branch '+releaseBranch+' --single-branch'

		//switch to cloned project directory
		dir(project){
			//create release branch and push
			//delete candidate branch
			sh 'git branch release-'+relVersion
			sh 'git push origin release-'+relVersion
			sh 'git push --delete origin '+releaseBranch
		}
	}
}

def branchMergeProdMaster(project,buildNumber,releaseBranch){
	withCredentials([usernamePassword(credentialsId: gitJenkins(), usernameVariable: 'USER', passwordVariable: 'TOKEN')]) {

		sh 'mkdir cpBranchFiles'

		//initialize github
		//clone project into jenkins project workspace
		//fresh copy of git project
		sh 'git init'
		sh 'git clone https://'+TOKEN+'@github.com/prgxlabs/'+project+'.git'

		//switch to cloned project directory
		dir(project){
			//create release branch and push
			//delete candidate branch
			sh 'git checkout '+releaseBranch
			sh 'mv * ../cpBranchFiles/'

			sh 'git checkout master'
			//sh 'mv -vf ../cpBranchFiles/* ./'
			sh ' cp -rlf ../cpBranchFiles/* ./'
			sh ' rm -r ../cpBranchFiles/*'
			sh 'git add .'
			sh 'git commit -m "push master from version"'
			sh 'git push origin master'


			sh 'git tag build-'+buildNumber
			sh 'git push origin build-'+buildNumber

			//delete original branch
			sh 'git push --delete origin '+releaseBranch
		}
	}
}


//temp function, please remove after getting github credentials matched
//or formalize with better logic
def gitJenkins(){
	def gitCreds
	if(env.JENKINS_URL=='https://jenkins-prod.prgx.com:8443/'){
		gitCreds = 'svcJenkins'
	}else{
		gitCreds = 'myGitCreds'
	}
	return gitCreds
}

def gitPullYAMLDevQA(project){
	withCredentials([usernamePassword(credentialsId: gitJenkins(), usernameVariable: 'USER', passwordVariable: 'TOKEN')]) {

		//initialize github
		//clone project into jenkins project workspace
		//fresh copy of git project
		sh 'git init'
		sh 'git clone https://'+TOKEN+'@github.com/prgxlabs/wbh-service-yaml.git'

		//switch to cloned project directory
		dir('wbh-service-yaml/'+project){
			//copy yaml files for
			prepOCYamlDevQA(project)
		}
	}
}

def gitPullYAMLStagingProd(project){
	withCredentials([usernamePassword(credentialsId: gitJenkins(), usernameVariable: 'USER', passwordVariable: 'TOKEN')]) {

		//initialize github
		//clone project into jenkins project workspace
		//fresh copy of git project
		sh 'git init'
		sh 'git clone https://'+TOKEN+'@github.com/prgxlabs/wbh-service-yaml.git'

		//switch to cloned project directory
		dir('wbh-service-yaml/'+project){
			//copy yaml files for
			prepOCYamlStageProd(project)
		}
	}
}

//===================================================================================
//
//  Docker function section
//  This section is specific (for now) to awb (Audit Workbench) as seen in the prepOC function
//
//===================================================================================

//	push base image (version) + create build tag
def dockerPush(project,nxsVer){
	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er9oshms01 'cd /root/awb/'''+project+'''/
		oc login atl20er9oshms01:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		if docker build -t docker-registry.default.svc:5000/workbench/'''+project+''':'''+nxsVer+''' -t docker-registry.default.svc:5000/workbench/'''+project+''':'''+env.BUILD_NUMBER+''' . ;
			then docker push docker-registry.default.svc:5000/workbench/'''+project+''':'''+env.BUILD_NUMBER+'''
		fi'
		'''
	}
}

//	map build tag to DEV tag
def dockerPushDev(project){
	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er9oshms01 'cd /root/awb/'''+project+'''/
		oc login atl20er9oshms01:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		if docker tag docker-registry.default.svc:5000/workbench/'''+project+''':'''+env.BUILD_NUMBER+''' docker-registry.default.svc:5000/workbench/'''+project+''':dev
			then docker push docker-registry.default.svc:5000/workbench/'''+project+''':dev
		fi'
		'''
	}
}


//	map build tag to UAT
def dockerPushQA(project,buildNumber){
	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er9oshms01 'cd /root/awb/'''+project+'''/
		oc login atl20er9oshms01:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		if docker tag docker-registry.default.svc:5000/workbench/'''+project+''':'''+buildNumber+''' docker-registry.default.svc:5000/workbench-qa/'''+project+''':qa
			then docker push docker-registry.default.svc:5000/workbench-qa/'''+project+''':qa
		fi'
		'''
	}
}

//  pull image and transfer to QA folder
//  transfer QA folder contents to STG environment
//
def dockerPullQA(project){
	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er9oshms01 'mkdir -p /root/awb/'''+project+'''/img/qa/'
		ssh root@atl20er9oshms01 'cd /root/awb/'''+project+'''/img/qa/
		oc login atl20er9oshms01:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		docker save docker-registry.default.svc:5000/workbench-qa/'''+project+''':qa -o '''+project+'''qa.tgz'

		if ssh root@atl20er1oshms21 '[ -d /root/awb/'''+project+'''/img/qa/ ]'
		then
			ssh root@atl20er1oshms21 'cd /root/awb/'''+project+'''/img/qa/
			rm -rf *'
		else
			ssh root@atl20er1oshms21 'mkdir -p /root/awb/'''+project+'''/img/qa/'
		fi

		ssh root@atl20er9oshms01 'scp /root/awb/'''+project+'''/img/qa/'''+project+'''qa.tgz root@atl20er1oshms21:/root/awb/'''+project+'''/img/qa/'
		'''
	}

}

//def dockerLoadUAT(){

//}

//def dockerPullUAT(){

//}

def dockerLoadSTG(project,relVersion){
	withCredentials([usernamePassword(credentialsId: 'prod-awb-admin', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er1oshms21 'cd /root/awb/'''+project+'''/img/qa/
		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		docker import '''+project+'''qa.tgz docker-registry.default.svc:5000/workbench-stage/'''+project+''':'''+relVersion+''''
		'''
	}

}

//	pull image from QA and move to UAT
//	deploy image and map to UAT tag
def dockerPushStage(project,relVersion){
	withCredentials([usernamePassword(credentialsId: 'prod-awb-admin', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er1oshms21 'cd /root/awb/'''+project+'''/
		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		if docker tag docker-registry.default.svc:5000/workbench-stage/'''+project+''':'''+relVersion+''' docker-registry.default.svc:5000/workbench-stage/'''+project+''':stg
			then docker push docker-registry.default.svc:5000/workbench-stage/'''+project+''':stg
		fi'
		'''
	}
}

def dockerPullSTG(){
	withCredentials([usernamePassword(credentialsId: 'prod-awb-admin', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er1oshms21 'mkdir -p /root/awb/'''+project+'''/img/stg/'
		ssh root@atl20er1oshms21 'cd /root/awb/'''+project+'''/img/stg/
		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		docker save docker-registry.default.svc:5000/workbench-stage/'''+project+''':stg -o '''+project+'''stg.tgz'
		'''
	}
}

//	pull image from QA and move to UAT
//	deploy image and map to UAT tag
//def dockerPushUAT(project){

//	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
//		sh'''
//		ssh root@atl20er9oshms01 'cd /root/awb/'''+project+'''/
//		oc login atl20er9oshms01:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
//		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

//		if docker tag docker-registry.default.svc:5000/workbench/'''+project+''':'''+params.deployBuild+''' docker-registry.default.svc:5000/workbench-qa/'''+project+''':qa
//			then docker push docker-registry.default.svc:5000/workbench-qa/'''+project+''':qa
//		fi'
//		'''
//	}
//}

def dockerLoadPROD(project,relVersion){
	withCredentials([usernamePassword(credentialsId: 'prod-awb-admin', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er1oshms21 'cd /root/awb/'''+project+'''/img/stg/
		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		docker import '''+project+'''stg.tgz docker-registry.default.svc:5000/workbench-prod/'''+project+''':'''+relVersion+''''
		'''
	}

}

//	pull image from UAT and move to PROD
//	deploy image and map to PROD tag
def dockerPushPROD(project,relVersion){
	withCredentials([usernamePassword(credentialsId: 'prod-awb-admin', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er1oshms21 'cd /root/awb/'''+project+'''/
		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true
		docker login -u '''+usr+''' -p $(oc whoami -t) docker-registry.default.svc:5000

		if docker tag docker-registry.default.svc:5000/workbench-prod/'''+project+''':'''+relVersion+''' docker-registry.default.svc:5000/workbench-prod/'''+project+''':prod
			then docker push docker-registry.default.svc:5000/workbench-prod/'''+project+''':prod
		fi'
		'''
	}
}

//===================================================================================
//
//  OpenShift function section
//  This section is specific (for now) to awb (Audit Workbench) as seen in the prepOC function
//
//===================================================================================

// Prepare the OpenShift environment for new awb deployment
// check for the project directory, create if it does not exist
// if it does exist remove all contents of the directory
// copy code to root/awb/(project name) for docker image build
// this runs as part of the develop stage
// server specific to DEV/QA
def prepOC(project){
	sh '''
  if ssh root@atl20er9oshms01 '[ -d /root/awb/'''+project+'''/ ]'
  then
		ssh root@atl20er9oshms01 'cd /root/awb/'''+project+'''/
		rm -r *'

    scp -r * root@atl20er9oshms01:/root/awb/'''+project+'''/
  else
    ssh root@atl20er9oshms01 'mkdir -p /root/awb/'''+project+'''/' && scp -r * root@atl20er9oshms01:/root/awb/'''+project+'''/
  fi'''
}

// prepare openshift YAML environment
// copy YAML to root/awb/yaml/(project name)
// prep environments specific to YAML deployment
// framework follows prepOC
// server specific to dev/qa
// -- server must change -- //
def prepOCYamlDevQA(project){
	sh '''
  if ssh root@atl20er9oshms01 '[ -d /root/awb/yaml/'''+project+'''/ ]'
  then
		ssh root@atl20er9oshms01 'cd /root/awb/yaml/'''+project+'''/
		rm -r *'

    scp -r * root@atl20er9oshms01:/root/awb/yaml/'''+project+'''/
  else
    ssh root@atl20er9oshms01 'mkdir -p /root/awb/yaml/'''+project+'''/' && scp -r * root@atl20er9oshms01:/root/awb/yaml/'''+project+'''/
  fi'''
}

// prepare openshift YAML environment
// copy YAML to root/awb/yaml/(project name)
// prep environments specific to YAML deployment
// framework follows prepOC
// server specific to stg/prod
// -- server must change -- //
def prepOCYamlStageProd(project){
	sh '''
  if ssh root@atl20er1oshms21 '[ -d /root/awb/yaml/'''+project+'''/ ]'
  then
		ssh root@atl20er1oshms21 'cd /root/awb/yaml/'''+project+'''/
		rm -r *'

    scp -r * root@atl20er1oshms21:/root/awb/yaml/'''+project+'''/
  else
    ssh root@atl20er1oshms21 'mkdir -p /root/awb/yaml/'''+project+'''/' && scp -r * root@atl20er1oshms21:/root/awb/yaml/'''+project+'''/
  fi'''
}

//
// deploy dev environmental yamls
//
def openShiftConfigDeployDev(project){
	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er9oshms01 'cd /root/awb/yaml/'''+project+'''/
		oc login atl20er9oshms01:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true

		_fileLoc = 'DEV*.yaml'

		for f in DEV*.yaml
			do
				oc apply -f $f -n workbench
		done

		'
		'''
	}
}

//need function to kill openshift pod and force restart
def openShiftConfigDeployQA(project){
	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er9oshms01 'cd /root/awb/yaml/'''+project+'''/
		oc login atl20er9oshms01:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true

		_fileLoc = 'QA*.yaml'

		for f in QA*.yaml
			do
				oc apply -f $f -n workbench-qa
		done

		'
		'''
	}
}

//need function to kill openshift pod and force restart
//def openShiftConfigDeployUAT(project){
//	withCredentials([usernamePassword(credentialsId: 'd08ed92c-66cd-4b8b-a66a-6d573d70f7f6', passwordVariable: 'pas', usernameVariable: 'usr')]) {
//		sh'''
//		ssh root@atl20er1oshms21 'cd /root/awb/'''+project+'''/
//		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true

//		_fileLoc = 'UAT*.yaml'

//		for f in UAT*.yaml
//			do
//				oc apply -f $f -n workbench-qa
//		done

//		'
//		'''
//	}
//}

//need function to kill openshift pod and force restart
def openShiftConfigDeployStage(project){
	withCredentials([usernamePassword(credentialsId: 'prod-awb-admin', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er1oshms21 'cd /root/awb/yaml/'''+project+'''/
		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true

		_fileLoc = 'STG*.yaml'

		for f in STG*.yaml
			do
				oc apply -f $f -n workbench-stage
		done

		'
		'''
	}
}

//need function to kill openshift pod and force restart
def openShiftConfigDeployProd(project){
	withCredentials([usernamePassword(credentialsId: 'prod-awb-admin', passwordVariable: 'pas', usernameVariable: 'usr')]) {
		sh'''
		ssh root@atl20er1oshms21 'cd /root/awb/yaml/'''+project+'''/
		oc login atl20er1oshms21:8443 --username='''+usr+''' --password='''+pas+''' --insecure-skip-tls-verify=true

		_fileLoc = 'PROD*.yaml'

		for f in PROD*.yaml
			do
				oc apply -f $f -n workbench-prod
		done

		'
		'''
	}
}
