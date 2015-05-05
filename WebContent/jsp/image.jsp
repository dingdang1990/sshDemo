<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>


<%@ page contentType="image/jpeg"
	import="java.awt.*, 
java.awt.image.*,java.util.*,javax.imageio.*" pageEncoding="ISO-8859-1"%>
<%! 
//给定范围获取随意颜色
Color getRandColor(int fc,int bc) { 
	Random random = new Random(); 
	if(fc>255) fc=255; 
	if(bc>255) bc=255; 
	int r=fc+random.nextInt(bc-fc); 
	int g=fc+random.nextInt(bc-fc); 
	int b=fc+random.nextInt(bc-fc); 
	return new Color(r,g,b); 
} 
%>
<% 
//设置不缓存
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 

//创建图像
int width=60, height=20; 
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

//获取图像上下文
Graphics g = image.getGraphics(); 

Random random = new Random(); 
//背景色
g.setColor(getRandColor(200,250)); 
g.fillRect(0, 0, width, height); 
//字体
g.setFont(new Font("Times New Roman",Font.PLAIN,18)); 
//生成干扰线
g.setColor(getRandColor(160,200)); 
for (int i=0;i<155;i++) {
	int x = random.nextInt(width); 
	int y = random.nextInt(height); 
	int xl = random.nextInt(12); 
	int yl = random.nextInt(12); 
	g.drawLine(x,y,x+xl,y+yl); 
} 

//获取随机生成认证码
String sRand=""; 
for (int i=0;i<4;i++){ 
String rand=String.valueOf(random.nextInt(10)); 
sRand+=rand; 
//认证码再图像中现实
g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110))); 
g.drawString(rand,13*i+6,16); 
} 
// 将认证码存入SESSION 
session.setAttribute("rand",sRand); 
//图像生成
g.dispose(); 
//输出图像
ImageIO.write(image, "JPEG", response.getOutputStream()); 
out.clear();
out = pageContext.pushBody(); 
%>
