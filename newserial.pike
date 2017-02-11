#!/usr/bin/env pike

//Find the serial number in a file
//Returns ({line number, serial number}) as integers.
//If none found, returns -1 for each.
array(int) find_serial(array(string) lines)
{
	foreach (lines; int i; string line)
	{
		if (sscanf(line, "%[ \t]%[0-9]%[ \t]; %s",
			string indent, string value, string gap, string tag
		) && tag == "Serial")
		{
			return ({i, (int)value});
		}
	}
	return ({-1, -1});
}

int main(int argc, array(string) argv)
{
	if (argc == 1)
	{
		Process.create_process(({"git", "config", "filter.dnsserial.clean", "cat"}))->wait();
		Process.create_process(({"git", "config", "filter.dnsserial.smudge", argv[0] + " %f"}))->wait();
		write("Installed.\n");
		return 0;
	}
	werror("Processing %s\n", argv[1]);
	//The file might not exist; if so, it won't have a serial.
	array(string) cur = (Stdio.read_file(argv[1]) || "") / "\n";
	//The new contents will always exist, and should always have a serial.
	array(string) new = Stdio.stdin.read() / "\n";
	[int line, int serial] = find_serial(new);
	werror("Serial in checkout: %d\n", serial);
	write(new * "\n");
}
