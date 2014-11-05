BEGIN { 

# forked from check_1_foe.awk version 06.10.2014
#
# this program reads a .mol file and produces the json. version 29.09.2014.  owner: chorasimilarity (Marius Buliga, http://chorasimilarity.wordpress.com/ )
#
# but it makes invisible the active edges!
#

      main_const=4;

      gen_const=8;

      left=2;

      right=1;

      middle=1;

     green_col="#04B431";

     red_col="#FF0000";

     in_col="#FFFF00";

     out_col="#2E2EFE";

     bond_int=2;

     bond_ext=1;

     term_col="#7F8C8D";

     arrow_col="#ECF0F1";

     prop_col="#8E44AD";

     nop_col="#95A5A6";



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
       
       b=$2;
       
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


       
#
# a bijective function between the id of the nodes and the number (from json file)
#

j=0;

for ( i in node) {

                  nu_node[i]=j;
                  node_nu[j]=i;
                  s=node_type[i];
                  if (s == "A" || s == "DISA") { zu=s node_port_1[i] node_port_2[i] node_port_3[i];  a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                                  used_port_i[a]++;
                                  used_port_i[b]++;
                                  used_port_i[c]++;
                                  used_port[a]++;
                                  used_port[b]++;
                                  used_port[c]++;
#  active ports
#                                  active_port[c]++;
#                                  active_port[a]++;
#
                                  all_node_text[j]=s;
                                  if (s == "A" ) { all_node_size[j]=main_const; } else { all_node_size[j]=gen_const;}
                                  all_node_colour[j]=green_col;
                                  all_edge_target[a]=j+1;  all_edge_target[b]=j+2; all_edge_source[c]=j+3;
                                  x1=zu "port_1"; x2=zu "port_2"; x3=zu "port_3";
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                  all_edge_source[x2]=j;  all_edge_target[x2]=j+2; all_edge_bond[x2]=bond_int;
                                  all_edge_source[x3]=j;  all_edge_target[x3]=j+3; all_edge_bond[x3]=bond_int;
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=left;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_2" zu;
                                   all_node_text[j]=b;
                                  all_node_size[j]=right;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_3" zu;
                                   all_node_text[j]=c;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=out_col;
                                  }
                    if (s == "FI" || s == "DISFI" ) { zu=s node_port_1[i] node_port_2[i] node_port_3[i]; a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                                  used_port_i[a]++;
                                  used_port_i[b]++;
                                  used_port_i[c]++;
                                  used_port[a]++;
                                  used_port[b]++;
                                  used_port[c]++;
# active port
#                                  active_port[c]++;
#
                                  all_node_text[j]=s;
                                  if (s == "FI" ) { all_node_size[j]=main_const; } else { all_node_size[j]=gen_const;}
                                  all_node_colour[j]=red_col;
                                  all_edge_target[a]=j+1;  all_edge_target[b]=j+2; all_edge_source[c]=j+3;
                                  x1=zu "port_1"; x2=zu "port_2"; x3=zu "port_3";
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                  all_edge_source[x2]=j;  all_edge_target[x2]=j+2; all_edge_bond[x2]=bond_int;
                                  all_edge_source[x3]=j;  all_edge_target[x3]=j+3; all_edge_bond[x3]=bond_int;
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=left;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_2" zu;
                                   all_node_text[j]=b;
                                  all_node_size[j]=right;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_3" zu;
                                   all_node_text[j]=c;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=out_col;
                                  }
                    if (s == "L" || s == "DISL" ) { zu=s node_port_1[i] node_port_2[i] node_port_3[i]; a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                                  used_port_i[a]++;
                                  used_port_i[b]++;
                                  used_port_i[c]++;
                                  used_port[a]++;
                                  used_port[b]++;
                                  used_port[c]++;
# active port
#                                  active_port[c]++;
#
                                  all_node_text[j]=s;
                                  if (s == "L" ) { all_node_size[j]=main_const; } else { all_node_size[j]=gen_const;}
                                  all_node_colour[j]=red_col; 
                                  all_edge_target[a]=j+1;  all_edge_source[b]=j+2; all_edge_source[c]=j+3;

                                  x1=zu "port_1"; x2=zu "port_2"; x3=zu "port_3";
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                  all_edge_source[x2]=j;  all_edge_target[x2]=j+2; all_edge_bond[x2]=bond_int;
                                  all_edge_source[x3]=j;  all_edge_target[x3]=j+3; all_edge_bond[x3]=bond_int;
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;

                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_2" zu;
                                   all_node_text[j]=b;
                                  all_node_size[j]=left;
                                  all_node_colour[j]=out_col;
                                  j++;
#                                  all_node_text[j]="port_3" zu;
                                   all_node_text[j]=c;
                                  all_node_size[j]=right;
                                  all_node_colour[j]=out_col;
                                  }
                    if (s == "FO" || s == "DISFO" ) { zu=s node_port_1[i] node_port_2[i] node_port_3[i]; a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                                  used_port_i[a]++;
                                  used_port_i[b]++;
                                  used_port_i[c]++;
                                  used_port[a]++;
                                  used_port[b]++;
                                  used_port[c]++;
# active ports 
#                                  active_port[a]++;
#                                  active_port[b]++;
#                                  active_port[c]++;
#
                                  all_node_text[j]=s;
                                  if (s == "FO" ) { all_node_size[j]=main_const; } else { all_node_size[j]=gen_const;}
                                  all_node_colour[j]=green_col;
                                  all_edge_target[a]=j+1;  all_edge_source[b]=j+2; all_edge_source[c]=j+3;
                                  x1=zu "port_1"; x2=zu "port_2"; x3=zu "port_3";
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                  all_edge_source[x2]=j;  all_edge_target[x2]=j+2; all_edge_bond[x2]=bond_int;
                                  all_edge_source[x3]=j;  all_edge_target[x3]=j+3; all_edge_bond[x3]=bond_int;
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_2" zu;
                                   all_node_text[j]=b;
                                  all_node_size[j]=left;
                                  all_node_colour[j]=out_col;
                                  j++;
#                                  all_node_text[j]="port_3" zu;
                                   all_node_text[j]=c;
                                  all_node_size[j]=right;
                                  all_node_colour[j]=out_col;
                                  }
                    if ( s == "FOE" ) { zu=s node_port_1[i] node_port_2[i] node_port_3[i]; a=node_port_1[i]; b=node_port_2[i]; c=node_port_3[i];
                                  used_port_i[a]++;
                                  used_port_i[b]++;
                                  used_port_i[c]++;
                                  used_port[a]++;
                                  used_port[b]++;
                                  used_port[c]++;
# active ports 
#                                  active_port[a]++;
#                                  active_port[b]++;
#                                  active_port[c]++;
#
                                  all_node_text[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=in_col;
                                  all_edge_target[a]=j+1;  all_edge_source[b]=j+2; all_edge_source[c]=j+3;
                                  x1=zu "port_1"; x2=zu "port_2"; x3=zu "port_3";
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                  all_edge_source[x2]=j;  all_edge_target[x2]=j+2; all_edge_bond[x2]=bond_int;
                                  all_edge_source[x3]=j;  all_edge_target[x3]=j+3; all_edge_bond[x3]=bond_int;
                                  used_port[x1]++; used_port[x2]++; used_port[x3]++;
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_2" zu;
                                   all_node_text[j]=b;
                                  all_node_size[j]=left;
                                  all_node_colour[j]=out_col;
                                  j++;
#                                  all_node_text[j]="port_3" zu;
                                   all_node_text[j]=c;
                                  all_node_size[j]=right;
                                  all_node_colour[j]=out_col;
                                  }
                    if (s == "Arrow" || s == "NOP2" || s == "PROP" ) { zu=s node_port_1[i] node_port_2[i]; a=node_port_1[i]; b=node_port_2[i];
                                  used_port_i[a]++;
                                  used_port_i[b]++;
                                  used_port[a]++;
                                  used_port[b]++;
                                  all_node_text[j]=s;
                                  if (s == "Arrow" ) { all_node_colour[j]=arrow_col; all_node_size[j]=main_const;} else { if (s == "NOP2" ) { all_node_colour[j]=nop_col; all_node_size[j]=gen_const;} else { all_node_colour[j]=prop_col; all_node_size[j]=gen_const; }}
                                  all_edge_target[a]=j+1;  all_edge_source[b]=j+2;
                                  x1=zu "port_1"; x2=zu "port_2";
                                  used_port[x1]++; used_port[x2]++; 
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                  all_edge_source[x2]=j;  all_edge_target[x2]=j+2; all_edge_bond[x2]=bond_int;
                                  used_port[x1]++; used_port[x2]++; 
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_2" zu;
                                   all_node_text[j]=b;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=out_col;
                                  }

#############################

                    if (s == "MULIN" || s == "MULOUT" ) { zu=s node_port_1[i] node_port_2[i]; a=node_port_1[i]; b=node_port_2[i];
                                  used_port_i[a]++;
                                  used_port_i[b]++;
                                  used_port[a]++;
                                  used_port[b]++;
                                  all_node_text[j]=s;
# active ports 
#                                  active_port[a]++;
#                                  active_port[b]++;
                                  all_node_size[j]=gen_const;
                                  if (s == "MULIN" ) { all_node_colour[j]=out_col; active_port[b]++; } else { all_node_colour[j]=in_col; active_port[a]++; }
                                  all_edge_target[a]=j+1;  all_edge_source[b]=j+2;
                                  x1=zu "port_1"; x2=zu "port_2";
                                  used_port[x1]++; used_port[x2]++; 
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                  all_edge_source[x2]=j;  all_edge_target[x2]=j+2; all_edge_bond[x2]=bond_int;
                                  used_port[x1]++; used_port[x2]++; 
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=in_col;
                                  j++;
#                                  all_node_text[j]="port_2" zu;
                                   all_node_text[j]=b;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=out_col;
                                  }

############################
                                  
                    if (s == "T" ) { zu=s node_port_1[i]; a=node_port_1[i]; 
                                  used_port_i[a]++;
                                  used_port[a]++;
# active port
#                                  active_port[a]++;
                                  all_node_text[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=term_col;
                                  all_edge_target[a]=j+1;
                                  x1=zu "port_1"; 
                                    used_port[x1]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                    used_port[x1]++;
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=in_col;
                                  }
                    if (s == "FROUT" ) { zu=s node_port_1[i]; a=node_port_1[i]; 
                                  used_port_i[a]++;
                                  used_port[a]++;
                                  all_node_text[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=out_col;
                                  all_edge_target[a]=j+1;
                                  x1=zu "port_1"; 
                                    used_port[x1]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                    used_port[x1]++;
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=in_col;
                                  }
                    if (s == "FRIN" ) { zu=s node_port_1[i]; a=node_port_1[i];                                  used_port_i[a]++;
                                  used_port[a]++;
                                  all_node_text[j]=s;
                                  all_node_size[j]=main_const;
                                  all_node_colour[j]=in_col;
                                  all_edge_source[a]=j+1;
                                  x1=zu "port_1"; 
                                    used_port[x1]++;
                                  all_edge_source[x1]=j;  all_edge_target[x1]=j+1; all_edge_bond[x1]=bond_int;
                                    used_port[x1]++;
                                  j++;
#                                  all_node_text[j]="port_1" zu;
                                   all_node_text[j]=a;
                                  all_node_size[j]=middle;
                                  all_node_colour[j]=out_col;
                                  }

                 j++;
                 }
                 
    j--;
    jmax=j;

    for (i in used_port_i ) {  all_edge_bond[i]=bond_ext;}
    
    printf("{ \n    \"nodes\": [ \n    {\"atom\": \""all_node_text[0]"\", \"size\": " all_node_size[0] ", \"colour\": \"" all_node_colour[0] "\"}") > "graph_before.json";
    
    for (k=1;k<=jmax; k++) {
    
    printf(", \n    {\"atom\": \""all_node_text[k]"\", \"size\": " all_node_size[k] ", \"colour\": \"" all_node_colour[k] "\"}") >> "graph_before.json";
    }
    
    printf(" \n  ], \n    \"links\": [ \n") >> "graph_before.json";
    
    cucu=0;
    
    for (i in used_port) { a=used_port[i]; fufu=active_port[i]; if ( (a == 2 ) && (fufu < 1) ) { if (cucu == 0 ){ 
    
    printf("{\"source\": " all_edge_source[i] ", \"target\": " all_edge_target[i] ",  \"bond\": " all_edge_bond[i] "}") >> "graph_before.json"; cucu++; } else{
    printf(", \n {\"source\": " all_edge_source[i] ", \"target\": " all_edge_target[i] ",  \"bond\": " all_edge_bond[i] "}") >> "graph_before.json";    }   }}

    printf(" \n  ] \n  }") >> "graph_before.json";

###################################


}
