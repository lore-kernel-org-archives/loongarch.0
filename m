Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F0034F25C
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360035; cv=none; b=GtKyJh0zYe9JVoznypfIiPiBy5z6Y1m0/V/+e0G03CliR2LFayS8vIjyz6s61A9pz6C60TnpmIu7rtGlGGghHtdW8gSdkctiYTavJH3tCflc6bxVWe8elNna8aZYD0+aenm0+zhrzhXG8Kxx3C7d76WBEHbStZXsCAhnfRdCe/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360035; c=relaxed/simple;
	bh=2CTuU4oiXQOvsHlVLwqRCBXKVKHgt+gWjE2FrmfVP/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1DHCCavOXw/P1/hdEoHs7iERGLhfY3GmUCrKEjjHQCDfbpn1rt0IjMMxNp1l1eydRoM2En3jnGi2LRL4txMUQ2d0Ayo+jHOEwbYgYawrVnPKIc/8Wg74pcflu8Ywb4QyJCxTD1u/pfHETXyoqWrMPderyJkt6dzTFyScrby1mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.8])
	by gateway (Coremail) with SMTP id _____8AxVumgXPBp2KcEAA--.9861S3;
	Tue, 28 Apr 2026 15:07:12 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.8])
	by front1 (Coremail) with SMTP id qMiowJCxNMCaXPBpymN2AA--.4948S2;
	Tue, 28 Apr 2026 15:07:09 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] LoongArch: Specify -m32/-m64 explicitly for 32BIT/64BIT
Date: Tue, 28 Apr 2026 15:06:58 +0800
Message-ID: <20260428070658.1740856-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxNMCaXPBpymN2AA--.4948S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWftr1DWw1rurWktw47trc_yoW8Ar17p3
	yS9a1kGw4kWrWkKr97J3sxXr4DtrnrKr4a9ay5ZFWUAFy8Zw1Uur4xtrZ8XF1DGw1kA3yI
	qr93KFyaq3WUXwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxUc-eODUUUU

Clang/LLVM build needs -m32/-m64 to switch triple variants (i.e. the
--target=xxx parameter). Otherwise we get build errors for CONFIG_32BIT.

GCC doesn't support -m32/-m64 now, but maybe support in future, so use
cc-option to specify them.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604232041.ESJDwVG4-lkp@intel.com/
Suggested-by: Nathan Chancellor <nathan@kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/Makefile      | 2 ++
 arch/loongarch/vdso/Makefile | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 47516aeea9d2..54fcfa1eac1f 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -55,9 +55,11 @@ endif
 ifdef CONFIG_32BIT
 tool-archpref		= $(32bit-tool-archpref)
 UTS_MACHINE		:= loongarch32
+cflags-y		+= $(call cc-option,-m32)
 else
 tool-archpref		= $(64bit-tool-archpref)
 UTS_MACHINE		:= loongarch64
+cflags-y		+= $(call cc-option,-m64)
 endif
 
 ifneq ($(SUBARCH),$(ARCH))
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 42aa96249828..9c9181bb4071 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -12,6 +12,8 @@ obj-vdso-$(CONFIG_GENERIC_GETTIMEOFDAY) += vgettimeofday.o
 ccflags-vdso := \
 	$(filter -I%,$(KBUILD_CFLAGS)) \
 	$(filter -E%,$(KBUILD_CFLAGS)) \
+	$(filter -m32,$(KBUILD_CFLAGS)) \
+	$(filter -m64,$(KBUILD_CFLAGS)) \
 	$(filter -march=%,$(KBUILD_CFLAGS)) \
 	$(filter -m%-float,$(KBUILD_CFLAGS)) \
 	$(CLANG_FLAGS) \
-- 
2.52.0

