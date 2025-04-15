Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFBA292911
	for <loongarch@lists.linux.dev>; Tue, 15 Apr 2025 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731681; cv=none; b=sTF0iAX459nGYisvuVCwFf5Y6usNrkU8ToEsOx7d5NuaO+fC4Gna8dIWbMBreV6t6h7rUv1i1XG9Vsf+/xJ6KYXxbM1mbb30H4hajabSZTqUjIxB2lAmQEetfljFqyobWioC7s9MGvn2fc3/fDvPXW/keyp4h2zLDBzvctt66M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731681; c=relaxed/simple;
	bh=RIMQprOaMirEBmq4bYXyJwMPbqjDbfmXocX7YVUUhR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NgvQtafC1z/FxFjFo3//cbTE1CPMM353b6qe6EePxKp8PUkd/Bj6kpzc8enBgoaBL4PKcPNb6Ss8LC/sVMUqg0HPaDsVRp1999AX38+dvXLr3O1ItGN3o4LxSHDULgkdWnR4GNsBPZU5g/0WXBfiRyNgwO+KKZ97p+M+aHSq/F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OK7R7T9J; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OK7R7T9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744731595;
	bh=8Qch/x4RnWWISFX7nV0atXYll7WBRrT6V0RcYu2bHFI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=OK7R7T9JeRjAqiT2Sr+GwcogQou9mGlZaoHHbPKUrnCb17aLIs0doxDYEslaMNbAn
	 5Y/NIpuPh10Aai5KWI0II9cMlP7yEZ+Z2APzUyjvzGCqnnqsdzo25vuogCnNyCOvLD
	 7fmn2gB1QJEATWyfrcnz41iODsgbmfwWQf75BdQw=
X-QQ-mid: zesmtpip4t1744731550tba7ca3b8
X-QQ-Originating-IP: DIdrXajWP1mMaGitCCLmZtEqYHzin5MEP0I+17gZ9tk=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 23:39:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7574434672748888084
EX-QQ-RecipientCnt: 20
From: WangYuli <wangyuli@uniontech.com>
To: corbet@lwn.net,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: akpm@linux-foundation.org,
	jeffxu@chromium.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	kees@kernel.org,
	wangyuli@uniontech.com,
	hca@linux.ibm.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	xry111@xry111.site,
	tglx@linutronix.de,
	thomas.weissschuh@linutronix.de,
	Jason@zx2c4.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH v2] mseal sysmap: enable LoongArch
Date: Tue, 15 Apr 2025 23:39:03 +0800
Message-ID: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NslKbLmbegaNcZ53P4/UMwDPlveTPJrZRsXTYng7ZoMbPS/jRwUqIEpv
	hYPChDOwYs69jyUOEoLIzgvM28EriAesFp8WGuEnKhEwt2po0eLDY50KhVP+YQWIkrTP9PQ
	0Do+vGhHjpAzX+hpSn4VX9AH34vrBgcF2b+wQ22vY2NZnQaP1EW49tOZAZRKpsVZeTwYKwu
	sojOL4RDr3T3/O82JDvU2OotCcftSyHKx4ng7CHtva7N6/Um3oMbxs1cKk7J/ZI+pTqWd2R
	pgeWu4S2La9Irgsb5byay7PK7GTRoMFZt4XpQZ3pJydwLabqj/aKCx4Kdt8edzlFkBYtp1s
	1CcFmM+9RxNf8V20uj5Dnex5nYrWPgXrJcc5O0ZVe51WJHwPTBLToI8N1hy1pNg8DOXcPUY
	WaZfd+UYfkGSmhLTukhixeCQryBa0CQ1uE3gxzy+qpjWuZCZHDjJMMm7ZT0fmA8x8w28qUU
	KsVSTkkMwhRAyvae3ipy5gpIm9v1t4SdZGCuLdX/kCtfkG6v4plQcRfRmxxriGbM6cf7o6c
	Aiozbd/5G15C5px+KTqHorO6Nliov26wk8LWF9GYow06ocKaX5k7kHj5i3AqsDJFwaVtwto
	4g+CIvN48EzLJvj9t/jsSPguFKS/qrQnsvCcH5JO2I4U4QvGQWzUyU5Ip9MSdlqoEcPpwEE
	s+NbvhQXgMA/j5kYJaVaJsVS1S0Hv3jcTtaAj+LX8/C6BTsjFwIm66tPDMFDwE0yj2R+Kkc
	Pgl4CN2oH2aqv9Y/z+3I/w8kAmj0PxiWVqsmZtJjzs0yPSaHzHXzQEbvmYEm2QsQb8Ac9cu
	tFvRSzT/Tg0I2pGjIKc38QHuPSEYjVUQ1Q0QNvSYfQOyl/vtlEK09c4T+83jBHK/lz4vPr7
	sLsApHV0k0ETolHxb8lTPWL/w06YIWtoltzoEfhUoIopd5WsSxFqBU9bN7Crl6CnGRtI4pt
	UpZsuacAv9uU/hsHcoemD4pixl17zGuc1N85KkBSHOWv+PaYf3vBiMS3i/wkHsuMYEqwUUw
	0qeUEF6tpMu51j2TGeX/vvjNz1uFDdeI5U87GWJwFTLpflSM2gBxXH9TlrwHKsTcunmr4RP
	A==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
covering the vdso.

Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lucifer.local/
Tested-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
---
 .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
 Documentation/userspace-api/mseal.rst                         | 2 +-
 arch/loongarch/Kconfig                                        | 1 +
 arch/loongarch/kernel/vdso.c                                  | 4 +++-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
index c6cab9760d57..a3c24233eb9b 100644
--- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
+++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
@@ -12,7 +12,7 @@
     |       arm64: |  ok  |
     |        csky: |  N/A |
     |     hexagon: |  N/A |
-    |   loongarch: | TODO |
+    |   loongarch: |  ok  |
     |        m68k: |  N/A |
     |  microblaze: |  N/A |
     |        mips: | TODO |
diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index 1dabfc29be0d..ef733f69003d 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -144,7 +144,7 @@ Use cases
   architecture.
 
   The following architectures currently support this feature: x86-64, arm64,
-  and s390.
+  loongarch and s390.
 
   WARNING: This feature breaks programs which rely on relocating
   or unmapping system mappings. Known broken software at the time
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 067c0b994648..54ed5b59a690 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -69,6 +69,7 @@ config LOONGARCH
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 10cf1608c7b3..7b888d9085a0 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	vdso_addr = data_addr + VVAR_SIZE;
 	vma = _install_special_mapping(mm, vdso_addr, info->size,
-				       VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
+				       VM_READ | VM_EXEC |
+				       VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
+				       VM_SEALED_SYSMAP,
 				       &info->code_mapping);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.49.0

