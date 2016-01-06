 #while curr_line != "":
    #    if curr_line[0] == "h":
    #        curr_line= f.readline()
    #h_lst= curr_line[:-1].split()
     #       print h_lst
      #      hc= Tichu_Card()
       #     try:
        #        hc.value= int(h_lst[1])
         #   except:
          #      hc.value= h_lst[1]
           # hc.suit= h_lst[2]
            #cp.hand += [hc]
            #curr_line= f.readline()
 #       elif curr_line[0] == 't':
  #          t_lst= curr_line[:-1]
   #         print t_lst
    #        tc= Tichu_Card()
     #       try:
      #          tc.value= int(t_lst[1])
       #     except:
        #        tc.value= t_lst[1]
         #   tc.suit= t_lst[2]
          #  cp.taken += [tc]
           # curr_line= f.readline()
            #print cp.hand
            #print cp.taken
        3return cp          
        #except:
         #   print "Error Opening File"
          #  return None