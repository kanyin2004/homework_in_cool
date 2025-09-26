-- =========================
-- Binary Tree and Queue (COOL)  [ASCII-only version]
-- =========================

class TreeNode {
  val  : Int    <- 0;
  left : TreeNode;
  right: TreeNode;

  init(v : Int) : TreeNode {
    {
      val  <- v;
      -- left/right default to void; no need to set
      self;
    }
  };

  set_left(n : TreeNode)  : TreeNode { { left  <- n; self; } };
  set_right(n: TreeNode)  : TreeNode { { right <- n; self; } };
  get_val() : Int         { val };
  get_left(): TreeNode    { left };
  get_right(): TreeNode   { right };
};

class BinaryTree {
  root : TreeNode;

  -- insert by BST rule
  insert(v : Int) : BinaryTree {
    {
      if isvoid root then
        root <- (new TreeNode).init(v)
      else
        { insert_at(root, v); 0; }
      fi;
      self;
    }
  };

  insert_at(cur : TreeNode, v : Int) : Object {
    if v < cur.get_val() then
      if isvoid cur.get_left() then
        cur.set_left( (new TreeNode).init(v) )
      else
        insert_at(cur.get_left(), v)
      fi
    else
      if isvoid cur.get_right() then
        cur.set_right( (new TreeNode).init(v) )
      else
        insert_at(cur.get_right(), v)
      fi
    fi
  };

  get_root() : TreeNode { root };
};

-- Queue node (linked list)
class QNode {
  item : TreeNode;
  next : QNode;

  init(x : TreeNode) : QNode {
    {
      item <- x;
      -- next defaults to void
      self;
    }
  };

  get_item() : TreeNode { item };
  get_next() : QNode    { next };
  set_next(n : QNode) : QNode { { next <- n; self; } };
};

-- Queue implementation
class Queue {
  front : QNode;
  back  : QNode;
  size  : Int <- 0;

  -- enqueue(item)
  enqueue(item : TreeNode) : Queue {
    {
      let node : QNode <- (new QNode).init(item) in {
        if size = 0 then
          {
            front <- node;
            back  <- node;
          }
        else
          {
            back.set_next(node);
            back <- node;
          }
        fi;
        size <- size + 1;
      };
      self;
    }
  };

  -- dequeue(): return front element (may be void)
  dequeue() : TreeNode {
    if size = 0 then
      {
        (new IO).out_string("dequeue: queue is empty.\n");
        (let dummy : TreeNode in dummy);
      }
    else
      {
        let ret : TreeNode <- front.get_item(),
            nxt : QNode    <- front.get_next()
        in {
          front <- nxt;
          if isvoid front then back <- (let b : QNode in b) else 0 fi;
          size <- size - 1;
          ret;
        };
      }
    fi
  };

  -- is empty?
  inEmpty() : Bool { size = 0 };

  -- print from front to back
  print() : Queue {
    {
      let io : IO <- new IO, p : QNode <- front in {
        io.out_string("[Queue] ");
        while not (isvoid p) loop
          {
            io.out_int(p.get_item().get_val());
            if not (isvoid p.get_next()) then io.out_string(" -> ") else 0 fi;
            p <- p.get_next();
          }
        pool;
        io.out_string("\n");
      };
      self;
    }
  };
};

-- BFS (level-order) traversal using Queue
class Main {
  main() : Object {
    {
      let io : IO <- new IO, t : BinaryTree <- new BinaryTree in {
        t.insert(10).insert(5).insert(15).insert(3).insert(7).insert(12).insert(18);
        io.out_string("BFS (level-order) traversal using Queue:\n");

        let q : Queue <- new Queue in {
          if not (isvoid t.get_root()) then q.enqueue(t.get_root()) else 0 fi;

          while not q.inEmpty() loop
            {
              let node : TreeNode <- q.dequeue() in
                if isvoid node then
                  0
                else
                  {
                    io.out_int(node.get_val());
                    io.out_string(" ");
                    if not (isvoid node.get_left()) then q.enqueue(node.get_left()) else 0 fi;
                    if not (isvoid node.get_right()) then q.enqueue(node.get_right()) else 0 fi;
                  }
                fi;
            }
          pool;

          io.out_string("\n");
        };
      };
      0;
    }
  };
};
