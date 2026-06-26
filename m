Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1AD3E832C
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470329; cv=none; b=CRRgHD5uN0I3Ptq/XF/aSX67qzLpEnzC1IrhM2fLN2flLSdjHKAcEVqvgMstoU3GSLvE8r/eVmteGAnDgPdLLybgHfv+IGvsoKPxeQP/X5B9wgWW1XVwUFR4vTaesxlbgl+ZFDp2yNwE3Sx/MHwPSlJOWHmw1h+7blAns1jij3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470329; c=relaxed/simple;
	bh=d21F/jmMXz8n7tddwFZnpU9mN2PUUWdKMgoFTpQINnU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jbLF81rszS8xNtwEz4bWHcLl30iIEhsP82xSeOolFMOojNiCJM3qtaw+O7JCOVFlxwloKq71XY2LzIfWXyQUN7Gdd4pKHj5jGq2dIcIuxOgM2HVsxn1EZUvauxmTgxv/zRsG9ZzjbJ+XdAneaHG0CmVEsX7yXffcjsX2AYVIrVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VFZxB0NK; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VFZxB0NK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782470324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HWktgbq7NgGGnrTybk5KiUwxIP14lnbdKeXbMxrkJ18=;
	b=VFZxB0NK4gDXBNFmAR8CZaBKyj6pd2xcLQYfQ5Fn5yvaLUVp/IetpcjsxT/3LBnSegGWkp
	VJjtzydSbfPq4nQiJO8pDzb3gMxwkgGEoW/TrZZx1cEEJ7tZBIRYh2k6A+0lgROecb6w3b
	QvhhsxUAo76kAhh9zdarq1+CCsSlvnI=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Qiang Ma <maqianga@uniontech.com>,
	Kexin Liu <liukexin@kylinos.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: kexec: Fix address space mismatch in command line lookup
Date: Fri, 26 Jun 2026 18:38:35 +0800
Message-Id: <20260626103835.353818-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

When searching the loaded segments for the "kexec" command line marker,
the kexec_load(2) path (file_mode == 0) passes the user-space segment
buffer straight to strncmp() through a bogus (char __user *) cast. This
dereferences a user pointer in kernel context, which is wrong and is
flagged by sparse:

  arch/loongarch/kernel/machine_kexec.c:84:51: sparse: incorrect type in
  argument 2 (different address spaces) @@ expected char const * @@ got
  char [noderef] __user *

Copy the marker-sized prefix of each segment into a small on-stack
buffer with copy_from_user() before comparing, and skip segments that
fault. The subsequent copy_from_user() that stages the full command line
into the safe area is left unchanged.

Fixes: 4a03b2ac06a5 ("LoongArch: Add kexec support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605051639.aEPioXdD-lkp@intel.com/
Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/kernel/machine_kexec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index d7fafda1d541..6f563175ddbf 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -42,7 +42,7 @@ static unsigned long first_ind_entry;
 int machine_kexec_prepare(struct kimage *kimage)
 {
 	int i;
-	char *bootloader = "kexec";
+	static const char bootloader[] = "kexec";
 	void *cmdline_ptr = (void *)KEXEC_CMDLINE_ADDR;
 
 	kimage->arch.efi_boot = fw_arg0;
@@ -57,9 +57,13 @@ int machine_kexec_prepare(struct kimage *kimage)
 					strlen((char *)kimage->arch.cmdline_ptr) + 1);
 		kimage->arch.cmdline_ptr = (unsigned long)KEXEC_CMDLINE_ADDR;
 	} else {
+		char tmp[sizeof(bootloader)];
+
 		/* Find the command line */
 		for (i = 0; i < kimage->nr_segments; i++) {
-			if (!strncmp(bootloader, (char __user *)kimage->segment[i].buf, strlen(bootloader))) {
+			if (copy_from_user(tmp, kimage->segment[i].buf, strlen(bootloader)))
+				continue;
+			if (!strncmp(bootloader, tmp, strlen(bootloader))) {
 				if (!copy_from_user(cmdline_ptr, kimage->segment[i].buf, COMMAND_LINE_SIZE))
 					kimage->arch.cmdline_ptr = (unsigned long)cmdline_ptr;
 				break;
-- 
2.25.1

