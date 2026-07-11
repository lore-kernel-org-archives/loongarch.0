Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F26B30EF64
	for <loongarch@lists.linux.dev>; Sat, 11 Jul 2026 10:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764609; cv=none; b=O62ObukE+6UujZc//llJbmDlWK4aCbTDTSYbdoHi2VV9ZqjqNzN2cAzzsibhhBD9403R1NZ505sTElmrfwr2aDD/GRVK5/RQxkybXLlvxQcurT+7TvJMsPeNxdfDEJhBOo75A77Y3vwCcZBL1/BklJ8SsxITJEFp/pXgO2CGHLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764609; c=relaxed/simple;
	bh=bpU+qGzeMWoLYNZT5mNWSannwGdJ1zdYAfelzlAtORA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbLkATZbgHqXQ/31k7Ikd9if+zFQXY162UHxJ0h0ptH6lDYOgRjK7i5GeN7jaLgpmv2vOa0zmvDyuiCNKoUwKnPI7w/A2smfJUAfUPr32desQxa91BZ0kk06sujWCVIP9CQCRV94/51wh2JQVAj6JhKcmpjSqzaUM4T/aOzIfDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dxtup2FlJqxJgCAA--.10631S3;
	Sat, 11 Jul 2026 18:10:00 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxTOV1FlJqVnAJAA--.36096S2;
	Sat, 11 Jul 2026 18:09:58 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] LoongArch: BPF: clean up for build_insn() paths
Date: Sat, 11 Jul 2026 18:09:53 +0800
Message-ID: <20260711100956.4351-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxTOV1FlJqVnAJAA--.36096S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4c8EcI0En4kS14v26r1Y6r17MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j
	6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU84xRDUUUUU==

Based on 7.2-rc1, tested on a Loongson-3A6000 physical machine.

Remove redundant or dead code, and eliminate the unnecessary runtime
check.

Tiezhu Yang (3):
  LoongArch: BPF: Remove redundant zext jumping in move_imm()
  LoongArch: BPF: Remove dead move_imm() call in BPF_NEG path
  LoongArch: BPF: Split unconditional branch JA paths statically

 arch/loongarch/net/bpf_jit.c | 10 +++++-----
 arch/loongarch/net/bpf_jit.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.42.0

