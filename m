Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A77E2222CF
	for <loongarch@lists.linux.dev>; Thu, 13 Feb 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457124; cv=none; b=sElavP3pChcrKhunxv4GIqKYk4UTCzjKhIte5aYSz799fGNPXyViSsqU/fXCh6qBK073FhYpfz3P/+UkE5OJAvuyw+uCL9VA9bRKtZHuT4VH9MTz38JYDChtjiaTVVr3LzMdCZ9lkUTADwETi9DU8kRLu20CpDGEfvizF4YQ5Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457124; c=relaxed/simple;
	bh=MbKSHc6S9QS5zxVP19dlAsVUWqhbyd3VguIpTvCey6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmJxJjecUHDZ3qnkN2HNYxl4PN/v8Ys7ACZrTGdBfZJDE+IOG7LyyxNQ/A+POyDV86qt7ojiPUJ3MIciPKshpjJpMZRoDhSvSTV3nGMO3wsir6GZ1A5UA8z995Z/lwe73LWbHRDJNIM7CUticRTXumL+zE+iMyDVcsTflWoruhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8Ax3eJfAq5n00N0AA--.32027S3;
	Thu, 13 Feb 2025 22:31:59 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMAxSsRbAq5nLSUQAA--.1557S2;
	Thu, 13 Feb 2025 22:31:58 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [GIT PULL] LoongArch fixes for v6.14-rc3
Date: Thu, 13 Feb 2025 22:31:48 +0800
Message-ID: <20250213143148.1450556-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxSsRbAq5nLSUQAA--.1557S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF4UGrW5GrWfZr17KF17Arc_yoW8CFW3pr
	y3urnxJr45GrW3X3Zrt347Wr1DXr1xGr1IqF1ay348AF1UZr1UXr18WrykXFyUJ34rJr1F
	qF1rJw1qqF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==

The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git tags/loongarch-fixes-6.14-1

for you to fetch changes up to 3011b29ec5a33ec16502e687c4264d57416a8b1f:

  LoongArch: KVM: Set host with kernel mode when switch to VM mode (2025-02-13 12:02:56 +0800)

----------------------------------------------------------------
LoongArch fixes for v6.14-rc3

Fix bugs about idle, kernel_page_present(), IP checksum and KVM, plus
some trival cleanups.
----------------------------------------------------------------
Bibo Mao (3):
      LoongArch: KVM: Fix typo issue about GCFG feature detection
      LoongArch: KVM: Remove duplicated cache attribute setting
      LoongArch: KVM: Set host with kernel mode when switch to VM mode

Huacai Chen (1):
      LoongArch: Fix kernel_page_present() for KPRANGE/XKPRANGE

Marco Crivellari (1):
      LoongArch: Fix idle VS timer enqueue

Yuli Wang (3):
      LoongArch: Use str_yes_no() helper function for /proc/cpuinfo
      LoongArch: Remove the deprecated notifier hook mechanism
      LoongArch: csum: Fix OoB access in IP checksum code for negative lengths

 arch/loongarch/include/asm/cpu-info.h | 21 ---------------------
 arch/loongarch/include/asm/smp.h      |  2 ++
 arch/loongarch/kernel/genex.S         | 28 +++++++++++++++-------------
 arch/loongarch/kernel/idle.c          |  3 +--
 arch/loongarch/kernel/proc.c          | 29 +++--------------------------
 arch/loongarch/kernel/reset.c         |  6 +++---
 arch/loongarch/kvm/main.c             |  4 ++--
 arch/loongarch/kvm/switch.S           |  2 +-
 arch/loongarch/kvm/vcpu.c             |  3 ---
 arch/loongarch/lib/csum.c             |  2 +-
 arch/loongarch/mm/pageattr.c          |  3 ++-
 11 files changed, 30 insertions(+), 73 deletions(-)

