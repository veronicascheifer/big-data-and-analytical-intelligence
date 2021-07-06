import java.util.ArrayList;
import java.util.Scanner;

public class Buscador {
   private ArvoreBinariaBusca _arvoreBinariaBusca; 
   public ListaArquivos _listaArquivos;

    public Buscador() {
        _arvoreBinariaBusca = new ArvoreBinariaBusca();
        _listaArquivos = new ListaArquivos();
    }

    public void buscaTermos(ArrayList<String> termos, ListaArquivos listaArquivos, ArvoreBinariaBusca arvoreBinariaBusca){

        for (int i = 0; i < termos.size(); i++)
        {
            NoArvore noAtual = arvoreBinariaBusca.buscar(termos.get(i));    
            System.out.println("Termo Pesquisado: " + noAtual.termo);
            noAtual.listaArquivos.imprimeArquivos();
        }
    }
}
