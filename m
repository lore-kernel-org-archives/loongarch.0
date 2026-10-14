Received: from mta0.migadu.com (out-18.mta0.migadu.com [91.218.175.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42C3BB9FD
	for <loongarch@lists.linux.dev>; Wed, 14 Oct 2026 05:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791955798; cv=none; b=bSlaC5nSs9CR2cZ68sUoRuaodW9aq7EFXyQ3LZvIuwMn232cJ4TZ0YR2hWn81Wm72Gkn0N2Yb2jWzjYqs+IkdNccbalIlqOSb2SgsWaZ+KiOwyiFeSAAVJRzliYc5+lg3AHaSqcB2qfY6k8XVcyW0UnXtP+FXbj8zcdP2aU/Zkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791955798; c=relaxed/simple;
	bh=I6GevRfZSa/tBRJ0bxh7IY4+EECM+sywyrGAPuUESfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hqd+e2vzOCUYna6nWWnmDv0vURrZ9DZ4LsEEFZ4Nner8Z2lJr7RkWWXNDkWpWx2OZi/TDvYF0SR+KSyMRsl40nDap4Fd3v1l5clJbhnnXkE2U/TSQOMSPfhtfU9gOBfUHCVtqjF9YC3eGh+OW4nQAbqniv6hlIoPlWiAXezeQ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AAZxUJPt; arc=none smtp.client-ip=91.218.175.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AAZxUJPt"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=I6GevRfZSa/tBRJ0bxh7IY4+EECM+sywyrGAPuUESfY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791955792; v=1; x=1792560592;
 b=AAZxUJPtGvTUunmUJ3dpfXx9Nw8mNeumKN1+CYRDXMI55Pa1wxnmFvyAIuAegd8KWZOnGnzk
 gRuy9lzARnx7sAycEok/wWa43F2NnLC+1JlhwWFlBYGyxEYoUfRlZSRABQM24mLHiH18Lq4QD0a
 s3Yp0XMOCMBOzjYSgDQn9MF0=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 69abde7a0bbf387e;
	Wed, 14 Oct 2026 05:29:52 +0000
X-Mizu-Trace-ID: 69abde7a0bbf387e
X-Migadu-Flow: FLOW_OUT
From: Tao Cui <cui.tao@linux.dev>
To: chenhuacai@kernel.org,
	maobibo@loongson.cn,
	gaosong@loongson.cn,
	zhaotianrui@loongson.cn
Cc: loongarch@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@xen0n.name,
	nagachaithanya9911@gmail.com,
	cui.tao@linux.dev,
	lihongfu <lihongfu@kylinos.cn>
Subject: [PATCH v3 0/3] LoongArch: KVM: irqchip fixes
Date: Wed, 14 Oct 2026 13:29:30 +0800
Message-ID: <20261014052933.723303-1-cui.tao@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lihongfu <lihongfu@kylinos.cn>

Hi,

Three fixes for the LoongArch KVM irqchip code:

- Patch 1 clears the device pointer in the destroy callbacks: when
  KVM_CREATE_DEVICE succeeds but the following fd allocation fails
  (e.g. under RLIMIT_NOFILE), ops->destroy() frees the irqchip while
  kvm->arch.* still points to it.

- Patch 2 aligns kvm_pch_pic_create() with kvm_eiointc_create() by
  propagating the real error code; the kvm_ipi_create() counterpart is
  being fixed separately (Chaithanya Lagisetty).

- Patch 3 rejects repeated PCH-PIC CTRL_INIT with -EEXIST, using the
  initialized state of the kvm_io_device as the indicator; the MMIO
  base is only committed after a successful bus registration.

All patches carry Fixes tags.

Changes in v3:

- Drop "Load dmsintc pointer once in pch_msi_set_irq" (v2 patch 2),
  suggested by Bibo and Huacai.

- Patch 3 (v2 patch 4): reject repeated CTRL_INIT by checking the
  kvm_io_device state instead of a separate has_init flag, also
  suggested by Huacai; the check stays under slots_lock.

Changes in v2:

- Drop "Guard against NULL irqchip in irq injection" (v1 patch 2) and
  "Rebase steal time counter in vcpu context" (v1 patch 4) after
  review discussion: their trigger scenarios are not reachable
  through real VMM behaviour.

- Use the one-line destroy style in dmsintc suggested by Bibo.

- Track repeated PCH-PIC CTRL_INIT with a has_init flag and return
  -EEXIST instead of -EBUSY, also suggested by Bibo; move the check
  and base update under slots_lock so they are atomic.

Tao Cui (3):
  LoongArch: KVM: Clear device pointer in irqchip destroy callbacks
  LoongArch: KVM: Propagate real error code in kvm_pch_pic_create
  LoongArch: KVM: Reject repeated PCH-PIC CTRL_INIT

 arch/loongarch/kvm/intc/dmsintc.c |  1 +
 arch/loongarch/kvm/intc/eiointc.c |  1 +
 arch/loongarch/kvm/intc/ipi.c     |  1 +
 arch/loongarch/kvm/intc/pch_pic.c | 15 +++++++++++----
 4 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.43.0

