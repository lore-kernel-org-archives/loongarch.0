Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC022C0F78
	for <loongarch@lists.linux.dev>; Tue, 27 Jan 2026 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503489; cv=none; b=doUK6qf84de2T9YEUGRtECFMWjQkdUEbyiU2lBGIcs9znxHF/LE+eV5SXp60Lv6Tgi3kqyb7pFjQjaE8EfBil7WNjXd0LfBFDsZPrjkCjHasiHwe02Z002pKo+rTEy+71+FllVPnA5x7+69sWjrHaPR1E5hNnl5INhhnzYwkxIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503489; c=relaxed/simple;
	bh=WDrh9E26aZFc7KX/aJzt3CSR8GIwi8tSCtyMRl3V8Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VDB5iC8SoLEyh0bwsCpzDpLsqs6KsT+cGqcP1YfqCroFHmqCUkXcVFsOIa+PXgs8HPKhhUd/PsBSDPJ7e9o4yDXneQAm248eR6VNcPVmJyzcu/JyJ0eV4GS8sjK4H1uURuaLDYM8HRB1BXP/UvsRALjtk7BMBXllNMOns/5VbY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.42])
	by gateway (Coremail) with SMTP id _____8AxCML8enhpQA0NAA--.30211S3;
	Tue, 27 Jan 2026 16:44:44 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.42])
	by front1 (Coremail) with SMTP id qMiowJBxrsL3enhpYyc0AA--.14175S2;
	Tue, 27 Jan 2026 16:44:43 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 0/3] LoongArch: Fix problems about KASAN
Date: Tue, 27 Jan 2026 16:44:30 +0800
Message-ID: <20260127084430.1135547-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxrsL3enhpYyc0AA--.14175S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrAw43Gr47CF1xCrWkGr1Dtwc_yoWxXFbEgF
	ySva40kr1DG3WrAa4qqF1rJr98ZaykXFs8uF9rWr4Ut347tr1DJF4DGa15Zr4F9rWkZrs5
	Jw4jqr95Ar1UtosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU83UUUUUUUU==

This series fix some KASAN problems for LoongArch.

Tiezhu Yang & Huacai Chen (3):
  LoongArch: Prefer top-down allocation after arch_mem_init()
  LoongArch: Disable instrumentation for setup_ptwalker()
  LoongArch: Rework KASAN initialization for PTW-enabled systems

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/setup.c  |  1 +
 arch/loongarch/mm/kasan_init.c | 78 ++++++++++++++++++++++--------------------
 arch/loongarch/mm/tlb.c        |  2 +-
 3 files changed, 42 insertions(+), 39 deletions(-)
---
2.27.0

