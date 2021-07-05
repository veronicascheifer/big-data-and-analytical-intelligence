public class Main
{
	public static void main(String[] args) {
	    
		System.out.println("Lista Encadeada");
		
		ListaArquivos lista = new ListaArquivos();
		
		lista.insereOrdenado("arq1.txt", 1);
		lista.insereOrdenado("arq3.txt", 10);
		lista.insereOrdenado("arq2.txt", 5);
		lista.insereOrdenado("arq4.txt", 3);
		
		lista.imprimeArquivos();
		
        ArvoreBinariaBusca arvore = new ArvoreBinariaBusca();
        arvore.inserir("bola", "arq1.txt");
        arvore.inserir("casa", "arq1.txt");
        arvore.inserir("dado", "arq1.txt");
        arvore.inserir("bola", "arq1.txt");
        arvore.inserir("casa", "arq1.txt");
        arvore.inserir("dado", "arq2.txt");
        arvore.inserir("bola", "arq2.txt");
        arvore.inserir("arvore", "arq2.txt");
        arvore.inserir("arvore", "arq2.txt");
        arvore.inserir("arvore", "arq2.txt");
        arvore.inserir("arvore", "arq2.txt");
        arvore.inOrder();
	}
}
