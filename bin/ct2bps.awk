#!/usr/bin/awk -f

BEGIN{OFS="\t"}
/dG/{
	split($8,a,"_")
	split(a[8],b,"-")
	bit1_st=a[7]
	bit1_en=b[1]
	bit2_st=a[14]
	bit2_en=a[15]
	bit1_len=bit1_en-bit1_st+1
#	print "#",bit1_st,bit1_en,bit2_st,bit2_en,bit1_len
}

!/dG/ && $5{
	if($1<=bit1_len){
		st=bit1_st+$1-1
		en=bit2_st+$5-bit1_len-1
		print st, en
	}
}
