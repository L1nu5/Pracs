import java.io.*;
import java.net.*;
import java.util.*;

public class EchoClient 
{
	public static void main(String[] args) throws Exception
	{
		Socket sock = new Socket("127.0.0.1",35000);

		BufferedReader bin = new BufferedReader(new InputStreamReader(sock.getInputStream()));
		PrintWriter pw = new PrintWriter(new BufferedWriter(new OutputStreamWriter(sock.getOutputStream())),true);

		Scanner sc = new Scanner(System.in);
		boolean signal = true;
		String str1,str2;

		while(signal)
		{
			System.out.println("Enter message for server: ");
			str1 = sc.nextLine();

			pw.println(str);
			str2 = bin.readLine();
			System.out.println(str2);

			if(str1.trim().equals("END"))
				signal = false;	
		}
	}
}
