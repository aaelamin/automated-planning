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
    (key-at key1 loc-2-1) ; green key
    (key-at key2 loc-1-2) ; rainbow key
    (key-at key3 loc-2-2) ; purple key
    (key-at key4 loc-2-3) ; yellow key
    

    ; Locked corridors
    (has-lock c2122) 
    (has-lock c1222) 
    (has-lock c2232) 
    (has-lock c3242)
    (has-lock c2223)

    ; Corridors/locks colours
    (cor-colour c2122 purple)
    (cor-colour c1222 yellow)
    (cor-colour c2232 yellow)
    (cor-colour c3242 rainbow)
    (cor-colour c2223 green)

    ; Key colours
    (key-colour key1 green)      ; 1-use 
    (key-colour key2 rainbow)    ; treasure key
    (key-colour key3 purple)     ; 1-use key
    (key-colour key4 yellow)     ; 2-use key


    ; Key usage properties (one use, two use, etc)
    (has-charge key1)           ; First charge for green key
    (has-charge key2)           ; First charge for rainbow key
    (has-charge key3)           ; Single charge for purple key
    (has-charge key4)           ; First charge for yellow key
    (has-second-charge key4)    ; Second charge for yellow key


  )
  (:goal
    (and
      ; Hero's final location (treasure room)
      (hero-at loc-4-2)
    )
  )

)
