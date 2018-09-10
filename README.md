i# Twig renderer

Simple script that can be used to render twig templates.
No passing variables, they myst be set in templates.


example usage:

    docker run --rm -v /tmp:/data kolemp/twig-renderer /data/tpl.twiga > /tmp/outfile.txt
    
You can also use environment variables and replace them with calls like this `{{env('FOO')}}`.

    docker run --rm -e "FOO=bar" -v /tmp:/data kolemp/twig-renderer /data/tpl.twiga > /tmp/outfile.txt
