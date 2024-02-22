(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates

        ; One predicate given for free!
        (hero-at ?loc - location)

        
            ; LOCATION PREDICATES
        ; Whether a location is messy
        (is-messy ?loc - location)
        
            ; CORRIDOR PREDICATES
        ; Whether a corridor connects to a specified location
        (connects ?cor - corridor ?loc - location)
        
        ; Whether a corridor is locked
        (has-lock ?cor - corridor)
        
        ; Whether a corridor has a certain colour (for lock/key interactions and "risky" corridors)
        (cor-colour ?cor - corridor ?col - colour)
        
            ; HERO PREDICATES
        ; Whether the hero is currently holding a key
        (hero-full)
        
        ; Whether the hero is holding a particular key
        (hero-carrying ?k - key)
        
            ; KEY PREDICATES
        ; Whether a key is of a particular colour
        (key-colour ?k - key ?col - colour)
        
        ; Whether a key is at a particular location
        (key-at ?k - key ?loc - location)
        
        ; Whether a key has a charge
        (has-charge ?k - key)
        
        ; Whether a yellow key has a second charge
        (has-second-charge ?k - key)
    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and
        
            ; IMPLEMENT ME
            
            (hero-at ?from)
            (not (has-lock ?cor))
            (not (= ?from ?to))
            (connects ?cor ?from)
            (connects ?cor ?to)

        )

        :effect (and
            
            ; IMPLEMENT ME
            ; The hero moves from current location to destination
            (not (hero-at ?from))
            (hero-at ?to)
            ; If the corridor is "risky", it collapses and makes the destination messy
            (when 
                (cor-colour ?cor red) 
                (and 
                    (not (connects ?cor ?from))
                    (not (connects ?cor ?to))
                    (is-messy ?to)
                )
            )
            
        )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and
            
            ; IMPLEMENT ME
            
            (hero-at ?loc)
            (key-at ?k ?loc)
            (not (hero-full))
            (not (is-messy ?loc))
        )

        :effect (and
            
            ; IMPLEMENT ME
            
            (not (key-at ?k ?loc))
            (hero-full)
            (hero-carrying ?k)
        )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            
            (hero-at ?loc)
            (hero-carrying ?k)
        )

        :effect (and

            ; IMPLEMENT ME
            
            (not (hero-carrying ?k))
            (not (hero-full))
            (key-at ?k ?loc)
        )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and

            ; IMPLEMENT ME
            (hero-at ?loc)
            (hero-carrying ?k)
            (connects ?cor ?loc)
            
            (key-colour ?k ?col)
            (cor-colour ?cor ?col)
            (has-lock ?cor)
        )

        :effect (and

            ; IMPLEMENT ME
            (not (has-lock ?cor))
            ; If the key has only one charge left, the charge is consumed
            (when
                (and
                    (not (key-colour ?k red))
                    (not (key-colour ?k yellow))
                    (has-charge ?k)
                )
                (not (has-charge ?k))
            )
            ; If the key is yellow, the second charge is consumed in place of the first if possible
            (when
                (and
                    (key-colour ?k yellow)
                    (not (has-second-charge ?k))
                )
                (not (has-charge ?k))
            )
            (when
                (and
                    (key-colour ?k yellow)
                    (has-second-charge ?k)
                )
                (not (has-second-charge ?k))
            )
        )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and
        
            ; IMPLEMENT ME
            (hero-at ?loc)
            (is-messy ?loc)
        )

        :effect (and

            ; IMPLEMENT ME
            (not (is-messy ?loc))
        )
    )

)
