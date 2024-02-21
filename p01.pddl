(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)

    
    ; Location <> Corridor Connections
    (connects c3132 loc-3-1) 
    (connects c3132 loc-3-2)
    
    (connects c1222 loc-1-2) 
    (connects c1222 loc-2-2)
    
    (connects c2232 loc-2-2) 
    (connects c2232 loc-3-2)
    
    (connects c3242 loc-3-2) 
    (connects c3242 loc-4-2)
    
    (connects c2223 loc-2-2) 
    (connects c2223 loc-2-3)
    
    (connects c3233 loc-3-2) 
    (connects c3233 loc-3-3)
    
    (connects c2333 loc-2-3) 
    (connects c2333 loc-3-3)
    
    (connects c2324 loc-2-3) 
    (connects c2324 loc-2-4)
    
    (connects c3334 loc-3-3) 
    (connects c3334 loc-3-4)
    
    (connects c2434 loc-2-4)
    (connects c2434 loc-3-4)
    
    (connects c3444 loc-3-4)
    (connects c3444 loc-4-4)
    
    
    ; Key locations
    (key-at key1 loc-2-2) 
    (key-at key2 loc-2-4) 
    (key-at key3 loc-4-2) 
    (key-at key4 loc-4-4) 

    
    ; Locked corridors
    (has-lock c3132)
    (has-lock c3242)
    (has-lock c2324)
    (has-lock c2434)
    (has-lock c3444)
    

    ; Corridors colours
    (cor-colour c3132 rainbow)
    (cor-colour c3242 purple)
    (cor-colour c2324 red)     ; Risky Corridors
    (cor-colour c2434 red)     ; Risky Corridors
    (cor-colour c3444 yellow)

  
    ; Key colours
    (key-colour key1 red)       ; Multi-use red key
    (key-colour key2 yellow)    ; 2-use 
    (key-colour key3 rainbow)   ; 1-use 
    (key-colour key4 purple)    ; 1-use 

    
    ; Key usage properties (one use, two use, etc)
    (has-charge key1)           ; Red key has multiple charges
    (has-charge key2)           ; First charge for yellow key
    (has-second-charge key2)    ; Second charge for yellow key
    (has-charge key3)           ; Single charge for rainbow key
    (has-charge key4)           ; Single charge for purple key

  )
  (:goal
    (and
      ; Hero's final location (treasure room)
        (hero-at loc-3-1)

    )
  )

)
