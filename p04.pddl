(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-1 loc-2-1 loc-3-1 loc-4-1 loc-5-1 loc-6-1 - location
    c1151 c1161 c2141 c2151 c3141 c4151 c5161- corridor
    key1 key2 key3 key4 key5 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-4-1)
    (not (hero-full))
    
    ; Location <> Corridor Connections
    (connects c1151 loc-1-1)
    (connects c1151 loc-5-1)
    
    (connects c1161 loc-1-1)
    (connects c1161 loc-6-1)
    
    (connects c2141 loc-2-1)
    (connects c2141 loc-4-1)
    
    (connects c2151 loc-2-1)
    (connects c2151 loc-5-1)
    
    (connects c3141 loc-3-1)
    (connects c3141 loc-4-1)
    
    (connects c4151 loc-4-1)
    (connects c4151 loc-5-1)
    
    (connects c5161 loc-5-1)
    (connects c5161 loc-6-1)

    ; Key locations
    (key-at key1 loc-4-1)
    (key-colour key1 red)
    
    (key-at key2 loc-4-1)
    (key-colour key2 yellow)
    
    (key-at key3 loc-5-1)
    (key-colour key3 green)
    
    (key-at key4 loc-6-1)
    (key-colour key4 purple)
    
    (key-at key5 loc-1-1)
    (key-colour key5 rainbow)
    
    ; Locked corridors
    (has-lock c1151)
    (cor-colour c1151 purple)
    
    (has-lock c1161)
    (cor-colour c1161 yellow)
    
    (has-lock c2141)
    (cor-colour c2141 green)
    
    (has-lock c2151)
    (cor-colour c2151 yellow)
    
    (has-lock c3141)
    (cor-colour c3141 rainbow)
    
    (has-lock c4151)
    (cor-colour c4151 red)
    
    (has-lock c5161)
    (cor-colour c5161 red)

    ; Risky corridors (HANDLED ABOVE - red corridors are 'risky')

    ; Key colours (HANDLED ABOVE)

    ; Key usage properties (one use, two use, etc) (HANDLED IN DOMAIN - Key properties assigned to key colours)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)
