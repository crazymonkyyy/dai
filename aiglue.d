string rules=". Please put code in \"'''\" blocks, prefer all lowercase names, use T to denote anonymous types, avoid comments, and keep line count of functions to 5";
string chatbot(string s){
	import std.process;
	string out_;
	int i;
	while (true){
		auto foo=("gpto -m text-davinci-003 --prompt "~s~rules).executeShell;
		if(foo.status==0){
			out_=foo.output;
			break;
		}
		assert(i++<5,"system broke:"~foo.output);
	}
	return out_;
}
unittest{
	import std;
	"write `remap(T)(T a,T b,float t) and lerp in dlang".chatbot.writeln;
}