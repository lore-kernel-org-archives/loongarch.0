Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF6F604D5
	for <loongarch@lists.linux.dev>; Thu, 11 Apr 2024 01:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712797520; cv=none; b=Zgh2Wz4v+EQ4Bavtv3qt/0qvmLj3r3PzbQwf3T9uIql/PX8wwUlaLIdEI/wdmGuSiHdauWMZD943PDfQL7nGaXQq1LMui2tCbmBR75NAAc3KAH6lxbx4Pet2IcIdQ1YNK90T39lnRjRnBfPP6V7RIn6w4PlPyRCcayX4GyUF4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712797520; c=relaxed/simple;
	bh=Hwwauo5s9IR4XHfl2giofayHzvsDSnRmqNLccIaI9SA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUNSzRaEoTLxALEs12A5GxE2LAAGEWsHovWNS1cXAs0ReyCSEDk+SPS7HaZU9n2QTtCIpPojdX0Z9BKR2AX+7mf23XVD51k+BTZH+oQWEyFMoYTo2nqqcn2dGeVmN19kyIxJSs13MHyr5d87UAHPvE6GdszQadhlEuqMNO+7KHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxVfFLNxdm4ZAlAA--.20918S3;
	Thu, 11 Apr 2024 09:05:15 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxhhFHNxdmnrx3AA--.22869S2;
	Thu, 11 Apr 2024 09:05:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Marc Zyngier <maz@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 0/4] Give chance to build under !CONFIG_SMP for LoongArch
Date: Thu, 11 Apr 2024 09:05:06 +0800
Message-ID: <20240411010510.22135-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxhhFHNxdmnrx3AA--.22869S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFy3AF4DZrWkury8uF45Jwc_yoW8GFy3pr
	1SkrsxJF48Grn3Aayak34UuF98trn3Gry2qa17A348AF1UZa4jqr10vr97XFyUt3y3Gr40
	qFn3J34a9FyUA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

The changes of irqchip have been merged into the irq/core branch of tip.

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=42a7d887664b
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=a64003da0ef8

This version is only related with arch/loongarch and based on 6.9-rc3,
the first 3 patches with detailed commit message are preparations for
patch #4.

Tested with the following configs:
(1) CONFIG_NUMA=n, CONFIG_SMP=n
(2) CONFIG_NUMA=n, CONFIG_SMP=y
(3) CONFIG_NUMA=y, CONFIG_SMP=n (not allowed due to NUMA select SMP)
(4) CONFIG_NUMA=y, CONFIG_SMP=y

Tiezhu Yang (4):
  LoongArch: Move CONFIG_HAVE_SETUP_PER_CPU_AREA related code to smp.c
  LoongArch: Refactor get_acpi_id_for_cpu() related code
  LoongArch: Save and restore PERCPU_BASE_KS for ACPI S3 state
  LoongArch: Give chance to build under !CONFIG_SMP

 arch/loongarch/Kconfig                |  4 +-
 arch/loongarch/include/asm/acpi.h     |  8 +++-
 arch/loongarch/include/asm/smp.h      |  5 +++
 arch/loongarch/kernel/acpi.c          |  9 +++-
 arch/loongarch/kernel/irq.c           |  2 +
 arch/loongarch/kernel/machine_kexec.c |  2 +-
 arch/loongarch/kernel/numa.c          | 58 --------------------------
 arch/loongarch/kernel/smp.c           | 59 +++++++++++++++++++++++++++
 arch/loongarch/power/suspend.c        |  4 +-
 9 files changed, 87 insertions(+), 64 deletions(-)

-- 
2.42.0

