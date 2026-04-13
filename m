Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444B33EB13;
	Mon, 13 Apr 2026 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776081144; cv=none; b=NBJZUNL2ybKJGkWW36zS+VcnJdvO01YzKCji7a1juzyO2NaBycLq4hIQW/SosuVRG+czJONRvw30yqe7sgYnx82/B33MKdLdxpSdIF2v3AfU7/cA1iV8y6ATeXTNosDH3FBIBNrAiFV6VLL4FclN1ri0kQRj1T5/tBmh36eodZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776081144; c=relaxed/simple;
	bh=eRwcGs2EX///Ot1O0jD8R/I4gqB2MhFaBv5TfbRxSQk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=AeFVguvK8575B+bnAIldjnvUi46EQ4QnTFZh6WHlOsAyoNwt9WIi+/W7hhN+aBMoF3aOVLmgYtRf3HqlA3kWZiDVmhHZEG931hLsAvJVxsYNRJP0/EB65xxLBy3h6txP+AZBoun7/ZtpLJrnyczdoWrPU1vX8Ti2Nz4nAHk5na4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k6REadS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k6REadS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFFCC116C6;
	Mon, 13 Apr 2026 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776081144;
	bh=eRwcGs2EX///Ot1O0jD8R/I4gqB2MhFaBv5TfbRxSQk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=k6REadS1ZkuDjC7Ti88YakK0H88cGNYr7BO4w3c48frCo0B6QQk4qwpBcuKi9+C3k
	 PoUkXKKbYuGAeCTJZVJVByop69c/F02AvxSn7eNFevuQkIZ++JwvEdLafeLnpYeK5+
	 ETlS8/cTzUtcb+ozBZ++GzMFbJ3zc0Oexhm0quIo=
Subject: Patch "LoongArch: Handle percpu handler address for ORC unwinder" has been added to the 6.12-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org,yangtiezhu@loongson.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 13 Apr 2026 13:52:22 +0200
In-Reply-To: <20260413023647.1368051-1-chenhuacai@loongson.cn>
Message-ID: <2026041322-pauper-vigorous-c43d@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    LoongArch: Handle percpu handler address for ORC unwinder

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-handle-percpu-handler-address-for-orc-unwinder.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-235878-greg=kroah.com@vger.kernel.org Mon Apr 13 04:37:07 2026
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Mon, 13 Apr 2026 10:36:47 +0800
Subject: LoongArch: Handle percpu handler address for ORC unwinder
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20260413023647.1368051-1-chenhuacai@loongson.cn>

From: Tiezhu Yang <yangtiezhu@loongson.cn>

[ Upstream commit 055c7e75190e0be43037bd663a3f6aced194416e ]

After commit 4cd641a79e69 ("LoongArch: Remove unnecessary checks for ORC
unwinder"), the system can not boot normally under some configs (such as
enable KASAN), there are many error messages "cannot find unwind pc".

The kernel boots normally with the defconfig, so no problem found out at
the first time. Here is one way to reproduce:

  cd linux
  make mrproper defconfig -j"$(nproc)"
  scripts/config -e KASAN
  make olddefconfig all -j"$(nproc)"
  sudo make modules_install
  sudo make install
  sudo reboot

The address that can not unwind is not a valid kernel address which is
between "pcpu_handlers[cpu]" and "pcpu_handlers[cpu] + vec_sz" due to
the code of eentry was copied to the new area of pcpu_handlers[cpu] in
setup_tlb_handler(), handle this special case to get the valid address
to unwind normally.

Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V2: Add upstream commit ID.

 arch/loongarch/include/asm/setup.h |    3 +++
 arch/loongarch/kernel/unwind_orc.c |   16 ++++++++++++++++
 2 files changed, 19 insertions(+)

--- a/arch/loongarch/include/asm/setup.h
+++ b/arch/loongarch/include/asm/setup.h
@@ -7,6 +7,7 @@
 #define _LOONGARCH_SETUP_H
 
 #include <linux/types.h>
+#include <linux/threads.h>
 #include <asm/sections.h>
 #include <uapi/asm/setup.h>
 
@@ -14,6 +15,8 @@
 
 extern unsigned long eentry;
 extern unsigned long tlbrentry;
+extern unsigned long pcpu_handlers[NR_CPUS];
+extern long exception_handlers[VECSIZE * 128 / sizeof(long)];
 extern char init_command_line[COMMAND_LINE_SIZE];
 extern void tlb_init(int cpu);
 extern void cpu_cache_init(void);
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -359,6 +359,22 @@ static inline unsigned long bt_address(u
 {
 	extern unsigned long eentry;
 
+#if defined(CONFIG_NUMA) && !defined(CONFIG_PREEMPT_RT)
+	int cpu;
+	int vec_sz = sizeof(exception_handlers);
+
+	for_each_possible_cpu(cpu) {
+		if (!pcpu_handlers[cpu])
+			continue;
+
+		if (ra >= pcpu_handlers[cpu] &&
+		    ra < pcpu_handlers[cpu] + vec_sz) {
+			ra = ra + eentry - pcpu_handlers[cpu];
+			break;
+		}
+	}
+#endif
+
 	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.12/loongarch-remove-unnecessary-checks-for-orc-unwinder.patch
queue-6.12/loongarch-handle-percpu-handler-address-for-orc-unwinder.patch
