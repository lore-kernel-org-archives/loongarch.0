Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B268330DD2F
	for <loongarch@lists.linux.dev>; Sat, 21 Mar 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774084853; cv=none; b=KlrMjgM9K3u+Cus+KWyRsT1ETQMeyAFAYP4cH5HhBWoJpKgShNF5ko5AS3TgTnhmIFtOv+cZwrivAq7n0ln0LkjdQKR0gvTTeSFoskbwNjqhb5Expi7lxG3NBPiJMjGcWfOE0zlHfoHZ0TszTRN7/rZbJI+oYsorJguwhTxFm3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774084853; c=relaxed/simple;
	bh=ztwqvRIc/H0GG4OVXIYNFoHtSw6Shmn3oeXDS+8hp0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvmSSRt3fFjui9L3TJllQQWCfSXYFWP7iZK4aQ13rNi0QmLCNcoBZ829T0CS4VL49Yztr8JHW3H+WJ4LKHCqBbJY/gnRpSTR/3cRPlVUVovuHFkViQbx5X3urwvT35jxgS6bR1yhfFNpFXYSikQsVqtjzK++lcAJCeaXRozVJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.202])
	by APP-01 (Coremail) with SMTP id qwCowAA33mnjYr5p3aWyCg--.465S3;
	Sat, 21 Mar 2026 17:20:37 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v4 1/6] MIPS: loongson64: Override arch_dynirq_lower_bound to reserve LPC IRQs
Date: Sat, 21 Mar 2026 17:20:27 +0800
Message-ID: <20260321092032.3502701-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA33mnjYr5p3aWyCg--.465S3
X-Coremail-Antispam: 1UD129KBjvJXoWrKw18Ww45Wry5WFy5JF15twb_yoW8JrW5pr
	Z2ya4UGrs5uF1UZFZxua42vr1rAa9xXrW7Jr42q3y7Z3sIgFnYqrs3Cry5Jr1kArWUWayU
	Wry5Kr45WFWUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjrHUDUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

On some Loongson 3A devices, a LPC bus is present and some legacy
devices (e.g. 8259) on it expect hardcoded low interrupt numbers. However
currently the expected low range interrupt numbers are not exempted from
the dynamic allocation, which leads to confliction when registering LPC
interrupts in the fixed range.

Override arch_dynirq_lower_bound() to reserve these low range interrupt
numbers and prevent them from being dynamically allocated.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 arch/mips/loongson64/init.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 5f73f8663ab2d..c7cc5a3d7817f 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -7,6 +7,7 @@
 #include <linux/irqchip.h>
 #include <linux/logic_pio.h>
 #include <linux/memblock.h>
+#include <linux/minmax.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <asm/bootinfo.h>
@@ -227,3 +228,8 @@ void __init arch_init_irq(void)
 	reserve_pio_range();
 	irqchip_init();
 }
+
+unsigned int arch_dynirq_lower_bound(unsigned int from)
+{
+	return MAX(from, NR_IRQS_LEGACY);
+}
-- 
2.52.0

