BEGIN { 

#
# this file forked from foe_bubbles_06_10.awk  owner: chorasimilarity (Marius Buliga, http://chorasimilarity.wordpress.com/ )
#
# the goal is to change the notation for the new nodes, because in the 06_10 and previous versions the names grow exponentially with the step numbers!
# instead of that there will be a counter for the new numbers and the counter will be concatenated after tutext string
# the modifications will be in the moves section
#
# part which removes bubbles is commented
#



       count_lines=0; 

#
# tutext will be eventually the max over ports, so that tutext* will be something which is not the name of an existing port
#
# count_lines will be the number of nodes, so that later count_lines+* will be something which is not the name of an existing node (used for FRIN and FROUT nodes)
#

       tutext=""; 
            
       }

{

       count_lines++;       

#
#   node  has as argument the node number and as value the node record, as read from the input .mol file
#

#
#
# for the g-pattern notation see http://chorasimilarity.wordpress.com/2014/07/10/lambda-calculus-and-the-fixed-point-combinator-in-chemlambda-ii/ . To this adds the FRIN AND FROUT nodes (see later)
#
# a .mol file is simply a list of nodes and their ports. Each node is on a line, for example T[a] is written "T a" , Arrow[a,b] is written "Arrow a b" and FO[a,b,c] is written "FO a b c"
#
#

#     if (NR = 0) {exit;}

# ignores the lines with less than 2 field

      if (NF > 1) {  uu=NR;

       node[uu]=$0;


#
# node_type has as argument the node number and as value the node type. later will be added the FRIN and FROUT nodes

       node_type[uu]=$1;

       e=$1;}

       if ( NF == 2 ) { 

                      b=$2;


#
# in_port has a port as argument and as value the node which has that port as a "in" port
# count_in has the port as argument and the number of times is a "in" port as value. If count_in[i] > 1 then something is wrong
#
# same for the pair out_port and count_out
#
# here "FROUT" is a free port out, which is seen as a node with one "in"  port. 
#


                      if ( e == "T"  || e == "FROUT" ) { in_port[b]=NR;  count_in[b]++; } 



# terminal_edge has as argument a port of a "T" node and as value the number of times (can be only 1) the port belongs to a "T" node

# active_edge has as argument a port which is potentially active and as value the number of times the port appears in one of those positions (so if active_edge[i] == 2 it means that there is potential for a move there


                      if (e == "T" ) { 

                                         terminal_edge[b]++; 

                                         active_edge[b]++; 

                                     }

#
# likewise, FRIN is a free port in, which is seen as a node with one "out" port
#

                      if ( e == "FRIN" ) { out_port[b]=NR; count_out[b]++; }

#
# used_port has the port as argument and the number of times the port is used as variable
#

                      used_port[b]++;

#
# node_port_i has the number of node as argument and the i'th port as variable 
#

                      node_port_1[NR]=$2; 

                      if ( tutext < b ) { tutext=b; }
    
                  } 


#
# for NF=3 it has to be an Arrow
#

       if ( NF == 3 ) { 

                      b=$2;

                      c=$3;

                      if ( tutext < b ) { tutext=b; }

                      if (tutext < c) { tutext=c;}

                      in_port[b]=NR; 

                      count_in[b]++;

                      used_port[b]++;

                      out_port[c]=NR; 

                      count_out[c]++;

                      used_port[c]++;

                      node_port_1[NR]=b;

                      node_port_2[NR]=c; 

                     } 

       if (NF == 4) {  

                      b=$2;

                      c=$3;

                      d=$4;


                      if ( tutext < b ) { tutext=b; }

                      if ( tutext < c ) { tutext=c; }

                      if ( tutext < d ) { tutext=d; }

                      node_port_1[NR]=b;

                      used_port[b]++;

                      node_port_2[NR]=c;

                      used_port[c]++;

                      node_port_3[NR]=d;

                      used_port[d]++;
                                      #Creates a NOP node which will be ignored by all rules
                                      if ( e == "NOP" ) { 

                                   
                                                                  in_port[b]=NR; 

                                                                  count_in[b]++;

                                                                  in_port[c]=NR; 

                                                                  count_in[c]++;
      
                                                                  out_port[d]=NR; 

                                                                  count_out[d]++;
  

                                                                    } 

                      
                                       if ( e == "FI" ) { 

                                   
                                                                  in_port[b]=NR; 

                                                                  count_in[b]++;

                                                                  in_port[c]=NR; 

                                                                  count_in[c]++;
      
                                                                  out_port[d]=NR; 

                                                                  count_out[d]++;

                                                                  active_edge[d]++;

                                                                    } 

                                       if ( e == "A" ) {
                                                                  in_port[b]=NR; 

                                                                  count_in[b]++;

                                                                  in_port[c]=NR; 

                                                                  count_in[c]++;
      
                                                                  out_port[d]=NR; 

                                                                  count_out[d]++;

                                                                  active_edge[d]++;

                                                                  active_edge[b]++; 

                                                       } 


                                       if ( e == "L"  ) { 

                                                                   in_port[b]=NR; 

                                                                   count_in[b]++;

                                                                   out_port[c]=NR; 

                                                                   count_out[c]++;
      
                                                                   out_port[d]=NR; 

                                                                   count_out[d]++; 

                                                                   active_edge[d]++;

                                                                     } 

                                       if ( e == "FO"  ) { 

                                                                   in_port[b]=NR; 

                                                                   count_in[b]++;

                                                                   out_port[c]=NR; 

                                                                   count_out[c]++;
      
                                                                   out_port[d]=NR; 

                                                                   count_out[d]++; 

                                                                   active_edge[b]++;

                                                                   active_edge[d]++;

                                                                   active_edge[c]++;

# fo_node has as argument the number of a FO node and counts the number of times this node appears (i.e. 1) this is used in the LOC-PR-FO

                                                                   fo_node[NR]++;

                                                                     } 

#
#  FOE node introduced here
#

                                       if ( e == "FOE"  ) { 

                                                                   in_port[b]=NR; 

                                                                   count_in[b]++;

                                                                   out_port[c]=NR; 

                                                                   count_out[c]++;
      
                                                                   out_port[d]=NR; 

                                                                   count_out[d]++; 

                                                                   active_edge[b]++;

                                                                   active_edge[d]++;

                                                                   active_edge[c]++;

# fo_node has as argument the number of a FO node and counts the number of times this node appears (i.e. 1) this is used in the LOC-PR-FO

                                                                   fo_node[NR]++;

                                                                     } 

                    
                   } 
   

}

END { 

#
# check to see if ports are used more than 2 times. A collection of graphical elements (here called "nodes") with the property that a port variable appears more than 2 times is literarry called a "mess"
#

       count_mess=0;

       for (i in used_port) { 

                              count_e= used_port[i]; 

                              if (used_port[i] > 2) { 

                                                      print "the port " i " is used " used_port[i] " times."; 

                                                      count_mess++; 

                                                    } 
                            }

       if (count_mess > 0) { print "You have a mess here!";  exit;} 

#
# check to see if a port appears more than once as a "in" port (aso a "mess")
#

       count_double_in=0;

       for (i in count_in ) {

                               if ( count_in[i] > 1 ) { 

                                                       print "the port " i "is used " count_in[i] " times."; 

                                                       count_double_in++; 

                                                       } 

                            }



       if (count_double_in > 0 ) { print " You used the same port name for more than one port in."; 

                                   exit; 

                                 }

#
# check to see if a port appears more than once as a "out" port (a "mess" too)
#

       count_double_out=0;

       for (i in count_out ) { 

                               if ( count_out[i] > 1 ) { 

                                                         print "the port " i "is used " count_out[i] " times."; 

                                                         count_double_out++; 

                                                       } 

                             }

       if (count_double_out > 0 ) { print " You used the same port name for more than one port out."; exit; }

#
# define first edges between nodes, in edge, which takes as argument a port (used twice) and as value the pair of nodes, first being the one where the port appears as an out port
#
# then define  the FRIN and FROUT ports by adding them to the arrays node_type, node_port_1, in_port and out_port. Mind that edge still contains only the internal edges
#

       count_new_nodes=0;
       
       count_max_nodes=count_lines;

       for (i in used_port) {  count_e=used_port[i]; 

                                if (count_e == 2) { edge[i]=out_port[i] " " in_port[i]; } 

                                                   else {  count_new_nodes++;

                                                         if ( i in count_in ) { 

                                                                               new_node_number=count_lines+count_new_nodes; 
                                                                              
                                                                               node_type[new_node_number]="FRIN"; 

                                                                               out_port[i]=new_node_number; 
  
                                                                               node_port_1[new_node_number]=i; 

                                                                               node[new_node_number]="FRIN" " " i;

                                                                               free_edge[i]=out_port[i] " " in_port[i]; 
                                                                               
                                                                               count_max_nodes=new_node_number; 
 
                                                                              } 

                                                                              else { 

                                                                               new_node_number=count_lines+count_new_nodes; 
                                                                              
                                                                               node_type[new_node_number]="FROUT"; 

                                                                               in_port[i]=new_node_number; 
  
                                                                               node_port_1[new_node_number]=i;

                                                                               node[new_node_number]="FROUT" " " i;

                                                                              free_edge[i]=out_port[i] " " in_port[i];
                                                                              
                                                                               count_max_nodes=new_node_number; 

                                                                                   }

                                                        }  

                            }


#
# count_max_nodes keeps the max nodes number for the moment
#



#
# print what you got until now in temporary files
#

# first is the internal edges, in file temp_internal_edges_before

       for (i in edge) { printf(i " "  edge[i] "\n") > "temp_internal_edges_before"; }

#
# the nodes, with numbers in the first column, with FRIN and FROUT nodes too in the file temp_numbered_nodes_before and temp_nodes_before. 
#

# 
# 
# 

 

       for (i in node_type ) { 


                              j=node_type[i]; 

#                              printf("node " i " has node type " j " and is: " node[i] "\n");
 

                              printf( i " " node[i] "\n") > "temp_numbered_nodes_before"; printf(node[i] "\n") > "temp_nodes_before";  

                              }



#
# the free in and free out edges in temp_free_edges_before
#

     for (i in free_edge ) { printf(i " " free_edge[i] "\n") > "temp_free_edges_before"; } 






# 
# the moves: see http://chorasimilarity.wordpress.com/2014/07/11/lambda-calculus-and-the-fixed-point-combinator-in-chemlambda-iii/
# 
#
# count_move_left_node has node ID as argument and counts the number of times a node is in a LEFT pattern for a move
# left_move_left_node had active edge ID as argument and node ID as value, if the node is at left in a LEFT pattern
# left_move_right_node active edge ID as argument and node ID as value, if the node is at right in a LEFT patern
# type_move has active edge ID as argument and the move type as value
#     for BETA, FAN-IN, DIST the active edge is the 3-1 edge
#     for LOC-PR for A and FI the active edge is the 3-1 edge
#     for LOC-PR for L  with two T the active edge is the node_port_1[node]
#     for LOC-PR for FO with one T the active edge is the other out port of FO
# there is no direct move for FO with two T, the preference is, if any choice, to reduce first the 
# move_left has the active edge ID as argument and the LEFT pattern as value
# move_right has the active edge ID as argument and the RIGHT pattern as value
#

#  first introduce the counter for the new nodes

        counter_new_nodes=0;


        for (i in active_edge) { 

                                if (active_edge[i] == "2") { 

#
# commented definition of ji
#                                                            ji=tutext i;
#
                                                            u=in_port[i];

                                                            v=out_port[i];

                                                            n_out=node_type[v]; 

                                                            n_in=node_type[u];


# temporary file of active edges temp_edges_active

                                                            printf(i " " node[v] " " node[u] "\n") > "temp_edges_active"; 

# first the check of the moves BETA, FAN-IN, DIST 



                                                            if (n_out == "L" && n_in == "A") { 

                                                            vtry=node_port_3[v];

                                                            utry=node_port_1[u];

                                                            if ( vtry == i && utry == i ) {

# temporary file of proposed moves, before any priority check

                               printf("BETA" " " node[v] " " node[u]  " " "REPLACED BY" " " "Arrow" " " node_port_1[v] " " node_port_3[u] " " "Arrow" " " node_port_2[u] " " node_port_2[v] "\n") > "temp_proposed_moves"; 

                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="BETA";

# move_left has as argument the active edge and as value the lines of the LEFT pattern

# move_right has as argument the active edge and as value the lines of the RIGHT pattern

# for BETA move the active edge is the 3-1 edge

                                                            move_right[i]="Arrow" " " node_port_1[v] " " node_port_3[u] "\n" "Arrow" " " node_port_2[u] " " node_port_2[v] "\n";

                                                            move_left[i]=node[v] "\n" node[u] "\n";

                                                                                             }}

# for FAN-IN the active edge is the 3-1 edge 
#
# changed FO by FOE
#

                                                            if (n_out == "FI" && n_in == "FOE") {

                                                            vtry=node_port_3[v];

                                                            utry=node_port_1[u];

                                                            if ( vtry == i && utry == i ) {


                                    printf("FAN-IN" " " node[v] " " node[u]  " " "REPLACED BY" " " "Arrow" " " node_port_1[v] " " node_port_3[u] " " "Arrow" " " node_port_2[v] " " node_port_2[u] "\n") > "temp_proposed_moves";

                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="FAN-IN";

                                                            move_right[i]="Arrow" " " node_port_1[v] " " node_port_3[u] "\n" "Arrow" " " node_port_2[v] " " node_port_2[u] "\n";   
 
                                                            move_left[i]=node[v] "\n" node[u] "\n";
   
                                                                                             }}

# for DIST-L the active edge is the 3-1 edge
# here we use the system of naming the new ports from the RIGHT pattern of the DIST move by using the trick with the max over ports
#
# added FOE, both DIST-L with FO or FOE are accepted
#

                                                            if (n_out == "L" && ( n_in == "FO" || n_in == "FOE" ) ) {


                                                            vtry=node_port_3[v];

                                                            utry=node_port_1[u];

                                                            if ( vtry == i && utry == i ) {

                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="DIST";

# modified here FO by FOE
#
# new way to count new nodes
#
                                                           ca=counter_new_nodes;
                                                           
                                                           caa=tutext ca;

                                                           counter_new_nodes++;

                                                           cb=counter_new_nodes;
                                                           
                                                           cbb=tutext cb;

                                                           counter_new_nodes++;       

                                                           cc=counter_new_nodes;
                                                           
                                                           ccc=tutext cc;

                                                           counter_new_nodes++;                  


                                                           cd=counter_new_nodes;
                                                           
                                                           cdd=tutext cd;

                                                           counter_new_nodes++;

                                                            t_1="FOE" " " node_port_1[v] " " ccc " " cdd;

                                                            t_2="FI" " " cbb " " caa " " node_port_2[v];

                                                            t_3="L" " " ccc " " caa " "  node_port_2[u]; 

                                                            t_4="L" " " cdd " " cbb " "  node_port_3[u];

                                                            printf("DIST" " " node[v] " " node[u]  " " "REPLACED BY" " " t_1 " " t_2 " " t_3 " " t_4 "\n") > "temp_proposed_moves";


                                                            move_right[i]=t_1 "\n" t_2 "\n" t_3 "\n" t_4 "\n";   
 
                                                            move_left[i]=node[v] "\n" node[u] "\n";
   
                                                                                             }}

# for DIST-A the active edge is the 3-1 edge
# here we use the system of naming the new ports from the RIGHT pattern of the DIST move by using the trick with the max over ports
#
#  DIST-A accepts at left FO or FOE, but at right has only FOE
#
                                                            if (n_out == "A" && ( n_in == "FO" || n_in == "FOE" ) ) {

                                                            vtry=node_port_3[v];

                                                            utry=node_port_1[u];

                                                            if ( vtry == i && utry == i ) {


                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="DIST";

                                                           ca=counter_new_nodes;
                                                           
                                                           caa=tutext ca;

                                                           counter_new_nodes++;

                                                           cb=counter_new_nodes;
                                                           
                                                           cbb=tutext cb;

                                                           counter_new_nodes++;       

                                                           cc=counter_new_nodes;
                                                           
                                                           ccc=tutext cc;

                                                           counter_new_nodes++;                  


                                                           cd=counter_new_nodes;
                                                           
                                                           cdd=tutext cd;

                                                           counter_new_nodes++;

                                                            t_1="FOE" " " node_port_1[v] " " caa " " cbb;

                                                            t_2="FOE" " " node_port_2[v] " " ccc " " cdd;

                                                            t_3="A" " " caa " " ccc " "  node_port_2[u]; 

                                                            t_4="A" " " cbb " " cdd " "  node_port_3[u];

                                                            printf("DIST" " " node[v] " " node[u]  " " "REPLACED BY" " " t_1 " " t_2 " " t_3 " " t_4 "\n") > "temp_proposed_moves";


                                                            move_right[i]=t_1 "\n" t_2 "\n" t_3 "\n" t_4 "\n";   
 
                                                            move_left[i]=node[v] "\n" node[u] "\n";
   
                                                                                             }}

# for DIST-FI the active edge is the 3-1 edge
# here we use the system of naming the new ports from the RIGHT pattern of the DIST move by using the trick with the max over ports
#
#  DIST-A accepts at left FO, not FOE, and at right has only FO
#
                                                            if (n_out == "FI" &&  n_in == "FO" ) {

                                                            vtry=node_port_3[v];

                                                            utry=node_port_1[u];

                                                            if ( vtry == i && utry == i ) {

                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="DIST";

                                                           ca=counter_new_nodes;
                                                           
                                                           caa=tutext ca;

                                                           counter_new_nodes++;

                                                           cb=counter_new_nodes;
                                                           
                                                           cbb=tutext cb;

                                                           counter_new_nodes++;       

                                                           cc=counter_new_nodes;
                                                           
                                                           ccc=tutext cc;

                                                           counter_new_nodes++;                  


                                                           cd=counter_new_nodes;
                                                           
                                                           cdd=tutext cd;

                                                           counter_new_nodes++;

                                                            t_1="FO" " " node_port_1[v] " " caa " " cbb;

                                                            t_2="FO" " " node_port_2[v] " " ccc " " cdd;

                                                            t_3="FI" " " caa " " ccc " "  node_port_2[u]; 

                                                            t_4="FI" " " cbb " " cdd " "  node_port_3[u];

                                                            printf("DIST" " " node[v] " " node[u]  " " "REPLACED BY" " " t_1 " " t_2 " " t_3 " " t_4 "\n") > "temp_proposed_moves";


                                                            move_right[i]=t_1 "\n" t_2 "\n" t_3 "\n" t_4 "\n";   
 
                                                            move_left[i]=node[v] "\n" node[u] "\n";
   
                                                                                             }}


# for DIST-FOE the active edge is the 3-1 edge
# here we use the system of naming the new ports from the RIGHT pattern of the DIST move by using the trick with the max over ports
#
# 
#

                                                            if (n_out == "FO" &&  n_in == "FOE"  ) {

                                                            vtry=node_port_3[v];

                                                            utry=node_port_1[u];

                                                            if ( vtry == i && utry == i ) {

                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="DIST-NEW";

                                                           ca=counter_new_nodes;
                                                           
                                                           caa=tutext ca;

                                                           counter_new_nodes++;

                                                           cb=counter_new_nodes;
                                                           
                                                           cbb=tutext cb;

                                                           counter_new_nodes++;       

                                                           cc=counter_new_nodes;
                                                           
                                                           ccc=tutext cc;

                                                           counter_new_nodes++;                  


                                                           cd=counter_new_nodes;
                                                           
                                                           cdd=tutext cd;

                                                           counter_new_nodes++;


# modified here FO by FOE
                                                            t_1="FOE" " " node_port_1[v] " " ccc " " cdd;

                                                            t_2="FI" " " cbb " " caa " " node_port_2[v];

                                                            t_3="FO" " " ccc " " caa " "  node_port_2[u]; 

                                                            t_4="FO" " " cdd " " cbb " "  node_port_3[u];

                                                            printf("DIST" " " node[v] " " node[u]  " " "REPLACED BY" " " t_1 " " t_2 " " t_3 " " t_4 "\n") > "temp_proposed_moves";


                                                            move_right[i]=t_1 "\n" t_2 "\n" t_3 "\n" t_4 "\n";   
 
                                                            move_left[i]=node[v] "\n" node[u] "\n";
   
                                                                                             }}

# now the clear moves LOC-PR, for A and FI

                                                            if (n_out == "A" && n_in == "T") {   

                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="LOC-PR";

# for LOC-PR-A and LOC-PR-FI the active edge is the 3 port of A or FI

                                                            move_right[i]="T" " " node_port_1[v] "\n" "T" " " node_port_2[v]  "\n";   
 
                                                            move_left[i]=node[v] "\n" node[u] "\n";

                                                            printf("LOC-PR" " " node[v] " " node[u]  " " "REPLACED BY" " " "T" " " node_port_1[v] " " "T" " " node_port_2[v]  "\n") > "temp_proposed_moves";

                                                                                               }


                                                            if (n_out == "FI" && n_in == "T") {   

                                                            count_move_left_node[v]++;

                                                            count_move_left_node[u]++;

                                                            left_move_left_node[i]=v;

                                                            left_move_right_node[i]=u;

                                                            type_move[i]="LOC-PR";

                                                            move_right[i]="T" " " node_port_1[v] "\n" "T" " " node_port_2[v]  "\n";   
 
                                                            move_left[i]=node[v] "\n" node[u] "\n"; 

                                                            printf("LOC-PR" " " node[v] " " node[u]  " " "REPLACED BY" " " "T" " " node_port_1[v] " " "T" " " node_port_2[v]  "\n") > "temp_proposed_moves";

                                                                                               }

# the move LOC-PR for L

                                                            if (n_out == "L" && n_in == "T") {   

                                                            ww=node_port_2[v];

                                                            if (ww in terminal_edge) {

# BIG PROBLEM HERE: port is declared as node!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Corrected!

                                                            left_move_left_node[v]=v;

                                                            type_move[node_port_1[v]]="LOC-PR";


# for LOC-PR-L the active edge is the port 1 of L

                                                            move_right[node_port_1[v]]="T" " " node_port_1[v] "\n";   
 
                                                            move_left[node_port_1[v]]=node[v] "\n" node[u] "\n" "T" " " ww; 

                                                            printf("LOC-PR" " " node[v] " " node[u]  " "  "T" " " ww " " "REPLACED BY" " " "T" " " node_port_1[v] "\n") > "temp_proposed_moves";
                     
                                                                                       }

                                                                                               }



                                                             }
                               }





# the move  LOC-PR for FO. attention! there is no LOC-PR-FO with two T nodes simultaneously. The preference is towards the node_port_2 for such a move. Remark that the FO is replaced by an Arrow!
#
# added LOC-PR for FOE
#

              for (j in fo_node) {   
                        
                                        np_2=node_port_2[j];

                                        np_3=node_port_3[j];

                                        np_np_2=in_port[np_2]; np_np_2_type=node_type[np_np_2];   

                                        np_np_3=in_port[np_3]; np_np_3_type=node_type[np_np_3]; 

                                        if (np_np_2_type == "T") { 


                                                                                                     count_move_left_node[j]++;

                                                                                                     count_move_left_node[no_np_2]++;
 
                                                                                                     left_move_left_node[np_2]=j;
# for LOC-PR-FO as described the active edge is node_port_2, in case there is a "T" there

                                                                                                     type_move[np_2]="LOC-PR";

                                                                                                     move_right[np_2]="Arrow" " " node_port_1[j] " " node_port_3[j] "\n";

                                                                                                     move_left[np_2]=node[j] "\n" node[np_np_2] "\n"; 

                                                            printf("LOC-PR" " " node[j] " " node[np_np_2]  " " "REPLACED BY" " " "Arrow" " " node_port_1[j] " " node_port_3[j] "\n") > "temp_proposed_moves";


                                                                

                                                                 }  else {

                                                                          if (np_np_3_type == "T") { 

                                                                                                     count_move_left_node[j]++;
                                                                                                     count_move_left_node[np_np_3]++;
##################################################################################################
                                                                                                     left_move_left_node[np_3]=j;

# ... otherwise for LOC-PR-FO as described the active edge is node_port_3, in case there is a "T" there but not at node_port_2

                                                                                                     type_move[np_3]="LOC-PR";

                                                                                                     move_right[np_3]="Arrow" " " node_port_1[j] " " node_port_2[j] "\n";

                                                                                                     move_left[np_3]=node[j] "\n" node[np_np_3] "\n"; 

                                                            printf("LOC-PR" " " node[j] " " node[np_np_3]  " " "REPLACED BY" " " "Arrow" " " node_port_1[j] " " node_port_2[j] "\n") > "temp_proposed_moves";
                                                                                           
                                                                                                   }
       
                                                                         }
                                       }




# check for PRIORITY CHOICE "VIRAL- DISCRETE". 
#
# the priority choice works by first removong anything which competes with DIST-FOE (i.e. "DIST-NEW"), then apply the viral priority choice on the remaining moves. That's why the move_left is traversed twice
#

# first traversal of move_left, exclusively for detecting DIST-NEW


      for ( k in move_left) { 

                             tu=type_move[k];

                             coco_left=left_move_left_node[k];

                             coocoo_left=node_type[coco];

                             cucu_left=count_move_left_node[coco];


                             if ( tu == "DIST-NEW"  ) {    

                             dudu_left_1=node_port_1[coco_left]; 

                             if (dudu_left_1 in move_left ) {    

                             coco_left_left=left_move_left_node[dudu_left_1];

                             count_move_left_node[coco_left_left]--;

                             delete move_left[dudu_left_1]; delete move_right[dudu_left_1];}}


                                                             

                            } 

# second traversal, as usual for viral choice


      for ( k in move_left) { 

                             tu=type_move[k];

                             coco=left_move_left_node[k];

                             coocoo=node_type[coco];

                             cucu=count_move_left_node[coco];

                             if (tu == "LOC-PR" && cucu > 1) {  delete move_left[k]; delete move_right[k];}

#                             if (tu == "DIST-NEW" && cucu == 2 ) {  delete move_left[k]; delete move_right[k];}

                             if (tu == "DIST" && cucu == 2 && coocoo == "A") { dudu=node_port_1[coco] ; delete move_left[dudu]; delete move_right[dudu]; }
 
                                                             

                            } 

     for ( ik in move_left ) {  

                               printf(move_left[ik]) > "temp_trashed_nodes"; printf(move_right[ik]) > "temp_added_nodes"; 

                             } 



#
# removes the nodes from move_left from node array
#



     for ( i in node ) { j=node[i]; occ[j]=i;}



     susu="\n";

     for ( i in move_left ) { 

                             lulu=move_left[i];
             
                             delete tem;

                             nunu=split(lulu,tem,susu);

                             for (j in tem ) { 

                                                   s=tem[j];

                                                   if ( s in occ ) { 

                                                                     ss=occ[s]; delete node[ss];

                                                                   }

                                                  }
                                
                            delete tem;

                            }

   
 
#
# adds then nodes from move_right to node array
#
# we use count_max_nodes here
#



 
   for (i in move_right ) { 

                          lili=move_right[i];

                          delete tem; 

                             susu="\n";

                          nene=split(lili,tem,susu);

                          if (nene > 1) {

                          for (h=1; h<nene; h++ ) {

                                                    count_max_nodes++;

                                                    node[count_max_nodes]=tem[h];                                                   
                                 
                                                   }
                                         }

                          delete tem;

                          }


    for ( i in node ) {  s=node[i]; inter_node[i]=s; printf(node[i] "\n") > "temp_inter_nodes"; }

#
# identifies the node ports and edges
#


    for (i in inter_node ) {

                          lolo=inter_node[i];

                          delete tem;

                          susu=" ";

                          nana=split(lolo,tem,susu);


                          if (nana == 2 ) { u=tem[1]; v=tem[2];

                                          inter_node_type[i]=u; 

                                          inter_node_port_1[i]=v;

                                          if ( u == "FRIN" ) { inter_out_port[v]=i; is_not_arrow[i]++; } else { inter_in_port[v]=i;}

                                          } 

                           if (nana == 3 ) { u=tem[1]; v=tem[2]; w=tem[3];

                                          inter_node_type[i]=u;

                                          inter_node_port_1[i]=v;

                                          inter_node_port_2[i]=w;

                                          inter_in_port[v]=i;

                                          inter_out_port[w]=i;

                                          is_arrow[v]++;

                                           }

                           if (nana == 4 ) { u=tem[1]; v=tem[2]; w=tem[3]; z=tem[4];

                                          is_not_arrow[i]++;

                                          inter_node_type[i]=u;

                                          inter_node_port_1[i]=v; 

                                          inter_in_port[v]=i;

                                          inter_node_port_2[i]=w;

                                          inter_node_port_3[i]=z;

                                          inter_out_port[z]=i;

                                          if ( u == "A" || u == "FI" ) { inter_in_port[w]=i; } else { inter_out_port[w]=i; }             
                                   

                                           }
                                                       

                            }


#   for ( i in is_arrow ) { arroin=inter_out_port[i]; arro=inter_in_port[i]; z=inter_node_port_2[arro]; arroout=inter_in_port[z]; 
#                            arroin_type=inter_node_type[arroin];  printf(is_arrow[i] " , " "node " inter_node[arroin] " has type " arroin_type " and links to " inter_node[arro] " who links to " inter_node[arroout] "\n"); } 
#   for (i in is_not_arrow ) {printf( inter_node[i] "\n");}


#
#  the graph before COMB moves
#

    for ( i in inter_node ) { lele=length(inter_node[i]); if ( lele > 0 ) {  printf(inter_node[i] "\n") > "temp_before_comb";} }



#
#  the COMB MOVES loop
#
          count_arrow_del=1;

          while (count_arrow_del > 0 ) {

           count_arrow_del=0;

       

           for ( i in is_arrow ) { if ( is_arrow[i] > 0 ) {  arroin=inter_out_port[i]; arro=inter_in_port[i]; z=inter_node_port_2[arro]; arroout=inter_in_port[z];   

                                   if ( arroin in is_not_arrow ) { arroin_type=inter_node_type[arroin]; 

                                                                  if (arroin_type == "FRIN" ) {

                                                                                               inter_node_port_1[arroin]=z; 

                                                                                               delete inter_node[arro];

                                                                                               inter_out_port[z]=arroin; 

                                                                                               inter_in_port[z]=arroout; 

                                                                                               count_arrow_del++;

                                                                                               is_arrow[i]--;

                                                                                              } 

                                                                  if (arroin_type == "A" || arroin_type == "FI" )  { 

                                                                                               inter_node_port_3[arroin]=z; 

                                                                                               delete inter_node[arro];

                                                                                               inter_out_port[z]=arroin; 

                                                                                               inter_in_port[z]=arroout;

                                                                                               count_arrow_del++;

                                                                                               is_arrow[i]--;

                                                                                            }

                                                                  if (arroin_type == "L" || arroin_type == "FO" || arroin_type == "FOE" )  { 

                                                                                               u=inter_node_port_2[arroin];

                                                                                               v=inter_node_port_3[arroin]; 

                                                                                               delete inter_node[arro];

                                                                                               if ( u == i ) { inter_node_port_2[arroin]=z; } else { inter_node_port_3[arroin]=z; }

                                                                                               inter_out_port[z]=arroin; 

                                                                                               inter_in_port[z]=arroout;

                                                                                               count_arrow_del++;

                                                                                               is_arrow[i]--;

                                                                                            }


                                                                  }
                                      


                                       


                                }  }

                    }

#
#  removes all other arrow element, because they make loops
#



 for (i in inter_node ) { zuzu=inter_node_type[i];  

#                        if ( zuzu == "Arrow" ) { delete inter_node[i]; } 

                        if (zuzu == "FRIN" || zuzu == "FROUT" || zuzu == "T" ) { inter_node[i]=zuzu " " inter_node_port_1[i]; }

                        if (zuzu == "A" || zuzu == "L" || zuzu == "FI" || zuzu == "FO" || zuzu == "FOE" ) { inter_node[i]=zuzu " " inter_node_port_1[i] " " inter_node_port_2[i] " " inter_node_port_3[i]; }

                        }


#
#  print final list of nodes 
#

    for ( i in inter_node ) { lele=length(inter_node[i]); if ( lele > 0 ) {  printf(inter_node[i] "\n") > "temp_final_nodes";} }



####################################################################

}
