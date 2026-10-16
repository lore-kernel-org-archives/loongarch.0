Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3B13C8C52
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138228; cv=none; b=cPJCZP2G8y79am6T39zQD2m+kbZBsjiyBV2v3AdDBHJKlnirL+jwuActX+a9NOv2NEus33qu+alam7fW9U1XeTq5206wOucpgdzHCaw81vUjWQiJ4pgI22nwpJrKeVNAzaOAXP+oUyPvu5WE0HVYJi2X6y0b3Ob369LCSp20Sg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138228; c=relaxed/simple;
	bh=EworvDPRsWhd9IFYTOb23xuCpZRyTVLzaVPkgA1nJjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n5d0ohPAJDPEA3DcXRj7NdV/dIcigu1YrFWAcQ9kTzU8WpH0e+edmKiwLaUgwefk/x+wnQHPIh8FJZw++4UnZGZfVX+WHwqq6JMAceh4XsScDVS117ZHmGSPkBpP/keaWbbt8kgP6ZCQOATIq1UiCNeQs2OzN2pbDjKmOs88tEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxD9Pt29FqKnAWAA--.65315S3;
	Fri, 16 Oct 2026 16:10:22 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBx5czi29FqOAwtAA--.2269S2;
	Fri, 16 Oct 2026 16:10:15 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] LoongArch: BPF: Refine move_imm() and optimize 32-bit operations
Date: Fri, 16 Oct 2026 16:10:03 +0800
Message-ID: <20261016081006.26069-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBx5czi29FqOAwtAA--.2269S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF43GF4xKFykJF13Xr47GFX_yoW8Gw48pF
	ZxArn3Kr4UGFyfZF10yay8Zr15Ka1fCwnFqayYk34UJFn5XF1jqF18KF4kXFyDt3yFqryF
	qrykGw4YgFWDXacCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2MKZDUUUU

v3:
  -- Add a prerequisite patch to detect CPUCFG2_DIV32 feature.
  -- Fix a hardware compatibility bug by checking cpu_has_div32
     before emitting native 32-bit div/mod instructions.

This version is based on v7.3-rc7 and has been tested on Loongson-3A6000
and Loongson-3A5000 physical machines.

All of the testcases of test_bpf passed on Loongson-3A6000 (with DIV32)
and Loongson-3A5000 (without DIV32), here are the test results:

$ sudo modprobe test_bpf
$ dmesg -t | grep Summary
test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED

For the BPF selftests test_verifier and test_progs, there are no any
regressions.

Tiezhu Yang (3):
  LoongArch: Add CPUCFG2 DIV32 feature detection
  LoongArch: BPF: Clean up and decouple is32 parameter from move_imm()
  LoongArch: BPF: Optimize 32-bit operations using native instructions

 arch/loongarch/include/asm/cpu-features.h |   1 +
 arch/loongarch/include/asm/cpu.h          |   2 +
 arch/loongarch/include/asm/inst.h         |   6 +
 arch/loongarch/include/uapi/asm/hwcap.h   |   1 +
 arch/loongarch/kernel/cpu-probe.c         |   4 +
 arch/loongarch/kernel/proc.c              |   2 +
 arch/loongarch/net/bpf_jit.c              | 381 ++++++++++++----------
 arch/loongarch/net/bpf_jit.h              |  25 +-
 8 files changed, 234 insertions(+), 188 deletions(-)

-- 
2.42.0

