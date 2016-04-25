use inc::Module::Install 0.95;

# We ARE a Win32-only module.
die "OS unsupported\n" unless win32;

# Create README file.
if (author_context) {
	print "Creating README file\n";
	require Pod::Readme;
	my $readme = Pod::Readme->new();
	$readme->parse_from_file('lib/App/local/lib/Win32Helper.pm', 'README');
}

# Since local::lib is not supporting lower than 5.8.1, I won't, either.
perl_version   '5.008001'; 
license        'perl';
all_from       'lib/App/local/lib/Win32Helper.pm';
requires       'local::lib'            => 1.004007;
requires       'IO::Interactive'       => 0.000005;
requires       'File::HomeDir'         => 0.81;
requires       'File::Spec::Functions' => 3.2701;
requires       'Win32::TieRegistry'    => 0.26;
test_requires  'Test::More'            => 0.42;
test_requires  'Test::Script'          => 1.07;
install_script 'llw32helper.pl';
use_ptar;

WriteAll;
