Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB0B1F0994
	for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 01:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267075; cv=none; b=hpIw6FhyBslGZGb/bfYhu+IZOKhLNvTMo74afMO/mIwlJVKczp7dsJorazLLFR44qwagRPdwvetCM+KHaFFOuxwg/1r6/gZVBkVNUnWb/pFc2ka40KRQG3jgrUhrwssP7oCvpdJY0LenLRgD86l5pfT8Mt2v8vY4IOZ5CPDCilU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267075; c=relaxed/simple;
	bh=jDWYqK68R2auRZD67DQEtOLwTwNph75oo1MD2hMwAWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YL8VKCamTC/Zhn+/BDgj1O2lz9xh2U4SVSz/aDCSQhYcfE6DNYWHbdq3gznY1HA245FWNyYT7vh8lnxyoD7Ja3kSoYGanT4Npd8d/MHjkYRSEbO5dWg/GoUEq+GGzJA1kahtlNHgWK9QPAywKPLaO85EWp0L12gfXGOweK5nGBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxacI5nWVpTScIAA--.25861S3;
	Tue, 13 Jan 2026 09:17:45 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxXcI4nWVpdFMcAA--.56123S2;
	Tue, 13 Jan 2026 09:17:45 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Revert "LoongArch: Remove unnecessary checks for ORC unwinder"
Date: Tue, 13 Jan 2026 09:17:30 +0800
Message-ID: <20260113011730.17824-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcI4nWVpdFMcAA--.56123S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr1xWr13Xw13AF17Kr43XFc_yoW8CFWUpF
	ZxC3Z8KrW8Ka4rW3y7JryFvry5A3s7t3WagFZrKr95CF1Yq3W3Cw1a9345CF4DtrWkWa10
	qFn5KrZ0ka9FyagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=

This reverts commit 4cd641a79e69270a062777f64a0dd330abb9044a.

The system can not boot normally with the latest kernel 6.19-rc5 under
different configs, commit 4cd641a79e69 ("LoongArch: Remove unnecessary
checks for ORC unwinder") is the first bad commit since 6.19-rc4, just
revert it first before finding the root cause.

The kernel boots normally with the defconfig, so no problem found out
at the first time. The error messages are "cannot find unwind pc at",
here is one way (maybe not the only way) to reproduce:

  cd linux
  make mrproper defconfig -j"$(nproc)"
  scripts/config -e KASAN
  make olddefconfig all -j"$(nproc)"
  sudo make modules_install
  sudo make install
  sudo reboot

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/kernel/unwind_orc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/unwind_orc.c b/arch/loongarch/kernel/unwind_orc.c
index 8a6e3429a860..710f82d73797 100644
--- a/arch/loongarch/kernel/unwind_orc.c
+++ b/arch/loongarch/kernel/unwind_orc.c
@@ -352,6 +352,12 @@ static inline unsigned long bt_address(unsigned long ra)
 {
 	extern unsigned long eentry;
 
+	if (__kernel_text_address(ra))
+		return ra;
+
+	if (__module_text_address(ra))
+		return ra;
+
 	if (ra >= eentry && ra < eentry +  EXCCODE_INT_END * VECSIZE) {
 		unsigned long func;
 		unsigned long type = (ra - eentry) / VECSIZE;
@@ -369,13 +375,10 @@ static inline unsigned long bt_address(unsigned long ra)
 			break;
 		}
 
-		ra = func + offset;
+		return func + offset;
 	}
 
-	if (__kernel_text_address(ra))
-		return ra;
-
-	return 0;
+	return ra;
 }
 
 bool unwind_next_frame(struct unwind_state *state)
@@ -498,6 +501,9 @@ bool unwind_next_frame(struct unwind_state *state)
 		goto err;
 	}
 
+	if (!__kernel_text_address(state->pc))
+		goto err;
+
 	return true;
 
 err:
-- 
2.42.0

