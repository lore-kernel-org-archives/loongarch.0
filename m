Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690661;
	b=bLMhqsi7L6pPp7h+JF6a1B89TXwxsFNbdg41nJZ3BhuYA1jvbhJ4tTNeI2B/EmOiCYBy
	 efmP1lesOuHlZtPkgOFVs3olOWf1uo1z8J1chipPRQGxQJPjlE734GhAgurjPNfxWGn7h
	 srrtn5tue5P4i2QWbjVkMI3s0Cr3HuKgyFZDid1wbpHN0hindf652msXbtEYWoLPIYfo/
	 8tvha59SSJ25zlk5DYOnvYc3aerv6ixOgJ8Ol8AfTQAZxer+fdt6juH8/L9fVafRzTwU5
	 eySHxvtQ9cZEuED59/gDtHcLNFANNWnFFpQOML6gJOA4DrWYIdWozT+9lo15o/hR5FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690661;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=lPZAbR6APkWcvJdwkidIfAdrIskZ0pgyl4oCJKTPYyk=;
	b=BMVdCHYoYzj1MFlHkyHjfFKWsSH5BCSSKvAV76H6NcAH2FWyMz5OYlMcPnD+oUci6jWz
	 AGSa1e9y+OXzAQRo3Q0ucFwJRdL+meocser+hlEaxDPOzzoimNk6gKh1NjSZPG6jd1Oxd
	 vY5WclvugE1cJkX7zilf3gwmOZLp1vYs9f1zp0q/oII63drFfaIKdcAmpNrczDZBWXory
	 hU157jvYJLxZTWZm8wr2zjqWxigx9uH8Wf7GU9XdwEhRbIGPYVxm4K5hk3LBjuW9+p05k
	 7IMfSLLh7PjUR2gJuJFTP6OrwRVZbSiThK2exEdeHGttuqOW7fKuHAJNgwX4XXqcNzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF90606A32C
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 07:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF90606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8BxW_AijOlqzt0bAA--.15111S3;
	Tue, 03 Nov 2026 15:24:18 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJBxpMwYjOlqxRUyAA--.11093S4;
	Tue, 03 Nov 2026 15:24:17 +0800 (CST)
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
Subject: [PATCH v8 2/7] thermal/drivers/loongson2: Fix clamp() usage for thermal trip points
Date: Tue,  3 Nov 2026 15:23:51 +0800
Message-ID: <d8323ccee74480f26b322b6e6af4550d38ac05bc.1793690276.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJBxpMwYjOlqxRUyAA--.11093S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEACGrpUP0DwQAAsn
X-Coremail-Antispam: 1Uk129KBj93XoW7WFy7uF1DJF4DKFWkGFWxAFc_yoW8GrWrpF
	WfCw1qkr1UJF18Z3ZxA348XF95Aa9YyFZruFZ7K3Z3W3s8Xw129ryrJF1UXrWIvr1UWFyU
	XryvkFWUCF4DC3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1a6r1DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbc_-DUUUUU==

clamp() takes the value to clamp as its first argument, followed by the
minimum and maximum bounds. The current code passes the -40 and 125
limits as the value instead, so the trip thresholds are not clamped to the
supported sensor range.

Correct the arguments so that low and high are clamped to [-40, 125].

Cc: stable@vger.kernel.org
Fixes: 734b5def91b5 ("thermal/drivers/loongson2: Add Loongson-2K2000 support")
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/thermal/loongson2_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/loongson2_thermal.c b/drivers/thermal/loongson2_thermal.c
index 54ddee47cb32..9256cd3663e6 100644
--- a/drivers/thermal/loongson2_thermal.c
+++ b/drivers/thermal/loongson2_thermal.c
@@ -62,10 +62,10 @@ static int loongson2_thermal_set(struct loongson2_thermal_data *data,
 				 int low, int high, bool enable)
 {
 	/* Set low temperature threshold */
-	loongson2_set_ctrl_regs(data, clamp(-40, low, high), true, enable);
+	loongson2_set_ctrl_regs(data, clamp(low, -40, 125), true, enable);
 
 	/* Set high temperature threshold */
-	loongson2_set_ctrl_regs(data, clamp(125, low, high), false, enable);
+	loongson2_set_ctrl_regs(data, clamp(high, -40, 125), false, enable);
 
 	return 0;
 }
-- 
2.52.0

