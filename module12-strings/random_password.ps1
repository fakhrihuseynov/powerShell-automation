$alpha = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'
$num = 0..9
$char = '!,),@,(,/,*,$,&,^,%,[,],<,>'
$arr = @()
$arr += $alpha.Split(',') | Get-Random -count 12
$arr[0] = $arr[0].ToUpper()
$arr[-1] = $arr[-1].ToUpper()
$arr += $num | Get-Random -Count 3
$arr += $char.Split(',') | Get-Random -Count 5

($arr | Get-Random -Count $arr.count) -join ""
$arr.Count