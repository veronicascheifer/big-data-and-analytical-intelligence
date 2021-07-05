public class NoArvore
{
    public long item;

    public String termo;
    public ListaEncadeada listaArquivos;
    public NoArvore dir;
    public NoArvore esq;

    public NoArvore()
    {
        this.termo = "";
        listaArquivos = new ListaEncadeada();
        dir = null;
        esq = null;
    }

    public NoArvore(String termo)
    {
        this.termo = termo;
        listaArquivos = new ListaEncadeada();
        dir = null;
        esq = null;
    }
}