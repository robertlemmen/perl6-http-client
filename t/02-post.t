use v6;
use HTTP::Client;
use Test;

plan 5;

my $http = HTTP::Client.new;
#my $res = $htto.get('http://huri.net/test.txt');
my $req = $http.post;
#$req.url('http://127.0.0.1:8080/test.txt');
$req.url('http://http.perl6.org');
$req.add-field(:query<libwww-perl>, :mode<dist>);
my $res = $req.run;
#$*ERR.say: "~Status: "~$res.status;
#$*ERR.say: "~Message: "~$res.message;
#$*ERR.say: "~Proto: "~$res.protocol;
ok $res, "Constructed result object from direct get() call.";
ok $res.success, "Result was successful.";
my $content = $res.content;
#$*ERR.say: "~Content: $content";
#$*ERR.say: "~Headers: "~$res.headers.perl;
ok $content, "Content was returned.";
ok $content ~~ /Perl/, "Content was correct.";
ok $res.header('Content-Type') ~~ /^text\/html/, "Correct content type.";

