Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C33563FA
	for <loongarch@lists.linux.dev>; Wed,  1 Jul 2026 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782873480; cv=none; b=uct1K11iWLzFyUm207k3T7jsK3g+b4SVhy55A2BAfsPVxO3FV3qytDJxk6+gCG4DlET5khDp9aCU/gtPNjkjvrq919Q22cusVn40WjjgC0GyO/Yov6Fsujt546SLd9otZjWQ14qSXNQsmYbl0YF1IwmeeAo/LK60b1oPZghWOZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782873480; c=relaxed/simple;
	bh=sJeFtNWNQFWD5DZ7Xw5WSusiBMOujnik7uaGYfOv168=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fB0uR4N1KEBE/7e9KDIVIp1Lj0hvOSHqy6gibm6VP/+0CTcaiK4jnTEtMcAm8tOBSl3yKSh+FAzNV4F+qb69FrDLAEjR2qvdw+AAhbpthdjl2vjQht+m1DJOQuKbNVYK1UriI3vLsb1uk8sUzpcy5EabonNYBBcW+Z+ygX6aTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M8bzV9um; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M8bzV9um"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782873477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pHoh8o/QWhJCzSrJY8JVqppzRvN0Tsw7Zl7f0oT1ZIg=;
	b=M8bzV9umqzFhCszP0S+0qnYrXFPSUkvWrxY/eIhJiNNbhZOUHh6cOiLN1XzaivFQY2W7vu
	EmbSUcq5gJeaRi2SNMNTQigja9xMmkRzhAclTswjz/3AbQPneNlCJKrFE8yf+4Ubv9nMDG
	0ZGmYJpVI5XFc/BEAq72YAZb/K1WltI=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Qiang Ma <maqianga@uniontech.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Kexin Liu <liukexin@kylinos.cn>
Subject: [PATCH v2] LoongArch: kexec: Fix address space mismatch in command line lookup
Date: Wed,  1 Jul 2026 10:37:47 +0800
Message-Id: <20260701023747.56221-1-dongtai.guo@linux.dev>
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
Changes in v2:
- Keep `bootloader` unchanged and copy into a fixed `char head[8]` instead of
  turning `bootloader` into an array just to size the temporary buffer (Huacai).

v1: https://lore.kernel.org/all/20260626105150.362203-1-dongtai.guo@linux.dev/

 arch/loongarch/kernel/machine_kexec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/machine_kexec.c b/arch/loongarch/kernel/machine_kexec.c
index d7fafda1d541..ced49194d9de 100644
--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -57,9 +57,13 @@ int machine_kexec_prepare(struct kimage *kimage)
 					strlen((char *)kimage->arch.cmdline_ptr) + 1);
 		kimage->arch.cmdline_ptr = (unsigned long)KEXEC_CMDLINE_ADDR;
 	} else {
+		char head[8];
+
 		/* Find the command line */
 		for (i = 0; i < kimage->nr_segments; i++) {
-			if (!strncmp(bootloader, (char __user *)kimage->segment[i].buf, strlen(bootloader))) {
+			if (copy_from_user(head, kimage->segment[i].buf, strlen(bootloader)))
+				continue;
+			if (!strncmp(bootloader, head, strlen(bootloader))) {
 				if (!copy_from_user(cmdline_ptr, kimage->segment[i].buf, COMMAND_LINE_SIZE))
 					kimage->arch.cmdline_ptr = (unsigned long)cmdline_ptr;
 				break;
-- 
2.25.1

