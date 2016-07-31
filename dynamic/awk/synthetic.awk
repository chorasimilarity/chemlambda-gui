BEGIN{

# synthetizer script for the chemlambda. Made on 09.08.2015 by chorasimilarity (Marius Buliga)


   kin=0;

   kout=0;






#end BEGIN
}

# first group
{


  susu=$1;

  if (susu=="//") {donothing=1;} else{

# ignores the lines with less than 2 fields  (no loop element)

      if (NF == 2) {

       nodetype=$1; nodeport1=$2; 

       if (nodetype=="FRIN") {

       cout[kout]=nodeport1; touc[nodeport1]=kout; edgy[nodeport1]++; 

       outpu[NR]=nodetype " o" kout "a\n";


       kout++;

} else {


        cin[kin]=nodeport1; nic[nodeport1]=kin; edgy[nodeport1]++; 

        outpu[NR]=nodetype " i" kin "a\n";

        kin++;

} 





      
                 }


#
# 

       if ( NF == 3 ) {  

         nodetype=$1; nodeport1=$2; nodeport2=$3;

       cin[kin]=nodeport1; nic[nodeport1]=kin; edgy[nodeport1]++; 

       cout[kout]=nodeport2; touc[nodeport2]=kout; edgy[nodeport2]++; 

       outpu[NR]=nodetype " i" kin "a o" kout "a\n";

       kin++; kout++; 

                       }

#
#

       if (NF == 4) {  

        nodetype=$1; nodeport1=$2; nodeport2=$3; nodeport3=$4;

       cin[kin]=nodeport1; nic[nodeport1]=kin; edgy[nodeport1]++; kin1=kin; kin++;

       cout[kout]=nodeport3; touc[nodeport3]=kout; edgy[nodeport3]++; kout3=kout; kout++;

       if ( nodetype=="A" || nodetype=="FI") {

            cin[kin]=nodeport2; nic[nodeport2]=kin; edgy[nodeport2]++; 

            outpu[NR]=nodetype " i" kin1 "a i" kin "a o" kout3 "a\n"; 

            kin++;

                                             } else {

            cout[kout]=nodeport2; touc[nodeport2]=kout; edgy[nodeport2]++; 

            outpu[NR]=nodetype " i" kin1 "a o" kout "a o" kout3 "a\n"; 

            kout++;



                                                     }


                     }

#end if if (susu=="//") ... 
   } 

#end first group
}

END{

# adds FRIN FROUT nodes if needed.

  cfree=0;

   for (edy in edgy) {

  edyedgy=edgy[edy]; 

  if (edyedgy==1) { 

   if (edy in nic) { 

              cfk=cfree "exto";
              nodetype="FRIN";
              nodeport1=edy;
 
              cout[kout]=nodeport1; touc[nodeport1]=kout; edgy[nodeport1]++; 

              outpu[cfk]=nodetype " o" kout "a\n"; kout++; cfree++;
                 
 } else {

              cfk=cfree "exto";
              nodetype="FROUT";
              nodeport1=edy;
 
              cin[kin]=nodeport1; nic[nodeport1]=kin; edgy[nodeport1]++; 

              outpu[cfk]=nodetype " i" kin "a\n"; kin++; cfree++;

}

                  }

                     }

 
  printf(" \n") > "synt.mol" ;

  for ( ff in outpu ) { sisi=outpu[ff]; printf(sisi) >> "synt.mol" ; }

  for (zin in cin) { sisi="Arrow i" zin " i" zin "a\n"; printf(sisi) >> "synt.mol" ;  }

  for (zouc in cout) { sisi="Arrow o" zouc "a o" zouc "\n"; printf(sisi) >> "synt.mol" ;  } 

  for (edy in edgy) {

  edyedgy=edgy[edy];

  if (edyedgy==2) {



# supposes that the mol file is correct

  edyi=nic[edy]; edyo=touc[edy];

  zozo="FI a" edyo " o" edyo " mix" edyo "\n" "FOE mix" edyo " a" edyi " i" edyo "\n";

  printf(zozo) >> "synt.mol" ;  





                  }



# end for (edy in edgy)
}

  








#end END
}
