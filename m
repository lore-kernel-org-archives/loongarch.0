Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FF04A21
	for <loongarch@lists.linux.dev>; Sat, 17 May 2025 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473524; cv=none; b=JLiomRSfLF9fr1grpnLPQnogkHUKO0l9NWswAW1zmWQobJ1IFlsl1Srr1inNjul5NF+wsOP6w5XyZ3W9oQTVF1x8mVHkyEFZ9uWdLSLLgLuH/0/q7R3NhHFH5V6vapOOpz+FMw6NRgSlzybwds1zNed8OhvM6nV9CaVUhDhVT1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473524; c=relaxed/simple;
	bh=Wx3vkHoGM2SIgtXNrgr14kmQXUf9CbbQw1ZTh/t+Fs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbAWDINtpg/0XFoY5ap8iHJzZaGHIbsJ1eyDUZmpGFI3NrSbtYcxaXTnGm3ob+HnGEmzCpNJxcSniqIBdeZiYwwhTmNK9JsLnAJsi/LVY1kc21t3NkqYXCO/evtPkzQmgsY8w8PHsq+/kjv4M4mWl7cIs0wZucBq0s+3u1d5sUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8AxSWpmVChoZanuAA--.23989S3;
	Sat, 17 May 2025 17:18:30 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMDxOcRiVChosg_cAA--.55457S2;
	Sat, 17 May 2025 17:18:29 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.15-rc7
Date: Sat, 17 May 2025 17:18:17 +0800
Message-ID: <20250517091817.3490818-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxOcRiVChosg_cAA--.55457S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWrZw17AFW7CF1fAw15ZFc_yoW8Xw13pr
	9xCrnxGF4UGr13Jr13t34DWrn8tryxGw43Xa13t34xGr1UAr1UXr18KrykXFy5t3yrKr10
	qF18Jw1YgF1UJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.15-2

for you to fetch changes up to 12614f794274f63fbdfe76771b2b332077d63848:

  LoongArch: uprobes: Remove redundant code about resume_era (2025-05-14 22:18:10 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.15-rc7

Fix some bugs about kernel-fpu, cpu idle function, hibernation and
uprobes.
----------------------------------------------------------------
Huacai Chen (3):
      LoongArch: Fix MAX_REG_OFFSET calculation
      LoongArch: Move __arch_cpu_idle() to .cpuidle.text section
      LoongArch: Save and restore CSR.CNTC for hibernation

Tianyang Zhang (1):
      LoongArch: Prevent cond_resched() occurring within kernel-fpu

Tiezhu Yang (2):
      LoongArch: uprobes: Remove user_{en,dis}able_single_step()
      LoongArch: uprobes: Remove redundant code about resume_era

 arch/loongarch/include/asm/ptrace.h  |  2 +-
 arch/loongarch/include/asm/uprobes.h |  1 -
 arch/loongarch/kernel/genex.S        |  7 +++++--
 arch/loongarch/kernel/kfpu.c         | 22 ++++++++++++++++++++--
 arch/loongarch/kernel/time.c         |  2 +-
 arch/loongarch/kernel/uprobes.c      | 11 +----------
 arch/loongarch/power/hibernate.c     |  3 +++
 7 files changed, 31 insertions(+), 17 deletions(-)

