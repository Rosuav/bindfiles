#!/usr/bin/env pike

int main(int argc, array(string) argv)
{
	if (argc == 1)
	{
		Process.create_process(({"git", "config", "filter.dnsserial.clean", argv[0] + " --clean %f"}))->wait();
		Process.create_process(({"git", "config", "filter.dnsserial.smudge", argv[0] + " %f"}))->wait();
		write("Installed.\n");
		return 0;
	}
	int clean = (argv[1] == "--clean");
	if (clean) argv = argv[1..];
	//werror("Processing %s\n", argv[1]);
	array(string) new = Stdio.stdin.read() / "\n";
	string indent, gap, tag; int serial_line;
	foreach (new; serial_line; string line)
	{
		if (sscanf(line, "%[ \t]%*[0-9]%[ \t]; %s", indent, gap, tag)
			&& tag == "Serial")
			break;
	}
	if (tag != "Serial")
	{
		//No serial found. Emit the file unchanged.
		write(new * "\n");
		return 0;
	}
	if (clean)
	{
		//Clean the file by storing a serial of all zeroes.
		new[serial_line] = sprintf("%s0000000000%s; %s", indent, gap, tag);
		write(new * "\n");
		return 0;
	}
	//Actually create a new serial number.
	mapping tm = gmtime(time());
	string configtag = "rosuav.newserial." + argv[1];
	int lastserial = (int)Process.run(({"git", "config", configtag}))->stdout;
	//werror("Last serial: %d\n", lastserial);
	//If we've already created a serial number today, advance this one
	//to the next available. (If that pushes us past 99, that's fine; we
	//just start using up tomorrow's numbers. Not that that's all that
	//likely anyway.)
	int newserial =
		(1900 + tm->year) * 1000000 +
		(1 + tm->mon) * 10000 +
		tm->mday * 100 + 1;
	if (newserial <= lastserial) newserial = lastserial + 1;
	//werror("New serial: %d\n", newserial);
	//Reconstruct the line from the original parts, but with a new serial.
	new[serial_line] = sprintf("%s%d%s; %s", indent, newserial, gap, tag);
	Process.create_process(({"git", "config", configtag, (string)newserial}))->wait();
	write(new * "\n");
}
