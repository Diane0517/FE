数组去重

数组去重是js中很常见的算法，面试或者是工作中都常遇到问题。关于去重，常见的有以下方法（待补充完善）

（1）使用indexOf



    function unique(arr){
      var res = []
      for(var i = 0;i<arr.length;i++){
          if(res.indexOf(arr[i]) === -1){
              res.push(arr[i])
          }
      }
        return res
      }
   
   
 （2）使用对象的key值
    
    
    function unique(arr){
      var res = []
      var json = {}
      for(var i = 0 ; i<arr.length;i++){
        if(!json[arr[i]]){
          res.push(arr[i])
          json[arr[i]] = true
          }
       }
       return  res
   }
   
  (3)使用es6的方法
   
     function unique(arr){
        return Array.from(new Set(arr))
      }
        
