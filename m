Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93A0313552
	for <loongarch@lists.linux.dev>; Tue, 28 Jul 2026 03:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785208591; cv=none; b=KdhKFkurYYF59vkpCROVyIs16vFtUZXUIB+yyLLYpUxs1FmxlirNveQFA4wAo+blc5+fS1RN6VUiVmL970JK3seum7gAbPEE0dWLy2rfplwbIQdA61nptW+gDU8F6KriexuTr0z/U4FAgfBXJadN5v665oPFte5Xf6XwfYUPCAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785208591; c=relaxed/simple;
	bh=GYCTHOgVdqTt6JpiejCot5pKLn46PxB3FddKVKPIIks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDurTni9/iNcfC44iUXRpUraMF9pjsw0AWZX1he5nn3bCDuYGpkuvId8bNwxSEeAU7UqLRTW/JZK51A3Beb4ZUbTu1OlKwfXklEEd78SOi5yi1wEOkU5sc6E24bSTWz0gH7r94ihHW1jValZLX5L7kXMA9ivU3P0xZFmvSjwsxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxVegEH2hqt_8HAA--.4860S3;
	Tue, 28 Jul 2026 11:16:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxPcUAH2hqhzcbAA--.14265S2;
	Tue, 28 Jul 2026 11:16:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Refine move_imm() and optimize memory load
Date: Tue, 28 Jul 2026 11:16:13 +0800
Message-ID: <20260728031615.9389-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxPcUAH2hqhzcbAA--.14265S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CFW7Xw1xGryxWr1Duw1UCFX_yoW8Xr1kpa
	9a9F43Kr4kJa4xZ34fCayjqr1Yya1fW397Gayaq34rWrZ8Zr1DXr1Igw4vqFyDA3yFgryF
	q34rCa4q9a1UJagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=

This series is based on 7.2-rc5 and the following two series:

Fix and optimize BPF tailcall for LoongArch
https://lore.kernel.org/loongarch/20260707101508.32283-1-yangtiezhu@loongson.cn/

LoongArch: BPF: clean up for build_insn() paths
https://lore.kernel.org/loongarch/20260711100956.4351-1-yangtiezhu@loongson.cn/

The long-term goal is to eliminate frequent and redundant
zero-extensions and sign-extensions, but there are still
some issues to sort out. Here is the previous RFC patch:

LoongArch: BPF: Eliminate zero/sign extensions for 32-bit operations
https://lore.kernel.org/loongarch/20260711101656.7415-3-yangtiezhu@loongson.cn/

For now, just send out the stable and verified patches
first.

Here are the test results of test_bpf:

fedora@linux:~$ sudo dmesg -c
fedora@linux:~$ sudo modprobe test_bpf
fedora@linux:~$ dmesg -t | grep Summary
test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED

Tiezhu Yang (2):
  LoongArch: BPF: Clean up and decouple is32 parameter from move_imm()
  LoongArch: BPF: Eliminate zero-extension for memory load operations

 arch/loongarch/net/bpf_jit.c | 123 ++++++++++++++++++++++-------------
 arch/loongarch/net/bpf_jit.h |   7 +-
 2 files changed, 79 insertions(+), 51 deletions(-)

-- 
2.42.0

