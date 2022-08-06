#!/bin/sh

CREATED_FILE_PATH="../workspace/svelte_app/src/html"
DYNAMIC_MADE_PATH=""
HOME_PAGE_PATH="${CREATED_FILE_PATH}/home.html"
TO_HOME_LINK=""
TO_PAGE_LINK=""
LOOP_COUNT=1

for VAR in "${@:1:($#-1)}" ;
   do
      if [ $VAR = "m" ]
         then
            VAR="modanJs"
      fi

      if [  $VAR = "e" ]
         then
            VAR="event"
      fi
      DYNAMIC_MADE_PATH="${DYNAMIC_MADE_PATH}/${VAR}"
      TO_PAGE_LINK="${TO_PAGE_LINK}\/${VAR}"

      if [ $LOOP_COUNT -ne 1 ]
         then
            TO_HOME_LINK="..\/${TO_HOME_LINK}"
      fi

      LOOP_COUNT=$(($LOOP_COUNT + 1))
   done

DYNAMIC_MADE_PATH="${DYNAMIC_MADE_PATH}.html"
TO_PAGE_LINK="${TO_PAGE_LINK}.html"

CREATED_FILE_PATH=$CREATED_FILE_PATH$DYNAMIC_MADE_PATH
TO_HOME_LINK="${TO_HOME_LINK}home.html"
cp "./template.html" $CREATED_FILE_PATH

LINK_TAG="<div> <a href=\".${TO_PAGE_LINK}\">${@:($#):1}<\/a><\/div>"
echo $LINK_TAG
gsed -i "s/toHomeLinkPath/${TO_HOME_LINK}/g" $CREATED_FILE_PATH
gsed -i "/<!-- toHomeLinkPath -->/i ${LINK_TAG}" "../workspace/svelte_app/src/html/home.html"
