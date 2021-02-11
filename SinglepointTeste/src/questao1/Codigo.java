package questao1;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class Codigo {

	public static void main(String[] args) {
		System.out.println("====================Gerador de Códigos====================");
		System.out.print("Informe a quantidade de digitos do código: ");
		try (Scanner sc = new Scanner(System.in)) {
			int quantidadeDigitos = sc.nextInt();
			if (quantidadeDigitos < 5 || quantidadeDigitos > 7) {
				throw new InputMismatchException();
			} else {
				System.out.print("Código Gerado: ");
				GerarCodigo(quantidadeDigitos).stream().forEach(e -> System.out.print(e));
			}

		} catch (InputMismatchException e) {
			System.out.println("Erro! Informe apenas números inteiros entre 5 e 7.");
		}
	}

	public static List<Integer> GerarCodigo(int quantidadeDigitos) {
		Random gerador = new Random();
		List<Integer> codigo = new ArrayList<Integer>();
		for (int i = 0, numero; i < quantidadeDigitos; i++) {
			do {
				numero = gerador.nextInt(9);
			} while (codigo.contains(numero));
			codigo.add(numero);
		}
		return codigo;
	}
}
