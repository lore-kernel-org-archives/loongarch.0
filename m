Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A60046AF03
	for <loongarch@lists.linux.dev>; Tue, 19 May 2026 09:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183798; cv=none; b=iTUKpmla1G6v8Y76i5S7wDJpbXE1OJyUsuTSI4gzFFjqB5qzkF5R5ckhEeCRkJQmSTqANB0DQthpMa6zYey3g0MAoqmSJhtbqzUJeobHr35oACxH1Z4AsLSu69BsGVzRxaQimYd+c79rFYYTD0sbO+0NUDig61NusQxRHZ9KFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183798; c=relaxed/simple;
	bh=nbgBgna4U3ZhBvOGNNur/jiCzWXVWT9U0UbZeEqHbxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mIGw7IP8+evRnhcApYEsyyN5pRrLwLboAyTxLjN195FQZl2r+peacQ4UJ94of8PO7EE3w8IPyCQl/D0Anh/1xUtEvxxVZO5kpxJj2MhFc+t4TKWhmLJCEExb33rS4bfvLp1B53DmptRiLrwyIWhMWDyLP6PIRY93qCow1F7UyvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxZniuMAxqVy0LAA--.8252S3;
	Tue, 19 May 2026 17:43:10 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAxHMKtMAxqjD6IAA--.61010S2;
	Tue, 19 May 2026 17:43:09 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] LoongArch: KVM: Small enhancement about interrupt injection
Date: Tue, 19 May 2026 17:43:02 +0800
Message-Id: <20260519094308.3983046-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxHMKtMAxqjD6IAA--.61010S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Here make interrupt status acquire interface simpler, add new interface
kvm_vcpu_sync_intr() to sync pending interrupt to software ESTAT
register, and remove expensive vcpu_load() and vcpu_put() function call.

Also interrupt inject is handled with batch method, rather one by one.

---
v2 ... v3:
  1. Split patch 1 into two smaller patches, one is smaller bugfix patch
     with irq validility check in kvm_vcpu_ioctl_interrupt(), so that it
     is easy to porting to old kernel.

v1 ... v2:
  1. Add irq validility check in function kvm_vcpu_ioctl_interrupt().
  2. Add valid bit check when set ESTAT CSR register.
  3. Merge two patches about interrupt clear and set with batch method into
     one.
---
Bibo Mao (6):
  LoongArch: KVM: Check irq validility in kvm_vcpu_ioctl_interrupt()
  LoongArch: KVM: Check msgint feature in interrupt post
  LoongArch: KVM: Use existing macro about interrupt bit mask
  LoongArch: KVM: Inject interrupt with batch method
  LoongArch: KVM: Add valid bit check when set ESTAT CSR register
  LoongArch: KVM: Simple interrupt status acquire interface

 arch/loongarch/include/asm/kvm_vcpu.h |  44 +++++---
 arch/loongarch/kvm/interrupt.c        | 140 +++++++++++++-------------
 arch/loongarch/kvm/vcpu.c             |  54 ++++++----
 3 files changed, 134 insertions(+), 104 deletions(-)


base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
-- 
2.39.3

