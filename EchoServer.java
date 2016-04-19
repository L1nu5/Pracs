import java.io.*;
import java.net.*;

class EchoServer
{
	public static void main(String[] args) throws Exception
	{
		System.out.println("Server Starting...");
		ServerSocket ss = new ServerSocket(35000);

		while(true)
		{
			Socket accept = ss.accept();
			EchoHelper echo = new EchoHelper(accept);
			echo.start();
		}
	}
}

class EchoHelper extends Thread
{
	private sock;

	public EchoHelper(Socket sock)
	{
		this.sock = sock;
	}

	public void run()
	{
		try
		{
			PrintWriter pw = new PrintWriter(new BufferedWriter (new OutputStreamWriter(sock.getOutputStream())),true);
			BufferedReader bin = new BufferedReader(bew InputStreamReader(sock.getInputStream()));

			String str;

			str = bin.readLine();
			while(!str.equals("END"))
			{
				System.out.println("Server received: "+str+" from Client "+Thread.currentThread().getName() + " " + sock.getRemoteSocketAddress());
				pw.writeLine("From Echo Server: "+str);
				str = bin.readLine();
			}	
		}catch(Exception ex)
		{

		}
		finally{
			try{
				sock.close();
			}catch(Exception e1)
			{
				System.out.println("Error2 Occured");
			}
		}
	}
}
