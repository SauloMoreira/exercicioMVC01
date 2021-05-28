package br.com.cotiinformatica.helpers;

public class DoubleHelper {

	public static String ReplaceVirgula(String a) {

		a.replaceAll(",", ".");
		return a;

	}

	public static Double ToDouble(String preco) {

		preco.replaceAll(",", ".");
		Double Npreco = Double.parseDouble(preco);
		return Npreco;

	}
}
