Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354741FC8
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 01:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756171098; cv=none; b=OPVAJh5nABYhDFcebLDz3PxAf1tBOzhJEGvFvojco+G3eHNXA4jAtR8glUVXF3zHd/jo0d21G4SNQnSRVD4nAFLObVpcl2Edqkm7AjjR7Ufzhy7HsdXFuuebgPA1rFG94fJulgfs/yNRvpfSrc6xibNmYhB4TZ6yCetiCb2CptI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756171098; c=relaxed/simple;
	bh=pFERUv+q1Pvz6t8Bjs/RczTmneUUEdtrsHsfMjbdmII=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bruo++N/MFlX29lY3KV49EgogGxyLWcieIEIOXEQ/SnkDCd8kXKA7OxPnd4MWOgdtpPv+s7bOYPcspFZFsJ8VfSFsH/n4CGLz+7X1D8zVs5LZYXBS45/QnDMpWTzYxOF4NLVEqihNozWSsI66047S4movGX79Wt2EiTwX1p3Hjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WzxTJYS3; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WzxTJYS3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756171092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=icSZngVaYlgp/7EJ4VaqjMZtnrg108Igob7ePxAT3/k=;
	b=WzxTJYS3m7yQhP551w9/Kg/ePr9rPszSJrbq63hWnz8jSZTHYCTw4ATmLzfqCyBpyRHZ1o
	n9Hv9lC0YbiKeUsUN9ie+RSsp8zDTeJloTZc1wGbs9tCeSZHCmLHlgLbPjoXaDY21K/SCs
	LlW+CDAM18EYD5nHCCrJLx7QgM7wHjc=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Baoquan He <bhe@redhat.com>,
	Yao Zi <ziyao@disroot.org>,
	kexec@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v3 0/6] Add kexec_file support for LoongArch
Date: Tue, 26 Aug 2025 09:17:16 +0800
Message-Id: <20250826011722.82391-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

This patchset implement kexec_file_load() support on LoongArch.

This patch series enables us to load the LoongArch vmlinuz.efi(pez) or
vmlinux.efi(pei) or vmlinux(elf) by specifying its file decriptor,
instead of user-filled buffer via kexec_load() syscall.

To use kexec_file_load() system call, instead of kexec_load(), at kexec
command, '-s' options must be specified. kexec-tools needs to apply the
corresponding patches. These patches can be found in repository [1] and
will be submitted to the kexec-tools community later.

The basic usage of kexec_file is:
1) Load second kernel image:
 # kexec -s -l vmlinuz.efi --initrd=initrd.img --reuse-cmdline

2) Startup second kernel:
 # kexec -e

For kdump:
1) Load capture kernel image:
 # kexec -s -p vmlinuz.efi --initrd=initrd.img --reuse-cmdline

2) Do something to crash, like:
 # echo c > /proc/sysrq-trigger

Link:
[1] https://github.com/tangyouling/kexec-tools/commits/main/

Changelog:
 v3:
 * The ELF format kernel loading should not use loongarch_image_header. 
 * Separate patch2 into an infrastructure patch and an EFI support
   patch.
 * Adding that kexec_file cannot load non-relocation kernel comments.
 * Some minor modifications.

 v2:
 * Merge some patches.
 * Add support for ELF format images.
 * Rename kexec_image.c to kexec_efi.c .
 * When KEXEC_FILE is enabled, RELOCATABLE is selected by default.
 * Some minor modifications.

Youling Tang (6):
  LoongArch: Add struct loongarch_image_header for kernel image
  LoongArch: Add preparatory infrastructure for kexec_file
  LoongArch/kexec_file: Support loading EFI binary file
  LoongArch/kexec_file: Support loading ELF binary file
  LoongArch/kexec_file: Add crash dump support
  LoongArch: Enable CONFIG_KEXEC_FILE

 arch/loongarch/Kconfig                     |  10 +
 arch/loongarch/configs/loongson3_defconfig |   1 +
 arch/loongarch/include/asm/image.h         |  57 +++++
 arch/loongarch/include/asm/kexec.h         |  13 ++
 arch/loongarch/kernel/Makefile             |   1 +
 arch/loongarch/kernel/kexec_efi.c          | 114 ++++++++++
 arch/loongarch/kernel/kexec_elf.c          | 105 +++++++++
 arch/loongarch/kernel/machine_kexec.c      |  37 ++--
 arch/loongarch/kernel/machine_kexec_file.c | 235 +++++++++++++++++++++
 9 files changed, 560 insertions(+), 13 deletions(-)
 create mode 100644 arch/loongarch/include/asm/image.h
 create mode 100644 arch/loongarch/kernel/kexec_efi.c
 create mode 100644 arch/loongarch/kernel/kexec_elf.c
 create mode 100644 arch/loongarch/kernel/machine_kexec_file.c

-- 
2.43.0

