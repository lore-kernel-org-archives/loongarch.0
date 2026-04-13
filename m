Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5208A23EAB0
	for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 03:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776050045; cv=none; b=onbZKwR/ddFy9Dux8R67zwp76chCbrbRCh2tG/xEtJIFF3WapMaszxqwUqEw+xWO9+NyKeT78erAhje8eIUTUCb47KN1KpK7jmcK/AWDSrpUqDeueoy0+ibr/6db+n8wFIqJV2zcc31S2EAftF0fmy4cIDkuN6oFl0R/Sc0oPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776050045; c=relaxed/simple;
	bh=+smC1gZDSIEm3W6V8Xxx52e3LFFAgqZ3sGaduwuaZiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4W5hApq5FyPkfhLNxyp4vzq62CCY+WP/kKXQlmH05EqR06jNpHoUnCQiavKVzkpYK1E8gcM+rgTJzRtNf8goqZy4lPl+hst497hnV9kJ4sLWUOgBjcibeLqqj6Pjnw0rIiXCv1DIAQ93yh+zThhkoX5y6szgWhvrs6Wb+IWQ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gKZ6qI7h; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gKZ6qI7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1776050012;
	bh=DWpIV1nTLf0MNO8v5X732tsg/2MN5L1BVAcTW6s6HCg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gKZ6qI7hjVk0dck15wtpyZmeoUWpwhEwG3rMLJkdYnPFK+YftJidT5/JdUhplCD9p
	 p8i3m8ErTj2WqdaOkCOp9HPpzH+XAeAtEJNdbRD+mGiJ9jwcI79QyK1UhNqtK3y9p6
	 IAC+C0mVjX83dI7DxrSL1Q4/lnUJsyK1cStvGKS8=
X-QQ-mid: zesmtpip4t1776049965ta130dce6
X-QQ-Originating-IP: SOQw2YUK0O270g3KpEK8mldnNmYVX3J0Ts2Rw3wHC4I=
Received: from yangyuqian ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Apr 2026 11:12:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16364149023987049018
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
Subject: [PATCH v2] LoongArch: improve logging of disabling KASLR
Date: Mon, 13 Apr 2026 11:12:36 +0800
Message-ID: <80CA78395583F396+20260413031236.2512416-1-yangyuqian@uniontech.com>
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
X-QQ-XMAILINFO: MIiZxjTKFdexjevKf3mGfO7I1TFSnVNQou8JDz1QcsMqOxgT+L618UGD
	joDo5jzX/M3m6dXgJesyMufVd4f6ksPR4oBbN0x8Xm+iom4gFO/EkkMJxYnoOb4miWiLMa0
	KV4q3AFl/Wn8IdqZSfAsc1Ypw/CvcLqsVLMhMeWvA1f4rrE3kMLbUMc2eHT5jFWQL5UlRi8
	PJzKOCo12s1MTgPQv0kD4rRcMsiuSHrohLPVo+ogGGSlJUjowRzpJi4jB/CQwPuFXlv9+Fg
	KO0JUZ1YpG2MW9hDO3GKvdj4xto58q7HWxw5sDX0qmpxTYezAxK2vBkroT1SMT7Pm42wriB
	G4zyGYfH0vihJGZ0d7uS5NtiBltiP7VEmcg5keHtUa5Y+c+rL6iMBolduYUNNCnQaE5K+QJ
	bJB5L48FdOTPrzlXA4m3pAwVAMhO2kEK7z/omcJDLfhVbcIyCbHqsqVa2dWfaOih0stASWW
	GD5XE51oZWAfa3YF0En276QZiezcrELGdqyh7JDdWAHyE/8XlSFJ+wlmyYFQ3auAE+SKQzj
	iib/FHQe/Skndu3m+7P4igxGzRSI76zwODmZF5YleqlcE3HmBFIO76bFQQQOYcTnKgnbdII
	8Aup9NABMpLFpMf9BWfCugCSyLLqDVW5l4Pg08MI73MQQxioH6jpu5ggVXnIDZAE/309/MF
	QqRN7MnGfLSDoB9adacFR0C8XV6Rfrov56sU2K+I2gXVaXJ1F1LWz/cA9m6PQADxWe7zcQZ
	Tblcrq/DxSVsnqF+A3qv55BuyX4Zwps9pkqpd6Pupr6ld5sN4KbICeLSZYsM4ASde2kZgNn
	5n3MdKaK+46Vt/9WU8saPVEIxast47DG0BBHgZkZZYOKBcTVlzxvgiX7xYaBEBCdI4qEC6T
	0EcGgMxuojvg6IOYJsLVerGRsYtyBvJaBE4Wkn0kOvy5z5SSYDmq+0Qf2BIegHBeB2TA7xF
	gVIbS1pe71WUVSyLoPWiOpSj6MqfOQizRZS5B3EaHGgZK5JqIhONw5ug2MaNOh9fcpo0HGG
	v7myCjYfyecoMcYXQPzGhJu5lzMq/CgbZkcWkbSA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Whether KASLR is disabled is not handled in nokaslr (early param
"nokaslr" setup function) but in kaslr_disabled. However, the logging
was done in nokaslr previously. So we move the logging to the right
place and add more specific info about why it's disabled.

Suggested-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: Yuqian Yang <yangyuqian@uniontech.com>
---

Changes since v1:
  * update commit title, loongarch -> LoongArch, remove trailing period.
  * use macro instead of const variable as log message to avoid build error.

 arch/loongarch/kernel/relocate.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 82aa3f0359278..80720175c89dc 100644
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
+#define LOONGARCH_KASLR_DISABLED_MESSAGE "KASLR is disabled by %s in %s cmdline.\n"
 
 	str = strstr(builtin_cmdline, "nokaslr");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' '))
+	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
+		pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "nokaslr", "built-in");
 		return true;
+	}
 
 	str = strstr(boot_command_line, "nokaslr");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
+	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
+		pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "nokaslr", "boot");
 		return true;
+	}
 
 #ifdef CONFIG_HIBERNATION
 	str = strstr(builtin_cmdline, "nohibernate");
@@ -165,19 +169,26 @@ static inline __init bool kaslr_disabled(void)
 		return false;
 
 	str = strstr(builtin_cmdline, "resume=");
-	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' '))
+	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
+		pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "resume=", "built-in");
 		return true;
+	}
 
 	str = strstr(boot_command_line, "resume=");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
+	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
+		pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "resume=", "boot");
 		return true;
+	}
 #endif
 
 	str = strstr(boot_command_line, "kexec_file");
-	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' '))
+	if (str == boot_command_line || (str > boot_command_line && *(str - 1) == ' ')) {
+		pr_info(LOONGARCH_KASLR_DISABLED_MESSAGE, "kexec_file", "boot");
 		return true;
+	}
 
 	return false;
+#undef LOONGARCH_KASLR_DISABLED_MESSAGE
 }
 
 /* Choose a new address for the kernel */

base-commit: e774d5f1bc27a85f858bce7688509e866f8e8a4e
-- 
2.50.1

