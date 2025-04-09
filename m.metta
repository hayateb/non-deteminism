!(car-atom (1 2 3 ))
!(cdr-atom (1 2 3))

(= (filter ()) ())

(= (filter $x)
   (let* ( ($new (car-atom $x))
           ($tail (cdr-atom $x))
           ($h (filter $tail)) )
      (if (== (% $new 2) 1)  
          (cons-atom $new $h) 
          $h))) 

(= (map $f $lst)
   (if (== $lst ())
       ()
       (let* ( ($head (car-atom $lst))
              ($tail (cdr-atom $lst))
              ($new ($f $head)) 
              ($newn (map $f $tail)))
         (cons-atom $new $newn ))))
(= (double $x) (* $x 2))
(= (even $x) (== (% $x 2) 0))
! (filter (2 3 4 8 36 9 0 1));; filter recursive function
!(map double (7 10 30)) ;; recursive map

(= (maps $f $list)
      (let* (($new (superpose $list)))
       (collapse ($f $new))
      )
)


(= (filterr $f $list)
   (let* (($new (superpose $list)))
      (if ($f $new)
          $new
          False
      )    
))

( false 10 30)
!(maps double (7 10 30)) ;; non- determinism map
! (filterr even (7 10 30) ) ;; filter non-determinism 

   
