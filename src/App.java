import java.io.*;
//import java_cup.runtime.Symbol;
import java.util.Scanner;

public class App {

    public static void main(String[] args) {
        try {

            Runtime r = Runtime.getRuntime();
            Process p;

            p = r.exec(new String[] { "java", "-jar", "java-cup-11b-runtime.jar", "-parser", "Parser", "-symbols",
                    "Tokens", "parser.cup" });
            System.out.println(p.waitFor());

            p = r.exec(new String[] { "java", "-jar", "jflex-full-1.8.2.jar", "scanner.flex" }, null,
                    new File("src\\"));
            System.out.println(p.waitFor());

            /*
             * System.out.println("Análise Léxica: Lista de Tokens:");
             * Scanner scanner = new Scanner(new FileReader("Entradas.txt"));
             * Symbol s = scanner.next_token();
             * while(s.sym != Tokens.EOF){
             * System.out.printf("<%d, %s>\n", s.sym, s.value);
             * s = scanner.next_token();
             * }
             * Scanner scanner = new Scanner(new FileReader("Entradas.txt"));
             * Parser parser = new Parser(scanner);
             * parser.parse();
             */
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}