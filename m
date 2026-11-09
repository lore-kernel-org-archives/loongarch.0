Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211719;
	b=ElzFHOmrdEPguU1Y/A4DEjho8yQjZGq/nul03yT0XI4yNmftLQioUNQP94Bp2Zvwvqvq
	 pJWuUiL/petSWc66nWQCq4t/tEUZj7jzgBG8wENEPp75vEODGBDA8QpVO5ckSqenmDFss
	 MHaYc4g6fC6nGgpMO0xF2Ua1h1tKG88Dwf7/0oQJzClqdiY1Na19QDTmr1Y3Hlheh3aGS
	 B8X2IaAQh0z4OJ/pj0cb0xjwQjkhhq8JM8X/7uqNUqo/catoatZLWqNxUcct0ytKmEdXd
	 1YU5tdk4H+NWCGhWNxeeKoPQJP6XSnBaLUdD+g/0qPRTXdySFEVstihll8a8lBqaDww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211719;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=N728NbN1RkiaIlKFrdJpmUOYaq323twMKftKWVPKTdk=;
	b=Z5FEdxzZF0KwdS5Va+t8sbSBBBNh//O9jl9yR+J8DVJ0Zxrudjj7Otw9ZE56kqYvaDIn
	 5u48wkYwxkKixV/69CmC6ptMF4c4dibtEGirm4tm798Zlw4tEXmh7T93e2yG4Ny6PjrH4
	 dN14FSxkbo+iJF65zM6uZnGlrvQTF4/F6STl/bpAOKpi2qt+EIYLo05wcgZ1Z6RuZ9ZEg
	 rA8Ki7rZ3Lmr824srhsOiHuQnckyYl11Uievq2XKd92RoS35BuEz0EuUgeiKmPoBg0D/q
	 5Vx9pw15BiZrRJ7fgRRe2kwANtiXb1S8YegMif/6WIoEWzJ/3riii+jOygFFoolsZhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF68606A31C
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 08:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8DxC9KEf_Fqcr8dAA--.20375S3;
	Mon, 09 Nov 2026 16:08:36 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxmM15f_FqWiQzAA--.37920S4;
	Mon, 09 Nov 2026 16:08:35 +0800 (CST)
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
Subject: [PATCH v9 2/7] thermal/drivers/loongson2: Fix clamp() usage for thermal trip points
Date: Mon,  9 Nov 2026 16:08:17 +0800
Message-ID: <7ae230bbff1143978c90f1566bfca6d17101929c.1794211535.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1794211535.git.zhoubinbin@loongson.cn>
References: <cover.1794211535.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowJAxmM15f_FqWiQzAA--.37920S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgEGCGrxOf4EQwAAsW
X-Coremail-Antispam: 1Uk129KBj93XoW7WFy7uF1DJF4DKFWkGFWxAFc_yoW8GFWkpF
	WfCw1qkr1DGF18Z3ZxA348XF95Aa9YyFZruFZ2kas3W3s8Jw129ryrJ3WUWFWIvr4UWFyU
	XryvkrWUCF4DA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

clamp() takes the value to clamp as its first argument, followed by the
minimum and maximum bounds. The current code passes the -40 and 125
limits as the value instead, so the trip thresholds are not clamped to the
supported sensor range.

Correct the arguments so that low and high are clamped to [-40, 125].

Cc: stable@vger.kernel.org
Fixes: 734b5def91b5 ("thermal/drivers/loongson2: Add Loongson-2K2000 support")
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
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

