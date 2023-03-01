import java.io.*;
import java.util.*;

public class ListaArquivos
{
    private int tamanho = 0;
	private NoLista primeiro = null;
	private NoLista ultimo = null;
	
	public int getTamanho()
	{
	    return tamanho;
	}
	
	public NoLista getPrimeiro()
	{
	    return primeiro;    
	}
	
	public NoLista getUltimo()
	{
	    return ultimo;
	}
	
	public void inserePrimeiro(String arquivo, int frequencia)
    {
        NoLista node = new NoLista(arquivo, frequencia);
        
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
    
    public NoLista insereDepois(NoLista node, String arquivo, int frequencia)
    {
        NoLista novo = new NoLista(arquivo, frequencia);
        novo.setProximo(node.getProximo());
        node.setProximo(novo);
        return novo;
    }
    
    public void insereUltimo(String arquivo, int frequencia)
    {
        NoLista node = new NoLista(arquivo, frequencia);
        
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
        NoLista node = primeiro;
        
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
            NoLista p = primeiro;
            NoLista ultimo = null;
            
            while (p.frequencia > elemento)
            {
                ultimo = p;
                p = p.getProximo();
            }
            
            insereDepois(ultimo, arquivo, elemento);
        }
    }
    
    
    public NoLista buscar(String arquivo)
    {
        NoLista node = primeiro;

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
