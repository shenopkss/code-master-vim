function! CodeMasterRender()
python << EOF
print 'CodeMasterRender Begin'
import vim
import subprocess  

temp = ''
for b in  vim.current.buffer:
    temp += b + "\n"

#print temp
proc = subprocess.Popen(['code-master "' + temp + '"'], shell = True, stdout = subprocess.PIPE);
response = proc.stdout.read();
#print response
vim.command(":vnew")
l = 0
for r in response.split('\n'):
    vim.current.buffer.append(r, l)
    l += 1
#print vim.current.buffer.append(response, 1)

EOF
endfunction

noremap <Leader>cr :call CodeMasterRender()<CR>

