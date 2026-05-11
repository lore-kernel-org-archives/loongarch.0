Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703B918E02A
	for <loongarch@lists.linux.dev>; Mon, 11 May 2026 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778482321; cv=none; b=RN9ZBBL/16qg9fRsGkrrl46fVDIgrq1Jm4CiduKtU6ZU+hhJRWGmbqWWM8YHa8eUW23UFY1z4vTMPsmS8KPvgs+GW97w85w8UbNE10qPCLG4tfr+qAOFCIcDzcmzVX28UZ14h82uTBP3tD2ezz2DcPLQIjq3bSnrd8HhaXN3VSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778482321; c=relaxed/simple;
	bh=c92LiIDF2wPhDmfKbtr5TJxS0guBk2zZPLjydhM5A1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AxI93xA8FcqmV9b2YbgELG55eKLVI5ZQ2SOuIitDlpfEY+ve8upwYCjThgJjxLp9lTHj970Y0e846o0AOagI4uOVJKLMpkTuYGJ7+1c6Eb2HhOrB9H3P8H7aYgFtghN2OloIM6OUU3LDhe09sw8NIPJlZL5LL6rryFap5Li1vqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxrcCFfAFq4owIAA--.2959S3;
	Mon, 11 May 2026 14:51:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJAx28GEfAFqAOh+AA--.42931S2;
	Mon, 11 May 2026 14:51:49 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Small enhancement about interrupt injection
Date: Mon, 11 May 2026 14:51:41 +0800
Message-Id: <20260511065146.680650-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx28GEfAFqAOh+AA--.42931S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Here make intterupt status acquire interface simpler, add new interface
kvm_vcpu_sync_intr() to sync pending interrupt to software ESTAT
register, and remove expensive vcpu_load() and vcpu_put() function call.

Also interrupt inject is handled with batch method, rather one by one.

Bibo Mao (5):
  LoongArch: KVM: Check msgint feature in interrupt post
  LoongArch: KVM: Use existing macro about interrupt bit mask
  LoongArch: KVM: Clear interrupt with batch mode
  LoongArch: KVM: Deliver interrupt with batch method
  LoongArch: KVM: Simple interrupt status acquire interface

 arch/loongarch/include/asm/kvm_vcpu.h |  40 +++++---
 arch/loongarch/kvm/interrupt.c        | 140 +++++++++++++-------------
 arch/loongarch/kvm/vcpu.c             |  22 ++--
 3 files changed, 106 insertions(+), 96 deletions(-)


base-commit: 917719c412c48687d4a176965d1fa35320ec457c
-- 
2.39.3

