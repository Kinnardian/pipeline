

(= defaultDir "/pipelines/")
	(def createPipeline (name stacks)
		(prn "Creating new pipeline: " name)
		(prn "with stacks: " stacks)
		(save-file stacks (string (pwd) defaultDir name))
		(repl)
	)
	(def listPipelines (pipelineLocation)
		(prn "listing pipelines")
		(if pipelineLocation 
			(pr (dir pipelineLocation))
			(pr (dir defaultDir))
		)
		(repl)
	)
	(def getPipeline (name))
	;stacks
		(def createStack (name))
		(def getStack(name))
	;items
		(def item (i (o pipeline nil) (o stack nil))
			(if i
				((prn "'Bout to make this item: " i)
					(if stack
						(prn "need to figure out how to insert into a particular stack: " stack)
						((prn "No stack provided") 
							(tofile (string (pwd) defaultDir pipeline ".tmp") (write (fromfile (string (pwd) defaultDir pipeline) (push (caar (cdr (read))) i))))
							(repl)))))
				(prn "Try again: supply an item"))
		(def getItem (nameOrId)
			(prn "getting item"))
		(def deleteItem (item))
	;movements
		(def moveItem (item))





(def pipelineval (expr)
	(= argv (re-match* (pre "[^\\s\"']+|\"([^\"]*)\"|'([^']*)'") expr))
    (prn "running pipelineval")
    (prn "You typed: " expr)
    (prn "command: " (argv 0))
    (prn "argument: " (cdr argv))
    (case (argv 0)
        "createPipeline" (createPipeline (argv 1) (cddr argv) )
        "listPipelines" (listPipelines (argv 1))
        "getPipeline" (prn "gotta figure out how to get a pipeline")
        "createStack" (printGoals)
        "getStack" (prn "need to figure out how to get a stack")
        "item" (item (argv 1) (argv 2) (argv 3))
        "getItem" (prn "need to figure out how to get an item")
        "moveItem" (prn "need to figure out how to move an item")
        "test" ((prn "Your Test Works" ) (repl))
        ((prn "command not found") (repl))))

(def repl ()
    (disp "\npipeline< ")
    (= expr (readline))
    (pipelineval expr))
(def isCommandorScript (arg)
    (in arg '("createPipeline" "createStack" "createItem"))
)
(def topLevel (argv)
    (prn "argv: " argv)
    (if (isCommandorScript (argv 1))
        ('(argv 1) (argv 2))
        (repl)))
(topLevel argv)
