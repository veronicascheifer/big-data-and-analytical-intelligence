import java.io.*;
import java.util.*;

public class ArvoreBinariaBusca
{
    private NoArvore root;

    public ArvoreBinariaBusca()
    {
        root = null;
    }

    public void inserir(String termo, String arquivo)
    {
        NoArvore novo = buscar(termo);

        if (novo == null)
        {
            novo = new NoArvore(termo);
            ListaEncadeada lista = novo.listaArquivos;
            lista.insereOrdenado(arquivo, 1);
        }
        else
        {
            ListaEncadeada lista = novo.listaArquivos;
            Node node = lista.buscar(arquivo);

            if (node != null)
            {
                node.frequencia++;
            }
            else
            {
                lista.insereOrdenado(arquivo, 1);
            }

            return;
        }

        if (root == null)
        {
            root = novo;
        }
        else
        {
            NoArvore atual = root;
            NoArvore anterior;

            while (true)
            {
                anterior = atual;

                if (termo.compareTo(atual.termo) < 0)
                {
                    atual = atual.esq;

                    if (atual == null)
                    {
                        anterior.esq = novo;
                        return;
                    }
                }
                else
                {
                    atual = atual.dir;

                    if (atual == null)
                    {
                        anterior.dir = novo;
                        return;
                    }
                }
            }
        }
    }

    public NoArvore buscar(String termo)
    {

        if (root == null)
        {
            return null;
        }

        NoArvore atual = root;

        while (!atual.termo.equals(termo))
        {
            if (termo.compareTo(atual.termo) < 0)
            {
                atual = atual.esq;
            }
            else
            {
                atual = atual.dir;
            }

            if (atual == null)
            {
                return null;
            }           
        }

        return atual;
    }

    public void inOrder()
    {
        inOrder(root);
    }

    public void inOrder(NoArvore atual)
    {
        if (atual != null)
        {
            inOrder(atual.esq);
            System.out.println("Termo: " + atual.termo + " ");
            atual.listaArquivos.imprimeArquivos();
            inOrder(atual.dir);
        }
    }
}