Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2B03B83F9
	for <loongarch@lists.linux.dev>; Thu, 24 Sep 2026 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260035; cv=none; b=glucGV5uMg/P6Z8hOy0H+owJgN89m3L1P8CA0MwCDsQ8/u72/4B4GDDCd/UmU8piP1tOxuJXAe6Wb3g1GKxXyMei/UrXhlO5+djamx61Y3DvClP2ossY2M1f/+aVjDXh5FNBJwvYj2bM0xNldSnRtOnOFX2Hl19cxH5pgFMUIss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260035; c=relaxed/simple;
	bh=Bf2KgCt0aSna/n7TRR1mlzogkYFVIzIKlJfF/d+Slac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZ6D1ENbkI5akEDF7p3kLDVBqwqUIGzKSa7cyt85hziZQ+8k8rXS3fbWqGrgSntKz/4jJXdne1yFHKaUEeDM0fKORfVRAKIR+n7Z7o/1wDp0lU8MOz7Bx4DxertEMIYq2Q8QK72z8DXxbGoCTnj9ifeR5XmYbMASb2tcdH3C2wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8DxytE_M7Vq2HAPAA--.45115S3;
	Thu, 24 Sep 2026 22:27:11 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxBc09M7Vqha8kAA--.50018S2;
	Thu, 24 Sep 2026 22:27:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] LoongArch: Fix perf hardware breakpoints
Date: Thu, 24 Sep 2026 22:27:02 +0800
Message-ID: <20260924142708.2459-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc09M7Vqha8kAA--.50018S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWruw48GrWDXr48Ar4DAFyDtwc_yoWDZFc_Wa
	4fA3yUur4kuFW3tFyqkF4fA34vkF4fWFn8AFyqqFsFk3Z5Gry5Jan5X3WUZryag348trs8
	JrWFywn5Aw129osvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

v4:
  -- Do not modify thread_struct layout for hardware breakpoints

This series addresses severe functional degradations in standard
perf_event usage, including initialization failures and one-shot
triggering limitations.

Tiezhu Yang (6):
  LoongArch: Fix bitmask corruption in update_bp_registers()
  LoongArch: Remove redundant call in update_bp_registers()
  LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
  LoongArch: Only send SIGTRAP signal if necessary in do_watch()
  LoongArch: Fix perf hardware breakpoint failure via installation
  LoongArch: Fix one-shot limitation for perf hardware breakpoints

 arch/loongarch/include/asm/hw_breakpoint.h |  8 +--
 arch/loongarch/include/asm/loongarch.h     |  7 ++-
 arch/loongarch/include/asm/processor.h     |  3 +
 arch/loongarch/include/asm/switch_to.h     |  2 +-
 arch/loongarch/kernel/hw_breakpoint.c      | 66 ++++++++++++++++++----
 arch/loongarch/kernel/traps.c              | 12 ++--
 6 files changed, 74 insertions(+), 24 deletions(-)

-- 
2.42.0

