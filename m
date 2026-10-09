Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99BD1E1A3D
	for <loongarch@lists.linux.dev>; Fri,  9 Oct 2026 02:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514651; cv=none; b=p/mcUCtZEuNf/TjtNEEFeqJN1cJeo4NH3EoXH+zQlAF4a/GbAQ7F8dvLjfL/O6yOvLtgWwA+AIKcQTik12u2GQ/zfxOlnZ+tagn5IVNHhl2ruTNGqFFWFbNcD0rt66dlifQbfGd7hgVc+BxFIuygWvUPwQzGS8eWXPojQIw5S5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514651; c=relaxed/simple;
	bh=yl0TJHDzu98frW9uc9TMTi8QQB5q74ARsjqKyCP9KRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRI06bnW/EI1bt+EB2hJN2QHzNju9lEg/2qOHViv5D1V3KXszgse14F/bHvUo8/c5ikYjrbcN1L3Lt+Hvlo2X3jWiJ+nXyE2d6N3i2c9Lz3xM2b4CwocQDeWdtoc69Jka7j8o4ri+FuzoNvyDhkZP2Mo+1/EeqWuqKhvFy7KfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8BxLtMRWMhqBvwTAA--.58138S3;
	Fri, 09 Oct 2026 10:57:21 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJAx2c0KWMhqikwqAA--.24079S3;
	Fri, 09 Oct 2026 10:57:20 +0800 (CST)
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
Subject: [PATCH v7 1/8] thermal/drivers/loongson2: Fix negative temperature conversion in set_trips
Date: Fri,  9 Oct 2026 10:57:04 +0800
Message-ID: <38f8e7cde8e454e7c6b72cb1b9a1c54e67c8a7fa.1791512067.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1791512067.git.zhoubinbin@loongson.cn>
References: <cover.1791512067.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx2c0KWMhqikwqAA--.24079S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGrIS3YAyAAAsQ
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw4xuFy3XFWxGw17ZF18JFc_yoW8AFyxpa
	y3C34qkrZrJr4DZw1DAayrXFZ8A34ftFZrWF4xGw13C398J34agrWUJFy5X3ySkryUXFyY
	vr95KrWDCFWDA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EoGPUUUUU==

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

Fix this by explicitly casting MILLI to int so that the division is
performed in signed arithmetic.

Cc: stable@vger.kernel.org
Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management support")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/thermal/loongson2_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
index 4d40fc706a53..f5ff0cac1442 100644
--- a/drivers/thermal/loongson2_thermal.c
+++ b/drivers/thermal/loongson2_thermal.c
@@ -108,7 +108,7 @@ static int loongson2_thermal_set_trips(struct thermal_zone_device *tz, int low,
 {
 	struct loongson2_thermal_data *data = thermal_zone_device_priv(tz);
 
-	return loongson2_thermal_set(data, low/MILLI, high/MILLI, true);
+	return loongson2_thermal_set(data, low / (int)MILLI, high / (int)MILLI, true);
 }
 
 static const struct thermal_zone_device_ops loongson2_2k1000_of_thermal_ops = {
-- 
2.52.0

