Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BE32853E0
	for <loongarch@lists.linux.dev>; Fri, 24 Oct 2025 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290413; cv=none; b=aPNPq9E5I1jwzxdaVE+uqRKG8X8anbpCxgpAow/DRHjIW4hk4yCORmWpD7yp3thuskheQLZeq9qOfi0t1AlNH7MDHsTrhGAeIgkDBMe5hibMqEGgOqVmNWKY0yxHA90pnS7Ce5GmdeXYgSb7fh+2gzEOFIanv0YyLAZLdy7xgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290413; c=relaxed/simple;
	bh=7mCbYGEEVFMwYTnGEEULYeaOyefdGFNf3O7Bw3UT1UI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pRQYIdb3I1UVc/beO6sMk6p3g3m2RmRBsmzue3A76XFeRJ8ba2SbADEzHrM8QeSSek3iPnpcKeya60IqaWNyTVtrvOCENo7vKx8ypHkdrFMe58ukqAcVJdM+w6dD21VpHTSIY+LozNzJrLtXu4b4XhsdDG2DA+iPNqSxE8xYXOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8DxLvCiKPtoxxUaAA--.56236S3;
	Fri, 24 Oct 2025 15:20:02 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowJCxocKiKPtojj4GAQ--.47710S2;
	Fri, 24 Oct 2025 15:20:02 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Xianglai Li <lixianglai@loongson.cn>,
	Song Gao <gaosong@loongson.cn>
Cc: kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] LoongArch: KVM: Restore guest PMU if it is enabled
Date: Fri, 24 Oct 2025 15:19:59 +0800
Message-Id: <20251024072001.3164600-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxocKiKPtojj4GAQ--.47710S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

On LoongArch system, guest PMU hardware is shared by guest and host
and PMU interrupt is separated. PMU is pass-through to VM, and there is
PMU context switch when exit to host and return to guest.

There is optimiation to check whether PMU is enabled by guest. If not,
it is not necessary to return to guest. However it is enabled, PMU
context for guest need switch on. Now KVM_REQ_PMU notification is set
on vcpu context switch, however it is missing if there is no vcpu context
switch and PMU is used by guest VM.

Also there is code cleanup about PMU checking on vCPU sched-on callback,
since it is already checked on VM exit entry or VM PMU CSR access abort
routine.

Bibo Mao (2):
  LoongArch: KVM: Restore guest PMU if it is enabled
  LoongArch: KVM: Skip PMU checking on vCPU context switch

 arch/loongarch/kvm/vcpu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)


base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
-- 
2.39.3

