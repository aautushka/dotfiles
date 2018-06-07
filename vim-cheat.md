# vim

## movement
**h j k l** left, down, up, right  
**w b** next word, previous word  
**W B** next WORD, previous WORD  
**e E** end of current word, WORD  
**ge gE** end of previous word, WORD  
**0 ^ $** start of line, first non blanked character of the line, end of line  
**gg G** start of file, end of file  
**5G** goto to 5th line  
**^o** jump back  
**^i** jump forward  
**H L** screen start, screen end  
**'m \`m** jump to mark  
**''** jump to last jump
**'\[** jump to first char of just changed text  
**^m** goto middle screen  
**| 3|** move column 0, move column 3  
**gD** got to the very first occurence of the word under cursor   
**\[\[ \]\]** move to beginning of this function {, next function {   
**gd** go to first local occurence of the word under cursor   
**gf** open file under cursor  
**g\[** go to tag  

## modes
**i** insert mode (i a s)  
**v** visual mode (v V ^v)  
**n** normal mode  
**c** command mode  
__<ESC\> ^c ^\[__ exit insert mode  

## scrolling
**zz** center screen  
**zt** align top of screen with cursor  
**zb** align bottom of screen with cursor  
**^u ^d** half page up, half page down  
**^b ^f** page up, page down  
**^e ^y** line up, line down  

## searching
**f F** find after cursor, find before cursor  
**t T** find after cursor, find before cursor   
**; ,** next match, previous match  
__g\*__ seach the word under cursor  
__g\#__ seach the previous word under cursor 
__#\*__ find previous word under cursor, find next word under cursor  
**%** jump to matching brace 


## inserting
**i I** insert at current position, insert at the beginning of current line  
**a A** append after current position, append after end of line  
**o O** edit new line below current, above current  
**s S** substitute character under cursor, substitute line  
**cw cc C** change current word, change line, change line  

## insert mode
**^b** delete char before cursor  
**^w** delete word before cursor  
**^u** delete line before cursor  
**^t** indent (insert a tab at the start of the line)  
**^d** un-indent  
**^y** duplicate the character in the same column on the preceding line  
**^e** duplicate the character in the same column on the followint line  
**^a** insert again whatever the most-recent inserted text was  
**^r** insert the contents of a register  
**^r=** evaluate expression and insert the result  
**^v** insert the next character verbatim (event if it's a control char)  
**^o** take back to Normal mode for one command (e.g. delete the rest of the line ^oD)  


## editing
**r R** replace single character, replace characters  
**J** join line below to the current line  
**x X** delete character under cursor, delete preceding character  
**xp** transpose two letters  
**u ^R** undo, redo  
**.** repeat last action  
**dw daw dW** delete word, delete around word, delete WORD  
**yw yaw yW** yank word, yank around word, yank WORD  
**p P** put at cursor, put before cursor  
**~** toggle case  
**yy dd** yank line, delete link  
**2yy 2dd** yank 2 lines, delete 2 lines  
**gu gU** make lower-case, make upper-case  
**guu gUU** make line lower-case, upper-case  
**^a ^x** increment number, decrement number  

## formatting
**> <** shift right, shift left  
**>G** shift right to the end of file 
**=** indent  
**==** auto indent  

## visual mode
**v V ^v** select characters, select lines, select columns  
**vi{ vi[ vi(** select inside curlies, square brackets, braces  
**va{ va[ va(** select around curlies, square brackets, braces  
**vib viB** select inside braces, brackets (curlies)  
**o O** move to other end of marked area, move to other corner  
**gv** last selection  


## tabs
**:tabe** new tab  
**:tabnext** next tab  
**:tabprev** previous tab  
**gt gT** next tab, prev tab  

## splits
**^ws** split horizontally  
**^wv** split vertically  
**^ww** move between splits  
**^wq** close split  

## marks
**m[a-z]** set mark  
**m[A-Z]** set global mark  
**'[a-zA-Z] \`[a-zA-Z]** go to mark  
**\`\`** go to prev mark  

## files
**ZZ** write and exit  
**ZQ** discard and exit  

## motions
**dl** delete character  
**dw** delete word  
**ds** delete sentence  
**dp** delete paragraph  
**dW** delete WORD  
**daw** delete around word  
**diw** delete inside word   
**dis** delete inside sentence  
**das** delete around sentence  
**dip** delete inside paragraph  
**dap** delete around paragraph  
**diW** delete indside WORD  
**daW** delete around WORD  
**di( da( di) da)** delete inside braces, around braces  
**di< da< di> da>** delete inside brackets, around brackets  
**di{ da{ di} da}** delete inside brackets, around brackets  
**di[ da[ di] da]** delete inside brackets, around brackets  
**di" da"** delete inside double quotes, around double quotes  
**di' da'** delete inside quotes, around quotes  

## operators 
**y** yank  
**c** change  
**d** delete  

## folds
**zo** open a fold under cursor  
**zO** open all folds under cursor  
**zc** close a fold under cursor  
**zm** increase foldlevel by one  
**zM** close all open folds  
**zr** decrese foldevele by one  
**zR** sets foldlevel to zero, all folds will be open  

## tags 
**^]** go to definition  
**^t** go back  

## help
**: vimtutor**  

## links
https://rumorscity.com/wp-content/uploads/2014/08/10-Best-VIM-Cheat-Sheet-01.jpg  
https://rumorscity.com/wp-content/uploads/2014/08/10-Best-VIM-Cheat-Sheet-02.jpg  
https://rumorscity.com/wp-content/uploads/2014/08/10-Best-VIM-Cheat-Sheet-05.jpg  

