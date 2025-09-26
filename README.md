# homework_in_cool
Binary Tree and Queue in COOL

本项目使用 COOL (Classroom Object-Oriented Language)
 实现了二叉搜索树 (Binary Search Tree, BST) 和 队列 (Queue)，并基于队列完成了 广度优先遍历 (BFS/Level-order Traversal)。

功能特性

TreeNode：二叉树节点类，包含 val、left、right。

BinaryTree：支持按 BST 插入规则插入新节点。

QNode + Queue：链表实现的队列，支持 enqueue、dequeue、打印队列内容。

Main：利用队列实现二叉树的 BFS 遍历。

环境要求

COOL 编译器

在 Ubuntu 下可使用：

sudo apt-get install coolc

编译与运行

编译代码：

coolc erchashu.cl


执行：

spim a.out


或者根据你系统安装的运行环境执行 COOL 运行时。

示例

以插入如下顺序的节点：

10, 5, 15, 3, 7, 12, 18


对应的二叉搜索树结构为：

        10
       /  \
      5    15
     / \   / \
    3   7 12 18


运行后 BFS 遍历输出：

BFS (level-order) traversal using Queue:
10 5 15 3 7 12 18

文件结构

TreeNode：树节点定义

BinaryTree：二叉搜索树

QNode / Queue：队列实现

Main：主程序（BFS 演示）

后续改进方向

增加二叉树的中序、前序、后序遍历。

增加删除节点功能。

队列扩展为泛型数据结构。
