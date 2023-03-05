import java.io.*;
import java.util.*;

public class filesList
{
    private int size = 0;
	private listNode first = null;
	private listNode last = null;
	
	public int getSize()
	{
	    return size;
	}
	
	public listNode getFirst()
	{
	    return first;    
	}
	
	public listNode getLast()
	{
	    return last;
	}
	
	public void insereFirst(String file, int frequency)
    {
        listNode node = new listNode(file, frequency);
        
        if (first == null) 
        {
            first = node;
            last = node;
        }
        else
        {
            node.setNext(first);
            first = node;
        }
        
        size++;
    }
    
    public boolean empty()
    {
        return (this.first == null);
    }
    
    public listNode insertAfter(listNode node, String file, int frequency)
    {
        listNode New = new listNode(file, frequency);
        New.setNext(node.getNext());
        node.setNext(New);
        return New;
    }
    
    public void inserelast(String file, int frequency)
    {
        listNode node = new listNode(file, frequency);
        
        if (first == null) 
        {
            insertFirst(file, frequency);
        }
        else
        {
            last = insertAfter(last, file, frequency);
        }
        
        size++;
    }
    
    public void printFiles()
    {
        listNode node = first;
        
        while (node != null)
        {
            System.out.println("file: " + node.getData() + " frequency: " + node.getFrequency());
            node = node.getNext();
        }
    }
    
    public void insertSorted(String file, int element)
    {
        if (empty())
        {
            insertFirst(file, element);
        }
        else if (element >= first.getFrequency())
        {
            insertFirst(file, element);
        }
        else if (element <= last.getFrequency())
        {
            insertLast(file, element);
        }
        else
        {
            listNode p = first;
            listNode last = null;
            
            while (p.frequency > element)
            {
                last = p;
                p = p.getNext();
            }
            
            insertAfter(last, file, element);
        }
    }
    
    
    public listNode search(String file)
    {
        listNode node = first;

        while (node != null)
        {
            if (node.data.equals(file))
            {
                return node;
            }

            node = node.getNext();
        }

        return node;
    }
}
