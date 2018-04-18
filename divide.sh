经常遇到很大的文件，用一些标记去做分割．但是查找起来依然很困难．这样，可以用bash脚本，将庞大的文件，分割成具体的详细的小的单元，
那么怎样来写这样的一个bash脚本呢，举个例子：

//----base.proto
 message SimpleAttribute {
   optional string attributeKey = 1;
   optional string attributeValue = 2;
 }

 message SimpleMetadata {
   repeated SimpleAttribute simpleAttribute = 1;
 }

 //----billing.proto
 message PaymentWarning {
   enum Type {
     DOMAIN_ADMIN = 1;
     DOMAIN_NOT_ADMIN = 2;
     CONSUMER = 3;
   }
   optional Type type = 1;
 }
 .
 .
 .
 有这样的一个文件，需要按照//----billing.proto，这些标记来进行分割．分割成指定的文件．bash脚本如下：
 
 ＃!/bin/bash
 sourceFile=doclist.proto //这里是需要进行分割的源文件
 startLine=(`sed -n '/----/='` $sourceFile)
 endLine=(`echo ${startLine[*]} | awk -v a=$fileEnd '{for(i=2;i<=NF;i++) printf("%d ",$i-1);print a}'`) //why????
 fileEnd=sed -n '$=' $sourceFile
 let maxIndex=${#startLine[@]}-1 //to find out the length of cutoffline
 for n in `seq 0 $maxIndex` 
 do
    keyWords=(`sed -n "${startLine[$n]},${startLine[$n]} p" $sourceFile`)  //get cutoff line words
    fileName=${keyWords:6}  //get keywords for new fileNames
    echo $startLine | sed -n "${startLine[$n]},${endLine[$n]} p" $sourceFile > ./doclist/${fileName} //you can set files position,and filenames
 done
 
 
 
 
