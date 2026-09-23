Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095414398FA
	for <loongarch@lists.linux.dev>; Wed, 23 Sep 2026 05:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142915; cv=none; b=mKWFTZnYZrPvsRVZVoIDeNMduowG2MIGWWqlC+6/UDJ4ExsPnyWQbDTxXLTcIrckAkG/8YdhixhngaZvGLzx/gQ/dteecQnep1jX7bdHDlvt1YGi3eO07O8dPscsdiRNXEfFAZBha5TpfWpiZFDQD294FASi46tGZnmRd/87SXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142915; c=relaxed/simple;
	bh=B1wZ8Fe+gJv4RFiOYsWq2PukfPTDxDrxyMv/WYaACeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=buv88gCim94cZsyGQ6oGiZCM9W6+7LxZ05T/19hDFu5v54ZewjUN8jPi4L3Vws9P5q0f1O9K93dkU1D6yuXWpbJMplkPMnykZ+MRmS0feJI0MxIXzJTLFkXgEc4l7mb3ndRgB970ZuxrHt8n51YDgs49ASwi7Kr5qlOVXoZKRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxbdK9abNqiu0OAA--.44552S3;
	Wed, 23 Sep 2026 13:55:10 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCx9cy7abNqphMkAA--.48859S2;
	Wed, 23 Sep 2026 13:55:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] LoongArch: Fix perf hardware breakpoints
Date: Wed, 23 Sep 2026 13:54:59 +0800
Message-ID: <20260923055506.29221-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCx9cy7abNqphMkAA--.48859S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJr43Ww1rZFWxAr4xZFWUtrc_yoW8GF47pr
	ZxuFn5JFW8GFW3Zw13tayxuFn8KF4xua12qa43K348tw4qgr15Zr92yrnrXF98Z3y5G340
	qryrWw1jgF1DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1KhF3UUUUU==

v3:
  -- Fix thread_struct layout for hardware breakpoints.
  -- Fix context switches and thread migrations issues.

This series addresses severe functional degradations in standard
perf_event usage, including initialization failures and one-shot
triggering limitations.

From a software perspective, all possible functional issues have
been fully resolved. Special thanks to Wang Rui for his help to
fix context switches and thread migrations issues.

Tiezhu Yang (7):
  LoongArch: Fix bitmask corruption in update_bp_registers()
  LoongArch: Remove redundant call in update_bp_registers()
  LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
  LoongArch: Only send SIGTRAP signal if necessary in do_watch()
  LoongArch: Fix perf hardware breakpoint failure via installation
  LoongArch: Fix thread_struct layout for hbp_break and hbp_watch
  LoongArch: Fix one-shot limitation for perf hardware breakpoints

 arch/loongarch/include/asm/hw_breakpoint.h | 12 ++--
 arch/loongarch/include/asm/loongarch.h     |  7 ++-
 arch/loongarch/include/asm/processor.h     | 16 +++--
 arch/loongarch/include/asm/switch_to.h     |  2 +-
 arch/loongarch/kernel/hw_breakpoint.c      | 69 ++++++++++++++++------
 arch/loongarch/kernel/process.c            |  4 +-
 arch/loongarch/kernel/traps.c              | 12 ++--
 7 files changed, 81 insertions(+), 41 deletions(-)

-- 
2.42.0

