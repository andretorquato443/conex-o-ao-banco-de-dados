import java.sql.Connection;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        try {

            Connection conn = Conexoes.conectar();

            Scanner sc = new Scanner(System.in);

            int opcao;

            do {

                System.out.println();
                System.out.println("===== MENU =====");
                System.out.println("1 - Nome dos perfis do plano Família");
                System.out.println("2 - Filmes cuja media de avaliação individual é superior a média de avaliação de todos os filmes");
                System.out.println("3 - Perfis que assistiram ao mesmo episodio mais de uma vez da serie de escolha do usuário");
                System.out.println("4 - Nome dos filmes assistidos por perfil de escolha do usuario cuja média da nota é superior a 8");
                System.out.println("5 - Perfis que não avaliaram nenhuma série de comédia");
                System.out.println("6 - Quantidade de visualizações de filmes por gênero e plano");
                System.out.println("7 - Quantidade de filmes assistidos por perfil e plano");
                System.out.println("8 - Quantidade de episódios assistidos por série");
                System.out.println("9 - Perfis e seus assinantes que nunca assistiram a nenhum filme");
                System.out.println("10 -Duração média dos episódios assistidos por cada perfil");
                System.out.println("0 - Sair");

                System.out.print("\nEscolha: ");

                opcao = sc.nextInt();
                sc.nextLine();

                System.out.println();

                switch(opcao){

                    case 1:
                        Consultas.consulta1(conn);
                        break;

                    case 2:
                        Consultas.consulta2(conn);
                        break;

                    case 3:
                        Consultas.consulta3(conn);
                        break;

                    case 4:
                        Consultas.consulta4(conn);
                        break;

                    case 5:
                        Consultas.consulta5(conn);
                        break;

                    case 6:
                        Consultas.consulta6(conn);
                        break;

                    case 7:
                        Consultas.consulta7(conn);
                        break;

                    case 8:
                        Consultas.consulta8(conn);
                        break;

                    case 9:
                        Consultas.consulta9(conn);
                        break;

                    case 10:
                        Consultas.consulta10(conn);
                        break;

                    case 0:
                        System.out.println("Encerrando...");
                        break;

                    default:
                        System.out.println("Opção inválida.");

                }

            } while(opcao != 0);

            conn.close();
            sc.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}