!(import! &self ../aStar-action-planner)  

!(bind! &testedActions (new-space))
!(bind! &priorityQueue (new-space))
!(bind! &ruleSpace (new-space))
!(import! &self ../../../rules/rule)

!(add-atom &ruleSpace (: r1 (IMPLICATION_LINK (AND_LINK (Goal init 0.9 0.6) explore) (Goal found_target 1.0 1.0))))
!(add-atom &ruleSpace (: r2 (IMPLICATION_LINK (AND_LINK (Goal init 0.9 0.6) activate) (Goal active 0.8 0.5))))
 
;!(addNewStates 
;   ((explore (Goal found_target 1.0 1.0))) 
;   0.0 
;   () 
;   &priorityQueue 
;   (Goal found_target 1.0 1.0) 
;   &ruleSpace) ; returns (())
;!(test (get-atoms &testedActions) ((Goal found_target 1.0 1.0) explore)) ;returns (true)
;!(test (get-atoms &priorityQueue) (0.0 (Goal found_target 1.0 1.0) (explore))) ;returns (true)

;findMinEntry
;!(add-atom &priorityQueue (5 (Goal init 0.9 0.6) ())) 
;!(add-atom &priorityQueue (2 (Goal found_target 1.0 1.0) (explore))) 
;!(add-atom &priorityQueue (10 (Goal active 0.8 0.5) (move)))
;!(test (findMinEntry &priorityQueue) (2 (Goal found_target 1.0 1.0) (explore))) ;returns (true)

;popMin
;!(test (popMin &priorityQueue) (2 (Goal found_target 1.0 1.0) (explore))) ;returns (true)
;!(get-atoms &priorityQueue) ; returns ((5 (Goal init 0.9 0.6) ()) (10 (Goal active 0.8 0.5) (move)))
;!(test (findMinEntry &priorityQueue) (5 (Goal init 0.9 0.6) ())) ;returns (true)

;applyActions
;!(applyActions (explore) (Goal init 0.9 0.6) () &ruleSpace) ; results (((explore (Goal found_target 1.0 1.0))))
;!(test 
;  (applyActions (explore) (Goal init 0.9 0.6) () &ruleSpace) 
;  ((explore (Goal found_target 1.0 1.0)))) ;returns (true)

;filterUntriedRulesList
;!(add-atom &testedActions ((Goal init 0.9 0.6) move)) ;returns (true)
;!(test (filterUntriedRulesList ((explore) (move)) () ()) ((move) (explore))) ;returns (true)
;!(test (filterUntriedRulesList ((explore) (move)) ((move)) ()) ((explore))) ;returns (true)
;!(test (filterUntriedRulesList ((explore) (move) (activate)) ((explore) (move) (activate)) ()) ()) ;returns (true)
;!(test (filterUntriedRulesList ((explore) (move) (activate)) () ()) ((activate) (move) (explore))) ;returns (true)
;!(test (filterUntriedRulesList ((explore) (move) (activate)) ((move) (explore)) ()) ((activate))) ;returns (true)

;isMember
;!(add-atom &testedActions ((Goal init 0.9 0.6) move)) ;returns (true)
;!(test (isMember (Goal active 0.8 0.5) &testedActions) False)  ;returns (true)
;!(test (isMember (Goal init 0.9 0.6) &testedActions) True)  ;returns (true)

;goal-value
;!(add-atom &ruleSpace (: r3 (IMPLICATION_LINK (AND_LINK (Goal init 0.9 0.6) search) (Goal intermediate 0.95 0.65))))  ;returns (true)
;!(test (goal-value (Goal init 0.9 0.6) &ruleSpace) 0.9)  ;returns (true)
;!(test (desired-goal-value (Goal init 0.9 0.6) &ruleSpace) 0.6)  ;returns (true)

;distance
;!(test (distance (Goal init 0.9 0.6) (Goal found_target 1.0 1.0) &ruleSpace) 0.5)  ;returns (true)
;!(test (distance (Goal init 0.9 0.6) (Goal unknown 0.0 0.0) &ruleSpace) 1.5)  ;returns (true)

;aStarPlanner
!(test (aStarPlanner (Goal found_target 1.0 1.0) (Goal found_target 1.0 1.0) &testedActions &ruleSpace) ())  
!(test (aStarPlanner (Goal init 0.9 0.6) (Goal found_target 1.0 1.0) &testedActions &ruleSpace) (explore))

;!(add-atom &ruleSpace (: r3 (IMPLICATION_LINK (AND_LINK (Goal active 0.8 0.5) move) (Goal reached 0.9 0.7)))) ;uncomment the above ruleSpaces and also the tests for the the planner, since aStarPlanner’s sequential rule evaluation 
;!(test (aStarPlanner (Goal active 0.8 0.5) (Goal reached 0.9 0.7) &testedActions &ruleSpace) (move))


