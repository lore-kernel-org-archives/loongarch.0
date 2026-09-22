Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95C64EFFAC
	for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073590; cv=none; b=Gbtp0TMjU1bmneDQiazyFqsWOJDCXA8axRhI4jGWUJ1m+/rKTVn1Ibx8KgXOFFvaVNvmviWvNa9nL8Q5SjpFGqmbtagnC7XVNsvxoup1VvUMKjlNemhIIMCubkO12b5raiB2c91XKnZBoTRiOfbFS8/ihxAY6TI3bFzkUHZ83X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073590; c=relaxed/simple;
	bh=rQa40uWPapC60ioHBAw/KM6gw3RzpNXJjEMK0MR9cNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6oQdaqZioFk6nPZD70lxb81G8DucF48YAZB3xDLBHUhV92q/PtcE9R5KiaOWKnG0Yd54FgsiA2lVDAGkbgW0qCASpErZHMI1pkZceYjkB8y6JokzgkwsApdH4Wyoun6I08Bdv85jLBm4JjlcRiHpy+L3kNExTlClnnGBShgvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lou2fjtW; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lou2fjtW"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so3301202b3a.0
        for <loongarch@lists.linux.dev>; Tue, 22 Sep 2026 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790073588; x=1790678388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=II0vtlBLX3teC8UAtU2N6RuSR3r58GGPZ14MkNA6Dmw=;
        b=Lou2fjtWKmWw9KN6SVRaLpDzozvli/csEd9l6Zx3rceyMTxw9cuZM/SQ6jhtBZ7Uyq
         yw+v0vbkIcWnGTAk5nZF3CcQHEIZndWAyJMS8Sz7ztf8ONRs5S1rb6hctjlx9Q9mTpnn
         vUyaNiGJuW0GHOUu5Ov0mEG0N0d2aa+bx3VlbZtULR/bkUyUU44IS+x6Jk6jbydMHYUj
         sxKl+cQOjt7XPsmrHcQSmNgVy5DnkCpJshO8Hjx3bntiZ7niC5r55JwothepFOkw85ib
         AoaKfTn65jiAx2imJ+9rgHs/CE3leq+xAuJR66d1/QaBU8rVas/u7TBZ7+VTt4tEQUgP
         PtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073588; x=1790678388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=II0vtlBLX3teC8UAtU2N6RuSR3r58GGPZ14MkNA6Dmw=;
        b=bYdtPPtveZU3cp3vQ46O6ogh2iLBXwKD3Ynbarkd5uNBwgBpCPpCZxjOaeByn16D0U
         hoZmyTculs2NOlLUpNUFYalWtSX3Vmsa1uZOVbB34+xJDS6F5CKnmfUVB32dn7IvGZb+
         vNLpzSW9mUFA2xx8q2O0K3fRX2PPA7KTrhx9bKAMQgF3cq6nhcrSaxePMwcfQLfmigqM
         6AfS91jzqnQEDWni3Z3buVhLpTj8Y99linKb5WIuXKuj68Pash2dhxnXe1cfCvold5da
         QCrUa1YU/HE2PV3LKr+/ozXF5a+1nD/hwNoK0w38sMEKgj3UKR/tic/lY/dhCRrsalJM
         1Few==
X-Forwarded-Encrypted: i=1; AKwUvByGBDg9JNw9uIdvfOh9GXvDslo5VMlVikfdptIGUikpOSbeWS5XoD54u1g7/XoGYXFiwCWBOSwc2Ps=@lists.linux.dev
X-Gm-Message-State: AFuF++mH79EmO+7O9ZIfG/Vnm1zZv9a31+PPmXEMC/m8EDNK/aLL+D7H
	djArHY6ZiFcYWx4pc9+4ab2u17Dng6CtoimV1Ahi+76i3JUYFfLHPmiA
X-Gm-Gg: AYBFou1Oh2tyhpMKqvTQYADNqiZR7zbbjUSOtbqckfzKWcosTBa9rAh1+tG9Laq6/kh
	1Q4wwW2zkgzQqRegA7OgW6z6rUZyccxOE/XnNXk4BpjOlK4u10ODrZ3rWD0lDLJDvnxmDxEb3B3
	DCvgzpGP4/x18xSo5riJ8oTF5jPBfXuVoRksBrIDymkPcVRgjg5pbPmvhFHmqEJnml9rc0EtB3k
	emr9Sw64pHM3cyALjfjxu7FJbL8t8P1bLoxyRyRNrcKgsQxMVO6ADRlTvgW91RXhONO2ZzvymDi
	/944XPyrhAaAZPo8B6OGqcTK+FtnMRPaqV9wPBZKWE0HnRlsV9+F1uQfjt7jSGBwVqKvble4wok
	Ad3ey54VA3RxPYttSYT4neXn7HPdCs2j0Eq7Jt8mStej9jl00n7fkBHOww0S5MGFD+FNaDaAUBB
	Oqv7y8akvrzsizuisU8HO6lsIYN+NWf84Eulhv9np7LKa3v46TQ2yt0sm0/DC5o6BGDn0dKRTD0
	Eul2HQO+5E=
X-Received: by 2002:a05:6a20:e390:b0:3dd:a006:ed9b with SMTP id adf61e73a8af0-3ddec82345bmr811522637.49.1790073587913;
        Tue, 22 Sep 2026 03:39:47 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61271695sm4397515eec.8.2026.09.22.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:39:47 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Xianglai Li <lixianglai@loongson.cn>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH] LoongArch: KVM: Return the actual error code in kvm_ipi_create()
Date: Tue, 22 Sep 2026 10:39:31 +0000
Message-ID: <20260922103931.215091-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_ipi_create() registers the IPI device on the IOCSR bus and jumps to
the error label when that fails. The error path then discards the error
code that kvm_io_bus_register_dev() reported and returns -EFAULT
instead:

	ret = kvm_io_bus_register_dev(kvm, KVM_IOCSR_BUS, IOCSR_IPI_BASE,
				      IOCSR_IPI_SIZE, device);
	mutex_unlock(&kvm->slots_lock);
	if (ret < 0) {
		kvm_pr_unimpl("%s: Initialize IOCSR dev failed, ret = %d\n",
			      __func__, ret);
		goto err;
	}
	...
err:
	kfree(s);
	return -EFAULT;

kvm_io_bus_register_dev() fails with -ENOMEM or -ENOSPC, so userspace
creating a KVM_DEV_TYPE_LOONGARCH_IPI device is told that it passed a
bad address when the real problem is that the host is out of memory or
out of IOCSR bus slots. -EFAULT is reserved for faulting user addresses,
and the remaining -EFAULT returns in this file are get_user() failures,
where it is correct.

Return ret instead. It is guaranteed to hold a valid negative errno
because the ret < 0 branch above is the only path that reaches the error
label. This also matches kvm_eiointc_create(), which already propagates
the kvm_io_bus_register_dev() error code unchanged.

Only compile-tested; the fix is a straight propagation of an error code
that the adjacent kvm_pr_unimpl() already logs.

Fixes: c532de5a67a7 ("LoongArch: KVM: Add IPI device support")
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
 arch/loongarch/kvm/intc/ipi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index 7b333a4a0430..672ec053a997 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -431,7 +431,7 @@ static int kvm_ipi_create(struct kvm_device *dev, u32 type)
 
 err:
 	kfree(s);
-	return -EFAULT;
+	return ret;
 }
 
 static void kvm_ipi_destroy(struct kvm_device *dev)
-- 
2.43.0

