Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E13528AB0B
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774234581; cv=none; b=TFyLZO3gIKzbx1R8damifctz7bcZXZhy/gj6lo5w8yJk4RiQlXF6cw69Y48dwW0/WkDjY+26cESeYdnKE3p3miRmXUfz7+55cr1dl+lHLMQbQSS0bXFs6LXdWTxPH+mQuE9ZGCY7tiMJ91TWbtUdUacdAeiYnii3KStm77iR54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774234581; c=relaxed/simple;
	bh=ie2QtBUjPQgSx9zEchNeATyy/r5znJ0k6DtWEXSRVI8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WxEV7dvFxKOlQ8F/7PPZugQPfvoEY7FWJdDZbJBCIz6bnK6dge3GLukoMDAAz63NSlZFd4NQDhCPWH3wMJiDVJuVEudLPfjlzTwtHdoAmR2A8hQGOTJN2h6zTSLZUcCsdgiZYTIB3Ex5mrrunJ10hjyJcXHWX5h0jFoEk061gP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Dx_8PPq8BpkqYdAA--.19912S3;
	Mon, 23 Mar 2026 10:56:15 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxbcLOq8Bpcg5bAA--.40805S2;
	Mon, 23 Mar 2026 10:56:15 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/4] LoongArch: KVM: Some small enhanments
Date: Mon, 23 Mar 2026 10:56:09 +0800
Message-Id: <20260323025613.3260876-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxbcLOq8Bpcg5bAA--.40805S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

There are some small enhancements about LoongArch KVM. There is
improvement about VM entry path in patch 1 and patch, add pending
request checking in advance and it is empty at most time.

Also change vcpu_is_preempted() from function to macro method, by actual
benchmark test such as unixbench. It is affected on physical machine
with function method. With the macro method, only one nop instruction
is added and there is no parameter parsing, there is no obvious
performance influence with physical machine.
---
v2 ... v3:
  1. Add new patch to move host CSR_GSTAT save and restore in context
     switch stage rather than VM entry, update it only when VMID is
     changed on VM entry.

v1 ... v2:
  1. Add READ_ONCE() with src->preempted to avoid compiler optimization.
---
Bibo Mao (4):
  LoongArch: KVM: Add kvm_request_pending checking in
    kvm_late_check_requests()
  LoongArch: KVM: Move host CSR_EENTRY save and restore in context
    switch
  LoongArch: KVM: Move host CSR_GSTAT save and restore in context switch
  LoongArch: KVM: Set vcpu_is_preempted() with macro rather than
    function

 arch/loongarch/include/asm/qspinlock.h | 27 +++++++++++++++++++++-----
 arch/loongarch/kernel/paravirt.c       | 15 ++------------
 arch/loongarch/kvm/main.c              |  8 ++++----
 arch/loongarch/kvm/vcpu.c              | 26 +++++++++++++------------
 4 files changed, 42 insertions(+), 34 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.39.3

