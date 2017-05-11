package com.packt.webstore.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/sendEmail.do")
public class SendEmailAttachController {

	@Autowired
	private JavaMailSender mailSender;
	private final Log logger = LogFactory.getLog(getClass().getSimpleName());

	@RequestMapping(method = RequestMethod.POST)
	public String sendEmail(HttpServletRequest request,
			final @RequestParam CommonsMultipartFile attachFile) {

		// reads form input

		try {

			final String title = request.getParameter("title");
			logger.info("title received");
			final String comment = request.getParameter("comment");
			logger.info("comment received");

			Properties props = new Properties();

			props.load(new FileInputStream(
					"/home/myportaladmin/properties/data.properties"));
			logger.info("properties file loaded");

			final String email = props.get("email").toString();
			logger.info("email loaded");
			// System.out.println(email.toString());

			// for logging
			// System.out.println("emailTo: " + title);
			// System.out.println("subject: " + comment);
			// System.out.println("message: " + message);
			// String attachName = attachFile.getOriginalFilename();
			// System.out.println("attachFile: "+attachName);

			mailSender.send(new MimeMessagePreparator() {

				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					MimeMessageHelper messageHelper = new MimeMessageHelper(
							mimeMessage, true, "UTF-8");
					messageHelper.setFrom("feedback@listertechnologies.com");
					messageHelper.setTo(email);
					logger.info("To email set");
					messageHelper.setSubject(title);
					logger.info("subject set");
					messageHelper.setText(comment);
					logger.info("comment set");
					// determines if there is an upload file, attach it to the
					// e-mail
					String attachName = attachFile.getOriginalFilename();
					if (!attachFile.equals("")) {

						messageHelper.addAttachment(attachName,
								new InputStreamSource() {

									@Override
									public InputStream getInputStream() {
										try {
											logger.info("file attachment set");
											return attachFile.getInputStream();
										} catch (IOException e) {
											logger.error("file not attached properly "
													+ e.getMessage());
											// e.printStackTrace();
										}
										return null;
									}
								});
					}

				}

			});

			logger.info("mail sent successfully");
			return "thanku";

		} catch (FileNotFoundException e1) {
			logger.error("properties file not found " + e1.getMessage());
			// e1.printStackTrace();
		} catch (IOException e1) {
			logger.error("properties file error " + e1.getMessage());
			// e1.printStackTrace();
		} catch (Exception e1) {
			logger.error("unknown error " + e1.getMessage());
			// e1.printStackTrace();
		}
		return "error";

	}
}