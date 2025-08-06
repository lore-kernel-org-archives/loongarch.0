Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE281EEA49
	for <loongarch@lists.linux.dev>; Wed,  6 Aug 2025 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754470853; cv=none; b=FZaSlZEO6U1o3zQvoH+4boygjUubSWrhc84WATh3D9tR8kJKG4ogkUGUeAN/Tn7f/jaL0iGqbcG1fnjwUBAz7fKWIkrso/ccRRz5WMgB0dJPHReKPGLoO6o9ltqseaS1iVoKh84I5fm4UA/ixVX9ItFJy2Pr3ifT3yW75YhVqHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754470853; c=relaxed/simple;
	bh=/FgFlt8jBzOj9pL/KMy4IHiZ0hzvDR5d2QsMUFOflyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N/gg8nh2UPAhrYP+4/J9XAb1LYV1x+MMJPv1ZgpifKSkzLydF3H5dD1HUAAWISh/islfmU1hPywWvNtXR80tEH/8HXQZ55hReMnrIRM2fNBMuJGoTviIvhpp8JoQr8C1mLf7hK2pAw8KyP88JZXEKF3aPb8DhNddSRGhyUXyiSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxnOK_GZNogZs5AQ--.12573S3;
	Wed, 06 Aug 2025 17:00:47 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJBxzsG+GZNoe6k4AA--.54411S2;
	Wed, 06 Aug 2025 17:00:47 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] LoongArch: KVM: Small enhancements about IPI and
Date: Wed,  6 Aug 2025 17:00:43 +0800
Message-Id: <20250806090046.2028785-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxzsG+GZNoe6k4AA--.54411S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Thre are some small enhancement about IPI emulation and LBT enabling in
LoongArch KVM. With IPI, it supports sending command to vCPU itself. And
with LBT it adds flag checking int function kvm_own_lbt() and make it
robust.

Bibo Mao (3):
  LoongArch: KVM: Access mailbox directly in mail_send()
  LoongArch: KVM: Add implementation with IOCSR_IPI_SET
  LoongArch: KVM: Make function kvm_own_lbt() robust

 arch/loongarch/kvm/intc/ipi.c | 51 ++++++++++++++++++++++-------------
 arch/loongarch/kvm/vcpu.c     |  8 +++---
 2 files changed, 38 insertions(+), 21 deletions(-)


base-commit: 7e161a991ea71e6ec526abc8f40c6852ebe3d946
-- 
2.39.3

