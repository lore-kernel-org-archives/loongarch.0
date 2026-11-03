Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690660;
	b=YfdpfQmp71glFSxoQgaRLj+zs2tb25roufm0jDoVj+ChdA4E6AQM6OC+GN9qi9TuVlAf
	 GxI4y6i8j7KhTNcMRkuh9jWFVtutCg6vWdt3SXIPeejASRP97g+Va2FSPqjMW1t2gX9Tv
	 fJuhRyYDOEKU07cwycWvbqfV+iWiT27SM1GhhpZXSasgiALfLExs8I8Y/SLmeDn5Ojw0l
	 YLgqRflXykEXHOVH0s2rGuuP4fRhcUgqCam1d3H8e/dpZKW+WNwS/3EFVTXkTSlrqshzT
	 jhBjXlZj2qgBtMXsIrIEooh0WOCV+enRHIpJi+RCVF2YGGBvzaB0lsn/jErZrkgLFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690660;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=JTbIuCE3NJIqXnZqTc/A3VxouAEQ0U5NKNLCXoF0qNw=;
	b=mUunS+25RQ2aTyVW9GNwlgoKsDGS84XtmdFtlJVkdU/hSi6Jk+S7yI7SBLTDTk+LbbrF
	 pQabTYSda/OOsiLf32PGf5SYboJ/nGpcTSxlNQHVdiEFZWrMIZVgTsWBfJzgFvba45pUN
	 7J+5ylNPbEogs909OGP0jMlMxBb5WMeb5GZryKevhbLo85FN3aHV2RTUYtJCWlpjTtpPo
	 ee1zO+s1FQoUQrDPymEsP1+lslBoGBh0UXIz4tLVbasa7U0gj2TMTYQRcNiBNEd0bUmIL
	 YZkU8rH1TJwyYfugKsxTlwJZWpAqj0pNkuFWMbmoG17P+mcE6EpJFDMqZKIcRs+gYJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCD2606A329
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 07:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BCD2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxTtMhjOlqx90bAA--.14524S3;
	Tue, 03 Nov 2026 15:24:17 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJBxpMwYjOlqxRUyAA--.11093S3;
	Tue, 03 Nov 2026 15:24:16 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	stable@vger.kernel.org
Subject: [PATCH v8 1/7] thermal/drivers/loongson2: Fix negative trip conversion in set_trips
Date: Tue,  3 Nov 2026 15:23:50 +0800
Message-ID: <efffabbb8f7b59efdc0f8b3ecc86bfd2ef633ac6.1793690276.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1793690276.git.zhoubinbin@loongson.cn>
References: <cover.1793690276.git.zhoubinbin@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpMwYjOlqxRUyAA--.11093S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEACGrpUP0DvgAAsY
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw4xuFy3XFWxGw17ZF18JFc_yoW8Aw4xpa
	y3C34DCrZrJrWqvw1DAayrXFZ8A343tFZrWF4xGw15Aws8J3yagryUtFy5Z3yfGFy8XFyY
	vr95KFWDuFWDA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBSb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF
	7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2nmRUUUUU

The `MILLI` is defined as an unsigned long constant. When the
temperatures passed to loongson2_thermal_set_trips() are negative, the
expression `low / MILLI` triggers implicit conversion of the signed
operand to unsigned long, and the division is then carried out in
unsigned arithmetic.

For example, with a low trip of -40000 (milli-degree Celsius):

    -40000 / 1000UL = 18446744073709511   /* unsigned long */

After truncation to the 32-bit register field this becomes
1271310379, instead of the expected 60 (i.e. -40 + HECTO). Writing such
bogus value into the trip register leaves most of the upper bits set,
which may hit status/trigger bits and cause spurious thermal interrupts.

Use MILLIDEGREE_PER_DEGREE instead of MILLI so that the division is
performed in signed arithmetic.

Cc: stable@vger.kernel.org
Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management support")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/thermal/loongson2_thermal.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
index 4d40fc706a53..54ddee47cb32 100644
--- a/drivers/thermal/loongson2_thermal.c
+++ b/drivers/thermal/loongson2_thermal.c
@@ -108,7 +108,8 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
 {
 	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
 
-	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
+	return loongson2_thermal_set(data, low / MILLIDEGREE_PER_DEGREE,
+				     high / MILLIDEGREE_PER_DEGREE, true);
 }
 
 static const struct thermal_zone_device_ops loongson2_2k1000_of_thermal_ops = {
-- 
2.52.0

