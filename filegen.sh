#!/bin/bash                                                                                                                                                                                       
# filegen.sh                                                                                                                                                                                      
                                                                                                                                                                                                  
SIZE=10                                                                                                                                                                                           
COUNT=1                                                                                                                                                                                           
                                                                                                                                                                                                  
if [[ $# -ne 1 ]]; then                                                                                                                                                                           
  echo "Usage: $0 <file>"                                                                                                                                                                         
  exit 1                                                                                                                                                                                          
fi                                                                                                                                                                                                
                                                                                                                                                                                                  
if [[ `touch $1` -ne 0 ]]; then                                                                                                                                                                   
  echo "ERROR: file $1 could not be created."                                                                                                                                                     
  exit 1                                                                                                                                                                                          
fi                                                                                                                                                                                                
                                                                                                                                                                                                  
echo "Created file: $1"                                                                                                                                                                           
echo -e "Filling it with random bytes...\c"                                                                                                                                                       
                                                                                                                                                                                                  
dd if=/dev/urandom of=$1 bs=${SIZE}M count=$COUNT status=none                                                                                                                                     
                                                                                                                                                                                                  
echo "done!"                                                                                                                                                                                      
echo -e "File $1 created, size =\c"                                                                                                                                                               
echo `expr $SIZE*$COUNT` MB                                                                                                                                                                       
                                                                                                                                                                                                  
exit 0                
