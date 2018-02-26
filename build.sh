#!/bin/bash
DOCKER_PROJECT=()

gitPull()
{
  cd /tmp
  rm -rf AwesomeDockerfile
  git clone https://github.com/andy-zhangtao/AwesomeDockerfile.git
}

findProject()
{
  PROJECT=$1
  echo "=== CD $PROJECT ==="
  cd $PROJECT
  #统计目录个数
  DIR_NUM=`ls -lR|grep ^d|wc -l`
  echo "=== You Have $DIR_NUM Docker Project ==="
  #初始化工程目录

  j=0
  for i in `ls -lR|grep ^d|awk '{print $9}'`
  do
      DOCKER_PROJECT[j]=$i
      j=`expr $j + 1`
  done

  echo "Type Project Num:"
  echo "================"
  for ((i=0; i<DIR_NUM; i++)); do
      echo $i ${DOCKER_PROJECT[$i]}
  done

}

build()
{
  #获取工程中的Dockerfile
  DOCKER_FILE=()
  read projectID
  path=${DOCKER_PROJECT[$projectID]}
  echo ""
  echo "U choose [$path]"

  cd $path

  tp=`pwd`
  FILE_NUM=`ls -ltr $tp|grep Dockerfile|grep ^-|wc -l`

  j=0
  for i in `ls -ltr $tp|grep Dockerfile|awk '{print $9}'`
  do
     DOCKER_FILE[j]=$i
     j=`expr $j + 1`
  done


  echo "Type Dockerfile Num:"
  echo "================"
  for ((i=0; i<FILE_NUM; i++)); do
      echo $i ${DOCKER_FILE[$i]}
  done
  read dockerfileID

  buildFile=${DOCKER_FILE[$dockerfileID]}
  echo "U choose [$buildFile]"
  tag=`git describe --tags`

  #允许读取tags中的自定义image name
  imgname=""
  if [ -f "tags" ]
  then
    imgname=`cat tags`$tag
    echo $imgname
  else
    imgname=`echo vikings/$path:$tag| tr 'A-Z' 'a-z'`
  fi

  clear
  echo "=========================="
  echo "Build $imgname"
  echo
  docker build -t $imgname -f $buildFile $tp/
  docker push $imgname
  docker rmi $imgname
}

clean()
{
  rm -rf /tmp/AwesomeDockerfile
}

echo "Start of script..."
gitPull
findProject AwesomeDockerfile
build
clean
echo "End of script..."
