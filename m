Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7A330D2A
	for <loongarch@lists.linux.dev>; Fri,  3 Apr 2026 06:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775197879; cv=none; b=kX289vYuB85S+ZgNsiMgAZRHWEUqHjbxo/YTFpytA/1zxmCfUBw555wTW5bVhFMb7XAyTBwsqHcnf3nkFrjgpixUIxk0mZGHBLiu4qJ+sGZmldyQhAX/oMySeq8CuaJM5v4tzTB883MZDsyUnosspo2dFdpFRBeFZdq/x+I3PWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775197879; c=relaxed/simple;
	bh=u6vJhMRukMYQuAFdtZphiPWA2L7LV4Z0duj1VTqx6uc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/OOaeWm2KgOYy7FT3ApODj0cDlthKN6MSfo8tbEnneE21dpDqMa+wXj8zsj8FDP1+7rf//jgLeDAy9IeU1qUlmP77wznz2DGGevT1MiHB8X6Fu5RuMh0xyGkpL6uZ98mCQBu/7IujKqz5vgwvd/g9cNJS1x4vX/fnztvGFrO/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=cKFZjGWT; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="cKFZjGWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1775197861;
	bh=7cYDA48xJh8paeNIt+lHccZEVM1lwmj1+slaoNvtG3I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=cKFZjGWTRM8l5AIOQxbJ+KHi1jIyj4YY5fjDo9s7G4jwY3nfqfH+RFCl1dT5rZhOd
	 o3TJB9U872a1VKedV/N5Zb8KOpn4hTaDpBZMzZgmX1gzgyrzNeEqCGKsLue3W+MnFs
	 CmfrmG5eBanmJ7k5yLwp1dFgk3W4BPlNP+4fj7Cg=
X-QQ-mid: zesmtpip2t1775197817t1eb7c37b
X-QQ-Originating-IP: XTgIyY/p7Zhx9sdgwi9YS0h7XLBELD4A3z5BLYHffGk=
Received: from yangyuqian ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Apr 2026 14:30:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4404439308809355893
EX-QQ-RecipientCnt: 8
From: Yuqian Yang <yangyuqian@uniontech.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Cheng Nie <niecheng1@uniontech.com>,
	Wentao Guan <guanwentao@uniontech.com>,
	Dandan Zhang <zhangdandan@uniontech.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuqian Yang <yangyuqian@uniontech.com>
Subject: [PATCH] loongarch: improve logging of disabling KASLR.
Date: Fri,  3 Apr 2026 14:30:08 +0800
Message-ID: <E4B91143DC525DC6+20260403063008.94237-1-yangyuqian@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MM51ngjmpkNsdMWVMMlgcLUcFX4G1b3SzsVX9BMjAYmmkstZqo39/7n9
	WB326+NfltofPuFsuyaZspgA0bS6Tx+pmvEnZWpQDB3GkZdVRoMtDFx40fZzezFHvlnk/ft
	dd3t4ourSN4ATvy/KFrgFJ2oP5XIXqM2MKt5f/uFk+746Wzzpp3EFuRriVRKe1BqQC3fYen
	SWSgKx1GHuA080IQseC8m5unuWiCSkJcW5F8MuvjRL6L9U4CQUQAIQ4o0PCAq9zqJ3cOSYi
	n0rbCy/SGyl9purB82MZvFYff0s5AM6gL62JE2Ql2WghPezAD8opVh8T4vOh5t4dNtisWQI
	kjhqoZGpcaMkUG19DQ5fMUhzmuhd7BO14q1CGHC9M5q+rUh1VoCklkXgyso+qRxVIludgpR
	gynMDaluUKxvlIhKUKA5eEPp1yBrm74K1PQxJPFtPn3VUI8eewDyWNOt63JLvYv265v5WnX
	rjsDSjyNWwA/sowVKdthAUNkvrqS7z4hRcc8JDHw2a0ZWn2/XIu93AEfEHvP+3SX2kGPHOk
	NJW6TS7ckdIjkvBE1jn+s36XzB+xfTYVSOZZzfiE7CJ0O3wSnFx8IOIj44GwwZQIckebyCn
	qGlCNOA3qQ5AhdE3jX8QMqN6sLEsqCdaILUV8hcz/ICnq9zUkm0P5JHNPGcLxYRB3+5sChv
	KVWxCbLtDQ4ZhtyvHI+Bh9FgbB8TgK/av41l+Pkomsf0dAx4g5f6BHxXzYTkN/kmArnIC47
	Tvx3zASydHaiPICb5Mp3AdeSXj3podZJQ7JfEfo5f6nfW2EwqwPoDo4AKKzwqPpdyPOGXIr
	ocpQ1+NSl6clY4AINLyyi8aMui8Ir2GoMGRs3YKzQoZh7lkjByMi1rt35LpcZCtD4SfIthb
	ifY9hCJuXV4xxSF4lCQQY+BhFMp+px3qXaBprGUKBHEFoYjU1majZWBMnvZsRoVSybDjrUu
	dVjxBUGZeNwobCYCa8etbnN8hy77IBq3ENkKBTQVHB8tqn0QI2hT/FitT2gktc4y9N3OQ2U
	ve+VJjcnH2Hrwi+SC9lXtUW+kRAij79tCDfzfE9x8ZwMtdB2ng+aYdsovdDXDyFVzOG688W
	oHR9p1Nq3gA2TCSLgh6gYH5LnTkldAQCQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Whether KASLR is disabled is not handled in nokaslr (early param
"nokaslr" setup function) but in kaslr_disabled. However, the logging
was done in nokaslr previously. So we move the logging to the right
place and add more specific info about why it's disabled.

Suggested-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuqian Yang <yangyuqian@uniontech.com>
---
 arch/loongarch/kernel/relocate.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 82aa3f0359278..be11096c3c009 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -128,9 +128,8 @@ static inline __init unsigned long get_random_boot(void)
 
 static int __init nokaslr(char *p)
 {
-	pr_info("KASLR is disabled.\n");
-
-	return 0; /* Print a notice and silence the boot warning */
+	/* The real check is handled in kaslr_disabled() below. */
+	return 0;
 }
 early_param("nokaslr", nokaslr);
 
@@ -138,14 +137,19 @@ static inline __init bool kaslr_disabled(void)
 {
 	char *str;
 	const char *builtin_cmdline = CONFIG_CMDLINE;
+	const char *const message = "KASLR is disabled by %s in %s cmdline.\n";
 
 	str = strstr(builtin_cmdline, "nokaslr");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' '))
+	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
+		pr_info(message, "nokaslr", "built-in");
 		return true;
+	}
 
 	str = strstr(boot_command_line, "nokaslr");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
+	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
+		pr_info(message, "nokaslr", "boot");
 		return true;
+	}
 
 #ifdef CONFIG_HIBERNATION
 	str = strstr(builtin_cmdline, "nohibernate");
@@ -165,17 +169,23 @@ static inline __init bool kaslr_disabled(void)
 		return false;
 
 	str = strstr(builtin_cmdline, "resume=");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' '))
+	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
+		pr_info(message, "resume=", "built-in");
 		return true;
+	}
 
 	str = strstr(boot_command_line, "resume=");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
+	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
+		pr_info(message, "resume=", "boot");
 		return true;
+	}
 #endif
 
 	str = strstr(boot_command_line, "kexec_file");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
+	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
+		pr_info(message, "kexec_file", "boot");
 		return true;
+	}
 
 	return false;
 }
-- 
2.50.1

