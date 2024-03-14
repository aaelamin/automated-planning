(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)

    ; Locationg <> Corridor Connections
    (connects c2122 loc-2-1) 
    (connects c2122 loc-2-2)
    
    (connects c1222 loc-1-2) 
    (connects c1222 loc-2-2)
    
    (connects c2232 loc-2-2) 
    (connects c2232 loc-3-2)
    
    (connects c3242 loc-3-2) 
    (connects c3242 loc-4-2)
    
    (connects c2223 loc-2-2) 
    (connects c2223 loc-2-3)

    ; Key locations
    (key-at key1 loc-2-1) 
    (key-colour key1 green)      ; 1-use 

    (key-at key2 loc-1-2) 
    (key-colour key2 rainbow)    ; treasure key

    
    (key-at key3 loc-2-2) 
    (key-colour key3 purple)     ; 1-use key
    
    (key-at key4 loc-2-3) 
    (key-colour key4 yellow)     ; 2-use key

    

    ; Locked corridors
    (has-lock c2122) 
    (cor-colour c2122 purple)
    
    (has-lock c1222) 
    (cor-colour c1222 yellow)

    (has-lock c2232)
    (cor-colour c2232 yellow)

    (has-lock c3242)
    (cor-colour c3242 rainbow)

    (has-lock c2223)
    (cor-colour c2223 green)


    ; Corridors colours (defined above)
    

  

  )
  (:goal
    (and
      ; Hero's final location (treasure room)
      (hero-at loc-4-2)
    )
  )

)
