Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C5B2F49F6
	for <loongarch@lists.linux.dev>; Fri,  2 Jan 2026 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357792; cv=none; b=SjSuUN52Rk7TnwY2y9QH2ZVyO82B/PYia8zCrE4BId1VJvWFCXcini9YuYPF5uLq1EsuaFX/acQtYcUGLIE8VkMYh41jS7VhoUDdhlcDBeIpVQdxDABBfDs9Qr2fan9fAdCic/Uh+t2ghG6QX5R07RNP8P+j5Lv6g3xlF0sNmXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357792; c=relaxed/simple;
	bh=8eUq3Pn+KcGsEtUGrZlabILVCNb9lpuwlVpiaLiuTAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uluCI8S12yfac2dI1f2/ouJP4OzIK0tXiEg+tqjKsvBlCezsJX75xkGFmwvUnhRS91zo54Fn94jZnl3dbTZyY8BAxBOiO/L+uGDNgH7hplq+h0J+G6cYflh1FCVld2uuZ+bKKNGy7kQKh1UZspBeaY21clIQpGmeeO3vr/7lzrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.1])
	by gateway (Coremail) with SMTP id _____8CxacJQvVdpyf8EAA--.15387S3;
	Fri, 02 Jan 2026 20:42:56 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.1])
	by front1 (Coremail) with SMTP id qMiowJAxIMNEvVdpuaAJAA--.6861S2;
	Fri, 02 Jan 2026 20:42:53 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.19-rc4
Date: Fri,  2 Jan 2026 20:42:18 +0800
Message-ID: <20260102124218.2256215-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxIMNEvVdpuaAJAA--.6861S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tw4kKw17ZF4UJw4fAF4UJrc_yoW5JFyrpr
	Wa9FnxGr4rCrsxZwnIga429rnxJF1xGrW3Xa1ay34rCF1DZr1UXw45Ar1kXFZrJ3yfGryI
	qF18Jw1jgF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcTKZDUUUU

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.19-1

for you to fetch changes up to bb85d206be208bbf834883e948125a35ac59993a:

  samples/ftrace: Adjust LoongArch register restore order in direct calls (2025-12-31 15:19:25 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.19-rc4

Complete CPUCFG registers definition, set correct protection_map[] for
VM_NONE/VM_SHARED, fix some bugs about orc stack unwinder, ftrace and BPF
JIT.
----------------------------------------------------------------
Chenghao Duan (7):
      LoongArch: Enable exception fixup for specific ADE subcode
      LoongArch: Refactor register restoration in ftrace_common_return
      LoongArch: BPF: Save return address register ra to t0 before trampoline
      LoongArch: BPF: Adjust the jump offset of tail calls
      LoongArch: BPF: Enable trampoline-based tracing for module functions
      LoongArch: BPF: Enhance the bpf_arch_text_poke() function
      samples/ftrace: Adjust LoongArch register restore order in direct calls

Hengqi Chen (2):
      LoongArch: BPF: Sign extend kfunc call arguments
      LoongArch: BPF: Zero-extend bpf_tail_call() index

Huacai Chen (2):
      LoongArch: Complete CPUCFG registers definition
      LoongArch: Set correct protection_map[] for VM_NONE/VM_SHARED

Tiezhu Yang (3):
      LoongArch: Use UNWIND_HINT_END_OF_STACK for entry points
      LoongArch: Remove is_entry_func() and kernel_entry_end
      LoongArch: Remove unnecessary checks for ORC unwinder

 arch/loongarch/include/asm/loongarch.h      |  7 ++++
 arch/loongarch/kernel/head.S                |  4 +-
 arch/loongarch/kernel/mcount_dyn.S          | 14 +++++--
 arch/loongarch/kernel/traps.c               |  5 +++
 arch/loongarch/kernel/unwind_orc.c          | 27 +++-----------
 arch/loongarch/mm/cache.c                   |  8 ++--
 arch/loongarch/net/bpf_jit.c                | 58 +++++++++++++++++++++++------
 arch/loongarch/net/bpf_jit.h                | 26 +++++++++++++
 samples/ftrace/ftrace-direct-modify.c       |  8 ++--
 samples/ftrace/ftrace-direct-multi-modify.c |  8 ++--
 samples/ftrace/ftrace-direct-multi.c        |  4 +-
 samples/ftrace/ftrace-direct-too.c          |  4 +-
 samples/ftrace/ftrace-direct.c              |  4 +-
 13 files changed, 120 insertions(+), 57 deletions(-)

