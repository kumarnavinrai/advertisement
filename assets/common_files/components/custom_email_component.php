<?php
class CustomEmailComponent extends Admin_Controller{
	public function __construct(){
	
	}
	
	function sendMail($templateSlug, $keywordsValues, $options) {

		$emailContent = self::getSubstitutedTemplate($templateSlug, $keywordsValues);
		
		if($emailContent){ 
			if($options['to']){
			    $to=$options['to'];
				$from = $options['from'];
				$subject = $emailContent['subject'];
				$mailcontent =  $emailContent['body'];
				$headers = "From: Navin <".$from.">\r\nReply-To: Navin <".$from.">\nX-Mailer: PHP\r\nReturn-Path: BangForBuck <".$from.">\r\n";
				$limite = "_parties_".md5 (uniqid (rand()));
				$headers .= "Date: ".date("l j F Y, G:i")."\r\n";
				$headers .= "MIME-Version: 1.0\r\n";
				$headers .= "Content-Type: text/html; charset=iso-8859-1\r\n";
				$headers .= "Content-Transfer-Encoding: 8bit\r\n"; 
				$headers .= "X-Priority: 3\r\n";
				$headers .= "X-Mailer: PHP". phpversion() ."\r\n";
				$headers .= " boundary=\"----=$limite\"\r\n";
				mail($to,$subject,$mailcontent,$headers);
				/*self::sendSesMail(
					$options['to'], 
					array(
						'subject'=>$emailContent['subject']
					), 
					$emailContent['body']
				);*/
				
			}
		}
	}
	
	function getSubstitutedTemplate($templateSlug, $keywordsValues) {
		//email template
		if(!class_exists('Email_templates_m')){
			$filepath = APPPATH."modules/templates/models/email_templates_m.php";
			$this->load->file($filepath);
		}
		$this->email_templates_m = new Email_templates_m();
		
		$emailTemplate = $this->email_templates_m->get_templates($templateSlug);
				
		if($emailTemplate){ 
			$emailTemplate = $emailTemplate['en'];
			$body = $emailTemplate->body;
			$subject = $emailTemplate->subject; 
			$body = str_replace(array_keys($keywordsValues), array_values($keywordsValues), $body);
			$subject = str_replace(array_keys($keywordsValues), array_values($keywordsValues), $subject);
			$return = array('body'=>$body, 'subject'=>$subject);			
		}

		return isset($return) ? $return : array();
	}
	
}
?>