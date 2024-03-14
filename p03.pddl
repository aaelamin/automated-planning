(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)
    (not (hero-full))

    ; Location <> Corridor Connections
    (connects c2122 loc-2-1)
    (connects c2122 loc-2-2)
    
    (connects c1222 loc-1-2)
    (connects c1222 loc-2-2)
    
    (connects c2232 loc-2-2)
    (connects c2232 loc-3-2)
    
    (connects c1213 loc-1-2)
    (connects c1213 loc-1-3)
    
    (connects c1223 loc-1-2)
    (connects c1223 loc-2-3)
    
    (connects c2223 loc-2-2)
    (connects c2223 loc-2-3)

    (connects c3223 loc-3-2)
    (connects c3223 loc-2-3)
    
    (connects c3233 loc-3-2)
    (connects c3233 loc-3-3)
    
    (connects c1323 loc-1-3)
    (connects c1323 loc-2-3)
    
    (connects c2333 loc-2-3)
    (connects c2333 loc-3-3)
    
    (connects c1314 loc-1-3)
    (connects c1314 loc-1-4)
    
    (connects c2314 loc-2-3)
    (connects c2314 loc-1-4)
    
    (connects c2324 loc-2-3)
    (connects c2324 loc-2-4)
    
    (connects c2334 loc-2-3)
    (connects c2334 loc-3-4)
    
    (connects c3334 loc-3-3)
    (connects c3334 loc-3-4)
    
    (connects c1424 loc-1-4)
    (connects c1424 loc-2-4)
    
    (connects c2434 loc-2-4)
    (connects c2434 loc-3-4)
    
    (connects c2425 loc-2-4)
    (connects c2425 loc-2-5)
    
    (connects c2535 loc-2-5)
    (connects c2535 loc-3-5)
    
    (connects c3545 loc-3-5)
    (connects c3545 loc-4-5)
    
    (connects c4544 loc-4-5)
    (connects c4544 loc-4-4)
    
    (connects c4443 loc-4-4)
    (connects c4443 loc-4-3)
    
    ; Key locations
    (key-at key1 loc-2-1)   
    (key-colour key1 red)
    
    (key-at key2 loc-2-3)   
    (key-colour key2 green)
    (key-at key3 loc-2-3)   
    (key-colour key3 green)
    (key-at key4 loc-2-3)   
    (key-colour key4 purple)
    (key-at key5 loc-2-3)   
    (key-colour key5 purple)
    
    (key-at key6 loc-4-4)   
    (key-colour key6 rainbow)
    
    ; Locked corridors
    (has-lock c1223)    
    (cor-colour c1223 red)
    (has-lock c2223)    
    (cor-colour c2223 red)
    (has-lock c3223)    
    (cor-colour c3223 red)
    (has-lock c1323)    
    (cor-colour c1323 red)
    (has-lock c2333)    
    (cor-colour c2333 red)
    (has-lock c2314)    
    (cor-colour c2314 red)
    (has-lock c2324)    
    (cor-colour c2324 red)
    (has-lock c2334)    
    (cor-colour c2334 red)
    
    (has-lock c2425)    
    (cor-colour c2425 purple)
    (has-lock c2535)    
    (cor-colour c2535 green)
    (has-lock c3545)    
    (cor-colour c3545 purple)
    (has-lock c4544)    
    (cor-colour c4544 green)
    
    (has-lock c4443)    
    (cor-colour c4443 rainbow)
    
    ; Risky corridors (HANDLED ABOVE - red corridors are 'risky')

    ; Key colours (HANDLED ABOVE)

    ; Key usage properties (one use, two use, etc) (HANDLED IN DOMAIN - Key properties assigned to key colours)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-3)
    )
  )

)
