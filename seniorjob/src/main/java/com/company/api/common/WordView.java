package com.company.api.common;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.docx4j.XmlUtils;
import org.docx4j.openpackaging.io3.Save;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;
import org.docx4j.wml.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractTemplateView;

@Component("wordView")
public class WordView extends AbstractTemplateView{
	private static final Logger LOGGER = LoggerFactory.getLogger(WordView.class);

	public void DocxView() {
		setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
	}

	@Override
	protected void renderMergedTemplateModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.load(getApplicationContext().getResource(getUrl()).getFile());  //OpenXML 형식 의 docx 파일 을 나타내는 WordprocessingMLPackage

		MainDocumentPart documentPart = wordMLPackage.getMainDocumentPart();  //MainDocumentPart 클래스는 기본 document.xml 부분 의 표현을 보유합니다 


		org.docx4j.wml.Document wmlDocumentEl = documentPart.getContents();
		String xml = XmlUtils.marshaltoString(wmlDocumentEl);


		HashMap<String, String> mappings = new HashMap<String, String>();
		for (Object key : model.keySet()) {
			mappings.put(key.toString(), model.get(key).toString());
		}

		Object obj = XmlUtils.unmarshallFromTemplate(xml, mappings);
		documentPart.setJaxbElement((Document) obj);

		String name = "사업계획서_"+System.currentTimeMillis()+".docx";

		response.setHeader("Content-Disposition", "attachment; filename=\""+ name+"\"");
		
		ServletOutputStream out = response.getOutputStream();

		Save saver = new Save(wordMLPackage);
		saver.save(out);


		out.flush();
		
		LOGGER.debug("### buildExcelDocument Map : {} end!!");

	}

	
	 @Override
	public boolean checkResource(Locale locale) { return
	 getApplicationContext().getResource(getUrl()).exists(); }
	 
	 @Override
	protected boolean isUrlRequired() {
	        return false;
	}
	
	
}


	


