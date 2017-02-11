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
	string indent, serial, gap, tag;
	foreach (new; int i; string line)
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
	write(new * "\n");
}
