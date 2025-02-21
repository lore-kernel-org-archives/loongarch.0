Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE411D89E4
	for <loongarch@lists.linux.dev>; Fri, 21 Feb 2025 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740123175; cv=none; b=MtZiip0TUyN5DIGJJIiObjC35MGVUQ21B6HqmRZ2fXZpNEfEbEbQzPZCJVsxuuR/LY41+0mdvsISRu2Ch28RAUoAvnZqjWCinmqJv9AGyKcTwH7EI2UqCTPIXGpY+a8fFxX1N+CYwgqld+9KtJ8pevwe8JhAhvcsxxTI0bXLsAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740123175; c=relaxed/simple;
	bh=JQ2DkHZ1wO7MxFcvVF9Kiz9eG9MClhkznifbcLI1faw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qii3prTs5qtrvOkQteVtNWRvioZ0N9GkXRNm30Pzr8M0bFKOu7qCIalV3NZljUoCHoQpyYU9O1p366l37JafHszyeItlECyyj55S1MRc5+ea/vAQgRg+7HTYosF3QQxive0rjApqhHIIX6DnSH0fu1Ge0btfwE1i2KIkMGzqks0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxfWsiLLhnxx99AA--.19330S3;
	Fri, 21 Feb 2025 15:32:50 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxH+UhLLhny9YfAA--.55053S2;
	Fri, 21 Feb 2025 15:32:50 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: Remove unused option with HAVE_VIRT_CPU_ACCOUNTING_GEN
Date: Fri, 21 Feb 2025 15:32:49 +0800
Message-Id: <20250221073249.481731-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxH+UhLLhny9YfAA--.55053S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Option HAVE_VIRT_CPU_ACCOUNTING_GEN is selected by default in kconfig file
arch/Kconfig. It is meaningless in file arch/loongarch/Kconfig, and on the
contrast it may bring out misunderstanding. Here remove it on arch
specified kconfig file.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 2b8bd27a852f..7fd5708fe14a 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -175,7 +175,6 @@ config LOONGARCH
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_TIF_NOHZ
-	select HAVE_VIRT_CPU_ACCOUNTING_GEN if !SMP
 	select IRQ_FORCED_THREADING
 	select IRQ_LOONGARCH_CPU
 	select LOCK_MM_AND_FIND_VMA
-- 
2.39.3

