Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9521201113
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 03:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764214373; cv=none; b=dwCAMwPGtD4JScvDBgrcDhdqHN/TNZRPp/g4sdeft+OMQ7MTxAGohZxIvr+bqMzt0YEP81qgSUUVK12b7THgjrJfWt1TlTeeIpIrmY2P6vIk+p2B1q8eir2qJvcP3kVn3Iy3BV1lEqlcDD3tR5C0Vrl7/kyJv3NsxLfQphzF+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764214373; c=relaxed/simple;
	bh=Jt/SBI7/H0gS6WvYjVl+jJTRYNKzZeiAnbYlCoNuQ60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k1pxK9R44/JDTs2FqOSkmV/hXmjaKya2lNC7z1JvoA50Ru/KsGviTJy+45FJG1orW5UJtvDG/EhQnRXdCjCVdg+wPOOgssLXGw6q078fLiICp6bnlvEXKTp9DwadRINZgs+T0cvztqrcUkOPQTV1DYHwczgpRob5ZU55U36yJRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Eh6jWIny; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Eh6jWIny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764214300;
	bh=9BbRKEnyGbB+PfTV01qDdALOPwkjwZNJFwux+GH4JZA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Eh6jWInykk59q5hZUXWqUeRjqzo4+eeBtf6iqF134XQi+MNHJnu1MPOTA4uInKHJI
	 08gdteawgMlPPG5V54bJNXyXQA2V+AXnbWc5lZUZdl4aQ8C+aj8w1lj034MbL434/z
	 CRBER1WEsp61sWCx1p+B2gTd//EG/TP1H+YG7+OA=
X-QQ-mid: esmtpsz16t1764214295t0ab471b8
X-QQ-Originating-IP: VefeIHbEXynRhZRui6Yv+PCOvCrphcKkEJ34Org98S0=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 11:31:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12939922369823571880
EX-QQ-RecipientCnt: 6
From: Qiang Ma <maqianga@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	hengqi.chen@gmail.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH v2] LoongArch: Correct the calculation logic of thread_count
Date: Thu, 27 Nov 2025 11:31:23 +0800
Message-Id: <20251127033123.3445519-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nb940SUM1Q7XSUl6C1MTBXceI0PWv5ZHj38JDlGjA76gLJ2F3lTwcx7U
	CINjNwRGnprTi6PyihE5QA6HewTBlKOlUQzLiMEJgEg9/gsTlovdIJ5Xe9WwklygvrMyFLu
	nKN5F3mNd3E7WY63KPBRRBifjh1Tg5daLIABhpVvk0d7r4MnW0fQTUEg9ues/I96ebxCmHI
	yVB2TCgO0Rge+0mafG+g78XdblObzy8248TsCcYt+vzW7Gaw5TRiC5jNhgR4OklOx1JDdKh
	UJwY6Ovc4cHl0bw8UVAHSZxOU59z2fZDeiExGyjSaVl2PNZk7zPctnpW/ehmAX+JUqYjIiA
	It+dcdS+eB3brh9lQALg2OOWlXFVb93FVE5px1LnqWlwwNR13IzBe//Y8pGVQCL5A1JwVEq
	i0RU08tN5xUb/ezUQR3JgtvYv0Uyp3VDYcvDrcMM5gx6kdk/nnfeLr6iBuwqosKFKa+Ufil
	jp4YE/iNC3nrO/f9h2bhn9nu94nyq9euDbIlqiu5szmkUNYjcuhla2sM6v1JA/vcbyXTF/Q
	hmyQRQkqaUppZhQvxGIsTtyLTo6ezAcMkwsK24g9j/mQZMtXYV8wBYexrp+CeiE6RPK/cAu
	IYifVPi0AZzTvaPjxWI+yZxSUseQx5D1lp+1ZjFGN1OMgBx7jRhq0LUX1DMsnWs4Z1bny/5
	fsTcKP2irnklxCMwXOCe9BGaHJDgWjL4Mp9WDwJ0RBG+SzckESsqFeX2bSS58uvlniCqrcn
	uvn3sjqEbc55wVIKyStuqutCPgtHePNKZGifRVa+GaFStB5vcyZO5s1RJdb7iy8/VDd2A0W
	aJ5yi51JDIpQUFGu+KcxvrVScVXKUcuBTbeko7UujRzYh+/RoPRuEEj6Fok82wELvh7HhCj
	KFH0KdajnF7qeJze2QLMpibCsQx5totBvX+bGYWb9qCugDbjZNUOQlS7I8i5qyGzdCW6D4e
	gVbRWRwwnB/JfQdlJ7AZqmG34vwE/j2cIocnSdgDad46vBrpneVF987cjqRvZS1p2YBWoNl
	dQ4h4dHpnkNym+sc8DEZr0/UFjnleYva7/xJ/4nReNR+3P8J76
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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
index 25a87378e48e..8dd25fc4bd13 100644
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
 
 	freq_temp = ((*(dmi_data + SMBIOS_FREQHIGH_OFFSET) << 8) +
 			((*(dmi_data + SMBIOS_FREQLOW_OFFSET)) & SMBIOS_FREQLOW_MASK));
 	cpu_clock_freq = freq_temp * 1000000;
 
 	loongson_sysconf.cpuname = (void *)dmi_string_parse(dm, dmi_data[16]);
-	loongson_sysconf.cores_per_package = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
+	thread_count = *(dmi_data + SMBIOS_THREAD_PACKAGE_OFFSET);
+	if (thread_count != 0)
+		loongson_sysconf.cores_per_package =
+				dm->length >= 0x30 && thread_count == 0xFF ?
+				*(u16 *)(dmi_data + SMBIOS_THREAD_PACKAGE_2_OFFSET) :
+				thread_count;
 
 	pr_info("CpuClock = %llu\n", cpu_clock_freq);
 }
-- 
2.20.1

