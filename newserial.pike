#!/usr/bin/env pike

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
	array(string) new = Stdio.stdin.read() / "\n";
	string indent, serial, gap, tag; int serial_line;
	foreach (new; serial_line; string line)
	{
		if (sscanf(line, "%[ \t]%[0-9]%[ \t]; %s", indent, serial, gap, tag)
			&& tag == "Serial")
			break;
	}
	if (tag != "Serial")
	{
		write(new * "\n");
		exit(0, "No serial found in file\n");
	}
	werror("Serial in checkout: %s\n", serial);
	mapping tm = gmtime(time());
	int wantserial =
		(1900 + tm->year) * 1000000 +
		(1 + tm->mon) * 10000 +
		tm->mday * 100 + 1;
	werror("Want serial: %d\n", wantserial);
	string configtag = "rosuav.newserial." + argv[1];
	int lastserial = (int)Process.run(({"git", "config", configtag}))->stdout;
	werror("Last serial: %d\n", lastserial);
	//If we've already created a serial number today, advance this one
	//to the next available. (If that pushes us past 99, that's fine; we
	//just start using up tomorrow's numbers. Not that that's all that
	//likely anyway.)
	if (lastserial >= wantserial) wantserial = lastserial + 1;
	//Reconstruct the line from the original parts, but with a new serial.
	new[serial_line] = sprintf("%s%d%s; %s", indent, wantserial, gap, tag);
	Process.create_process(({"git", "config", configtag, (string)wantserial}))->wait();
	write(new * "\n");
}
