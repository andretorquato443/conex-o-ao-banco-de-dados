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
                System.out.println("1 - Perfis do plano Família");
                System.out.println("2 - Filmes acima da média");
                System.out.println("3 - Perfis que assistiram um episódio mais de uma vez");
                System.out.println("4 - Filmes vistos por um perfil com média > 8");
                System.out.println("5 - Perfis que não avaliaram séries de comédia");
                System.out.println("6 - Visualizações por gênero e plano");
                System.out.println("7 - Filmes assistidos por perfil");
                System.out.println("8 - Episódios assistidos por série");
                System.out.println("9 - Perfis que nunca assistiram filmes");
                System.out.println("10 - Duração média dos episódios");
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