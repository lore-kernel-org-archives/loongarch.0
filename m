Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024D1187FEC
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 07:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737443259; cv=none; b=CG7e5snM6u99rcT7ZItBlXhhh5yIk3p2B0cs803zODarplHqFrLKbI8xi4ygIjGu0/BWr2QTQ2JPQOLKr8WhkM/Hed5mfQly+B3KpN0NY/xVjJzzTctqKBiXXcOCJ2wob5nsncSNUKxfdZ1Q0r0AfDSNfEOdNzzEnChpFueQZ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737443259; c=relaxed/simple;
	bh=LReP8vHtV6wyT4gHYQ5XL69VLpXViDFx9w0G0IFq2zY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gkuhzUnD5QXlLH/jxxyVD+W0rGhrY8gj86ssf3L/Ult7qE86KznFko7fAnpFQF1DRKPu+nYZsDgskguxctR/eUtlrj+4N1M7RhGwsO2iJw0YfJ3pqsi3U8+D4odEQgQwGSCu7XD8r/9u0tQD2NG0bu3x1F3UIATVMcEB7fx2Z6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxPuNsR49nP6lmAA--.2944S3;
	Tue, 21 Jan 2025 15:06:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxYMZqR49nzawpAA--.24913S2;
	Tue, 21 Jan 2025 15:06:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] LoongArch: Change the maximum number of watchpoints
Date: Tue, 21 Jan 2025 15:06:15 +0800
Message-ID: <20250121070617.3214-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxYMZqR49nzawpAA--.24913S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280
	aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

Tiezhu Yang (2):
  LoongArch: Change 8 to 14 for LOONGARCH_MAX_{BRP,WRP}
  LoongArch: Extend the maximum number of watchpoints

 arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
 arch/loongarch/include/asm/loongarch.h     | 60 ++++++++++++++++++++++
 arch/loongarch/include/uapi/asm/ptrace.h   | 10 ++++
 arch/loongarch/kernel/hw_breakpoint.c      | 16 +++++-
 arch/loongarch/kernel/ptrace.c             |  6 +--
 5 files changed, 89 insertions(+), 7 deletions(-)

-- 
2.42.0

