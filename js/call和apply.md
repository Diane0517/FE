call和apply的区别

举个通俗的例子，知乎看到的。猫吃鱼，狗吃肉，奥特曼打小怪兽。有一天，狗想吃鱼了，猫想打小怪兽了，肿么办呢？？？call和apply就派上用场了。

    猫.吃鱼.call(狗，鱼)   小怪兽.打怪.call(猫，小怪兽)
    猫.吃鱼.apply(狗，[鱼])   小怪兽.打怪.apply(猫，[小怪兽])
    function cat(){}
    cat.prototype = function(){
      food:"fish";
      say:function(){
        console.log('I love'+food)
      }
    }
    var miao = new cat
    miao.say()// I love fish
    
    这时有狗狗出现
    
    
    var dog = {
      food:"bone"
    }
    
    
   狗没有say这个方法，此时可调用猫的方法
   
   
   
   miao.say.call(dog)  //I love bone
   
   
   
   由此看出，此处call和apply是用来动态的改变this的指向(把obj（this）绑定到thisobj上，此时thisobj具备了obj的属性和方法，也可以说是thisobj继承了obj的属性和方法)，当一个对象想调用一个自己没有，而其他对象拥有的方法时，我们可以借助call和apply来达到目的，也就相当于实现继承。
   二者的区别在于第二个参数的不同，
   
   obj.call(thisObj,arg1,arg2,...)
   obj.apply(thisObj,[arg1,arg2,...])
   
   例如通过document.getElementByTagName(),获取到的dom节点是类似于array的array，但是不可以使用array的push，pop方法。
   
   var tags = Array.prototype.slice.call(document.getElementByTagName('div'))个
 
   这样tags就可以用array 的所有方法了。
   
   备注：如果call或者apply的第一个参数为null时，this指向window。
