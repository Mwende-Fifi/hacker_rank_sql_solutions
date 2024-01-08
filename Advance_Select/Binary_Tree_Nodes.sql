WITH RECURSIVE tree AS (
	SELECT N, P, N AS root,
	CASE WHEN P IS NULL THEN "Root"
		WHEN N IN (SELECT P FROM BST) THEN "Inner"
		ELSE "Leaf" END AS nodeType
			FROM BST
			WHERE P IS NULL
			UNION ALL
			SELECT bst.N, bst.P, tree.root,
			CASE WHEN bst.N IN (SELECT P FROM BST) THEN "Inner"
			ELSE "Leaf" END AS nodeType
				FROM BST bst
				JOIN tree ON bst.P = tree.N
			)
			SELECT N, nodeType
			FROM tree
			ORDER BY root, N;
