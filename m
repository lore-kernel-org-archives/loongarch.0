Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D25492E28
	for <loongarch@lists.linux.dev>; Tue,  8 Sep 2026 23:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908986; cv=none; b=I7r6RDMoSh+AaXSyKg8WTG2Kr/pVC7z5q1id3975pYM+l2GVAmEs+L48Ozx/t6QiFwk0fFKE6xbYHsM1mJnw4yBEewp34D5QFSnDhT5gr7/VkybWz4GJJWrF1tAHfKWsjjX7DeB4dcHCwg0wHEqDC3+3lOP3nL4Y6yTwH5EcHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908986; c=relaxed/simple;
	bh=atrQOTjrNgABMsK63b7+x9nwBtP4l6gXo/MfCfGKi4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FDksYgdNqn9ufFI9EMWbWSoZAHCyWtCQ7VxXybjwU2ouDzetEo1bF5HqNL+joizNT40kD9DxQJaJjwB58rogTRBp25p6sb0qpZZc2B61MG9N7wWIW7KG+j6fHKuRiwVOlYxZXnwYQp36s824QJWmE6XN16gWq1Mr/uxwedysMog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsByHBTF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsByHBTF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso50423395e9.3
        for <loongarch@lists.linux.dev>; Tue, 08 Sep 2026 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908982; x=1789513782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=DsByHBTFlQjhVqQWv9O1BnI8Qxq28NII8rbANqhKWsAhr7nKh9dojVyQB1WEahTkdz
         KsvfcqqEr/YLbTp823LJ9A+akOnEQ/nSM4zLxLlGF/vpKJxXN8E4vBLl0Zrow9/XZQIg
         c54xrGuCJ7bYROGmSXn5kJP2FflWD4210M2WbaigO5FoQCX1Zi+VpK18Jux2X3yoPAdh
         UZUm/oEaEicGmidY0zrvFh71H7FU4q5vOdIBCpqRC/YgCY1z58KLrEQLVXW9T1sSVdNa
         i7i7y4QWy+uL5e/jMYgk3dBivgF60170hPwRd8Nq2Hr9bC7xATgRdksmo6xbW5zll9OV
         5qQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908982; x=1789513782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=TjCR+HdWzV0J5PDEaLfWAqaAAkhjS35qRUoojPYVB9gGPxBlqyb7gIio3KUnkhIA3M
         kDysZAtMsUubIrgwo9w0z59ZmGnQdBHdef/7Piy6oqyOrCQXCF0zTli4FZv9e/I7+ILA
         U07n3er7HefOR0GTvv4Jo4Th1C8uxgB9miPm17SZvzA0RhOE6ERBgJiPowcpyG9wjQBi
         sJ/u8UqfG8TvZjH1pVFWqrxGTrIRMHgEGORcFAxCJT829uw8WQfx2nsWUrWD5aTyFDrU
         FRa5xAdEznBhEOTeDq9vjRF0wxMFV/1OnfWw1JrsTyDEgXSXscFLI07Z6iTeqP2IUbJv
         XUFA==
X-Forwarded-Encrypted: i=1; AKwUvBzFtYaxnwQg9tw3+hezRRchg83s0XC6R4gFaM8MdR2+muTleCmH8+hjjYvEBRAoWfEIAy4Z4t0IrlI=@lists.linux.dev
X-Gm-Message-State: AFuF++kp5ocu7YrLKVAr0ENlcTOcu4/IjErEPPUT++1h3HIGyCSe+dPD
	/C0PP4nyukU+6GcUXygac9Wp9NFkgrALrsQVpfNyn1B7y8+JhRiIWK4y
X-Gm-Gg: AYBFou2XtlNgwTWcXga2e1c/oQzQeysrBlWBtEmFOjVK1yNiOeXb+mot+Q1Wz0l+Ipn
	VsYQ0M4BJI1ycV5IwPsdl9ewFR/hcHVWooTvli8SkrVzEM2/aKt4Ok582sVBSP52qVJflK2pklv
	u/nQ9NQs264L7W4r8Wef3ZC0pftURM9uLDE3egxXPReMKveZ9Fz7oD3bGz7TZ3o03KOflIJb/C+
	+e3c0F6Ze2UT/O+4aV5XqHvYXiShvntcasg5NqlDPhKf2hL4dsRuyTVnfS81sXk5LmNgQiGoucS
	PK6xgvuPfDoAYpmZo4sQ0/7MtuWuE87k1pOyDv3heeoMT+dak5VamtaU1OpOt43VG5Dj36+MR/A
	kb6F9O3Jjkqj/kKMzwxLIJN/Nwwm4ibA4xiCS7Z/Z4uukShLb3ZRyO30mqHMYP34bMwTK5txEQT
	IRkbuK1XPbmEHFgWKbmtpOri4v+qT5EL1gMTm/WZZbu2ZaH1X/vL74agRNiHQ2f1vqNw+8I+fEJ
	dYfBI5rzTwSbyPSh5H5B8rz+L5+OICmk15E7pNQ2VxHUFBdnxQPVguuTmxwiCqzBmH/Mi360xzA
	4qkDWkvIoPJ7iGPLKlvIa6TdKg==
X-Received: by 2002:a05:600c:348a:b0:49c:fa20:cc03 with SMTP id 5b1f17b1804b1-49cfa20ccedmr254595975e9.26.1788908982187;
        Tue, 08 Sep 2026 16:09:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm385530905e9.3.2026.09.08.16.09.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 16:09:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nicolas Pitre <nico@fluxnic.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-modules@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] module: reject out-of-range relocation target indices
Date: Wed,  9 Sep 2026 01:08:15 +0200
Message-Id: <20260908230815.78409-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apply_relocations() skips relocation sections whose sh_info target index
is outside the section table. ARM, ARM64, LoongArch, PA-RISC and RISC-V
use sh_info earlier in module_frob_arch_sections(), before this check.

ARM, ARM64, LoongArch and RISC-V use the unchecked index to read
sh_flags outside the section header table. PA-RISC uses it to index an
e_shnum-sized heap array for a read and an update. QEMU reproduced
page-fault Oopses on ARM, ARM64, LoongArch and RISC-V, and a Data TLB
miss on the PA-RISC array read.

Validate sh_info for SHT_REL and SHT_RELA sections in
elf_validity_cache_sechdrs(). Reject the module with ENOEXEC before
architecture code can use the index.

Fixes: c298be74492b ("parisc: fix module loading failure of large kernel modules")
Fixes: 7d485f647c1f ("ARM: 8220/1: allow modules outside of bl range")
Fixes: fd045f6cd98e ("arm64: add support for module PLTs")
Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
Fixes: fcdfe9d22bed ("LoongArch: Add ELF and module support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

A custom harness for upstream Frama-C 33.0 (Arsenic) Eva found the
ARM32 instance in a source-identical ARM module_frob_arch_sections()
slice. Eva reported the out-of-range section-table pointer and sh_flags
access.

The analysis and ARM32 A/B test ran at Linux b9b3e33b70b7 ("Merge tag
'trace-v7.2-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"). The
PA-RISC, ARM64, RISC-V, LoongArch and x86_64 A/B tests ran at the
declared base commit, 28924df2a08f. arch/arm/kernel/module-plts.c and
the touched loop in kernel/module/main.c are identical between the two
commits.

Each A/B test changed only a relocation section's sh_info to
0x10000000. The same configurations and modules were used before and
after the change. All controls loaded before and after the change. The
fixed kernels rejected the malformed modules with ENOEXEC.

Original-kernel results with QEMU 10.2.1 TCG:

- ARM32, virt/Cortex-A15, GCC 15.2.0, multi_v7_defconfig plus
  VMSPLIT_2G: page fault at module_frob_arch_sections()+0x160.
- ARM64, virt/Cortex-A57, GCC 15.2.0, defconfig: page fault at
  module_frob_arch_sections()+0x110.
- PA-RISC, B160L, hppa-linux-gcc 8.1.0, binutils 2.30,
  generic-32bit_defconfig: Data TLB miss at
  module_frob_arch_sections()+0x11c on the stub_entries read for a
  counted R_PARISC_PCREL17F relocation.
- RISC-V, virt, GCC 15.2.0, defconfig plus RELOCATABLE with
  MODULE_SECTIONS enabled: page fault at
  module_frob_arch_sections()+0xe4.
- LoongArch, virt/LA464, LLVM 21.1.8, loongson64_defconfig: page fault
  at module_frob_arch_sections()+0x1b8.

On x86_64, which has no vulnerable early sh_info access, the original
kernel loaded both modules. The fixed kernel loaded the control and
rejected the malformed module with ENOEXEC. The test used pc/qemu64,
x86_64_defconfig and GCC 15.2.0.
---
 kernel/module/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d0e1e0bd2ad0..30c7a05488bc 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1933,6 +1933,7 @@ static int elf_validity_ehdr(const struct load_info *info)
  * * Section array fits in the user provided data
  * * Section index 0 is NULL
  * * Section contents are inbounds
+ * * Relocation section target indices are inbounds
  *
  * Then updates @info with a &load_info->sechdrs pointer if valid.
  *
@@ -1983,6 +1984,12 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 	/* Validate contents are inbounds */
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &sechdrs[i];
+		if ((shdr->sh_type == SHT_REL || shdr->sh_type == SHT_RELA) &&
+		    shdr->sh_info >= info->hdr->e_shnum) {
+			pr_err("Invalid ELF relocation section target index %u\n",
+			       shdr->sh_info);
+			return -ENOEXEC;
+		}
 		switch (shdr->sh_type) {
 		case SHT_NULL:
 		case SHT_NOBITS:

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.53.0
