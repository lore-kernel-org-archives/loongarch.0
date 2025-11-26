Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07FC22A4E8
	for <loongarch@lists.linux.dev>; Wed, 26 Nov 2025 02:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764124640; cv=none; b=MXT69SvSimNA99sTLz244SXpZLn9dgeLBpQZN+Dur5R2TOYqTE5/hQu5S3qoxqtfiI0COgm+737VTL5WbWeAng4oDXUvv4AkECRxA5TMnORD3TypYxZe+fqfbYfN7JsWjVNbBy1V7g5YVVTq4RDMH4QcMkR/ljr+7FZ53uk5AXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764124640; c=relaxed/simple;
	bh=dyyanO4xf46BrgF90hRvJfjaltHLB731vnGFPzKsTBk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s6CUeqqSnkYFEwPL8bFBZlQdtqk+TwgSZZF0X+56NiKORjijXlS6Oz5UmkWdhhLnI8+UrNKZfNLcMfMmaeWUMbmUzqSiqV9w0DcDc9D0NqhswYPJszqUPQMCq/9PA20sJl77rKxWbs1/aBMUmdWGk81XOUrJFsHtsLsFpOR3dnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=MIwL8Wuo; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="MIwL8Wuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764124619;
	bh=snyP4dIJhVEfL1cF1W/gxNri0KGx1YAG3Ccl2YjNfMY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=MIwL8WuoTxK+RAyiVrNHD1cui5ba0J54TyL4XTZ64P9rgHlpBlaJhMpioA59t/3rn
	 ImpsHBV2SC3rIUdz2+1AU/XbFZxCfsKBoAlPeYO9T6/d9i2dngJnAwk8LCNe8UVbqr
	 IkXSd7lsSPwTcATFsWTJfKQRpqKzQFoQq8gaGFrY=
X-QQ-mid: zesmtpgz8t1764124614t217512b7
X-QQ-Originating-IP: Q63GKU/1qu4B8wEpnDEqLyCnEcTYnImTKca4hRmrqk8=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 10:36:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14159429218752448158
EX-QQ-RecipientCnt: 5
From: Qiang Ma <maqianga@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] LoongArch: Correct the calculation logic of thread_count
Date: Wed, 26 Nov 2025 10:36:31 +0800
Message-Id: <20251126023631.3143434-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Oe8iwmjPdG65O1tnfD9PUZWdcqz5dY0Dn1ISGyH6fZELtB1I7baZQ1bU
	aJk8L+rFHTDQAvnFefqDFH5lPhOrSTrJkMhrBLdh7/JND1Jdcitkh3TbQqTa+VhCQQ10W0T
	iQ0++PrlI/+vJnk1IZsvK5XbHFas2MFayizVAhKOc/LmoiA0Sl4iwQtqdeZxzFM2L6Z5Jgx
	WMMoAgTVgTqvEEd+Z16iPUSieZHm0/YGT6hJTxxPT2d+HmfdyJNlIZkqveoZ6Z/+2Vz8CoF
	zZLwqX5hhh8+2YVFrE7PjbEbsVgXDvoDhr9jDMqicKMxI3CR0TS82KxSuLAKPZ+s/k4PaA9
	vNF/Xw/YjvbFjhaoSqs+VYFXXcZV/ssXUumBaYaeaCYWFSALqY+qWBaHSKdQvQOe/u5DWMA
	xPAR3vBIkj+4ruSnVTelTCi5UWvOP3jdJjdPEq5w8gtl2yxgqflPkvkjWxWXq9nCFrD4Xs/
	wDT6EbLWMD9Vj0KK6rKqocd3QLyiyJ93NMHE8r2hGIivg6gMDhDMDSuqeavd5u+ch7N7dQu
	EcGaArBqeqjd6KpE6PBxZspjdIyciy6TAdrBqDwfiHsUaaT6r/1THteN4YQO8Vv3XjvISd/
	7iEWx1hQX0gHdlZrQxZ8f7MmUs8p+txoe+tlZ+Q+FMQiiGE2Sv2eMTzqFn5goo/RRH1Xw3d
	cl2dFJCvsoOgxsez8B2niFPgDZiZcIvomSCtQ7cJOS5bB/r2QG9NQKh8Vv7m1e5vYu5VAh3
	I4oNzkz5UXIATVmd9GtJLTOnrf1VGNCYeb/ZZb59k8Y34k+wdxFUHxOKNINHqTuAbrj0pJh
	iXbyeqsgKVI+48R3NTw2GTqLMY23q2LvT3r5mdPhAYOWb2DjbYbL7AWDmTIblIGGzVNZjKi
	Uq6ANRBsDMV1kGuoAUhpyJ7xQGj24V5xYWW1RyuYNbBZZgT0QWkxD0/Bnr/mhTZjnnG4JeS
	eYOs1YUAjwr/wx/C2NmWDuFoWV2ZQe02Dq6LpopVvirr9Pp59pOolGNEREwEJYn4dnLYtzG
	Za63VfNsTXGMclfZRhM16wNk9n++k=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

For thread_count, the current calculation method has a maximum of 255,
which may not be sufficient in the future. Therefore, we are correcting
it now.

Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]

[1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.9.0.pdf

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/loongarch/kernel/setup.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 25a87378e48e..760f5ce44384 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -56,6 +56,7 @@
 #define SMBIOS_FREQLOW_MASK		0xFF
 #define SMBIOS_CORE_PACKAGE_OFFSET	0x23
 #define SMBIOS_THREAD_PACKAGE_OFFSET	0x25
+#define SMBIOS_THREAD_PACKAGE_2_OFFSET	0x2E
 #define LOONGSON_EFI_ENABLE		(1 << 3)
 
 unsigned long fw_arg0, fw_arg1, fw_arg2;
@@ -120,13 +121,19 @@ static void __init parse_cpu_table(const struct dmi_header *dm)
 {
 	long freq_temp = 0;
 	char *dmi_data = (char *)dm;
+	u8 thread_count;
+	u16 thread_count2;
 
 	freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
 			((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_FREQLOW_MASK));
 	cpu_clock_freq = freq_temp * 1000000;
 
 	loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
-	loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
+	thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
+	thread_count2 = *(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET);
+	if (thread_count != 0)
+		loongson_sysconf.cores_per_package = dm->length >= 0x30 && thread_count == 0xFF ?
+						     thread_count2 : thread_count;
 
 	pr_info("CpuClock = %llu\n", cpu_clock_freq);
 }
-- 
2.20.1

