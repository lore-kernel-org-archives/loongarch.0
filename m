Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FE02D5936
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410038; cv=none; b=qm/Hw1uur9TAeGlLRelsbWGtjjZDAa7Atpy5LBObbdbk1TgtlcUEnSptxMpIK/SstnIt66fR0n9GlM+fpbtEOHO99bhKHv8e0Oi8yo1AEit3t7paC2AgmodvL3SSQL9j6zRWORf6c7kvjzKMjubd+BweS3Zfb1ViGTJydwIKycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410038; c=relaxed/simple;
	bh=nIFaynFcEbl7rcXVOS3FG8O9m5LAgsOVRJWqjgbAzcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoAVxVcBas7o3geyQdz0F5inKbpPgc0H2t4+WILM9Pq6Yhy5ZfyB2E8BfiGcV0Jz3EkA3MJfzlEYLNBNNGWDMN94sLFzqKF4hJkNIJL63cyPb58H+AVybfH8xatGmQVjoNegrzb1hR6Y2gf6hoqZnpIO5HfQ6ZoHxRhQZ6qRjZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxXNLw8r9ooE8IAA--.17606S3;
	Tue, 09 Sep 2025 17:27:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxbMHr8r9oeuSJAA--.56108S4;
	Tue, 09 Sep 2025 17:27:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	rust-for-linux@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] LoongArch: Handle jump tables option for RUST
Date: Tue,  9 Sep 2025 17:27:07 +0800
Message-ID: <20250909092707.3127-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250909092707.3127-1-yangtiezhu@loongson.cn>
References: <20250909092707.3127-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxbMHr8r9oeuSJAA--.56108S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxZF47Gw1fKF48JFWDKryDArc_yoW5Zr1Upw
	nruas5tr4rGF1kt39xJayUWr45Jrnxtw17XF4xG348Ar47Z34UZr4vqr9rXFyUAwsxu3yS
	qryrKrW3KFWUC3XCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUqUUUUU

When compiling with LLVM and CONFIG_RUST is set, there exist objtool
warnings in rust/core.o and rust/kernel.o, like this:

    rust/core.o: warning: objtool:
_RNvXs1_NtNtCs5QSdWC790r4_4core5ascii10ascii_charNtB5_9AsciiCharNtNtB9_3fmt5Debug3fmt+0x54:
sibling call from callable instruction with modified stack frame

For this special case, the related object file shows that there is no
generated relocation section '.rela.discard.tablejump_annotate' for the
table jump instruction jirl, thus objtool can not know that what is the
actual destination address.

If the rustc has the option "-Cllvm-args=--loongarch-annotate-tablejump",
pass the option to enable jump tables for objtool, otherwise it should
pass "-Zno-jump-tables" to keep compatibility with older rustc.

How to test:

  $ rustup component add rust-src
  $ make LLVM=1 rustavailable
  $ make ARCH=loongarch LLVM=1 clean defconfig
  $ scripts/config -d MODVERSIONS \
    -e RUST -e SAMPLES -e SAMPLES_RUST \
    -e SAMPLE_RUST_CONFIGFS -e SAMPLE_RUST_MINIMAL \
    -e SAMPLE_RUST_MISC_DEVICE -e SAMPLE_RUST_PRINT \
    -e SAMPLE_RUST_DMA -e SAMPLE_RUST_DRIVER_PCI \
    -e SAMPLE_RUST_DRIVER_PLATFORM -e SAMPLE_RUST_DRIVER_FAUX \
    -e SAMPLE_RUST_DRIVER_AUXILIARY -e SAMPLE_RUST_HOSTPROGS
  $ make ARCH=loongarch LLVM=1 olddefconfig all

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://lore.kernel.org/rust-for-linux/CANiq72mNeCuPkCDrG2db3w=AX+O-zYrfprisDPmRac_qh65Dmg@mail.gmail.com/
Suggested-by: WANG Rui <wangrui@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/Kconfig  | 4 ++++
 arch/loongarch/Makefile | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index f0abc38c40ac..57933a717e92 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -298,6 +298,10 @@ config AS_HAS_LVZ_EXTENSION
 config CC_HAS_ANNOTATE_TABLEJUMP
 	def_bool $(cc-option,-mannotate-tablejump)
 
+config RUSTC_HAS_ANNOTATE_TABLEJUMP
+	depends on RUST
+	def_bool $(rustc-option,-Cllvm-args=--loongarch-annotate-tablejump)
+
 menu "Kernel type and options"
 
 source "kernel/Kconfig.hz"
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 9d80af7f75c8..b26d47707031 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -106,6 +106,12 @@ KBUILD_CFLAGS			+= -mannotate-tablejump
 else
 KBUILD_CFLAGS			+= -fno-jump-tables # keep compatibility with older compilers
 endif
+ifdef CONFIG_RUSTC_HAS_ANNOTATE_TABLEJUMP
+# Pass '--loongarch-annotate-tablejump' via '-Cllvm-args' to rustc when RUST is enabled.
+KBUILD_RUSTFLAGS		+= -Cllvm-args=--loongarch-annotate-tablejump
+else
+KBUILD_RUSTFLAGS		+= -Zno-jump-tables # keep compatibility with older compilers
+endif
 ifdef CONFIG_LTO_CLANG
 # The annotate-tablejump option can not be passed to LLVM backend when LTO is enabled.
 # Ensure it is aware of linker with LTO, '--loongarch-annotate-tablejump' also needs to
-- 
2.42.0

