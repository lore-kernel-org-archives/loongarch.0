Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FB6111A1
	for <loongarch@lists.linux.dev>; Tue, 14 May 2024 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715672356; cv=none; b=BDV98dWcbkYMEPMDysuOOBGfRH9GrYMJwOl+0xHmIOG50/tk+RYH0tCki4sBzcrI84KEU56OQI0Evfg/+zS4oj1ImTnhxqGmMO4j11EempON5r+nw9St7eTlCdK57j+glb7QO3xrf3M75eiO/3wHp3F6dKMK3Ia6rkcxfybV2VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715672356; c=relaxed/simple;
	bh=7RAGXY4sLohtmwWbWlvhD+SLa6yi22UHexVRHIyXu9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=smsMCn5jPWRZIwtWQWUNHvlgmU11BKnq3qasisoLgR3eM6lctZAIkaxBqNgepFKlsWLOZT5pS6Tj7qstJrd7Xho3m7rdAPl8P5q8CcnqpWYQtBBV08W1NcNi05yt7DXRDaAo+0dR07EDAJgmI8RcVGvBcG9Hj4SvNA9wDoxAU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxtOofFUNmAZMMAA--.18351S3;
	Tue, 14 May 2024 15:39:11 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxgFUfFUNmryEeAA--.37058S2;
	Tue, 14 May 2024 15:39:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	rafael@kernel.org
Cc: loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] LoongArch: Remove ACPI related ifdefs in platform_init()
Date: Tue, 14 May 2024 15:39:10 +0800
Message-ID: <20240514073910.27048-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxgFUfFUNmryEeAA--.37058S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7urW7uw1kuryDJr1DtF4rCrX_yoW8CFyUpr
	yFyr4DKr15u3s7G3yUA3s5urZ8JrnIk34fXFW0kryfCws8urykXF4vgF9xZF1rXws7KF4S
	va4Sg3WagFW0kwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j8yCJUUUUU=

acpi_table_upgrade() and acpi_boot_table_init() are defined as
empty function under !CONFIG_ACPI_TABLE_UPGRADE and !CONFIG_ACPI
in include/linux/acpi.h, there are no implicit declaration errors
with various configs. Furthermore, CONFIG_ACPI is always set due
to config ACPI is selected by config LOONGARCH. Thus, just remove
ACPI related ifdefs to call the functions directly.

  #ifdef CONFIG_ACPI_TABLE_UPGRADE
  void acpi_table_upgrade(void);
  #else
  static inline void acpi_table_upgrade(void) { }
  #endif

  #ifdef	CONFIG_ACPI
  ...
  void acpi_boot_table_init (void);
  ...
  #else	/* !CONFIG_ACPI */
  ...
  static inline void acpi_boot_table_init(void)
  {
  }
  ...
  #endif	/* !CONFIG_ACPI */

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

Another way is to guard the related code under CONFIG_ACPI,
but I think it is not necessary, like this:

@@ -351,10 +351,8 @@ void __init platform_init(void)
        arch_reserve_vmcore();
        arch_reserve_crashkernel();
 
-#ifdef CONFIG_ACPI_TABLE_UPGRADE
-       acpi_table_upgrade();
-#endif
 #ifdef CONFIG_ACPI
+       acpi_table_upgrade();
        acpi_gbl_use_default_register_widths = false;
        acpi_boot_table_init();
 #endif

 arch/loongarch/kernel/setup.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 60e0fe97f61a..da96f871cf73 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -351,13 +351,9 @@ void __init platform_init(void)
 	arch_reserve_vmcore();
 	arch_reserve_crashkernel();
 
-#ifdef CONFIG_ACPI_TABLE_UPGRADE
 	acpi_table_upgrade();
-#endif
-#ifdef CONFIG_ACPI
 	acpi_gbl_use_default_register_widths = false;
 	acpi_boot_table_init();
-#endif
 
 	early_init_fdt_scan_reserved_mem();
 	unflatten_and_copy_device_tree();
-- 
2.42.0

