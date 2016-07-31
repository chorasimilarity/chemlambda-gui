BEGIN { 

# forked from check_1_foe.awk version 22.09.2014
#
# this program reads a .mol file and produces the initial addNode, addLink chunk for the visualiser.  
# owner: chorasimilarity (Marius Buliga, http://chorasimilarity.wordpress.com/ )
#

      main_const=4;

      left=2;

      right=1;

      middle=1;

#     green_col="#8CC152";

# true one       green_col="#04B431";
       
#CRESCIMENTO      green_col="#2a6d00";

      green_col="#ade747";

#      green_col="#9fc952";

# #fe8f0f #f7325e #7dc410 #fef8cf #0264ed #222

      
#    red_col="#FF0000";

#     in_col="#FFCE54";
     
#     foe_col="#AD0468"

#     out_col="#4A89DC";

      
# true one     red_col="#FF0000";

#CRESCIMENTO      red_col="#b80000";

      red_col="#be66dd";

#      red_col="#ed2525";

# true one     in_col="#FFFF00";
     
#CRESCIMENTO      in_col="#91009a";

      in_col="#f6cf84";

#      in_col="#fbfd37";

#     foe_col="#AD0468"

#true one     out_col="#2E2EFE";

#CRESCIMENTO      out_col="#150070";

      out_col="#6ecae5";

#      out_col="#a8e2f9";

     bond_int=2;

     bond_ext=1;

     term_col="#222";


#true one     arrow_col="#ffffff";

#CRESCIMENTO     arrow_col="#f0a900";

               arrow_col="#f0bf26";

#               arrow_col="#fffab2";

       count_lines=0; 

       }

{


#
#   node  has as argument the node number and as value the node record, as read from the input .mol file
#


#
# a .mol file is simply a list of nodes and their ports. Each node is on a line, for example T[a] is written "T a" , Arrow[a,b] is written "Arrow a b" and FO[a,b,c] is written "FO a b c"
#
#



# ignores the lines with less than 2 fields  (no loop element)

      if (NF == 2) {

       node[NR]=$0;      node_type[NR]=$1;
       
       node_port_1[NR]=$2; 
       
        }


#
# node_type has as argument the node number and as value the node type.

       if ( NF == 3 ) {  node_type[NR]=$1;  node[NR]=$0;
       
       node_port_1[NR]=$2;
       
       node_port_2[NR]=$3;}

       if (NF == 4) {  node_port_1[NR]=$2;  node[NR]=$0; node_type[NR]=$1; 
       
       node_port_2[NR]=$3; node_port_3[NR]=$4; }
                      

}

END { 

             srand();

       
#
#
#

j=0;


for ( i in node) {

                  
                  
                  s=node_type[i];
                  
                  if (s == "A") {   a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];

                                  used_port_e[a]++;
                                  used_port_e[b]++;
                                  used_port_e[c]++;

# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=green_col;
                                  all_node_id[j]=j;
                                  
                                  
                                  j1=j "_1";
                                  j2=j "_2";
                                  j3=j "_3";
                                  
                                  je_1=j "_e1";
                                  je_2=j "_e2";
                                  je_3=j "_e3";
 
                                  all_node_atom[j1]="5";
                                  all_node_size[j1]=left;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                  
                                  all_node_atom[j2]="6";
                                  all_node_size[j2]=right;
                                  all_node_colour[j2]=in_col;
                                  all_node_id[j2]=j2;
                                  all_edge_int[j2]=je_2;
                                  all_edge_out[j2]=b;
                                  all_edge_target[b]=j2; 
                                 
                                  all_node_atom[j3]="2";
                                  all_node_size[j3]=middle;
                                  all_node_colour[j3]=out_col;
                                  all_node_id[j3]=j3;
                                  all_edge_int[j3]=je_3;
                                  all_edge_out[j3]=c;
                                  all_edge_source[c]=j3;                           
                                  
# definition of internal edges
                                  
                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  all_edge_source[je_2]=j;  
                                  all_edge_target[je_2]=j2; 
                                  all_edge_bond[je_2]=bond_int;
                                  
                                  all_edge_source[je_3]=j; 
                                  all_edge_target[je_3]=j3; 
                                  all_edge_bond[je_3]=bond_int;
                                 
                                  j++;
                                  }


                    if (s == "FI") {  a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];


                                  used_port_e[a]++;
                                  used_port_e[b]++;
                                  used_port_e[c]++;


# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=red_col;
                                  all_node_id[j]=j;


                                  
                                  j1=j "_1";
                                  j2=j "_2";
                                  j3=j "_3";
                                  
                                  je_1=j "_e1";
                                  je_2=j "_e2";
                                  je_3=j "_e3";
 


                                  all_node_atom[j1]="6";
                                  all_node_size[j1]=left;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                  all_node_atom[j2]="6";
                                  all_node_size[j2]=right;
                                  all_node_colour[j2]=in_col;
                                  all_node_id[j2]=j2;
                                   all_edge_int[j2]=je_2;
                                  all_edge_out[j2]=b;
                                  all_edge_target[b]=j2; 
                                 
                                  all_node_atom[j3]="2";
                                  all_node_size[j3]=middle;
                                  all_node_colour[j3]=out_col;
                                  all_node_id[j3]=j3;
                                  all_edge_int[j3]=je_3;
                                  all_edge_out[j3]=c;
                                  all_edge_source[c]=j3;               
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  all_edge_source[je_2]=j;  
                                  all_edge_target[je_2]=j2; 
                                  all_edge_bond[je_2]=bond_int;
                                  
                                  all_edge_source[je_3]=j; 
                                  all_edge_target[je_3]=j3; 
                                  all_edge_bond[je_3]=bond_int;
                                  

                                  j++;
                                  }


                    if (s == "L") { a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                    

                                  used_port_e[a]++;
                                  used_port_e[b]++;
                                  used_port_e[c]++;



# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=red_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  j2=j "_2";
                                  j3=j "_3";
                                  
                                  je_1=j "_e1";
                                  je_2=j "_e2";
                                  je_3=j "_e3";
 


                                  all_node_atom[j1]="6";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                  
                                  all_node_atom[j2]="5";
                                  all_node_size[j2]=left;
                                  all_node_colour[j2]=out_col;
                                  all_node_id[j2]=j2;
                                  all_edge_int[j2]=je_2;
                                  all_edge_out[j2]=b;
                                  all_edge_source[b]=j2; 
                                  
                                 
                                  all_node_atom[j3]="1";
                                  all_node_size[j3]=right;
                                  all_node_colour[j3]=out_col;
                                  all_node_id[j3]=j3;
                                  all_edge_int[j3]=je_3;
                                  all_edge_out[j3]=c;
                                  all_edge_source[c]=j3; 
                                                    
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  all_edge_source[je_2]=j;  
                                  all_edge_target[je_2]=j2; 
                                  all_edge_bond[je_2]=bond_int;
                                  
                                  all_edge_source[je_3]=j; 
                                  all_edge_target[je_3]=j3; 
                                  all_edge_bond[je_3]=bond_int;
                                  

                                  j++;
                                  

                                  }
                                  


                                  
                                  
                    if (s == "FO" ) {  a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                    

                                  used_port_e[a]++;
                                  used_port_e[b]++;
                                  used_port_e[c]++;

# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=green_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  j2=j "_2";
                                  j3=j "_3";
                                  
                                  je_1=j "_e1";
                                  je_2=j "_e2";
                                  je_3=j "_e3";


                                  all_node_atom[j1]="4";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                  all_node_atom[j2]="4";
                                  all_node_size[j2]=left;
                                  all_node_colour[j2]=out_col;
                                  all_node_id[j2]=j2;
                                  all_edge_int[j2]=je_2;
                                  all_edge_out[j2]=b;
                                  all_edge_source[b]=j2; 
                                 
                                  all_node_atom[j3]="3";
                                  all_node_size[j3]=right;
                                  all_node_colour[j3]=out_col;
                                  all_node_id[j3]=j3;
                                  all_edge_int[j3]=je_3;
                                  all_edge_out[j3]=c;
                                  all_edge_source[c]=j3; 
                                                    
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  all_edge_source[je_2]=j;  
                                  all_edge_target[je_2]=j2; 
                                  all_edge_bond[je_2]=bond_int;
                                  
                                  all_edge_source[je_3]=j; 
                                  all_edge_target[je_3]=j3; 
                                  all_edge_bond[je_3]=bond_int;
                                  

                                  j++;
                                  }
                                  
                                  
                                
                                  
                    if ( s == "FOE" ) {  a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                    

                                  used_port_e[a]++;
                                  used_port_e[b]++;
                                  used_port_e[c]++;
                    
# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=in_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  j2=j "_2";
                                  j3=j "_3";
                                  
                                  je_1=j "_e1";
                                  je_2=j "_e2";
                                  je_3=j "_e3";




                                  all_node_atom[j1]="3";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                  all_node_atom[j2]="4";
                                  all_node_size[j2]=left;
                                  all_node_colour[j2]=out_col;
                                  all_node_id[j2]=j2;
                                  all_edge_int[j2]=je_2;
                                  all_edge_out[j2]=b;
                                  all_edge_source[b]=j2; 
                                 
                                  all_node_atom[j3]="4";
                                  all_node_size[j3]=right;
                                  all_node_colour[j3]=out_col;
                                  all_node_id[j3]=j3;
                                  all_edge_int[j3]=je_3;
                                  all_edge_out[j3]=c;
                                  all_edge_source[c]=j3;        
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  all_edge_source[je_2]=j;  
                                  all_edge_target[je_2]=j2; 
                                  all_edge_bond[je_2]=bond_int;
                                  
                                  all_edge_source[je_3]=j; 
                                  all_edge_target[je_3]=j3; 
                                  all_edge_bond[je_3]=bond_int;
                                  

                                  j++;
                                  }
                                  
                                  
                           
                                  
                    if (s == "Arrow") {  a=node_port_1[i]; b=node_port_2[i];

                                  used_port_e[a]++;
                                  used_port_e[b]++;

# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=arrow_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  j2=j "_2";
                                  
                                  je_1=j "_e1";
                                  je_2=j "_e2";


                                  all_node_atom[j1]="1";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                  all_node_atom[j2]="6";
                                  all_node_size[j2]=middle;
                                  all_node_colour[j2]=out_col;
                                  all_node_id[j2]=j2;
                                  all_edge_int[j2]=je_2;
                                  all_edge_out[j2]=b;
                                  all_edge_source[b]=j2; 
                                             
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  all_edge_source[je_2]=j;  
                                  all_edge_target[je_2]=j2; 
                                  all_edge_bond[je_2]=bond_int;
                                  
                                  

                                  j++;
                                  }
                                  
                                                                  
    

                                  
                    if (s == "T" ) { a=node_port_1[i];


                                  used_port_e[a]++;

# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=term_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  
                                  je_1=j "_e1";


                                  
                                  all_node_atom[j1]="2";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                             
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  

                                  j++;
                                  }




                    if (s == "FROUT" ) {  a=node_port_1[i]; 

                                 used_port_e[a]++;

# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=out_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  
                                  je_1=j "_e1";


                                  all_node_atom[j1]="6";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                             
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  

                                  j++;
                                  }




                    if (s == "FRIN" ) { a=node_port_1[i]; 


                                 used_port_e[a]++;


# definition of nodes: 

                                  all_node_atom[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=in_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  
                                  je_1=j "_e1";


                                  all_node_atom[j1]="5";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=out_col;
                                  all_node_id[j1]=j1;
                                 all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_source[a]=j1; 
                                  
                                             
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;
                                  
                                  

                                  j++;
                                  }




                 }




# add FRIN and FROUT nodes, if they are needed, and the bond property

 

    for (a in used_port_e ) {  
    
    all_edge_bond[a]=bond_ext;
    
    k=used_port_e[a];
    
  
    
    if ( k==1 ) {  if (a in all_edge_source ) {  
    
    j++;
                                   used_port_e[a]++;

# definition of nodes: 

                                  all_node_atom[j]="FROUT";
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=out_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  
                                  je_1=j "_e1";


                                  all_node_atom[j1]="6";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=in_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_target[a]=j1; 
                                  
                                             
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;

    
      }     else {
     
        j++;
    
                                used_port_e[a]++;


# definition of nodes: 

                                  all_node_atom[j]="FRIN";
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=in_col;
                                  all_node_id[j]=j;


                                  j1=j "_1";
                                  
                                  je_1=j "_e1";


                                  all_node_atom[j1]="5";
                                  all_node_size[j1]=middle;
                                  all_node_colour[j1]=out_col;
                                  all_node_id[j1]=j1;
                                  all_edge_int[j1]=je_1;
                                  all_edge_out[j1]=a;
                                  all_edge_source[a]=j1; 
                                  
                                             
                                  
# definition of internal edges


                                  all_edge_source[je_1]=j;  
                                  all_edge_target[je_1]=j1; 
                                  all_edge_bond[je_1]=bond_int;

      
      
      }}
    
    
    }

#    j--;
    jmax=j;





#rename the edges in a more economical way: all_edge_source, all_edge_target, all_edge_bond for a in used_port_e, all_edge_out for j in all_edge_out

  jedge=0;

  for (a in used_port_e) {

  edge[a]=jedge;

  iedge[jedge]=a;


   
    jedge++;
    
}

#    jedge--;

  for (a in used_port_e) {

  u=all_edge_source[a];
  v=all_edge_target[a];
  w=all_edge_bond[a];

  ap=edge[a];

  temp_all_edge_source[ap]=u;
  temp_all_edge_target[ap]=v;
  temp_all_edge_bond[ap]=w;

  delete all_edge_source[a];
  delete all_edge_target[a];
  delete all_edge_bond[a];
  
}

 
 for (ap in temp_all_edge_source) {

  u=temp_all_edge_source[ap];
  v=temp_all_edge_target[ap];
  w=temp_all_edge_bond[ap];

  all_edge_source[ap]=u;
  all_edge_target[ap]=v;
  all_edge_bond[ap]=w;

}

   
for (ap in temp_all_edge_source) { 
  delete temp_all_edge_source[ap];
  delete temp_all_edge_target[ap];
  delete temp_all_edge_bond[ap];
  
}


for (j in all_edge_out){

  a=all_edge_out[j];

  all_edge_out[j]=edge[a];

}



# print the first part of the html file, for the moment is called essy.txt

    printf(" \n") > "essy.txt" ;

    for (r in all_node_atom ) {

     vuvu="graph.addNode( \"" all_node_id[r] "\", \"" all_node_atom[r] "\",  " all_node_size[r] ",  \"" all_node_colour[r] "\"); \n" ; 

      printf(vuvu) >> "essy.txt";



                               }

     for(e in all_edge_source ) {

         vivi="graph.addLink( \"" all_edge_source[e] "\", \"" all_edge_target[e] "\",  \"" all_edge_bond[e] "\"); \n" ; 

      printf(vivi) >> "essy.txt";


          }

        dodo="keepNodesOnTop()\; \n \n         var step = -1\; \n \n         function nextval() \{ \n step++\; \n return 2000 + (40*step)\;  \} \n " ; 

      printf(dodo) >> "essy.txt";


# defines the matrix of moves

   move[11]="COMB";
   move[12]="LT";
   move[13]="LFOE";
   move[14]="LFO";
   move[15]="BETA";
   move[21]="COMB";
   move[22]="AT";
   move[23]="FID";
   move[24]="AFO";
   move[31]="COMB";
   move[32]="FO3T";
   move[33]="FOFOE";
   move[41]="COMB";
   move[42]="FO2FOET";
   move[51]="COMB";


gugu=0;
counter=0;

while (counter<1500) {

# counter for the new nodes or links added or removed

coact=0;

# 


###############

## order of operations: 
## 1. add the new nodes and ports in the html file, put the new nodes in the awk file in a proposed_add
## 2. add the internal edges of the new nodes in the html file, put the new edges in the awk file in a proposed_add
## 3. take a pause in html
## 4. remove the old edges in the html file 
## 5. remove the old nodes in the html file
## 6. add the new edges in the html file (before the comb moves)
## 7. do the COMB moves
## 8. update  the awk database of nodes and edges
## 9. reset all the temporary arrays



###############




#   FOFOE, which appears as move 33. It then blocks the nodes which participate to this move. 
    
    parame=int(2 * rand());
    
    if ( parame==0) {
    
    for (ku in all_edge_source) { bon=all_edge_bond[ku];
    
    
    
    if ( bon==bond_ext) {
    
    targ=all_edge_target[ku];
    sour=all_edge_source[ku];

     tarl=all_edge_int[targ];
     sourl=all_edge_int[sour];
    
    targe=all_edge_source[tarl];
    sourc=all_edge_source[sourl];
    
    bubu=all_node_atom[sour] all_node_atom[targ];
    
    if ( bubu=="33" ) { 

       node_block[targe]++;
       node_block[sourc]++;

       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";
      treii=all_node_id[targe] "_2";
      patruu=all_node_id[targe] "_3";

 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];
      trei=all_edge_out[treii];
      patru=all_edge_out[patruu];




      junu=jmax+1;
      jdoi=jmax+2;
      jtrei=jmax+3;
      jpatru=jmax+4;

      intera=jedge+1;
      interb=jedge+2;
      interc=jedge+3;
      interd=jedge+4;

      jmax=jmax+4;
      jedge=jedge+4;


    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[treii]++;
                                  proposed_remove_node[patruu]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;
                                  proposed_update_edge[trei]++;
                                  proposed_update_edge[patru]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou1=all_edge_int[treii];
                                  edisou2=all_edge_int[patruu];
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou1]++;
                                  proposed_remove_edge[edisou2]++;
                                  proposed_remove_edge[edisou3]++;

#proposed for add nodes and moves

                                  proposed_add_edge[intera]++;
                                  proposed_add_edge[interb]++;   
                                  proposed_add_edge[interc]++;
                                  proposed_add_edge[interd]++;                          


                                  proposed_all_edge_bond[intera]=bond_ext;
                                  proposed_all_edge_bond[interb]=bond_ext;   
                                  proposed_all_edge_bond[interc]=bond_ext;
                                  proposed_all_edge_bond[interd]=bond_ext;                                  

#definition of FOE node and edges, internal and external, in proposed_add


                                  proposed_all_node_atom[junu]="FOE";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=in_col;
                                  proposed_all_node_id[junu]=junu;

                                  j1=junu "_1";
                                  j2=junu "_2";
                                  j3=junu "_3";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";
                                  je_3=junu "_e3";




                                  proposed_all_node_atom[j1]="3";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interc;
                                  proposed_all_edge_source[interc]=j2; 
                                 
                                  proposed_all_node_atom[j3]="4";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=interd;
                                  proposed_all_edge_source[interd]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=junu; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  



#definition of FI node and edges, internal and external


                                  proposed_all_node_atom[jdoi]="FI";
                                  proposed_all_node_size[jdoi]=main_const;
                                  proposed_all_node_colour[jdoi]=red_col;
                                  proposed_all_node_id[jdoi]=jdoi;
                                  
                                  j1=jdoi "_1";
                                  j2=jdoi "_2";
                                  j3=jdoi "_3";
                                  
                                  je_1=jdoi "_e1";
                                  je_2=jdoi "_e2";
                                  je_3=jdoi "_e3";
                                  


                                  proposed_all_node_atom[j1]="6";
                                  proposed_all_node_size[j1]=left;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interb;
                                  proposed_all_edge_target[interb]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=right;
                                  proposed_all_node_colour[j2]=in_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=intera;
                                  proposed_all_edge_target[intera]=j2; 
                                 
                                  proposed_all_node_atom[j3]="2";
                                  proposed_all_node_size[j3]=middle;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=doi;
                                  proposed_all_edge_source[doi]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=jdoi;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jdoi;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jdoi; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  




#definition of FO node and edges, internal and external



                                  proposed_all_node_atom[jtrei]="FO";
                                  proposed_all_node_size[jtrei]=main_const;
                                  proposed_all_node_colour[jtrei]=green_col;
                                  proposed_all_node_id[jtrei]=jtrei;

                                  j1=jtrei "_1";
                                  j2=jtrei "_2";
                                  j3=jtrei "_3";
                                  
                                  je_1=jtrei "_e1";
                                  je_2=jtrei "_e2";
                                  je_3=jtrei "_e3";




                                  proposed_all_node_atom[j1]="4";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interc;
                                  proposed_all_edge_target[interc]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=intera;
                                  proposed_all_edge_source[intera]=j2; 
                                 
                                  proposed_all_node_atom[j3]="3";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=trei;
                                  proposed_all_edge_source[trei]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=jtrei;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jtrei;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jtrei; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  





#definition of FO node and edges, internal and external

                                  proposed_all_node_atom[jpatru]="FO";
                                  proposed_all_node_size[jpatru]=main_const;
                                  proposed_all_node_colour[jpatru]=green_col;
                                  proposed_all_node_id[jpatru]=jpatru;

                                  j1=jpatru "_1";
                                  j2=jpatru "_2";
                                  j3=jpatru "_3";
                                  
                                  je_1=jpatru "_e1";
                                  je_2=jpatru "_e2";
                                  je_3=jpatru "_e3";




                                  proposed_all_node_atom[j1]="4";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interd;
                                  proposed_all_edge_target[interd]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interb;
                                  proposed_all_edge_source[interb]=j2; 
                                 
                                  proposed_all_node_atom[j3]="3";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=patru;
                                  proposed_all_edge_source[patru]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=jpatru;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jpatru;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jpatru; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  


             


       }
    
    
    
    }
    
    #end of FOFOE
    }

#end random parame for FOFOE 
}

# the other moves DIST: 23 and all_node_atom[sourc]=="A" , 13 LFO and LFOE, 24 AFO, FIFO (has FO instead of FOE)

    for (ku in all_edge_source) { bon=all_edge_bond[ku];
    
    if ( bon==bond_ext) {

    
    targ=all_edge_target[ku];
    sour=all_edge_source[ku];

     tarl=all_edge_int[targ];
     sourl=all_edge_int[sour];
    
    targe=all_edge_source[tarl];
    sourc=all_edge_source[sourl];
    
    bubu=all_node_atom[sour] all_node_atom[targ];

#LFOE, LFO  
  
   parame=int(2 * rand());
    
    if ( parame==0) {

  
    if ( bubu=="13" || bubu=="14" ) { if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {

       node_block[targe]++;
       node_block[sourc]++;


       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";
      treii=all_node_id[targe] "_2";
      patruu=all_node_id[targe] "_3";

 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];
      trei=all_edge_out[treii];
      patru=all_edge_out[patruu];




      junu=jmax+1;
      jdoi=jmax+2;
      jtrei=jmax+3;
      jpatru=jmax+4;

      intera=jedge+1;
      interb=jedge+2;
      interc=jedge+3;
      interd=jedge+4;

      jmax=jmax+4;
      jedge=jedge+4;


    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[treii]++;
                                  proposed_remove_node[patruu]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;
                                  proposed_update_edge[trei]++;
                                  proposed_update_edge[patru]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou1=all_edge_int[treii];
                                  edisou2=all_edge_int[patruu];
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou1]++;
                                  proposed_remove_edge[edisou2]++;
                                  proposed_remove_edge[edisou3]++;
                                  
#proposed for add nodes and moves

                                  proposed_add_edge[intera]++;
                                  proposed_add_edge[interb]++;   
                                  proposed_add_edge[interc]++;
                                  proposed_add_edge[interd]++;           

                                  proposed_all_edge_bond[intera]=bond_ext;
                                  proposed_all_edge_bond[interb]=bond_ext;   
                                  proposed_all_edge_bond[interc]=bond_ext;
                                  proposed_all_edge_bond[interd]=bond_ext;                                  


#definition of FOE node and edges, internal and external, in proposed_add


                                  proposed_all_node_atom[junu]="FOE";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=in_col;
                                  proposed_all_node_id[junu]=junu;

                                  j1=junu "_1";
                                  j2=junu "_2";
                                  j3=junu "_3";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";
                                  je_3=junu "_e3";




                                  proposed_all_node_atom[j1]="3";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interc;
                                  proposed_all_edge_source[interc]=j2; 
                                 
                                  proposed_all_node_atom[j3]="4";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=interd;
                                  proposed_all_edge_source[interd]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;

                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=junu; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  



#definition of FI node and edges, internal and external


                                  proposed_all_node_atom[jdoi]="FI";
                                  proposed_all_node_size[jdoi]=main_const;
                                  proposed_all_node_colour[jdoi]=red_col;
                                  proposed_all_node_id[jdoi]=jdoi;
                                  
                                  j1=jdoi "_1";
                                  j2=jdoi "_2";
                                  j3=jdoi "_3";
                                  
                                  je_1=jdoi "_e1";
                                  je_2=jdoi "_e2";
                                  je_3=jdoi "_e3";
                                  


                                  proposed_all_node_atom[j1]="6";
                                  proposed_all_node_size[j1]=left;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interb;
                                  proposed_all_edge_target[interb]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=right;
                                  proposed_all_node_colour[j2]=in_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=intera;
                                  proposed_all_edge_target[intera]=j2; 
                                 
                                  proposed_all_node_atom[j3]="2";
                                  proposed_all_node_size[j3]=middle;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=doi;
                                  proposed_all_edge_source[doi]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;

                                  proposed_all_edge_source[je_1]=jdoi;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jdoi;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jdoi; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  




#definition of L node and edges, internal and external



                                  proposed_all_node_atom[jtrei]="L";
                                  proposed_all_node_size[jtrei]=main_const;
                                  proposed_all_node_colour[jtrei]=red_col;
                                  proposed_all_node_id[jtrei]=jtrei;

                                  j1=jtrei "_1";
                                  j2=jtrei "_2";
                                  j3=jtrei "_3";
                                  
                                  je_1=jtrei "_e1";
                                  je_2=jtrei "_e2";
                                  je_3=jtrei "_e3";




                                  proposed_all_node_atom[j1]="6";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interc;
                                  proposed_all_edge_target[interc]=j1; 
                                  
                                  proposed_all_node_atom[j2]="5";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=intera;
                                  proposed_all_edge_source[intera]=j2; 
                                 
                                  proposed_all_node_atom[j3]="1";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=trei;
                                  proposed_all_edge_source[trei]=j3;        
                                  
# definition of internal edges


                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;

                                  proposed_all_edge_source[je_1]=jtrei;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jtrei;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jtrei; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  





#definition of L node and edges, internal and external

                                  proposed_all_node_atom[jpatru]="L";
                                  proposed_all_node_size[jpatru]=main_const;
                                  proposed_all_node_colour[jpatru]=red_col;
                                  proposed_all_node_id[jpatru]=jpatru;

                                  j1=jpatru "_1";
                                  j2=jpatru "_2";
                                  j3=jpatru "_3";
                                  
                                  je_1=jpatru "_e1";
                                  je_2=jpatru "_e2";
                                  je_3=jpatru "_e3";




                                  proposed_all_node_atom[j1]="6";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interd;
                                  proposed_all_edge_target[interd]=j1; 
                                  
                                  proposed_all_node_atom[j2]="5";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interb;
                                  proposed_all_edge_source[interb]=j2; 
                                 
                                  proposed_all_node_atom[j3]="1";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=patru;
                                  proposed_all_edge_source[patru]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;
                                 
                                  proposed_all_edge_source[je_1]=jpatru;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jpatru;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jpatru; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                 


#end of LFOE, LFO
}}

#end of random parame for LFOE, LFO
}

    sourcetype=all_node_atom[sourc];

#AFO, AFOE 

#   printf("\n AFOE: sour= " sour " , targ= " targ " , sourcetype= " sourcetype " , bubu= " bubu " \n ") >> "essy.txt"; 

 parame=int(2 * rand());
    
    if ( parame==0) {


   if (sourcetype=="A") {if ( bubu=="23" || bubu=="24" ) { if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {

       node_block[targe]++;
       node_block[sourc]++;



       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";
      treii=all_node_id[targe] "_2";
      patruu=all_node_id[targe] "_3";

 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];
      trei=all_edge_out[treii];
      patru=all_edge_out[patruu];

#  printf("\n AFOE: unu= " unu " , doi= " doi " , trei= " trei " , patru= " patru " \n ") >> "essy.txt"; 

      junu=jmax+1;
      jdoi=jmax+2;
      jtrei=jmax+3;
      jpatru=jmax+4;

      intera=jedge+1;
      interb=jedge+2;
      interc=jedge+3;
      interd=jedge+4;

      jmax=jmax+4;
      jedge=jedge+4;


    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[treii]++;
                                  proposed_remove_node[patruu]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;
                                  proposed_update_edge[trei]++;
                                  proposed_update_edge[patru]++;


                                  

                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou1=all_edge_int[treii];
                                  edisou2=all_edge_int[patruu];
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou1]++;
                                  proposed_remove_edge[edisou2]++;
                                  proposed_remove_edge[edisou3]++;
                                  
#proposed for add nodes and moves

                                  proposed_add_edge[intera]++;
                                  proposed_add_edge[interb]++;   
                                  proposed_add_edge[interc]++;
                                  proposed_add_edge[interd]++;            

                                  proposed_all_edge_bond[intera]=bond_ext;
                                  proposed_all_edge_bond[interb]=bond_ext;   
                                  proposed_all_edge_bond[interc]=bond_ext;
                                  proposed_all_edge_bond[interd]=bond_ext;                                  



#definition of FOE node and edges, internal and external, in proposed_add


                                  proposed_all_node_atom[junu]="FOE";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=in_col;
                                  proposed_all_node_id[junu]=junu;

                                  j1=junu "_1";
                                  j2=junu "_2";
                                  j3=junu "_3";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";
                                  je_3=junu "_e3";




                                  proposed_all_node_atom[j1]="3";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=intera;
                                  proposed_all_edge_source[intera]=j2; 
                                 
                                  proposed_all_node_atom[j3]="4";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=interb;
                                  proposed_all_edge_source[interb]=j3;        
                                  
# definition of internal edges


                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=junu; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  



#definition of FOE node and edges, internal and external


                                  proposed_all_node_atom[jdoi]="FOE";
                                  proposed_all_node_size[jdoi]=main_const;
                                  proposed_all_node_colour[jdoi]=in_col;
                                  proposed_all_node_id[jdoi]=jdoi;
                                  
                                  j1=jdoi "_1";
                                  j2=jdoi "_2";
                                  j3=jdoi "_3";
                                  
                                  je_1=jdoi "_e1";
                                  je_2=jdoi "_e2";
                                  je_3=jdoi "_e3";
                                  


                                  proposed_all_node_atom[j1]="3";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=doi;
                                  proposed_all_edge_target[doi]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interc;
                                  proposed_all_edge_source[interc]=j2; 
                                 
                                  proposed_all_node_atom[j3]="4";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=interd;
                                  proposed_all_edge_source[interd]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=jdoi;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jdoi;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jdoi; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  




#definition of A node and edges, internal and external



                                  proposed_all_node_atom[jtrei]="A";
                                  proposed_all_node_size[jtrei]=main_const;
                                  proposed_all_node_colour[jtrei]=green_col;
                                  proposed_all_node_id[jtrei]=jtrei;

                                  j1=jtrei "_1";
                                  j2=jtrei "_2";
                                  j3=jtrei "_3";
                                  
                                  je_1=jtrei "_e1";
                                  je_2=jtrei "_e2";
                                  je_3=jtrei "_e3";




                                  proposed_all_node_atom[j1]="5";
                                  proposed_all_node_size[j1]=left;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=intera;
                                  proposed_all_edge_target[intera]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=right;
                                  proposed_all_node_colour[j2]=in_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interc;
                                  proposed_all_edge_target[interc]=j2; 
                                 
                                  proposed_all_node_atom[j3]="2";
                                  proposed_all_node_size[j3]=middle;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=trei;
                                  proposed_all_edge_source[trei]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;



                                  proposed_all_edge_source[je_1]=jtrei;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jtrei;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jtrei; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  





#definition of A node and edges, internal and external



                                  proposed_all_node_atom[jpatru]="A";
                                  proposed_all_node_size[jpatru]=main_const;
                                  proposed_all_node_colour[jpatru]=green_col;
                                  proposed_all_node_id[jpatru]=jpatru;

                                  j1=jpatru "_1";
                                  j2=jpatru "_2";
                                  j3=jpatru "_3";
                                  
                                  je_1=jpatru "_e1";
                                  je_2=jpatru "_e2";
                                  je_3=jpatru "_e3";




                                  proposed_all_node_atom[j1]="5";
                                  proposed_all_node_size[j1]=left;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interb;
                                  proposed_all_edge_target[interb]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=right;
                                  proposed_all_node_colour[j2]=in_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interd;
                                  proposed_all_edge_target[interd]=j2; 
                                 
                                  proposed_all_node_atom[j3]="2";
                                  proposed_all_node_size[j3]=middle;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=patru;
                                  proposed_all_edge_source[patru]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=jpatru;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jpatru;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jpatru; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  








#end of AFO, AFOE
}}}

#end of random parame for AFO, AFOE
}

# FIFO

 parame=int(2 * rand());
    
    if ( parame==0) {


   if (sourcetype=="FI") {if ( bubu=="24") { if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {

       node_block[targe]++;
       node_block[sourc]++;


       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";
      treii=all_node_id[targe] "_2";
      patruu=all_node_id[targe] "_3";

 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];
      trei=all_edge_out[treii];
      patru=all_edge_out[patruu];




      junu=jmax+1;
      jdoi=jmax+2;
      jtrei=jmax+3;
      jpatru=jmax+4;

      intera=jedge+1;
      interb=jedge+2;
      interc=jedge+3;
      interd=jedge+4;

      jmax=jmax+4;
      jedge=jedge+4;


    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[treii]++;
                                  proposed_remove_node[patruu]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;
                                  proposed_update_edge[trei]++;
                                  proposed_update_edge[patru]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou1=all_edge_int[treii];
                                  edisou2=all_edge_int[patruu];
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou1]++;
                                  proposed_remove_edge[edisou2]++;
                                  proposed_remove_edge[edisou3]++;
                                  
#proposed for add nodes and moves

                                  proposed_add_edge[intera]++;
                                  proposed_add_edge[interb]++;   
                                  proposed_add_edge[interc]++;
                                  proposed_add_edge[interd]++;            

                                  proposed_all_edge_bond[intera]=bond_ext;
                                  proposed_all_edge_bond[interb]=bond_ext;   
                                  proposed_all_edge_bond[interc]=bond_ext;
                                  proposed_all_edge_bond[interd]=bond_ext;                                    


#definition of FO node and edges, internal and external, in proposed_add


                                  proposed_all_node_atom[junu]="FO";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=green_col;
                                  proposed_all_node_id[junu]=junu;

                                  j1=junu "_1";
                                  j2=junu "_2";
                                  j3=junu "_3";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";
                                  je_3=junu "_e3";




                                  proposed_all_node_atom[j1]="4";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=intera;
                                  proposed_all_edge_source[intera]=j2; 
                                 
                                  proposed_all_node_atom[j3]="3";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=interb;
                                  proposed_all_edge_source[interb]=j3;        
                                  
# definition of internal edges


                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;



                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=junu; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  



#definition of FO node and edges, internal and external


                                  proposed_all_node_atom[jdoi]="FO";
                                  proposed_all_node_size[jdoi]=main_const;
                                  proposed_all_node_colour[jdoi]=green_col;
                                  proposed_all_node_id[jdoi]=jdoi;
                                  
                                  j1=jdoi "_1";
                                  j2=jdoi "_2";
                                  j3=jdoi "_3";
                                  
                                  je_1=jdoi "_e1";
                                  je_2=jdoi "_e2";
                                  je_3=jdoi "_e3";
                                  


                                  proposed_all_node_atom[j1]="4";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=doi;
                                  proposed_all_edge_target[doi]=j1; 
                                  
                                  proposed_all_node_atom[j2]="4";
                                  proposed_all_node_size[j2]=left;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interc;
                                  proposed_all_edge_source[interc]=j2; 
                                 
                                  proposed_all_node_atom[j3]="3";
                                  proposed_all_node_size[j3]=right;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=interd;
                                  proposed_all_edge_source[interd]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=jdoi;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jdoi;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jdoi; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  




#definition of FI node and edges, internal and external



                                  proposed_all_node_atom[jtrei]="FI";
                                  proposed_all_node_size[jtrei]=main_const;
                                  proposed_all_node_colour[jtrei]=red_col;
                                  proposed_all_node_id[jtrei]=jtrei;

                                  j1=jtrei "_1";
                                  j2=jtrei "_2";
                                  j3=jtrei "_3";
                                  
                                  je_1=jtrei "_e1";
                                  je_2=jtrei "_e2";
                                  je_3=jtrei "_e3";




                                  proposed_all_node_atom[j1]="6";
                                  proposed_all_node_size[j1]=left;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=intera;
                                  proposed_all_edge_target[intera]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=right;
                                  proposed_all_node_colour[j2]=in_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interc;
                                  proposed_all_edge_target[interc]=j2; 
                                 
                                  proposed_all_node_atom[j3]="2";
                                  proposed_all_node_size[j3]=middle;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=trei;
                                  proposed_all_edge_source[trei]=j3;        
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;



                                  proposed_all_edge_source[je_1]=jtrei;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jtrei;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jtrei; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  





#definition of FI node and edges, internal and external



                                  proposed_all_node_atom[jpatru]="FI";
                                  proposed_all_node_size[jpatru]=main_const;
                                  proposed_all_node_colour[jpatru]=red_col;
                                  proposed_all_node_id[jpatru]=jpatru;

                                  j1=jpatru "_1";
                                  j2=jpatru "_2";
                                  j3=jpatru "_3";
                                  
                                  je_1=jpatru "_e1";
                                  je_2=jpatru "_e2";
                                  je_3=jpatru "_e3";




                                  proposed_all_node_atom[j1]="6";
                                  proposed_all_node_size[j1]=left;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=interb;
                                  proposed_all_edge_target[interb]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=right;
                                  proposed_all_node_colour[j2]=in_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=interd;
                                  proposed_all_edge_target[interd]=j2; 
                                 
                                  proposed_all_node_atom[j3]="2";
                                  proposed_all_node_size[j3]=middle;
                                  proposed_all_node_colour[j3]=out_col;
                                  proposed_all_node_id[j3]=j3;
                                  proposed_all_edge_int[j3]=je_3;
                                  proposed_all_edge_out[j3]=patru;
                                  proposed_all_edge_source[patru]=j3;        
                                  
# definition of internal edges


                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;
                                 proposed_add_edge[je_3]++;


                                  proposed_all_edge_source[je_1]=jpatru;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jpatru;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  
                                  proposed_all_edge_source[je_3]=jpatru; 
                                  proposed_all_edge_target[je_3]=j3; 
                                  proposed_all_edge_bond[je_3]=bond_int;
                                  








#end of FIFO
}}}

#end of random parame for FIFO
}

}
#end of DIST moves
} 



#moves BETA  (15) and FAN-IN (23 and sourcetype=FI)
    for (ku in all_edge_source) {bon=all_edge_bond[ku];
    
    if ( bon==bond_ext) {

    
    targ=all_edge_target[ku];
    sour=all_edge_source[ku];

     tarl=all_edge_int[targ];
     sourl=all_edge_int[sour];
    
    targe=all_edge_source[tarl];
    sourc=all_edge_source[sourl];
    
    bubu=all_node_atom[sour] all_node_atom[targ];
    
    sourcetype=all_node_atom[sourc];



# FAN-IN

 parame=int(2 * rand());
    
    if ( parame==0) {


   if (sourcetype=="FI") { if ( bubu=="23" ) { if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {

       node_block[targe]++;
       node_block[sourc]++;



       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";
      treii=all_node_id[targe] "_2";
      patruu=all_node_id[targe] "_3";

 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];
      trei=all_edge_out[treii];
      patru=all_edge_out[patruu];




      junu=jmax+1;
      jdoi=jmax+2;


      jmax=jmax+2;


    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[treii]++;
                                  proposed_remove_node[patruu]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;
                                  proposed_update_edge[trei]++;
                                  proposed_update_edge[patru]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou1=all_edge_int[treii];
                                  edisou2=all_edge_int[patruu];
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou1]++;
                                  proposed_remove_edge[edisou2]++;
                                  proposed_remove_edge[edisou3]++;

#proposed for add nodes and moves





#definition of Arrow node and edges, internal and external, in proposed_add

##############################################################################!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                                  proposed_all_node_atom[junu]="Arrow";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=arrow_col;
                                  proposed_all_node_id[junu]=junu;

                                  j1=junu "_1";
                                  j2=junu "_2";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";




                                  proposed_all_node_atom[j1]="1";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=middle;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=patru;
                                  proposed_all_edge_source[patru]=j2; 
                                    
                                  
# definition of internal edges

                                 proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;


                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                                                    



#definition of Arrow node and edges, internal and external


                                  proposed_all_node_atom[jdoi]="Arrow";
                                  proposed_all_node_size[jdoi]=main_const;
                                  proposed_all_node_colour[jdoi]=arrow_col;
                                  proposed_all_node_id[jdoi]=jdoi;
                                  
                                  j1=jdoi "_1";
                                  j2=jdoi "_2";
                                  
                                  je_1=jdoi "_e1";
                                  je_2=jdoi "_e2";

                                  


                                  proposed_all_node_atom[j1]="1";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=doi;
                                  proposed_all_edge_target[doi]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=middle;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=trei;
                                  proposed_all_edge_source[trei]=j2; 
                                 
   
                                  
# definition of internal edges

                                proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;


                                  proposed_all_edge_source[je_1]=jdoi;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jdoi;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  

#end of FAN-IN
}}}

#end of rndom parame for FAN-IN
}



# BETA

 parame=int(2 * rand());
    
    if ( parame==0) {


  if ( bubu=="15" ) { if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {

       node_block[targe]++;
       node_block[sourc]++;


       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";
      treii=all_node_id[targe] "_2";
      patruu=all_node_id[targe] "_3";

 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];
      trei=all_edge_out[treii];
      patru=all_edge_out[patruu];




      junu=jmax+1;
      jdoi=jmax+2;


      jmax=jmax+2;


    

# proposed for remove nodes and active external edge. 

                                   proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[treii]++;
                                  proposed_remove_node[patruu]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;
                                  proposed_update_edge[trei]++;
                                  proposed_update_edge[patru]++;


                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou1=all_edge_int[treii];
                                  edisou2=all_edge_int[patruu];
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou1]++;
                                  proposed_remove_edge[edisou2]++;
                                  proposed_remove_edge[edisou3]++;
                                  
                                  
#proposed for add nodes and moves





#definition of Arrow node and edges, internal and external, in proposed_add

##############################################################################!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                                  proposed_all_node_atom[junu]="Arrow";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=arrow_col;
                                  proposed_all_node_id[junu]=junu;

                                  j1=junu "_1";
                                  j2=junu "_2";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";




                                  proposed_all_node_atom[j1]="1";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=middle;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=patru;
                                  proposed_all_edge_source[patru]=j2; 
                                    
                                  
# definition of internal edges

                                proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;



                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                                                    



#definition of Arrow node and edges, internal and external


                                  proposed_all_node_atom[jdoi]="Arrow";
                                  proposed_all_node_size[jdoi]=main_const;
                                  proposed_all_node_colour[jdoi]=arrow_col;
                                  proposed_all_node_id[jdoi]=jdoi;
                                  
                                  j1=jdoi "_1";
                                  j2=jdoi "_2";
                                  
                                  je_1=jdoi "_e1";
                                  je_2=jdoi "_e2";

                                  


                                  proposed_all_node_atom[j1]="1";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=trei;
                                  proposed_all_edge_target[trei]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=middle;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=doi;
                                  proposed_all_edge_source[doi]=j2; 
                                 
   
                                  
# definition of internal edges

                                proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;



                                  proposed_all_edge_source[je_1]=jdoi;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=jdoi;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;
                                  

#end of BETA
}}

#end of random parame for BETA
}

}
#end of BETA and FAN-IN
}






#moves PRUN:  L3T (12), A3T, FI3T (22), FO3T (32), FO2T, FOE2T, FOE3T(42)

    for (ku in all_edge_source) {bon=all_edge_bond[ku];
    
    if ( bon==bond_ext) { 
      

    
    targ=all_edge_target[ku];
    sour=all_edge_source[ku];

     tarl=all_edge_int[targ];
     sourl=all_edge_int[sour];
    
    targe=all_edge_source[tarl];
    sourc=all_edge_source[sourl];
    
    bubu=all_node_atom[sour] all_node_atom[targ];

# L3T 

 parame=int(2 * rand());
    
    if ( parame==0) {


    if (bubu=="12") {  if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {
    


      junu=jmax+1;


      jmax=jmax+1;




       node_block[targe]++;
       node_block[sourc]++;



       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";


 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];


    

# proposed for remove nodes and active external edge. 

#                                proposed_remove_node[targe]++;
#                                proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou3=all_edge_int[sour];

#                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou3]++;
                                  
                                  
#proposed for add nodes and moves




#definition of FRIN node and edges, internal and external


                                  proposed_all_node_atom[junu]="FRIN";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=in_col;
                                  proposed_all_node_id[junu]=junu;
                                  
                                  j1=junu "_1";
                                  
                                  je_1=junu "_e1";

                                  


                                  proposed_all_node_atom[j1]="5";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=out_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=doi;
                                  proposed_all_edge_source[doi]=j1; 
                                  
   
                                  
                                  proposed_all_edge_target[unu]=targ;
                                  proposed_all_edge_out[targ]=unu;                                   
                                  
                                  
# definition of internal edges

                                proposed_add_edge[je_1]++;

                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                    

    
    
# end L3T
    }}    
    
#end of random parame for L3T
}    
    
# A3T (22) , FI3T (22)



  
 parame=int(2 * rand());
    
    if ( parame==0) {


    if (bubu=="22") {  if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {
    
sourcetype=all_node_atom[sourc];

      junu=jmax+1;


      jmax=jmax+1;




       node_block[targe]++;
       node_block[sourc]++;



       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";


 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];


    

# proposed for remove nodes and active external edge. 

#                                   proposed_remove_node[targe]++;
#                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou3=all_edge_int[sour];

#                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou3]++;
                                  
                                  
#proposed for add nodes and moves




#definition of T node and edges, internal and external


                                  proposed_all_node_atom[junu]="T";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=term_col;
                                  proposed_all_node_id[junu]=junu;
                                  
                                  j1=junu "_1";
                                  
                                  je_1=junu "_e1";

                                  


                                  proposed_all_node_atom[j1]="2";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=doi;
                                  proposed_all_edge_target[doi]=j1; 
                                  
   
                                  
                                  proposed_all_edge_target[unu]=targ;
                                  proposed_all_edge_out[targ]=unu;                                   
                                  
                                  
# definition of internal edges

                                  proposed_add_edge[je_1]++;

                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                    

    
    
#end A3T (22) , FI3T (22)
    }}    

#end of random parame for A3T, FI3T
}

# FO3T(32)

 parame=int(2 * rand());
    
    if ( parame==0) {



    if (bubu=="32") {  if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {
    


 



       node_block[targe]++;
       node_block[sourc]++;


       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";


 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];


    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou3]++;
                                  
                                  
#proposed for add nodes and edges

      junu=jmax+1;


      jmax=jmax+1;

#definition of Arrow node and edges, internal and external


                                  proposed_all_node_atom[junu]="Arrow";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=arrow_col;
                                  proposed_all_node_id[junu]=junu;
                                  
                                  j1=junu "_1";
                                  j2=junu "_2";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";

                                  


                                  proposed_all_node_atom[j1]="1";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=middle;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=doi;
                                  proposed_all_edge_source[doi]=j2; 
                                 
   
                                  
# definition of internal edges

                                proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;


                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;



                                  
                                    

    
    
#end FO3T(32)
    }}    

#end of random parame for FO3T
}

##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


# FO2T, FOE2T, FOE3T(42)

 parame=int(2 * rand());
    
    if ( parame==0) {


    if (bubu=="42") {  if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {
    



       node_block[targe]++;
       node_block[sourc]++;

     junu=jmax+1;

      jmax++;

       coact=1;

# identified nodes, with their ports, then defines the new edges, internal and external


     sourcesize=all_node_size[sour];

     if (sourcesize==left) {

# printf ("sourcesize=" source size "should be the left");

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_3";


 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];

    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou3]++;
                                  
                                  
#proposed for add nodes and edges

#definition of Arrow node and edges, internal and external


                                  proposed_all_node_atom[junu]="Arrow";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=arrow_col;
                                  proposed_all_node_id[junu]=junu;
                                  
                                  j1=junu "_1";
                                  j2=junu "_2";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";

                                  


                                  proposed_all_node_atom[j1]="1";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=middle;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=doi;
                                  proposed_all_edge_source[doi]=j2; 
                                 
   
                                  
# definition of internal edges

                                proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;


                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;



 



}    else {

# printf ("sourcesize=" source size "should be the right");

      unuu=all_node_id[sourc] "_1";
      doii=all_node_id[sourc] "_2";


 
      unu=all_edge_out[unuu];
      doi=all_edge_out[doii];


    

# proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[unuu]++;
                                  proposed_remove_node[doii]++;

 
                                  proposed_remove_node[sourc]++;
                                  proposed_remove_node[sour]++;

                                  proposed_update_edge[unu]++;
                                  proposed_update_edge[doi]++;




                                  proposed_remove_edge[ku]++;
                                  
                                  editar1=all_edge_int[targ];
                                  editar2=all_edge_int[unuu];
                                  editar3=all_edge_int[doii];
                                  
                                  edisou3=all_edge_int[sour];

                                  proposed_remove_edge[editar1]++;
                                  proposed_remove_edge[editar2]++;
                                  proposed_remove_edge[editar3]++;
                                  
                                  proposed_remove_edge[edisou3]++;
                                  
                                  
#proposed for add nodes and edges
#definition of Arrow node and edges, internal and external


                                  proposed_all_node_atom[junu]="Arrow";
                                  proposed_all_node_size[junu]=main_const;
                                  proposed_all_node_colour[junu]=arrow_col;
                                  proposed_all_node_id[junu]=junu;
                                  
                                  j1=junu "_1";
                                  j2=junu "_2";
                                  
                                  je_1=junu "_e1";
                                  je_2=junu "_e2";

                                  


                                  proposed_all_node_atom[j1]="1";
                                  proposed_all_node_size[j1]=middle;
                                  proposed_all_node_colour[j1]=in_col;
                                  proposed_all_node_id[j1]=j1;
                                  proposed_all_edge_int[j1]=je_1;
                                  proposed_all_edge_out[j1]=unu;
                                  proposed_all_edge_target[unu]=j1; 
                                  
                                  proposed_all_node_atom[j2]="6";
                                  proposed_all_node_size[j2]=middle;
                                  proposed_all_node_colour[j2]=out_col;
                                  proposed_all_node_id[j2]=j2;
                                  proposed_all_edge_int[j2]=je_2;
                                  proposed_all_edge_out[j2]=doi;
                                  proposed_all_edge_source[doi]=j2; 
                                 
   
                                  
# definition of internal edges

                                proposed_add_edge[je_1]++;
                                 proposed_add_edge[je_2]++;


                                  proposed_all_edge_source[je_1]=junu;  
                                  proposed_all_edge_target[je_1]=j1; 
                                  proposed_all_edge_bond[je_1]=bond_int;
                                  
                                  proposed_all_edge_source[je_2]=junu;  
                                  proposed_all_edge_target[je_2]=j2; 
                                  proposed_all_edge_bond[je_2]=bond_int;



 
}



                                  

                                  
                                    

    
    
#end  FO2T, FOE2T, FOE3T(42)
    }}    

#end of random parame for FO2T...
}

    

#end PRUN    
}
}





#COMB moves 





#end COMB


#update 

if ( coact==1 ) {

for (nodus in proposed_remove_node ) {

   proposed_node_candi[nodus]++;
}

for (nodus in proposed_all_node_atom ) {

   proposed_node_candi[nodus]++;

}
 
 for (link in proposed_remove_edge) {

  linksou=all_edge_source[link];
  linktar=all_edge_target[link];
  
printf("setTimeout(function() \{  \n \n ") >> "essy.txt";

# printf("\n counter:" counter " \n \n \n ") >> "essy.txt";
  
  printf("graph.removeLink(\"" linksou "\", \"" linktar "\")\; \n") >> "essy.txt";

 
 printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";


  }

  

 for (link in proposed_update_edge) {



  linksou=all_edge_source[link];
  linktar=all_edge_target[link];
  
  printf("setTimeout(function() \{  \n \n ") >> "essy.txt";
  
  printf("graph.removeLink(\"" linksou "\", \"" linktar "\")\; \n") >> "essy.txt";

 printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";



  
  }

   
#   printf("setTimeout(function() \{  \n \n ") >> "essy.txt";


# printf("\n end proposed_update_edge  part I \n \n ") >> "essy.txt";  
  

  for (link in proposed_remove_edge) {

  delete all_edge_source[link];
  delete all_edge_target[link];
  delete all_edge_bond[link];

}


# printf("\n end proposed_remove_edge \n \n ") >> "essy.txt";  

for ( nodusi in proposed_node_candi ) {

 nodb=nodusi;


  if (nodb in proposed_remove_node) {
  
  nodid=all_node_id[nodb];
  
   printf("setTimeout(function() \{  \n \n ") >> "essy.txt";


  printf("graph.removeNode( \"" nodid "\" )\; \n") >> "essy.txt";

 printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";


  
  
  }


  if (nodb in proposed_remove_node) {


  delete all_node_atom[nodb];
   delete all_node_size[nodb];
   delete all_node_colour[nodb];
   delete all_node_id[nodb];
   
   if (nodb in all_edge_int) {


          delete all_edge_int[nodb];
          delete all_edge_out[nodb];

     }
}
# printf("\n end proposed_remove_node \n \n ") >> "essy.txt";  

 nodc=nodusi;

if (nodc in proposed_all_node_atom) {


                                  noda=proposed_all_node_atom[nodc];;
                                  nodsi=proposed_all_node_size[nodc];
                                  nodcol=proposed_all_node_colour[nodc];
                                  nodid=proposed_all_node_id[nodc];
   
   all_node_atom[nodc]=noda;
   all_node_size[nodc]=nodsi;
   all_node_colour[nodc]-=nodcol;
   all_node_id[nodc]=nodid;
   
   if (nodc in proposed_all_edge_int) {
   
    all_edge_int[nodc]=proposed_all_edge_int[nodc];
     all_edge_out[nodc]=proposed_all_edge_out[nodc];
      

   
   }

 printf("setTimeout(function() \{  \n \n ") >> "essy.txt";


   printf("graph.addNode( \"" nodid "\", \"" noda "\", \"" nodsi "\", \"" nodcol "\")\; \n") >> "essy.txt";

 printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";

}

}

 
 for (link in proposed_add_edge) {

  linksou=proposed_all_edge_source[link];
  linktar=proposed_all_edge_target[link];
  linkbond=proposed_all_edge_bond[link];
  
   printf("setTimeout(function() \{  \n \n ") >> "essy.txt";
  
  printf("graph.addLink(\"" linksou "\", \"" linktar "\", \"" linkbond "\")\; \n") >> "essy.txt";

 printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";
  
  all_edge_source[link]=linksou;
  all_edge_target[link]=linktar;
  all_edge_bond[link]=linkbond;
  

  
  
  
  }

# printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";
   
#   printf("setTimeout(function() \{  \n \n ") >> "essy.txt";





 for (link in proposed_update_edge){


  if ( link in proposed_all_edge_source) { t1=proposed_all_edge_source[link]; all_edge_source[link]=t1; }

  if (link in proposed_all_edge_target) {t1=proposed_all_edge_target[link];  all_edge_target[link]=t1; } 

}

 for (link in proposed_update_edge) {

  linkso=proposed_all_edge_source[link];
  linkta=proposed_all_edge_target[link];
#  linkbo=all_edge_bond[link];
  

   
   all_edge_out[linkso]=link;
   all_edge_out[linkta]=link;
   
   
  }

 for (link in proposed_update_edge) {

  linkso=all_edge_source[link];
  linkta=all_edge_target[link];
#  linkbo=all_edge_bond[link];

 printf("setTimeout(function() \{  \n \n ") >> "essy.txt";
  
   printf("graph.addLink(\"" linkso "\", \"" linkta "\", \"" bond_ext "\")\; \n") >> "essy.txt";  
 
  printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt"; 
   
  }


 

#printf("\n end proposed_update_edge  part II \n \n ") >> "essy.txt";  

#   printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";



#end update html

 for (nof in node_block) { delete node_block[nof];}
 
 for (nof in proposed_remove_node) { delete proposed_remove_node[nof];}
 
 for (nof in proposed_remove_edge) { delete proposed_remove_edge[nof];}
 
 for (nof in proposed_update_edge) { delete proposed_update_edge[nof];}
 
 for (nof in proposed_add_edge) { delete proposed_add_edge[nof];}
 
 for (nof in proposed_all_edge_bond) { delete proposed_all_edge_bond[nof];}
 
  for (nof in proposed_all_node_atom) { delete proposed_all_node_atom[nof];}
  
  for (nof in proposed_all_node_size) { delete proposed_all_node_size[nof];}
  
  for (nof in proposed_all_node_colour) { delete proposed_all_node_colour[nof];}
  
  for (nof in proposed_all_node_id) { delete proposed_all_node_id[nof];}
  
  for (nof in proposed_all_edge_int) { delete proposed_all_edge_int[nof];}
  
  for (nof in proposed_all_edge_out) { delete proposed_all_edge_out[nof];}
  
  for (nof in proposed_all_edge_target) { delete proposed_all_edge_target[nof];}

 for (nof in proposed_all_edge_source) { delete proposed_all_edge_source[nof];}

   for (nof in proposed_remove_node_candi) { delete proposed_remove_node_candi[nof];}

     counter++;
     
# COMB cycle



combcont=0;

while (combcont=="0") {

combcont=1;

#COMB moves 

    for (ku in all_edge_source) {bon=all_edge_bond[ku];
    
    if ( bon==bond_ext) { 
      

    
    targ=all_edge_target[ku];
    sour=all_edge_source[ku];

     tarl=all_edge_int[targ];
     sourl=all_edge_int[sour];
    
    targe=all_edge_source[tarl];
    sourc=all_edge_source[sourl];
    
    bubus=all_node_atom[sour]; 
    bubut=all_node_atom[targ];


    if (bubus!="6" && bubut=="1") {  if ( targe in node_block || sourc in node_block ) {zuzuzu=0;} else {
    


    ju=targe "_2";
    juu=all_edge_out[ju];
    

#     jedge++;


       node_block[targe]++;
       node_block[sourc]++;



       combcont=0;

 # proposed for remove nodes and active external edge. 

                                  proposed_remove_node[targe]++;
                                  proposed_remove_node[targ]++;
                                  proposed_remove_node[ju]++;





                                  proposed_remove_edge[ku]++;
                                  
                                  je_1=targe "_e1";
                                  je_2=targe "_e2";
                                  
                                   proposed_remove_edge[je_1]++;
                                   proposed_remove_edge[je_2]++;
                                  
                                  proposed_update_edge[juu]++;
                                  
 
                                  
                                  
#proposed for add nodes and edges





                                  proposed_all_edge_source[juu]=sour;
                                  proposed_all_edge_out[sour]=juu;            
                







}}}}



#end COMB


#update

if (combcont=="0") {
 printf("setTimeout(function() \{  \n \n ") >> "essy.txt";

# printf("\n counter:" counter " \n \n \n ") >> "essy.txt";

 for (link in proposed_remove_edge) {

  linksou=all_edge_source[link];
  linktar=all_edge_target[link];
  

  
  printf("graph.removeLink(\"" linksou "\", \"" linktar "\")\; \n") >> "essy.txt";

 


  }

  

 for (link in proposed_update_edge) {



  linksou=all_edge_source[link];
  linktar=all_edge_target[link];
  
  printf("graph.removeLink(\"" linksou "\", \"" linktar "\")\; \n") >> "essy.txt";



  
  }

 

# printf("\n end proposed_update_edge  part I \n \n ") >> "essy.txt";  
  

  for (link in proposed_remove_edge) {

  delete all_edge_source[link];
  delete all_edge_target[link];
  delete all_edge_bond[link];

}


# printf("\n end proposed_remove_edge \n \n ") >> "essy.txt";  

  for (nodb in proposed_remove_node) {
  
  nodid=all_node_id[nodb];

  printf("graph.removeNode( \"" nodid "\" )\; \n") >> "essy.txt";

 
  
  
  }



  for (nodb in proposed_remove_node) {


  delete all_node_atom[nodb];
   delete all_node_size[nodb];
   delete all_node_colour[nodb];
   delete all_node_id[nodb];
   
   if (nodb in all_edge_int) {


          delete all_edge_int[nodb];
          delete all_edge_out[nodb];

     }
}
# printf("\n end proposed_remove_node \n \n ") >> "essy.txt";  


for (nodc in proposed_all_node_atom) {


                                  noda=proposed_all_node_atom[nodc];;
                                  nodsi=proposed_all_node_size[nodc];
                                  nodcol=proposed_all_node_colour[nodc];
                                  nodid=proposed_all_node_id[nodc];
   
   all_node_atom[nodc]=noda;
   all_node_size[nodc]=nodsi;
   all_node_colour[nodc]-=nodcol;
   all_node_id[nodc]=nodid;
   
   if (nodc in proposed_all_edge_int) {
   
    all_edge_int[nodc]=proposed_all_edge_int[nodc];
     all_edge_out[nodc]=proposed_all_edge_out[nodc];
      

   
   }

   printf("graph.addNode( \"" nodid "\", \"" noda "\", \"" nodsi "\", \"" nodcol "\")\; \n") >> "essy.txt";


}

 





 for (link in proposed_update_edge){


  if ( link in proposed_all_edge_source) { t1=proposed_all_edge_source[link]; all_edge_source[link]=t1; }

  if (link in proposed_all_edge_target) {t1=proposed_all_edge_target[link];  all_edge_target[link]=t1; } 

}

 for (link in proposed_update_edge) {

  linkso=proposed_all_edge_source[link];
  linkta=proposed_all_edge_target[link];
#  linkbo=all_edge_bond[link];
  

   
   all_edge_out[linkso]=link;
   all_edge_out[linkta]=link;
   
   
  }

 for (link in proposed_update_edge) {

  linkso=all_edge_source[link];
  linkta=all_edge_target[link];
#  linkbo=all_edge_bond[link];
  
   printf("graph.addLink(\"" linkso "\", \"" linkta "\", \"" bond_ext "\")\; \n") >> "essy.txt";  
 
   
   
  }


 



#end update html

 for (nof in node_block) { delete node_block[nof];}
 
 for (nof in proposed_remove_node) { delete proposed_remove_node[nof];}
 
 for (nof in proposed_remove_edge) { delete proposed_remove_edge[nof];}
 
 for (nof in proposed_update_edge) { delete proposed_update_edge[nof];}
 
 for (nof in proposed_add_edge) { delete proposed_add_edge[nof];}
 
 for (nof in proposed_all_edge_bond) { delete proposed_all_edge_bond[nof];}
 
  for (nof in proposed_all_node_atom) { delete proposed_all_node_atom[nof];}
  
  for (nof in proposed_all_node_size) { delete proposed_all_node_size[nof];}
  
  for (nof in proposed_all_node_colour) { delete proposed_all_node_colour[nof];}
  
  for (nof in proposed_all_node_id) { delete proposed_all_node_id[nof];}
  
  for (nof in proposed_all_edge_int) { delete proposed_all_edge_int[nof];}
  
  for (nof in proposed_all_edge_out) { delete proposed_all_edge_out[nof];}
  
  for (nof in proposed_all_edge_target) { delete proposed_all_edge_target[nof];}

 for (nof in proposed_all_edge_source) { delete proposed_all_edge_source[nof];}


#end update

#printf("\n end proposed_update_edge  part II \n \n ") >> "essy.txt";  

   printf("keepNodesOnTop()\; \n \n \}, nextval())\; \n \n") >> "essy.txt";


#end if combcont==0
}








#end while combcont
}



#end COMB cycle     

} else {   gugu++;  

if (gugu==140) {counter=13000;}}



#counter++;

#counter=200;

#end while
   }




#end END
}


