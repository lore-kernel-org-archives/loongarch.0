Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9AA37188A
	for <loongarch@lists.linux.dev>; Fri, 26 Jun 2026 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782471143; cv=none; b=A6Mk12qXAe6Z69EXuMvCX7O/BC7VCEXpSKFY9X/hoaCT37a7olz4mqo7IGNszlYV0VZgT0EptP6O4hXjA/AYrwTcKxecJDCO9nWTA7iquBBU6h5kX9DeaKGYvsjtqB8UOmb2NQRGDdjQoW6pdN8nvXYPHn5m5ufjHJgnkTAKtws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782471143; c=relaxed/simple;
	bh=d21F/jmMXz8n7tddwFZnpU9mN2PUUWdKMgoFTpQINnU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BE/Wfk1noL99PqqfCVZvviCeGnP6rRsKscKHh6fL7AEXD3Wcgpvqt2J4ufPAlK24Tw/O37gKop319HmEcfm3bdECXtcbhOGOsHN0ro0QyhjtU1UE2KyIPE3H0Ll18BuifNzU0J34Vh8gdZdDsirgrYHtCLktOjx950FDpWIw0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DUozc7xv; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DUozc7xv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782471139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HWktgbq7NgGGnrTybk5KiUwxIP14lnbdKeXbMxrkJ18=;
	b=DUozc7xvrlQColszuVMe2wf8lEvRUo6ixF+YdsKzpLmeoCd4SzX5BwWKOaTgpXD5je0HWt
	c9MchlS1i1WtDSXqFlNjkbrHRUVI95MEP2X7Mgx+cr+iwivxglR1Ll0q091SeVaQaePCqj
	f541jfdlTjqu/ViaSOjAVcNA71yuj80=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Qiang Ma <maqianga@uniontech.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH] LoongArch: kexec: Fix address space mismatch in command line lookup
Date: Fri, 26 Jun 2026 18:51:50 +0800
Message-Id: <20260626105150.362203-1-dongtai.guo@linux.dev>
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

