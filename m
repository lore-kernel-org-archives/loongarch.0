Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D058231858
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238882; cv=none; b=NZ8ViUqHbySoXhrc+xvi3584QnSjyU7AJ17n5XLw2qyEMl9X/wIA5MYnJ7IWf/SnvWdWtZTvhLvTxwb5YX49Gmk4mRGftFPWTxMNGVW3YRVE1uotmxKAwKdw1b8JymBd8iKbl158vz3QskT21ECazkhVN+4SK8cmxH/3Ibg8Z24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238882; c=relaxed/simple;
	bh=rTtiVbHcL4TDLSJhQbbgDII7Sg4nmInIRO3vYuuJqQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ghb4fm4u+qsUYpk9OI+XoQVV3f7o8xqOhbypoDj861Oc6qJeY5OROQ8lM0he3FAGm6RnaFr33vAEIgHBE9uIXKiu6PHaAeU3K1bQZmqTqtvwXHk3b3l+n02SthJV5Yer2p87lu9thpGLC9Lssd+bNp+zmR9gYdkUzThasrR4jn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=AIRrNB/T; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="AIRrNB/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764238850;
	bh=Ym5BSMc8jlSE9Ar0o4L61EHrYe+/qARB2zmvb0gWb0A=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=AIRrNB/T/8wdQYPGPtMKEg7XeomTN82C5fqT9lUkNpIOv2/qOjBYnlqo213xwOmTs
	 J02C05UhN81W4VTpsnNmViaWN2IqW5jxg28vQoQtJhaKO30/tSaLpQNW7AtucC22T1
	 ksLDdgB0E0/im9rr//eZ1++PHp3N2PPYnfNfUjKM=
X-QQ-mid: zesmtpsz3t1764238845tb51712f5
X-QQ-Originating-IP: T7eLNdh2Gt0MC59GBQs/rQ5F6izB+/yo+5fwcH0+VSU=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 18:20:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14232503937551174294
EX-QQ-RecipientCnt: 6
From: Qiang Ma <maqianga@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	hengqi.chen@gmail.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH v3] LoongArch: Correct the calculation logic of thread_count
Date: Thu, 27 Nov 2025 18:19:46 +0800
Message-Id: <20251127101946.3531069-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MX+1SEN3H+wAu8MF6d4YTwNHDHUfLKf4820ZI0VCNb/AZ9iCw73uAADH
	CB6UoVz+76zbP6wDgF8A4Asi+pKgsKaLoDSD74zfxOkXYc+8FVGnZTkw27Rhpw8SL0/uyyM
	vqxqkHsTkCAwEU14xVGOUKFQSyHDSXKjqyeE3ciYDCRcMn718bltdnKSxDP4trSEwHT/xUt
	Vt+ARWye1EnPsKubiRcLlooGqJh/EmmAOgsJqsM4OBBGwGQJiSk5zQIQT0Xd7wkoxtuMt09
	a7jX8TKEqoYPXg5HjaL8+XGCCVEpG33szL78716jlRka1hfVPKQRojiim0bdfY2o/2XvHGY
	h7+xGTUjjU2BbBGVyA55JF/mG/2D6zg9zZuN02pEhrFncez3peD4DP/7fWv22OoVKWWXwSx
	8olcrGQRG+ESbTYpvpHkV+IvX+OYAKzG+jhY4Mv5t+wwWxit2qbAZ66EnOcbD2qpdDPvlJx
	W6AqQTFMPc/n/TqZS4fs794Bq5FDuRW7QtyE+Hp+v3jQjbkd2YVVk1AcR4k95c2QCnuvCsp
	9NXBqKnbVuWgI2pZXE3UZbWEhJWESDfy4Ha9AuPgUCOHl44Cnd1+sdEKnCrdBgROLaTOZz1
	qOcg+BgGszreLScf+eWz0MQPVejcOzl4XcYSP+Q/wqRR21Z7QxDxX0U86fsTuKwixyXkyHi
	b4FitOIgxeHls4lw/Ox3Zt0TDDk5Gckf04ocsl87OCfnX0e4NsKC2Mp62k9TQQmfXUzl3GP
	YNvhWwyyb2wOa9/ySXvHpfffv089hUtunr9clfPo1as9N9I/gSPf1QkuuLM2+gRBl60bKDO
	kkxvTAkr7jI1O7RoY9PSM1w2OCSDj2oOrQw8Wi6dKafRQqex+rblpGFJpotUJf8oqD4JF5+
	LB7i0KeK5CpUJ5/CFRgEErb39FxsK7w+da8iUGLAoTi5I3MAS6VlhrDzO2QiGtT0xmHWG0K
	8GEsqK6p0Ch3yYDVJzhiA2lGSCqCPvMt12Dfgr/n6ztptRMzTHEBVogAYclJ4sp2NPGhylO
	luINYBJ77RS95WqGGDy0rJxrbufq4ZiwrKuxM85pXqcPpYQDUabekENZwc0Uk=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

For thread_count, the current calculation method has a maximum of 255,
which may not be sufficient in the future. Therefore, we are correcting
it now.

Reference: SMBIOS Specification, 7.5 Processor Information (Type 4)[1]

[1]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.9.0.pdf

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/loongarch/kernel/setup.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 25a87378e48e..eb6e3ac27436 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -56,6 +56,7 @@
 #define SMBIOS_FREQLOW_MASK		0xFF
 #define SMBIOS_CORE_PACKAGE_OFFSET	0x23
 #define SMBIOS_THREAD_PACKAGE_OFFSET	0x25
+#define SMBIOS_THREAD_PACKAGE_2_OFFSET	0x2E
 #define LOONGSON_EFI_ENABLE		(1 << 3)
 
 unsigned long fw_arg0, fw_arg1, fw_arg2;
@@ -126,7 +127,12 @@ static void __init parse_cpu_table(const struct dmi_header *dm)
 	cpu_clock_freq = freq_temp * 1000000;
 
 	loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
-	loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
+	loongson_sysconf.cores_per_package = *(u8 *)(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
+	if (dm->length >= 0x30 && loongson_sysconf.cores_per_package == 0xff) {
+		/* SMBIOS 3.0+ has ThreadCount2 for more than 255 threads */
+		loongson_sysconf.cores_per_package =
+				*(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET);
+	}
 
 	pr_info("CpuClock = %llu\n", cpu_clock_freq);
 }
-- 
2.20.1

