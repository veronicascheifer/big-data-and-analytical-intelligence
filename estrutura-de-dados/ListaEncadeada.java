import java.io.*;
import java.util.*;

public class ListaEncadeada
{
    private int tamanho = 0;
	private Node primeiro = null;
	private Node ultimo = null;
	
	public int getTamanho()
	{
	    return tamanho;
	}
	
	public Node getPrimeiro()
	{
	    return primeiro;    
	}
	
	public Node getUltimo()
	{
	    return ultimo;
	}
	
	public void inserePrimeiro(String arquivo, int frequencia)
    {
        Node node = new Node(arquivo, frequencia);
        
        if (primeiro == null) 
        {
            primeiro = node;
            ultimo = node;
        }
        else
        {
            node.setProximo(primeiro);
            primeiro = node;
        }
        
        tamanho++;
    }
    
    public boolean vazia()
    {
        return (this.primeiro == null);
    }
    
    public Node insereDepois(Node node, String arquivo, int frequencia)
    {
        Node novo = new Node(arquivo, frequencia);
        novo.setProximo(node.getProximo());
        node.setProximo(novo);
        return novo;
    }
    
    public void insereUltimo(String arquivo, int frequencia)
    {
        Node node = new Node(arquivo, frequencia);
        
        if (primeiro == null) 
        {
            inserePrimeiro(arquivo, frequencia);
        }
        else
        {
            ultimo = insereDepois(ultimo, arquivo, frequencia);
        }
        
        tamanho++;
    }
    
    public void imprimeArquivos()
    {
        Node node = primeiro;
        
        while (node != null)
        {
            System.out.println("Arquivo: " + node.getDado() + " Frequencia: " + node.getFrequencia());
            node = node.getProximo();
        }
    }
    
    public void insereOrdenado(String arquivo, int elemento)
    {
        if (vazia())
        {
            inserePrimeiro(arquivo, elemento);
        }
        else if (elemento >= primeiro.getFrequencia())
        {
            inserePrimeiro(arquivo, elemento);
        }
        else if (elemento <= ultimo.getFrequencia())
        {
            insereUltimo(arquivo, elemento);
        }
        else
        {
            Node p = primeiro;
            Node ultimo = null;
            
            while (p.frequencia > elemento)
            {
                ultimo = p;
                p = p.getProximo();
            }
            
            insereDepois(ultimo, arquivo, elemento);
        }
    }
    
    
    public Node buscar(String arquivo)
    {
        Node node = primeiro;

        while (node != null)
        {
            if (node.dado.equals(arquivo))
            {
                return node;
            }

            node = node.getProximo();
        }

        return node;
    }
}
