import java.io.*;
import java.util.*;

public class binaryTreeSearch
{
    private treeNode root;

    public binaryTreeSearch()
    {
        root = null;
    }

    public void insert(String term, String file)
    {
        treeNode New = search(term);

        if (New == null)
        {
            New = new treeNode(term);
            filesList list = New.filesList;
            list.insertSorted(file, 1);
        }
        else
        {
            filesList list = New.filesList;
            listNode node = list.search(file);

            if (node != null)
            {
                node.frequency++;
            }
            else
            {
                list.insertSorted(file, 1);
            }

            return;
        }

        if (root == null)
        {
            root = New;
        }
        else
        {
            treeNode current = root;
            treeNode previous;

            while (true)
            {
                previous = current;

                if (term.compareTo(current.term) < 0)
                {
                    current = current.left;

                    if (current == null)
                    {
                        previous.left = New;
                        return;
                    }
                }
                else
                {
                    current = current.right;

                    if (current == null)
                    {
                        previous.right = New;
                        return;
                    }
                }
            }
        }
    }

    public treeNode search(String term)
    {

        if (root == null)
        {
            return null;
        }

        treeNode current = root;

        while (!current.term.equals(term))
        {
            if (term.compareTo(current.term) < 0)
            {
                current = current.left;
            }
            else
            {
                current = current.right;
            }

            if (current == null)
            {
                return null;
            }           
        }

        return current;
    }

    public void inOrder()
    {
        inOrder(root);
    }

    public void inOrder(treeNode current)
    {
        if (current != null)
        {
            inOrder(current.left);
            System.out.println("term: " + current.term + " ");
            current.filesList.imprimefiles();
            inOrder(current.right);
        }
    }
}