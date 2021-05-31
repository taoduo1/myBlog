package com.example.myblog.test.treetest.avltree;

/**
 * @author : duo.tao
 * @description :
 * @date : 2021/5/23 19:07
 */

public class AvlTree<E> {

    public void insert(AvlNode root, int data) {
        //插入数据小于根节点数据，则想左边递归插入
        if (data < root.data) {
            if (root.left != null) {
                insert(root.left, data);
            } else {
                root.left = new AvlNode(data);
                root.left.parent = root;
            }
        } else {
            if (root.right != null) {
                insert(root.right, data);
            } else {
                root.right = new AvlNode(data);
                root.right.parent = root;
            }
        }

        //数据插入之后开始计算平衡因子
        root.balance = calBalance(root);
        //左子树高，应该右旋
        if (root.balance >= 2) {
            //右孙高，先左旋
            if (root.left.balance == -1) {
                left_rotate(root.left);
            }
            right_rotate(root);
        }
        //右子树高,左旋
        if (root.balance <= -2) {
            //左孙高，先右旋
            if (root.right.balance == 1) {
                right_rotate(root.right);
            }
            left_rotate(root);
        }
        root.balance = calBalance(root);
        root.depth = calcDepth(root);

    }

    private void right_rotate(AvlNode p) {
        //一次旋转涉及到的节点包括祖父，父亲，右儿子
        AvlNode pParent = p.parent;
        AvlNode pLeftSon = p.left;
        AvlNode pRightGrandSon = pLeftSon.right;
        //左子变父
        pLeftSon.parent = pParent;
        if (pParent != null) {
            if (p == pParent.left) {
                pParent.left = pLeftSon;
            } else if (p == pParent.right) {
                pParent.right = pLeftSon;
            }
        }
        pLeftSon.right = p;
        p.parent = pLeftSon;
        //右孙变左孙
        p.left = pRightGrandSon;
        if (pRightGrandSon != null) {
            pRightGrandSon.parent = p;
        }
        p.depth = calcDepth(p);
        p.balance = calBalance(p);

        pLeftSon.depth = calcDepth(p);
        pLeftSon.balance = calBalance(p);
    }

    private void left_rotate(AvlNode p) {
        //一次旋转涉及到的节点包括祖父，父亲，右儿子
        AvlNode pParent = p.parent;
        AvlNode pRightSon = p.right;
        AvlNode pLeftGrandSon = pRightSon.left;
        //左子变父
        pRightSon.parent = pParent;
        if (pParent != null) {
            if (p == pParent.right) {
                pParent.right = pRightSon;
            } else if (p == pParent.left) {
                pParent.left = pRightSon;
            }
        }
        pRightSon.right = p;
        p.parent = pRightSon;
        //右孙变左孙
        p.right = pLeftGrandSon;
        if (pLeftGrandSon != null) {
            pLeftGrandSon.parent = p;
        }
        p.depth = calcDepth(p);
        p.balance = calBalance(p);

        pRightSon.depth = calcDepth(p);
        pRightSon.balance = calBalance(p);
    }

    private int calBalance(AvlNode p) {
        int left_depth;
        int right_depth;
        //左子树深度
        if (p.left != null) {
            left_depth = p.left.depth;
        } else {
            left_depth = 0;
        }
        //右子树深度
        if (p.right != null) {
            right_depth = p.right.depth;
        } else {
            right_depth = 0;
        }
        return left_depth - right_depth;
    }

    public int calcDepth(AvlNode p) {
        int depth = 0;
        if (p.left != null) {
            depth = p.left.depth;
        }
        if (p.right != null && depth < p.right.depth) {
            depth = p.right.depth;
        }
        depth++;
        return depth;
    }


    public class AvlNode<T> {

        public int data; //数据域

        public int depth;//保存节点的深度

        public int balance; //是否平衡

        public AvlNode parent;

        public AvlNode left;

        public AvlNode right;

        public AvlNode(int data) {
            this.data = data;
            depth = 1;
            balance = 0;
            left = null;
            right = null;
        }
    }

}
