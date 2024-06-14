#!/usr/bin/python -tt
import nltk
import numpy as np
#importing WordNet Lemmatizer 
from nltk.stem import WordNetLemmatizer 
import pandas as pd
from nltk.corpus import stopwords
from nltk.corpus import stopwords
nltk.download('stopwords')
import sklearn
import warnings
#importing word tokenizer
from nltk.tokenize import word_tokenize
nltk.download('words')
nltk.download('punkt')
from nltk import ne_chunk, pos_tag, word_tokenize
from nltk.tree import Tree
warnings.filterwarnings('ignore')
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize 
from nltk.sentiment import SentimentIntensityAnalyzer
nltk.download('vader_lexicon')
nltk.download('wordnet')
from pyswip import Prolog
from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize
import string
import nltk
import numpy 
import spacy
import nltk
from nameparser.parser import HumanName
from nltk.corpus import wordnet
nltk.download('averaged_perceptron_tagger')
nltk.download('maxent_ne_chunker')
import nltk






import nltk
from nameparser.parser import HumanName
from nltk import ne_chunk, pos_tag, word_tokenize
from nltk.tree import Tree
eg=spacy.load('en_core_web_sm')
f = open('sample_file.txt','r+',encoding= "utf-8",errors ="ignore")

#f = open('sample_file1.txt','r+',encoding= "utf-8",errors ="ignore")

#f = open('sample_file2.txt','r+',encoding= "utf-8",errors ="ignore")
file_c=f.read()
f.close()
print(file_c)
text_after_stopword=[]
text_before=word_tokenize(file_c)
print("Text before----", text_before)
text_in_lowercase= file_c.lower()        #to lower case
text_after_tokenize=word_tokenize(text_in_lowercase)  
text_after_punc= []
for t in text_after_tokenize: 
 if(t not in set(string.punctuation)): 
  text_after_punc.append(t)

print(text_after_punc)


stopword= set(stopwords.words('english')) #stop word removal
for word in text_after_punc:
 if word not in stopword:    
  text_after_stopword.append(word)


#user name checking

print(text_after_stopword)


for s in (nltk.ne_chunk(nltk.pos_tag(text_before),binary=False)).subtrees(filter=lambda t: t.label()== 'PERSON'):
 print(s)
 na=''
 for l in s.leaves():
    for p in l[0]:
        na=na+p
    na=na+' '

print(na)

f = open("sample_file_prolog.pl", "w+")
f.write("xname("+'"'+na+'"'+").")

#year 
c=''
print(text_after_stopword)
for f1 in text_after_stopword:
 if f1=="first":
   c="first"
   break
 elif(f1=="second"):
    c="second"
    break
 elif(f1=="third"):
    c="third"
    break
 elif(f1=="fourth"):
    c="fourth"
    break
 else:
    c=""

print(c)
f.write("\nxyear("+'"'+c+'"'+").")

words=text_after_stopword
branch_name='csss'
zz=1
if(('branch' in words) or ('course' in words)): 
    if(('cse' in words )or('computer' in words and 'science' in words and 'engineering' in words)):
        branch_name= 'cse'
        zz=1
    elif(('csss' in words) or('computer' in words and 'science' in words and 'and' in words and 'social'  in words and 'science' in words) ):
        branch_name='csss'
        zz=4
    elif(('csai' in words) or('computer' in words and 'science' in words and 'and' in words and 'artificial' in words and 'intelligence' in words) ):
        branch_name='csai'
        zz=3
    elif(('ece' in words) or('electronics' in words and 'and' in words and 'communication' in words and 'engineering' in words) ):
        branch_name='ece'
        zz=7
    elif(('csb' in words) or('computer' in words and 'science' in words and 'and' in words and 'biology' in words)):
        branch_name='csb'
        zz=6
    elif(('csd' in words) or('computer' in words and 'science' in words  and 'and' in words and 'design' in words)):
        branch_name='csd'
        zz=5
    elif(('csam' in words) or('computer' in words and 'science' in words and 'and' in words and 'mathematics' in words)):
        branch_name='csam'
        zz=2
    else:
        branch_name='' 

    f.write("\nmybranch("+str(zz)+").")
    f.write("\nmybranchname("+branch_name+").")


#gpa 

curr_gpa=7.5 
for new_w in nltk.sent_tokenize(file_c):    
    if('gpa' in words or 'cgpa' in  [bb.text.lower() for bb in eg(new_w)] or 'sgpa' in [bb.text.lower() for bb in eg(new_w)]):   
        for token in eg(new_w): 
            if(token.pos_ == 'NUM'): 
                curr_gpa=float(token.text)

f.write("\ncurr_GPA("+ str(curr_gpa)+ ").")


# done btp


btp_done='n'
if('btp' in text_after_stopword  or 'research' in text_after_stopword): 
    btp_done='y'
if btp_done=='y':
    f.write("\ndone_btp("+"y"+").")

else:
    f.write("\ndone_btp("+"n"+").")

done_btp_course=""
if(btp_done=='y'):
 if branch_name=='cse':
   if ('mobile' in text_after_stopword and 'computing' in text_after_stopword):

        done_btp_course="'"+'mobile computing'+"'"+','
   elif('hardware' in text_after_stopword  and 'theory'  in text_after_stopword):
        done_btp_course="'"+'hardware theory'+"'"+','
   elif('data' in text_after_stopword  and 'analytics'  in text_after_stopword):
        done_btp_course="'"+'data analytics'+"'"+','

   elif('image' in text_after_stopword  and  'analysis'  in text_after_stopword):
        done_btp_course="'"+'image analytics'+"'"+','
   elif('machine' in text_after_stopword  and 'learning'  in text_after_stopword):
        done_btp_course="'"+'machine learning'+"'"+','
   done_btp_course='['+done_btp_course
   done_btp_course=done_btp_course[:-1]
   done_btp_course=done_btp_course+']'
   print(done_btp_course)
   f.write("\ndone_btp_course("+ done_btp_course+ ").")
     
  

 elif branch_name=='csai':
   if ((('artificial' in text_after_stopword  and 'intelligence' in text_after_stopword ) or 'ai'in text_after_stopword  or 'aI' in text_after_stopword ) and' healthcare' in text_after_stopword):
        done_btp_course="'"+'ai in healthcare'+"'"+','
   elif('human' in text_after_stopword  and 'centred' in text_after_stopword  and ('ai' in text_after_stopword  or ('artificial' in text_after_stopword  and 'intelligence' in text_after_stopword )) ):
        done_btp_course="'"+'human centred ai'+"'"+','
   elif('computer' in text_after_stopword  and 'vision'  in text_after_stopword):
        done_btp_course="'"+'computer vision'+"'"+','
   elif('information' in text_after_stopword   and  'retreival'  in text_after_stopword):
        done_btp_course="'"+'information retreival'+"'"+','
   elif('collaborative' in text_after_stopword  and 'filtering'  in text_after_stopword):
        done_btp_course="'"+'collaborative filtering'+"'"+','
   elif('robotics' in text_after_stopword  or 'robots' in text_after_stopword):
        done_btp_course="'"+'robotics'+"'"+','
   done_btp_course='['+done_btp_course
   done_btp_course=done_btp_course[:-1]
   done_btp_course=done_btp_course+']'
   print(done_btp_course)
   f.write("\ndone_btp_course("+ done_btp_course+ ").")


 elif branch_name=='ece':
   if ('communication' in text_after_stopword  and 'systems' in text_after_stopword):
        done_btp_course="'"+'communication systems'+"'"+','
   elif('signal' in text_after_stopword  and 'processing'  in text_after_stopword):
        done_btp_course="'"+'signal processing'+"'"+','
   elif('internet' in text_after_stopword  and 'things'  in text_after_stopword):
        done_btp_course="'"+'internet of things'+"'"+','
   elif('machine learning' in text_after_stopword  and  'learning'  in text_after_stopword):
        done_btp_course="'"+'machine learning'+"'"+','
   done_btp_course='['+done_btp_course
   done_btp_course=done_btp_course[:-1]
   done_btp_course=done_btp_course+']'
   print(done_btp_course)
   f.write("\ndone_btp_course("+ done_btp_course+ ").")



 elif branch_name=='csam':
   if ('number' in text_after_stopword  and 'theory' in text_after_stopword):
        done_btp_course="'"+'number theory'+"'"+','
   elif('advanced' in text_after_stopword  and 'programming'  in text_after_stopword):
        done_btp_course="'"+'advanced programming'+"'"+','
   elif('scientific' in text_after_stopword  and 'computing'  in text_after_stopword):
        done_btp_course="'"+'scientific computing'+"'"+','
   elif('graph'  in text_after_stopword  and  'theory'  in text_after_stopword):
        done_btp_course="'"+'graph theory'+"'"+','
   elif('database' in text_after_stopword  and 'management' in text_after_stopword  and 'systems'  in text_after_stopword):
        done_btp_course="'"+'database management systems'+"'"+','
   done_btp_course='['+done_btp_course
   done_btp_course=done_btp_course[:-1]
   done_btp_course=done_btp_course+']'
   print(done_btp_course)
   f.write("\ndone_btp_course("+ done_btp_course+ ").")

 elif branch_name=='csss':
   #print("TTTTTTTTTTTTTTTTTFFFFFFFF")
   if ('machine' in text_after_stopword  and 'learning' in text_after_stopword):
     #   print("TTTTTTTTTTTTT")
        done_btp_course="'"+'machine learning'+"'"+','
   elif('cognitive' in text_after_stopword  and 'psychology'  in text_after_stopword):
        done_btp_course="'"+'cognitive psychology'+"'"+','
   elif('data' in text_after_stopword  and 'mining'  in text_after_stopword):
        done_btp_course="'"+'data mining'+"'"+','
   elif('privacy'  in text_after_stopword  and  'security' in text_after_stopword and 'online' in text_after_stopword  and 'social' in text_after_stopword  and 'media'  in text_after_stopword):
        done_btp_course="'"+'privacy and security in online social media' +"'"+','
   elif('social' in text_after_stopword  and 'network' in text_after_stopword  and 'analysis'  in text_after_stopword):
        done_btp_course="'"+'social network analysis'+"'"+','

   elif('computer'in text_after_stopword  and 'vision'  in text_after_stopword):
        done_btp_course="'"+'computer vision'+"'"+','
   done_btp_course='['+done_btp_course
   done_btp_course=done_btp_course[:-1]
   done_btp_course=done_btp_course+']'
   print(done_btp_course)
   f.write("\ndone_btp_course("+ done_btp_course+ ").")

 elif branch_name=='csb':

   if ('machine ' in text_after_stopword  and 'learning' in text_after_stopword):
        done_btp_course="'"+'machine learning'+"'"+','
   elif('computer' in text_after_stopword  and 'networks'  in text_after_stopword):
        done_btp_course="'"+'compter networks'+"'"+','
   elif('natural' in text_after_stopword  and 'processing' in text_after_stopword  and 'language'  in text_after_stopword):
        done_btp_course="'"+'natural processing language'+"'"+','
   elif('data' in text_after_stopword and 'science'in text_after_stopword  and 'genomics'  in text_after_stopword):
        done_btp_course="'"+'data science in genomics'+"'"+','
   elif('social' in text_after_stopword  and 'network' in text_after_stopword  and 'analysis'  in text_after_stopword):
        done_btp_course="'"+'social network analysis'+"'"+','

   elif('computer' in text_after_stopword  and 'vision'  in text_after_stopword):
        done_btp_course="'"+'computer vision'+"'"+','

   elif('big' in text_after_stopword  and 'data' in text_after_stopword  and 'analytics'  in text_after_stopword):
        done_btp_course="'"+'big data analytics'+"'"+','

   elif('cryptocurrency' in text_after_stopword  and 'blockchain'  in text_after_stopword):
        done_btp_course="'"+'blockchain and cryptocurrency'+"'"+','

   elif('cryptography'  in text_after_stopword):
        done_btp_course='cryptography'+"'"+','
   done_btp_course='['+done_btp_course
   done_btp_course=done_btp_course[:-1]
   done_btp_course=done_btp_course+']'
   print(done_btp_course)
   f.write("\ndone_btp_course("+ done_btp_course+ ").")


 elif branch_name=='csd':    
   if ('2D'  in text_after_stopword  and '3D' in text_after_stopword and 'animations' in text_after_stopword):
        done_btp_course="'"+'2D and 3D animations'+"'"+','
   elif('computer' in text_after_stopword  and 'game' in text_after_stopword and 'design' in text_after_stopword  and 'development'  in text_after_stopword):
        done_btp_course="'"+'computer game design and development'+"'"+','
   elif('machine' in text_after_stopword  and 'learning'  in text_after_stopword):
        done_btp_course="'"+'machine learning'+"'"+','
   elif('computer'in text_after_stopword  and 'graphics'  in text_after_stopword):
        done_btp_course="'"+'computer graphics'+"'"+','
   elif('data' in text_after_stopword and 'mining'  in text_after_stopword):
        done_btp_course="'"+'data mining'+"'"+','

   elif('image' in text_after_stopword and 'processing'  in text_after_stopword):
        done_btp_course="'"+'image processing'+"'"+','

   done_btp_course='['+done_btp_course
   done_btp_course=done_btp_course[:-1]
   done_btp_course=done_btp_course+']'
   print(done_btp_course)
   f.write("\ndone_btp_course("+ done_btp_course+ ").")
z='1'
x='0'
w=set(text_after_stopword)
#print(w)
if('minor' in w or 'minors' in w): 
    z='1'
    if('entrepreneurship' in w or 'entrepreneurships' in w): 
     #print("TTTTTTTTTTTTTTTTTTT")
     x='1'
    elif('computational' in w and 'biology' in w): 
   #  print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS")
     x='2'
    elif('economics' in w or 'finance' in w):
     x='3'
else: 
    z='0'

if z=='1':
        f.write("\nminor_choice_want("+ str(z)+ ").")
        if x=='1':

         f.write("\nchooseSub("+ str(x)+ ").")
        elif x=='2':
    #     print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
         f.write("\nchooseSub("+ str(x)+ ").")        
        elif x=='3':

         f.write("\nchooseSub("+ str(x)+ ").")
        
else:
        f.write("\nminor_choice_want("+ str(z)+ ").")



str1=""
ff=1
w=set(text_after_stopword)
if(('career' in w or'preference'in w) or ('interested' in w)):
     if('job' in w or 'company' in w):
        f.write("\ncareer_preference("+ str(ff)+ ").")
        print("GGGGGGGGG")
        if('dsa' in w):
          str1=str1+"'"+'DSA'+"'"+','
  #        print(str1)
        if('ip' in w):     
          str1=str1+"'"+'IP'+"'"+','
        if('ap' in w):
          str1=str1+"'"+'AP'+"'"+','
        if('dbms' in w):
          str1=str1+"'"+'DBMS'+"'"+','
        if('os' in w):
          str1=str1+"'"+'OS'+"'"+','
        if('ada' in w):
          str1=str1+"'"+'ADA'+"'"+','

        str1='['+str1
        str1=str1[:-1]
        str1=str1+']'
        print(str1)
        f.write("\npre_requisites("+ str1+ ").")




          

     elif('research' in w or 'foreign' in w):
        ff=2
        f.write("\ncareer_preference("+ str(ff)+ ").")

          

     elif('startup' in w or 'entrepreneurship' in w):
        ff=3
        f.write("\ncareer_preference("+ str(ff)+ ").")

          



str1=""
if branch_name=='cse':
   if ('dbms' in text_after_stopword):
          str1=str1+"'"+'DBMS'+"'"+','
   if('ip' in text_after_stopword):
          str1=str1+"'"+'IP'+"'"+','

          str1=str1+"'"+'M3'+"'"+','
   if('ps' in text_after_stopword):
          str1=str1+"'"+'PS'+"'"+','
   if('m1'  in text_after_stopword):
          str1=str1+"'"+'M1'+"'"+','
   str1='['+str1
   str1=str1[:-1]
   str1=str1+']'
   print(str1)
   f.write("\ncourse_done("+ str1+ ").")

  

elif branch_name=='csai':
   if('la' in text_after_stopword):
          str1=str1+"'"+'LA'+"'"+','  
   if('ap' in text_after_stopword):
          str1=str1+"'"+'AP'+"'"+','
   if('ip' in text_after_stopword):
          str1=str1+"'"+'IP'+"'"+','

   if('dbms'  in text_after_stopword):
          str1=str1+"'"+'DBMS'+"'"+','
   if('m1'  in text_after_stopword):
          str1=str1+"'"+'M1'+"'"+','
   str1='['+str1
   str1=str1[:-1]
   str1=str1+']'
   print(str1)
   f.write("\ncourse_done("+ str1+ ").")



elif branch_name=='ece':

   if('sns' in text_after_stopword):
          str1=str1+"'"+'SNS'+"'"+','
   if('ip' in text_after_stopword):
          str1=str1+"'"+'IP'+"'"+','

   if('m3'  in text_after_stopword):
          str1=str1+"'"+'M3'+"'"+','
   if('ps' in text_after_stopword):
          str1=str1+"'"+'PS'+"'"+','
   if('m1'  in text_after_stopword):
          str1=str1+"'"+'M1'+"'"+','
   str1='['+str1
   str1=str1[:-1]
   str1=str1+']'
   print(str1)
   f.write("\ncourse_done("+ str1+ ").")





elif branch_name=='csam':
   if ('dm' in text_after_stopword):
          str1=str1+"'"+'DM'+"'"+','
   if ('dbms' in text_after_stopword):
          str1=str1+"'"+'DBMS'+"'"+','
   if('la' in text_after_stopword):
          str1=str1+"'"+'LA'+"'"+','
   if('ip' in text_after_stopword):
          str1=str1+"'"+'IP'+"'"+','

   if('m3'  in text_after_stopword):
          str1=str1+"'"+'M3'+"'"+','
   str1='['+str1
   str1=str1[:-1]
   str1=str1+']'
   print(str1)
   f.write("\ncourse_done("+ str1+ ").")



elif branch_name=='csss':
  # print("RRRRRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
   if ('dbms' in text_after_stopword):
         str1=str1+"'"+'DBMS'+"'"+','
         
   if('iop' in text_after_stopword):
         str1=str1+"'"+'IoP'+"'"+','
   if('ada'  in text_after_stopword):
          str1=str1+"'"+'ADA'+"'"+','
   if('la' in text_after_stopword):
          str1=str1+"'"+'LA'+"'"+','
   if('ip' in text_after_stopword):
          str1=str1+"'"+'IP'+"'"+','

   if('m3'  in text_after_stopword):
          str1=str1+"'"+'M3'+"'"+','
   if('ps' in text_after_stopword):
          str1=str1+"'"+'PS'+"'"+','
   if('m1'  in text_after_stopword):
          str1=str1+"'"+'M1'+"'"+','
   str1='['+str1
   str1=str1[:-1]
   str1=str1+']'
   print(str1)
   f.write("\ncourse_done("+ str1+ ").")



elif branch_name=='csb':
   if ('dm' in text_after_stopword):
          str1=str1+"'"+'DM'+"'"+','
   if ('ada' in text_after_stopword):
          str1=str1+"'"+'ADA'+"'"+','
   if ('dbms' in text_after_stopword):
          str1=str1+"'"+'DBMS'+"'"+','
   if('la' in text_after_stopword):
          str1=str1+"'"+'LA'+"'"+','
   if('ip' in text_after_stopword):
          str1=str1+"'"+'IP'+"'"+','

   if('m3'  in text_after_stopword):
          str1=str1+"'"+'M3'+"'"+','
   if('ps' in text_after_stopword):
          str1=str1+"'"+'PS'+"'"+','
   if('m1'  in text_after_stopword):
          str1=str1+"'"+'M1'+"'"+','
   str1='['+str1
   str1=str1[:-1]
   str1=str1+']'
   print(str1)
   f.write("\ncourse_done("+ str1+ ").")


elif branch_name=='csd':    
   if ('dbms' in text_after_stopword):
          str1=str1+"'"+'DBMS'+"'"+','
   if('la' in text_after_stopword):
          str1=str1+"'"+'LA'+"'"+','
   if('ip' in text_after_stopword):
          str1=str1+"'"+'IP'+"'"+','

   if('m3'  in text_after_stopword):
          str1=str1+"'"+'m3'+"'"+','
   if('ps' in text_after_stopword):
          str1=str1+"'"+'PS'+"'"+','
   if('m1'  in text_after_stopword):
          str1=str1+"'"+'M1'+"'"+','
   str1='['+str1
   str1=str1[:-1]
   str1=str1+']'
   print(str1)
   f.write("\ncourse_done("+ str1+ ").")


