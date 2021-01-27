str2ascii(s)=Vec(Vecsmall(s));
ascii2str(v)=Strchr(v);
encode(s) = {
  [ if(c==32,0,c-96) | c <- str2ascii(s), c==32 || 97<=c && c<= 122 ];
}
decode(v) = {
  ascii2str([ if(c==0,32,c+96) | c <- v]);
}

dechiffre(v,k) = {
	for(i=1, #v, v[i]= (v[i]-k[ (i-1) %#k + 1 ] % 27)%27);
	v;
}

text=readstr("input.txt")[1];
k=encode("haricot");
text= encode(text);
clair= dechiffre(text,k);
clair= decode( clair );

\\ resoudre l'exercice, bien mettre des ; a la fin des lignes

\\ a la fin, faire simplement
print(clair);
