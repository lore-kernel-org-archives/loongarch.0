Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2443B36E47F
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 07:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151399; cv=none; b=Nw8Crf0rxHuesVwBYq9JFAeDoKqsJaBGhHG49EHXqY+TWT1CPg2V58LMVUNLZRq/byCADduMc+ezOBfs9qi+/bM8CNsE6oLh3N+7CS0tTo56a+22ibx0geDKqUbdmG3E4h31uam4HfPFx1qqUuWXdnTad8h3J2MRB3KUwLdweYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151399; c=relaxed/simple;
	bh=6OwoWi3A8k3b/KkbcUtNnpH2rSGHe5KH+JPXTIUafSk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MyKIt72NXw36ainP5xrwdpx0/21u5Rfqi6g0N0MLAOPpq4LcacUJrWUhBwq8IEJLgy/LGgfMZn5n7BKdV0Q36nqsSmox/KkLLARL/qMaifSixFrdJ3FcYdXaocMm5oMPWiCWqBZyGK3vbV5zcqc6O/xKSfhrQR/zx7Dl6nbnKZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bxb+tk691p7WkAAA--.1986S3;
	Tue, 14 Apr 2026 15:23:16 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxfcJi691pErxsAA--.8539S2;
	Tue, 14 Apr 2026 15:23:15 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] LoongArch: KVM: Small enhancement about timer
Date: Tue, 14 Apr 2026 15:23:10 +0800
Message-Id: <20260414072313.3801110-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxfcJi691pErxsAA--.8539S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

By running LTP stress test cases on VM, there is an RCU timeout issue on
some vCPUs recently. The problem is that there is HW timer interrupt lost
issue when injecting SIP0/IPI interrupt from KVM hypervisor, this problem
is hidden because the KVM hypervisor will inject spurious timer interrupt
if emulated timer is expired. In late the spurious timer interrupt is
clear if old TI bit of ESTAT register is not set, so there will be RCU
timeout issue with LTP stress test.

This patch set fixes the HW timer interrupt lost issue, also this patch
moves unconditional delay in timer interrupt clear scenery, which happens
seldomly; mostly the timer interrupt bit is set when it expires.

Bibo Mao (3):
  LoongArch: KVM: Move AVEC interrupt injection in switch loop
  LoongArch: KVM: Fix HW timer interrupt lost when inject interrupt from
    software
  LoongArch: KVM: Move unconditional delay in timer clear scenery

 arch/loongarch/kvm/interrupt.c | 37 +++++++++++++++++++++++++---------
 arch/loongarch/kvm/timer.c     | 16 +++++++++++++--
 2 files changed, 41 insertions(+), 12 deletions(-)


base-commit: d568788baab24875604c231f723dbb72387fb081
-- 
2.39.3

