Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653FD41D635
	for <loongarch@lists.linux.dev>; Thu, 24 Sep 2026 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232669; cv=none; b=c4wmO17sIlGIqj/FRBY8tHMZq2HE5evbEDLOslXhTnN0Q7LntLoOuQzn1Sx//MBvs2XtyKIgeX+1ERi9USLRBuvJGh/F+lUatxSNz2Q3s+DQP9QYdSv7S6f+U1yqVU7g5hud6BR0ySlLqwkkxMMKziBIjBtJnGO3lYzRfSwq4k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232669; c=relaxed/simple;
	bh=7gtAjeQO6yIyWja//vqyKW5Dj1OTWnZFxdHPJXFRCFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSQOMlHAhSxoTEzBEufS8oiwhjZ5PI2aOdqpdYiq016X/Bvb23l3qkkO6j39dFbGO5grKePzLojxhHmvR8uhLZ+6s4nyYEbBPhMi3BvoC7IR4m3T3ukOZyPlg5L46Mrbty78p6kric60n39eD8mLM7avboY+pwQNgfOy5Io4UCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZIUfh0k; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZIUfh0k"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso2024692eec.1
        for <loongarch@lists.linux.dev>; Wed, 23 Sep 2026 23:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232661; x=1790837461; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eyc6vxDzox4W8LdaVh1hfDPXOLyn2U/fTkEKcGp+Tno=;
        b=jZIUfh0kMCUNfDTocwh0a1Z9/0ihwWhu18GHYeJ4yXkxYU74cTAPmRsPfv1N4JHb34
         vkRDXRbUjSkLfLdzt1nzt9gexxwppAZoCovaA5ugaViW+m9MEXMmUwIo7/+AYYXFbeQs
         +6DEczWJ1V47CF9Z9m0nsT+1clpUeJXvKG6/ZJWmBx8aw479JC+lVxqZ5IpqxzXjSbEx
         /Ib43kMKETPsVrvG1cHEM2mRvcYW6TjyOrh5PFTuOiK+n10jZYgOUL02uTDZmEp5FFWr
         iC2z6mKrXeprRdyhIsKj0gXI6qyCX+N44AuOmxUEfsoToNiFViDqLzv2MXwKWUP6p1vA
         TM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232661; x=1790837461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eyc6vxDzox4W8LdaVh1hfDPXOLyn2U/fTkEKcGp+Tno=;
        b=2zblX+mOWJmish4L8A4RRB4Ru2Y4QMkxE1RFeAUN6mxWfSD/ccqMF3n1QyMSFExo2w
         yXXX3zpBV8ETZ0EInGutg8sEjhlmZ30I1WjJn8Y9Lz72PoLC3l6A7SnfoTHGdt3hg0sV
         h1n/Yvjn4l1GQMyMKwFuH0nZj9gQbchzInJfICIxZgJKg3AuZmtdJQAKy5ArdzTfmOZ0
         ZRphoNOkmU2IHCl+f+2uq8Kbq6l2j8+fvgIADLPFqmV55msHeHg6QwOs9+Sv0690cq2f
         PWrdPf7QVPm8mLtRQDh0q/t/vGUObkdInv5V5ic394MrqKeylJuZbV0CyoKBR69aKru3
         iFHw==
X-Forwarded-Encrypted: i=1; AKwUvBxXYoCARFWn2q+iy5PsF5I/qVZ35xVwFfnlDIkjQsTyoy/sBeOyV/yEJCc5lI4Ei5KpjJqEoJFTNSc=@lists.linux.dev
X-Gm-Message-State: AFuF++lodwJCU/2AuKfAQx3QYuycfp0ori8Yl46PGDHSd1KIBkVzphpb
	OSxXaet+2ifuEmVxsgR2lARTD2FC/xXG/PkqjSZMxEKLFlmbmD6bzX4V
X-Gm-Gg: AYBFou3U3No+KwiU2fRC8Vjq9uNaGg86b94tweGeGkr8RvEIUa1v9UhvNHGJriTHc5I
	dv1jzDT76WvbrirxsrKQRG6QGx/ooElb/FVhLkvBt6UijPg0R95Vha6yYjdNySvS997d1tSWtFX
	SvzuHgNlIFSfNE7xcSxVaAMGtpkq8UMKM4quY3dNSFLOoM1FeCRlv6Zk6iDYCvx6nw3a2yKCrZ6
	8dE5gNfXsRuxFS/qW3nBMVK2qdT3wAbzt8e6T01Pv4OZKgG850nX8kzR2G1FeutcYc1ihvCevTj
	D00qeZTWKxKbthPYisOKJVZdtvkJDzniJ1YLZ/DT3mAGuuI6N4Qq4pYJfsG1AdH+wXDm5Qw787/
	YR6KLe1/8jFOLC9kNAVpS+7DSk6dDeMSA0Xq8LBvHFkpkAPOMYI5V5dOEPjXfWxb8IPjX02pWgn
	eVKw4+M3fx6AE6TRfpPyJDyayaCKbea6XoFmBntPsTCtA1j0vCUfXsNLdCBcHN+4NbNr7DR4aE/
	6Z2kHGLeGQ=
X-Received: by 2002:a05:7022:309:b0:143:7821:e151 with SMTP id a92af1059eb24-145040427dbmr1873170c88.47.1790232659113;
        Wed, 23 Sep 2026 23:50:59 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm18497821c88.7.2026.09.23.23.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:50:58 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Xianglai Li <lixianglai@loongson.cn>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: [PATCH v2] LoongArch: KVM: Return the actual error code in kvm_ipi_create()
Date: Thu, 24 Sep 2026 06:50:33 +0000
Message-ID: <20260924065033.374786-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922103931.215091-1-nagachaithanya9911@gmail.com>
References: <20260922103931.215091-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvm_ipi_create() registers the IPI device on the IOCSR bus. The error
path currently discards the error code returned by
kvm_io_bus_register_dev() and returns -EFAULT instead:

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

Free the IPI state and propagate the error directly after cleanup. The
error label had a single user, so handling the failure in place removes
the label as well. This matches kvm_eiointc_create(), which already frees
its state and propagates the kvm_io_bus_register_dev() error code
unchanged.

Only compile-tested.

Fixes: c532de5a67a7 ("LoongArch: KVM: Add IPI device support")
Suggested-by: Huacai Chen <chenhuacai@kernel.org>
Assisted-by: Cursor:claude-opus-5
Signed-off-by: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
---
v2:
 - Handle the failure in place and drop the now unused err label instead
   of only correcting the returned value (Huacai Chen).
 - Reworded the commit message accordingly.
 - Dropped Bibo Mao's Reviewed-by from v1, as the error path is
   restructured in this version rather than only returning ret.

Link to v1:
https://lore.kernel.org/all/20260922103931.215091-1-nagachaithanya9911@gmail.com/

 arch/loongarch/kvm/intc/ipi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kvm/intc/ipi.c b/arch/loongarch/kvm/intc/ipi.c
index 7b333a4a0430..80faa770c0cd 100644
--- a/arch/loongarch/kvm/intc/ipi.c
+++ b/arch/loongarch/kvm/intc/ipi.c
@@ -423,15 +423,12 @@ static int kvm_ipi_create(struct kvm_device *dev, u32 type)
 	mutex_unlock(&kvm->slots_lock);
 	if (ret < 0) {
 		kvm_pr_unimpl("%s: Initialize IOCSR dev failed, ret = %d\n", __func__, ret);
-		goto err;
+		kfree(s);
+		return ret;
 	}
 
 	kvm->arch.ipi = s;
 	return 0;
-
-err:
-	kfree(s);
-	return -EFAULT;
 }
 
 static void kvm_ipi_destroy(struct kvm_device *dev)
-- 
2.43.0

