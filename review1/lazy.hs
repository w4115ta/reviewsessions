l :: [Integer]
l  = [0..5]

l' = drop 1 $ map (\x -> 100 `div` x) l
