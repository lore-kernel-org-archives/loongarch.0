Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8404845026
	for <loongarch@lists.linux.dev>; Tue, 24 Sep 2024 06:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727158814; cv=none; b=eI5R+vHix/w5HpQa6mRUZ+dgKwg9kEf7SjTDJonoXfw2z8Ei1hQvzf/G477X/BYyz7ezI88QXnVsKp8XsoLajkYYXXAkHzpXrLx2d3jErU1ObMm7rNIjK177/ohVR+hkfFpZUFtBEJ0DdFF/5ST9bHmB6k2Uv7hyROPYOLaRfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727158814; c=relaxed/simple;
	bh=5FQDDYs0nRz+Oq1YU4mWw8FOlIj9pbeglI4+dvIYkZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fs1SUf20ORIEU7T2+IsptjxhLiC3v5xlx81bEifXPNZJOJScamibwS9ATruCRpSsxCYiiFJ+9j5h4j+pdG9uIxutiCv1WF9txrU6bpK0UKfLskTLHHm2A0dWmG2mO3o0ACYc48IPrf+Md/TaS05rryptUgUTJAieLn4yabLVU/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxbeoTWvJmI74NAA--.31649S3;
	Tue, 24 Sep 2024 14:20:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front2 (Coremail) with SMTP id qciowMCxbccSWvJmJHwQAA--.2260S2;
	Tue, 24 Sep 2024 14:20:02 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Enable generic CPU vulnerabilites support
Date: Tue, 24 Sep 2024 14:20:01 +0800
Message-ID: <20240924062001.31029-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qciowMCxbccSWvJmJHwQAA--.2260S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFyDAFy8XF4kZFW3tFy5Awc_yoW8tF15pF
	ZYyr1SqrW7JF4xJrnF9a48GFWUX34kKa1fXryqyrW8GayfCryUWw4fJr13t3WjvrZ8Gayf
	ZayFgFWSqF4UZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=

Currently, many architectures support generic CPU vulnerabilites,
such as x86, arm64 and riscv:

  commit 61dc0f555b5c ("x86/cpu: Implement CPU vulnerabilites sysfs functions")
  commit 61ae1321f06c ("arm64: enable generic CPU vulnerabilites support")
  commit 0e3f3649d44b ("riscv: Enable generic CPU vulnerabilites support")

All LoongArch CPUs (not only LS3A5000) implement a special mechanism
in the processor core to prevent "Spectre" and "Meltdown" attacks, so
it can enable generic CPU vulnerabilites support for LoongArch too.

Without this patch, there are no user interfaces of vulnerabilities
to check on LoongArch. The output of those files reflects the state
of the CPUs in the system, the output value "Not affected" means
"CPU is not affected by the vulnerability".

Before:

  # cat /sys/devices/system/cpu/vulnerabilities/spec_rstack_overflow
  cat: /sys/devices/system/cpu/vulnerabilities/spec_rstack_overflow: No such file or directory
  # cat /sys/devices/system/cpu/vulnerabilities/spec_store_bypass
  cat: /sys/devices/system/cpu/vulnerabilities/spec_store_bypass: No such file or directory
  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
  cat: /sys/devices/system/cpu/vulnerabilities/meltdown: No such file or directory

After:

  # cat /sys/devices/system/cpu/vulnerabilities/spec_rstack_overflow
  Not affected
  # cat /sys/devices/system/cpu/vulnerabilities/spec_store_bypass
  Not affected
  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
  Not affected

Link: https://www.loongson.cn/EN/news/show?id=633
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 6d68c5020307..4b02b0492c3b 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -84,6 +84,7 @@ config LOONGARCH
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_DEVICES
+	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_IOREMAP if !ARCH_IOREMAP
-- 
2.42.0

