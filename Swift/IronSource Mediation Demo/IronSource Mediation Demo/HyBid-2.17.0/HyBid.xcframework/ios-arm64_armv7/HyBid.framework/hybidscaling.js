var elementToScaleFound=!1,elementToScale=null;const creativeResize=function(e,t,l){let n=l,i=t,o=e;n.offsetHeight>1&&n.offsetWidth>1&&(i=n.offsetHeight,o=n.offsetWidth);let f=o,a=i;if(i<t||o<e){let c=1,d=1;if(e/t>o/i?(f=o*(c=t/i),a=t):(c=e/o,d=t/i,f=e,a=i*c),a<t){let m=(t-i)/2+"px";n.style.transform+="translate(0px,"+m+")"}n.style.transform+="scale("+c+","+d+")"}},findElementBySize=function(e,t,l){if(e.offsetHeight===l&&e.offsetWidth===t&&(elementToScale=e,elementToScaleFound=!0),0!==e.children.length)for(var n=0;n<e.children.length&&!elementToScaleFound;n++)findElementBySize(e.children[n],t,l)},updateCreativeSize=function(e,t){elementToScale=null,elementToScaleFound=!1;findElementBySize(document.getElementById("hybid-ad"),320,480),elementToScaleFound&&null!=elementToScale&&creativeResize(e,t,elementToScale)};